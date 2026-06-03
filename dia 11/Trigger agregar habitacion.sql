CREATE DEFINER=`root`@`localhost` TRIGGER `AgregarHabitacion` BEFORE INSERT ON `habitaciones` FOR EACH ROW BEGIN
IF new.capacidad is null or new.ubicacion is null or new.estado is null then
SIGNAL SQLSTATE "45000"
SET MESSAGE_TEXT = "Error: Los campos no pueden ser nullos";
END IF;

IF NEW.ubicacion IN (SELECT ubicacion FROM hoteldb.habitaciones) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Ya existe una habitación en esa ubicación';
    END IF;

IF new.capacidad < 1 then
SIGNAL SQLSTATE "45000"
SET MESSAGE_TEXT = "Error: Capacidad invalida";
END IF;

IF new.estado not in ("Ocupado","Disponible","Mantenimiento") then
SIGNAL SQLSTATE "45000"
SET MESSAGE_TEXT = "Error: Estado de la habitacion invalido";
END IF;       

IF TRIM(new.capacidad) = "" or TRIM(new.ubicacion) ="" or TRIM(new.estado) = "" then
SIGNAL SQLSTATE "45000"
SET MESSAGE_TEXT = "Error: Los campos no pueden ser vacios";
END IF;


END