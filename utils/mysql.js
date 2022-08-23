const res = require('express/lib/response');
var mysql = require('mysql');

var koneksi = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "cash_counter"
});

koneksi.connect((err) => {
  if(err) throw err;
    console.log("Connected!");
});




module.exports = {koneksi}