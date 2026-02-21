require('dotenv').config(); // This line is crucial!
const mysql = require('mysql2');

const db = mysql.createConnection({
   host: process.env.DB_HOST,
   port: 3306,
   user: process.env.DB_USER,
   password: process.env.DB_PASSWORD,
   database: process.env.DB_NAME
});

module.exports = db;


