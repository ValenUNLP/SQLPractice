1_

SELECT e.nombreEntrenador, e.fechaNacimiento, e.direccion
FROM Entrenador e
INNER JOIN Entrenamiento en ON (e.idEntrenador = en.idEntrenador)
WHERE (en.fecha BETWEEN "01/01/2020" AND "31/12/2020")

2_

SELECT c.nombreCancha, COUNT(*) As Cantidad de entrenamientos
FROM Complejo com
INNER JOIN Cancha c ON (c.idComplejo = com.idComplejo)
INNER JOIN Entrenamiento en ON (en.idCancha = c.idCancha)
WHERE (com.nombreComplejo = "Complejo 1") AND (e.fecha BETWEEN "01/01/2019" AND "31/12/2019")
GROUP BY c.IdCancha, c.nombreCancha

3_

SELECT DISTINCT c.nombreComplejo
FROM Complejo com
INNER JOIN Cancha c ON (c.idComplejo = com.idComplejo)
INNER JOIN Entrenamiento en ON (c.idCancha = en.idCancha)
INNER JOIN Entrenador e ON (e.idEntrenador = en.idEntrenador)
WHERE e.nombreEntrenador = "Jorge Gonzalez"

4_

SELECT en.nombreEntrenador, en.fechaNacimiento, en.direccion
FROM Entrenador en
INNER JOIN Entrenamiento e ON (e.idEntrenador = en.idEntrenador)
INNER JOIN Cancha c ON (e.idCancha = c.idCancha)
WHERE (c.nombreCancha = "Cancha 1")
INTERSECT(
  SELECT en.nombreEntrenador, en.fechaNacimiento, en.direccion
  FROM Entrenador en
  INNER JOIN Entrenamiento e ON (e.idEntrenador = en.idEntrenador)
  INNER JOIN Cancha c ON (e.idCancha = c.idCancha)
  WHERE (c.nombreCancha = "Cancha 2")
)

5_

SELECT nombreClub, ciudad
FROM Club cl
INNER JOIN Complejo com ON (cl.idClub = com.idClub)
INNER JOIN Cancha c ON (c.idComplejo = com.idComplejo)
INNER JOIN Entrenamiento e ON (e.idCancha = c.idCancha)
INNER JOIN Entrenador en ON (e.idEntrenador = en.idEntrenador)
WHERE en.nombreEntrenador = "Marcos Perez"

6_

DELETE FROM Entrenamiento WHERE IdEntrenador IN (
    SELECT e.IdEntrenador
    FROM Entrenamiento e INNER JOIN Entrenador en ON (e.IdEntrenador = en.IdEntrenador)
    WHERE en.nombreEntrenador="Juan Perez"
)





