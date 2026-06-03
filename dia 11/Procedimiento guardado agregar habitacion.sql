DELIMITER $$
CREATE PROCEDURE AgregarHabitacion(
IN _capacidad int,
IN _ubicacion varchar(45),
IN _estado varchar(45))

begin
START TRANSACTION ;
SAVEPOINT Prevalidacion;

IF _capacidad is null or _ubicacion is null or _estado is null then
rollback to Prevalidacion;
SELECT "ERROR: Los datos de registro deben estar todos completos" AS Mensaje;
END IF;

IF _ubicacion in (select ubicacion from hoteldb.habitaciones) then
rollback to Prevalidacion;
SELECT "ERROR: Habitacion existente" AS Mensaje;
END IF;

IF _capacidad < 1 then
rollback to Prevalidacion;
SELECT "ERROR: La capacidad ingresada no es valida" AS Mensaje;
END IF;

IF _estado not in ("Ocupado","Disponible","Mantenimiento") then
rollback to Prevalidacion;
SELECT "ERROR: Habitacion existente" AS Mensaje;
END IF;

IF TRIM(_capacidad) = "" or TRIM(_ubicacion) ="" or TRIM(_estado) = "" then
rollback to Prevalidacion;
SELECT "ERROR: Todos los campos deben tener contenido" AS Mensaje;
End IF;

INSERT INTO habitaciones (capacidad,ubicacion,estado) VALUES (_capacidad,_ubicacion,_estado);

COMMIT;

end $$

delimiter ;

SELECT * from habitaciones;

-- Testing
CALL AgregarHabitacion(2,"Planta baja","Ocupado");
CALL AgregarHabitacion(3,"Planta media","Disponible");
CALL AgregarHabitacion(1,"Planta alta","Mantenimiento");
CALL AgregarHabitacion(-1,"Planta alta","Mantenimiento");
CALL AgregarHabitacion(1,"","Mantenimiento");
CALL AgregarHabitacion(1,"Planta baja","");
CALL AgregarHabitacion(1,"    ","     ");


-- Para vaciar la tabla
SET FOREIGN_KEY_CHECKS = 0;
truncate hoteldb.habitaciones;
SET FOREIGN_KEY_CHECKS = 1;


