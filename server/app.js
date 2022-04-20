const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.port || 8080;


// CORS 
var corsOptions ={
origin:'http://localhost:8081'
};
app.use(cors(corsOptions));
// REQUEST PARSER
app.use(express.json());
app.use(express.urlencoded({extended: true}))


// DATABASE CONNECTION
require('./src/connection/database.connection')

// ROUTER
var router = require('./src/routes');
app.use('/',router);

// EJS
app.set('views','./src/viewsv')
app.set('view engine', 'ejs')


// Static
app.use(express.static('./src/public'))
app.use(express.static('./node_modules'))

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`)
  })