delimiter $$

CREATE PROCEDURE AgregarCliente(
IN _nombre varchar(45) , IN _apellido varchar(45),IN _email varchar(45), IN _dni varchar(45)
)
BEGIN
IF _nombre is null or _apellido is null or _email is null  or _dni is null then
	SELECT "ERROR: Los datos de registro deben estar todos completos" AS Mensaje;

ELSEIF _dni in (SELECT dni FROM clientes) then
	SELECT "ERROR: El cliente ya esta registrado (DNI EXISTENTE) " AS Mensaje;

ELSEIF TRIM(_nombre) = "" or TRIM(_apellido) ="" or TRIM(_email) = "" or TRIM(_dni) = "" then
	SELECT "ERROR: Todos los campos deben tener contenido" AS Mensaje;
else
	START TRANSACTION;
	INSERT INTO clientes (nombre,apellido,email,dni) VALUES (_nombre,_apellido,_email,_dni);
	COMMIT;
    SELECT "El cliente ha sido registrado con exito" AS Mensaje;
end if;
END $$
DELIMITER ;


