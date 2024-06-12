import express from "express"; // Importerer Express rammeverket
import nodemailer from "nodemailer"; // Importerer nodemailer modulen for å sende e-post
import dotenv from 'dotenv'; // Importerer dotenv modulen for å laste miljøvariabler fra .env filen

dotenv.config(); // Konfigurerer dotenv for å laste miljøvariabler fra .env filen

const email = process.env.MY_EMAIL; // Henter e-postadresse fra miljøvariabelen MY_EMAIL
const appPass = process.env.APP_PASS; // Henter app-passord fra miljøvariabelen APP_PASS

const app = express(); // Oppretter en ny Express-applikasjon
const port = 3000; // Setter serverens portnummer til 3000

// Setter EJS som template engine for Express
app.set('view engine', 'ejs');

// Definerer en statisk filmappe for å servere statiske filer som CSS, JavaScript og bilder
app.use(express.static('public'));

// Middleware for å parse URL-kodede data
app.use(express.urlencoded({ extended: true }));

// Definerer en rute for å behandle HTTP GET-forespørsler til rotstien
app.get('/', (req, res) => {
    res.render('index'); // Rendrer index.ejs visningen
});

// Definerer en rute for å behandle HTTP GET-forespørsler til /om-oss
app.get('/om-oss', (req, res) => {
    res.render('omOss'); // Rendrer omOss.ejs visningen
});

// Definerer en rute for å behandle HTTP GET-forespørsler til /kontakt-oss
app.get('/kontakt-oss', (req, res) => {
    res.render('kontaktOss'); // Rendrer kontaktOss.ejs visningen
});

// Definerer en rute for å behandle HTTP POST-forespørsler til /submit
app.post("/submit", (req, res) => {
    console.log("Email Sendt!"); // Logger en beskjed om at e-post er sendt
    console.log(req.body); // Logger dataen som ble sendt i skjemaet
    let data = { // Oppretter et objekt med skjemadataen
        fornavn: req.body.fornavn,
        etternavn: req.body.etternavn,
        epost: req.body.email,
        melding: req.body.melding
    };
    sendEpost(data); // Kaller funksjonen sendEpost med skjemadataen
    res.render("formSubmit.ejs", data); // Rendrer formSubmit.ejs visningen med skjemadataen
});

// Funksjon for å sende e-post
function sendEpost(data){
    let transporter = nodemailer.createTransport({ // Oppretter en e-post transporter med Gmail-tjenesten
        service: "gmail",
        auth: {
            user: email, // Brukernavn for Gmail (sendende e-postadresse)
            pass: appPass // Passord for Gmail-kontoen
        }
    });

    // Oppretter e-postinnhold i HTML-format med skjemadataen
    let emailContent = `<h1>Hei, ${data.fornavn} ${data.etternavn}.</h1> 
    <p>Vi har mottatt meldingen din fra denne epost adressen: ${data.epost}. Her er en kopi av meldingen du sendte:</p>
    <p>${data.melding}</p>
    <br>
    <p>Med vennlig hilsen</p>
    <p><strong>BetaTech Solutions</strong></p>
    <img width="200px" src="https://picsum.photos/400?random=6" alt="Bilde">`;

    // Definerer e-postalternativer (metadata)
    let mailOptions = {
        from: email, // Avsenderens e-postadresse
        to: data.epost, // Mottakerens e-postadresse
        subject: "epost fra skjema, spam", // Emne for e-posten
        html: emailContent // HTML-innholdet i e-posten
    };

    // Sender e-posten ved hjelp av transportøren
    transporter.sendMail(mailOptions, function(error, info){
        if (error){
            console.log(error); // Logger en feilmelding hvis det oppstår en feil ved sending av e-post
        } else {
            console.log("email sent" + info.response); // Logger en bekreftelse hvis e-posten ble sendt vellykket
        }
    });
}

// Starter Express-serveren og lytter på porten definert ovenfor
app.listen(port, () => {
    console.log(`Serveren kjører på http://localhost:${port}`); // Logger en beskjed til konsollen når serveren starter
});