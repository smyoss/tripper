"use strict";
module.exports = function(app) {
  var user = require("../controller/userController.js");

  // Default Route
  app.get("/", function(req, res) {
    res.render("pages/index");
  });

  app.get("/about", function(req, res) {
    res.render("pages/about");
  });

  app.get("/users", function(req, res) {
    res.render("pages/users");
  });
  
  // API STUFF
  // API User Routes
  app
    .route("/api/users")
    .get(user.list_all_users)
    .post(user.create_user);

  app
    .route("/api/users/:id")
    .get(user.getById)
    .delete(user.deleteById)
    .put(user.updateById)
}