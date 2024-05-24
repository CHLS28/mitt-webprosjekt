import express from "express";
import dotenv from "dotenv";
import nodemailer from "nodemailer";
import fs from "fs/promises";

dotenv.config();

const email = process.env.MY_EMAIL;
const appPass = process.env.APP_PASS;
const adminUser = process.env.ADMIN_USER;
const adminPass = process.env.ADMIN_PASS;

const app = express();
const port = 3000;

app.set('view engine', 'ejs')

app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    res.render("index.ejs");
});

app.get("/admin", (req, res) => {
    res.render("admin.ejs");
});

app.post("/admin/login", (req, res) => {
    const { username, password } = req.body;

    // Check if username and password match the admin credentials
    if (username === adminUser && password === adminPass) {
        // Successful login, redirect to admin dashboard or whatever admin page you have
        res.redirect("/admin/dashboard");
    } else {
        // Invalid credentials, render the login page with an error message
        res.render("admin.ejs", { error: "Invalid username or password" });
    }
});

app.get("/admin/dashboard", async (req, res) => {
    try {
        // Read the voting data from the file
        const dataPath = "./data/votingData.txt";
        const rawData = await fs.readFile(dataPath, "utf-8");
        
        // Process the data to get statistics (e.g., count votes for each candidate)
        const votes = rawData.split("\n").map(line => {
            const [fullName, email, candidate] = line.split(",");
            return { candidate };
        });

        // Calculate statistics (e.g., count votes for each candidate)
        const statistics = votes.reduce((acc, vote) => {
            acc[vote.candidate] = (acc[vote.candidate] || 0) + 1;
            return acc;
        }, {});

        // Render the admin dashboard page with statistics
        res.render("admin_dashboard.ejs", { statistics });
    } catch (error) {
        console.error("Failed to fetch voting data:", error);
        res.status(500).send("An error occurred while fetching voting data.");
    }
});

app.get("/vote", (req, res) => {
    res.render("vote.ejs");
});

async function skrivTilFil(data) {
    let dataPath = "./data/votingData.txt";
    let nyLinje = `\n${data.fullName},${data.email},${data.candidate}`;
    try {
        await fs.appendFile(dataPath, nyLinje);
        console.log("Data added successfully!");
    } catch (err) {
        console.error("Failed to append data to file:", err);
    }
}
 
// Route to handle form submission from the voting form
app.post("/vote", async (req, res) => {
    try {
        // Extract form data
        const { fullName, email, candidate } = req.body;
 
        // Prepare data object
        const data = { fullName, email, candidate };
 
        // Write data to file
        await skrivTilFil(data);
 
        // Send response to client
        res.send("Vote submitted successfully!");
    } catch (error) {
        console.error("Failed to process form submission:", error);
        res.status(500).send("An error occurred while processing your request.");
    }
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});