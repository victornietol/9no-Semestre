-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2019 a las 02:27:07
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ultima`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `numclie` int(4) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `repclie` int(3) DEFAULT NULL,
  `limitecredito` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`numclie`, `nombre`, `repclie`, `limitecredito`) VALUES
(2101, 'Luis Garcia Anton', 106, '65000.00'),
(2102, 'Alvaro Rodriguez', 101, '65000.00'),
(2103, 'Jaime Llorens', 105, '50000.00'),
(2105, 'Antonio Canales', 101, '45000.00'),
(2106, 'Juan Suarez', 102, '65000.00'),
(2107, 'Julian Lopez', 110, '35000.00'),
(2108, 'Julia Antequera', 109, '55000.00'),
(2109, 'Alberto Juanes', 103, '25000.00'),
(2111, 'Cristobal Garcia', 103, '50000.00'),
(2112, 'Maria Silva', 108, '50000.00'),
(2113, 'Luisa Maron', 104, '20000.00'),
(2114, 'Cristina Bulini', 102, '20000.00'),
(2115, 'Vicente Martinez', 101, '20000.00'),
(2117, 'Carlos Tena', 106, '35000.00'),
(2118, 'Junipero Alvarez', 108, '60000.00'),
(2119, 'Salomon Bueno', 109, '25000.00'),
(2120, 'Juan Malo', 102, '50000.00'),
(2121, 'Vicente Rios', 103, '45000.00'),
(2122, 'Jose Marchete', 105, '30000.00'),
(2123, 'Jose Libros', 102, '40000.00'),
(2124, 'Juan Bolto', 107, '40000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Numemp` int(3) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `edad` int(2) DEFAULT NULL,
  `oficina` int(2) DEFAULT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `contrato` date DEFAULT NULL,
  `jefe` int(3) DEFAULT NULL,
  `cuota` decimal(8,2) DEFAULT NULL,
  `ventas` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Numemp`, `nombre`, `edad`, `oficina`, `titulo`, `contrato`, `jefe`, `cuota`, `ventas`) VALUES
(101, 'Antonio Viguer', 45, 12, 'Representante', '1986-10-20', 104, '300000.00', '305000.00'),
(102, 'Alvaro Jaumes', 48, 21, 'Representante', '1986-12-10', 108, '350000.00', '474000.00'),
(103, 'Juan Rovira', 29, 12, 'Representante', '1987-03-01', 104, '275000.00', '286000.00'),
(104, 'Jose Gonzalez', 33, 12, 'Dir ventas', '1987-03-01', 106, '200000.00', '143000.00'),
(105, 'Vicente Pantalla', 37, 13, 'Representante', '1988-02-12', 104, '350000.00', '368000.00'),
(106, 'Luis Antonio', 52, 11, 'Dir general', '1988-06-14', NULL, '275000.00', '299000.00'),
(107, 'Jorge Gutierrez', 49, 22, 'Representante', '1988-11-14', 108, '300000.00', '186000.00'),
(108, 'Ana Bustamante', 62, 21, 'Dir ventas', '1989-10-12', 106, '350000.00', '361000.00'),
(109, 'Maria Sunta', 31, 11, 'Representante', '1999-10-12', 106, '300000.00', '392000.00'),
(110, 'Juan Victor', 41, NULL, 'Representante', '1990-01-13', 104, NULL, '76000.00'),
(111, 'Hugo Sanchez', 25, 24, 'Dir Publisidad', '1986-07-07', 108, '500000.00', '512000.00'),
(112, 'Luis Garcia', 27, 11, 'Publisidad', '1986-08-01', 102, '350000.00', '375000.00'),
(113, 'Luis Flores', 23, 22, 'Representante', '1986-01-12', 105, '250000.00', '200000.00'),
(114, 'David Patiño', 26, 28, 'Representante', '1986-12-01', 108, '275000.00', '300000.00'),
(115, 'Garcia Aspe', 30, 13, 'Publisidad', '1986-06-25', 102, '375000.00', '400000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficina`
--

CREATE TABLE `oficina` (
  `oficina` int(2) NOT NULL,
  `ciudad` varchar(15) DEFAULT NULL,
  `region` varchar(6) DEFAULT NULL,
  `dir` int(3) DEFAULT NULL,
  `objetivo` decimal(8,2) DEFAULT NULL,
  `venta` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `oficina`
--

INSERT INTO `oficina` (`oficina`, `ciudad`, `region`, `dir`, `objetivo`, `venta`) VALUES
(11, 'Valencia', 'este', 106, '575000.00', '693000.00'),
(12, 'Alicante', 'este', 104, '800000.00', '735000.00'),
(13, 'Castellon', 'este', 105, '350000.00', '368000.00'),
(21, 'Babajoz', 'oeste', 108, '725000.00', '836000.00'),
(22, 'A Coruña', 'oeste', 108, '300000.00', '186000.00'),
(23, 'Madrid', 'centro', 108, NULL, NULL),
(24, 'Madrid', 'centro', 108, '250000.00', '150000.00'),
(26, 'Pamplona', 'norte', NULL, NULL, NULL),
(28, 'Valencia', 'este', NULL, '900000.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `codigo` int(4) NOT NULL,
  `numpedido` int(6) DEFAULT NULL,
  `fechapedido` date DEFAULT NULL,
  `clie` int(4) DEFAULT NULL,
  `rep` int(3) DEFAULT NULL,
  `fab` varchar(3) DEFAULT NULL,
  `producto` varchar(5) DEFAULT NULL,
  `cant` int(3) DEFAULT NULL,
  `importe` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`codigo`, `numpedido`, `fechapedido`, `clie`, `rep`, `fab`, `producto`, `cant`, `importe`) VALUES
(1, 110036, '1997-01-02', 2107, 110, 'aci', '4100z', 9, 22500),
(2, 110036, '1997-01-02', 2117, 106, 'rei', '2a44l', 7, 31500),
(3, 112963, '1997-05-10', 2103, 105, 'aci', '41004', 28, 3276),
(4, 112968, '1990-01-11', 2102, 101, 'aci', '41004', 34, 3978),
(5, 112975, '1997-02-11', 2111, 103, 'rei', '2a44g', 6, 2100),
(6, 112979, '1989-10-12', 2114, 108, 'aci', '4100z', 6, 15000),
(7, 112983, '1997-05-10', 2103, 105, 'aci', '41004', 6, 702),
(8, 112987, '1997-01-01', 2103, 105, 'aci', '4100y', 11, 27500),
(9, 112989, '1997-12-10', 2101, 106, 'fea', '114', 6, 1458),
(10, 112992, '1990-04-15', 2118, 108, 'aci', '41002', 10, 760),
(11, 112993, '1997-03-10', 2106, 102, 'rei', '2a45c', 24, 1896),
(12, 112997, '1997-04-04', 2124, 107, 'bic', '41003', 1, 652),
(13, 113003, '1997-02-05', 2108, 109, 'imm', '779c', 3, 5625),
(14, 113007, '1997-01-01', 2112, 108, 'imm', '773c', 3, 2925),
(15, 113012, '1997-05-05', 2111, 105, 'aci', '41003', 35, 3745),
(16, 113013, '1997-08-06', 2118, 108, 'bic', '41003', 1, 652),
(17, 113024, '1997-07-04', 2114, 108, 'qsa', 'xk47', 20, 7100),
(18, 113027, '1997-02-05', 2103, 105, 'aci', '41002', 54, 4104),
(19, 113034, '1997-11-05', 2107, 110, 'rei', '2a45c', 8, 632),
(20, 113042, '1997-01-01', 2113, 101, 'rei', '2a44r', 5, 22500),
(21, 113045, '1997-07-02', 2112, 108, 'rei', '2a44r', 10, 45000),
(22, 113048, '1997-02-02', 2120, 102, 'imm', '779c', 2, 3750),
(23, 113049, '1997-04-04', 2118, 108, 'qsa', 'xk47', 2, 776),
(24, 113051, '1997-07-06', 2118, 108, 'qsa', 'xk47', 4, 1420),
(25, 113055, '2009-04-01', 2108, 101, 'aci', '4100x', 6, 150),
(26, 113057, '1997-11-01', 2111, 103, 'aci', '4100x', 24, 600),
(27, 113058, '1989-07-04', 2108, 109, 'fea', '112', 10, 1480),
(28, 113062, '1997-07-04', 2124, 107, 'bic', '41003', 10, 2430),
(29, 113065, '1997-06-03', 2106, 102, 'qsa', 'xk47', 6, 2130),
(30, 113069, '1997-08-01', 2109, 107, 'imm', '773c', 22, 31350);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idfab` varchar(3) NOT NULL,
  `idproducto` varchar(5) NOT NULL,
  `descripcion` varchar(15) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `existencia` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idfab`, `idproducto`, `descripcion`, `precio`, `existencia`) VALUES
('aci', '41001', 'arandela', '58.00', 277),
('aci', '41002', 'bisagra', '80.00', 167),
('aci', '41003', 'art t3', '112.00', 207),
('aci', '41004', 'art t4', '123.00', 139),
('aci', '4100x', 'junta', '26.00', 37),
('aci', '4100y', 'extractor', '2888.00', 25),
('aci', '4100z', 'mont', '2625.00', 28),
('bic', '41003', 'manivela', '652.00', 3),
('bic', '41089', 'rodamiento', '225.00', 78),
('bic', '41672', 'plato', '180.00', 0),
('fea', '112', 'cubo', '148.00', 115),
('fea', '114', 'cubo', '243.00', 15),
('imm', '773c', 'reostato', '975.00', 28),
('imm', '775c', 'reostato 2', '1425.00', 5),
('imm', '779c', 'reostato 3', '1875.00', 0),
('imm', '887h', 'caja clavos', '54.00', 223),
('imm', '887p', 'perno', '25.00', 24),
('imm', '887x', 'manivela', '475.00', 32),
('qsa', 'xk47', 'red', '355.00', 38),
('qsa', 'xk48', 'red', '134.00', 203),
('qsa', 'xk48a', 'red', '117.00', 37),
('rei', '2a44g', 'pas', '350.00', 14),
('rei', '2a44l', 'bomba l', '4500.00', 12),
('rei', '2a44r', 'bomba r', '4500.00', 12),
('rei', '2a45c', 'junta', '79.00', 210);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`numclie`),
  ADD KEY `repclie_emp` (`repclie`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Numemp`),
  ADD KEY `emp_ofi` (`oficina`),
  ADD KEY `emp_jef` (`jefe`);

--
-- Indices de la tabla `oficina`
--
ALTER TABLE `oficina`
  ADD PRIMARY KEY (`oficina`),
  ADD KEY `dir_numemp` (`dir`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `clie_numclie` (`clie`),
  ADD KEY `rep_numemp` (`rep`),
  ADD KEY `fabproducto_idfabproducto` (`fab`,`producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idfab`,`idproducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codigo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `repclie_emp` FOREIGN KEY (`repclie`) REFERENCES `empleado` (`Numemp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `emp_jef` FOREIGN KEY (`jefe`) REFERENCES `empleado` (`Numemp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `emp_ofi` FOREIGN KEY (`oficina`) REFERENCES `oficina` (`oficina`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `oficina`
--
ALTER TABLE `oficina`
  ADD CONSTRAINT `dir_numemp` FOREIGN KEY (`dir`) REFERENCES `empleado` (`Numemp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `clie_numclie` FOREIGN KEY (`clie`) REFERENCES `cliente` (`numclie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fabproducto_idfabproducto` FOREIGN KEY (`fab`,`producto`) REFERENCES `producto` (`idfab`, `idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rep_numemp` FOREIGN KEY (`rep`) REFERENCES `empleado` (`Numemp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
