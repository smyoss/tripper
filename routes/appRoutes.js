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

  app.get("/table", function(req, res) {
    res.render("pages/table");
  });

  app.post('/register', function(req, res) {
    res.render('login-register',{
      register_error:allErrors,
      old_data:req.body
    });
  });

  app.use('/', (req,res) => {
    res.status(404).send('<h1>404 Page Not Found!</h1>');
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
