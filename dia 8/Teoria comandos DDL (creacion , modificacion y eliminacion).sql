-- DDL TEORIA
CREATE DATABASE IF NOT EXISTS EmpresaDB;
-- Creacion de base de datos
USE empresadb;
-- Seleccion de base de datos para aclarar el entorno en el que vamos a trabajar

CREATE TABLE IF NOT EXISTS Departamentos(
	depto_id INT auto_increment primary key,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255)
)
-- Creacion de tablas -> Las columnas van con el nombre , tipo de dato y si cumple alguna caracteristica de ser primaria o autoincremental

-- FOREIGN KEY -> Para crear una clave foranea se define de la siguiente manera:
-- 					FOREIGN KEY (Nombre de la clave) REFERENCES TABLA(COLUMNA)

-- ALTER TABLE -> Para modificar tablas , se usa ALTER NombreTabla ...
--		En los .. van la accion que queremos hacer puede ser ADD y DROP TABLE IF EXISTS.












-- 