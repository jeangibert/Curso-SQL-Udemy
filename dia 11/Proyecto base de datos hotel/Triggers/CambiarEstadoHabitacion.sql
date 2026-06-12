Delimiter $$
CREATE TRIGGER ValidarActualizacionEstadoHabitacion
BEFORE UPDATE ON habitaciones
FOR each row
begin
IF new.estado not in ("Ocupado","Disponible","Mantenimiento") then
	SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = "Error: El estado de la habitacion es invalido";

ELSEIF new.capacidad != old.capacidad then
	SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = 'ERROR: Prohibido modificar la capacidad física de la habitacion';
 
ELSEIF new.ubicacion != old.ubicacion then
	SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = 'ERROR: Prohibido modificar la ubicacion de la habitacion';

end if;
end $$

delimiter ;
