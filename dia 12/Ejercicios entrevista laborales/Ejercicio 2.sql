SELECT departamentos.nombre As "Nombre Departamento",
sum(horas_asignadas) AS "Total Horas Asignadas" FROM departamentos

JOIN Empleados
ON departamentos.depto_id = empleados.depto_id

JOIN AsignacionesDeProyectos
ON empleados.empleado_id = AsignacionesDeProyectos.empleado_id

group by departamentos.nombre
order by sum(horas_asignadas) DESC;