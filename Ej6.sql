1

SELECT nombre, stock, precio
FROM Repuesto
ORDER BY precio

2_

SELECT r.nombre, r.stock, r.precio
FROM Repuesto r
INNER JOIN RepuestoReparacion rp ON (rp.codRep = r.codRep)
INNER JOIN Reparacion re ON (re.nroReparacion = rp.nroReparacion)
WHERE (re.fecha BETWEEN 01/01/2019 and 31/12/2019) AND NOT EXIST (
  SELECT *
  FROM Respuesto r2
  INNER JOIN RepuestoReparacion rp2 ON (rp2.codRep = r2.codRep)
  INNER JOIN Reparacion re2 ON (re2.nroReparacion = rp2.nroReparacion)
  INNER JOIN Tecnico t ON (re2.codTec = t.codTec)
  WHERE (r2.codRep = r.codRep) and (t.nombre = "José Gonzalez")
)

3_

SELECT t.nombre, t.especialidad
FROM Tecnico t
WHERE NOT EXIST(
  SELECT *
  FROM Reparacion r
  WHERE (r.codTec = t.codTec)
)
ORDER BY t.nombre

4_

SELECT t.nombre, t.especialidad
FROM Tecnico t
INNER JOIN Reparacion r ON (r.codTec = t.codTec)
WHERE (r.fecha BETWEEN 01/01/2018 and 31/12/2018) and NOT EXIST(
  SELECT *
  FROM Reparacion r2
  WHERE (r2.fecha > 31/12/2018 and r2.fecha < 01/01/2018) and (r2.codTec = t.codTec)
)

5_

SELECT r.nombre, r.stock, COUNT(DISTINCT repa.codTec) as Cantidad
FROM Repuesto r 
LEFT JOIN RepuestoReparacion rp ON (r.codRep = rp.codRep)
INNER JOIN Reparacion repa ON (repa.nroRep = rp.nroRep)
GROUP BY r.nombre, r.stock, r.precio

6_

SELECT t.nombre, t.especialidad
FROM Tecnico t
INNER JOIN Reparacion r ON (t.codTec = r.codTec)
GROUP BY t.codTec, t.nombre, t.especialidad
HAVING COUNT(*) >= ALL(
  SELECT COUNT(*)
  FROM Reparacion repa
  GROUP BY repa.codTec
)
UNION
SELECT t.nombre, t.especialidad
FROM Tecnico t
INNER JOIN Reparacion r ON (t.codTec = r.codTec)
GROUP BY t.codTec, t.nombre, t.especialidad
HAVING COUNT(*) <= ALL(
  SELECT COUNT(*)
  FROM Reparacion repa
  GROUP BY repa.codTec
)

7_

SELECT r.nombre, r.precio, r.stock
FROM Repuesto r
INNER JOIN Reparacion re ON (r.codRep = re.codRep)
WHERE (r.stock > 0) and NOT EXIST(
  SELECT *
  FROM Reparacion re2 
  WHERE (re2.codRep = r.codRep) and (re2.precioTotal <= 10000)
)

8_

SELECT rr.precio, r.fecha, r.precio_total
FROM Reparacion r 
INNER JOIN RepuestoReparacion rr ON (r.nroReparac = rr.nroReparac)
WHERE (rr.precio > 1000 AND rr.precio < 5000)

9_
  
SELECT r.nombre, r.stock, r.precio
FROM Repuesto r
WHERE NOT EXISTS (
    SELECT *
    FROM RepuestoReparacion rr
    WHERE NOT EXISTS (
        SELECT *
        FROM RepuestoReparacion rr2
        WHERE rr2.codRep = r.codRep AND rr2.nroReparac = rr.nroReparac
    )
)

10_

SELECT t.nombre, t.especialidad, r.fecha, r.precioTotal
FROM Reparacion r 
INNER JOIN RepuestoReparacion re ON (re.nroRep = r.nroRep)
INNER JOIN Tecnico t ON (r.codTec = t.codTec)
GROUP BY r.nroReparac, r.fecha, t.nombre, r.precio_total
HAVING COUNT(*) <= 10
















