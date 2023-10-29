1_

SELECT a.DNI, a.legajo, p.apellido, p.nombre
FROM Alumno a
INNER JOIN Persona p ON (a.DNI = p.DNI)
WHERE a.año_ingreso < 2014

2_
  
SELECT p.DNI, p.matricula, pe.nombre, pe.apellido
FROM Profesor p
INNER JOIN Persona pe ON (pe.DNI = p.DNI)
INNER JOIN ProfesorCurso pc ON (pc.DNI = p.DNI)
INNER JOIN Curso c ON (c.codCurso = pc.codCurso)
WHERE (c.duracion > 100)
ORDER BY p.DNI

3_
SELECT p.DNI, p.Apellido, p.Nombre, p.Genero, p.Fecha_Nacimiento
FROM Alumno a
INNER JOIN Persona p ON (p.DNI = a.DNI)
INNER JOIN AlumnoCurso ac ON (ac.DNI = p.DNI)
INNER JOIN Curso c ON (c.codCurso = pc.codCurso)
WHERE (c.nombre = "Base de datos") and (ac.año = 2019)

4_

SELECT p.DNI, p.apellido, p.nombre, ac.calificacion
FROM Alumno a
INNER JOIN Persona p ON (p.DNI = a.DNI)
INNER JOIN AlumnoCurso ac ON (ac.DNI = p.DNI)
INNER JOIN ProfesorCurso pc ON (pc.codCurso = ac.codCurso)
INNER JOIN Profesor pro ON (pro.DNI = pc.DNI)
Inner JOIN Persona p2 ON (p2.DNI = pro.DNI)
WHERE (p2.nombre = "Juan") and (p2.apellido = "Garcia") and (ac.calificacion > 9)
ORDER BY p.apellido

5_

SELECT p.DNI, pe.apellido, pe.nombre, p.matricula
FROM Profesor p
INNER JOIN Persona pe ON (p.DNI = pe.DNI)
INNER JOIN ProfesorTitulo pt ON (pt.DNI = p.DNI)
GROUP BY p.DNI, pe.apellido, pe.nombre, p.matricula
HAVING COUNT(*) > 3
ORDER BY pe.apellido, pe.nombre

6_

SELECT p.DNI, pe.nombre, pe.apellido, SUM (c.duracion), AVG(c.duracion)
FROM Profesor p
INNER JOIN Persona pe ON (pe.DNI = p.DNI)
INNER JOIN ProfesorCurso pc ON (pc.DNI = p.DNI)
INNER JOIN Curso c ON (c.codCurso = pc.codCurso)
GROUP BY p.DNI, pe.nombre, pe.apellido

7_

SELECT c.nombre, c.descripcion
FROM Curso c
INNER JOIN AlumnoCurso ac ON (c.codCurso = ac.codCurso)
WHERE (ac.año = 2019)
GROUP BY ac.codCurso
HAVING COUNT(*) >= ALL (
  SELECT COUNT(*)
  FROM AlumnoCurso ac
  WHERE ac.año = 2019
  GROUP BY ac.codCurso
)
UNION
(
SELECT c.nombre, c.descripcion
FROM Curso c
INNER JOIN AlumnoCurso ac ON (c.codCurso = ac.codCurso)
WHERE (ac.año = 2019)
GROUP BY ac.codCurso
HAVING COUNT(*) <= ALL (
  SELECT COUNT(*)
  FROM AlumnoCurso ac
  WHERE ac.año = 2019
  GROUP BY ac.codCurso
)
)

8_

SELECT p.DNI, p.Apellido, p.Nombre, a.legajo
FROM Alumno a
INNER JOIN Persona p ON (p.DNI = a.DNI)
INNER JOIN AlumnoCurso ac ON (ac.DNI = p.DNI)
INNER JOIN Curso c ON (c.codCurso = pc.codCurso)
WHERE (c.nombre LIKE "%DB%") and (ac.año = 2018) and NOT EXIST (
  SELECT *
  FROM AlumnoCurso ac
  WHERE (ac.año = 2019) and (p.DNI = ac.DNI)
)

9_

/* 9. Agregar un profesor con los datos que prefiera y agregarle el título con código: 25. */

INSERT INTO PERSONA (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero) 
VALUES ("44124642", "Diaz", "Pepe", "21/04/2002", "Soltero", "Masculino")

INSERT INTO PROFESOR (DNI, Matricula, Nro_Expediente) 
VALUES ("44124642", "123", "123")

INSERT INTO TITULO-PROFESOR (Cod_Titulo, DNI, Fecha) 
VALUES (25,"44124642","22/10/2022")

/* 10. Modificar el estado civil del alumno cuyo legajo es ‘2020/09’, el nuevo estado civil es
divorciado. */

UPDATE PERSONA SET Estado_Civil="divorciado" WHERE DNI IN (SELECT a.DNI FROM ALUMNO a WHERE a.Legajo="2020/09")

/* 11. Dar de baja el alumno con DNI 30568989. Realizar todas las bajas necesarias para no
dejar el conjunto de relaciones en estado inconsistente.
 */
--Asumo que un alumno no puede ser profesor.

 DELETE FROM ALUMNO-CURSO WHERE DNI="30568989"
 DELETE FROM ALUMNO WHERE DNI="30568989"
 DELETE FROM PERSONA WHERE DNI="30568989"









