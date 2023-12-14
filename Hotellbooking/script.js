// Hotellet har 5 rom
        // I begynnelsen bor jens på rom 1 (index 0)
        // arne bor på rom 4 (index 3)
        // De andre rommene er ledige
        let rommene = [
            { navn: "jens", opptatt: true },
            { navn: "", opptatt: false },
            { navn: "", opptatt: false },
            { navn: "arne", opptatt: true },
            { navn: "", opptatt: false }
        ];

        function visOversikt() {
            let oversiktElement = document.getElementById("oversikt");
            oversiktElement.innerHTML = "";

            for (let i = 0; i < rommene.length; i++) {
                let romInfo = "Rom " + (i + 1) + ": " + (rommene[i].opptatt ? rommene[i].navn : "ledig");
                oversiktElement.innerHTML += romInfo + "<br>";
            }
        }

        function bookRom() {
            for (let i = 0; i < rommene.length; i++) {
                if (!rommene[i].opptatt) {
                    let gjestNavn = prompt("Skriv inn gjestens navn:");
                    rommene[i].navn = gjestNavn;
                    rommene[i].opptatt = true;
                    visOversikt();
                    return;
                }
            }

            alert("Beklager, alle rom er opptatt.");
        }

        function checkout() {
            let romNr = prompt("Skriv inn romnummer:");
            let gjestNavn = prompt("Skriv inn gjestens navn:");

            let romIndex = romNr - 1;

            if (romIndex >= 0 && romIndex < rommene.length && rommene[romIndex].opptatt && rommene[romIndex].navn === gjestNavn) {
                rommene[romIndex].navn = "";
                rommene[romIndex].opptatt = false;
                visOversikt();
            } else {
                alert("Feil: Romnummer eller gjestens navn stemmer ikke.");
            }
        }

        // Vis oversikt ved start
        visOversikt();