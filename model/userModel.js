'user strict';
const dbConnection = require('../config');

//User Functions

//User Object Constructor
let User = function(user) {
    this.id = user.id;
    this.firstName = user.firstName;
    this.lastName = user.lastName;S
    this.password = user.password;
    this.email = user.email;
    this.status = 1;
    this.timeCreated = new Date();
    this.timeModified = new Date();
    this.userCreated = 1;
    this.userModified = 1;
};

//get a listing of all users
User.getAllUsers = function(result) {
    dbConnection.query("SELECT * FROM users", function (err,res) {

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
    dbConnection.query("INSERT INTO users SET ?", newUser.value, function(err,res) {
        if(err) {
            console.log("error: ", err);
            result(err, null);
        }
        else {
            console.log(res.insertId);
            result(null, res.insertId);
            //log insert into the database
            dbConnection.query("INSERT INTO `log` (`table`, `action`, `value`, `foreignKey`) VALUES ('users','create','"+JSON.stringify(newUser)+"','"+res.insertId+"')");
        }
    });
};

//get a specific user by id 
User.getById = function (userId, result) {
    dbConnection.query("SELECT * FROM users WHERE id = ?", userId, function(err, res){
        if(err){
            console.log("error: ", err);
            result(err, null);
        }
        else{ result(null, res);
        }
    });
};

//delete a specific user by id 
User.deleteById = function(id, result) {
    dbConnection.query('DELETE FROM users WHERE ?', id.value, function(err, res) {
        if(err){
            console.log("error: ", err);
            result(err, null);
        }
        else {
            console.log(res);
            result(null, "User ID: " + res);
            //log insert into the database
            dbConnection.query("INSERT INTO `log` (`table`, `action`, `value`, `foreignKey`) VALUES ('users','delete','User ID: "+res.value+"','"+res.value+"')");
        }
    });
};

//update a specific user by id
User.updateById = function(userId, email, result) {
    dbConnection.query('UPDATE users SET email = ? WHERE id = ?', [User.email, User.id], function(err, res) {
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