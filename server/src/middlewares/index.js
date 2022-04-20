const verifySignUp = require('./verify_signup.middleware');
const authJWT = require('./auth_jwt.middleware');

module.exports = {
    verifySignUp,
    authJWT
}