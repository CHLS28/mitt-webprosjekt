document.addEventListener("DOMContentLoaded", function() {
    const prosjekterKnapp = document.getElementById('prosjekterKnapp');
    const tilbakeKnapp = document.getElementById('tilbakeKnapp');

    if (prosjekterKnapp) {
        prosjekterKnapp.addEventListener('click', function() {
            window.location.href = 'prosjekter.html';
        });
    }

    if (tilbakeKnapp) {
        tilbakeKnapp.addEventListener('click', function() {
            window.location.href = 'index.html';
        });
    }
});
