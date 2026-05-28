-- Triggers
DELIMITER $$
CREATE TRIGGER InserccionReservas
BEFORE INSERT on hoteldb.reservas
FOR each row
begin
DECLARE estado_habitacion varchar(45);
SELECT estado into estado_habitacion
FROM habitaciones
WHERE habitacion_id = NEW.habitacion_id;

IF estado_habitacion != "Disponible" then
	SIGNAL SQLSTATE "45000" -- Esta linea se utiliza para que tire error el codigo y se cancele el INSERT
    SET MESSAGE_TEXT = "Error la habitacion seleccionada no esta disponible";
END IF;

DECLARE habitaciones_existentes 

end$$

