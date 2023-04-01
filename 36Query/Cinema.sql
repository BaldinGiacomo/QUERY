DROP DATABASE IF EXISTS Film;

CREATE DATABASE IF NOT EXISTS Film;

USE Film;

CREATE TABLE ATTORI (
CodAttore INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50) NOT NULL,
AnnoNascita INT NOT NULL,
Nazionalita VARCHAR(50) NOT NULL
);

CREATE TABLE FILM (
CodFilm INT PRIMARY KEY AUTO_INCREMENT,
Titolo VARCHAR(50) NOT NULL,
AnnoProduzione INT NOT NULL,
Nazionalita VARCHAR(50) NOT NULL,
Regista VARCHAR(50) NOT NULL,
Genere VARCHAR(50) NOT NULL
);

CREATE TABLE SALE (
CodSala INT PRIMARY KEY AUTO_INCREMENT,
Posti INT NOT NULL,
Nome VARCHAR(50) NOT NULL,
Città VARCHAR(50) NOT NULL
);

CREATE TABLE PROIEZIONI (
CodProiezione INT PRIMARY KEY AUTO_INCREMENT,
CodFilm INT NOT NULL,
CodSala INT NOT NULL,
Incasso DECIMAL(10,2) NOT NULL,
DataProiezione DATE NOT NULL,
FOREIGN KEY (CodFilm) REFERENCES FILM(CodFilm),
FOREIGN KEY (CodSala) REFERENCES SALE(CodSala)
);

CREATE TABLE RECITA (
CodAttore INT NOT NULL,
CodFilm INT NOT NULL,
PRIMARY KEY (CodAttore, CodFilm),
FOREIGN KEY (CodAttore) REFERENCES ATTORI(CodAttore),
FOREIGN KEY (CodFilm) REFERENCES FILM(CodFilm)
);

INSERT INTO ATTORI (Nome, AnnoNascita, Nazionalita)
VALUES
('Brad Pitt', 1963, 'USA'),
('Angela Bassett', 1958, 'USA'),
('Scarlett Johansson', 1984, 'USA'),
('Tom Hanks', 1956, 'USA'),
('Giancarlo Giannini', 1942, 'Italia'),
('Isabelle Huppert', 1953, 'Francia'),
('Keanu Reeves', 1964, 'Canada'),
('Uma Thurman', 1970, 'USA'),
('Robert De Niro', 1943, 'USA');

INSERT INTO FILM (Titolo, AnnoProduzione, Nazionalita, Regista, Genere)
VALUES
('Pulp Fiction', 1994, 'USA', 'Quentin Tarantino', 'Crime'),
('Kill Bill: Vol. 1', 2003, 'USA', 'Quentin Tarantino', 'Action'),
('Kill Bill: Vol. 2', 2004, 'USA', 'Quentin Tarantino', 'Action'),
('Inception', 2010, 'USA', 'Christopher Nolan', 'Sci-Fi'),
('The Dark Knight', 2008, 'USA', 'Christopher Nolan', 'Action'),
('The Dark Knight Rises', 2012, 'USA', 'Christopher Nolan', 'Action'),
('Wakanda Forever', 2022, 'USA', 'Ryan Coogler', 'Action'),
('Wakanda Finito', 2022, 'USA', 'Ryan Coogler', 'Action'),
('Blade Runner 2049', 2017, 'USA', 'Denis Villeneuve', 'Sci-Fi'),
('La Double Vie de Véronique', 1991, 'Francia', 'Krzysztof Kieślowski', 'Drama'),
('Matrix', 1999, 'USA', 'The Wachowskis', 'Sci-Fi'),
('Hofinitoinomi', 2003, 'Francia', 'The Wachowskis', 'Sci-Fi'),
('Nonsoqualimettere', 1989, 'Giappone', 'The Wachowskis', 'Sci-Fi'),
('Giapponefilm2', 1992, 'Giappone', 'The Wachowskis', 'Sci-Fi');

INSERT INTO SALE (CodSala, Posti, Nome, Città) VALUES
(1, 200, 'Cinema City', 'Napoli'),
(2, 150, 'Cinema Roma', 'Napoli'),
(3, 300, 'Cinema Odeon', 'Roma'),
(4, 180, 'Cinema Italia', 'Roma'),
(5, 120, 'Cinema Lux', 'Torino'),
(6, 250, 'Cinema Royal', 'Torino'),
(7, 220, 'Cinema Garibaldi', 'Torino');

INSERT INTO PROIEZIONI (CodFilm, CodSala, Incasso, DataProiezione)
VALUES
(3, 1, 20000, '2022-12-25'),
(7, 6, 5000, '2021-11-26'),
(11, 5, 5000, '2021-11-26'),
(7, 6, 5000, '2021-11-25'),
(7, 6, 5000, '2021-11-26');