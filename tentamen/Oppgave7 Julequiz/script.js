// Funksjonen checkAnswers blir utløst når brukeren sjekker svar.
let buttonPressCount = 0;
let incorrectAttempts = 0;

function checkAnswers() {
    // Increment the button press count each time the function is called.
    buttonPressCount++;

    // Henter HTML-elementer fra DOM.
    const form = document.getElementById("quizForm");
    const scoreMessage = document.getElementById("scoreMessage");
    const correctAnswersDiv = document.getElementById("correctAnswers");

    // Initialiserer variabler for å holde oversikt over score og korrekte svar.
    let score = 0;
    let correctAnswers = [];

    // Løkke gjennom de fire spørsmålene i quizen.
    for (let i = 1; i <= 4; i++) {
        // Henter det valgte svaret for hvert spørsmål.
        const selectedAnswer = document.querySelector(`input[name="q${i}"]:checked`);

        // Sjekker om et svar er valgt.
        if (selectedAnswer) {
            // Henter brukerens svar (verdi) fra det valgte svaret.
            const userAnswer = selectedAnswer.value;

            // Sjekker om brukerens svar er riktig og øker scoren.
            if (userAnswer === "riktig") {
                score++;
            } else {
                // Legger til riktig svar i correctAnswers-arrayet.
                correctAnswers.push(`Spørsmål ${i}: Riktig svar er ${selectedAnswer.nextSibling.nodeValue.trim()}`);
            }
        }
    }

    // Oppdaterer scoreMessage med brukerens resultat.
    scoreMessage.textContent = `Du fikk ${score} av 5 riktige svar.`;

    // Sjekker om det er noen feilaktige svar og viser dem i correctAnswersDiv.
    if (correctAnswers.length > 0) {
        // Setter inn HTML for feilaktige svar i correctAnswersDiv.
        correctAnswersDiv.innerHTML = `<p>Feilaktige svar:</p><ul>${correctAnswers.map(answer => `<li>${answer}</li>`).join('')}</ul>`;
        correctAnswersDiv.style.display = "block"; // Viser div-elementet med feilaktige svar.
        
        // Increment the incorrect attempts count.
        incorrectAttempts++;
    } else {
        correctAnswersDiv.style.display = "none"; // Skjuler div-elementet hvis det ikke er feilaktige svar.
    }

    // Check if the user has pressed the button three times and answered incorrectly each time.
    if (buttonPressCount === 3 && incorrectAttempts === 3) {
        alert("Du har svart feil tre ganger. Du blir nå sendt til vg.no.");
        // Redirect the user to vg.no
        window.location.href = "https://www.vg.no";
    }
}
