DELIMITER $$

CREATE PROCEDURE IniciarMantenimiento(
    IN _ubicacion VARCHAR(45)
)
BEGIN
    DECLARE estadoHabitacion VARCHAR(45);

    IF _ubicacion NOT IN (SELECT ubicacion FROM habitaciones) THEN
        SELECT 'ERROR: La habitacion ingresada no esta registrada en el sistema' AS Mensaje;
    ELSE
        SELECT estado INTO estadoHabitacion FROM habitaciones WHERE ubicacion = _ubicacion;

        IF estadoHabitacion = 'Ocupado' THEN
            SELECT 'ERROR: No se puede reparar una habitacion con huespedes adentro' AS Mensaje;
            
        ELSEIF estadoHabitacion = 'Mantenimiento' THEN
            SELECT 'ERROR: La habitacion ya se encuentra en mantenimiento' AS Mensaje;
            
        ELSE 
            START TRANSACTION;
            UPDATE habitaciones SET estado = 'Mantenimiento' WHERE ubicacion = _ubicacion;
            COMMIT;
            
            SELECT 'EXITO: Habitacion clausurada para mantenimiento.' AS Mensaje;
        END IF;
    END IF;

END$$

DELIMITER ;