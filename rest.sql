-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2019 at 05:19 PM
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
  `existencia` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `alimentos`
--

INSERT INTO `alimentos` (`id_alim`, `nombre_alim`, `descripcion_alim`, `u_medida`, `tiempo_prep`, `precio_unit`, `id_tipo_cocina`, `tiempo_menu`, `foto_alim`, `existencia`) VALUES
('HAM02', 'Hamburguesa ', 'Hamburguesa', 'unidad', 10, 35, 1, 'Plato fuerte', './assets/img/hamburguesa.jpg', 20),
('PAS435', 'Pasta bolognesa', 'Contiene carne de res molida, un toque de picante, especias de la región de Turquía,  y otras cosas mas.', 'Orden', 90, 300, 3, 'Entremes', './assets/img/hamburguesa.jpg', 4),
('PIZ02', 'Pizza vegetariana', 'Pizza elaborada únicamente con vegetales selectos de la región.', 'pieza', 20, 345.65, 1, 'Plato fuerte', './assets/img/vacio.jpg', 2),
('PIZ23', 'Pizza mejiqueña', 'Pizza elaborada únicamente con vegetales selectos de la región.', 'Pieza', 20, 256.87, 2, 'Plato fuerte', './assets/img/vacio.jpg', 2);

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

-- --------------------------------------------------------

--
-- Table structure for table `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `folio` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
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

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre_emp`, `primer_apellido_emp`, `segundo_apellido_emp`, `puesto`, `id_estab`, `password_emp`, `correo_emp`, `claveApi`) VALUES
(8, 'alberto', 'perez', 'mendez', 'cajero', 1, '$2y$10$20dkaWxSELReVKX2PAec0uUzAIS4HNxTqr/CC453Gvx7Z2yip2Nie', 'alberto@gmail.com', '03ba212ca774e05399b4b331b537efa2'),
(9, 'leandro', 'perez', 'mendez', 'cajero', 1, '$2y$10$oH5szXaqfBmbxlciRCkPxuy9EZGajGJ5dk3XZYIu0Esv8SQ4vkkK6', 'leandro@gmail.com', '7cb309447c89d035a2a6f6be18615653'),
(10, 'elmer', 'perez', 'mendez', 'cajero', 1, '$2y$10$nxj59JVoWl7OBLzGCes3yev8hksGnBX6Jv2/LQYVhiZcZJ/r/Wdu.', 'elmer@gmail.com', 'fd16a1363b7547fb011cb6f32abd728d'),
(11, 'alexis', 'perez', 'mendez', 'cajero', 1, '$2y$10$3aPyATtdM8CGavfRwTj2SuZ5Fk6dirq40w6j/J/QKwMXFwwS/xUHS', 'alexis@gmail.com', '25a893dcd1cc55b8d9bbc630cce92b84');

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

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`folio`, `id_cte`, `id_estab`, `hora_solicitud`, `status_pedido`, `forma_pago`, `total`) VALUES
(58, 23, 2, '23', 'fish', 'fish', 45),
(67, 23, 2, '23', 'fish-sa', 'fish-sa', 45),
(102, 23, 2, '23', 'nofish', 'fish', 45),
(103, 23, 2, '23', 'nofish', 'nofish', 45),
(104, 12, 0, 'a', 'pendiente', 'efectivo', 9);

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
  `id_reservacion` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
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
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indexes for table `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD PRIMARY KEY (`id_estab`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`folio`);

--
-- Indexes for table `publicidad`
--
ALTER TABLE `publicidad`
  ADD PRIMARY KEY (`id_pub`);

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
  MODIFY `id_cte` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `establecimientos`
--
ALTER TABLE `establecimientos`
  MODIFY `id_estab` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `publicidad`
--
ALTER TABLE `publicidad`
  MODIFY `id_pub` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_cocina`
--
ALTER TABLE `tipo_cocina`
  MODIFY `id_tipo_cocina` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_restaurante`
--
ALTER TABLE `tipo_restaurante`
  MODIFY `id_tipo_rest` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
