// Importer nødvendige moduler
import express from "express"; // Importer Express rammeverket
import dotenv from "dotenv"; // Importer dotenv for lasting av miljøvariabler fra .env-filen
import fs from 'fs/promises'; // Importer fs-modulen for asynkrone filbehandlingsoperasjoner
import session from 'express-session'; // Importer express-session-modulen for sessions

// Last inn miljøvariabler fra .env-filen
dotenv.config();

// Initialiser en Express-applikasjon
const app = express(); // Opprett en Express-app-forekomst
const port = 3000;  // Definer porten applikasjonen skal kjøre på

// Hent admin-brukernavn og passord fra miljøvariabler
const adminUser = process.env.ADMIN_USER; // Hent admin-brukernavnet fra miljøvariablene
const adminPass = process.env.ADMIN_PASS; // Hent admin-passordet fra miljøvariablene

// Sett EJS som template engine
app.set('view engine', 'ejs'); // Angi EJS som template engine for Express

// Angi mappen for statiske filer
app.use(express.static('public')); // Angi mappen 'public' for statiske filer som bilder, CSS og JavaScript

// Middleware for å tolke URL-kodede forespørsler (som fra HTML-skjemaer)
app.use(express.urlencoded({ extended: true })); // Tolker URL-kodede forespørsler og legger resultatene til req.body

// Konfigurer sessions
app.use(session({
    secret: 'hemmelig', // Hemmelig streng for å signere sessions
    resave: false, // Ikke lagre session hvis den ikke er endret
    saveUninitialized: true // Lagre uinitialiserte sessions
}));

// Definer rute for rot (hjemmesiden)
app.get('/', (req, res) => {
    res.render('index'); // Render index.ejs
});

// Funksjon for å skrive data til fil
async function skrivTilFil(data) {
    let dataPath = "./data/tilbakemeldingData.txt"; // Sti til datafilen
    let nyLinje = `\n${data.trivsel},${data.melding},${data.avdeling}`; // Data som skal skrives til filen
    try {
        await fs.appendFile(dataPath, nyLinje); // Legg til data i filen
        console.log("Data added successfully!"); // Logg vellykket tillegg av data
    } catch (err) {
        console.error("Failed to append data to file:", err); // Logg feil ved mislykket skriving
    }
}

// Håndter POST-forespørsler til /submit
app.post("/submit", async (req, res) => {
    try {
        const { trivsel, melding, avdeling } = req.body; // Destrukturer data fra forespørselen
        const data = { trivsel, melding, avdeling }; // Lag et dataobjekt
        await skrivTilFil(data); // Skriv data til fil
        res.render('submit', { message: "Tilbakemelding sendt inn!" }); // Render submit.ejs med suksessmelding
    } catch (error) {
        console.error("Failed to process form submission:", error); // Logg feil ved mislykket behandling
        res.status(500).render('submit', { message: "En feil oppstod ved behandling av forespørselen din." }); // Render submit.ejs med feilmelding
    }
});

// Rute for påloggingsside
app.get('/login', (req, res) => {
    res.render('admin'); // Render admin.ejs
});

// Håndter POST-forespørsler til /login
app.post("/login", (req, res) => {
    const { brukernavn, passord } = req.body; // Hent brukernavn og passord fra forespørselen
    if (brukernavn === adminUser && passord === adminPass) { // Sjekk legitimasjon
        req.session.authenticated = true; // Sett session som autentisert
        res.redirect('/admin'); // Omdiriger til adminside
    } else {
        res.render('admin', { error: "Feil brukernavn eller passord." }); // Render admin.ejs med feilmelding
    }
});

// Funksjon for å lese data fra fil og generere statistikk
async function lesFraFil() {
    try {
        const data = await fs.readFile("./data/tilbakemeldingData.txt", "utf8"); // Les filen
        const lines = data.trim().split("\n"); // Splitt dataen på linjeskift
        const statistics = {};

        lines.forEach(line => {
            const [trivsel, melding, avdeling] = line.split(","); // Splitt hver linje på komma
            if (!statistics[avdeling]) {
                // Initialiser statistikk for avdeling hvis den ikke finnes
                statistics[avdeling] = {
                    'fantastisk': 0,
                    'veldig bra': 0,
                    'bra': 0,
                    'passe': 0,
                    'litt dårlig': 0,
                    'veldig dårlig': 0,
                    'forferdelig': 0
                };
            }
            statistics[avdeling][trivsel] = (statistics[avdeling][trivsel] || 0) + 1; // Oppdater tellingen for trivsel i avdelingen
        });

        return statistics; // Returner generert statistikk
    } catch (err) {
        console.error("Failed to read data from file:", err); // Logg feil ved mislykket lesing
        return {};
    }
}

// Rute for admin-side
app.get('/admin', async (req, res) => {
    const statistics = await lesFraFil(); // Hent statistikk fra fil
    res.render('admin_dashboard', { statistics }); // Render admin_dashboard.ejs med statistikk
});

// Middleware for å sjekke autentisering
app.use((req, res, next) => {
    if (req.url.startsWith('/admin_dashboard') && !req.session.authenticated) {
        return res.redirect('/login'); // Omdiriger til login-side hvis ikke autentisert
    }
    next(); // Fortsett til neste middleware eller rutehandler
});

// Start server
app.listen(port, () => {
    console.log(`Serveren kjører på http://localhost:${port}`); // Logg melding når serveren er startet
});
``