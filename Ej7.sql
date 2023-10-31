1_

SELECT i.DNI, i.nombre, i.apellido, i.direccion
FROM Integrante i
WHERE (i.fechaNacimiento BETWEEN 1980 and 1990) and i.DNI IN (
  SELECT i.DNI
  FROM Recital r
  INNER JOIN Banda b ON (b.codigoB = r.codigoB)
  INNER JOIN Integrante i ON (b.codigoB = i.codigoB)
  WHERE r.fecha BETWEEN "01/01/2018" AND "31/12/2018"
)

2_

SELECT b.nombreBanda, b.generoMusical, b.añoCreacion
FROM Banda b
INNER JOIN Recital r ON (b.codigoB = r.codigoB)
WHERE (r.fecha BETWEEN 01/01/2018 and 31/12/2018) and NOT EXIST(
  SELECT *
  FROM Recital r2
  WHERE (r2.fecha BETWEEN 01/01/2019 and 31/12/2019) and (r2.codigoB = b.codigoB)
)

3_

SELECT b.nombre, r.fecha, r.hora, e.nombre_escenario, e.ubicación
FROM Recital r
INNER JOIN Banda b ON (r.codigoB = b.codigoB)
INNER JOIN Escenario e ON (r.nroEscenario = e.nroEscenario)
WHERE (r.fecha = "04/12/2018")

4_

SELECT i.DNI, i.nombre, i.apellido, i.email
FROM Integrante i
INNER JOIN Recital r ON (r.codigoB = i.codigoB)
INNER JOIN Escenario e ON (r.nroEscenario = e.nroEscenario)
WHERE (i.nombre = "Gustavo") and (i.apellido = "Cerati") and i.DNI IN (
  SELECT i.DNI
  FROM Integrante i
  INNER JOIN Recital r ON (r.codigoB = i.codigoB)
  INNER JOIN Escenario e ON (r.nroEscenario = e.nroEscenario)
  WHERE (e.nombre = "Carlos Gardel")
)

5_

SELECT b.nombreBanda, b.genero_musical, b.año_creacion
FROM Banda b
INNER JOIN Integrante i ON (b.codigoB = i.codigoB)
GROUP BY b.codigoB, b.nombreBanda, b.genero_musical, b.año_creacion
HAVING COUNT(*) > 8

6_

SELECT e.nombre_escenario, e.ubicación, e.descripción
FROM Escenario e
INNER JOIN Recital r ON (e.nroEscenario = r.nroEscenario)
INNER JOIN Banda b ON (r.codigoB = b.codigoB)
WHERE (b.generoMusical = "rock and roll") and NOT EXISTS (
  SELECT *
  FROM Recital r
  INNER JOIN Banda b ON (b.codigoB = r.codigoB)
  WHERE (r.nroEscenario = e.nroEscenario) and NOT(b.generoMusical = "rock and roll"  
)

  7_

  SELECT b.nombreBanda, b.genero_musical, b.año_creacion
  FROM Banda b 
  INNER JOIN Recital r ON (r.codigoB = b.codigoB)
  INNER JOIN Escenario e ON (r.nroEscenario = r.nroEscenario)
  WHERE (e.cubierto = true) and (r.fecha BETWEEN 01/01/2018 and 31/12/2018)

  8_

  SELECT e.nombre_escenario, COUNT(*) as Cantidad
  FROM Escenario e
  INNER JOIN Recital r ON (r.nroEscenario = e.nroEscenario)
  WHERE (r.fecha BETWEEN "01/01/2018" AND "31/12/2018")
  GROUP BY e.nombreEscenario, e.nroEscenario

  9_
  
  UPDATE Banda SET nombreBanda="Memphis la Blusera" WHERE nombreBanda = "Mempis la Blusera"
  
 






