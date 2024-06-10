-- Opprett database
create database BetaTechSolutions;
use BetaTechSolutions;
drop table ansatte;
drop table avdeling;
drop table prosjekter;
drop database BetaTechSolutions;
 
CREATE TABLE ansatte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornavn VARCHAR(50) NOT NULL,
    etternavn VARCHAR(50) NOT NULL,
    fodselsdato DATE,
	avdeling_navn VARCHAR(50),
    admin_tilgang boolean default false,
    epost VARCHAR(100),
    telefon_nummer VARCHAR(20),
    addresse VARCHAR (255),
    post_nummer varchar(4),
    kontonummer varchar(34)NOT NULL UNIQUE,
    FOREIGN KEY (avdeling_navn) REFERENCES avdeling(navn)
);

CREATE TABLE avdeling (
    id INT AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(50),
    beskrivelse VARCHAR(100),
    INDEX avdeling_navn_index (navn)
);
 
create table if not EXISTS prosjekter(
id INT AUTO_INCREMENT PRIMARY KEY,
prosjekt_navn varchar (255),
prosjekt_leder_id int,
prosjekt_beskrivelse text,
avdeling_id int,
FOREIGN KEY (prosjekt_leder_id) REFERENCES ansatte(id),
FOREIGN KEY (avdeling_id) REFERENCES avdeling(id)
);
 
INSERT INTO avdeling (navn, beskrivelse) VALUES 
('Softwareutvikling', 'Team som utvikler programvare'),
('Nettverksadministrasjon', 'Team som administrerer nettverk'),
('Teknisk support', 'Team som gir teknisk støtte'),
('Kantinetjeneste', 'Team som driver kantinen'),
('Datasenter', 'Team som administrerer datasenteret');
 
insert into persondata (fornavn, etternavn, avdeling, fodselsdato, email, telefon_nummer, address, post_nummer, kontonummer) values
()
INSERT INTO ansatte (fornavn, etternavn, fodselsdato, avdeling_navn, har_tilgang, epost, kontonummer) VALUES 
-- Softwareutvikling (30 ansatte)
('Ole', 'Hansen', '1985-01-15', 'Softwareutvikling', false, 'ole@betatech.no', '1234567890'),
 
INSERT INTO ansatte (fornavn, etternavn, fodselsdato, admin_tilgang, epost, telefon_nummer, addresse, post_nummer, kontonummer, avdeling_navn) VALUES
-- Softwareutvikling (30 ansatte)
('Erik', 'Hansen', '1985-03-15', false, 'erik.hansen@example.com', '+47 12345678', 'Storgata 1', 0123, 123456789, 'Softwareutvikling'),
('Maria', 'Olsen', '1990-07-22', false, 'maria.olsen@example.com', '+47 87654321', 'Lilleveien 12', 0456, 987654321, 'Softwareutvikling'),
('Anders', 'Pedersen', '1988-11-05', false, 'anders.pedersen@example.com', '+47 23456789', 'Bakkegata 7', 0789, 456789123, 'Softwareutvikling'),
('Ingrid', 'Kristiansen', '1995-04-30', false, 'ingrid.kristiansen@example.com', '+47 76543210', 'Nordveien 23', 0987, 789123456, 'Softwareutvikling'),
('Martin', 'Andersen', '1983-09-10', false, 'martin.andersen@example.com', '+47 34567890', 'Sørveien 45', 0654, 321654987, 'Softwareutvikling'),
('Anna', 'Berg', '1992-12-18', false, 'anna.berg@example.com', '+47 99887766', 'Skogveien 8', 0345, 654321987, 'Softwareutvikling'),
('Henrik', 'Larsen', '1987-06-25', false, 'henrik.larsen@example.com', '+47 11223344', 'Fjellgata 14', 0765, 987123654, 'Softwareutvikling'),
('Sofia', 'Nilsen', '1993-09-03', false, 'sofia.nilsen@example.com', '+47 33445566', 'Strandgata 20', 0987, 456987123, 'Softwareutvikling'),
('Kristian', 'Jensen', '1989-04-12', false, 'kristian.jensen@example.com', '+47 55667788', 'Parkveien 5', 0234, 789456123, 'Softwareutvikling'),
('Sara', 'Pedersen', '1996-07-29', false, 'sara.pedersen@example.com', '+47 99887755', 'Elvegata 3', 0567, 321987654, 'Softwareutvikling'),
('Andreas', 'Sørensen', '1991-08-14', false, 'andreas.sorensen@example.com', '+47 22334455', 'Bakken 2', 0789, 654123987, 'Softwareutvikling'),
('Mette', 'Christensen', '1994-03-27', false, 'mette.christensen@example.com', '+47 99887766', 'Havnegata 10', 0456, 987654123, 'Softwareutvikling'),
('Thomas', 'Bakke', '1986-11-09', false, 'thomas.bakke@example.com', '+47 11223344', 'Løkkeveien 7', 0234, 456789321, 'Softwareutvikling'),
('Ida', 'Olsen', '1990-05-18', false, 'ida.olsen@example.com', '+47 33445566', 'Nygata 15', 0987, 789123654, 'Softwareutvikling'),
('Jonas', 'Andersson', '1984-09-30', false, 'jonas.andersson@example.com', '+47 99887755', 'Smedgata 4', 0654, 321987456, 'Softwareutvikling'),
('Maria', 'Petersen', '1987-02-11', false, 'maria.petersen@example.com', '+47 11223366', 'Bergveien 22', 0123, 456321789, 'Softwareutvikling'),
('Emilie', 'Johansen', '1993-06-22', false, 'emilie.johansen@example.com', '+47 44556677', 'Hageveien 3', 0345, 789654321, 'Softwareutvikling'),
('Oscar', 'Gundersen', '1988-10-08', false, 'oscar.gundersen@example.com', '+47 55667788', 'Torggata 18', 0765, 123987456, 'Softwareutvikling'),
('Nora', 'Lund', '1995-04-03', false, 'nora.lund@example.com', '+47 33445588', 'Bølgeveien 11', 0567, 654321789, 'Softwareutvikling'),
('Elias', 'Jensen', '1983-12-20', false, 'elias.jensen@example.com', '+47 99887799', 'Sjøgata 6', 0345, 987654321, 'Softwareutvikling'),
('Lars', 'Haugen', '1992-05-17', false, 'lars.haugen@example.com', '+47 22334455', 'Bekkeveien 4', 0123, 456123789, 'Softwareutvikling'),
('Ingrid', 'Andersson', '1993-09-21', false, 'ingrid.andersson@example.com', '+47 99887766', 'Skolegata 9', 0456, 789456123, 'Softwareutvikling'),
('Andreas', 'Kristoffersen', '1987-11-28', false, 'andreas.kristoffersen@example.com', '+47 11223344', 'Blomsterveien 16', 0234, 321987654, 'Softwareutvikling'),
('Hanna', 'Svendsen', '1990-03-14', false,'hanna.svendsen@example.com', '+47 33445566', 'Kirkegata 3', 0987, 654789123, 'Softwareutvikling'),
('Marius', 'Bakken', '1984-07-09', false,'marius.bakken@example.com', '+47 99887755', 'Bryggeveien 7', 0654, 987321654, 'Softwareutvikling'),
('Julie', 'Pedersen', '1989-01-26', false,'julie.pedersen@example.com', '+47 11223366', 'Skogveien 5', 0789, 123456789, 'Softwareutvikling'),
('Anders', 'Olsen', '1995-08-05', false,'anders.olsen@example.com', '+47 44556677', 'Fjellveien 12', 0345, 456789123, 'Softwareutvikling'),
('Silje', 'Larsen', '1988-12-11', false,'silje.larsen@example.com', '+47 55667788', 'Strandveien 8', 0765, 789123456, 'Softwareutvikling'),
('Sander', 'Eriksen', '1994-04-29', false,'sander.eriksen@example.com', '+47 33445588', 'Havnegata 22', 0567, 321654987, 'Softwareutvikling'),
('Emma', 'Nilsen', '1983-10-15', false,'emma.nilsen@example.com', '+47 99887799', 'Nygata 7', 0345, 654987321, 'Softwareutvikling'),

-- Nettverksadministrasjon (6 ansatte)
('Anders', 'Svendsen', '1990-08-14', true, 'anders.svendsen@example.com', '+47 22334455', 'Fjellgata 12', 0123, 121212121, 'Nettverksadministrasjon'),
('Line', 'Jensen', '1985-03-27', true, 'line.jensen@example.com', '+47 99887766', 'Strandveien 9', 0456, 212121212, 'Nettverksadministrasjon'),
('Jon', 'Pedersen', '1987-11-08', true, 'jon.pedersen@example.com', '+47 11223344', 'Parkveien 16', 0234, 131313131, 'Nettverksadministrasjon'),
('Maria', 'Berg', '1993-05-14', true,'maria.berg@example.com', '+47 33445566', 'Havnegata 5', 0987, 313131313, 'Nettverksadministrasjon'),
('Per', 'Hansen', '1984-07-19', true,'per.hansen@example.com', '+47 99887755', 'Bakken 10', 0654, 141414141, 'Nettverksadministrasjon'),
('Ida', 'Olsen', '1989-01-26', true,'ida.olsen@example.com', '+47 11223366', 'Nygata 15', 0789, 414141414, 'Nettverksadministrasjon'),

-- Teknisk support (35 ansatte)
('Andreas', 'Johansen', '1992-05-17', false,'andreas.johansen@example.com', '+47 22334455', 'Smedgata 4', 0123, 151515151, 'Teknisk support'),
('Ingrid', 'Andersson', '1993-09-21', false, 'ingrid.andersson@example.com', '+47 99887766', 'Skolegata 9', 0456, 515151515, 'Teknisk support'),
('Andreas', 'Kristoffersen', '1987-11-28', false, 'andreas.kristoffersen@example.com', '+47 11223344', 'Blomsterveien 16', 0234, 161616161, 'Teknisk support'),
('Hanna', 'Svendsen', '1990-03-14', false, 'hanna.svendsen@example.com', '+47 33445566', 'Kirkegata 3', 0987, 616161616, 'Teknisk support'),
('Marius', 'Bakken', '1984-07-09', false, 'marius.bakken@example.com', '+47 99887755', 'Bryggeveien 7', 0654, 171717171, 'Teknisk support'),
('Julie', 'Pedersen', '1989-01-26', false, 'julie.pedersen@example.com', '+47 11223366', 'Skogveien 5', 0789, 717171717, 'Teknisk support'),
('Anders', 'Olsen', '1995-08-05', false, 'anders.olsen@example.com', '+47 44556677', 'Fjellveien 12', 0345, 181818181, 'Teknisk support'),
('Silje', 'Larsen', '1988-12-11', false, 'silje.larsen@example.com', '+47 55667788', 'Strandveien 8', 0765, 818181818, 'Teknisk support'),
('Sander', 'Eriksen', '1994-04-29', false, 'sander.eriksen@example.com', '+47 33445588', 'Havnegata 22', 0567, 191919191, 'Teknisk support'),
('Emma', 'Nilsen', '1983-10-15', false, 'emma.nilsen@example.com', '+47 99887799', 'Nygata 7', 0345, 919191919, 'Teknisk support'),
('Lars', 'Haugen', '1992-05-17', false, 'lars.haugen@example.com', '+47 22334455', 'Bekkeveien 4', 0123, 232323232, 'Teknisk support'),
('Andrea', 'Berg', '1991-11-15', false, 'andrea.berg@example.com', '+47 99887766', 'Fjordgata 19', 0456, 323232323, 'Teknisk support'),
('Erik', 'Kristensen', '1986-08-23', false, 'erik.kristensen@example.com', '+47 11223344', 'Parkveien 16', 0234, 242424242, 'Teknisk support'),
('Nora', 'Sørensen', '1993-04-14', false, 'nora.sorensen@example.com', '+47 33445566', 'Hageveien 5', 0987, 424242424, 'Teknisk support'),
('Thomas', 'Lund', '1988-06-09', false, 'thomas.lund@example.com', '+47 99887755', 'Skogveien 10', 0654, 252525252, 'Teknisk support'),
('Lars', 'Johansen', '1990-05-17', false, 'lars.johansen@example.com', '+47 22334455', 'Bekkeveien 4', 0123, 525252525, 'Teknisk support'),
('Ingrid', 'Hansen', '1993-09-21', false, 'ingrid.hansen@example.com', '+47 99887766', 'Skolegata 9', 0456, 262626262, 'Teknisk support'),
('Andreas', 'Andersson', '1987-11-28', false, 'andreas.andersson@example.com', '+47 11223344', 'Blomsterveien 16', 0234, 626262626, 'Teknisk support'),
('Hanna', 'Olsen', '1990-03-14', false, 'hanna.olsen@example.com', '+47 33445566', 'Kirkegata 3', 0987, 272727272, 'Teknisk support'),
('Marius', 'Svendsen', '1984-07-09', false, 'marius.svendsen@example.com', '+47 99887755', 'Bryggeveien 7', 0654, 727272727, 'Teknisk support'),
('Julie', 'Bakken', '1989-01-26', false, 'julie.bakken@example.com', '+47 11223366', 'Skogveien 5', 0789, 282828282, 'Teknisk support'),
('Anders', 'Pedersen', '1995-08-05', false, 'anders.pedersen@example.com', '+47 44556677', 'Fjellveien 12', 0345, 292929292, 'Teknisk support'),
('Silje', 'Kristiansen', '1988-12-11', false, 'silje.kristiansen@example.com', '+47 55667788', 'Strandveien 8', 0765, 828282828, 'Teknisk support'),
('Sander', 'Nilsen', '1994-04-29', false, 'sander.nilsen@example.com', '+47 33445588', 'Havnegata 22', 0567, 929292929, 'Teknisk support'),
('Emma', 'Andersen', '1983-10-15', false, 'emma.andersen@example.com', '+47 99887799', 'Nygata 7', 0345, 343434343, 'Teknisk support'),
('Lars', 'Jensen', '1992-05-17', false, 'lars.jensen@example.com', '+47 22334455', 'Bekkeveien 4', 0123, 434343434, 'Teknisk support'),
('Andrea', 'Sørensen', '1991-11-15', false, 'andrea.sorensen@example.com', '+47 99887766', 'Fjordgata 19', 0456, 353535353, 'Teknisk support'),
('Erik', 'Berg', '1986-08-23', false, 'erik.berg@example.com', '+47 11223344', 'Parkveien 16', 0234, 535353535, 'Teknisk support'),
('Nora', 'Kristensen', '1993-04-14', false, 'nora.kristensen@example.com', '+47 33445566', 'Hageveien 5', 0987, 363636363, 'Teknisk support'),
('Thomas', 'Olsen', '1988-06-09', false, 'thomas.olsen@example.com', '+47 99887755', 'Skogveien 10', 0654, 636363636, 'Teknisk support'),
('Helene', 'Johannessen', '1991-08-14', false, 'helene.johannessen@example.com', '+47 22334455', 'Bakkeveien 2', 0789, 373737373, 'Teknisk support'),
('Magnus', 'Eriksen', '1994-03-27', false, 'magnus.eriksen@example.com', '+47 99887766', 'Havnegata 10', 0456, 737373737, 'Teknisk support'),
('Sofie', 'Bakke', '1986-11-09', false, 'sofie.bakke@example.com', '+47 11223344', 'Løkkeveien 7', 0234, 383838383, 'Teknisk support'),
('Oscar', 'Olsen', '1990-05-18', false, 'oscar.olsen@example.com', '+47 33445566', 'Nygata 15', 0987, 838383838, 'Teknisk support'),
('Emma', 'Andersson', '1984-09-30', false, 'emma.andersson@example.com', '+47 99887755', 'Smedgata 4', 0654, 393939393, 'Teknisk support'),

-- Kantinetjeneste (4 ansatte)
('Camilla', 'Hansen', '1992-08-14', false, 'camilla.hansen@example.com', '+47 22334455', 'Kantineveien 2', 0789, 939393939, 'Kantinetjeneste'),
('Thomas', 'Andersen', '1994-03-27', false, 'thomas.andersen@example.com', '+47 99887766', 'Matveien 10', 0456, 454545454, 'Kantinetjeneste'),
('Kristine', 'Johansen', '1986-11-09', false, 'kristine.johansen@example.com', '+47 11223344', 'Spiseveien 7', 0234, 545454545, 'Kantinetjeneste'),
('Ole', 'Pedersen', '1990-05-18', false, 'ole.pedersen@example.com', '+47 33445566', 'Serveringsgata 15', 0987, 464646464, 'Kantinetjeneste'),

-- Datasenter (15 ansatte)
('Mathias', 'Larsen', '1992-05-17', false, 'mathias.larsen@example.com', '+47 22334455', 'Serverveien 4', 0123, 646464646, 'Datasenter'),
('Andrine', 'Andersson', '1993-09-21', false, 'andrine.andersson@example.com', '+47 99887766', 'Rackgata 9', 0456, 474747474, 'Datasenter'),
('Jørgen', 'Kristoffersen', '1987-11-28', false, 'jorgen.kristoffersen@example.com', '+47 11223344', 'Cloudveien 16', 0234, 747474747, 'Datasenter'),
('Marie', 'Svendsen', '1990-03-14', false, 'marie.svendsen@example.com', '+47 33445566', 'Servergata 3', 0987, 484848484, 'Datasenter'),
('Erik', 'Bakken', '1984-07-09', false, 'erik.bakken@example.com', '+47 99887755', 'Databaseveien 7', 0654, 848484848, 'Datasenter'),
('Anna', 'Pedersen', '1989-01-26', false, 'anna.pedersen@example.com', '+47 11223366', 'Nettverksgata 5', 0789, 494949494, 'Datasenter'),
('Kristoffer', 'Olsen', '1995-08-05', false, 'kristoffer.olsen@example.com', '+47 44556677', 'Storageveien 12', 0345, 949494949, 'Datasenter'),
('Emilie', 'Larsen', '1988-12-11', false, 'emilie.larsen@example.com', '+47 55667788', 'Backupveien 8', 0765, 565656565, 'Datasenter'),
('Jonas', 'Eriksen', '1994-04-29', false, 'jonas.eriksen@example.com', '+47 33445588', 'Virtualiseringstunet 22', 0567, 656565656, 'Datasenter'),
('Henriette', 'Nilsen', '1983-10-15', false, 'henriette.nilsen@example.com', '+47 99887799', 'Hardwaregata 7', 0345, 575757575, 'Datasenter'),
('Andreas', 'Johansen', '1991-08-14', false, 'andreas.johansen@example.com', '+47 22334455', 'Serverveien 4', 0123, 757575757, 'Datasenter'),
('Ingrid', 'Hansen', '1993-09-21', false, 'ingrid.hansen@example.com', '+47 99887766', 'Rackgata 9', 0456, 585858585, 'Datasenter'),
('Andreas', 'Andersson', '1987-11-28', false, 'andreas.andersson@example.com', '+47 11223344', 'Cloudveien 16', 0234, 858585858, 'Datasenter'),
('Hanna', 'Svendsen', '1990-03-14', false, 'hanna.svendsen@example.com', '+47 33445566', 'Servergata 3', 0987, 595959595, 'Datasenter'),
('Marius', 'Bakken', '1984-07-09', false, 'marius.bakken@example.com', '+47 99887755', 'Databaseveien 7', 0654, 959595959, 'Datasenter');
