-- Crear base de datos
CREATE DATABASE ventas;

-- Usar base de datos
USE ventas;

-- Crear tabla tb_categoria
CREATE TABLE tb_categoria (
  idCategoria INT(11) PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(200) NOT NULL,
  estado INT(1) NOT NULL
);

-- Crear tabla tb_producto
CREATE TABLE tb_producto (
  idProducto INT(11) PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  cantidad INT(11) NOT NULL,
  precio DOUBLE(10,2) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  porcentajeIva INT(2) NOT NULL,
  idCategoria INT(11) NOT NULL,
  CONSTRAINT fk_tb_producto_tb_categoria FOREIGN KEY (idCategoria) REFERENCES tb_categoria(idCategoria)
);

-- Crear tabla tb_cliente
CREATE TABLE tb_cliente (
  idCliente INT(11) PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  apellido VARCHAR(30) NOT NULL,
  cedula VARCHAR(15) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  estado INT(1) NOT NULL
);

-- Crear tabla tb_usuario
CREATE TABLE tb_usuario (
  idUsuario INT(11) PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  apellido VARCHAR(30) NOT NULL,
  usuario VARCHAR(15) NOT NULL,
  password VARCHAR(15) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  estado INT(1) NOT NULL
);

-- Crear tabla tb_cabecera_venta
CREATE TABLE tb_cabecera_venta (
  idCabeceraVenta INT(11) PRIMARY KEY AUTO_INCREMENT,
  idCliente INT(11) NOT NULL,
  tipoPago VARCHAR(50) NOT NULL,
  comprobante VARCHAR(50) NOT NULL,
  valorPagar DOUBLE(10,2) NOT NULL,
  fechaVenta DATE NOT NULL,
  estado INT(1) NOT NULL,
  CONSTRAINT fk_tb_cabecera_venta_tb_cliente FOREIGN KEY (idCliente) REFERENCES tb_cliente(idCliente)
);

-- Crear tabla tb_detalle_venta
CREATE TABLE tb_detalle_venta (
  idDetalleVenta INT(11) PRIMARY KEY AUTO_INCREMENT,
  idCabeceraVenta INT(11) NOT NULL,
  idProducto INT(11) NOT NULL,
  cantidad INT(11) NOT NULL,
  precioUnitario DOUBLE(10,2) NOT NULL,
  subtotal DOUBLE(10,2) NOT NULL,
  iva DOUBLE(10,2) NOT NULL,
  totalPagar DOUBLE(10,2) NOT NULL,
  CONSTRAINT fk_tb_detalle_venta_tb_cabecera_venta FOREIGN KEY (idCabeceraVenta) REFERENCES tb_cabecera_venta(idCabeceraVenta),
  CONSTRAINT fk_tb_detalle_venta_tb_producto FOREIGN KEY (idProducto) REFERENCES tb_producto(idProducto)
);

-- Crear tabla tb_cabecera_compra
CREATE TABLE tb_cabecera_compra (
  idCabeceraCompra INT(11) PRIMARY KEY AUTO_INCREMENT,
  idProveedor INT(11) NOT NULL,
  tipoPago VARCHAR(50) NOT NULL,
  comprobante VARCHAR(50) NOT NULL,
  valorPagar DOUBLE(10,2) NOT NULL,
  fechaCompra DATE NOT NULL,
  estado INT(1) NOT NULL
);

-- Crear tabla tb_detalle_compra
CREATE TABLE tb_detalle_compra (
  idDetalleCompra INT(11) PRIMARY KEY AUTO_INCREMENT,
  idCabeceraCompra INT(11) NOT NULL,
  idProducto INT(11) NOT NULL,
  cantidad INT(11) NOT NULL,
  precioUnitario DOUBLE(10,2) NOT NULL,
  subtotal DOUBLE(10,2),
  iva DOUBLE(10,2) NOT NULL,
  totalPagar DOUBLE(10,2) NOT NULL,
  estado INT(1),
  CONSTRAINT fk_tb_detalle_compra_tb_cabecera_compra FOREIGN KEY (idCabeceraCompra) REFERENCES tb_cabecera_compra(idCabeceraCompra),
  CONSTRAINT fk_tb_detalle_compra_tb_producto FOREIGN KEY (idProducto) REFERENCES tb_producto(idProducto)
);

DELIMITER $$

-- Crear un nuevo registro en tb_categoria
CREATE PROCEDURE sp_insert_categoria(IN p_descripcion VARCHAR(200), IN p_estado INT)
BEGIN
    INSERT INTO tb_categoria (descripcion, estado) VALUES (p_descripcion, p_estado);
END $$

-- Leer registros de tb_categoria
CREATE PROCEDURE sp_get_categorias()
BEGIN
    SELECT * FROM tb_categoria;
END $$

-- Actualizar un registro en tb_categoria
CREATE PROCEDURE sp_update_categoria(IN p_idCategoria INT, IN p_descripcion VARCHAR(200), IN p_estado INT)
BEGIN
    UPDATE tb_categoria SET descripcion = p_descripcion, estado = p_estado WHERE idCategoria = p_idCategoria;
END $$

-- Eliminar un registro de tb_categoria
CREATE PROCEDURE sp_delete_categoria(IN p_idCategoria INT)
BEGIN
    DELETE FROM tb_categoria WHERE idCategoria = p_idCategoria;
END $$

DELIMITER ;

DELIMITER $$

-- Crear un nuevo registro en tb_producto
CREATE PROCEDURE sp_insert_producto(IN p_nombre VARCHAR(100), IN p_cantidad INT, IN p_precio DOUBLE, IN p_descripcion VARCHAR(200), IN p_porcentajeIva INT, IN p_idCategoria INT)
BEGIN
    INSERT INTO tb_producto (nombre, cantidad, precio, descripcion, porcentajeIva, idCategoria) 
    VALUES (p_nombre, p_cantidad, p_precio, p_descripcion, p_porcentajeIva, p_idCategoria);
END $$

-- Leer registros de tb_producto
CREATE PROCEDURE sp_get_productos()
BEGIN
    SELECT * FROM tb_producto;
END $$

-- Actualizar un registro en tb_producto
CREATE PROCEDURE sp_update_producto(IN p_idProducto INT, IN p_nombre VARCHAR(100), IN p_cantidad INT, IN p_precio DOUBLE, IN p_descripcion VARCHAR(200), IN p_porcentajeIva INT, IN p_idCategoria INT)
BEGIN
    UPDATE tb_producto 
    SET nombre = p_nombre, cantidad = p_cantidad, precio = p_precio, descripcion = p_descripcion, porcentajeIva = p_porcentajeIva, idCategoria = p_idCategoria 
    WHERE idProducto = p_idProducto;
END $$

-- Eliminar un registro de tb_producto
CREATE PROCEDURE sp_delete_producto(IN p_idProducto INT)
BEGIN
    DELETE FROM tb_producto WHERE idProducto = p_idProducto;
END $$

DELIMITER ;

DELIMITER $$

-- Crear un nuevo registro en tb_cliente
CREATE PROCEDURE sp_insert_cliente(IN p_nombre VARCHAR(30), IN p_apellido VARCHAR(30), IN p_cedula VARCHAR(15), IN p_telefono VARCHAR(15), IN p_direccion VARCHAR(100), IN p_estado INT)
BEGIN
    INSERT INTO tb_cliente (nombre, apellido, cedula, telefono, direccion, estado) 
    VALUES (p_nombre, p_apellido, p_cedula, p_telefono, p_direccion, p_estado);
END $$

-- Leer registros de tb_cliente
CREATE PROCEDURE sp_get_clientes()
BEGIN
    SELECT * FROM tb_cliente;
END $$

-- Actualizar un registro en tb_cliente
CREATE PROCEDURE sp_update_cliente(IN p_idCliente INT, IN p_nombre VARCHAR(30), IN p_apellido VARCHAR(30), IN p_cedula VARCHAR(15), IN p_telefono VARCHAR(15), IN p_direccion VARCHAR(100), IN p_estado INT)
BEGIN
    UPDATE tb_cliente 
    SET nombre = p_nombre, apellido = p_apellido, cedula = p_cedula, telefono = p_telefono, direccion = p_direccion, estado = p_estado 
    WHERE idCliente = p_idCliente;
END $$

-- Eliminar un registro de tb_cliente
CREATE PROCEDURE sp_delete_cliente(IN p_idCliente INT)
BEGIN
    DELETE FROM tb_cliente WHERE idCliente = p_idCliente;
END $$

DELIMITER ;

-- Insertar datos en tb_categoria
INSERT INTO tb_categoria (descripcion, estado) VALUES ('LAB SAC', 1);
INSERT INTO tb_categoria (descripcion, estado) VALUES ('J&J', 1);
INSERT INTO tb_categoria (descripcion, estado) VALUES ('BAYER', 1);

-- Insertar datos en tb_producto
INSERT INTO tb_producto (nombre, cantidad, precio, descripcion, porcentajeIva, idCategoria) VALUES ('Paracetamol', 50, 3, 'Pastilla', 12, 1);
INSERT INTO tb_producto (nombre, cantidad, precio, descripcion, porcentajeIva, idCategoria) VALUES ('Betametasona', 100, 1.50, 'Ampolla', 12, 2);
INSERT INTO tb_producto (nombre, cantidad, precio, descripcion, porcentajeIva, idCategoria) VALUES ('Ibuprofeno', 200, 2.50, 'Tableta', 12, 3);


-- Insertar datos en tb_cliente
INSERT INTO tb_cliente (nombre, apellido, cedula, telefono, direccion, estado) VALUES ('Juan', 'Pérez', '1234567890', '0987654321', 'Calle Falsa 123', 1);
INSERT INTO tb_cliente (nombre, apellido, cedula, telefono, direccion, estado) VALUES ('María', 'González', '0987654321', '1234567890', 'Avenida Siempre Viva 742', 1);
INSERT INTO tb_cliente (nombre, apellido, cedula, telefono, direccion, estado) VALUES ('Pedro', 'Martínez', '1122334455', '1122334455', 'Boulevard Central 45', 1);

-- Insertar datos en tb_usuario
INSERT INTO tb_usuario (nombre, apellido, usuario, password, telefono, estado) VALUES ('Carlos', 'López', 'clopez', 'password123', '0987123456', 1);
INSERT INTO tb_usuario (nombre, apellido, usuario, password, telefono, estado) VALUES ('Ana', 'Ramírez', 'aramirez', 'password456', '0987234567', 1);
INSERT INTO tb_usuario (nombre, apellido, usuario, password, telefono, estado) VALUES ('Luis', 'Hernández', 'lhernandez', 'password789', '0987345678', 1);
