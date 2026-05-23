Use empresadb;
-- Comandos DML
INSERT INTO  departamentos (nombre,ubicacion ) VALUES ("Recursos humanos", "Chacarita"),
("Genero","Once");
-- INSERT INTO -> Sirve para agregar filas de datos aclarando los parametros y los valores. Separando con comas podemos poner varios
SELECT * FROM departamentos
WHERE nombre = "Recursos humanos" or nombre = "Genero";

UPDATE departamentos SET ubicacion = "Edificio J" WHERE nombre = "Marketing";
-- UPDATE -> Sirve para actualizar campos de datos aclarando la tabla el campo a modificar y en que fila se cambiaria

DELETE FROM departamentos WHERE ubicacion = "Chacarita"	or ubicacion = "Once" or nombre="Recursos Humanos"
-- DELETE FROM -> Permite borrar filas aclarando la tabla y poniendo una clausula que se cumple para borrar la fila
