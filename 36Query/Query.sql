1- Il nome di tutte le sale di Napoli 
SELECT Nome FROM Sale WHERE città="Napoli"

2- Il titolo dei film di Quentin Tarantino prodotti dopo il 1990
SELECT Titolo FROM Film WHERE AnnoProduzione>1990 AND Regista="Quentin Tarantino"

3- Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990
SELECT Titolo FROM Film WHERE Film.genere="Fantascienza" AND AnnoProduzione>1990 AND (Nazionalità="Giapponese" OR "Francese")

4- Il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi 
SELECT Titolo FROM Film WHERE Film.genere="Fantascienza" AND AnnoProduzione>1990 AND (Nazionalità="Giapponese" OR "Francese")

5- I titolo dei film dello stesso regista di “Wakanda Forever” 
SELECT Titolo FROM Film WHERE Regista="(SELECT Regista FROM Film WHERE Titolo="Wakanda Forever")"

6- Il titolo ed il genere dei film proiettati il giorno di Natale 2022
SELECT Titolo, genere FROM Film INNER JOIN Proiezioni USING (CodFilm) WHERE DataProiezione="2022-12-25"

7- Il titolo ed il genere dei film proiettati a Napoli il giorno di Natale 2022
SELECT Titolo, genere FROM Film INNER JOIN Proiezioni USING (CodFilm) INNER JOIN Sale USING (CodSala) WHERE DataProiezione="2022-12-25" AND Sale.città="Napoli"

8- I nomi delle sale di Napoli in cui il giorno di Natale 2022 è stato proiettato un film con Keanu Reaves 
SELECT Sale.Nome FROM Sale INNER JOIN Proiezioni USING (CodSala) INNER JOIN Film USING (CodFilm) INNER JOIN RECITA USING (CodFilm) 
INNER JOIN Attori USING (CodAttore) WHERE Proiezioni.DataProiezione="2022-12-25" AND Sale.città="Napoli" AND Attore.nome="Keanu Reaves"

9- Il titolo dei film in cui recita Brad Pitt oppure Angela Basset 
SELECT titolo FROM Film INNER JOIN Attori USING (CodAttore) WHERE Attori.Nome="Brad Pitt" OR "Angela Basset"

10- Il titolo dei film in cui recitano Brad Pitt e Angela Basset 
SELECT titolo FROM Film INNER JOIN Attori USING (CodAttore) WHERE Attori.Nome="Brad Pitt" AND "Angela Basset"

11- Per ogni film in cui recita un attore francese, il titolo del film e il nome dell’attore
SELECT Film.titolo, Attori.nome FROM Film INNER JOIN Attori USING (CodAttore) INNER JOIN Proiezioni USING (CodFilm) WHERE Attori.Nazionalità="Francese"

12- Per ogni film che è stato proiettato a Torino nel gennaio 2021, il titolo del film e il nome della sala. 
SELECT Film.titolo, Sale.nome FROM Film INNER JOIN Proiezioni USING (CodFilm) INNER JOIN Sale USING (CodSala) 
WHERE Sale.città="Torino" AND MONTH(DataProiezione)="02" AND YEAR(DataProiezione)="2021"

13- Il numero di sale di Torino con più di 160 posti 
SELECT Count(Sale.nome) FROM Sale WHERE Sale.posti>160

14- Il numero totale di posti nelle sale di Torino
SELECT SUM(Posti) FROM Sale WHERE Sale.città="Torino"

15- Per ogni città, il numero di sale 
SELECT COUNT(Nome) FROM Sale GROUP BY città

16- Per ogni città, il numero di sale con più di 160 posti 
SELECT COUNT(Nome) FROM Sale WHERE Sale.posti>160 GROUP BY città

17- Per ogni regista, il numero di film diretti dopo il 2018
SELECT Count(CodFilm) FROM Film WHERE AnnoProduzione>2018 GROUP BY Regista

18- Per ogni regista, l’incasso totale di tutte le proiezioni dei suoi film
SELECT SUM(Incasso) FROM Proiezioni INNER JOIN Film USING (CodFilm) GROUP BY Regista

19- Per ogni film di Steven Spielberg, il titolo del film, il numero totale di proiezioni a Torino e l’incasso totale
SELECT Film.titolo, (SELECT COUNT(CodProiezione) FROM Proiezioni INNER JOIN Sale USING (CodSala) WHERE Sale.città="Torino"),Proiezioni.incasso 
FROM Film INNER JOIN Proiezioni USING (CodFilm) WHERE Film.Regista="Steven Spielberg"


