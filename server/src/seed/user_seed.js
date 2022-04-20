const db = require('../connection/database.connection')
const User = require('../models/user.model')

let newUser = User({
    first_name:"Ali11",
    created_at:Date.now()
});

newUser.save((error)=>{
    if(error){
        console.log(error)
    }else{
        console.log('Added Successfully')
    }
})