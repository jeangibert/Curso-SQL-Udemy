CREATE DEFINER = CURRENT_USER TRIGGER `hoteldb`.`clientes_BEFORE_INSERT` BEFORE INSERT ON `clientes` FOR EACH ROW
BEGIN
IF TRIM(new.nombre) = "" or TRIM(new.apellido) ="" or TRIM(new.email) = "" or TRIM(new.dni) ="" then
SIGNAL sqlstate "45000"
SET MESSAGE_TEXT = "Error: Todos los campos deben tener contenido";
END IF;
END;



