-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 05, 2019 at 12:04 AM
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
(6, 'leandro', 'ivan', 'tamay', 'gato', 2, '$2y$10$L18HHm6kWe9jPxyIF.e1ZuY/xQSmz.m8WtdoMFXMgH.ZZM9vtdCLu', 'leandro@gmail.com', '31f10dd6b75e11df74053de205fcd30e');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `folio` int(11) NOT NULL,
  `id_cte` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
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
(58, '56', 1, '1234', 'pendiete', 'no definida', 1892),
(64, 'a', 0, 'a', 'a', 'a', 0),
(65, 'b', 2, 'b', 'b', 'b', 0),
(66, '56', 1, '1234', 'no definida', '', 1892),
(67, '', 0, '', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`folio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
