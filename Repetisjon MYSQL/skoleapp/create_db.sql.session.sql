--@block Lag databasen hvis den mangler
CREATE DATABASE skole;

--@block SLETT HELE DATABASEN
DROP DATABASE skole;
--@block Bruk databasen skole
USE skole;

--@block Slett tabeller
DROP TABLE elever_kurs;
DROP TABLE kurs;
DROP TABLE lærere;
DROP TABLE elever;


--@block Lag tabellene
-- Opprettelse av elever tabellen
CREATE TABLE elever (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornavn VARCHAR(100),
    etternavn VARCHAR(100),
    klasse VARCHAR(4),
    brukernavn VARCHAR(50),
    passord VARCHAR(255)
);

-- Opprettelse av lærere tabellen
CREATE TABLE lærere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornavn VARCHAR(100),
    etternavn VARCHAR(100),
    brukernavn VARCHAR(50) UNIQUE,
    passord VARCHAR(255)
);

-- Opprettelse av kurs tabellen
CREATE TABLE kurs (
    kursid VARCHAR(15) PRIMARY KEY,
    kurskode VARCHAR(10),
    kursnavn VARCHAR(100),
    lærer_id INT,
    instansnummer INT,
    FOREIGN KEY (lærer_id) REFERENCES lærere(id)
);

-- Opprettelse av elever_kurs tabellen
CREATE TABLE elever_kurs (
    elev_id INT,
    kursid VARCHAR(15),
    karakter CHAR(2),
    PRIMARY KEY (elev_id, kursid),
    FOREIGN KEY (elev_id) REFERENCES elever(id),
    FOREIGN KEY (kursid) REFERENCES kurs(kursid)
);

-- Se filen fill_tables_with_data.sql for å fylle db med data


--@block Sett inn data i lærere
INSERT INTO lærere (fornavn, etternavn, brukernavn, passord) VALUES 
('John', 'Doe', 'johdoe', 'johdoe123'), 
('Jane', 'Smith', 'jansith', 'jansith123'),
('Paul', 'Brown', 'paurown', 'paurown123'),
('Emily', 'Davis', 'emidvis', 'emidvis123'),
('Michael', 'Wilson', 'miclson', 'miclson123'),
('Linda', 'Taylor', 'lindlor', 'lindlor123');

-- Sett inn data i kurs
INSERT INTO kurs (kursid, kurskode, kursnavn, lærer_id, instansnummer) VALUES 
('MATH101-1', 'MATH101', 'Matematikk 101', 1, 1),
('MATH102-1', 'MATH102', 'Matematikk 102', 1, 1),
('SCI201-1', 'SCI201', 'Vitenskap 201', 2, 1),
('SCI202-1', 'SCI202', 'Vitenskap 202', 2, 1),
('ENG301-1', 'ENG301', 'Engelsk 301', 3, 1),
('ENG302-1', 'ENG302', 'Engelsk 302', 3, 1),
('HIS101-1', 'HIS101', 'Historie 101', 4, 1),
('HIS102-1', 'HIS102', 'Historie 102', 4, 1);
-- Sett inn data i elever
INSERT INTO elever (fornavn, etternavn, klasse, brukernavn, passord) VALUES
('Per', 'Haugen', '1B', 'pergen', 'pergen123'),
('Mona', 'Larsen', '1A', 'monsen', 'monsen123'),
('Per', 'Andersen', '2A', 'perand', 'perand123'),
('Jon', 'Olsen', '1B', 'jonsen', 'jonsen123'),
('Ola', 'Lie', '1B', 'olalie', 'olalie123'),
('Tom', 'Johansen', '2B', 'tomsen', 'tomsen123'),
('Lise', 'Larsen', '2B', 'lissen', 'lissen123'),
('Ann', 'Nordmann', '2A', 'annann', 'annann123'),
('Per', 'Andersen', '2B', 'persen', 'persen123'),
('Jon', 'Andersen', '2A', 'jonsen', 'jonsen123'),
('Ann', 'Johansen', '2B', 'annsen', 'annsen123'),
('Eva', 'Johansen', '1B', 'evasen', 'evasen123'),
('Lise', 'Nilsen', '2A', 'lissen', 'lissen123'),
('Mona', 'Andersen', '2A', 'monsen', 'monsen123'),
('Tom', 'Larsen', '1B', 'tomsen', 'tomsen123'),
('Nils', 'Haugen', '2B', 'nilgen', 'nilgen123'),
('Eva', 'Haugen', '2B', 'evagen', 'evagen123'),
('Eva', 'Haugen', '2B', 'evagen', 'evagen123'),
('Nils', 'Nilsen', '1A', 'nilsen', 'nilsen123'),
('Ann', 'Olsen', '1B', 'annsen', 'annsen123'),
('Per', 'Nilsen', '1A', 'persen', 'persen123'),
('Tom', 'Larsen', '1A', 'tomsen', 'tomsen123'),
('Jon', 'Johansen', '2B', 'jonsen', 'jonsen123'),
('Eva', 'Nilsen', '2A', 'evasen', 'evasen123'),
('Nils', 'Andersen', '1B', 'nilsen', 'nilsen123'),
('Kari', 'Lie', '2A', 'karlie', 'karlie123'),
('Ann', 'Haugen', '2A', 'anngen', 'anngen123'),
('Ann', 'Andersen', '2B', 'annsen', 'annsen123'),
('Jon', 'Berg', '2A', 'jonerg', 'jonerg123'),
('Ola', 'Andersen', '2B', 'olasen', 'olasen123'),
('Eva', 'Berg', '1A', 'evaerg', 'evaerg123'),
('Nils', 'Olsen', '2B', 'nilsen', 'nilsen123'),
('Ola', 'Larsen', '1B', 'olasen', 'olasen123'),
('Tom', 'Nilsen', '1A', 'tomsen', 'tomsen123'),
('Ann', 'Olsen', '1B', 'annsen', 'annsen123'),
('Jon', 'Haugen', '1A', 'jongen', 'jongen123'),
('Jon', 'Andersen', '2A', 'jonsen', 'jonsen123'),
('Jon', 'Haugen', '2A', 'jongen', 'jongen123'),
('Eva', 'Andersen', '1B', 'evasen', 'evasen123'),
('Nils', 'Larsen', '2B', 'nilsen', 'nilsen123'),
('Mona', 'Nordmann', '2A', 'monann', 'monann123'),
('Eva', 'Andersen', '1B', 'evasen', 'evasen123'),
('Mona', 'Lie', '2B', 'monlie', 'monlie123'),
('Ann', 'Olsen', '1A', 'annsen', 'annsen123'),
('Jon', 'Berg', '2A', 'jonerg', 'jonerg123'),
('Ann', 'Andersen', '2A', 'annsen', 'annsen123'),
('Mona', 'Haugen', '2A', 'mongen', 'mongen123'),
('Nils', 'Nilsen', '2A', 'nilsen', 'nilsen123'),
('Ola', 'Olsen', '2A', 'olasen', 'olasen123'),
('Ann', 'Haugen', '2A', 'anngen', 'anngen123'),
('Jon', 'Hansen', '1A', 'jonsen', 'jonsen123'),
('Lise', 'Johansen', '1B', 'lissen', 'lissen123'),
('Lise', 'Berg', '2A', 'liserg', 'liserg123'),
('Jon', 'Hansen', '2A', 'jonsen', 'jonsen123'),
('Eva', 'Olsen', '1A', 'evasen', 'evasen123'),
('Jon', 'Olsen', '2A', 'jonsen', 'jonsen123'),
('Kari', 'Larsen', '1B', 'karsen', 'karsen123'),
('Kari', 'Larsen', '2B', 'karsen', 'karsen123'),
('Nils', 'Lie', '2A', 'nillie', 'nillie123'),
('Tom', 'Haugen', '2A', 'tomgen', 'tomgen123');
-- Registrer elever i kurs
INSERT INTO elever_kurs (elev_id, kursid, karakter) VALUES
(1, 'ENG302-1', 'A'),
(1, 'HIS102-1', 'E'),
(1, 'MATH102-1', 'D'),
(1, 'SCI202-1', 'A'),
(2, 'ENG302-1', 'C'),
(2, 'SCI202-1', 'A'),
(2, 'HIS102-1', 'A'),
(2, 'ENG301-1', 'E'),
(3, 'ENG301-1', 'D'),
(3, 'HIS102-1', 'B'),
(3, 'SCI201-1', 'A'),
(3, 'MATH102-1', 'F'),
(4, 'HIS102-1', 'F'),
(4, 'MATH102-1', 'F'),
(4, 'MATH101-1', 'B'),
(4, 'ENG301-1', 'C'),
(5, 'ENG301-1', 'E'),
(5, 'SCI201-1', 'A'),
(5, 'ENG302-1', 'C'),
(5, 'SCI202-1', 'D'),
(6, 'MATH101-1', 'D'),
(6, 'SCI202-1', 'F'),
(6, 'SCI201-1', 'D'),
(6, 'MATH102-1', 'F'),
(7, 'MATH101-1', 'D'),
(7, 'HIS102-1', 'A'),
(7, 'MATH102-1', 'C'),
(7, 'SCI201-1', 'C'),
(8, 'ENG302-1', 'A'),
(8, 'MATH101-1', 'F'),
(8, 'ENG301-1', 'D'),
(8, 'SCI202-1', 'D'),
(9, 'SCI202-1', 'E'),
(9, 'ENG301-1', 'B'),
(9, 'HIS101-1', 'B'),
(9, 'MATH102-1', 'C'),
(10, 'SCI201-1', 'F'),
(10, 'HIS102-1', 'B'),
(10, 'ENG301-1', 'F'),
(10, 'MATH101-1', 'E'),
(11, 'HIS101-1', 'E'),
(11, 'SCI202-1', 'C'),
(11, 'ENG302-1', 'B'),
(11, 'ENG301-1', 'C'),
(12, 'SCI201-1', 'D'),
(12, 'SCI202-1', 'C'),
(12, 'ENG301-1', 'D'),
(12, 'MATH101-1', 'C'),
(13, 'HIS102-1', 'B'),
(13, 'SCI201-1', 'A'),
(13, 'SCI202-1', 'A'),
(13, 'HIS101-1', 'E'),
(14, 'HIS102-1', 'E'),
(14, 'HIS101-1', 'F'),
(14, 'SCI202-1', 'E'),
(14, 'ENG302-1', 'E'),
(15, 'HIS102-1', 'E'),
(15, 'SCI202-1', 'A'),
(15, 'ENG301-1', 'F'),
(15, 'ENG302-1', 'E'),
(16, 'HIS101-1', 'D'),
(16, 'SCI201-1', 'A'),
(16, 'MATH101-1', 'C'),
(16, 'ENG302-1', 'D'),
(17, 'SCI202-1', 'C'),
(17, 'ENG301-1', 'E'),
(17, 'HIS102-1', 'A'),
(17, 'HIS101-1', 'B'),
(18, 'MATH102-1', 'C'),
(18, 'MATH101-1', 'F'),
(18, 'HIS102-1', 'E'),
(18, 'SCI202-1', 'B'),
(19, 'MATH102-1', 'C'),
(19, 'MATH101-1', 'E'),
(19, 'SCI201-1', 'F'),
(19, 'HIS101-1', 'F'),
(20, 'ENG302-1', 'C'),
(20, 'HIS102-1', 'B'),
(20, 'MATH102-1', 'B'),
(20, 'SCI202-1', 'C'),
(21, 'SCI201-1', 'F'),
(21, 'MATH102-1', 'E'),
(21, 'HIS101-1', 'E'),
(21, 'SCI202-1', 'A'),
(22, 'HIS102-1', 'E'),
(22, 'MATH102-1', 'D'),
(22, 'MATH101-1', 'B'),
(22, 'ENG301-1', 'D'),
(23, 'SCI201-1', 'D'),
(23, 'ENG302-1', 'F'),
(23, 'HIS102-1', 'E'),
(23, 'ENG301-1', 'F'),
(24, 'HIS101-1', 'A'),
(24, 'HIS102-1', 'B'),
(24, 'MATH101-1', 'C'),
(24, 'ENG301-1', 'C'),
(25, 'SCI201-1', 'D'),
(25, 'MATH102-1', 'D'),
(25, 'ENG302-1', 'E'),
(25, 'ENG301-1', 'E'),
(26, 'MATH101-1', 'F'),
(26, 'ENG302-1', 'E'),
(26, 'MATH102-1', 'B'),
(26, 'SCI202-1', 'B'),
(27, 'SCI202-1', 'B'),
(27, 'SCI201-1', 'A'),
(27, 'MATH102-1', 'C'),
(27, 'ENG301-1', 'B'),
(28, 'MATH101-1', 'B'),
(28, 'SCI201-1', 'E'),
(28, 'HIS102-1', 'B'),
(28, 'SCI202-1', 'C'),
(29, 'MATH101-1', 'D'),
(29, 'HIS102-1', 'C'),
(29, 'SCI201-1', 'B'),
(29, 'ENG302-1', 'A'),
(30, 'MATH102-1', 'E'),
(30, 'MATH101-1', 'A'),
(30, 'HIS101-1', 'C'),
(30, 'ENG302-1', 'D'),
(31, 'SCI201-1', 'B'),
(31, 'SCI202-1', 'F'),
(31, 'ENG302-1', 'E'),
(31, 'MATH102-1', 'C'),
(32, 'SCI202-1', 'C'),
(32, 'HIS102-1', 'C'),
(32, 'HIS101-1', 'B'),
(32, 'MATH102-1', 'E'),
(33, 'MATH102-1', 'C'),
(33, 'ENG301-1', 'A'),
(33, 'HIS101-1', 'F'),
(33, 'MATH101-1', 'B'),
(34, 'MATH101-1', 'E'),
(34, 'SCI202-1', 'F'),
(34, 'HIS102-1', 'B'),
(34, 'ENG302-1', 'B'),
(35, 'MATH101-1', 'F'),
(35, 'SCI201-1', 'C'),
(35, 'HIS101-1', 'C'),
(35, 'HIS102-1', 'C'),
(36, 'HIS101-1', 'B'),
(36, 'HIS102-1', 'E'),
(36, 'ENG302-1', 'D'),
(36, 'SCI201-1', 'E'),
(37, 'SCI202-1', 'F'),
(37, 'MATH102-1', 'D'),
(37, 'ENG302-1', 'E'),
(37, 'HIS101-1', 'F'),
(38, 'SCI201-1', 'E'),
(38, 'HIS101-1', 'F'),
(38, 'ENG301-1', 'A'),
(38, 'MATH101-1', 'F'),
(39, 'MATH102-1', 'D'),
(39, 'HIS101-1', 'C'),
(39, 'ENG302-1', 'D'),
(39, 'ENG301-1', 'E'),
(40, 'HIS101-1', 'A'),
(40, 'MATH102-1', 'A'),
(40, 'SCI202-1', 'A'),
(40, 'HIS102-1', 'E'),
(41, 'SCI201-1', 'E'),
(41, 'ENG302-1', 'B'),
(41, 'HIS101-1', 'C'),
(41, 'MATH101-1', 'E'),
(42, 'MATH101-1', 'D'),
(42, 'HIS102-1', 'B'),
(42, 'HIS101-1', 'B'),
(42, 'ENG301-1', 'B'),
(43, 'SCI201-1', 'C'),
(43, 'ENG301-1', 'D'),
(43, 'MATH101-1', 'D'),
(43, 'MATH102-1', 'E'),
(44, 'HIS101-1', 'B'),
(44, 'HIS102-1', 'E'),
(44, 'MATH102-1', 'A'),
(44, 'SCI201-1', 'C'),
(45, 'SCI202-1', 'F'),
(45, 'MATH102-1', 'D'),
(45, 'SCI201-1', 'B'),
(45, 'HIS102-1', 'A'),
(46, 'HIS102-1', 'E'),
(46, 'MATH101-1', 'D'),
(46, 'MATH102-1', 'A'),
(46, 'HIS101-1', 'A'),
(47, 'SCI201-1', 'D'),
(47, 'MATH101-1', 'F'),
(47, 'MATH102-1', 'D'),
(47, 'HIS101-1', 'D'),
(48, 'ENG301-1', 'F'),
(48, 'SCI201-1', 'D'),
(48, 'HIS101-1', 'B'),
(48, 'ENG302-1', 'C'),
(49, 'ENG302-1', 'D'),
(49, 'ENG301-1', 'C'),
(49, 'SCI202-1', 'F'),
(49, 'MATH101-1', 'D'),
(50, 'MATH101-1', 'B'),
(50, 'SCI202-1', 'D'),
(50, 'SCI201-1', 'F'),
(50, 'ENG301-1', 'D'),
(51, 'ENG301-1', 'A'),
(51, 'HIS102-1', 'E'),
(51, 'SCI202-1', 'C'),
(51, 'ENG302-1', 'C'),
(52, 'SCI202-1', 'D'),
(52, 'MATH101-1', 'B'),
(52, 'ENG302-1', 'C'),
(52, 'SCI201-1', 'D'),
(53, 'HIS101-1', 'F'),
(53, 'ENG301-1', 'E'),
(53, 'ENG302-1', 'B'),
(53, 'MATH102-1', 'C'),
(54, 'ENG302-1', 'A'),
(54, 'MATH102-1', 'E'),
(54, 'HIS102-1', 'F'),
(54, 'SCI202-1', 'E'),
(55, 'SCI202-1', 'F'),
(55, 'MATH102-1', 'C'),
(55, 'HIS102-1', 'A'),
(55, 'SCI201-1', 'C'),
(56, 'HIS102-1', 'D'),
(56, 'ENG302-1', 'A'),
(56, 'SCI201-1', 'A'),
(56, 'MATH102-1', 'B'),
(57, 'MATH101-1', 'C'),
(57, 'SCI201-1', 'B'),
(57, 'ENG301-1', 'C'),
(57, 'SCI202-1', 'D'),
(58, 'SCI201-1', 'F'),
(58, 'SCI202-1', 'A'),
(58, 'ENG302-1', 'E'),
(58, 'MATH102-1', 'A'),
(59, 'HIS101-1', 'C'),
(59, 'SCI201-1', 'B'),
(59, 'ENG302-1', 'B'),
(59, 'MATH102-1', 'E'),
(60, 'MATH102-1', 'E'),
(60, 'ENG302-1', 'A'),
(60, 'HIS101-1', 'A'),
(60, 'MATH101-1', 'B');