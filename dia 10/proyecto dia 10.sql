CREATE VIEW VistaEmpleadosProyectos AS
SELECT 
		empleados.nombre AS "Nombre",
		empleados.apellido AS "Apellido",
		empleado_nombreproyecto.nombre AS "Nombre proyecto" FROM empleados
Inner JOIN (
SELECT asignacionesdeproyectos.empleado_id ,
proyectos.nombre FROM
asignacionesdeproyectos

Inner Join proyectos
ON asignacionesdeproyectos.proyecto_id = proyectos.proyecto_id
)AS empleado_nombreproyecto
-- Esta subconsulta me da una tabla con la ID del empleado y el nombre del proyecto en el
-- que esta trabajando
ON empleado_nombreproyecto.empleado_id = empleados.empleado_id;

SELECT * from VistaEmpleadosProyectos;

-- Se podria haber hecho muchisimo pero muchisimo mas facil habiendo hecho un join de 
-- asignacionesdeproyectos con empleados para obtener la id y la id del proyecto y luego
-- otro join con proyectos y matchear las id . btw a mi me salio asi y lo voy a dejar asignacionesdeproyectos
-- pero dejo escrita la manera mas clean que es la de Eze

CREATE VIEW VistaEmpleadosProyectos AS
SELECT E.nombre AS NombreEmpleado, E.apellido AS ApellidoEmpleado, P.nombre AS NombreProyecto
FROM Empleados E
JOIN AsignacionesDeProyectos A ON E.empleado_id = A.empleado_id
JOIN Proyectos P ON A.proyecto_id = P.proyecto_id;

-- El resultado es el mismo que es lo que importa (??????

