-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2018 a las 03:37:03
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_f`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `Autor_id` int(11) NOT NULL,
  `Autor_Ap` varchar(20) NOT NULL,
  `autor_am` varchar(20) DEFAULT NULL,
  `autor_N` varchar(20) NOT NULL,
  `Autor_V` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`Autor_id`, `Autor_Ap`, `autor_am`, `autor_N`, `Autor_V`) VALUES
(1, 'Swokowski', 'W', 'Earl', 'NO'),
(2, 'Burden', 'L', 'Richard', 'NO'),
(3, 'Faires', '    ', 'Douglas', 'SI'),
(4, 'Granville', '    ', 'William Anthony ', 'NO'),
(5, 'Silva', '   ', 'Juan Manul', 'SI'),
(6, 'Salazar', 'Guerrero', 'Javier', 'SI'),
(7, 'López', 'Román', 'Leobardo', 'SI'),
(8, 'Martins', 'Carrizo', 'Marta Beatriz', 'SI'),
(9, 'Pérez', 'Marques', 'María', 'SI'),
(10, 'Martin', 'C', 'Robert', 'SI'),
(11, 'Fontela', '   ', 'Carlos', 'SI'),
(12, 'Wilson', 'D', 'Jerry', 'NO'),
(13, 'Shaffer', '     ', 'Peter', 'NO'),
(14, 'Hardwood', 'S', 'William', 'NO'),
(15, 'Cruz', 'Valverde', 'Diana', 'SI'),
(16, 'Audesirk', '   ', 'Teresa', 'SI'),
(17, 'Martini', 'H', 'Frederic', 'SI'),
(18, 'Gerald', 'F', 'Curtis', 'NO'),
(19, 'Mathews', 'H', 'John', 'SI'),
(20, 'Nakamura', '     ', 'Soichiro', 'SI'),
(21, 'Pérez', 'López', 'César', 'NO'),
(22, 'Solow', '     ', 'Daniel', 'SI'),
(23, 'Taha', 'A.', 'Hamdy', 'SI'),
(24, 'Martín', 'Martín', 'Quintín', 'SI'),
(25, 'Barbolla', '   ', 'Rosa', 'SI'),
(26, 'Cerda', 'Tena', 'Emilio', 'SI'),
(27, 'Ramírez', 'Torres', 'Francisco', 'SI'),
(28, 'Kindle', 'H', 'Joseph', 'SI'),
(29, 'Spiegel', 'R', 'Murray', 'NO'),
(30, 'Ruiz', 'Basto', 'Joaquín', 'SI'),
(31, 'Sánchez', 'Preciado', 'Claudia Leticia', 'SI'),
(32, 'García', 'Reséndiz', 'Leonardo Arturo', 'SI'),
(33, 'Carmona', 'Jover', 'Isabel', 'SI'),
(34, 'Brauer', 'Barba', 'María de los Dolores', 'SI'),
(35, 'Anfossi', '  ', 'Agustín', 'NO'),
(36, 'Ure', '    ', 'Jean', 'NO'),
(37, 'Ellis', '  ', 'Deborah', 'SI'),
(38, 'Pérez', ' Martínez', 'Héctor', 'NO'),
(39, 'Vasconcelos', 'Santillán', 'Jorge', 'SI'),
(40, 'Romero', 'Gómez', 'Antonio', 'SI'),
(41, 'Senn', 'A', 'James', 'NO'),
(42, 'Castillo', 'López', 'Araceli', 'SI'),
(43, 'Castellanos', 'Casas', 'Ricardo', 'SI'),
(44, 'Peñaloza', 'Romero', 'Ernesto', 'SI'),
(45, 'Koffman', 'B', 'Elliot', 'NO'),
(46, 'Grogono', '    ', 'Peter', 'SI'),
(47, 'Orozco', 'Guzmán', 'Martha Angélica', 'SI'),
(48, 'Franch', 'Gutiérrez', 'Xavier', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cl_id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ap_p` varchar(20) NOT NULL,
  `ap_m` varchar(20) DEFAULT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `razon` varchar(40) NOT NULL,
  `calle` varchar(40) NOT NULL,
  `no` varchar(20) NOT NULL,
  `col` varchar(30) NOT NULL,
  `deleg` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cl_id`, `nombre`, `ap_p`, `ap_m`, `telefono`, `correo`, `razon`, `calle`, `no`, `col`, `deleg`) VALUES
(1, 'Rafael', 'Canto', 'Gallo', '55-2617-1767', 'gallolon@gmail.com', 'Persona Física', 'Plazuela 6 de Plazas de San Jacinto', 'Mz-10 Lt-19 CASA-3', 'Plazas de Aragon', 'Nezahualcoyotl'),
(2, 'Laura', 'Ace', 'Hernandez', '55-5785-4183', 'lasamiguitasdemama@gmail.com', 'Papeleria Las Amiguitas de Mamá', 'Oriente 172', '15 DEPTO-3', 'Moctezuma 2da Sección', 'Venustiano Carranza'),
(3, 'Lourdes', 'Ortiz', 'Nava', '55-5766-9742', 'elpajaroazul@gmail.com', 'Papelería el Pájaro azul', 'Lago Michigan', '102', 'Ciudad Lago', 'Nezahualcóyotl'),
(4, 'Luis', 'Partida', 'Valladarez', '55-5767-6060', 'prospecta@prospecta.com', 'Prospecta', 'Ahorro Postal', '113', 'Viaducto Piedad', 'Iztacalco'),
(5, 'Roberto', 'Gómez', 'Desaida', '55-5137-2468', 'los_amigos@hotmail.com', 'Papelería Los Amigos', 'Oriente 180', '225 Dept 5', 'Moctezuma 2da Sección', 'Venustiano Carranza'),
(6, 'Jaime', 'González', 'Gordillo', '55-5666-1369', 'jglez@hotmail.com', 'Persona Física', 'Las Palmas', '10', 'Lindavista', 'Gustavo A Madero'),
(7, 'Luis', 'Gallo', 'Amezcua', '55-4000-4700', 'pormispistolas@hotmail.com', 'Papelería Por mis Pistolas', 'Emilio Carranza', '8', 'Moctezuma 1ra Sección', 'Venustiano Carranza'),
(8, 'Arturo', 'Ace', 'Hernandez', '55-4000-4700', 'drarthace@gmail.com', 'Persona Física', 'Agustín de Iturbide', '14', 'Emiliano Zapata', 'Cuautitlán Izcalli'),
(9, 'Jorge', 'Gómez', 'Desaida', '55-6798-2715', 'jvernevalle@gmail.com', 'Librería Julio Verne ', 'Valle de Cáceres', 'Mz-16 Lt-7 Casa-8', 'Valle de Aragón 1ra Sección', 'Nezahualcóyotl'),
(10, 'Dulce María', 'Gallo', 'Hernández', '55-2345-6789', 'scorpions@gmail.com', 'Papeleria Scorpions', 'Norte 25', '9', 'Moctezuma 2da Sección', 'Venustiano Carranza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `Ed_id` int(11) NOT NULL,
  `Ed_Nombre` varchar(35) NOT NULL,
  `Ed_tel` varchar(12) NOT NULL,
  `Ed_d_Calle` varchar(40) NOT NULL,
  `Ed_d_No` varchar(20) NOT NULL,
  `Ed_d_col` varchar(30) NOT NULL,
  `Ed_d_deleg` varchar(25) NOT NULL,
  `ed_d_Ciudad` varchar(20) NOT NULL,
  `ed_edo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`Ed_id`, `Ed_Nombre`, `Ed_tel`, `Ed_d_Calle`, `Ed_d_No`, `Ed_d_col`, `Ed_d_deleg`, `ed_d_Ciudad`, `ed_edo`) VALUES
(1, 'AlgaOmega Grupo Editor', '55-5575-5022', 'Dr Olvera', '74', 'Doctores', 'Cuauhtémoc', 'Ciudad de México', 'CDMX'),
(2, ' Diana S.A de C.V', '55-3000-6200', 'Trigo', '153', 'Granjas Esmeralda', 'Iztacalco', 'Ciudad de México', 'CDMX'),
(3, ' Esfinge', '55-5359-1111', 'Átomo', '24', 'Industrial Tlatilco', 'Naucalpan de Juárez', 'Naucalpan de Juárez', 'Estado de México'),
(4, 'Fernández', '55-5522-3527', 'Av. Insurgentes Sur', '2453  Piso 12', 'Tizapán', 'Álvaro Obregón', 'Ciudad de México', 'CDMX'),
(5, 'Fondo de Cultura Económica', '55-5119- 119', 'Av Instituto Politécnico Nacional', '1915', 'Lindavista', 'Gustavo A. Madero', 'Ciudad de México', 'CDMX'),
(6, 'Grijalbo S.A de C.V', '55-3067 -840', 'Avenida Homero', '544', 'Polanco V Secc', 'Miguel Hidalgo', 'Ciudad de México', 'CDMX'),
(7, 'Gandhi', '55-2625-0606', 'Av Francisco I. Madero', '32', 'Centro', 'Cuauhtémoc', 'Ciudad de México', 'CDMX'),
(8, 'Grupo García', '55-2620-3383', 'Carretera Cuautitlán-Teoloyucán', 'S/N', 'Industrial Xhala', 'Cuautitlán Izcalli', 'Cuautitlán Izcalli', 'Estado de México'),
(9, 'Herder', '55-5523-0105', 'Tehuantepec', '50', 'Roma Sur', 'Cuauhtémoc', 'Ciudad de México', 'CDMX'),
(10, 'Larousse', '55-1102-1300', 'Vía Gustavo Baz', '113', 'Industrial Barrientos', 'Tlalnepantla', 'Tlalnepantla', 'Estado de México'),
(11, 'Limusa S.A. de C.V.', '55-5522-2812', ' Pino Suárez', 'S/N', 'Centro', 'Cuauhtémoc', 'Ciudad de México', 'CDMX'),
(12, 'Lumen', '55-5592-5311', 'Atenas', '42', 'Juárez', 'Cuauhtémoc', 'Ciudad de México', 'CDMX'),
(13, 'Marco Polo', '55-5659-7940', 'Calle Pdte. Carranza', '83', 'Coyoacán', 'Coyoacán', 'Ciudad de México', 'CDMX'),
(14, 'McGraw Hill Interamericana S.A de C', '55-4738-7100', 'Lomas de Santa Fe', 'S/N', 'Contadero', 'Álvaro Obregón', 'Ciudad de México', 'CDMX'),
(15, 'Macmillan De México', '55-5482-2200', 'Insurgentes Sur', '1886', 'Florida', 'Álvaro Obregón', 'Ciudad de México', 'CDMX'),
(16, 'Norma', '55-5366-7900', 'Av. Cultura Griega', '55', 'San Martín Xochinahuac ', 'Azcapotzalco', 'Ciudad de México', 'CDMX'),
(17, 'Nueva Imagen', '55-5677-0670', 'Calz. de las Bombas', '128 Local 8', 'Ex-Ejido Sta Úrsula Coapa', 'Coyoacán', 'Ciudad de México', 'CDMX'),
(18, 'Océano México S.A de C.V', '55-9178- 510', 'Avenida Homero', '402', 'Polanco', 'Miguel Hidalgo', 'Ciudad de México', 'CDMX'),
(19, 'Omega', '55-5547-4677', 'Tulipán', '106', 'Sta María la Ribera', 'Cuauhtémoc', 'Ciudad de México', 'CDMX'),
(20, 'Planeta México', '55-3000-6200', 'Av. Pdte. Masaryk', '111', 'Polanco V Sección', 'Miguel Hidalgo', 'Ciudad de México', 'CDMX'),
(21, 'Patria', '55-1102-1300', 'Calz. Renacimiento', '180', 'San Juan Tlihuaca', 'Azcapotzalco', 'Ciudad de México', 'CDMX'),
(22, 'Pearson Educación  de México S.A de', '55-5387-0700', 'Antonio Dovali Jaime', '70 Torre B Piso 6', 'Álvaro Obregón', 'Naucalpan de Juárez', 'Naucalpan de Juárez', 'Estado de México'),
(23, 'Santillán S.A de C.V', '55-5605- 138', 'Av. Universidad', '76', 'Narvarte Oriente', 'Benito Juárez', 'Ciudad de México', 'CDMX'),
(24, 'Siglo XXI', '55-5339-2414', 'Cerro del Agua', '248', 'Romero de Terreros', 'Coyoacán', 'Ciudad de México', 'CDMX'),
(25, 'Trillas S.A. de C.V', '55-5522-1541', 'Pino Suárez', 'S/N', 'Centro', 'Cuauhtémoc', 'Ciudad de México', 'CDMX'),
(26, 'UNAM', '55-5622-6188', 'Av. del Imán', '5', 'Ciudad Universitaria', 'Coyoacan', 'Ciudad de México', 'CDMX '),
(27, 'Thomson Learning', '55-5281-2906', 'Carretera México-Toluca', '5420', 'La Rosita el Yaqui', 'Cuajimalpa', 'Ciudad de México', 'CDMX ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `em_id` int(11) NOT NULL,
  `e_nombre` varchar(20) NOT NULL,
  `E_ap_p` varchar(20) NOT NULL,
  `e_ap_m` varchar(20) DEFAULT NULL,
  `e_tel` varchar(12) NOT NULL,
  `E_fn` date NOT NULL,
  `e_calle` varchar(40) NOT NULL,
  `e_no` varchar(20) NOT NULL,
  `e_col` varchar(30) NOT NULL,
  `e_deleg` varchar(25) NOT NULL,
  `e_suc_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`em_id`, `e_nombre`, `E_ap_p`, `e_ap_m`, `e_tel`, `E_fn`, `e_calle`, `e_no`, `e_col`, `e_deleg`, `e_suc_id`) VALUES
(1, 'Alexander', 'Cerezo', 'Zaldivar', '55-1712-1004', '1995-04-07', 'Plaza Hidalgo', '113', 'Cuautepec Barrio Alto', 'Gustavo a Madero', 5),
(2, 'Antonio', 'García', 'Hernández', '55-1607-1006', '1993-06-15', 'Paganini', '225 Dept 5', 'Vallejo', 'Gustavo A Madero', 6),
(3, 'Ángel', 'García', 'Sotero', '55-1712-1001', '1998-01-07', 'Añil', '10', 'Granjas México', 'Iztacalco', 1),
(4, 'Asaf', 'Martínez', 'Arizmendi', '55-1602-1023', '1998-08-03', 'Vainilla', '8', 'Magdalena Mixuca', 'Iztacalco', 6),
(5, 'Francisco', 'Robles', 'Rodríguez', '55-1712-1005', '1996-05-10', 'Agustín de Iturbide', '50', 'Emiliano Zapata', 'Cuautitlán Izcalli', 5),
(6, 'Diego', 'Villarreal', 'Rodríguez', '55-1712-1002', '1998-10-02', 'Ermita Iztapalapa', '4163', 'Lomas de Zaragoza', 'Iztapalapa', 2),
(7, 'Noe', 'Aguilar', 'Ramírez', '55-1607-0108', '1998-10-10', 'Cedro', '41', 'Santa Maria La Ribera', 'Cuauhtemoc', 3),
(8, 'Kevin', 'Avelar', 'Pinto', '55-1607-0116', '1997-07-16', 'López', '14', 'Centro', 'Cuauhtemoc', 4),
(9, 'Raymundo', 'Cabrera', 'Rojas', '55-1607-1090', '2000-07-16', 'Nápoles', '11', 'Noche Buena', 'Benito Juarez', 1),
(10, 'Yulissa', 'Domingo', 'Palacios', '55-1015-1607', '2000-01-08', 'Santa Catalina', '11', 'Noche Buena', 'Benito Juarez', 3),
(11, 'Leonardo', 'Figueroa', 'Sotelo', '55-1607-1015', '1996-07-06', 'Granaditas', '68', 'Morelos', 'Cuauhtemoc', 2),
(12, 'David', 'Javier', 'Cervantes', '55-1607-1005', '1998-01-31', 'Amacuzac', '51', 'San Andrés', 'Iztacalco', 4),
(13, 'Luis', 'Zavala', 'Medina', '55-1607-1001', '1998-08-03', 'Jalpa de Mendez', '45', 'Campestre', 'Gustavo A Madero', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `Isbn` varchar(15) DEFAULT NULL,
  `Titulo` varchar(40) NOT NULL,
  `Subtitulo` varchar(25) NOT NULL,
  `L_autor_id` int(5) NOT NULL,
  `l_edit_id` int(3) NOT NULL,
  `Descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `Isbn`, `Titulo`, `Subtitulo`, `L_autor_id`, `l_edit_id`, `Descripcion`) VALUES
(1, '970-686-134-3', 'Analisis Numérico', 'Matemáticas', 2, 27, 'Incorpora los Métodos de Aproximación más modernos tiy cuenta con 2000 ejercicios comprobados'),
(2, '84-534-001-6', 'Calculo Con Geometría Analítica', 'Matemáticas', 1, 14, 'Incorpora Adecuaciones y cuenta con 1500 ejercicios más de los que había antes'),
(3, '968-18-1178-X', 'Calculo Diferencial e Integral', 'Matemáticas', 4, 11, 'Lo extenso de su contenido y la claridad de exposición se complementan tiene ejercicios sin respuestas para que los resuelvas tú mismo '),
(4, '968-18-2380-X', 'Fundamentos de Matemáticas', 'Matemáticas', 5, 11, 'En cualquier área del conocimiento humano es básico conocer de Matemáticas y aquí se busca con ejercicios sencillos facilitarte llevar esta materia'),
(5, '970-24-0613-7', 'Calculo Diferencial Matemáticas IV', 'Matemáticas', 6, 21, 'Aquí nos apoyamos del programa de estudios de Bachillerato del (DGETI) y se busca lograr un Aprendizaje Significativo'),
(6, '978-842-052-0', 'Optimización Dinámica', 'Matemáticas', 26, 22, 'Este libro parte de la comprensión básica y rigurosa de los conceptos y cada propiedad se ilustra con ejemplos'),
(7, '978-842-052-9', 'Optimización Cuestiones y ejercicios apl', 'Matemáticas', 25, 22, 'Este libro es eminentemente práctico y permite al alumno comprender y afianzar la teoría por medio de ejercicios y ejemplos'),
(8, '978-842-054-3', 'Investigación Operativa Problemas y Ejer', 'Matemáticas', 24, 22, 'Este libro tiene la finalidad de que el alumno comprenda y afiance la teoría y práctica por medio de ejercicios'),
(9, '978-970-260-3', 'Investigación de Operaciones', 'Matemáticas', 23, 22, 'Este libro abarca todo el temario necesario a nivel superior abarcando desde Que es hasta Algoritmos de Programación no Lineal'),
(10, '978-968-880-2', 'Investigación de Operaciones el Arte de ', 'Matemáticas', 22, 22, 'Este libro es apto para las carreras ciencia Administrativas, Matemáticas a nivel superior'),
(11, '978-842-054-6', 'Técnicas Estadísticas con SPSS 12', 'Matemáticas', 21, 22, 'Este libro presenta una visión completa de las técnicas estadísticas para su tratamiento apoyándose de la versión 12 de SPSS'),
(12, '978-968-880-3', 'Análisis Numérico y Visualización Gráfic', 'Matemáticas', 20, 22, 'Este libro combina la presentación de métodos numéricos utilizando para ello el lenguaje de programación Matlab'),
(13, '978-848-322-5', 'Métodos  Numérico con Matlab', 'Matemáticas', 19, 22, 'Este libro es muy versátil ya que los contenidos están enfocados a los estudiantes de Ingenierías Matemáticas e Informática'),
(14, '978-968-444-8', 'Análisis Numérico con aplicaciones', 'Matemáticas', 18, 22, 'Este libro tiene un adecuado balance entre teoría y práctica y contiene un enfoque algorítmico'),
(15, '978-842-054-3', 'Atlas de Anatomía Humana', 'Medicina', 17, 22, 'Este libro lleva al estudio del cuerpo humano pasando por todos los organismos este libro cuenta con un CD con visualizaciones del Cuerpo Humano'),
(16, '978-970-260-2', 'Biologia la vida en la tierra', 'Biología', 16, 22, 'Este libro hace hincapié en que una adecuada comprensión de la biología enriquece e ilumina la vida cotidiana'),
(17, '978-970-260-9', 'Estructura Atómica', 'Química', 15, 22, 'Este libro está dirigido a estudiantes que requieren un buen nivel de comprensión de la materia, sus propiedades  y sus fenómenos'),
(18, '978-842-053-3', 'Quimica General', 'Química', 14, 22, 'Este libro abarca el temario de nivel medio superior y superior es 100% confiable'),
(19, '978-987-946-3', 'Tutoriales para Física Introductoria', 'Física', 13, 22, 'Este libro está basado en una extensa experiencia de enseñanza identificando y atacando las dificultades que los estudiantes presentan'),
(20, '978-970-260-9', 'Física', 'Física', 12, 22, 'Este libro presenta de manera clara y concisa los principios básica de la Física resolviendo problemas de cinemática, gravedad, visión, temperatura'),
(21, '978-607-707-9', 'Metodologia de la Programación Orientada', 'Computación Programación', 7, 1, 'Este libro en la primera parte abarca un enfoque lógico, La segunda parte se enfoca a la Programación Orientada a Objetos y el tema de UML'),
(22, '968-243-300-2', 'Visual Basic 5.0', 'Computación Programación', 8, 25, 'Este libro presenta un lenguaje claro de desarrollo ameno y explicaciones detalladas con ejemplos precisos'),
(23, '978-607-622-2', 'Big Data', 'Computación Base de Datos', 9, 1, 'Este libro presenta la posibilidad de trabajo que tienen las herramientas de Big Data para procesar grandes volúmenes de Información'),
(24, '978-842-054-0', 'UML para programadores en Java', 'Computación Análisis', 10, 22, 'Este libro presenta todos los modelos que se emplean en el mundo real'),
(25, '978-987-160-2', 'UML Modelado de Software para profesiona', 'Computación Análisis', 11, 22, 'Este libro presenta un apoyo para el modelado de proyectos que se emplean en el mundo real'),
(26, '970-686-134-3', 'Análisis Numérico', 'Matemáticas', 2, 27, 'Incorpora los Métodos de Aproximación más modernos y cuenta con 2000 ejercicios comprobados'),
(27, '970-084-009-5', 'Elementos de Análisis Vectorial', 'Matemáticas', 27, 14, 'Es un apoyo para las materias interdisciplinarias de ingeniería y ciencias sociales y administrativas con ejercicios comprobados'),
(28, '968-604-694-1', 'Geometría Analítica', 'Matemáticas', 28, 14, 'Es un complemento tanto teórico como practico para los textos de geometría analítica en los plantes de grado medio cuenta con 910 problemas'),
(29, '968-451-066-7', 'Estadística', 'Matemáticas', 29, 14, 'Con este libro se busca presentar una introducción a los principios generales de la estadística y ser una consulta ya que cuenta con 1000 problemas propuestos y  comprobados'),
(30, '970-240-543-2', 'Matemáticas III Geometría Analítica', 'Matemáticas', 30, 21, 'Con este libro se busca tratar de manera ágil y amena el uso de la Geometría Analítica en la vida cotidiana'),
(31, '970-210-390-8', 'Matemáticas III Geometría  y Trigonometr', 'Matemáticas', 31, 21, 'Este libro se basa en los métodos didácticos de plantear el aprendizaje como un proceso constante'),
(32, '970-321-652-8', 'Matemáticas IV Algebra', 'Matemáticas', 32, 26, 'Este libro trata de orientar al alumno hacia un aprendizaje basado en la solución de problemas'),
(33, '968-444-127-4', 'Ecuaciones Diferenciales', 'Matemáticas', 33, 1, 'Explica que son y cómo se resuelven las ecuaciones diferenciales y cuenta con 2000 ejercicios comprobados'),
(34, '968-890-493-5', 'Matemáticas  II', 'Matemáticas', 34, 26, 'Este libro trata de ser un apoyo para los alumnos de nivel medio superior ya que cuenta con Teoría y Práctica de 1000 ejercicios comprobados'),
(35, '968-890-563-4', 'Trigonometria Rectilínea', 'Matemáticas', 35, 11, 'Este libro trata de ser un apoyo para cuando se trabaja con números complejos empezando desde las funciones trigonométricas  hasta la forma polar'),
(36, '978-958-453-2', 'Me dicen Sara Tomate', 'Literatura', 36, 16, 'Este libro trata de la vida de un niño italiano que no vive en Italia con muchas situaciones anormales'),
(37, '978-970-20-0983', 'El Pan De La Guerra', 'Literatura', 37, 16, 'Este libro trata de parvana una niña con una vida normal la cual cambia por la guerra iniciada por los talibanes'),
(38, '978-151-038-0', 'Informática para bachillerato 2', 'computacion Informática', 38, 1, 'Este libro está compuesto por 4 que se desarrollan con un lenguaje claro sencillo e imágenes'),
(39, '970-240-549-1', 'Lenguaje de Programación ll', 'computación programación ', 39, 5, 'Este libro comprende los principales mecanismos para el manejo de datos en el lenguaje C'),
(40, '970-908-732-0', 'Computacion Básica l', 'computación', 40, 3, 'Es una obra que introduce al lector al fascinante mundo de la computación llevándote de la mano'),
(41, '968-422-991-7', 'Analisis y Diseño de Sistema de Informac', 'Computación Informática', 41, 14, 'Enseña a aprender a identificar los requisitos de un sistema y la manera de documentar los detalles del sistema con ayuda de diversos métodos'),
(42, '970-743-042-7', 'Informatica Enfoque Constructivista l', 'computación informática', 42, 8, 'La intención de la obra no es que aprenda datos de memoria sino que sea capaz de utilizar la información para desarrollar habilidades '),
(43, '970-150-973-0', 'Informática Activa 3', 'Computacion informática', 43, 1, 'El objetivo del libro es enseñar a utilizar las paquetería de  la office, realizar dibujos crear animaciones con multimedios diseñar y crear páginas web '),
(44, '970-150-923-4', 'Informática', 'computación informática', 43, 1, 'El libro enseña los componentes de una computadora para ser capaz de ser un técnico y poder configurarlos y desarrollar los modelos básicos  '),
(45, '968-150-905-6', 'Fundamentos de Programación C¬¬¬¬¬¬¬¬¬¬¬', 'computación programación', 44, 1, 'Es un libro en el que el autor nos muestra como la programación estructurada y la orientada a objetos no se excluyen sino se completan'),
(46, '968-858-071-6', 'BASIC', 'Computacion programación', 45, 15, 'En el libro se hace énfasis en el análisis del problema la descripción paso a paso del algoritmo y la implementación del programa en el lenguaje BASIC'),
(47, '968-500-075-1', 'Programacion en Pascal', 'computación Programación', 46, 25, 'Este libro tiene un alto lenguaje como que es fácil de escribir y sencillo de leer y de entender'),
(48, '970-686-573-X', 'Informatica Uno', 'Computación Informática', 47, 25, 'Este libro enseña a elaborar trabajos a ver tutoriales escuchar música ver películas etc'),
(49, '970-150-773-8', 'Estructura de datos', 'Computación Informática', 48, 1, 'Este libro analiza las familias de estructuras de datos clásicas como las secuencias, las tablas las relaciones binarias y los grafos etc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `pe_id` int(11) NOT NULL,
  `pe_cl_id` int(5) NOT NULL,
  `pe_id_l` int(6) NOT NULL,
  `pe_a_id` int(6) NOT NULL,
  `pe_em_id` int(6) NOT NULL,
  `pe_suc_id` int(6) NOT NULL,
  `cantidad` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`pe_id`, `pe_cl_id`, `pe_id_l`, `pe_a_id`, `pe_em_id`, `pe_suc_id`, `cantidad`) VALUES
(1, 1, 4, 5, 13, 5, 1),
(2, 6, 4, 5, 13, 5, 1),
(3, 8, 4, 5, 13, 5, 1),
(4, 2, 1, 2, 1, 5, 3),
(5, 4, 5, 6, 1, 5, 10),
(6, 1, 10, 5, 1, 5, 1),
(7, 3, 11, 23, 2, 6, 6),
(8, 1, 14, 11, 3, 1, 1),
(9, 10, 11, 30, 4, 6, 2),
(10, 1, 13, 14, 5, 5, 1),
(11, 1, 13, 13, 6, 2, 1),
(12, 10, 10, 23, 7, 3, 4),
(13, 2, 11, 11, 8, 4, 5),
(14, 4, 14, 27, 9, 1, 8),
(15, 6, 11, 10, 10, 3, 1),
(16, 3, 13, 10, 11, 2, 8),
(17, 9, 48, 29, 12, 4, 2),
(18, 3, 35, 24, 13, 5, 5),
(19, 6, 23, 16, 6, 2, 1),
(20, 9, 45, 21, 4, 6, 7),
(21, 4, 32, 6, 2, 6, 5),
(22, 5, 25, 7, 5, 5, 2),
(23, 3, 5, 8, 6, 2, 6),
(24, 7, 9, 12, 7, 3, 3),
(25, 8, 8, 16, 8, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `suc_id` int(11) NOT NULL,
  `s_nom` varchar(35) DEFAULT NULL,
  `s_tel` varchar(12) NOT NULL,
  `S_calle` varchar(40) NOT NULL,
  `S_no` varchar(20) NOT NULL,
  `s_col` varchar(30) NOT NULL,
  `s_del` varchar(25) NOT NULL,
  `s_dir` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`suc_id`, `s_nom`, `s_tel`, `S_calle`, `S_no`, `s_col`, `s_del`, `s_dir`) VALUES
(1, 'Porrúa Parque Alameda', '55-5510-0513', 'Avenida Juárez', '56', 'Centro', 'Cuauhtémoc', 2),
(2, 'Porrúa Ecologia Parque Tezontle', '55-9129-0032', 'Avenida Canal de Tezontle', '56', 'Agrícola Oriental', 'Iztapalapa', 4),
(3, 'Porrúa Parque Duraznos', '55-5245-1883', 'Bosque de Duraznos', '39', 'Bosque de las Lomas', 'Naucalpan', 6),
(4, 'Porrúa Fórum Buenavista', '55-2630-3028', 'Eje 1 Norte', '259', 'Buenavista', 'Cuauhtémoc', 8),
(5, 'Porrúa Outlets', '55-2075-0216', 'Hacienda del Parque', 'S/N', 'Punta Norte', 'Cuautitlán Izcalli', 10),
(6, 'Porrúa Life', '55-1234-5678', 'Avenida Rancho Seco', 'S/N', 'Impulsora', 'Nezahualcóyotl', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `v_id` int(11) NOT NULL,
  `v_mes` int(2) NOT NULL,
  `V_id_l` int(6) NOT NULL,
  `V_suc_id` int(6) NOT NULL,
  `V_em_id` int(6) NOT NULL,
  `Unidades` int(6) NOT NULL,
  `V_fecha` date NOT NULL,
  `Pago` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`v_id`, `v_mes`, `V_id_l`, `V_suc_id`, `V_em_id`, `Unidades`, `V_fecha`, `Pago`) VALUES
(1, 1, 4, 5, 13, 5, '2018-01-08', '500.00'),
(2, 2, 5, 5, 13, 1, '2018-02-14', '100.00'),
(3, 1, 1, 5, 1, 1, '2018-01-31', '100.00'),
(4, 2, 4, 5, 1, 2, '2018-02-28', '200.00'),
(5, 3, 4, 5, 1, 10, '2018-03-08', '1000.00'),
(6, 1, 5, 5, 1, 5, '2018-01-10', '500.00'),
(7, 3, 6, 6, 2, 6, '2018-03-07', '600.00'),
(8, 1, 7, 1, 3, 1, '2018-01-17', '100.00'),
(9, 5, 11, 6, 4, 6, '2018-05-09', '600.00'),
(10, 1, 13, 5, 5, 5, '2018-01-24', '500.00'),
(11, 1, 4, 2, 6, 2, '2018-01-31', '200.00'),
(12, 6, 10, 3, 7, 3, '2018-06-06', '300.00'),
(13, 2, 2, 4, 8, 4, '2018-02-07', '400.00'),
(14, 4, 14, 1, 9, 1, '2018-04-04', '100.00'),
(15, 6, 5, 3, 10, 3, '2018-04-11', '300.00'),
(16, 3, 13, 2, 11, 2, '2018-03-14', '200.00'),
(17, 4, 12, 4, 12, 4, '2018-04-18', '400.00'),
(18, 3, 8, 5, 13, 5, '2018-03-21', '500.00'),
(19, 6, 29, 2, 6, 2, '2018-06-13', '200.00'),
(20, 3, 46, 6, 4, 6, '2018-03-07', '600.00'),
(21, 4, 38, 6, 2, 6, '2018-04-25', '600.00'),
(22, 5, 32, 5, 5, 5, '2018-05-16', '500.00'),
(23, 3, 13, 2, 6, 2, '2018-03-14', '200.00'),
(24, 2, 21, 3, 7, 3, '2018-02-14', '300.00'),
(25, 4, 24, 4, 8, 4, '2018-04-04', '400.00'),
(26, 3, 31, 1, 9, 1, '2018-03-21', '100.00'),
(27, 2, 36, 6, 2, 6, '2018-02-21', '300.00'),
(28, 3, 9, 1, 3, 1, '2018-03-07', '100.00'),
(29, 3, 11, 5, 13, 5, '2018-03-14', '500.00'),
(30, 4, 14, 5, 13, 5, '2018-04-11', '500.00'),
(31, 1, 45, 3, 10, 3, '2018-01-10', '300.00'),
(32, 2, 38, 6, 2, 6, '2018-02-28', '600.00'),
(33, 3, 29, 5, 5, 5, '2018-03-21', '500.00'),
(34, 4, 28, 5, 5, 5, '2018-04-18', '500.00'),
(35, 5, 35, 6, 4, 6, '2018-05-23', '600.00'),
(36, 2, 27, 3, 10, 3, '2018-02-07', '300.00'),
(37, 3, 19, 6, 2, 6, '2018-03-07', '1800.00'),
(38, 5, 23, 2, 6, 2, '2018-05-30', '200.00'),
(39, 1, 26, 1, 9, 1, '2018-01-17', '100.00'),
(40, 2, 32, 2, 6, 2, '2018-02-14', '200.00'),
(41, 3, 30, 3, 7, 3, '2018-03-14', '300.00'),
(42, 4, 29, 1, 9, 1, '2018-04-25', '100.00'),
(43, 5, 15, 5, 5, 5, '2018-05-09', '1000.00'),
(44, 6, 39, 4, 8, 4, '2018-06-20', '400.00'),
(45, 2, 19, 3, 10, 3, '2018-02-21', '900.00'),
(46, 3, 15, 2, 6, 2, '2018-03-21', '400.00'),
(47, 4, 7, 3, 7, 3, '2018-04-04', '300.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`Autor_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cl_id`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`Ed_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`em_id`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `L_autor_id` (`L_autor_id`),
  ADD KEY `l_edit_id` (`l_edit_id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`pe_id`),
  ADD KEY `pe_id_l` (`pe_id_l`),
  ADD KEY `pe_suc_id` (`pe_suc_id`),
  ADD KEY `pe_em_id` (`pe_em_id`),
  ADD KEY `pe_cl_id` (`pe_cl_id`),
  ADD KEY `pe_a_id` (`pe_a_id`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`suc_id`),
  ADD KEY `s_dir` (`s_dir`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`v_id`),
  ADD KEY `V_id_l` (`V_id_l`),
  ADD KEY `V_suc_id` (`V_suc_id`),
  ADD KEY `V_em_id` (`V_em_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `Autor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `Ed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `em_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `pe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `suc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`L_autor_id`) REFERENCES `autor` (`Autor_id`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`l_edit_id`) REFERENCES `editorial` (`Ed_id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`pe_id_l`) REFERENCES `libro` (`id`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`pe_suc_id`) REFERENCES `sucursal` (`suc_id`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`pe_em_id`) REFERENCES `empleado` (`em_id`),
  ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`pe_cl_id`) REFERENCES `cliente` (`cl_id`),
  ADD CONSTRAINT `pedido_ibfk_5` FOREIGN KEY (`pe_a_id`) REFERENCES `autor` (`Autor_id`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`s_dir`) REFERENCES `empleado` (`em_id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`V_id_l`) REFERENCES `libro` (`id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`V_suc_id`) REFERENCES `sucursal` (`suc_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`V_em_id`) REFERENCES `empleado` (`em_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
