
DELIMITER //
CREATE PROCEDURE AgregarDepartamento(in _nombredepto varchar(255), in _ubicaciondepto varchar(255))
BEGIN

INSERT INTO departamentos (nombre,ubicacion) VALUES (_nombredepto,_ubicaciondepto);

END //

DELIMITER ;	

-- Se podria agregar transacciones dependiendo el modelo de negocio de los departamentos ej:
-- 		- 2 departamentos no pueden estar ubicados en el mismo lugar
-- 		- 1 departamento no puede tener 2 ubicaciones distintas 



