// Variabel for å lagre inntektene
let revenue = [];
let tider = [];
let tekst = document.getElementById("txtUt")

// Funksjon for å betale parkering
function payParking() {
  // Henter verdien fra input-elementet for registreringsnummer
  const licensePlate = document.getElementById("licensePlate").value;

  // Henter verdien fra dropdown-listen
  const numberOfHours = document.getElementById("numberOfHours").value;

  // Beregner prisen basert på valgt antall timer
  const price = numberOfHours
  if (numberOfHours.value <= 2){
    price = numberOfHours.value * 0;
  }
  else {
    price = numberOfHours * 35 - 70;
  }

  tider.push(numberOfHours)
  tekst.innerHTML = 
  

  // Viser en popup-melding med prisen
  alert(`Du må betale ${price} kr for parkering.`);

  // Henter referansen til animasjonsbaren
  const remainingTimeBar = document.getElementById("remaining-time-bar");

  // Setter opp CSS-animasjon med varighet basert på parkeringstiden
  remainingTimeBar.style.animation = `countdown ${numberOfHours}h linear forwards`;

  // Nullstiller animasjonen ved å fjerne og legge til klassen på nytt
  remainingTimeBar.classList.remove("countdown");
  void remainingTimeBar.offsetWidth; // Trigger reflow for å tvinge en reanimering
  remainingTimeBar.classList.add("countdown");

  // Viser en melding når parkeringsperioden utløper
  setTimeout(() => {
    document.getElementById("message-container").innerText = `Parkeringen for ${licensePlate} er utløpt.`;
  }, numberOfHours * 3600 * 1000); // Konverterer timer til millisekunder for setTimeout

  // Legger til prisen i inntektslisten
  revenue.push(price);
}

// Funksjon for å vise inntektene i synkende rekkefølge
function showRevenue() {
  // Henter referansen til inntektslisten
  const revenueList = document.getElementById("revenue-list");

  // Tømmer innholdet i inntektslisten
  revenueList.innerHTML = "";

  // Sorterer inntektene i synkende rekkefølge
  revenue.sort((a, b) => b - a);

  // Går en etter en gjennom inntektene og legger dem til i inntektslisten
  revenue.forEach((amount, index) => {
    const listItem = document.createElement("li");
    listItem.textContent = `Inntekt ${index + 1}: ${amount} kr`;
    revenueList.appendChild(listItem);
  });
}

// Funksjon for å avslutte dagen og vise total inntekt
function endDay() {
  // Beregner total inntekt
  const totalRevenue = revenue.reduce((acc, curr) => acc + curr, 0);

  // Viser en popup-melding med total inntekt
  alert(`Total inntekt for dagen er ${totalRevenue} kr.`);

  // Tømmer inntektslisten for å starte en ny dag
  revenue = [];
}




