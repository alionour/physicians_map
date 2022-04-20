const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const {authConfig} = require('../../config');
const {jwtExpiration} = require('../../config').authConfig.jwtExpiration;
const db = require('../../models');
const User = db.user
const Role = db.role


exports.signin = (req,res)=>{
    console.info('Signin');
    let args = req.body;
    User.findOne(
        {
        username:args.username
        },
    ).populate('roles',"__v").exec((err,user)=>{

        if(err){
            console.info(err);
            return res.status(500).send({message:err})
        }

        if(!user){
            return res.status(401).send({message:"User Not Found !!"})
        }

        var passwordIsValid = bcrypt.compareSync(
            args.password,user.hash
        )

        if(!passwordIsValid){
            return res.status(401).send({
                accessToken:null,
                message:"Invalid Password"
            })
        }
        var token = jwt.sign({id:user._id},authConfig.secret,{expiresIn:86400});
        var authorities = [];
        for(let i = 0 ; i <= user.roles.length;i++){
            console.log(user.roles) 
            console.log(user.roles[i])
            Role.findById(user.roles[i]?._id ,(err,role)=>{
                if(err){ 
                    console.info(err);
                    return res.status(500).send({message:err})
                }
                authorities.push("ROLE_"+role?.name?.toUpperCase());
            })
            // console.log(authorities);
        }

        res.status(200).send(
            {
                id:user._id,
                username:user.username,
                firstName:user.first_name,
                middleName:user.midlle_name,
                lastName:user.last_name,
                email:user.email,
                joinedAt:user.createdAt,
                roles:authorities,
                accessToken:token
            }
        )
    })
}