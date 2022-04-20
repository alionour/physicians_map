const router = require('express').Router();
const userRoutes = require('./users.router');
const authRoutes = require('./authentication.router');
const postsRoutes = require('./posts.router');
const testRoutes = require('./test.router');

router.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });
router.get('/', (req, res) => {
    res.render('../views/home/index.ejs')
    //   res.status(200).json({ message: 'Connected!' });
});

router.get('/physicians', function (req, res) {
    res.send('Physicians');
});
router.use('/users',userRoutes)
router.use('/auth',authRoutes)
router.use('/posts',postsRoutes)
router.use('/test',testRoutes)
module.exports = router;