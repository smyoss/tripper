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

var routes = require('./routes/appRoutes'); //importing route
routes(app); //register the route

//set default engine, and provide [handlebars as] extension
app.set('view engine', 'ejs');
app.set("views", "./views");
