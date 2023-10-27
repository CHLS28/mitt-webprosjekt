document.getElementById('billettForm').addEventListener('submit', function(event) {
    event.preventDefault();

    var passasjerType = document.querySelector('input[name="passasjertype"]:checked').value;
    var antallBilletter = document.querySelector('input[name="antall"]').value;

    if (passasjerType === '' || antallBilletter <= 0) {
        alert("Vennligst fyll ut alle feltene korrekt.");
        return;
    }

    var prisPerBillett;

    switch (passasjerType) {
        case 'voksen':
            prisPerBillett = 250;
            break;
        case 'barn':
            prisPerBillett = 130;
            break;
        case 'pensjonist':
            prisPerBillett = 105;
            break;
        default:
            alert("Noe gikk galt, vennligst prøv igjen.");
            return; // Noe gikk galt, så vi avbryter funksjonen tidlig.
    }

    var totalPris = antallBilletter * prisPerBillett;
    alert("Totalprisen er " + totalPris + " kr.");
});

