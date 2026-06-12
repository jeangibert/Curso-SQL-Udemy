DELIMITER $$

CREATE PROCEDURE HacerCheckOut(
    IN _ubicacion VARCHAR(45)
)
BEGIN
    DECLARE estadoHabitacion VARCHAR(45);
    IF _ubicacion NOT IN (SELECT ubicacion FROM habitaciones) THEN
        SELECT 'ERROR: La habitacion ingresada no esta registrada en el sistema' AS Mensaje;
    ELSE
        SELECT estado INTO estadoHabitacion FROM habitaciones WHERE ubicacion = _ubicacion;
        IF estadoHabitacion != 'Ocupado' THEN
            SELECT 'ERROR: No se puede hacer Check-Out porque la habitacion no esta ocupada' AS Mensaje;
        ELSE 
            START TRANSACTION;
            UPDATE habitaciones SET estado = 'Disponible' WHERE ubicacion = _ubicacion;
            COMMIT;
            SELECT 'EXITO: Check-Out realizado. La habitacion ahora esta disponible.' AS Mensaje;
        END IF;
    END IF;

END$$

DELIMITER ;