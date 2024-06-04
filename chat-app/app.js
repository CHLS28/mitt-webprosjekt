import express from 'express';
import session from 'express-session';
import pool from './db.js';

const app = express();
const port = 3000;

app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));
app.use(session({
  secret: 'yourSecret',
  resave: false,
  saveUninitialized: true
}));

app.set("view engine", "ejs");

let meldinger = ["Morn dere", "Har dere gjort leksene", "Nei, det var kjedelig."];
let navnene = ["Per", "Jens", "Sara"];

app.get("/", (req, res) => {
  if (req.session.user) {
    res.render("index.ejs", {meldinger, navnene});
  } else {
    res.redirect('/login');
  }
});

app.get("/register", (req, res) => {
  res.render("register.ejs");
});

app.post("/register", async (req, res) => {
  const { username, email, password } = req.body;

  try {
    const [result] = await pool.query("INSERT INTO users (username, email, passwd) VALUES (?, ?, ?)", [username, email, password]);
    res.redirect('/login');
  } catch (error) {
    res.send('Error creating user');
  }
});

app.get("/login", (req, res) => {
  res.render("login.ejs");
});

app.post("/login", async (req, res) => {
  const { username, password } = req.body;

  const [rows] = await pool.query("SELECT * FROM users WHERE username = ?", [username]);

  if (rows.length > 0) {
    const user = rows[0];

    if (password === user.passwd) {
      req.session.user = user;
      res.redirect('/');
    } else {
      res.send('Incorrect password');
    }
  } else {
    res.send('User not found');
  }
});

app.post("/nymelding", async (req, res) => {
  if (req.session.user) {
    let nyMelding = req.body.melding;
    let navn = req.session.user.username;

    await pool.query("INSERT INTO messages (user_id, message) VALUES (?, ?)", [req.session.user.id, nyMelding]);
    
    const [rows] = await pool.query("SELECT messages.message, messages.timestamp, users.username FROM messages JOIN users ON messages.user_id = users.id ORDER BY messages.timestamp DESC");
    
    meldinger = rows.map(row => `${row.username}: ${row.message} (${row.timestamp})`);
    navnene = rows.map(row => row.username);
    
    res.render("index.ejs", {meldinger, navnene});
  } else {
    res.redirect('/login');
  }
});

app.get("/meldinger", (req, res) => {
  res.json({ meldinger, navnene });
});

app.get("/logout", (req, res) => {
  req.session.destroy(err => {
    if (err) {
      return res.send('Error logging out');
    }
    res.redirect('/login');
  });
});

app.post("/nymelding", async (req, res) => {
    if (req.session.user) {
      let nyMelding = req.body.melding;
      let navn = req.session.user.username;
  
      await pool.query("INSERT INTO messages (user_id, message) VALUES (?, ?)", [req.session.user.id, nyMelding]);
      
      const [rows] = await pool.query("SELECT messages.message, messages.timestamp, users.username FROM messages JOIN users ON messages.user_id = users.id ORDER BY messages.timestamp DESC");
      
      meldinger = rows.map(row => `${row.username}: ${row.message} (${row.timestamp})`);
      navnene = rows.map(row => row.username);
      
      res.render("index.ejs", {meldinger, navnene});
    } else {
      res.redirect('/login');
    }
  });

  app.get("/logout", (req, res) => {
    req.session.destroy(err => {
      if (err) {
        return res.send('Error logging out');
      }
      res.redirect('/login');
    });
  });

app.listen(port, () => {
  console.log(`Server running on port ${port}.`);
});