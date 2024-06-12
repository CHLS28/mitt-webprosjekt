import express from "express";
import nodemailer from "nodemailer";
import dotenv from 'dotenv';
import fs from "fs/promises";

dotenv.config();

const email = process.env.MY_EMAIL;
const appPass = process.env.APP_PASS;

const app = express();
const port = 3000;

// Setter EJS som template engine for Express
app.set('view engine', 'ejs');

app.use(express.static('public'));

// Middleware for å parse URL-kodede data
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    res.render('index');
});

app.get('/om-oss', (req, res) => {
    res.render('omOss');
});

app.get('/kontakt-oss', (req, res) => {
    res.render('kontaktOss');
});

app.get('/nyheter', async (req, res) => {
    try {
        const nyheterData = await fs.readFile('data/nyheter.txt', 'utf8'); 
        const nyheterArray = parseNewsData(nyheterData);
        res.render('nyheter', { nyheter: nyheterArray });
    } catch (error) {
        console.error("Feil ved lesing av nyheter:", error);
        res.status(500).send("Noe gikk galt ved lesing av nyheter.");
    }
});


function parseNewsData(data) {
    const nyheter = [];
    const nyhetsartikler = data.split('\n'); 

    nyhetsartikler.forEach(artikkel => {
        const [tittel, dato, forfatter, innhold, dag] = artikkel.split(', ');
        nyheter.push({ tittel, dato, forfatter, innhold, dag});
    });

    return nyheter;
}

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
    res.render("formSubmit", data);
});

function sendEpost(data){
    let transporter = nodemailer.createTransport({ // Oppretter en e-post transporter med Gmail-tjenesten
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
    <img width="200px" src="https://picsum.photos/400" alt="Bilde">`;

    // Definerer e-postalternativer (metadata)
    let mailOptions = {
        from: email,
        to: data.epost,
        subject: "epost fra skjema, BetaTech Solutions",
        html: emailContent 
    };

    transporter.sendMail(mailOptions, function(error, info){
        if (error){
            console.log(error);
        } else {
            console.log("email sent" + info.response);
        }
    });
}

app.listen(port, () => {
    console.log(`Serveren kjører på http://localhost:${port}`);
});
