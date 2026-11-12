
-- CREACIÓN DE LA TABLA CLIENTES

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    edad INT CHECK (edad >= 18),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- CREACIÓN DE LA TABLA PRODUCTOS

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    fecha_alta DATE DEFAULT CURRENT_DATE
);

-- CREACIÓN DE LA TABLA VENTAS

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario > 0),
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- CARGA INICIAL DE DATOS

BEGIN;

INSERT INTO clientes (nombre, apellido, email, edad)
VALUES
('Juan', 'Perez', 'juan.perez@gmail.com', 28),
('Maria', 'Gomez', 'maria.gomez@gmail.com', 34),
('Lucas', 'Fernandez', 'lucas.fernandez@gmail.com', 22),
('Sofia', 'Martinez', 'sofia.martinez@gmail.com', 41),
('Pedro', 'Rodriguez', 'pedro.rodriguez@gmail.com', 30);

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES
('Notebook Lenovo', 'Tecnologia', 850000.00, 15),
('Mouse Logitech', 'Tecnologia', 25000.00, 40),
('Escritorio', 'Muebles', 180000.00, 12),
('Silla de oficina', 'Muebles', 95000.00, 20),
('Auriculares Sony', 'Audio', 75000.00, 30);

INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario)
VALUES
(1, 1, 1, 850000.00),
(2, 2, 2, 25000.00),
(3, 3, 1, 180000.00),
(4, 4, 2, 95000.00),
(5, 5, 1, 75000.00),
(1, 2, 1, 25000.00);

COMMIT;

-- ACTUALIZACIÓN DE PRECIOS

SELECT id_producto, nombre, categoria, precio
FROM productos
WHERE categoria = 'Tecnologia';

UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Tecnologia';

-- ELIMINACIÓN DE VENTA DE PRUEBA

SELECT *
FROM ventas
WHERE id_venta = 6;

DELETE FROM ventas
WHERE id_venta = 6;
