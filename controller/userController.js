"use strict";

const User = require("../model/userModel.js");
const Joi = require("@hapi/joi");


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
  const schema = Joi.object ({
    firstName : Joi.string().min(3).required(),
    lastName: Joi.string().min(3).required(), 
    password: Joi.string().min(5).required(),
    status: Joi.number().min(0).max(1).required(),
    email: Joi.string().email({ minDomainSegments: 2, tlds: { allow: ["com", "net"] } } ).required(),
  });
  
  const result = schema.validate(req.body)

  if (result.error) {
    //400 bad request
    res.status(400).send({ error: true, message: "Missing user details. Please check your reqest.", details: result.error.details });

  } else {
    User.createUser(result, function(err, user) {
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

// delete a specific user
exports.deleteById = function(req, res) {
    User.deleteById(req.params.userId, function(err, user) {
        if(err)
        res.send(err);
        res.json({message: 'User deleted'});
    });
};

//update a specific user by id
exports.updateById = function(req, res){
    User.updateById(req.params.userId, new User(req.body), function(err, user) {
    if(err)
        res.send(err);
    res.json(user);

    });
};