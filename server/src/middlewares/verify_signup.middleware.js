const db = require('../models')
const ROLES = db.roleS
const User =  db.user

checkDuplicateUsernameOrEmail = (req,res,next)=>{
    // checking username
    User.findOne({
        username:req.body.username
    }).exec((err,user)=>{
        if(err){
            res.status(500).send({message:err});
            return;
        }
        if(user){
            res.status(400).send({message:'Username already in use'});
            return;
        }
    })

    // checking email
    User.findOne({
        email:req.body.username
    }).exec((err,user)=>{
        if(err){
            res.status(500).send({message:err});
            return;
        }
        if(user){
            res.status(400).send({message:'Email already in use'});
            return;
        }
    })


    next();

}




checkRolesExisted = (req,res,next)=>{
    if(req.body.roles){
        for(let i = 0 ; i < req.body.roles.length ; i++){
            if(!ROLES.includes(req.body.roles[i])){
                res.status(400).send({message:`Role ${req.body.roles[i]} does not exist`});
                return;
            }
        }
    }
    next();
}


const verifySignUp =  {
checkDuplicateUsernameOrEmail,
checkRolesExisted
}

module.exports = verifySignUp