Delimiter $$
CREATE PROCEDURE HacerCheckIn(IN _capacidad INT,
IN _ubicacion VARCHAR(45))
begin
DECLARE capacidadHabitacion INT;
DECLARE estadoHabitacion VARCHAR(45);

-- Validaciones para chequear el input del usuario
IF _ubicacion not in (SELECT ubicacion FROM habitaciones) then
    SELECT "ERROR: La habitacion ingresada no esta registrada en el sistema" AS Mensaje;

ELSEIF _capacidad <= 0 then
    SELECT "ERROR: La capacidad ingresada no es valida" AS Mensaje;
    
ELSE
	-- Almaceno en las variables los valores de la habitacion para hacer los chequeos
	SELECT capacidad into capacidadHabitacion
	FROM habitaciones
	where ubicacion = _ubicacion;

	SELECT estado into estadoHabitacion
	FROM habitaciones
	WHERE  ubicacion = _ubicacion;

	IF _capacidad > capacidadHabitacion then
    SELECT "ERROR: La capacidad ingresada es mayor a la capacidad de la habitacion" AS Mensaje;
    
	ELSEIF estadoHabitacion in ("Ocupado","Mantenimiento") then
		SELECT "ERROR: La habitacion no se encuentra disponible" AS Mensaje;
		
	ELSE 
		START TRANSACTION;
		UPDATE habitaciones SET estado = "Ocupado" WHERE _ubicacion = ubicacion;
		commit;
		SELECT "EXITO: Check-in realizado correctamente" AS Mensaje;
	end if;
    
end if;
end$$

DELIMITER ;


