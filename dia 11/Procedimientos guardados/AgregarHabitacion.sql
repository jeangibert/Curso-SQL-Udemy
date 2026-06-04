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

ELSEIF _ubicacion in (select ubicacion from hoteldb.habitaciones) then
	rollback to Prevalidacion;
	SELECT "ERROR: Habitacion existente" AS Mensaje;


ELSEIF _capacidad < 1 then
	rollback to Prevalidacion;
	SELECT "ERROR: La capacidad ingresada no es valida" AS Mensaje;

ELSEIF _estado not in ("Ocupado","Disponible","Mantenimiento") then
	rollback to Prevalidacion;
	SELECT "ERROR: Habitacion no disponible" AS Mensaje;

ELSEIF TRIM(_ubicacion) ="" or TRIM(_estado) = "" then
	rollback to Prevalidacion;
	SELECT "ERROR: Todos los campos deben tener contenido" AS Mensaje;

ELSE
	INSERT INTO habitaciones (capacidad,ubicacion,estado) VALUES (_capacidad,_ubicacion,_estado);
	COMMIT;
    SELECT "La habitacion se ha agregado con exito" AS Mensaje;
end if;

end $$

delimiter ;



