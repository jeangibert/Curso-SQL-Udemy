DELIMITER $$

CREATE TRIGGER AgregarHabitacion
BEFORE INSERT on hoteldb.habitaciones
FOR EACH ROW

BEGIN

IF new.capacidad is null or new.ubicacion is null or new.estado is null then
	SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = "Error: Los campos no pueden ser nulos";

ELSEIF new.capacidad < 1 then
	SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = "Error: Capacidad invalida";

ELSEIF new.estado not in ("Ocupado","Disponible","Mantenimiento") then
	SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = "Error: Estado de la habitacion invalido";

ELSEIF TRIM(new.ubicacion) ="" or TRIM(new.estado) = "" then
	SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = "Error: Los campos no pueden ser vacios";

END IF;

END$$

-- Nota:
-- Faltaria un chequeo sobre la existencia de la habitacion que lo hago a travez de restringir que la
-- ubicacion de la habitacion sea unica en ALTER TABLE, ya que los triggers no pueden hacer consultas
-- de select sobre la misma tabla que se modifica!

DELIMITER ;