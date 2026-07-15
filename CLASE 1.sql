--Database creation--
CREATE DATABASE clase1;

--Use database command--
USE clase1;

--Table creation--
CREATE TABL;E usuario(
id INT not null,
direccion VARCHAR(30) not null,
telefono INT not null
);

--Delete table--
DROP TABLE usuario;

--Table creation--
CREATE TABLE producto(
id INT not null,
nombre VARCHAR(30) not null,
precio INT not null
);

--Delete table--
DROP TABLE producto;

--Insert data--
INSERT INTO producto (id, nombre, precio) VALUES
(1, 'Laptop Gamer', 1200),
(2, 'Mouse Inalámbrico', 25),
(3, 'Teclado Mecánico', 80),
(4, 'Monitor 24"', 200),
(5, 'Disco SSD 1TB', 150);

--Insert data--
INSERT INTO usuario (id, direccion, telefono) VALUES
(1, 'Calle Falsa 123, Ciudad', 5551234),
(2, 'Av. Principal 456, Pueblo', 5555678),
(3, 'Plaza Central 789, Villa', 5559012),
(4, 'Barrio Norte 1010, Metrópoli', 5553456),
(5, 'Calle del Sol 2020, Costa', 5557890);

--Select information from tables--
SELECT * FROM producto;
SELECT * FROM usuario;