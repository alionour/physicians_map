const dbConfig = require('../config/db.config');
const db = require('../models')
const Role = db.role

db.mongoose.connect(`mongodb://${dbConfig.HOST}:${dbConfig.PORT}/${dbConfig.DB}`, {
    connectTimeoutMS: 1000,
    useNewUrlParser:true,
    useUnifiedTopology:true
    // Note that mongoose will **not** pull `bufferCommands` from the query string
  }, 
  function(error) {
      // Check error in initial connection. There is no 2nd param to the callback.
      if(error){
          console.error('Connection Error:',error);
      }else{
          console.log('Connected to db successfully');initial();
      } 
});

function initial() {
  Role.estimatedDocumentCount((err,count)=>{
    if(!err&&count===0){
        new Role(
          {
            name:'user'
          }
        ).save(err=>{
          if(err){
            console.error('Error:',error);
          }else{
              console.log('Role Added');
          } 
        });
        new Role(
          {
            name:'admin'
          }
        ).save(err=>{
          if(err){
            console.error('Error:',error);
          }else{
              console.log('Role Added');
          } 
        })
        new Role(
          { 
            name:'moderator'
          }
        ).save(err=>{
          if(err){
            console.error('Error:',error);
          }else{
              console.log('Role Added');
          }
        })
    }
  });
}