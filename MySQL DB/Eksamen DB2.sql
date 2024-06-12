CREATE DATABASE utvikling;
USE utvikling;

DROP TABLE prosjekter
DROP TABLE prosjektarbeidere

CREATE TABLE prosjekter (
    prosjekt_id INT AUTO_INCREMENT PRIMARY KEY,
    prosjekt_navn VARCHAR(50),
    prosjekt_beskrivelse VARCHAR(255),
    prosjekt_leder_id INT
);

CREATE TABLE prosjektarbeidere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(50),
    er_prosjektleder BOOLEAN DEFAULT FALSE,
    prosjekt_id INT,
    FOREIGN KEY (prosjekt_id) REFERENCES prosjekter(prosjekt_id)
);

INSERT INTO prosjekter (prosjekt_navn, prosjekt_beskrivelse, prosjekt_leder_id) VALUES
    ("HyperTrack", "En avansert webapplikasjon for prosjektstyring som kombinerer real-time samarbeid, integrasjon med populære verktøy, og intelligent oppgavesporing for å optimalisere teamets produktivitet.", 1),
    ("NexusCRM", "En innovativ mobilapplikasjon for kundeadministrasjon som leverer AI-drevne innsikter, automatiserte markedsføringskampanjer, og en sømløs brukeropplevelse for å styrke kundeforholdene.", 11),
    ("DataForge", "Et kraftig automatiseringsverktøy for databehandling som tilbyr skalerbar datarensing, transformasjon og analyse, designet for å håndtere store datamengder med høy presisjon og hastighet.", 21);

INSERT INTO prosjektarbeidere (navn, er_prosjektleder, prosjekt_id) VALUES
    ('Erik Hansen', true, 1),
    ('Mette Christensen', false, 1),
    ('Sara Pedersen', false, 1),
    ('Anders Pedersen', false, 1),
    ('Sofia Nilsen', false, 1),
    ('Thomas Bakke', false, 1),
    ('Henrik Larsen', false, 1),
    ('Andreas Sørensen', false, 1),
    ('Anna Berg', false, 1),
    ('Maria Olsen', false, 1),
    ('Ingrid Kristiansen', true, 2),
    ('Julie Pedersen', false, 2),
    ('Ida Olsen', false, 2),
    ('Martin Andersen', false, 2),
    ('Andreas Kristoffersen', false, 2),
    ('Nora Lund', false, 2),
    ('Kristian Jensen', false, 2),
    ('Sander Eriksen', false, 2),
    ('Anders Olsen', false, 2),
    ('Emilie Johansen', false, 2),
    ('Lars Haugen', true, 3),
    ('Marius Bakken', false, 3),
    ('Oscar Gundersen', false, 3),
    ('Jonas Andersson', false, 3),
    ('Silje Larsen', false, 3),
    ('Hanna Svendsen', false, 3),
    ('Ingrid Andersson', false, 3),
    ('Emma Nilsen', false, 3),
    ('Andreas Pedersen', false, 3);
    
SELECT * FROM prosjektarbeidere;
SELECT prosjekt_navn, prosjekt_beskrivelse From prosjekter;

SELECT navn FROM prosjektarbeidere WHERE er_prosjektleder = TRUE;

SELECT * FROM prosjektarbeidere WHERE prosjekt_id = 1;

SELECT 
    prosjekter.prosjekt_navn AS prosjektnavn,            -- Hent kolonnen 'prosjekt_navn' fra tabellen 'prosjekter' og gi den aliaset 'prosjektnavn'.
    prosjektarbeidere_leder.navn AS prosjektleder,       -- Hent kolonnen 'navn' fra tabellen 'prosjektarbeidere' for prosjektleder og gi den aliaset 'prosjektleder'.
    prosjektarbeidere_arbeider.navn AS prosjektarbeider  -- Hent kolonnen 'navn' fra tabellen 'prosjektarbeidere' for prosjektarbeidere og gi den aliaset 'prosjektarbeider'.
FROM 
    prosjekter
LEFT JOIN 
    prosjektarbeidere prosjektarbeidere_leder ON prosjekter.prosjekt_leder_id = prosjektarbeidere_leder.id   -- Venstre join med 'prosjektarbeidere' for prosjektlederen, koblet på 'prosjekt_leder_id' og 'id'.
LEFT JOIN 
    prosjektarbeidere prosjektarbeidere_arbeider ON prosjekter.prosjekt_id = prosjektarbeidere_arbeider.prosjekt_id  -- Venstre join med 'prosjektarbeidere' for prosjektarbeiderne, koblet på 'prosjekt_id' og 'prosjekt_id'.