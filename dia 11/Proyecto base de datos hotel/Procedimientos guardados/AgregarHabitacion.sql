DELIMITER $$
CREATE PROCEDURE AgregarHabitacion(
IN _capacidad int,
IN _ubicacion varchar(45),
IN _estado varchar(45))

begin
IF _capacidad is null or _ubicacion is null or _estado is null then
	SELECT "ERROR: Los datos de registro deben estar todos completos" AS Mensaje;

ELSEIF _ubicacion in (select ubicacion from hoteldb.habitaciones) then
	SELECT "ERROR: Habitacion existente" AS Mensaje;

ELSEIF _capacidad < 1 then
	SELECT "ERROR: La capacidad ingresada no es valida" AS Mensaje;

ELSEIF _estado not in ("Ocupado","Disponible","Mantenimiento") then
	SELECT "ERROR: Habitacion no disponible" AS Mensaje;

ELSEIF TRIM(_ubicacion) ="" or TRIM(_estado) = "" then
	SELECT "ERROR: Todos los campos deben tener contenido" AS Mensaje;

ELSE
	START TRANSACTION ;
	INSERT INTO habitaciones (capacidad,ubicacion,estado) VALUES (_capacidad,_ubicacion,_estado);
	COMMIT;
    SELECT "La habitacion se ha agregado con exito" AS Mensaje;
end if;

end $$

delimiter ;



