-- Data generica
INSERT INTO clientes (nombre, apellido, email) VALUES 
('Juan', 'Pérez', 'juan.perez@email.com'),
('María', 'Gómez', 'mgomez@email.com'),
('Carlos', 'López', 'clopez@email.com'),
('Ana', 'Martínez', 'ana.m@email.com'),
('Luis', 'Fernández', 'luisf@email.com'),
('Laura', 'Torres', 'laura.t@email.com'),
('Diego', 'Ramírez', 'dramirez@email.com'),
('Sofía', 'Herrera', 'sherrera@email.com'),
('Martín', 'Castro', 'mcastro@email.com'),
('Valentina', 'Silva', 'vsilva@email.com');

INSERT INTO habitaciones (capacidad, ubicacion, estado) VALUES 
(2, 'Piso 1 - Frente', 'Disponible'),
(2, 'Piso 1 - Frente', 'Ocupada'),
(4, 'Piso 1 - Contrafrente', 'Disponible'),
(1, 'Piso 2 - Frente', 'Mantenimiento'),
(2, 'Piso 2 - Frente', 'Disponible'),
(4, 'Piso 2 - Contrafrente', 'Ocupada'),
(2, 'Piso 3 - Suite', 'Disponible'),
(2, 'Piso 3 - Suite', 'Reservada'),
(5, 'Planta Baja - Familiar', 'Disponible'),
(2, 'Planta Baja - Accesible', 'Disponible');

INSERT INTO reservas (cliente_id, habitacion_id, check_in, check_out) VALUES 
-- Reservas pasadas (Historial)
(4, 1, '2026-04-10', '2026-04-15'),
(7, 5, '2026-05-01', '2026-05-05'),

-- Reservas actuales / en curso
(1, 2, '2026-05-20', '2026-05-30'),
(2, 6, '2026-05-25', '2026-06-05'),
(9, 9, '2026-05-28', '2026-06-02'),

-- Reservas futuras
(3, 8, '2026-06-10', '2026-06-15'),
(6, 7, '2026-06-01', '2026-06-03'),
(10, 2, '2026-06-05', '2026-06-10'),
(5, 3, '2026-07-01', '2026-07-10'),
(8, 10, '2026-08-15', '2026-08-20');