-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2019 at 05:43 PM
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
  `precio_unit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_tipo_cocina` int(10) NOT NULL,
  `tiempo_menu` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `foto_alim` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `existencia` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(1, 'juan', 'pepe', 'na', 'jefe', 2, '$2y$10$0', 'beto@mail', '594a2f88be6423381cb3c5f3cf6f248f'),
(2, 'juan', 'pepe', 'na', 'jefe', 2, '$2y$10$h.NEezLtdIc9uLn3Zkbml.3kaDx.MMf/dQIXvUA2Yg/wPr/7QLL7K', 'beto@mail', '358e6e5f1325050423113849a0aeb249'),
(3, 'beto', 'pepe', 'na', 'jefe', 2, '$2y$10$PW.NaKHFaaDZNsaaHEM7Vu74yhMhkuVZdSaDjrTuSx6I13So4AQ8.', 'beto@gmail.com', 'a5367a226eb87f9313c2a86224e50c6f'),
(4, 'beto', 'pepe', 'na', 'jefe', 2, '$2y$10$CZNOt8Se9YzaXY6M.WmJSOSe6huWSyrNarD9dQet8mODd93YqKc5u', 'beto@gmail.com', 'e4ec3d004587c3d97d8b340ee24c63d3'),
(5, 'fd', 'pepe', 'na', 'jefe', 2, '$2y$10$tHar8s5lx5nvPrOaBoMYf.dDYzbGN9Z0hw.DgUzw0MSOo4yDoAkBW', 'beto@gmail.com', '94574891ab17f57de133627922df93b6'),
(6, 'leandro', 'ivan', 'tamay', 'gato', 2, '$2y$10$L18HHm6kWe9jPxyIF.e1ZuY/xQSmz.m8WtdoMFXMgH.ZZM9vtdCLu', 'leandro@gmail.com', '31f10dd6b75e11df74053de205fcd30e'),
(7, 'antonia', 'aguilar', 'america', 'jefe', 2, '$2y$10$wWPYnHkr0QLl85XO/FC3O.JaZpWCg6LsejyyEmqvMmbGGUaiKR0oW', 'antonia@gmail.com', '290a4d77d330cbd57017d90a6c100773');

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
(58, 56, 1, '1234', 'pendiete', 'no definida', 1892),
(66, 56, 1, '1234', 'no definida', '', 1892);

-- --------------------------------------------------------

--
-- Table structure for table `publicidad`
--

CREATE TABLE `publicidad` (
  `id_pub` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
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
  MODIFY `id_empleado` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `establecimientos`
--
ALTER TABLE `establecimientos`
  MODIFY `id_estab` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

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
