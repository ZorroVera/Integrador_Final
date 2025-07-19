-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-07-2024 a las 13:16:19
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_sistema_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cabecera_compra`
--

CREATE TABLE `tb_cabecera_compra` (
  `idCabeceraCompra` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `valorPagar` double(10,2) NOT NULL,
  `fechaCompra` date NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_cabecera_compra`
--

INSERT INTO `tb_cabecera_compra` (`idCabeceraCompra`, `idCliente`, `valorPagar`, `fechaCompra`, `estado`) VALUES
(1, 8, 90.00, '2024-07-18', 1),
(2, 9, 20.00, '2024-07-18', 1),
(3, 10, 36.00, '2024-07-18', 1),
(4, 7, 30.00, '2024-07-18', 1),
(5, 10, 90.00, '2024-07-18', 1),
(6, 9, 100.00, '2024-07-18', 1),
(7, 6, 105.00, '2024-07-18', 1),
(8, 8, 135.00, '2024-07-18', 1),
(9, 10, 105.00, '2024-07-18', 1),
(10, 6, 12.00, '2024-07-18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cabecera_venta`
--

CREATE TABLE `tb_cabecera_venta` (
  `idCabeceraVenta` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `tipodpago` varchar(50) NOT NULL,
  `comprobante` varchar(50) NOT NULL,
  `valorPagar` double(10,2) NOT NULL,
  `fechaVenta` date NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_cabecera_venta`
--

INSERT INTO `tb_cabecera_venta` (`idCabeceraVenta`, `idCliente`, `tipodpago`, `comprobante`, `valorPagar`, `fechaVenta`, `estado`) VALUES
(1, 1, 'YAPE', 'BOLETA', 23.60, '2024-07-18', 1),
(2, 2, 'PLIN', 'BOLETA', 28.32, '2024-07-18', 1),
(3, 5, 'TRANSFERENCIA', 'BOLETA', 94.40, '2024-07-18', 1),
(4, 1, 'CREDITO', 'BOLETA', 82.60, '2024-07-18', 1),
(5, 1, 'DEBITO', 'BOLETA', 29.50, '2024-07-18', 1),
(6, 5, 'DEBITO', 'FACTURA', 47.20, '2024-07-18', 1),
(7, 2, 'EFECTIVO', 'FACTURA', 75.52, '2024-07-18', 1),
(8, 2, 'YAPE', 'FACTURA', 77.88, '2024-07-18', 1),
(9, 2, 'CREDITO', 'FACTURA', 59.00, '2024-07-18', 1),
(10, 4, 'TRANSFERENCIA', 'FACTURA', 106.20, '2024-07-18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `idCategoria` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_categoria`
--

INSERT INTO `tb_categoria` (`idCategoria`, `descripcion`, `estado`) VALUES
(1, 'Laboratorios Roche', 1),
(2, 'Laboratorios Bagó', 1),
(3, 'Laboratorios Farmindustria', 1),
(4, 'Laboratorios AC Farma', 1),
(5, 'Laboratorios Hersil', 1),
(6, 'Laboratorios Silesia', 1),
(7, 'Laboratorios Bristol Myers Squibb', 1),
(8, 'Laboratorios Johnson & Johnson', 1),
(9, 'Laboratorios Pfizer', 1),
(10, 'Laboratorios Andromaco', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_cliente`
--

INSERT INTO `tb_cliente` (`idCliente`, `nombre`, `apellido`, `cedula`, `telefono`, `direccion`, `estado`) VALUES
(1, 'Juan', 'Perez', '12345678', '123456789', 'Chiclayo', 1),
(2, 'Camila', 'Perez', '12345679', '123456789', 'Lambayeque', 1),
(3, 'Rosa', 'Rosales', '23456890', '1234568900', 'Olmos', 1),
(4, 'Juan', 'Juansito', '71309114', '713091148', 'La Victoria', 1),
(5, 'Gilberto', 'Vera', '71309115', '713091142', 'J.L.O.', 1),
(6, 'Laboratorios', 'Roche', '12345345', '123453453', 'Lima', 1),
(7, 'Laboratorios', 'Bagó', '16681614', '123456789', 'Lima-Callao', 1),
(8, 'Laboratorios', 'Farmindustria', '44346510', '123456789', 'Trujillo', 1),
(9, 'Laboratorios', 'AC Farma', '44346511', '123456789', 'Israel', 1),
(10, 'Laboratorios', 'Johnson & Johnson', '16681712', '123456789', 'Tumbes', 1),
(11, 'Juan', 'Perez', '16411059', '979670510', 'CHICLAYO', 1),
(12, 'Ruiz', 'Diaz', '44763627', '123456789', 'tucume', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_compra`
--

CREATE TABLE `tb_detalle_compra` (
  `idDetalleCompra` int(11) NOT NULL,
  `idCabeceraCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` double(10,2) NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `iva` double(10,2) NOT NULL,
  `totalPagar` double(10,2) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_detalle_compra`
--

INSERT INTO `tb_detalle_compra` (`idDetalleCompra`, `idCabeceraCompra`, `idProducto`, `cantidad`, `precioUnitario`, `subtotal`, `iva`, `totalPagar`, `estado`) VALUES
(1, 1, 1, 4, 20.00, 80.00, 0.00, 80.00, 1),
(2, 1, 2, 2, 5.00, 10.00, 0.00, 10.00, 1),
(3, 2, 6, 2, 10.00, 20.00, 0.00, 20.00, 1),
(4, 3, 4, 2, 18.00, 36.00, 0.00, 36.00, 1),
(5, 4, 6, 3, 10.00, 30.00, 0.00, 30.00, 1),
(6, 5, 7, 3, 30.00, 90.00, 0.00, 90.00, 1),
(7, 6, 9, 5, 20.00, 100.00, 0.00, 100.00, 1),
(8, 7, 8, 3, 35.00, 105.00, 0.00, 105.00, 1),
(9, 8, 5, 3, 25.00, 75.00, 0.00, 75.00, 1),
(10, 8, 9, 3, 20.00, 60.00, 0.00, 60.00, 1),
(11, 9, 8, 3, 35.00, 105.00, 0.00, 105.00, 1),
(12, 10, 3, 1, 12.00, 12.00, 0.00, 12.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_venta`
--

CREATE TABLE `tb_detalle_venta` (
  `idDetalleVenta` int(11) NOT NULL,
  `idCabeceraVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` double(10,2) NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `iva` double(10,2) NOT NULL,
  `totalPagar` double(10,2) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_detalle_venta`
--

INSERT INTO `tb_detalle_venta` (`idDetalleVenta`, `idCabeceraVenta`, `idProducto`, `cantidad`, `precioUnitario`, `subtotal`, `iva`, `totalPagar`, `estado`) VALUES
(1, 1, 1, 1, 20.00, 20.00, 3.60, 23.60, 1),
(2, 2, 3, 2, 12.00, 24.00, 4.32, 28.32, 1),
(3, 3, 1, 4, 20.00, 80.00, 14.40, 94.40, 1),
(4, 4, 7, 1, 30.00, 30.00, 5.40, 35.40, 1),
(5, 4, 1, 2, 20.00, 40.00, 7.20, 47.20, 1),
(6, 5, 5, 1, 25.00, 25.00, 4.50, 29.50, 1),
(7, 6, 10, 1, 40.00, 40.00, 7.20, 47.20, 1),
(8, 7, 10, 1, 40.00, 40.00, 7.20, 47.20, 1),
(9, 7, 3, 2, 12.00, 24.00, 4.32, 28.32, 1),
(10, 8, 7, 1, 30.00, 30.00, 5.40, 35.40, 1),
(11, 8, 4, 2, 18.00, 36.00, 6.48, 42.48, 1),
(12, 9, 2, 1, 5.00, 5.00, 0.90, 5.90, 1),
(13, 9, 9, 2, 20.00, 40.00, 7.20, 47.20, 1),
(14, 9, 2, 1, 5.00, 5.00, 0.90, 5.90, 1),
(15, 10, 7, 3, 30.00, 90.00, 16.20, 106.20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto`
--

CREATE TABLE `tb_producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double(10,2) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `porcentajeIva` int(2) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_producto`
--

INSERT INTO `tb_producto` (`idProducto`, `nombre`, `cantidad`, `precio`, `descripcion`, `porcentajeIva`, `idCategoria`, `estado`) VALUES
(1, 'Amoxicilina 20/500mg (Analgésicos)', 7, 20.00, 'Infecciones bacterianas', 18, 1, 1),
(2, 'Paracetamol 10/500mg (Antiinflamatorios)', 10, 5.00, 'Dolor leve a moderado y fiebre', 18, 3, 1),
(3, 'Ibuprofeno 20/400 mg (Antihipertensivos)', 2, 12.00, 'Inflamación y dolor', 18, 3, 1),
(4, 'Enalapril 30/10mg (Antidiabéticos)', 5, 18.00, 'Hipertensión arterial', 18, 7, 1),
(5, 'Metformina 30/850 mg (Antialérgicos)', 7, 25.00, 'Diabetes tipo 2', 18, 7, 1),
(6, 'Loratadina 10/10 mg (Antidepresivos )', 10, 10.00, 'Alergias', 18, 10, 1),
(7, 'Fluoxetina 30/20 mg (Antifúngicos)', 3, 30.00, 'Depresión y trastornos de ansiedad', 18, 6, 1),
(8, 'Fluconazol 4/150 mg (Anticonceptivos)', 11, 35.00, 'Infecciones por hongos', 18, 7, 1),
(9, 'Levonorgestrel 21/5 mg (Broncodilatadores)', 11, 20.00, 'Prevención del embarazo', 18, 2, 1),
(10, 'Salbutamol 100 mcg (inhalador)', 3, 40.00, 'Asma y EPOC (Enfermedad Pulmonar Obstructiva Crónica)', 18, 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_usuario`
--

INSERT INTO `tb_usuario` (`idUsuario`, `nombre`, `apellido`, `usuario`, `password`, `telefono`, `estado`) VALUES
(1, 'Admin', 'Admin', 'admin', 'admin', '967278270', 1),
(2, 'Angel', 'Vera', 'angel123', 'angel123', '9782788990', 1),
(3, 'Luis', 'Fernandez', 'luis123', 'luis123', '123456789', 1),
(4, 'Juan', 'Perez', 'juan123', 'juan123', '123456789', 1),
(5, 'Oblitas', 'Perez', 'oblitas123', 'oblitas123', '123456789', 1),
(6, 'Ricardo', 'Mendoza', 'ricardo123', 'ricardo123', '123456789', 1),
(7, 'Jorge', 'Luna', 'jorge123', 'jorge123', '123456789', 1),
(8, 'Juanita', 'Lucero', 'juanita123', 'juanita123', '123456789', 1),
(9, 'Camila', 'Perez', 'camila123', 'camila123', '123456789', 1),
(10, 'Rosa', 'Rosales', 'rosa123', 'rosa123', '123456789', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_cabecera_compra`
--
ALTER TABLE `tb_cabecera_compra`
  ADD PRIMARY KEY (`idCabeceraCompra`);

--
-- Indices de la tabla `tb_cabecera_venta`
--
ALTER TABLE `tb_cabecera_venta`
  ADD PRIMARY KEY (`idCabeceraVenta`);

--
-- Indices de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `tb_detalle_compra`
--
ALTER TABLE `tb_detalle_compra`
  ADD PRIMARY KEY (`idDetalleCompra`);

--
-- Indices de la tabla `tb_detalle_venta`
--
ALTER TABLE `tb_detalle_venta`
  ADD PRIMARY KEY (`idDetalleVenta`);

--
-- Indices de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_cabecera_compra`
--
ALTER TABLE `tb_cabecera_compra`
  MODIFY `idCabeceraCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_cabecera_venta`
--
ALTER TABLE `tb_cabecera_venta`
  MODIFY `idCabeceraVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tb_detalle_compra`
--
ALTER TABLE `tb_detalle_compra`
  MODIFY `idDetalleCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tb_detalle_venta`
--
ALTER TABLE `tb_detalle_venta`
  MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
