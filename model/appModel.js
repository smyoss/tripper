'user strict';
var sql = require('./db.js');

//User Functions

//User Object Constructor
var User = function(user) {
    this.id = user.id;
    this.firstName = user.firstName;
    this.lastName = user.lastName;
    this.password = user.password;
    this.email = user.email;
    this.status = user.status;
    this.timeCreated = new Date();
    this.timeModified = new Date();
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
    sql.query("INSERT INTO users SET ?", newUser, function(err, res){
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

module.exports= User;