
const  authJwt  = require("../middlewares");
const controller = require("../controllers/authentication/auth.controller");
const express = require('express');
const router = express.Router();


module.exports = function() {
  router.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  router.get("/all", controller.allAccess);

  router.get("/user", [authJwt.authJWT.verifyToken], controller.userBoard);

  router.get(
    "/mod",
    [authJwt.authJWT.verifyToken, authJwt.authJWT.isModerator],
    controller.moderatorBoard
  );

  router.get(
    "/admin",
    [authJwt.authJWT.verifyToken, authJwt.authJWT.isAdmin],
    controller.adminBoard
  );
};