const router = require('express').Router();
const controller = require('../controllers/authentication/auth.controller')

// SignIn
router.post('/signin', controller.signin);
// SignUp
router.post('/signup',controller.signup);
// Refresh Token
router.post('/refresh_token', controller.refreshToken);


module.exports = router;