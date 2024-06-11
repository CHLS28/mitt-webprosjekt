import express from "express";
import nodemailer from "nodemailer";
import dotenv from 'dotenv';

dotenv.config();

const email = process.env.MY_EMAIL;
const appPass = process.env.APP_PASS;

const app = express();
const port = 3000;

// Sett EJS som template engine
app.set('view engine', 'ejs');

// Statisk filmappe
app.use(express.static('public'));

app.use(express.urlencoded({ extended: true }));

// Ruter
app.get('/', (req, res) => {
    res.render('index');
});

app.get('/om-oss', (req, res) => {
    res.render('omOss');
});

app.get('/kontakt-oss', (req, res) => {
    res.render('kontaktOss');
});

app.post("/submit", (req, res) => {
    console.log("Email Sendt!");
    console.log(req.body);
    let data = {
        fornavn: req.body.fornavn,
        etternavn: req.body.etternavn,
        epost: req.body.email,
        melding: req.body.melding
    };
    sendEpost(data);
    res.render("formSubmit.ejs", data);
});

function sendEpost(data){
    let transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
            user: email,
            pass: appPass
        }
    });

    let emailContent = `<h1>Hei, ${data.fornavn} ${data.etternavn}.</h1> 
    <p>Vi har mottatt meldingen din fra denne epost adressen: ${data.epost}. Her er en kopi av meldingen du sendte:</p>
    <p>${data.melding}</p>
    <br>
    <p>Med vennlig hilsen</p>
    <p><strong>BetaTech Solutions</strong></p>
    <img width="200px" src="https://picsum.photos/400?random=6" alt="Bilde">`;

    let mailOptions = {
        from: email,
        to: data.epost,
        subject: "epost fra skjema, spam",
        html: emailContent  // html hvis det er html
    };
    transporter.sendMail(mailOptions, function(error, info){
        if (error){
            console.log(error);
        }else{
            console.log("email sent" + info.response);
        }
    });
}

// Start server
app.listen(port, () => {
    console.log(`Serveren kjører på http://localhost:${port}`);
});
