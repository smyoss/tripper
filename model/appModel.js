'user strict';
const sql = require('./db.js');

//User Functions

//User Object Constructor
let User = function(user) {
    this.id = user.id;
    this.firstName = user.firstName;
    this.lastName = user.lastName;S
    this.password = user.password;
    this.email = user.email;
    this.status = 1;
    //this.timeCreated = new Date();
    //this.timeModified = new Date();
    this.userCreated = 1;
    this.userModified = 1;
};

//get a listing of all users
User.getAllUsers = function(result) {
    sql.query("SELECT * FROM users", function (err,res) {

        if (err) {
            console.log("error: ", err);
            result(null, err);
        }
        else {
            console.log('user : ', res);
            result(null, res);
        }
    });
};

//create a new user account

User.createUser = function(newUser, result) {
    sql.query("INSERT INTO `users` SET ?", newUser.value, function(err,res) {
        if(err) {
            console.log("error: ", err);
            result(err, null);
        }
        else {
            console.log(res.insertId);
            result(null, res.insertId)
        }
    });
};

//get a specific user by id 
User.getById = function (userId, result) {
    sql.query("SELECT * FROM users WHERE id = ?", userId, function(err, res){
        if(err){
            console.log("error: ", err);
            result(err, null);
        }
        else{ result(null, res);
        }
    });
};

//delete a specific user by id 
User.deleteById = function(userId, result) {
    sql.query('DELETE FROM users WHERE id =?', userId, function(err, res) {
        if(err){
            console.log("error: ", err);
            result(err, null);
        }
        else{ result(null, res);
        }
    });
};

//update a specific user by id
User.updateById = function(userId, email, result) {
    sql.query('UPDATE users SET email = ? WHERE id = ?', [User.email, User.id], function(err, res) {
        if(err) {
            console.log("error: ", err);
              result(null, err);
           }
         else{   
           result(null, res);
              }
    });
};

module.exports= User;