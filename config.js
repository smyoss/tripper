'user strict';

// create mysql connection
const mysql = require('mysql');

//local mysql db connection
var dbConnection = mysql.createConnection({
    host     : 'localhost',
    user     : 'yossio',
    password : '',
    database : 'dev-tripper'
});

module.exports = dbConnection;