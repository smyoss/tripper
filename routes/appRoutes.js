"use strict";
module.exports = function(app) {
  var user = require("../controller/appController.js");

  // Default Route
  app.get("/", function(req, res) {
    res.render("pages/index");
  });

  app.get("/about", function(req, res) {
    res.render("pages/about");
  });

  app.get("/table", function(req, res) {
    res.render("pages/table");
  });
  
  // API STUFF
  // API User Routes
  app
    .route("/users")
    .get(user.list_all_users)
    .post(user.create_user);

  app
    .route("/users/:userId")
    .get(user.getById)
    .delete(user.deleteById)
    .put(user.updateById);
};
