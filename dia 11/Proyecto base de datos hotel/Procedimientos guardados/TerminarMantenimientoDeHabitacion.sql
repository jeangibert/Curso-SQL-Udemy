DELIMITER $$

CREATE PROCEDURE TerminarMantenimiento(
    IN _ubicacion VARCHAR(45)
)
BEGIN
    DECLARE estadoHabitacion VARCHAR(45);

    IF _ubicacion NOT IN (SELECT ubicacion FROM habitaciones) THEN
        SELECT 'ERROR: La habitacion ingresada no esta registrada en el sistema' AS Mensaje;
    ELSE
        SELECT estado INTO estadoHabitacion FROM habitaciones WHERE ubicacion = _ubicacion;

        IF estadoHabitacion in ("Disponible","Ocupado") THEN
            SELECT 'ERROR: La habitacion no esta en mantenimiento' AS Mensaje;
        ELSE 
            START TRANSACTION;
            UPDATE habitaciones SET estado = 'Disponible' WHERE ubicacion = _ubicacion;
            COMMIT;
            
            SELECT 'EXITO: Habitacion desclausurada.' AS Mensaje;
        END IF;
    END IF;

END$$

DELIMITER ;