import express from "express";
import dotenv from "dotenv";
import fs from 'fs/promises'; 
import session from 'express-session'; 


dotenv.config();

const app = express();
const port = 3000;

const adminUser = process.env.ADMIN_USER;
const adminPass = process.env.ADMIN_PASS; 

app.set('view engine', 'ejs');

app.use(express.static('public'));


app.use(express.urlencoded({ extended: true })); 

// Konfigurer sessions
app.use(session({
    secret: 'hemmelig',
    resave: false,
    saveUninitialized: true
}));


app.get('/', (req, res) => {
    res.render('index'); // 
});


async function skrivTilFil(data) {
    let dataPath = "./data/tilbakemeldingData.txt";
    let nyLinje = `\n${data.trivsel},${data.melding},${data.avdeling}`;
    try {
        await fs.appendFile(dataPath, nyLinje);
        console.log("Data added successfully!");
    } catch (err) {
        console.error("Failed to append data to file:", err);
    }
}


app.post("/submit", async (req, res) => {
    try {
        const { trivsel, melding, avdeling } = req.body;
        const data = { trivsel, melding, avdeling };
        await skrivTilFil(data);
        res.render('submit', { message: "Tilbakemelding sendt inn!" });
    } catch (error) {
        console.error("Failed to process form submission:", error);
        res.status(500).render('submit', { message: "En feil oppstod ved behandling av forespørselen din." });
    }
});


app.get('/login', (req, res) => {
    res.render('admin');
});


app.post("/login", (req, res) => {
    const { brukernavn, passord } = req.body;
    if (brukernavn === adminUser && passord === adminPass) { 
        req.session.authenticated = true; 
        res.redirect('/admin'); 
    } else {
        res.render('admin', { error: "Feil brukernavn eller passord." });
    }
});


async function lesFraFil() {
    try {
        const data = await fs.readFile("./data/tilbakemeldingData.txt", "utf8");
        const lines = data.trim().split("\n");
        const statistics = {};

        lines.forEach(line => {
            const [trivsel, melding, avdeling] = line.split(",");
            if (!statistics[avdeling]) {
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
            statistics[avdeling][trivsel] = (statistics[avdeling][trivsel] || 0) + 1;
        });

        return statistics;
    } catch (err) {
        console.error("Failed to read data from file:", err);
        return {};
    }
}


app.get('/admin', async (req, res) => {
    const statistics = await lesFraFil();
    res.render('admin_dashboard', { statistics });
});

// Middleware for å sjekke autentisering
app.use((req, res, next) => {
    if (req.url.startsWith('/admin_dashboard') && !req.session.authenticated) {
        return res.redirect('/login');
    }
    next(); // Fortsett til neste middleware eller rutehandler
});


app.listen(port, () => {
    console.log(`Serveren kjører på http://localhost:${port}`);
});
``