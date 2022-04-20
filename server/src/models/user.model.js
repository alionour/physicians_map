const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');
const crypto = require('crypto');
const jwt = require('jsonwebtoken');
// const secret = require('../config').secret;
const userSchema = mongoose.Schema(
    {
        first_name: {
            type:String,
            required:true,
            maxLength:50,
        },
        middle_name:{
            type:String,
            maxLength:50,
        },
        last_name:{
            type:String,
            required:true,
            maxLength:50,
        },
        username:{
            type:String,
            lowercase:true,
            required:true,
            match: /^[a-zA-Z0-9]+$/,
            index:true,
            unique:true
        },
        email:{
            type:String,
            lowercase:true,
            required:true,
            match: /\S+@\S+\.\S+/,
            index:true,
            unique:true
        },
        image_path:String,
        hash:String,
        roles: [
            {
              type: mongoose.Schema.Types.ObjectId,
              ref: "Role"
            }
          ]
    },
    {
        timestamps:true
    }
)
let User = mongoose.model('User',userSchema,'users');
userSchema.plugin(uniqueValidator, {message: 'Is already taken.'});
// userSchema.methods.setPassword = function(password){
//       this.salt = crypto.randomBytes(16).toString('hex');
//       this.hash = crypto.pbkdf2Sync(password, this.salt, 10000, 512, 'sha512').toString('hex');
// };
// userSchema.methods.validPassword = function(password) {
//      var hash = crypto.pbkdf2Sync(password, this.salt, 10000, 512, 'sha512').toString('hex');
//      return this.hash === hash;
// };
// userSchema.methods.generateJWT = function() {
//   var today = new Date();
//   var exp = new Date(today);
//   exp.setDate(today.getDate() + 60);

//   return jwt.sign({
//     id: this._id,
//     username: this.username,
//     exp: parseInt(exp.getTime() / 1000),
//   }, secret);
// };


userSchema.methods.toAuthJSON = function(){
      return {
        username: this.username,
        email: this.email,
        token: this.generateJWT(),
        bio: this.bio,
        image: this.image
      };
    };
module.exports = User