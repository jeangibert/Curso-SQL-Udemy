SELECT empleados.nombre AS "Nombre Empleado",
empleados.apellido as "Apellido Empleado",
proyectos.nombre AS "Nombre Proyecto",
asignacionesdeproyectos.horas_asignadas AS "Horas Asignadas" FROM empleados

JOIN asignacionesdeproyectos
ON asignacionesdeproyectos.empleado_id = empleados.empleado_id

JOIN proyectos
ON proyectos.proyecto_id = asignacionesdeproyectos.proyecto_id

ORDER by empleados.nombre , asignacionesdeproyectos.horas_asignadas DESC;


