const {Schema,Types,model} = require('mongoose');


const postSchema = Schema(
    {
        title: {
            type:String,
            maxLength:50,
        },
        content: {
            type:String,
            required:true,
            maxLength:1000
        },
        comments:[
            {
                author: {
                    type:Types.ObjectId,
                    ref:'User',
                    required:true
                },
                content:{
                    type:String,
                    maxLength:300,
                },
                createdAt:{
                    type:Date,
                },
                updatedAt:{
                    type:Date,
                }
            }
        ],
        likes:[
            {
                author: {
                    type:Types.ObjectId,
                    ref:'User',
                    required:true
                },
                createdAt:{
                    type:Date
                },
                
            }
        ],
        images:[
            {
                _id:{type:Types.ObjectId},
                path:{type:String}
            }
        ],
        author: {
            type:Types.ObjectId,
            ref:'User',
            required:true
        },
    },
    {
        timestamps:true
    }
);

let Post = model('Post',postSchema,'posts');
module.exports = Post
