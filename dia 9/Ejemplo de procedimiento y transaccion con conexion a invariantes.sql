DELIMITER //

CREATE PROCEDURE AsignarHorasAProyecto(IN proyectoId INT, IN empleadoId INT, IN horasAsignadas INT)
BEGIN
    DECLARE horasTotales INT DEFAULT 0;
    DECLARE horasMaximas INT DEFAULT 100;
    
    -- Iniciar una transacción
    START TRANSACTION;
    
    -- Establecer un punto de guardado
    SAVEPOINT PreValidacion;
    
    -- Calcular el total actual de horas asignadas al proyecto
    SELECT SUM(horas_asignadas) INTO horasTotales 
    FROM AsignacionesDeProyectos 
    WHERE proyecto_id = proyectoId;
    
    -- Asumiendo que SUM() puede devolver NULL si no hay filas, lo convertimos a 0
    SET horasTotales = IFNULL(horasTotales, 0) + horasAsignadas;
    
    -- Verificar si el total excede las horas máximas permitidas
    IF horasTotales > horasMaximas THEN
        -- Revertir a SAVEPOINT si se excede el total de horas
        ROLLBACK TO PreValidacion;
        -- Aunque el ROLLBACK TO SAVEPOINT mantiene la transacción activa, decidimos terminar la operación con un mensaje de error.
        SELECT 'Error: La asignación excede el total de horas permitidas para el proyecto.' AS mensaje;
    ELSE
        -- Insertar la nueva asignación si el total está dentro del límite
        INSERT INTO AsignacionesDeProyectos (proyecto_id, empleado_id, horas_asignadas) 
        VALUES (proyectoId, empleadoId, horasAsignadas);
        
        -- Confirmar la transacción si todas las operaciones fueron exitosas
        COMMIT;
    END IF;
END //

DELIMITER 


-- Conclusion hecha por mi xd:
-- Estas 2 herramientas nos benefician para al momento de crear procedimientos almacenados,los cuales son acciones que se hacen recurrentemente dependiendo
-- el modelo de base de datos que usamos , con codigo chequear que si se nos rompe el invariante de la bases de datos el cual es el predicado
-- que se deberia cumplir siempre pre procedimiento o post procedimiento tirar un warning y perservar los datos , en el caso que no se rompa
-- el invariante ejecutar el cambio.