delimiter $$
CREATE PROCEDURE InserccionClientes(
IN _nombre varchar(45) , IN _apellido varchar(45),IN _email varchar(45), IN _dni varchar(45)
)
BEGIN
START TRANSACTION;
SAVEPOINT Prevalidacion;

IF _nombre is null or _apellido is null or _email is null  or _dni is null then
rollback to Prevalidacion;
SELECT "ERROR: Los datos de registro deben estar todos completos" AS Mensaje;
END IF;

IF _dni in (SELECT dni FROM clientes) then
rollback to Prevalidacion;
SELECT "ERROR: El dni ya esta registrado a un cliente" AS Mensaje;
END if;

IF TRIM(_nombre) = "" or TRIM(_apellido) ="" or TRIM(_email) = "" or TRIM(_dni) ="" then
rollback to Prevalidacion;
SELECT "ERROR: Todos los campos deben tener contenido" AS Mensaje;
End IF;


INSERT INTO clientes (nombre,apellido,email,dni) VALUES (_nombre,_apellido,_email,_dni);
COMMIT;

END $$
DELIMITER ;

-- Testing
CALL InserccionClientes("Jean","Gibert","jean@gmail.com","11111");
CALL InserccionClientes("Jean","Gibert","jean@gmail.com","11111"); -- Pruebo si ya habia un dni igual
-- Pruebo nullos
CALL InserccionClientes("","Gibert","jean@gmail.com","123");
CALL InserccionClientes("Jean","","jean@gmail.com","11111");
CALL InserccionClientes("Jean","Gibert","","11111");
CALL InserccionClientes("Jean","Gibert","jean@gmail.com","");

select * From clientes;

