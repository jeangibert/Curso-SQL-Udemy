DELIMITER $$

CREATE TRIGGER AgregarCliente
BEFORE INSERT on hoteldb.clientes
FOR EACH ROW

BEGIN
IF new.nombre is null or new.apellido is null or new.email is null or new.dni is null then
	SIGNAL sqlstate "45000"
	SET MESSAGE_TEXT = "Error: Ningun campo puede ser null";
    
ELSEIF TRIM(new.nombre) = "" or TRIM(new.apellido) ="" or TRIM(new.email) = "" or TRIM(new.dni) ="" then
	SIGNAL sqlstate "45000"
	SET MESSAGE_TEXT = "Error: Todos los campos deben tener contenido" ;
    
end if;
END$$

DELIMITER ;

-- Notas:
-- Faltaria chequear que el cliente no este repetido , pero basta con asignar a la casilla dni la prop
-- UNIQUE



