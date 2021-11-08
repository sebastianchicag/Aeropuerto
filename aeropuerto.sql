-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2021 a las 22:48:34
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aeropuerto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE TABLE `avion` (
  `cod_avion` int(11) NOT NULL,
  `capacidad` varchar(255) DEFAULT NULL,
  `descipcion` varchar(255) DEFAULT NULL,
  `marca` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `cod_estado` int(11) NOT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`cod_estado`, `estado`) VALUES
(1, 'Despegue'),
(2, 'Aterrizaje');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `cod_factura` int(11) NOT NULL,
  `asiento` varchar(255) DEFAULT NULL,
  `clase` varchar(255) DEFAULT NULL,
  `cod_vuelo` int(11) NOT NULL,
  `fecha_reg` date DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`cod_factura`, `asiento`, `clase`, `cod_vuelo`, `fecha_reg`, `total`) VALUES
(1, '405B', 'VIP', 2, '2021-11-08', '350.150');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `cod_marca` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`cod_marca`, `nombre`) VALUES
(1, 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `cod_persona` int(11) NOT NULL,
  `apellido_persona` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `doc_persona` varchar(255) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `nombre_persona` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `tipo_documento` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cod_persona`, `apellido_persona`, `celular`, `correo`, `doc_persona`, `fecha_nac`, `fecha_reg`, `nombre_persona`, `sexo`, `tipo_documento`) VALUES
(1, 'Chica Giraldo', '3235807900', 'juan@gmail.com', '1094955221', '1996-02-13', '2021-11-04', 'Juan Sebastian', 'Hombre', 'Cedula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `cod_ruta` int(11) NOT NULL,
  `destino` varchar(255) DEFAULT NULL,
  `origen` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`cod_ruta`, `destino`, `origen`) VALUES
(1, 'Armenia', 'Bogota'),
(2, 'Pereira', 'Medellin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `cod_vuelo` int(11) NOT NULL,
  `cod_estado` int(11) NOT NULL,
  `cod_marca` int(11) NOT NULL,
  `cod_persona` int(11) NOT NULL,
  `cod_ruta` int(11) NOT NULL,
  `fecha_reg` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vuelo`
--

INSERT INTO `vuelo` (`cod_vuelo`, `cod_estado`, `cod_marca`, `cod_persona`, `cod_ruta`, `fecha_reg`) VALUES
(2, 2, 1, 1, 1, '2021-11-03'),
(3, 1, 1, 1, 1, '2021-11-02'),
(5, 2, 1, 1, 1, '2021-11-02'),
(7, 1, 1, 1, 1, '2021-11-01'),
(8, 1, 1, 1, 1, '2021-11-02'),
(9, 1, 1, 1, 1, '2021-11-02'),
(10, 1, 1, 1, 1, '2021-11-02'),
(11, 1, 1, 1, 1, '2021-11-02'),
(12, 1, 1, 1, 1, '2021-11-02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`cod_avion`),
  ADD KEY `FK4xrrgrykxn81hk31l0pa5jkft` (`marca`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`cod_estado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`cod_factura`),
  ADD KEY `FK1ag9dg8ej4eu7qaovk230fnwx` (`cod_vuelo`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`cod_marca`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`cod_persona`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`cod_ruta`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`cod_vuelo`),
  ADD KEY `FKmikp9hl8f46695hnp8fx48tyk` (`cod_ruta`),
  ADD KEY `FKf5xw9ka1vyu3fmu9m8ilgqy81` (`cod_persona`),
  ADD KEY `FK9rqtocl71j3dmqwtochk129jh` (`cod_marca`),
  ADD KEY `FK22sles0xswmhkab6gk155hvqr` (`cod_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avion`
--
ALTER TABLE `avion`
  MODIFY `cod_avion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `cod_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `cod_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `cod_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `cod_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `cod_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `cod_vuelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
