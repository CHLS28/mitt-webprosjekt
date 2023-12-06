// Funksjonen checkAnswers blir utløst når brukeren sjekker svar.
function checkAnswers() {
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
    scoreMessage.textContent = `Du fikk ${score} av 4 riktige svar.`;

    // Sjekker om det er noen feilaktige svar og viser dem i correctAnswersDiv.
    if (correctAnswers.length > 0) {
        // Setter inn HTML for feilaktige svar i correctAnswersDiv.
        correctAnswersDiv.innerHTML = `<p>Riktige svar:</p><ul><li>Spørsmål 1: Cola</li><li>Spørsmål 2: Norge</li><li>Spørsmål 3: 9</li><li>Spørsmål 4: Betlehemsstjernen</li></ul>`;
        correctAnswersDiv.style.display = "block"; // Viser div-elementet med riktige svar.
    } else {
        correctAnswersDiv.style.display = "none"; // Skjuler div-elementet hvis det ikke er feilaktige svar.
    }
}
