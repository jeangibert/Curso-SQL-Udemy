-- Sintaxis Procedimientos Almacenados
use empresadb
delimiter //


CREATE PROCEDURE AgregarEmpleado (IN _nombre VARCHAR(255), IN _apellido VARCHAR(255),IN _email VARCHAR(255),IN _deptoid INT)
BEGIN
	INSERT INTO empleados(nombre,apellido,email,depto_id) VALUES (_nombre,_apellido,_email,_deptoid);
END//

DELIMITER ;

-- A diferencia de las ctes aqui podemos recibir parametros y facilitar las acciones repetitivas de nuestra base de datos;
-- 			El delimiter se utiliza para aclararle a MYSQL que lo que delimita el procedure son // y no los ; de dentro del procedimiento

-- Como lo usamos?
SELECT * FROM empleados;

CALL AgregarEmpleado ("Pepe","Sanchez","pepesanchez@yahoo.com.ar",5);

