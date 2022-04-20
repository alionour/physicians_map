const {signin} = require('./signin.controller')
const {signup} = require('./signup.controller')
const {refreshToken} = require('./refresh_token.controller')
const allAccess = (req, res) => {
    // res.send('Public Content');
    // res.end();
    return res.status(200).send("Public Content.");
  };
  
  const userBoard = (req, res) => {
res.status(200).send("User Content.");
};
  
const adminBoard = (req, res) => {
res.status(200).send("Admin Content.");
};

const moderatorBoard = (req, res) => {
res.status(200).send("Moderator Content.");
};

module.exports = {
    signin , signup,moderatorBoard,allAccess,adminBoard,userBoard,refreshToken 
}
