const db = require('../../models')
const Post =db.post
exports.getPosts = (req,res)=>{
    Post.find({},(err,posts)=>{
        console.log(posts);
        res.json(posts);
    });
    
}