import express from "express";
import mysql from "mysql";
import dotenv from "dotenv";
// Husk å endre type til module i package.json

const app = express();
const port = 3000;

app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));
// dotenv config og uthenting av data
dotenv.config();

const dbUser = process.env.DB_USER;
const dbPass = process.env.DB_PASS;
// Koble til MySQL-databasen
const db = mysql.createConnection({
    host: 'localhost',
    user: dbUser,
    password: dbPass,  // Erstatt med ditt passord
    database: 'skole'
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('MySQL connected...');
});

// Sett opp EJS som view engine
app.set('view engine', 'ejs');

// Route for startside
app.get('/', (req, res) => {  
    res.render('index');
});
// Elev-side
app.get("/elevlogin", (req, res) => {
    res.render('elev');
})
// Lærer-side
app.get("/larerlogin", (req, res) => {
    res.render('larer');
})
// Elev logger seg inn
app.post("/elevloginsubmit", (req, res) => {
    // 1. Lese inn brukernavn og passord
    console.log(req.body);
    let username = req.body.brukernavn;
    let userpass = req.body.passord;
    // 2. Sjekke mot databasen
    const query = 'SELECT * FROM elever WHERE brukernavn = ? AND passord = ?';
  db.query(query, [username, userpass], (err, results) => {
    // 3. Gi feilmelding, eller vise all elevinfo
    if (err) throw err;
    if (results.length > 0) {
        console.log(results);
      res.render('elev', {elevdata: results[0]});
    } else {
      res.send('<h3>Invalid username or password</h3>');
    }
  });
})

app.post("/larerloginsubmit", (req, res) => {
    // 1. Lese inn brukernavn og passord
    console.log(req.body);
    let username = req.body.brukernavn;
    let userpass = req.body.passord;
    // 2. Sjekke mot databasen
    const query = 'SELECT * FROM lærere WHERE brukernavn = ? AND passord = ?';
  db.query(query, [username, userpass], (err, results) => {
    // 3. Gi feilmelding, eller vise all elevinfo
    if (err) throw err;
    if (results.length > 0) {
        console.log(results);
      res.render('larer', {larerdata: results[0]});
    } else {
      res.send('<h3>Invalid username or password</h3>');
    }
  });
})

app.get('/showStudents', (req, res) => {
    const { fornavn, etternavn } = req.query;
    let sql = 'SELECT * FROM elever';
    const params = [];
 
    // Check if either fornavn or etternavn is provided
    if (fornavn || etternavn) {
        sql += ' WHERE';
        const conditions = [];
 
        if (fornavn) {
            conditions.push(' fornavn = ?');
            params.push(fornavn);
        }
 
        if (etternavn) {
            conditions.push(' etternavn = ?');
            params.push(etternavn);
        }
 
        sql += conditions.join(' AND');
    }
 
    db.query(sql, params, (err, result) => {
        if (err) throw err;
        console.log(result);
 
        if (result.length > 0) {
            console.log(result[0].fornavn);  // Log the first name of the first result, if any
        }
 
        res.render('visElever', {
            elever: result
        });
    });
});
 

// Start serveren
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});