CREATE DATABASE  IF NOT EXISTS `practica2_mineriadatos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `practica2_mineriadatos`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: practica2_mineriadatos
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `practica2`
--

DROP TABLE IF EXISTS `practica2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practica2` (
  `pais` varchar(70) NOT NULL,
  `atletas` int NOT NULL,
  `oro` int NOT NULL,
  `plata` int NOT NULL,
  `bronce` int NOT NULL,
  `continente` varchar(50) NOT NULL,
  `habitantes` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practica2`
--

LOCK TABLES `practica2` WRITE;
/*!40000 ALTER TABLE `practica2` DISABLE KEYS */;
INSERT INTO `practica2` VALUES ('Afganistán',6,0,0,0,'ASIA',43482993),('Albania',8,0,0,2,'EUROPA',2761785),('Alemania',463,12,13,8,'EUROPA',83445000),('Andorra',2,0,0,0,'EUROPA',85101),('Angola',25,0,0,0,'AFRICA',34504000),('Antigua y Barbuda',5,0,0,0,'AMERICA',101000),('Arabia Saudita',9,0,0,0,'ASIA',32175000),('Argelia',46,2,0,1,'AFRICA',44177969),('Argentina',147,1,1,1,'AMERICA',45808747),('Armenia',15,0,3,1,'ASIA',2991202),('Aruba',6,0,0,0,'AMERICA',106277),('Australia',483,18,19,16,'OCEANIA',26638544),('Austria',84,2,0,3,'EUROPA',9158750),('Azerbaiyán',48,2,2,3,'ASIA',10180770),('Bahamas',18,0,0,0,'AMERICA',407906),('Bangladesh',5,0,0,0,'ASIA',169356251),('Barbados',4,0,0,0,'AMERICA',281200),('Baréin',13,2,1,1,'ASIA',1542000),('Bélgica',180,3,1,6,'EUROPA',11832049),('Belice',1,0,0,0,'AMERICA',442000),('Benín',5,0,0,0,'AFRICA',13011000),('Bermudas',8,0,0,0,'AMERICA',63489),('Birmania',2,0,0,0,'ASIA',53798084),('Bolivia',4,0,0,0,'AMERICA',1098580),('Bosnia y Herzegovina',5,0,0,0,'EUROPA',3417089),('Botsuana',11,1,1,0,'AFRICA',2588423),('Brasil',284,3,7,10,'AMERICA',203063000),('Brunéi',3,0,0,0,'ASIA',430000),('Bulgaria',46,3,1,3,'EUROPA',6445481),('Burkina Faso',8,0,0,0,'AFRICA',22100683),('Burundi',7,0,0,0,'AFRICA',12231000),('Bután',3,0,0,0,'ASIA',753000),('Cabo Verde',7,0,0,1,'AFRICA',587925),('Camboya',3,0,0,0,'ASIA',15835000),('Camerún',6,0,0,0,'AFRICA',27912000),('Canadá',330,9,7,11,'AMERICA',40097761),('Catar',14,0,0,1,'ASIA',2831000),('Chad',3,0,0,0,'AFRICA',17179740),('Chile',48,1,1,0,'AMERICA',19493184),('China Taipéi',60,2,0,5,'ASIA',1412600000),('Chipre',16,0,1,0,'EUROPA',933505),('Colombia',88,0,3,1,'AMERICA',51609000),('Comoras - COM',4,0,0,0,'AFRICA',921000),('Congo',4,0,0,0,'AFRICA',95894118),('Corea del Norte',16,0,2,4,'ASIA',25971909),('Corea del Sur',146,13,9,10,'ASIA',51736000),('Costa de Marfil',11,0,0,1,'AFRICA',27478249),('Costa Rica',7,0,0,0,'AMERICA',5229000),('Croacia',76,2,2,3,'EUROPA',3861967),('Cuba',61,2,1,6,'AMERICA',11256372),('Dinamarca',133,2,2,5,'EUROPA',5961249),('Dominica',4,1,0,0,'AMERICA',72412),('Ecuador',40,1,2,2,'AMERICA',18262218),('Egipto',160,1,1,1,'AFRICA',109262178),('El Salvador',8,0,0,0,'AMERICA',6521500),('Emiratos Árabes Unidos',13,0,0,0,'ASIA',10188234),('Eritrea',12,0,0,0,'AFRICA',3720797),('Eslovaquia',28,0,0,1,'EUROPA',5402547),('Eslovenia',97,2,1,0,'EUROPA',2103615),('España',402,5,4,8,'EUROPA',47223573),('Estados Federados de Micronesia',3,0,0,0,'OCEANIA',11503),('Estados Unidos de América - USA',640,40,44,42,'AMERICA',336100000),('Estonia',24,0,0,0,'EUROPA',1318705),('Etiopia',39,1,3,0,'AFRICA',126527060),('Filipinas',22,2,0,2,'ASIA',115558179),('Finlandia',57,0,0,0,'EUROPA',5575967),('Fiji',34,0,1,0,'OCEANIA',936375),('Francia',608,16,26,22,'EUROPA',67772000),('Gabón',5,0,0,0,'AFRICA',2450379),('Gambia',7,0,0,0,'AFRICA',2671830),('Georgia',28,3,3,1,'EUROPA',3688647),('Ghana',8,0,0,0,'AFRICA',34009510),('Granada',6,0,0,2,'AMERICA',125452),('Gran Bretaña',353,14,22,29,'EUROPA',67511000),('Grecia',101,1,1,6,'EUROPA',10402802),('Guam',8,0,0,0,'OCEANIA',17063),('Guatemala',16,1,0,1,'AMERICA',19989440),('Guinea',25,0,0,0,'AFRICA',13781035),('Guinea Ecuatorial',3,0,0,0,'AFRICA',1604644),('Guinea-Bisáu',6,0,0,0,'AFRICA',2002607),('Guyana',5,0,0,0,'AMERICA',800175),('Haití',7,0,0,0,'AMERICA',11184637),('Honduras',4,0,0,0,'AMERICA',10252490),('Hong Kong',34,2,0,2,'ASIA',7489717),('Hungría',180,6,7,6,'EUROPA',9569203),('India',115,0,1,5,'ASIA',1425775850),('Indonesia',29,2,0,1,'ASIA',273657120),('Irak',23,0,0,0,'ASIA',44089561),('Irán',40,3,6,3,'ASIA',89171060),('Irlanda',141,4,0,3,'EUROPA',5435000),('Islandia',5,0,0,0,'EUROPA',376248),('Isla Caimán',4,0,0,0,'AMERICA',67214),('Islas Cook',2,0,0,0,'OCEANIA',18217),('Islas Marshall',4,0,0,0,'OCEANIA',60104),('Islas Salomón',3,0,0,0,'OCEANIA',721855),('Islas Vírgenes Británicas',4,0,0,0,'AMERICA',30331),('Islas Vírgenes de los Estados Unidos',5,0,0,0,'AMERICA',87146),('Israel',90,1,5,1,'ASIA',10156200),('Italia',400,12,13,15,'EUROPA',58959180),('Jamaica',70,1,3,2,'AMERICA',2803368),('Japón',432,20,12,13,'ASIA',124049000),('Jordania',12,0,1,0,'ASIA',11273152),('Kazajistán',80,1,3,3,'ASIA',19848295),('Kenia',84,4,2,5,'AFRICA',59039085),('Kirguistán',16,0,2,4,'ASIA',6879496),('Kiribati',3,0,0,0,'OCEANIA',131567),('Kosovo',9,0,1,1,'EUROPA',1862641),('Kuwait',9,0,0,0,'ASIA',4721765),('Laos',4,0,0,0,'ASIA',7782191),('Lesoto',3,0,0,0,'AFRICA',2257606),('Letonia',29,0,0,0,'EUROPA',1804059),('Líbano',10,0,0,0,'ASIA',5330760),('Liberia',8,0,0,0,'AFRICA',5617527),('Libia',6,0,0,0,'AFRICA',6719183),('Liechtestein',1,0,0,0,'EUROPA',39681),('Lituania',50,0,2,2,'EUROPA',2689862),('Luxemburgo',14,0,0,0,'EUROPA',653125),('Macedonia del Norte',7,0,0,0,'EUROPA',1806396),('Madagascar',7,0,0,0,'AFRICA',30336976),('Malasia',26,0,0,2,'ASIA',34640979),('Malaui',3,0,0,0,'AFRICA',20840654),('Maldivas',5,0,0,0,'ASIA',581825),('Malí',24,0,0,0,'AFRICA',24931540),('Malta',5,0,0,0,'EUROPA',524978),('Marruecos',60,1,0,1,'AFRICA',37721168),('Mauricio',13,0,0,0,'AFRICA',1314626),('Mauritania',2,0,0,0,'AFRICA',5017402),('México',109,0,3,2,'AMERICA',131927994),('Moldavia',25,0,1,3,'EUROPA',2546788),('Mónaco',6,0,0,0,'EUROPA',39503),('Mongolia',32,0,1,0,'ASIA',3573755),('Montenegro',19,0,0,0,'EUROPA',617454),('Mozambique',7,0,0,0,'AFRICA',34153028),('Myanmar',0,0,0,0,'ASIA',55451270),('Namibia',4,0,0,0,'AFRICA',2680367),('Nauru',1,0,0,0,'OCEANIA',10903),('Nepal',7,0,0,0,'ASIA',30902184),('Nicaragua',7,0,0,0,'AMERICA',6911310),('Níger',7,0,0,0,'AFRICA',27993305),('Nigeria',86,0,0,0,'AFRICA',229681682),('Noruega',112,4,1,3,'EUROPA',5564473),('Nueva Zelanda',206,10,7,3,'OCEANIA',5142642),('Omán',4,0,0,0,'ASIA',5719673),('Países Bajos',294,15,7,12,'EUROPA',17556316),('Pakistán',7,1,0,0,'ASIA',248160736),('Palau o Palaos',3,0,0,0,'OCEANIA',18012),('Palestina',8,0,0,0,'ASIA',5547809),('Panamá',8,0,1,0,'AMERICA',4581879),('Papúa Nueva Guinea',6,0,0,0,'OCEANIA',10682774),('Paraguay',28,0,0,0,'AMERICA',7209790),('Perú',26,0,0,1,'AMERICA',35416214),('Polonia',229,1,4,5,'EUROPA',37572243),('Portugal',75,1,2,1,'EUROPA',10069769),('Puerto Rico',51,0,0,2,'AMERICA',3188000),('República Centroafricana',4,0,0,0,'AFRICA',5916000),('República Checa',112,3,0,2,'EUROPA',10865000),('República Democrática del Congo',5,0,0,0,'AFRICA',116751000),('República Dominicana',59,1,0,2,'AMERICA',10970000),('República Popular China',400,40,27,24,'ASIA',1408628000),('Ruanda',8,0,0,0,'AFRICA',13833000),('Rumania',107,3,4,2,'EUROPA',16393000),('Samoa',24,0,0,0,'OCEANIA',211000),('Samoa Americana',2,0,0,0,'OCEANIA',47000),('San Cristóbal y Nieves',3,0,0,0,'AMERICA',48000),('San Marino',5,0,0,0,'EUROPA',34000),('San Vicente y las Granadinas',4,0,0,0,'AMERICA',111000),('Santa Lucía',4,1,1,0,'AMERICA',181000),('Santo Tomé y Príncipe',3,0,0,0,'AFRICA',228000),('Senegal',11,0,0,0,'AFRICA',18609000),('Serbia',114,3,1,1,'EUROPA',6586000),('Seychelles',3,0,0,0,'AFRICA',122000),('Sierra Leona',4,0,0,0,'AFRICA',8884000),('Singapur',23,0,0,1,'ASIA',6214000),('Siria',6,0,0,0,'ASIA',24348000),('Somalia',1,0,0,0,'AFRICA',18707000),('Sri Lanka',6,0,0,0,'ASIA',21894000),('Suazilandia',3,0,0,0,'AFRICA',1236000),('Sudáfrica',143,1,3,2,'AFRICA',62939000),('Sudán',3,0,0,0,'AFRICA',49358000),('Sudán del Sur',14,0,0,0,'AFRICA',15254000),('Suecia',126,4,4,3,'EUROPA',10552000),('Suiza',135,1,2,5,'EUROPA',9006000),('Surinam',5,0,0,0,'AMERICA',629000),('Tailandia',52,1,3,2,'ASIA',66866000),('Tanzania',7,0,0,0,'AFRICA',65497000),('Tayikistán',14,0,0,3,'ASIA',10376000),('Timor Oriental',4,0,0,0,'ASIA',1373000),('Togo',5,0,0,0,'AFRICA',8399000),('Tonga',4,0,0,0,'OCEANIA',100000),('Trinidad y Tobago',18,0,0,0,'AMERICA',1371000),('Túnez',27,1,1,1,'AFRICA',11920000),('Turquía',101,0,3,5,'ASIA',85674000),('Turkmenistán',6,0,0,0,'ASIA',7236000),('Tuvalu',2,0,0,0,'OCEANIA',11000),('Ucrania',143,3,5,4,'EUROPA',37938000),('Uganda',25,1,1,0,'AFRICA',46931000),('Uruguay',27,0,0,0,'AMERICA',3452000),('Uzbekistán',86,8,2,3,'ASIA',6248000),('Vanuatu',6,0,0,0,'OCEANIA',322000),('Venezuela',33,0,0,0,'AMERICA',29395000),('Vietnam',16,0,0,0,'ASIA',101290000),('Yemen',4,0,0,0,'ASIA',35220000),('Yibuti',7,0,0,0,'AFRICA',1238000),('Zambia',29,0,0,1,'AFRICA',21005000),('Zimbabue',7,0,0,0,'AFRICA',15706000);
/*!40000 ALTER TABLE `practica2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-13 13:29:59
