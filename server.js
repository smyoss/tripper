const express = require('express'),
  app = express(),
  bodyParser = require('body-parser');
  port = process.env.PORT || 8080;


const mysql = require('mysql');
// connection configurations
const mc = mysql.createConnection({
    host: 'localhost',
    user: 'yossio',
    password: '',
    database: 'dev-apilearning'
});
 
// connect to database
mc.connect();

app.listen(port);

console.log('Enter the Matrix on : ' + port);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var routes = require('./routes/approutes'); //importing route
routes(app); //register the route

//set default engine, and provide [handlebars as] extension
app.set('view engine', 'ejs');
app.set("views", "./views");