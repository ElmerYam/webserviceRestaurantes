-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 12, 2019 at 02:17 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `alimentos`
--

CREATE TABLE `alimentos` (
  `id_alim` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_alim` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_alim` text COLLATE utf8_spanish_ci NOT NULL,
  `u_medida` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `tiempo_prep` int(3) NOT NULL,
  `precio_unit` float NOT NULL,
  `id_tipo_cocina` int(10) NOT NULL,
  `tiempo_menu` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `foto_alim` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `existencia` int(3) NOT NULL,
  `id_estab` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `alimentos`
--

INSERT INTO `alimentos` (`id_alim`, `nombre_alim`, `descripcion_alim`, `u_medida`, `tiempo_prep`, `precio_unit`, `id_tipo_cocina`, `tiempo_menu`, `foto_alim`, `existencia`, `id_estab`) VALUES
('HAM02', 'e ', 'e', 'e', 10, 3566, 1, 'Plato fuerte', '/e', 20, 0),
('HAM12', 'Hamburguesa vegetariana', 'Pizza elaborada únicamente con vegetales selectos de la región.', 'pieza', 20, 256.87, 1, 'Plato fuerte', '/assets/imagenes/etc/etc/imagen2.png', 2, 2),
('PAS435', 'Pasta bolognesa', 'Contiene carne de res molida, un toque de picante, especias de la región de Turquía,  y otras cosas mas.', 'Orden', 90, 300, 3, 'Entremes', './assets/img/hamburguesa.jpg', 4, 0),
('PIZ02', 'Pizza vegetariana', 'Pizza elaborada únicamente con vegetales selectos de la región.', 'pieza', 20, 345.65, 1, 'Plato fuerte', './assets/img/vacio.jpg', 2, 0),
('PIZ23', 'Pizza mejiqueña', 'Pizza elaborada únicamente con vegetales selectos de la región.', 'Pieza', 20, 256.87, 2, 'Plato fuerte', './assets/img/vacio.jpg', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id_cte` int(10) NOT NULL,
  `nombre_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_cliente` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `correo_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `password_cliente` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `num_interior_cliente` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `num_exterior_cliente` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `calle_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cruzamiento1_calle_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cruzamiento2_calle_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `colonia_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `ubicacion_gps_cliente` point DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id_cte`, `nombre_cliente`, `primer_apellido_cliente`, `segundo_apellido_cliente`, `telefono_cliente`, `correo_cliente`, `password_cliente`, `num_interior_cliente`, `num_exterior_cliente`, `calle_cliente`, `cruzamiento1_calle_cliente`, `cruzamiento2_calle_cliente`, `colonia_cliente`, `ciudad_cliente`, `ubicacion_gps_cliente`) VALUES
(1, 'paco', 'mendez', 'perez', '987654321', 'paco@mail', '1234', '2-bis', '56', 'margarita maza', '1 de mayo', '', 'caribe', 'Chetumal', '');

-- --------------------------------------------------------

--
-- Table structure for table `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `folio` int(11) NOT NULL,
  `id_alim` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `precio_unit_alim` float NOT NULL,
  `cantidad` float NOT NULL,
  `subtotal` float NOT NULL,
  `lugar_entrega` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(8) NOT NULL,
  `nombre_emp` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido_emp` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido_emp` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `puesto` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `id_estab` int(5) NOT NULL,
  `password_emp` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `correo_emp` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `claveApi` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `establecimientos`
--

CREATE TABLE `establecimientos` (
  `id_estab` int(5) NOT NULL,
  `nombre_estab` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `num_exterior_estab` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `calle_estab` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cruzamiento1_calle_estab` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cruzamiento2_calle_estab` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `colonia_estab` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad_estab` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_estab` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `correo_estab` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `horarios` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_estab` text COLLATE utf8_spanish_ci NOT NULL,
  `id_tipo_cocina` int(10) NOT NULL,
  `serv_domicilio` tinyint(1) NOT NULL,
  `serv_reserv` tinyint(1) NOT NULL,
  `calificacion` int(3) NOT NULL,
  `id_tipo_rest` int(10) NOT NULL,
  `ubicacion_gps_estab` point DEFAULT NULL,
  `foto_estab` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `logo_estab` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `folio` int(11) NOT NULL,
  `id_cte` int(10) NOT NULL,
  `id_estab` int(5) NOT NULL,
  `hora_solicitud` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `status_pedido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `forma_pago` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publicidad`
--

CREATE TABLE `publicidad` (
  `id_pub` int(10) NOT NULL,
  `id_estab` int(5) NOT NULL,
  `nombre_pub` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `imagen_pub` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_pub` text COLLATE utf8_spanish_ci NOT NULL,
  `productos_pub` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id_reservacion` int(10) NOT NULL,
  `id_estab` int(5) NOT NULL,
  `num_mesa` int(2) NOT NULL,
  `cantidad_personas` int(2) NOT NULL,
  `hora_reservacion` datetime NOT NULL,
  `hora_registro` datetime NOT NULL,
  `id_cte` int(10) NOT NULL,
  `status_reservacion` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_cocina`
--

CREATE TABLE `tipo_cocina` (
  `id_tipo_cocina` int(10) NOT NULL,
  `nombre_tipo_cocina` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_restaurante`
--

CREATE TABLE `tipo_restaurante` (
  `id_tipo_rest` int(10) NOT NULL,
  `nombre_tipo_rest` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tipo_restaurante`
--

INSERT INTO `tipo_restaurante` (`id_tipo_rest`, `nombre_tipo_rest`) VALUES
(1, 'Fonda'),
(2, 'Restaurante Familiar'),
(3, 'Taquería'),
(4, 'Tortería'),
(5, 'Pizzería'),
(6, 'Marisquería'),
(7, 'Bufet'),
(8, 'Restaurante comida rapida');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alimentos`
--
ALTER TABLE `alimentos`
  ADD PRIMARY KEY (`id_alim`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cte`);

--
-- Indexes for table `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD KEY `fk_folio` (`folio`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_id_estab` (`id_estab`);

--
-- Indexes for table `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD PRIMARY KEY (`id_estab`),
  ADD KEY `id_tipo_cocina` (`id_tipo_cocina`),
  ADD KEY `id_tipo_rest` (`id_tipo_rest`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `id_cte` (`id_cte`),
  ADD KEY `id_estab` (`id_estab`);

--
-- Indexes for table `publicidad`
--
ALTER TABLE `publicidad`
  ADD PRIMARY KEY (`id_pub`),
  ADD KEY `id_estab` (`id_estab`);

--
-- Indexes for table `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id_reservacion`),
  ADD KEY `id_id_estab` (`id_estab`),
  ADD KEY `fk_id_cliente` (`id_cte`);

--
-- Indexes for table `tipo_cocina`
--
ALTER TABLE `tipo_cocina`
  ADD PRIMARY KEY (`id_tipo_cocina`);

--
-- Indexes for table `tipo_restaurante`
--
ALTER TABLE `tipo_restaurante`
  ADD PRIMARY KEY (`id_tipo_rest`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cte` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `establecimientos`
--
ALTER TABLE `establecimientos`
  MODIFY `id_estab` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `publicidad`
--
ALTER TABLE `publicidad`
  MODIFY `id_pub` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id_reservacion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_cocina`
--
ALTER TABLE `tipo_cocina`
  MODIFY `id_tipo_cocina` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_restaurante`
--
ALTER TABLE `tipo_restaurante`
  MODIFY `id_tipo_rest` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `fk_folio` FOREIGN KEY (`folio`) REFERENCES `pedidos` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_id_estab` FOREIGN KEY (`id_estab`) REFERENCES `establecimientos` (`id_estab`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD CONSTRAINT `establecimientos_ibfk_1` FOREIGN KEY (`id_tipo_cocina`) REFERENCES `tipo_cocina` (`id_tipo_cocina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `establecimientos_ibfk_2` FOREIGN KEY (`id_tipo_rest`) REFERENCES `tipo_restaurante` (`id_tipo_rest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cte`) REFERENCES `clientes` (`id_cte`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_estab`) REFERENCES `establecimientos` (`id_estab`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publicidad`
--
ALTER TABLE `publicidad`
  ADD CONSTRAINT `publicidad_ibfk_1` FOREIGN KEY (`id_estab`) REFERENCES `establecimientos` (`id_estab`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cte`) REFERENCES `clientes` (`id_cte`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_id_estab` FOREIGN KEY (`id_estab`) REFERENCES `establecimientos` (`id_estab`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
