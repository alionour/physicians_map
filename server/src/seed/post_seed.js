const db = require('../connection/database.connection')
const Post = require('../models/post.model')
const faker = require('faker');
const mongoose = require('mongoose');
let newPost = Post({
    title:faker.lorem.sentence(5),
    content:faker.lorem.paragraph(5),
    author: mongoose.Types.ObjectId("61a2285abe2766b4cdd9537c")
});

newPost.save((error)=>{
    if(error){
        console.log(error)
    }else{
        console.log('Added Successfully')
    }
})