const mysql = require('mysql');
const conn = mysql.createConnection({
 host: "localhost",
 user: "root",
 password: '',
 database: "healthapp",
 multipleStatements: true
});

conn.connect(function(err){
    if(err) throw err;
    console.log("connected!");
});

module.exports = conn;