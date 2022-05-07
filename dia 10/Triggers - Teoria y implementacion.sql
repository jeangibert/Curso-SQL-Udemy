-- Los triggers son acciones automatizadas que se ejecutan al realizar cierto
-- cambio que definamos.
-- En este caso lo que hicimos fue que al momento de registrar un nuevo empleado
-- guardar un registros en la tabla log empleados el cual guarde la id del empleado
-- y la fecha en la cual se registro.
-- Las sintaxis es crear el trigger y declalarle que despues que se inserte algo
-- en empleados ejecute para cada linea (por eso el for each row) cierto codigo
-- que va dentro del begin

Delimiter $$
CREATE Trigger InserccionEmpleados
AFTER INSERT ON empleados
FOR each row
begin
INSERT into logempleados (empleado_id,fecha_registro) VALUES (NEW.empleado_id,now());
end$$

INSERT into empleados (nombre,apellido,email) VALUES ("Juan","Almiron","juana@gmail.com");

SELECT * from empleados
SELECT * from logempleados

-- Complementacion pregunta teorica
-- No existe trigger que se pueda ejecutar durante una consulta siempre estos
-- son definidos antes o post consulta! No existe "During Trigger"