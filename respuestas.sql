
-- ¿Cuáles son los empleados con IdTipoPersona igual a 3?
SELECT *
FROM empleado
WHERE idTipoPersona = 3;

-- ¿Cuáles son los empleados con IdGrupoSanguineo igual a 9?

SELECT e.*
FROM empleado AS e
JOIN persona AS p ON e.NoDocumento = p.noDocumento
WHERE p.idGrupoSanguineo = 9;

-- ¿Cuáles son los empleados con IdEstadoUsuario igual a 1?
SELECT *
FROM empleado
WHERE idEstadoUsuario = 1;

-- ¿Cuáles son los empleados con IdTipoUsuarioSistema igual a 1?
SELECT *
FROM empleado
WHERE idTipoUsuarioSistema = 1;

-- ¿Cuáles son los empleados con IdCargo igual a 1148?
SELECT *
FROM empleado
WHERE idCargo = 1148;

-- ¿Cuáles son los empleados con IdProfesion igual a 1?
SELECT e.*
FROM empleado AS e
JOIN persona AS p ON e.NoDocumento = p.noDocumento
WHERE p.idProfesion = 1;

-- ¿Cuáles son los empleados con IdDependencia igual a 30775?
SELECT *
FROM empleado
WHERE idDependencia = 30775;

-- ¿Cuáles son los empleados con IdTipoDocumento igual a 1?
SELECT e.*
FROM empleado AS e
JOIN persona AS p ON e.NoDocumento = p.noDocumento
WHERE p.idTipoDocumento = 1;

-- ¿Cuáles son los empleados con FechaRegistro igual a 2014-05-08 12:25:45.343?
SELECT *
FROM empleado
WHERE fechaRegistro = '2014-05-08 12:25:45.343';

-- ¿Cuáles son los empleados con FechaVencimiento igual a 2024-03-14 03:02:27.000?
SELECT *
FROM empleado
WHERE fechaVencimiento = '2024-03-14 03:02:27.000';

-- ¿Cuántos empleados hay en la base de datos?
SELECT COUNT(*)
FROM empleado;

-- ¿Cuáles son los IdTipoPersona de los empleados?
SELECT DISTINCT idTipoPersona
FROM empleado;

-- ¿Cuáles son los IdCargo de los empleados?
SELECT DISTINCT idCargo
FROM empleado;

-- ¿Cuáles son los IdProfesion de los empleados?
SELECT DISTINCT p.idProfesion
FROM empleado AS e
JOIN persona AS p ON e.NoDocumento = p.noDocumento;

-- ¿Cuáles son los IdEstadoUsuario de los empleados?
SELECT DISTINCT idEstadoUsuario
FROM empleado;

-- ¿Cuáles son los IdTipoUsuarioSistema de los empleados?
SELECT DISTINCT idTipoUsuarioSistema
FROM empleado;

-- ¿Cuáles son los IdGrupoSanguineo de los empleados?
SELECT DISTINCT p.idGrupoSanguineo
FROM empleado AS e
JOIN persona AS p ON e.NoDocumento = p.noDocumento;

-- ¿Cuáles son los NoDocumento de los empleados?
SELECT DISTINCT NoDocumento
FROM empleado;

-- ¿Cuáles son los LugarExp de los empleados?
SELECT DISTINCT p.lugarExp
FROM empleado AS e
JOIN persona AS p ON e.NoDocumento = p.noDocumento;

-- ¿Cuáles son los CodInterno de los empleados?
SELECT DISTINCT codInterno
FROM empleado;


-- SELECT IdEmpleado, Apellidos, Nombres, Salario FROM Empleado WHERE IdTipoPersona = 3 GROUP BY IdEmpleado
SELECT e.idEmpleado, p.apellidos, p.nombres, e.promedio
FROM empleado AS e
JOIN persona AS p ON e.NoDocumento = p.noDocumento
WHERE e.idTipoPersona = 3
GROUP BY e.idEmpleado;


-- SELECT IdEmpleado, MAX(FechaRegistro) FROM Empleado WHERE IdTipoPersona = 3 GROUP BY IdEmpleado;
SELECT e.idEmpleado, MAX(e.fechaRegistro)
FROM empleado AS e
WHERE e.idTipoPersona = 3
GROUP BY e.idEmpleado;

-- SELECT AVG(Salario) FROM Empleado WHERE IdTipoPersona = 3;
SELECT AVG(promedio)
FROM empleado
WHERE idTipoPersona = 3;

-- SELECT IdEmpleado, IdDependencia, IdTipoDocumento, IdTipoPersona, IdCargo, IdProfesion, IdEstadoUsuario, IdTipoUsuarioSistema, IdGrupoSanguineo, NoDocumento, LugarExp, CodInterno, Apellidos, Nombres, Foto, NoTarjeta, Email, Microondas, TelDirecto, TelInterno, TelResidencia, Sexo, Activo, FechaRegistro, FechaVencimiento, FechaIngresoEmpresa, Salario FROM Empleado WHERE IdTipoPersona = 3;

SELECT e.idEmpleado, e.idDependencia, p.idTipoDocumento, e.idTipoPersona, e.idCargo, p.idProfesion, e.idEstadoUsuario, e.idTipoUsuarioSistema, p.idGrupoSanguineo, p.noDocumento, p.lugarExp, e.codInterno, p.apellidos, p.nombres, e.noTarjeta, p.email, e.microondas, p.telDirecto, e.telInterno, p.telResidencia, p.sexo, e.activo, e.fechaRegistro, e.fechaVencimiento, e.fechaIngresoEmpresa, e.promedio
FROM empleado AS e
JOIN persona AS p ON e.NoDocumento = p.noDocumento
WHERE e.idTipoPersona = 3;


SELECT idEmpleado, MAX(fechaVencimiento)
FROM empleado
WHERE idTipoPersona = 3
GROUP BY idEmpleado;

SELECT idEmpleado, MAX(fechaIngresoEmpresa)
FROM empleado
WHERE idTipoPersona = 3
GROUP BY idEmpleado;

SELECT idEmpleado, MAX(noTarjeta)
FROM empleado
WHERE idTipoPersona = 3
GROUP BY idEmpleado;

SELECT idEmpleado, MAX(NoDocumento)
FROM empleado
WHERE idTipoPersona = 3
GROUP BY idEmpleado;

SELECT idEmpleado, MAX(microondas)
FROM empleado
WHERE idTipoPersona = 3
GROUP BY idEmpleado;
