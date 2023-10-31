1_

SELECT p.nombre, p.descripción, p.genero
FROM Pelicula p 
INNER JOIN Funcion f ON (p.idPeli = f.idPeli)
WHERE f.fecha BETWEEN "01/01/2020" AND "31/12/2020"

2_

SELECT s.nombreS, c.nombreC, SUM(f.ocupacion)
FROM Cine c
INNER JOIN Sala s ON (c.idCine = s.idCine)
INNER JOIN Funcion f ON (f.nroSala = s.nroSala)
WHERE (f.fecha BETWEEN "01/01/2020" and "31/12/2020")
GROUP BY s.nroSala, c.nombreC

3_

SELECT c.nombreC, c.direccion
FROM Sala s 
INNER JOIN Cine c ON (s.idCine = c.idCine)
INNER JOIN Funcion f ON (s.nroSala = f.nroSala)
INNER JOIN Pelicula p ON (f.idPeli = p.idPeli)
WHERE p.nombre = "Relic"
ORDER BY c.nombreC, c.direccion DESC 

4_

SELECT p.nombre, p.descripción, p.genero
FROM Pelicula p 
INNER JOIN Funcion f ON (p.idPeli = f.idPeli)
INNER JOIN Sala s ON (f.nroSala = s.nroSala)
INNER JOIN Cine c ON (s.idCine = c.idCine)
WHERE s.nombreS = "Sala Lola Membrives" OR c.nombreC="Gran Rex


5_
  
SELECT c.nombreC, c.direccion
FROM Sala s 
INNER JOIN Cine c ON (s.idCine = c.idCine)
WHERE s.capacidad > 300

6_
  
INSERT INTO Cine (idCine, nombreC, direccion) VALUES (5000, "Cine Ricardo Darin","calle 2 nro 1900")
