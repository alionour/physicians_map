const jwt = require('jsonwebtoken');
const secret = require('../config/auth.config').secret
const db = require('../models')
const User = db.user;
const Role = db.role
const { TokenExpiredError } = jwt;


verifyToken = (req,res,next)=>{
    const token = req.headers['x-access-token'];
    // const token = req.body.token || req.query.token || req.headers["x-access-token"];
    if(!token){
        return res.status(403).send({message:"A token is required for authentication."});
    }
    jwt.verify(token,secret,(err,decoded)=>{
        if(err){
            return res.status(401).send({message:"Unauthorized"});
        }
        req.userId = decoded.id;
        next();
    })

}

const catchError = (err, res) => {
    if (err instanceof TokenExpiredError) {
      return res.status(401).send({ message: "Unauthorized! Access Token was expired!" });
    }
  
    return res.sendStatus(401).send({ message: "Unauthorized!" });
  }
  
isAdmin = (req,res,next)=>{
    let userId = req.userId;
    User.findById(userId).exec((err,user)=>{
        if(err){
           return res.status(500).send({message:err});
        }

        Role.find({_id:{$in:user.roles}},
                (err,roles)=>{
                    if(err){
                    return  res.status(500).send({message:err});
                    }

                    for (let i = 0 ;i< roles.length;i++){
                        if(roles[i].name == "admin"){
                            next();
                            return;
                        }
                    }

                    res.status(403).send({message:"Admin Role Required"});
                    return;
                }
        )
    })
}



isModerator = (req,res,next)=>{
    let userId = req.userId;
    User.findById(userId).exec((err,user)=>{
        if(err){
           return res.status(500).send({message:err});
        }

        Role.find({_id:{$in:user.roles}},
                (err,roles)=>{
                    if(err){
                    return  res.status(500).send({message:err});
                    }

                    for (let i = 0 ;i< roles.length;i++){
                        if(roles[i].name == "moderator"){
                            next();
                            return;
                        }
                    }

                    res.status(403).send({message:"Moderator Role Required"});
                    return;
                }
        )
    })
}


const authJWT = {
    verifyToken ,
    isAdmin ,
    isModerator
}

module.exports = authJWT;