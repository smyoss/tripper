//required files
const express = require('express');
const path = require('path');
const cookieSession = require('cookie-session');
const bcrypt = require('bcrypt');
const { body, validationResult } = require('express-validator');
const dbConnection = require('./config');
const bodyParser = require('body-parser');

app = express(),
port = process.env.PORT || 8080;
app.use(express.urlencoded({extended:false}));

// connect to database
dbConnection.connect();

app.listen(port);

console.log('Enter the Matrix on : ' + port);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var routes = require('./routes/approutes'); //importing route
routes(app); //register the route

//set default engine, and provide [handlebars as] extension
app.set('view engine', 'ejs');
app.set("views", "./views");

// APPLY COOKIE SESSION MIDDLEWARE
app.use(cookieSession({
  name: 'session',
  keys: ['key1', 'key2'],
  maxAge:  3600 * 1000 // 1hr
}));

// DECLARING CUSTOM MIDDLEWARE
const ifNotLoggedin = (req, res, next) => {
  if(!req.session.isLoggedIn){
      return res.render('login-register');
  }
  next();
}

const ifLoggedin = (req,res,next) => {
  if(req.session.isLoggedIn){
      return res.redirect('/home');
  }
  next();
}
// END OF CUSTOM MIDDLEWARE