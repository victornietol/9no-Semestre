DROP DATABASE `practica7_mineriadatos` ;
CREATE DATABASE  IF NOT EXISTS `practica7_mineriadatos` ;
USE `practica7_mineriadatos`;

--
-- Host: localhost    Database: practica7_mineriadatos
-- ------------------------------------------------------
-- Server version	8.0.36
--
-- Table structure for table `datos`
--

DROP TABLE IF EXISTS `datos`;
CREATE TABLE `datos` (
  `categoria` varchar(50) NOT NULL,
  `cantidad_ventas` int NOT NULL
);

--
-- Dumping data for table `datos`
--

LOCK TABLES `datos` WRITE;
/*!40000 ALTER TABLE `datos` DISABLE KEYS */;
INSERT INTO `datos` VALUES ('department1',7299),('department2',6053),('department3',5811),('department4',814),('department5',375),('department6',4311),('department7',9766),('department8',9477),('department9',1756),('grocery misc',9809),('department11',7342),('baby needs',7714),('bread and cake',5228),('baking needs',2118),('coupons',8666),('juice-sat-cord-ms',6964),('tea',3009),('biscuits',8038),('canned fish-meat',9013),('canned fruit',9713),('canned vegetables',9886),('breakfast food',2498),('cigs-tobacco pkts',8284),('cigarette cartons',5398),('cleaners-polishers',405),('coffee',4553),('sauces-gravy-pkle',9095),('confectionary',7078),('puddings-deserts',8052),('dishcloths-scour',5623),('deod-disinfectant',5218),('frozen foods',2891),('razor blades',9045),('fuels-garden aids',6771),('spices',1571),('jams-spreads',9926),('insecticides',9291),('pet foods',3264),('laundry needs',9749),('party snack foods',283),('tissues-paper prd',5908),('wrapping',7365),('dried vegetables',4899),('pkt-canned soup',2705),('soft drinks',7091),('health food other',6541),('beverages hot',352),('health&beauty misc',2033),('deodorants-soap',3545),('mens toiletries',7701),('medicines',1831),('haircare',4634),('dental needs',5813),('lotions-creams',752),('sanitary pads',7547),('cough-cold-pain',4935),('department57',9998),('meat misc',1374),('cheese',9788),('chickens',8081),('milk-cream',2461),('cold-meats',5276),('deli gourmet',666),('margarine',8908),('salads',8048),('small goods',6689),('dairy foods',3314),('fruit drinks',2814),('delicatessen misc',3386),('department70',1527),('beef',4348),('hogget',9744),('lamb',1546),('pet food',3141),('pork',6691),('poultry',7230),('veal',8114),('gourmet meat',429),('department79',7113),('department80',3159),('department81',3532),('produce misc',6012),('fruit',9927),('plants',1827),('potatoes',4826),('vegetables',8291),('flowers',8653),('department88',7535),('department89',8123),('variety misc',4545),('brushware',6243),('electrical',6054),('haberdashery',5075),('kitchen',7490),('manchester',7844),('pantyhose',7987),('plasticware',2600),('department98',7369),('stationary',6803),('department100',7425),('department101',4060),('department102',5654),('prepared meals',2954),('preserving needs',2322),('condiments',9444),('cooking oils',1899),('department107',5957),('department108',732),('department109',2457),('department110',2932),('department111',6789),('department112',467),('department113',6408),('department114',9906),('health food bulk',5273),('department116',2209),('department117',4110),('department118',7686),('department119',5167),('department120',9577),('bake off products',1327),('department122',2861),('department123',6417),('department124',1208),('department125',9381),('department126',6535),('department127',2322),('department128',483),('department129',7468),('department130',1441),('small goods2',2039),('offal',1506),('mutton',2430),('trim pork',5788),('trim lamb',4238),('imported cheese',8452),('department137',3000),('department138',4334),('department139',7435),('department140',3123),('department141',4377),('department142',3948),('department143',286),('department144',7931),('department145',3631),('department146',4593),('department147',3792),('department148',7623),('department149',8274),('department150',8567),('department151',2520),('department152',2957),('department153',8955),('department154',4290),('department155',5584),('department156',9769),('department157',9475),('department158',9181),('department159',8251),('department160',2993),('department161',2660),('department162',6190),('department163',6319),('department164',9147),('department165',1275),('department166',3743),('department167',4354),('department168',1751),('department169',5813),('department170',9547),('department171',2069),('department172',8405),('department173',8563),('department174',537),('department175',1104),('department176',3492),('department177',6047),('department178',9210),('department179',7878),('casks white wine',4669),('casks red wine',9211),('750ml white nz',7469),('750ml red nz',7494),('750ml white imp',4500),('750ml red imp',2790),('sparkling nz',1079),('sparkling imp',8663),('brew kits/accesry',9674),('department189',2942),('port and sherry',1323),('ctrled label wine',7621),('department192',3474),('department193',7693),('department194',4914),('department195',352),('department196',1244),('department197',9193),('department198',2446),('department199',3834),('non host support',282),('department201',402),('department202',1422),('department203',428),('department204',220),('department205',5950),('department206',7055),('department207',572),('department208',3812),('department209',2676),('department210',9530),('department211',5502),('department212',2564),('department213',4261),('department214',3102),('department215',5347),('department216',3309);
/*!40000 ALTER TABLE `datos` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2024-10-29 14:17:58
