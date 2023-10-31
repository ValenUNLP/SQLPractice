1_

SELECT p.nombrP, p.descripcion, p.fechaInicioP, p.fechaFinP
FROM Proyecto p
WHERE (p.fechaFinP IS NOT NULL ) and (p.fechaFinP > p.fechaFinEstimada)

2_

SELECT *
FROM Empleado e
WHERE NOT EXIST(
  SELECT *
  FROM Proyecto p
  WHERE (e.DNI = p.DNIResponsable)
)
ORDER BY e.apellido, e.nombre

3_

SELECT e.DNI, e.nombre, e.apellido, e.telefono, e.direccion
FROM Empleado e
INNER JOIN Equipo eq ON (eq.DNILider = e.DNI)
GROUP BY e.DNI, e.nombre, e.apellido, e.telefono, e.direccion
HAVING COUNT(*) > 1

4_

SELECT e.DNI, e.nombre, e.apellido, e.telefono, e.direccion
FROM Empleado e
INNER JOIN EmpleadoEquipo ee ON (e.DNI = ee.DNI)
INNER JOIN Proyecto p ON (p.equipoBackend = ee.codEquipo)
WHERE (p.nombreP = "Proyecto x")
UNION
(
  SELECT e.DNI, e.nombre, e.apellido, e.telefono, e.direccion
  FROM Empleado e
  INNER JOIN EmpleadoEquipo ee ON (e.DNI = ee.DNI)
  INNER JOIN Proyecto p ON (p.equipoFrontend = ee.codEquipo)
  WHERE (p.nombreP = "Proyecto x")
)

5_

SELECT eq.nombreE, e.DNI, e.nombre, e.apellido, e.telefono, e.direccion
FROM Empleado e
INNER JOIN Equipo eq ON (eq.DNILider = e.DNI)
WHERE (eq.descripcionTecnologias LIKE "%Java%") and NOT EXISTS (
  SELECT *
  FROM EmpleadoEquipo ee
  WHERE (eq.codEquipo = ee.codEquipo)
)

6_

UPDATE Empleado 
SET nombre='Pepe', apellido= 'Diaz', direccion='123'
WHERE dni=40568965

7_

SELECT e.DNI, e.nombre, e.apellido, e.telefono, e.direccion
FROM Empleado e
INNER JOIN Proyecto p ON (p.DNIResponsable = e.DNI)
WHERE NOT EXIST (
  SELECT *
  FROM Equipo eq
  WHERE (eq.DNILider = e.DNI)
)

8_


SELECT eq.nombreE, eq.descripcionTecnologias
FROM Equipo eq
INNER JOIN Proyecto p ON (p.equipoBackend = eq.codEquipo)
INTERSECT
(
  SELECT eq.nombreE, eq.descripcionTecnologias
  FROM Equipo eq
  INNER JOIN Proyecto p ON (p.equipoFrontend = eq.codEquipo)
)

9_

SELECT p.nombrP, p.descripcion, p.fechaInicioP, e.nombre, e.apellido
FROM Empleado e 
INNER JOIN Proyecto p (e.DNI = p.DNIResponsable)
WHERE p.fechaFinEstimada BETWEEN "01/01/2019" AND "31/12/2019"




