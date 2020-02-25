"use strict";
module.exports = function(app) {
  var user = require("../controller/appController.js");

  // Default Route
  app.get("/", function(req, res) {
    res.render("pages/index");
  });

// about page 
app.get('/about', function(req, res) {
  res.render('pages/about');
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
