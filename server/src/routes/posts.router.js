const router = require('express').Router();
const controller = require('../controllers/authentication/posts.controller');
const createPostController = require('../controllers/authentication/create_post.controller');


router.get('/',controller.getPosts);
router.post('/create_post',createPostController.createPost);

module.exports = router;
