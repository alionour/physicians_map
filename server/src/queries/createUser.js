require('../connection/database.connection')
const User = require('../models/user.model')


function createUser(args) {
    let newUser = User({
        first_name:args.firstName,
        last_name:args.lastName,
        created_at:Date.now()
    });
    newUser.save((error)=>{
        if(error){
            console.log(error)
        }else{ 
            console.log('Added Successfully')
        }
    })
}

module.exports = createUser;