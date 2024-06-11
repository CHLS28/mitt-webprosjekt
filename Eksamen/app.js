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

app.post('/kvitering', async (req, res) => {
    const { fornavn, etternavn, email, melding } = req.body;

    // Send email using Nodemailer
    try {
        let transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: email,
                pass: appPass
            }
        });

        let mailOptions = {
            from: email,
            to: email,
            subject: 'Kvittering fra BetaTech Solutions',
            text: `Hei, ${fornavn} ${etternavn}. Vi har mottatt meldingen din! Det sendes også en kopi av denne kvitteringen til denne epost adressen: ${email}.`
        };

        await transporter.sendMail(mailOptions);
        console.log('E-post sendt!');
    } catch (error) {
        console.log('Feil ved sending av e-post:', error);
    }

    // Render the receipt page
    res.render('kvitering', { fornavn, etternavn, email });
});

// Start server
app.listen(port, () => {
    console.log(`Serveren kjører på http://localhost:${port}`);
});