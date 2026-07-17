CREATE DATABASE matricula_db
GO

USE matricula_db
GO
-- Tabla curso (contiene el nivel) 
CREATE TABLE curso (
    id_curso INT PRIMARY KEY IDENTITY(1,1),
    Nivel VARCHAR(30) NOT NULL  
);

-- Tabla alumno 
CREATE TABLE alumno (
    id_alumno INT PRIMARY KEY IDENTITY(1,1),
    cedula VARCHAR(15) UNIQUE NOT NULL,  
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100),
    email VARCHAR(60),
    telefono VARCHAR(20)
);

-- Tabla profesor 
CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY IDENTITY(1,1),
    cedula VARCHAR(15) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50),
    email VARCHAR(60),
    telefono VARCHAR(20)
);

-- Tabla asignatura 
CREATE TABLE asignatura (
    id_asignatura INT PRIMARY KEY IDENTITY(1,1),
    codigo VARCHAR(20) UNIQUE NOT NULL,  
    nombre VARCHAR(50) NOT NULL,
    creditos INT,
    horas INT
);

-- Tabla leccion 
CREATE TABLE leccion (
    id_profesor INT,
    id_asignatura INT,
    id_curso INT,
    Periodo_academico VARCHAR(20),  
    Horario VARCHAR(50),
    aula VARCHAR(20),
    PRIMARY KEY (id_profesor, id_asignatura, id_curso, Periodo_academico),
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabla Matricula 
CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY IDENTITY (1,1),
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso INT NOT NULL,
    cuatrimestre VARCHAR(10),
    Anio_academico VARCHAR(20),
    calificacion DECIMAL(5,2),
    CONSTRAINT unique_matricula UNIQUE (id_alumno, id_asignatura, id_curso, cuatrimestre, Anio_academico),
    CONSTRAINT fk_matricula_alumno FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno),
    CONSTRAINT fk_matricula_asignatura FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura),
    CONSTRAINT fk_matricula_curso FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

--Insert de datos 

INSERT INTO Curso (id_curso, Nivel) VALUES
(1, 'Primero'),
(2, 'Segundo'),
(3, 'Tercero');

INSERT INTO alumno (id_alumno, Cedula, nombre, apellido, domicilio, email, telefono) VALUES
(1, '11111111A', 'Juan', 'Pérez', 'Calle Mayor 1, Madrid', 'juan.perez@email.com', '611111111'),
(2, '22222222B', 'Laura', 'García', 'Avda. Libertad 25, Barcelona', 'laura.garcia@email.com', '622222222'),
(3, '33333333C', 'Pedro', 'Martínez', 'C/ Sol 8, Valencia', 'pedro.martinez@email.com', '633333333'),
(4, '44444444D', 'Sofía', 'López', 'Calle Luna 12, Sevilla', 'sofia.lopez@email.com', '644444444'),
(5, '55555555E', 'Miguel', 'Sánchez', 'Paseo del Prado 3, Madrid', 'miguel.sanchez@email.com', '655555555'),
(6, '66666666F', 'Elena', 'Ramírez', 'C/ Nieve 22, Zaragoza', 'elena.ramirez@email.com', '666666666');

INSERT INTO profesor (id_profesor, Cedula, nombre, apellido, especialidad, email, telefono) VALUES
(1, '12345678P', 'María', 'González', 'Matemáticas', 'maria.gonzalez@centro.com', '600111111'),
(2, '87654321Q', 'Carlos', 'Pérez', 'Lengua y Literatura', 'carlos.perez@centro.com', '600222222'),
(3, '11111111R', 'Ana', 'Martínez', 'Ciencias Naturales', 'ana.martinez@centro.com', '600333333'),
(4, '22222222S', 'Javier', 'Fernández', 'Historia', 'javier.fernandez@centro.com', '600444444');

INSERT INTO asignatura (id_asignatura, codigo, nombre, creditos, horas) VALUES
(1, 'MAT101', 'Matemáticas I', 6, 4),
(2, 'LEN101', 'Lengua Española I', 6, 4),
(3, 'FIS101', 'Física I', 6, 4),
(4, 'HIS101', 'Historia Universal', 4, 3),
(5, 'ING101', 'Inglés Técnico', 4, 3);

INSERT INTO leccion (id_profesor, id_asignatura, id_curso, Periodo_academico, Horario, aula) VALUES
(1, 1, 1, '2025-1', 'Lunes 10:00 - 12:00', 'Aula 101'),
(2, 2, 1, '2025-1', 'Martes 11:00 - 13:00', 'Aula 102'),
(1, 1, 2, '2025-1', 'Miércoles 10:00 - 12:00', 'Aula 101'),
(3, 3, 2, '2025-1', 'Jueves 09:00 - 11:00', 'Aula 203'),
(4, 4, 3, '2025-1', 'Viernes 12:00 - 14:00', 'Aula 301');

INSERT INTO Matricula (id_matricula, id_alumno, id_asignatura, id_curso, cuatrimestre, Anio_academico, calificacion) VALUES
(1, 1, 1, 1, '1er Cuatrimestre', '2025', 90),
(2, 1, 2, 1, '1er Cuatrimestre', '2025', 70),
(3, 2, 1, 1, '1er Cuatrimestre', '2025', 65),
(4, 2, 2, 1, '1er Cuatrimestre', '2025', 86),
(5, 3, 3, 2, '1er Cuatrimestre', '2025', 71),
(6, 3, 1, 2, '1er Cuatrimestre', '2025', 54),
(7, 4, 1, 2, '1er Cuatrimestre', '2025', 45),
(8, 4, 3, 2, '1er Cuatrimestre', '2025', 12),
(9, 5, 2, 1, '1er Cuatrimestre', '2025', 97),  
(10, 5, 1, 1, '1er Cuatrimestre', '2025', 61),
(11, 6, 4, 3, '1er Cuatrimestre', '2025', 87),
(12, 6, 5, 3, '1er Cuatrimestre', '2025', 70);  