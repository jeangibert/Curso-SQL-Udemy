-- Con esta consulta lo que logramos es crear una tabla virtual la cual contenga la tabla de la query
-- esta misma se va a ir actualizando y no comprometemos la seguridad de la base de datos si se la queremos
-- otorgar a alguien que deberia tener solo esta tabla

CREATE VIEW ListaEmpleadosDeptoTecnologia AS
SELECT nombre,apellido,email FROM empleados
WHERE depto_id = 1;

SELECT * From ListaEmpleadosDeptoTecnologia

-- Vistas materializadas estas son vistas las cuales se almacenan en memoria y evitan tener de calcular 
-- de manera dinamica con lo cual no se va actualizar los datos (es una especie de foto) en MySql workbench
-- no estan definidas por eso las comento xd

-- CREATE MATERIALIZED VIEW ... AS
-- ....
