const db = require('../../models')
const Post = db.post


exports.createPost = (req,res)=> {
    let args = req.body;
    console.log(args)
    const newPost = Post({
        title:args.title,
        content:args.content,
        author:args.author
    });
    newPost.save((err,post)=>{
        if(err){
            console.log(err.name);
            console.log(err);
            return res.status(500).send("Something went wrong")
        }
        return res.status(200).send("Added Successfully")

    });
}