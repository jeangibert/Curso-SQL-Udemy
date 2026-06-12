DELIMITER $$

CREATE PROCEDURE AgregarReserva(
IN _cliente_id INT,
IN _habitacion_id INT,
IN _check_in DATE,
IN _check_out DATE
)
BEGIN
DECLARE superposicion INT; -- Debe ir antes de la transaccion!

-- Lógica para chequear si las fechas se superponen con alguna reserva existente en esa misma habitación.
-- (Siendo A la Reserva Nueva y B una Reserva Vieja)
-- Hay superposición SÍ Y SOLO SÍ se cumplen ESTAS DOS condiciones al mismo tiempo:
-- 1. La fecha de INICIO de A es anterior a la fecha de FINALIZACIÓN de B.
-- Y
-- 2. La fecha de FINALIZACIÓN de A es posterior a la fecha de INICIO de B.

SELECT count(*) into superposicion
From hoteldb.reservas
where habitacion_id = _habitacion_id
and _check_in < check_out
and _check_out > check_in;

IF _habitacion_id not in (SELECT habitaciones_id from habitaciones) Then
	SELECT "ERROR: La id de la habitacion no existe" AS Mensaje;
    
ELSEIF _check_in >= _check_out then
	SELECT "ERROR: Tiempo de estadia invalido" AS Mensaje;

ELSEIF superposicion > 0 then
	SELECT "ERROR: Hay superposición en las reservas" AS Mensaje;
    
ELSEIF _cliente_id not in (SELECT cliente_id from clientes) Then
    SELECT 'ERROR: El ID del cliente no existe' AS Mensaje;
    
ELSE
	START TRANSACTION;
	INSERT INTO reservas (cliente_id,habitacion_id,check_in,check_out) VALUES (
	_cliente_id,_habitacion_id,_check_in,_check_out);    
	COMMIT;
	SELECT "La reserva fue registrada con exito!" AS Mensaje;

end IF;

END$$

DELIMITER ;