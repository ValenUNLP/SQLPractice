1_

SELECT i.DNI, i.nombre, i.apellido i.ciudad, i.email
FROM Integrante i
INNER JOIN Inscripcion ins ON (e.codigoE = i.codigoE)
INNER JOIN TorneoPesca t ON (t.codTorneo = ins.codTorneo)
WHERE (i.ciudad = "La Plata") and (t.fecha BETWEEN 01/01/2019 and 31/12/2019)

2_

SELECT e.nombreE, e.descripcionE
FROM Equipo e
INNER JOIN Inscripcion ins ON (e.codigoE = ins.codigoE)
INNER JOIN TorneoPesca t ON (t.codTorneo = ins.codTorneo)
WHERE (t.fecha BETWEEN 01/01/2018 and 31/12/2018) and NOT EXISTS(
  SELECT *
  FROM Inscripcion ins
  INNER JOIN TorneoPesca t ON (t.codTorneo = ins.codTorneo)
  WHERE (t.fecha > 31/12/2018) and (t.fecha < 01/01/2018) and (ins.codigoE = e.codigoE)
)

3_

SELECT i.DNI, i.nombre, i.apellido i.ciudad, i.email
FROM Integrante i
INNER JOIN Inscripcion ins ON (ins.codigoE = i.codigoE)
INNER JOIN TorneoPesca t ON (t.codTorneo = ins.codTorneo)
INNER JOIN Laguna l ON (l.nroLaguna = t.codTorneo)
WHERE (l.nombreL = "La Salada, Coronel Granada") and NOT EXISTS(
  FROM Inscripcion ins
  INNER JOIN TorneoPesca t ON (t.codTorneo = ins.codTorneo)
  WHERE (ins.codigoE = i.codigoE) and (t.fecha BETWEEN 01/01/2019 and 31/12/2019)
)

4_

SELECT e.nombreE, e.descripcionE
FROM Equipo e
INNER JOIN INTEGRANTE i ON (i.codigoE = e.codigoE)
GROUP BY e.codigoE, e.nombreE, e.descripcionE
HAVING COUNT(*) >= 5
ORDER BY e.nombreE, e.descripcionE

5_

SELECT e.nombreE, e.descripcionE
FROM Equipo e
WHERE NOT EXIST (
    SELECT l.nroLaguna
    FROM Laguna l
    EXCEPT ( 
        SELECT l2.nroLaguna
        FROM Inscripcion ins 
        INNER JOIN TorneoPesca tp ON (ins2.codTorneo = tp2.codTorneo) 
        INNER JOIN Laguna l2 ON (tp2.nroLaguna = l.nroLaguna)
        WHERE (e.codigoE = ins2.codigoE)
    )
)

6_

DELETE FROM Inscripcion WHERE codigoE="10000"
DELETE FROM Integrante WHERE codigoE="10000"
DELETE FROM Equipo WHERE codigoE="10000"

7_

SELECT l.nombreL, l.ubicación, l.extension, l.descripcion
FROM Laguna l
WHERE NOT EXISTS(
  SELECT *
  FROM TorneoPesca t 
  WHERE (t.nroLaguna = l.nroLaguna)
)

8_

SELECT e.nombreE, e.descripcionE
FROM Equipo e
INNER JOIN Inscripcion i ON (e.codigoE = i.codigoE)
INNER JOIN TorneoPesca t ON (t.codTorneo = i.codTorneo)
WHERE (t.fecha BETWEEN 01/01/2019 and 31/12/2019) and NOT EXIST(
  SELECT *
  FROM Inscripcion i
  INNER JOIN TorneoPesca t ON (t.codTorneo = i.codTorneo)
  WHERE (t.fecha BETWEEN 01/01/2018 and 31/12/2018) and (i.codigoE = e.codigoE)
)

9_

SELECT i.DNI, i.nombre, i.apellido i.ciudad, i.email
FROM Intengrante i 
INNER JOIN Inscripcion ins ON (i.codigoE = ins.codigoE)
INNER JOIN TorneoPesca tp ON (ins.codTorneo = tp.codTorneo)
INNER JOIN Laguna l ON (tp.nroLaguna = l.nroLaguna)
WHERE l.nombreL = "Laguna de Chascomús" and ins.gano = true












