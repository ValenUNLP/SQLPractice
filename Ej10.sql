1_

SELECT v.patente, v.modelo, v.marca, v.peso, v.km
FROM Camion c
INNER JOIN Vehiculo v ON (c.patente = v.patente)
INNER JOIN Service s ON (s.patente = c.patente)
WHERE (s.fecha BETWEEN "25/10/2021" AND "25/10/2021") and (c.cantRuedas BETWEEN 4 AND 8)

2_

SELECT a.patente, a.es_electrico, a.tipo_motor
FROM Auto a
INNER JOIN Service s ON (s.patente = a.patente)
WHERE (s.observaciones = "Cambio de aceite") and (s.kmService < 130000)
UNION(
  SELECT a.patente, a.es_electrico, a.tipo_motor
  FROM Auto a
  INNER JOIN Service s ON (s.patente = a.patente)
  INNER JOIN ServiceParte sp ON (s.patente = sp.patente) and (s.fecha = sp.fecha)
  INNER JOIN Parte p ON (sp.codParte = p.codParte)
  WHERE (s.observaciones = "inspeccion general") and (p.nombre = "filtro de combustible")
)

3_

SELECT p.nombre, p.precio_parte
FROM Parte p
INNER JOIN ServiceParte sp ON (sp.codParte = p.codParte)
WHERE (p.precioParte  > 40000)
GROUP BY p.codParte, p.nombre, p.precioParte
HAVING COUNT(*) > 30

4_

DELETE FROM Service_Parte WHERE patente IN (
    SELECT c.patente
    FROM Camion c INNER JOIN Vehiculo v ON (c.patente = v.patente)
    WHERE v.km > 250000
)

DELETE FROM Service WHERE patente IN (
    SELECT c.patente
    FROM Camion c INNER JOIN Vehiculo v ON (c.patente = v.patente)
    WHERE v.km > 250000
)

DELETE FROM Vehiculo WHERE patente IN (
    SELECT c.patente
    FROM Camion c INNER JOIN Vehiculo v ON (c.patente = v.patente)
    WHERE v.km > 250000
)

DELETE FROM Camion WHERE v.km > 250000

5_

SELECT p.nombre, p.precio_parte
FROM Parte p 
WHERE NOT EXIST (
    SELECT s.fecha, s.patente
    FROM Service s
    EXCEPT (
        SELECT s2.fecha, s2.patente
        FROM Service2 s2 
        INNER JOIN Service_Parte sp ON (s2.fecha = sp.fecha) AND (s2.patente = sp.patente)
        WHERE (sp.cod_parte = p.cod_parte) AND (sp.fecha BETWEEN "01/01/2022" AND "31/12/2022")
    )
)

6_

SELECT a.es_electrico, a.tipo_motor, v.modelo, v.marca, v.peso
FROM Auto a 
INNER JOIN Vehiculo v ON (a.patente = v.patente) 
WHERE a.es_electrico = true

7_

INSERT INTO Parte (nombre, precio_parte) VALUES ("Aleron",6400)

8_

DELETE FROM Service_Parte WHERE patente"‘AWA564"
DELETE FROM Service WHERE patente ="AWA564"

9_
  
SELECT *
FROM Vehiculo v 
INNER Service s ON (v.patente = s.patente)
WHERE (s.fecha BETWEEN "01/01/2018" AND "31/12/2018")
