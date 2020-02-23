"use strict";

var User = require("../model/appModel.js");

//user functions

//list all users
exports.list_all_users = function(req, res) {
  User.getAllUsers(function(err, user) {
    console.log("controller");
    if (err) res.send(err);
    console.log("res", user);
    res.send(user);
  });
};

//create a user
exports.create_user = function(req, res) {
  var newUser = new User(req.body);
  console.log(newUser);

  //handles null error
  if (!newUser.email || !newUser.firstName || !newUser.lastName || !newUser.password) {
    res.status(400).send({ error: true, message: "Missing user details. Please check your reqest." });
  } else {
    User.createUser(newUser, function(err, user) {
      if (err) res.send(err);
      res.json(user);
    });
  }
};

//get a specific user
exports.getById = function(req, res) {
    User.getById(req.params.userId, function(err, user){
        if(err)
        res.send(err);
        res.json(user);
    });

};