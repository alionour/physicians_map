const bcrypt = require('bcrypt');
const db = require('../../models');
const User = db.user
const Role = db.role


exports.signup = (req,res)=>{
    let args = req.body;
    console.log(args);
    const user = User({
        first_name:args.firstName,
        middle_name:args.middleName,
        last_name:args.lastName,
        image_path:args.image_path,
        username:args.username,
        email:args.email,
        hash: bcrypt.hashSync(args.password,5)
    });
    user.save((err,user)=>{
        if(err){
            console.log(err.name);
            console.log(err);
            if(err.name === "ValidationError"){
                let errors = {}
                Object.keys(err.errors).forEach((errorKey)=>{
                    errors[errorKey] = err.errors[errorKey].message;
                });
                return res.status(422).send(errors)
            }
            return res.status(500).send({message:"Something went wrong"})
        }
        if(args.roles){ 
            Role.find(
                {
                    name:{
                        $in:args.roles
                    }
                
                },
                (err,roles)=>{ 
                    if(err){
                        return res.status(500).send({message:err});
                    }
                    user.roles = roles.map(role=>role_id);
                    user.save((err,user)=>{
                        if(err){
                            console.error('Error:',err)
                            return res.status(500).send({message:err})
                        }
                    return res.status(200).send({message:'User was registered succesfully'});
                });
                }
            );
        }else{
            Role.findOne({name:"user"},(err,role)=> {
                if(err){
                    return res.status(500).send({message:err})
                }
                user.roles = [role._id]
                    user.save((err,user)=>{
                        if(err){
                            return res.status(500).send({message:err})
                        }
                    return res.status(200).send({message:'User was registered succesfully'});
                });
            })
        }
    });
}