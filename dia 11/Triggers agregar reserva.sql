
-- Trigger inserccion reserva
DELIMITER $$
CREATE TRIGGER AgregarReservaInserccionReservasInserccionReservas
BEFORE INSERT on hoteldb.reservas
FOR each row
begin
DECLARE estado_habitacion varchar(45);
DECLARE superposicion INT; -- Va a servir para chequear que no se superpongan

-- Chequeo numero de habitacion valido
IF new.habitacion_id not in (SELECT habitacion_id from habitaciones) Then
	SIGNAL SQLSTATE "45000" 
    SET MESSAGE_TEXT = "Error el numero de habitacion no existe";
END if;

-- Chequeo que el estado de la habitacion sea disponible

SELECT estado into estado_habitacion
FROM habitaciones
WHERE habitacion_id = NEW.habitacion_id;

IF estado_habitacion != "Disponible" then
-- Esta linea se utiliza para que tire error el codigo y se cancele el INSERT
	SIGNAL SQLSTATE "45000" 
    SET MESSAGE_TEXT = "Error la habitacion seleccionada no esta disponible";
END IF;

-- Chequeo la fecha de check in y check out sea valida
IF new.check_in >= new.check_out then
	SIGNAL SQLSTATE "45000" 
    SET MESSAGE_TEXT = "Tiempo de estadia invalido";
END IF;

-- Lógica para chequear si las fechas se superponen con alguna reserva existente en esa misma habitación.
-- (Siendo A la Reserva Nueva y B una Reserva Vieja)
-- Hay superposición SÍ Y SOLO SÍ se cumplen ESTAS DOS condiciones al mismo tiempo:
-- 1. La fecha de INICIO de A es anterior a la fecha de FINALIZACIÓN de B.
-- Y
-- 2. La fecha de FINALIZACIÓN de A es posterior a la fecha de INICIO de B.

SELECT count(*) into superposicion
From hoteldb.reservas
where habitacion_id = new.habitacion_id
and new.check_in < check_out
and new.check_out > check_in;

IF superposicion > 0 then
	SIGNAL SQLSTATE "45000" 
    SET MESSAGE_TEXT = "Hay superposicion en las reservas";
END IF;

end$$

DELIMITER ;

