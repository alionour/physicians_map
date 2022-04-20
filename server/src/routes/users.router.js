const express = require('express');
const router = express.Router();
const db = require('../models')
var ObjectId = require('mongodb').ObjectId

// Models
const User = db.user;
const Role = db.role;

// Routes
router.get('/', function (req, res) {
    User.find({},(err,users)=>{
        // res.json(users);
        let chunk = [];
        let chunkSize= 3;
        for (let i = 0; i < users.length; i+=chunkSize) {
          chunk.push(users.slice(i,chunkSize+i));
        }
        // res.json(chunk);
        res.render('../views/users/users.ejs',{
            chunk:chunk
        })
    });

    // res.render('users/users')
});


// USER DETAILS
router.get('/user/:id', function (req, res) {
    // var query =  mongoose.Types.ObjectId(req.params.id);
    // console.log(query)
    console.log(req.params.id)
    User.findById(ObjectId(req.params.id),(err,data)=>{
            console.log(data)
            // User.findOne(query,(err,userDetails)=>{
        // res.json(data);
        if(!err){
            res.render('../views/users/user_details.ejs',{
                user:data
            })
        }else {
            console.log(err)
        }
        
    });

    // res.render('users/users')
});

// EDIT USER DETAILS
router.get('/edit/:id', function (req, res) {
    const id = req.params.id;
    User.findById(id,(err,userDetails)=>{
        // res.json(userDetails);
        if(!err){
            res.render('../views/users/edit_user.ejs',{
                user:userDetails
            })
        }else{
            console.log(err)
        }
        
       
    });

    // res.render('users/users')
});

var createUser = require('../queries/createUser');
router.post('/create_user', function (req, res) {
    console.log(req.body.firstName);
    // res.write(req.body);
    createUser(req.body)
    res.end();
    // res.json(req.body);
    // res.render('users/create_user.ejs')
});
module.exports = router;