CREATE DATABASE  IF NOT EXISTS `box_sa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `box_sa`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: box_sa
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `idarticulo` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del artículo',
  `codigo` varchar(20) DEFAULT NULL COMMENT 'Código identificativo del artículo (único)',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'Descripción del artículo',
  `idclaseart` int DEFAULT NULL COMMENT 'Clase a la que pertenece el artículo',
  `idunidad` int DEFAULT NULL COMMENT 'Unidad de medida del artículo',
  `stock_minimo` int DEFAULT '0' COMMENT 'Stock mínimo requerido',
  `precio_prom` decimal(14,2) DEFAULT NULL COMMENT 'Precio promedio del artículo',
  `idproveedor` int DEFAULT NULL COMMENT 'Proveedor del artículo',
  `idestado` int DEFAULT NULL COMMENT 'Estado del artículo',
  `tipo_articulo` enum('Material','Producto') NOT NULL COMMENT 'Tipo: Material o Producto',
  `valor` decimal(8,2) DEFAULT NULL COMMENT 'Valor monetario del artículo',
  `idUsr` int DEFAULT NULL COMMENT 'Usuario responsable o creador del artículo',
  PRIMARY KEY (`idarticulo`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `idclaseart` (`idclaseart`),
  KEY `idunidad` (`idunidad`),
  KEY `idproveedor` (`idproveedor`),
  KEY `idestado` (`idestado`),
  KEY `idUsr` (`idUsr`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`idclaseart`) REFERENCES `claseart` (`idclaseart`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`idunidad`) REFERENCES `unidades` (`idunidad`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `articulos_ibfk_3` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `articulos_ibfk_4` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `articulos_ibfk_5` FOREIGN KEY (`idUsr`) REFERENCES `usuarios` (`idusr`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo de artículos: materiales y productos que maneja la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'BC10038-25','Base Cerejeira 100x38x2,5',2,2,50,NULL,NULL,1,'Material',100.00,NULL),(2,'BICAZ1','Birome BIC AZUL GRUESO',5,2,10,NULL,NULL,1,'Material',25.00,NULL),(3,'BICNG1','Birome BIC NEGRO GRUESO',5,2,10,NULL,NULL,1,'Material',25.00,NULL),(4,'BICRO1','Birome BIC ROJO GRUESO',5,2,10,NULL,NULL,1,'Material',25.00,NULL),(5,'BOGLOGO','Logo Bogner',20,2,15,NULL,NULL,1,'Material',0.00,NULL),(6,'BP10038-25','Base Pino 100x38x2,5',2,2,50,NULL,NULL,1,'Material',250.00,NULL),(7,'BP11038-25','Base Pino 110x38x2,5',2,2,50,NULL,NULL,1,'Material',120.00,NULL),(8,'BP12038-25','Base Pino 120x38x2,5',2,2,50,NULL,NULL,1,'Material',220.00,NULL),(9,'CHAPF-P1000','Chapa Apoyo Sup. Fender P1000',21,2,50,NULL,NULL,1,'Material',380.00,NULL),(10,'CHAPFDER-HR','Chapa Apoyo Sup. Fender HR',21,2,20,NULL,NULL,1,'Material',280.00,NULL),(11,'CHAPMBHN','Chapa Apoyo Sup. MB Head - Negro',21,2,50,NULL,NULL,1,'Material',400.00,NULL),(12,'COLA_MADERA','Cola Madera ',3,4,4000,NULL,NULL,1,'Material',90.00,NULL),(13,'CUAD-ESPIRAL-CUA-80','CUADERNO Espiralado 80h Cuadriculado',5,2,30,NULL,NULL,1,'Material',80.00,NULL),(14,'CUAD-ESPIRAL-RAY-80','CUADERNO Espiralado 80h Rayado',5,2,30,NULL,NULL,1,'Material',85.00,NULL),(15,'CUEFDER-BK','Cuerina Fender Negro',16,1,30,NULL,NULL,1,'Material',150.00,NULL),(16,'CUEMBC','Cuerina MB Caoba',16,1,30,NULL,NULL,1,'Material',320.00,NULL),(17,'CUEMBCREAM','Cuerina MB Cream',16,1,30,NULL,NULL,1,'Material',350.00,NULL),(18,'CUEMBN','Cuerina MB Negro',16,1,30,NULL,NULL,1,'Material',150.00,NULL),(19,'CUEVIB SLO','Cuerina Vibora Soldano Custom 1',16,1,30,NULL,NULL,1,'Material',600.00,NULL),(20,'ESQUIFDERA-BK','Esquinas Fender Acetato - Negro',10,2,50,NULL,NULL,1,'Material',60.00,NULL),(21,'ESQUIMBAHN','Esquinas MB Acetato Head - Negro',10,2,50,NULL,NULL,1,'Material',600.00,NULL),(22,'FC9520-25','Fondo Cerejerira 95x20x2,5',2,2,50,NULL,NULL,1,'Material',100.00,NULL),(23,'FDERLOGO1','Logo Fender 1',20,2,50,NULL,NULL,1,'Material',0.00,NULL),(24,'FDERLOGO2','Logo Fender 2',20,2,50,NULL,NULL,1,'Material',0.00,NULL),(25,'FP10535-25','Fondo Pino 105x30x2,5',2,2,20,NULL,NULL,1,'Material',100.00,NULL),(26,'FP11525-25','Fondo Pino 115x25x2,5',2,2,20,NULL,NULL,1,'Material',100.00,NULL),(27,'FP1557225','Frente Pino 1x12 W 155x72x2,5',2,2,20,NULL,NULL,1,'Material',200.00,NULL),(28,'FP9520-25','Fondo Pino 95x20x2,5',2,2,20,NULL,NULL,1,'Material',400.00,NULL),(29,'FREZ1506N','Frezado 1,5x0,6 - Negro',1,2,150,NULL,NULL,1,'Material',0.30,NULL),(30,'FREZ1506P','Frezado 1,5x0,6 - Plata',1,2,150,NULL,NULL,1,'Material',0.40,NULL),(31,'FREZ206P','Frezado 2x0,6 - Plata',1,2,100,NULL,NULL,1,'Material',0.35,NULL),(32,'FTEC9520-25','Frente Cerejerira 95x20x2,5',2,2,50,NULL,NULL,1,'Material',100.00,NULL),(33,'FTEP1210545-25','Frente Pino 1x12 105x45x2,5',2,2,20,NULL,NULL,1,'Material',100.00,NULL),(34,'FTEP1211550-25','Frente Pino 1x12 115x50x2,5',2,2,20,NULL,NULL,1,'Material',220.00,NULL),(35,'FTEP9520-25','Frente Pino 95x20x2,5',2,2,20,NULL,NULL,1,'Material',130.00,NULL),(36,'HP12A ','TONER 12A HP',17,2,2,NULL,NULL,1,'Material',3000.00,NULL),(37,'HP78A ','TONER 78A HP',17,2,2,NULL,NULL,1,'Material',3000.00,NULL),(38,'LACA-MR-BR','Laca Marina Brillante',14,4,4000,NULL,NULL,1,'Material',205.00,NULL),(39,'LACA-MR-SM','Laca Marina Semi-Mate',14,4,4000,NULL,NULL,1,'Material',134.00,NULL),(40,'LCD3840-25','Lateral Der Cerejeira Forma 38x40x2,5',2,2,20,NULL,NULL,1,'Material',100.00,NULL),(41,'LCI3840-25','Lateral Izq Cerejerira Forma 38x40x2,5',2,2,20,NULL,NULL,1,'Material',100.00,NULL),(42,'LPD3840-25','Lateral Der Pino Forma 38x40x2,5',2,2,20,NULL,NULL,1,'Material',370.00,NULL),(43,'LPD3855-25','Lateral Der Pino Forma 38x55x2,5',2,2,20,NULL,NULL,1,'Material',300.00,NULL),(44,'LPI3840-25','Lateral Izq Pino Forma 38x40x2,5',2,2,20,NULL,NULL,1,'Material',120.00,NULL),(45,'LPI3855-25','Lateral Izq Pino Forma 38x55x2,5',2,2,20,NULL,NULL,1,'Material',140.00,NULL),(46,'MANITFDER-BK','Manija Transp. Fender - Negro',8,2,20,NULL,NULL,1,'Material',140.00,NULL),(47,'MANITMBCN','Manija Transp. Heavy MB - Negro',8,2,15,NULL,NULL,1,'Material',450.00,NULL),(48,'MANITMBN','Manija Transp. MB - Negro',8,2,15,NULL,NULL,1,'Material',340.00,NULL),(49,'MARLOGO','Logo Marshall',20,2,50,NULL,NULL,1,'Material',0.00,NULL),(50,'MBLOGO1','Logo Boogie',20,2,20,NULL,NULL,1,'Material',0.00,NULL),(51,'MBLOGO2','Logo Boogie Cream',20,2,30,NULL,NULL,1,'Material',0.00,NULL),(52,'PARK205N','Parker 2x0,5 - Negro',1,2,100,NULL,NULL,1,'Material',400.00,NULL),(53,'PARK2505N','Parker 2,5x0,5 - Negro',1,2,120,NULL,NULL,1,'Material',350.00,NULL),(54,'PEGA-CTO','Pegamento de Contacto ',3,4,2000,NULL,NULL,1,'Material',295.00,NULL),(55,'PEGA-CTO_TR','Pegamento de Contacto Tranparente',3,4,2000,NULL,NULL,1,'Material',290.00,NULL),(56,'PLASTICOLA 200GRS','Plasticola 200 gramos blanca',5,2,10,NULL,NULL,1,'Material',145.00,NULL),(57,'REGAFDERSTD-BKN','Regaton Fender STD - Negro',9,2,50,NULL,NULL,1,'Material',22.00,NULL),(58,'REGAMBHN','Regaton MB Head - Negro',9,2,50,NULL,NULL,1,'Material',122.00,NULL),(59,'REGUNV35','Regaton UNIV 35mm- Negro',9,2,100,NULL,NULL,1,'Material',75.00,NULL),(60,'REGUNV40','Regaton UNIV 40mm- Negro',9,2,100,NULL,NULL,1,'Material',80.00,NULL),(61,'RESMA-A4-75GR','Resma A4 500 x 75grs',5,2,20,NULL,NULL,1,'Material',455.00,NULL),(62,'RESMA-CARTA-80GR','Resma CARTA 500 x 80grs',5,2,15,NULL,NULL,1,'Material',498.00,NULL),(63,'RIVLOGO','Logo Rivera',20,2,30,NULL,NULL,1,'Material',0.00,NULL),(64,'RUED 45-AZUL','Ruedas 45mm diam Azul',18,2,20,NULL,NULL,1,'Material',230.00,NULL),(65,'RUED 60-BK','Ruedas 60mm diam Negra',18,2,20,NULL,NULL,1,'Material',268.00,NULL),(66,'SLOLOGO','Logo Soldano',20,2,20,NULL,NULL,1,'Material',0.00,NULL),(67,'TARM1020','Tarugos Mad. 10x20',19,2,150,NULL,NULL,1,'Material',8.00,NULL),(68,'TARM1030','Tarugos Mad. 10x30',19,2,150,NULL,NULL,1,'Material',8.00,NULL),(69,'TC10028-25','Tapa Cerejeira 100x28x2,5',2,2,50,NULL,NULL,1,'Material',100.00,NULL),(70,'TELAFDER-BD','Tela Blues Deville Fender',13,1,40,NULL,NULL,1,'Material',125.80,NULL),(71,'TOPFONC20-25x25','Tope Fondo Cerejerira 20x2,5x2,5',2,2,50,NULL,NULL,1,'Material',100.00,NULL),(72,'TOPFONP20-25x25','Tope Fondo Pino 20x2,5x2,5',2,2,10,NULL,NULL,1,'Material',270.00,NULL),(73,'TOPFONP25-25x25','Tope Fondo Pino 25x2,5x2,5',2,2,10,NULL,NULL,1,'Material',290.00,NULL),(74,'TOPFONP30-25x25','Tope Fondo Pino 30x2,5x2,5',2,2,10,NULL,NULL,1,'Material',400.00,NULL),(75,'TOPFREC20-25x25','Tope Frente Cerejerira 20x2,5x2,5',2,2,50,NULL,NULL,1,'Material',100.00,NULL),(76,'TOPFREP20-25x25','Tope Frente Pino 20x2,5x2,5',2,2,10,NULL,NULL,1,'Material',300.00,NULL),(77,'TOPFREP38-25x25','Tope Frente Pino 38x2,5x2,5',2,2,10,NULL,NULL,1,'Material',210.00,NULL),(78,'TOPFREP50-25x25','Tope Frente Pino 50x2,5x2,5',2,2,15,NULL,NULL,1,'Material',125.00,NULL),(79,'TP10028-25','Tapa Pino 100x28x2,5',2,2,15,NULL,NULL,1,'Material',189.00,NULL),(80,'TP11028-25','Tapa Pino 110x28x2,5',2,2,15,NULL,NULL,1,'Material',167.00,NULL),(81,'TP12038-25','Tapa Pino 120x38x2,5',2,2,15,NULL,NULL,1,'Material',380.00,NULL),(82,'VINIL','Peg. Vinilico Contacto',12,4,1500,NULL,NULL,1,'Material',124.00,NULL),(83,'VINIL-ESP','Peg. Vinilico Contacto Especial',12,4,5000,NULL,NULL,1,'Material',450.00,NULL),(84,'VINIL-NG','Peg. Vinilico Contacto Negro',12,4,5000,NULL,NULL,1,'Material',100.00,NULL),(85,'FDERLOGO3','Logo Fender 3',20,2,200,NULL,NULL,1,'Material',0.00,NULL),(86,'RESMAA480G','Resma A4 80grs',5,2,15,NULL,NULL,1,'Material',90.00,NULL),(87,'RESMALT80G','Resma LT 80grs',5,2,10,NULL,NULL,1,'Material',95.00,NULL),(88,'BICTGAZUL','Bic trazo grueso Azul ',5,2,15,NULL,NULL,1,'Material',15.00,NULL),(89,'BICTGNEGRA','Bic trazo grueso Negra',5,2,15,NULL,NULL,1,'Material',15.00,NULL),(90,'BICTGROJO','Bic trazo grueso Rojo',5,2,15,NULL,NULL,1,'Material',15.00,NULL),(91,'BROCHES10','Broches 10',5,2,5,NULL,NULL,1,'Material',11.00,NULL),(92,'BROCHES15','Broches 15',5,2,5,NULL,NULL,1,'Material',11.80,NULL),(93,'MECHAMAD4','Mecha madera 4mm',4,2,5,NULL,NULL,1,'Material',35.00,NULL),(94,'MECHAMAD5','Mecha madera 5mm',4,2,5,NULL,NULL,1,'Material',35.00,NULL),(95,'MECHAMAD6','Mecha madera 6mm',4,2,5,NULL,NULL,1,'Material',35.00,NULL),(96,'MECHAMAD10','Mecha madera 10mm',4,2,5,NULL,NULL,1,'Material',45.00,NULL),(97,'ENERGIA','Energía Electrica',24,7,0,NULL,NULL,1,'Material',1200.00,NULL),(98,'GAS','Gas',25,4,0,NULL,NULL,1,'Material',900.00,NULL),(99,'AGUA','Agua',25,8,0,NULL,NULL,1,'Material',100.00,NULL),(100,'SEGURIDAD','Servicio de Seguridad',25,2,0,NULL,NULL,1,'Material',1050.00,NULL),(101,'SEGUROS','Seguros',25,2,0,NULL,NULL,1,'Material',3000.00,NULL),(102,'BLUED4X10','Blues Deville 4x10 Reissue',NULL,2,0,NULL,NULL,1,'Producto',38.00,NULL),(103,'BOGECS-100','Bogner Ecstasy 100-watt Tube Head',NULL,2,0,NULL,NULL,1,'Producto',29.80,NULL),(104,'CT1X12WIDE23','California Tweed1X12 CALIFORNIA TWEED 23',NULL,2,0,NULL,NULL,1,'Producto',35.00,NULL),(105,'FHOTRODDX3','Hot Rod Deluxe III',NULL,2,0,NULL,NULL,1,'Producto',37.00,NULL),(106,'MJCM900','JCM900 4100',NULL,2,0,NULL,NULL,1,'Producto',41.00,NULL),(107,'MVCAB1+','MARK V+ - Head',NULL,2,0,NULL,NULL,1,'Producto',35.00,NULL),(108,'MVCBO1','MARK V - Combo 1x12',NULL,2,0,NULL,NULL,1,'Producto',30.00,NULL),(109,'MVS8080','Marshall Valvestate 8080',NULL,2,0,NULL,NULL,1,'Producto',35.50,NULL),(110,'PERF1000','Performer 1000 - Black',NULL,2,0,NULL,NULL,1,'Producto',40.00,NULL),(111,'RIV_VENUS 5x12H','Rivera Venus 5 1x12\" 35-watt Tube Combo Amp',NULL,2,0,NULL,NULL,1,'Producto',43.60,NULL),(112,'SLO-100 SO','Soldano SLO-100 Super Lead Overdrive',NULL,2,0,NULL,NULL,1,'Producto',37.00,NULL);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit` (
  `idEvent` int NOT NULL AUTO_INCREMENT,
  `idMov` int NOT NULL,
  `DetMov` varchar(80) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `idUsr` int DEFAULT NULL,
  `Table` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEvent`),
  KEY `idxIdMov` (`idMov`),
  CONSTRAINT `fk_audit_idmov` FOREIGN KEY (`idMov`) REFERENCES `audmov` (`idMov`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de auditoría de Altas, Bajas y Modificaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audmov`
--

DROP TABLE IF EXISTS `audmov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audmov` (
  `idMov` int NOT NULL,
  `Movimiento` varchar(20) NOT NULL,
  PRIMARY KEY (`idMov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tipos de movimiento auditable: Alta, Baja, Modificación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audmov`
--

LOCK TABLES `audmov` WRITE;
/*!40000 ALTER TABLE `audmov` DISABLE KEYS */;
INSERT INTO `audmov` VALUES (1,'ALTA'),(2,'BAJA'),(3,'MODIFICACION');
/*!40000 ALTER TABLE `audmov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avance_produccion`
--

DROP TABLE IF EXISTS `avance_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avance_produccion` (
  `idavance` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del avance registrado',
  `idordenventa` int NOT NULL COMMENT 'Orden de venta (fabricación) a la que se refiere el avance',
  `idetapa` int NOT NULL COMMENT 'Etapa de producción en la que se registró el avance',
  `idoperario` int NOT NULL COMMENT 'Operario que reporta el avance',
  `fecha_hora` datetime NOT NULL COMMENT 'Fecha y hora del registro del avance',
  `unidades_procesadas` int NOT NULL COMMENT 'Cantidad de unidades procesadas en esta etapa',
  `observaciones` text COMMENT 'Observaciones adicionales',
  PRIMARY KEY (`idavance`),
  KEY `idetapa` (`idetapa`),
  KEY `idoperario` (`idoperario`),
  KEY `idordenventa` (`idordenventa`),
  CONSTRAINT `avance_produccion_ibfk_1` FOREIGN KEY (`idetapa`) REFERENCES `etapas_produccion` (`idetapa`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `avance_produccion_ibfk_2` FOREIGN KEY (`idoperario`) REFERENCES `usuarios` (`idusr`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `avance_produccion_ibfk_3` FOREIGN KEY (`idordenventa`) REFERENCES `ordenes_venta_cab` (`idordenventa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Avances de producción reportados por etapa dentro de cada orden de venta en fabricación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avance_produccion`
--

LOCK TABLES `avance_produccion` WRITE;
/*!40000 ALTER TABLE `avance_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `avance_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claseart`
--

DROP TABLE IF EXISTS `claseart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claseart` (
  `idclaseart` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único y automático para la clase de artículo',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre descriptivo de la clase (único)',
  PRIMARY KEY (`idclaseart`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Clases o categorías de artículos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claseart`
--

LOCK TABLES `claseart` WRITE;
/*!40000 ALTER TABLE `claseart` DISABLE KEYS */;
INSERT INTO `claseart` VALUES (21,'CHAPA APOYO'),(7,'CLAVOS'),(11,'CUERINA'),(16,'CUEROS'),(22,'CURTIEMBRE'),(24,'ELECTRICIDAD'),(10,'ESQUINEROS'),(4,'HERRAMIENTAS'),(14,'LACAS'),(5,'LIBRERIA'),(20,'LOGOS'),(23,'MADERA ESPECIAL'),(2,'MADERAS'),(8,'MANIJAS'),(6,'MAQUINAS ELECT.'),(3,'PEGAMENTOS'),(15,'PINTURAS'),(9,'REGATONES'),(18,'RUEDAS'),(19,'TARUGOS'),(13,'TELAS'),(17,'TONERS'),(1,'TORNILLOS'),(25,'VARIOS'),(12,'VINILICOS');
/*!40000 ALTER TABLE `claseart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idcliente` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del cliente',
  `razsoc` varchar(150) DEFAULT NULL COMMENT 'Razón social o nombre fiscal del cliente',
  `marca` varchar(100) DEFAULT NULL COMMENT 'Marca asociada al cliente',
  `fecing` date DEFAULT NULL COMMENT 'Fecha de ingreso del cliente',
  `calle` varchar(150) DEFAULT NULL COMMENT 'Dirección: calle',
  `callenro` varchar(20) DEFAULT NULL COMMENT 'Número de calle',
  `codpos` varchar(15) DEFAULT NULL COMMENT 'Código postal',
  `localidad` varchar(100) DEFAULT NULL COMMENT 'Localidad',
  `idPcia` int DEFAULT NULL COMMENT 'Provincia o estado (ver tabla provincias)',
  `tel_1` varchar(25) DEFAULT NULL COMMENT 'Teléfono 1',
  `tel_2` varchar(25) DEFAULT NULL COMMENT 'Teléfono 2',
  `tel_3` varchar(25) DEFAULT NULL COMMENT 'Teléfono 3',
  `correo` varchar(150) DEFAULT NULL COMMENT 'Correo electrónico',
  `idUsr` int DEFAULT NULL COMMENT 'Usuario asignado',
  `estado` varchar(3) DEFAULT NULL COMMENT 'Estado abreviado del cliente',
  PRIMARY KEY (`idcliente`),
  KEY `idUsr` (`idUsr`),
  KEY `idPcia` (`idPcia`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idUsr`) REFERENCES `usuarios` (`idusr`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`idPcia`) REFERENCES `provincias` (`idpcia`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Clientes de la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Fender LLC','Fender','2015-01-01','Fleming','1234','1234','Florida',1,'1111-2222','1111-2223','1111-2224','fenderllc@fender.com',4,'A'),(2,'Marshall Inc','Marshall','2014-02-10','Corrientes','2233','1400','CABA',1,'2222-1111','2222-1112','2222-1113','Marshall@marshall.com',5,'A'),(3,'Mesa LLC','Mesa Boogie','2014-01-08','Larrea','2211','1405','CABA',1,'3333-2211','3333-2222',NULL,'mesa@mesa.com',4,'A'),(4,'Soldano','Soldano','2019-10-10','Mitre','4550','2020','San Isidro',1,'1111-2254','1111-8989',NULL,'soldano@soldano.com',5,'A'),(5,'Bogner Amp Inc','Bogner','2018-09-10','Cordoba','6080','1300','CABA',1,'2223-5454',NULL,NULL,'bogneramp@bogneramp.com',4,'A'),(6,'Rivera Music LLC','Rivera','2017-10-01','Pasteur','1200','1344','CABA',1,'2233-4455','2233-5544',NULL,'riverainfo@rivera.com',5,'A');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `identrega` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la forma de entrega',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripción del tipo de entrega',
  PRIMARY KEY (`identrega`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Formas o tipos de entrega de mercadería';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `idestado` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único y automático del estado',
  `estado` varchar(50) NOT NULL COMMENT 'Nombre del estado (ejemplo: activo, pendiente)',
  `tipo` varchar(50) NOT NULL COMMENT 'Tipo o categoría del estado (ejemplo: estado de orden, estado de usuario)',
  PRIMARY KEY (`idestado`),
  UNIQUE KEY `tipo` (`tipo`,`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Estados posibles utilizados por distintas entidades del sistema, agrupados por tipo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Activo','Articulo'),(4,'Activo','Producto'),(2,'Activo','Proveedor'),(3,'Activo','Usuario');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapas_produccion`
--

DROP TABLE IF EXISTS `etapas_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapas_produccion` (
  `idetapa` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de etapa de producción',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre de la etapa',
  `descripcion` text COMMENT 'Descripción detallada de la etapa',
  PRIMARY KEY (`idetapa`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Etapas del proceso de producción';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapas_produccion`
--

LOCK TABLES `etapas_produccion` WRITE;
/*!40000 ALTER TABLE `etapas_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `etapas_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_cab`
--

DROP TABLE IF EXISTS `facturas_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_cab` (
  `idfactura` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la factura',
  `fecha_emision` date NOT NULL COMMENT 'Fecha de emisión de la factura',
  `idcliente` int NOT NULL COMMENT 'Cliente al que se factura',
  `tipo_factura` enum('A','B','C') DEFAULT 'B' COMMENT 'Tipo de factura',
  `subtotal` decimal(14,2) DEFAULT NULL COMMENT 'Subtotal facturado',
  `alicuota_iva` decimal(5,2) DEFAULT NULL COMMENT 'Alicuota del IVA aplicada',
  `total` decimal(14,2) DEFAULT NULL COMMENT 'Total final de la factura',
  `idestado` int DEFAULT NULL COMMENT 'Estado actual de la factura',
  PRIMARY KEY (`idfactura`),
  KEY `idcliente` (`idcliente`),
  KEY `idestado` (`idestado`),
  CONSTRAINT `facturas_cab_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `facturas_cab_ibfk_2` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cabecera de facturas emitidas a clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_cab`
--

LOCK TABLES `facturas_cab` WRITE;
/*!40000 ALTER TABLE `facturas_cab` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_det`
--

DROP TABLE IF EXISTS `facturas_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_det` (
  `idfacturadet` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de factura',
  `idfactura` int NOT NULL COMMENT 'Factura a la que pertenece el detalle',
  `idarticulo` int NOT NULL COMMENT 'Artículo facturado',
  `cantidad` int DEFAULT NULL COMMENT 'Cantidad facturada',
  `precio_unit` decimal(14,2) DEFAULT NULL COMMENT 'Precio unitario aplicado',
  `importe` decimal(14,2) DEFAULT NULL COMMENT 'Importe total del producto (cantidad x precio)',
  `idRemito` int DEFAULT NULL COMMENT 'Remito de origen de esta línea (una factura puede incluir líneas de varios remitos)',
  `prodDetalle` varchar(55) DEFAULT NULL COMMENT 'Detalle extra del producto',
  `formaPago` varchar(45) DEFAULT NULL COMMENT 'Forma de pago indicada en el detalle',
  PRIMARY KEY (`idfacturadet`),
  KEY `idfactura` (`idfactura`),
  KEY `idarticulo` (`idarticulo`),
  KEY `idRemito` (`idRemito`),
  CONSTRAINT `facturas_det_ibfk_1` FOREIGN KEY (`idfactura`) REFERENCES `facturas_cab` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `facturas_det_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `facturas_det_ibfk_3` FOREIGN KEY (`idRemito`) REFERENCES `remitos_cab` (`idremito`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de artículos facturados; cada línea referencia el remito de origen, lo que permite facturar varios remitos en una misma factura';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_det`
--

LOCK TABLES `facturas_det` WRITE;
/*!40000 ALTER TABLE `facturas_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fpago`
--

DROP TABLE IF EXISTS `fpago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fpago` (
  `idfpago` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de forma de pago',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripción de la forma de pago',
  PRIMARY KEY (`idfpago`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Formas de pago disponibles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fpago`
--

LOCK TABLES `fpago` WRITE;
/*!40000 ALTER TABLE `fpago` DISABLE KEYS */;
/*!40000 ALTER TABLE `fpago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra_cab`
--

DROP TABLE IF EXISTS `orden_compra_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra_cab` (
  `idorden_compra` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la orden de compra',
  `idproveedor` int NOT NULL COMMENT 'Proveedor al que se realiza la compra',
  `fecha_orden` date NOT NULL COMMENT 'Fecha en que se creó la orden de compra',
  `subtotal` decimal(14,2) DEFAULT NULL COMMENT 'Subtotal de la orden de compra',
  `total` decimal(14,2) DEFAULT NULL COMMENT 'Total de la orden de compra',
  `idestado` int DEFAULT NULL COMMENT 'Estado de la orden de compra',
  `autorizada_por` int DEFAULT NULL COMMENT 'Usuario que autorizó la orden',
  `observaciones` text COMMENT 'Observaciones de la orden',
  PRIMARY KEY (`idorden_compra`),
  KEY `idproveedor` (`idproveedor`),
  KEY `autorizada_por` (`autorizada_por`),
  KEY `idestado` (`idestado`),
  CONSTRAINT `orden_compra_cab_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orden_compra_cab_ibfk_2` FOREIGN KEY (`autorizada_por`) REFERENCES `usuarios` (`idusr`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orden_compra_cab_ibfk_3` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cabecera de órdenes de compra a proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra_cab`
--

LOCK TABLES `orden_compra_cab` WRITE;
/*!40000 ALTER TABLE `orden_compra_cab` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra_det`
--

DROP TABLE IF EXISTS `orden_compra_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra_det` (
  `iddetalle` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de orden de compra',
  `idorden_compra` int NOT NULL COMMENT 'Orden de compra asociada',
  `idarticulo` int NOT NULL COMMENT 'Artículo comprado',
  `cantidad` int NOT NULL COMMENT 'Cantidad pedida',
  `precio_unitario` decimal(14,2) DEFAULT NULL COMMENT 'Precio unitario comprado',
  PRIMARY KEY (`iddetalle`),
  KEY `idorden_compra` (`idorden_compra`),
  KEY `idarticulo` (`idarticulo`),
  CONSTRAINT `orden_compra_det_ibfk_1` FOREIGN KEY (`idorden_compra`) REFERENCES `orden_compra_cab` (`idorden_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orden_compra_det_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de artículos de una orden de compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra_det`
--

LOCK TABLES `orden_compra_det` WRITE;
/*!40000 ALTER TABLE `orden_compra_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_fab_detalle`
--

DROP TABLE IF EXISTS `orden_fab_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_fab_detalle` (
  `iddetallefab` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de orden de fabricación',
  `idordenventa` int NOT NULL COMMENT 'Orden de venta (fabricación) asociada',
  `idarticulo` int NOT NULL COMMENT 'Artículo involucrado en fabricación',
  `cantidad` int NOT NULL COMMENT 'Cantidad asignada en detalle',
  PRIMARY KEY (`iddetallefab`),
  KEY `idordenventa` (`idordenventa`),
  KEY `idarticulo` (`idarticulo`),
  CONSTRAINT `orden_fab_detalle_ibfk_1` FOREIGN KEY (`idordenventa`) REFERENCES `ordenes_venta_cab` (`idordenventa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orden_fab_detalle_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de artículos involucrados en la fabricación de una orden de venta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_fab_detalle`
--

LOCK TABLES `orden_fab_detalle` WRITE;
/*!40000 ALTER TABLE `orden_fab_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_fab_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_venta_cab`
--

DROP TABLE IF EXISTS `ordenes_venta_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_venta_cab` (
  `idordenventa` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la orden de venta',
  `idcliente` int NOT NULL COMMENT 'Cliente que realiza la orden',
  `fecha_pedido` date NOT NULL COMMENT 'Fecha en que se realizó el pedido',
  `fecha_entrega_estimada` date DEFAULT NULL COMMENT 'Fecha estimada para la entrega',
  `subtotal` decimal(14,2) DEFAULT NULL COMMENT 'Subtotal de la orden',
  `idvendedor` int NOT NULL COMMENT 'Vendedor asignado a la orden',
  `idestado` int DEFAULT NULL COMMENT 'Estado actual de la orden',
  `idfpago` int DEFAULT NULL COMMENT 'Forma de pago asociada',
  `condiciones_pago` varchar(100) DEFAULT NULL COMMENT 'Condiciones especiales de pago',
  `descuento` decimal(5,2) DEFAULT NULL COMMENT 'Descuento aplicado',
  `observaciones` text COMMENT 'Observaciones generales',
  `fecha_inicio_fab` date DEFAULT NULL COMMENT 'Fecha de inicio de fabricación (fusionada de la ex tabla ordenes_fabricacion)',
  `fecha_fin_fab` date DEFAULT NULL COMMENT 'Fecha de fin de fabricación, prevista o real (fusionada de la ex tabla ordenes_fabricacion)',
  `idestado_fab` int DEFAULT NULL COMMENT 'Estado de fabricación de la orden (fusionado de la ex tabla ordenes_fabricacion)',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación del registro',
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última fecha de modificación',
  PRIMARY KEY (`idordenventa`),
  KEY `idcliente` (`idcliente`),
  KEY `idvendedor` (`idvendedor`),
  KEY `idestado` (`idestado`),
  KEY `idfpago` (`idfpago`),
  KEY `idestado_fab` (`idestado_fab`),
  CONSTRAINT `ordenes_venta_cab_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ordenes_venta_cab_ibfk_2` FOREIGN KEY (`idvendedor`) REFERENCES `usuarios` (`idusr`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ordenes_venta_cab_ibfk_3` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ordenes_venta_cab_ibfk_4` FOREIGN KEY (`idfpago`) REFERENCES `fpago` (`idfpago`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ordenes_venta_cab_ibfk_5` FOREIGN KEY (`idestado_fab`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cabecera de órdenes de venta; incluye los datos de fabricación fusionados desde la ex tabla ordenes_fabricacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_venta_cab`
--

LOCK TABLES `ordenes_venta_cab` WRITE;
/*!40000 ALTER TABLE `ordenes_venta_cab` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes_venta_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_venta_det`
--

DROP TABLE IF EXISTS `ordenes_venta_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_venta_det` (
  `iddetalle` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de orden de venta',
  `idordenventa` int NOT NULL COMMENT 'Orden de venta asociada',
  `idarticulo` int NOT NULL COMMENT 'Artículo vendido',
  `cantidad` int NOT NULL COMMENT 'Cantidad vendida',
  `precio_unitario` decimal(14,2) DEFAULT NULL COMMENT 'Precio unitario vendido',
  PRIMARY KEY (`iddetalle`),
  KEY `idordenventa` (`idordenventa`),
  KEY `idarticulo` (`idarticulo`),
  CONSTRAINT `ordenes_venta_det_ibfk_1` FOREIGN KEY (`idordenventa`) REFERENCES `ordenes_venta_cab` (`idordenventa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordenes_venta_det_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de artículos vendidos en una orden de venta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_venta_det`
--

LOCK TABLES `ordenes_venta_det` WRITE;
/*!40000 ALTER TABLE `ordenes_venta_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes_venta_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idpago` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del pago',
  `idcliente` int NOT NULL COMMENT 'Cliente que realizó el pago',
  `fecha_pago` date NOT NULL COMMENT 'Fecha del pago',
  `monto` decimal(14,2) NOT NULL COMMENT 'Monto pagado',
  `idfpago` int DEFAULT NULL COMMENT 'Forma de pago usada',
  `idusuario` int DEFAULT NULL COMMENT 'Usuario que registró el pago',
  `observaciones` text COMMENT 'Observaciones sobre el pago',
  PRIMARY KEY (`idpago`),
  KEY `idcliente` (`idcliente`),
  KEY `idusuario` (`idusuario`),
  KEY `idfpago` (`idfpago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusr`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pagos_ibfk_3` FOREIGN KEY (`idfpago`) REFERENCES `fpago` (`idfpago`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Pagos recibidos de clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos_cuentas`
--

DROP TABLE IF EXISTS `pagos_cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_cuentas` (
  `idpagocuenta` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del registro de pago aplicado',
  `idpago` int NOT NULL COMMENT 'Pago asociado',
  `idfactura` int NOT NULL COMMENT 'Factura a la que se aplica el pago',
  `monto_pagado` decimal(14,2) NOT NULL COMMENT 'Monto pagado a la factura',
  PRIMARY KEY (`idpagocuenta`),
  KEY `idpago` (`idpago`),
  KEY `idfactura` (`idfactura`),
  CONSTRAINT `pagos_cuentas_ibfk_1` FOREIGN KEY (`idpago`) REFERENCES `pagos` (`idpago`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pagos_cuentas_ibfk_2` FOREIGN KEY (`idfactura`) REFERENCES `facturas_cab` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Aplicación de pagos de clientes a facturas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_cuentas`
--

LOCK TABLES `pagos_cuentas` WRITE;
/*!40000 ALTER TABLE `pagos_cuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos_cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesos`
--

DROP TABLE IF EXISTS `procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procesos` (
  `idproceso` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del proceso productivo',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del proceso (ejemplo: Corte, Armado, Pintura)',
  `descripcion` text COMMENT 'Descripción detallada del proceso',
  PRIMARY KEY (`idproceso`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo de procesos productivos que pueden formar parte de la fabricación de un producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesos`
--

LOCK TABLES `procesos` WRITE;
/*!40000 ALTER TABLE `procesos` DISABLE KEYS */;
INSERT INTO `procesos` VALUES (1,'ACOPIO 1','Tiempo estándar de referencia: 35.0 minutos (código origen: AC1)'),(2,'ACOPIO 2','Tiempo estándar de referencia: 28.0 minutos (código origen: AC2)'),(3,'CONTROL CALIDAD','Tiempo estándar de referencia: 25.0 minutos (código origen: CC)'),(4,'ENSAMBLADO 1','Tiempo estándar de referencia: 80.0 minutos (código origen: EN1)'),(5,'ENSAMBLADO 2','Tiempo estándar de referencia: 45.0 minutos (código origen: EN2)'),(6,'LUSTRADO','Tiempo estándar de referencia: 240.0 minutos (código origen: LUS)'),(7,'PINTURA','Tiempo estándar de referencia: 360.0 minutos (código origen: PIN)'),(8,'TAPICERIA','Tiempo estándar de referencia: 150.0 minutos (código origen: TAP)');
/*!40000 ALTER TABLE `procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_detalle`
--

DROP TABLE IF EXISTS `productos_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_detalle` (
  `idproducto` int NOT NULL COMMENT 'Identificador único del producto (artículo)',
  `idcliente` int DEFAULT NULL COMMENT 'Cliente al que está asociado el producto',
  `proddetalle` varchar(255) DEFAULT NULL COMMENT 'Detalle específico del producto',
  `costo` decimal(14,2) DEFAULT NULL COMMENT 'Costo de producción del producto',
  `margen` decimal(5,2) DEFAULT NULL COMMENT 'Margen de ganancia aplicado',
  `precio_unit` decimal(14,2) DEFAULT NULL COMMENT 'Precio unitario de venta',
  `idestado` int DEFAULT NULL COMMENT 'Estado del producto',
  `fecalta` date DEFAULT NULL COMMENT 'Fecha de alta del producto',
  `idlist` int DEFAULT NULL COMMENT 'Tipo/categoría de producto (ver tabla tipo_producto)',
  PRIMARY KEY (`idproducto`),
  KEY `idcliente` (`idcliente`),
  KEY `idestado` (`idestado`),
  KEY `idlist` (`idlist`),
  CONSTRAINT `productos_detalle_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productos_detalle_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `articulos` (`idarticulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productos_detalle_ibfk_3` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productos_detalle_ibfk_4` FOREIGN KEY (`idlist`) REFERENCES `tipo_producto` (`idtipo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Datos adicionales de costo, margen y precio de los artículos de tipo Producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_detalle`
--

LOCK TABLES `productos_detalle` WRITE;
/*!40000 ALTER TABLE `productos_detalle` DISABLE KEYS */;
INSERT INTO `productos_detalle` VALUES (102,1,'Blues Deville 4x10 Reissue',NULL,38.00,NULL,4,'2008-10-10',1),(103,5,'Bogner Ecstasy 100-watt Tube Head',NULL,29.80,NULL,4,'2011-10-10',2),(104,3,'California Tweed1X12 CALIFORNIA TWEED 23',NULL,35.00,NULL,4,'2010-02-14',3),(105,1,'Hot Rod Deluxe III',NULL,37.00,NULL,4,'2018-12-08',1),(106,2,'JCM900 4100',NULL,41.00,NULL,4,'2008-03-17',2),(107,3,'MARK V+ - Head',NULL,35.00,NULL,4,'2012-04-03',2),(108,3,'MARK V - Combo 1x12',NULL,30.00,NULL,4,'2012-04-03',1),(109,2,'Marshall Valvestate 8080',NULL,35.50,NULL,4,'2008-01-10',1),(110,1,'Performer 1000 - Black',NULL,40.00,NULL,4,'2009-08-14',1),(111,6,'Rivera Venus 5 1x12\" 35-watt Tube Combo Amp',NULL,43.60,NULL,4,'2015-09-15',2),(112,4,'Soldano SLO-100 Super Lead Overdrive',NULL,37.00,NULL,4,'2010-12-18',2);
/*!40000 ALTER TABLE `productos_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_rubro`
--

DROP TABLE IF EXISTS `proveedor_rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_rubro` (
  `idprovrubro` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la asociación proveedor-rubro',
  `idproveedor` int NOT NULL COMMENT 'Proveedor asociado',
  `idrubro` int NOT NULL COMMENT 'Rubro asociado',
  PRIMARY KEY (`idprovrubro`),
  UNIQUE KEY `uq_proveedor_rubro` (`idproveedor`,`idrubro`),
  KEY `idrubro` (`idrubro`),
  CONSTRAINT `proveedor_rubro_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proveedor_rubro_ibfk_2` FOREIGN KEY (`idrubro`) REFERENCES `rubros` (`idrubro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relación muchos-a-muchos entre proveedores y rubros (un proveedor puede tener más de un rubro)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_rubro`
--

LOCK TABLES `proveedor_rubro` WRITE;
/*!40000 ALTER TABLE `proveedor_rubro` DISABLE KEYS */;
INSERT INTO `proveedor_rubro` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,3,5),(6,4,6),(7,5,7),(8,6,8),(10,7,1),(9,7,2),(11,8,9),(12,9,10),(13,9,11),(14,10,10),(15,10,11),(16,11,12),(17,11,13),(18,12,14),(19,13,15),(20,14,14),(21,15,16),(22,15,17),(23,16,14),(24,17,18),(25,18,19),(26,19,19),(27,20,7),(28,21,20),(29,22,21),(30,22,22),(31,23,23),(32,24,24),(33,26,15),(34,27,6),(35,28,4),(36,29,14);
/*!40000 ALTER TABLE `proveedor_rubro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idproveedor` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único y automático del proveedor',
  `razsoc` varchar(150) NOT NULL COMMENT 'Razón social o nombre completo del proveedor',
  `fechaalta` date DEFAULT NULL COMMENT 'Fecha en que se dio de alta al proveedor',
  `idestado` int DEFAULT NULL COMMENT 'Estado actual del proveedor (relación con tabla estados)',
  `calle` varchar(150) DEFAULT NULL COMMENT 'Dirección: calle',
  `codpos` varchar(15) DEFAULT NULL COMMENT 'Código postal',
  `localidad` varchar(100) DEFAULT NULL COMMENT 'Localidad',
  `idrubro` int DEFAULT NULL COMMENT 'Rubro principal al que pertenece el proveedor',
  `idpcia` int DEFAULT NULL COMMENT 'Provincia del proveedor (ver tabla provincias)',
  `telefono` varchar(50) DEFAULT NULL COMMENT 'Teléfono de contacto',
  `email` varchar(150) DEFAULT NULL COMMENT 'Correo electrónico',
  `condiciones_comerciales` text COMMENT 'Condiciones comerciales en texto libre',
  PRIMARY KEY (`idproveedor`),
  KEY `idrubro` (`idrubro`),
  KEY `idestado` (`idestado`),
  KEY `idpcia` (`idpcia`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`idrubro`) REFERENCES `rubros` (`idrubro`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `proveedores_ibfk_3` FOREIGN KEY (`idpcia`) REFERENCES `provincias` (`idpcia`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Proveedores de la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Lara SRL','2005-02-01',2,'Mosconi 1234','1100','CABA',1,1,'1111-2234',NULL,NULL),(2,'Madedera Lopez S.A.','2011-02-01',2,'Rivadavia 4','1200','CABA',4,1,'2111-2234',NULL,NULL),(3,'Pegote SRL','2005-02-01',2,'Thames 1900','1400','SAN ISIDRO',5,2,'2111-2255',NULL,NULL),(4,'BA Tools SA','2005-02-01',2,'Belgrano 900','1870','AVELLANEDA',6,2,'2111-1212',NULL,NULL),(5,'Librería El Arte SRL','2010-02-01',2,'Cordoba 700','1101','CABA',7,1,'3311-2234',NULL,NULL),(6,'Bosch SA','2005-02-01',2,'Chacabuco 740','1302','CABA',8,1,'4411-2234',NULL,NULL),(7,'Ferroso SRL','2005-02-01',2,'Peru 4500','1302','CABA',2,1,'2111-4321',NULL,NULL),(8,'Agarrate Bien SRL','2010-02-01',2,'Mendoza 2345','1908','LOMAS DE ZAMORA',9,2,'8989-2234',NULL,NULL),(9,'Herrajes Norte SA','2005-02-01',2,'Piedras 809','3322','CORDOBA',10,6,'6776-2234',NULL,NULL),(10,'Herrajes Sur SRL','2005-02-01',2,'Rocas 1221','2221','NEUQUEN',10,15,'2112-2344',NULL,NULL),(11,'Eco Cueros SA','2005-02-01',2,'Irigoyen 4330','1344','LANUS',12,2,'2113-5534',NULL,NULL),(12,'Fender LLC','2008-02-01',2,'Fleming 1234','1234','FLORIDA',14,25,'4576-2234',NULL,NULL),(13,'ACME Textil SA','2005-02-01',2,'Rocha 2509','2245','VICENTE LOPEZ',15,2,'2910-2234',NULL,NULL),(14,'Marshall Co','2005-02-01',2,'Corrientes 2233','1400','CABA',14,1,'2111-1111',NULL,NULL),(15,'Plavicon SA','2005-02-01',2,'Au Bs.As. Cañuelas KM 34','9000','EZEIZA',16,2,'2111-2222',NULL,NULL),(16,'Mesa LLC','2005-02-01',2,'Larrea 2211','1405','CABA',14,1,'2111-3333',NULL,NULL),(17,'Insumos SRL','2006-02-01',2,'Paraguay 800','1222','CABA',18,1,'2111-4445',NULL,NULL),(18,'Rodanet SRL','2005-02-01',2,'Heredia 1200','1870','AVELLANEDA',19,2,'2111-4456',NULL,NULL),(19,'Ruedas SA','2005-02-01',2,'Av. Calchaqui 3405','1978','QUILMES',19,2,'3232-2234',NULL,NULL),(20,'Librería Maya SRL','2008-02-01',2,'Larrzabal 789','2000','CABA',7,1,'6018-2234',NULL,NULL),(21,'Chapas Floresta SRL','2005-02-01',2,'Gutierrez 1304','2331','CABA',20,1,'8755-2234',NULL,NULL),(22,'Cueros Vacunos SRL','2005-02-01',2,'Arrollo 678','3332','CORRIENTES',21,7,'9844-2234',NULL,NULL),(23,'Jacaranda SA','2005-02-01',2,'Arredondo 3000','1890','GERLI',23,2,'3244-2224',NULL,NULL),(24,'Electro Tucuman SA','2008-02-01',2,'Tucuman 550','2001','CABA',24,1,'2152-8900',NULL,NULL),(26,'Tolex SRL','2011-02-01',2,'Yerbal 1700','2003','CABA',15,1,'1001-2232',NULL,NULL),(27,'Todo Herramientas SRL','2020-02-01',2,'Chacabuco 890','2008','CABA',6,1,'4190-2211',NULL,NULL),(28,'Aserradero Pampa SA','2005-02-01',2,'Cruce 1900','3400','Gral Pico',4,11,'5066-1134',NULL,NULL),(29,'Bogner Amp Inc','2011-02-01',2,'Cordoba 6080','1300','CABA',14,1,'2390-2888',NULL,NULL);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `idpcia` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único y automático de la provincia',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre de la provincia o región (único)',
  PRIMARY KEY (`idpcia`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Provincias / regiones utilizadas por clientes y proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (2,'Buenos Aires'),(3,'Catamarca'),(4,'Chaco'),(5,'Chubut'),(1,'Ciudad Autónoma de Buenos Aires'),(6,'Córdoba'),(7,'Corrientes'),(8,'Entre Ríos'),(25,'Exterior'),(9,'Formosa'),(10,'Jujuy'),(11,'La Pampa'),(12,'La Rioja'),(13,'Mendoza'),(14,'Misiones'),(15,'Neuquén'),(16,'Río Negro'),(17,'Salta'),(18,'San Juan'),(19,'San Luis'),(20,'Santa Cruz'),(21,'Santa Fe'),(22,'Santiago del Estero'),(23,'Tierra del Fuego'),(24,'Tucumán');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `idpuesto` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del puesto',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del puesto (único)',
  PRIMARY KEY (`idpuesto`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Puestos de trabajo del personal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcion_mercaderia`
--

DROP TABLE IF EXISTS `recepcion_mercaderia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcion_mercaderia` (
  `idrecepcion` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de recepción',
  `idorden_compra` int NOT NULL COMMENT 'Orden de compra relacionada',
  `fecha_recepcion` date NOT NULL COMMENT 'Fecha en que se recibió la mercadería',
  `observaciones` text COMMENT 'Observaciones generales de la recepción',
  PRIMARY KEY (`idrecepcion`),
  KEY `idorden_compra` (`idorden_compra`),
  CONSTRAINT `recepcion_mercaderia_ibfk_1` FOREIGN KEY (`idorden_compra`) REFERENCES `orden_compra_cab` (`idorden_compra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cabecera de recepciones de mercadería de proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcion_mercaderia`
--

LOCK TABLES `recepcion_mercaderia` WRITE;
/*!40000 ALTER TABLE `recepcion_mercaderia` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcion_mercaderia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcion_mercaderia_det`
--

DROP TABLE IF EXISTS `recepcion_mercaderia_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcion_mercaderia_det` (
  `iddetalle` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de recepción',
  `idrecepcion` int NOT NULL COMMENT 'Recepción a la que pertenece el detalle',
  `idarticulo` int NOT NULL COMMENT 'Artículo recibido',
  `cantidad_recibida` int NOT NULL COMMENT 'Cantidad recibida del artículo',
  PRIMARY KEY (`iddetalle`),
  KEY `idrecepcion` (`idrecepcion`),
  KEY `idarticulo` (`idarticulo`),
  CONSTRAINT `recepcion_mercaderia_det_ibfk_1` FOREIGN KEY (`idrecepcion`) REFERENCES `recepcion_mercaderia` (`idrecepcion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recepcion_mercaderia_det_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de artículos recibidos en una recepción de mercadería';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcion_mercaderia_det`
--

LOCK TABLES `recepcion_mercaderia_det` WRITE;
/*!40000 ALTER TABLE `recepcion_mercaderia_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcion_mercaderia_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas_materiales`
--

DROP TABLE IF EXISTS `recetas_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas_materiales` (
  `idrecetamaterial` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del componente de receta',
  `idarticulo` int NOT NULL COMMENT 'Producto (artículo) al que pertenece la receta',
  `idmaterial` int NOT NULL COMMENT 'Material (artículo) requerido para fabricar el producto',
  `cantidad` decimal(14,3) NOT NULL COMMENT 'Cantidad del material necesaria por unidad de producto',
  PRIMARY KEY (`idrecetamaterial`),
  KEY `idarticulo` (`idarticulo`),
  KEY `idmaterial` (`idmaterial`),
  CONSTRAINT `recetas_materiales_ibfk_1` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recetas_materiales_ibfk_2` FOREIGN KEY (`idmaterial`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Receta de materiales (lista de materiales / BOM) con las cantidades necesarias para fabricar cada producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas_materiales`
--

LOCK TABLES `recetas_materiales` WRITE;
/*!40000 ALTER TABLE `recetas_materiales` DISABLE KEYS */;
INSERT INTO `recetas_materiales` VALUES (1,107,79,1.000),(2,107,6,1.000),(3,107,42,1.000),(4,107,44,1.000),(5,107,28,1.000),(6,107,35,1.000),(7,107,76,2.000),(8,107,72,2.000),(9,107,58,4.000),(10,107,21,6.000),(11,107,48,1.000),(12,107,67,8.000),(13,107,52,4.000),(14,107,53,4.000),(15,107,31,2.000),(16,107,11,2.000),(17,107,30,4.000),(18,107,18,2.800),(19,107,82,550.000),(20,107,29,8.000),(21,107,50,1.000),(22,108,80,1.000),(23,108,7,1.000),(24,108,43,1.000),(25,108,45,1.000),(26,108,25,1.000),(27,108,74,2.000),(28,108,33,1.000),(29,108,77,2.000),(30,108,58,4.000),(31,108,21,5.000),(32,108,48,1.000),(33,108,67,8.000),(34,108,52,4.000),(35,108,53,4.000),(36,108,31,2.000),(37,108,11,2.000),(38,108,30,4.000),(39,108,18,4.700),(40,108,82,880.000),(41,108,29,8.000),(42,108,50,1.000),(43,104,81,1.000),(44,104,8,1.000),(45,104,43,1.000),(46,104,45,1.000),(47,104,26,1.000),(48,104,73,2.000),(49,104,78,2.000),(50,104,34,1.000),(51,104,58,4.000),(52,104,21,6.000),(53,104,47,1.000),(54,104,67,8.000),(55,104,52,8.000),(56,104,53,4.000),(57,104,31,2.000),(58,104,11,2.000),(59,104,30,4.000),(60,104,17,3.600),(61,104,82,780.000),(62,104,29,8.000),(63,104,27,1.000),(64,104,51,1.000),(65,102,79,1.000),(66,102,6,1.000),(67,102,42,1.000),(68,102,44,1.000),(69,102,28,1.000),(70,102,35,1.000),(71,102,76,2.000),(72,102,72,2.000),(73,102,57,4.000),(74,102,46,1.000),(75,102,67,8.000),(76,102,52,4.000),(77,102,53,4.000),(78,102,31,2.000),(79,102,30,4.000),(80,102,70,5.800),(81,102,82,760.000),(82,102,29,8.000),(83,102,23,1.000),(84,105,69,1.000),(85,105,1,1.000),(86,105,40,1.000),(87,105,41,1.000),(88,105,22,1.000),(89,105,32,1.000),(90,105,75,2.000),(91,105,71,2.000),(92,105,57,4.000),(93,105,20,6.000),(94,105,46,1.000),(95,105,67,8.000),(96,105,52,4.000),(97,105,53,4.000),(98,105,31,2.000),(99,105,10,2.000),(100,105,30,4.000),(101,105,15,4.800),(102,105,82,760.000),(103,105,29,8.000),(104,105,24,1.000),(105,110,79,1.000),(106,110,6,1.000),(107,110,42,1.000),(108,110,44,1.000),(109,110,28,1.000),(110,110,35,1.000),(111,110,76,2.000),(112,110,72,2.000),(113,110,57,4.000),(114,110,46,1.000),(115,110,67,8.000),(116,110,52,4.000),(117,110,53,4.000),(118,110,31,2.000),(119,110,30,4.000),(120,110,15,5.100),(121,110,82,820.000),(122,110,29,8.000),(123,110,85,1.000);
/*!40000 ALTER TABLE `recetas_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas_procesos`
--

DROP TABLE IF EXISTS `recetas_procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas_procesos` (
  `idrecetaproceso` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del paso de receta de proceso',
  `idarticulo` int NOT NULL COMMENT 'Producto (artículo) al que pertenece la receta',
  `idproceso` int NOT NULL COMMENT 'Proceso involucrado en la fabricación del producto',
  `orden_secuencia` int NOT NULL COMMENT 'Orden en que se ejecuta el proceso dentro de la receta',
  `tiempo_estimado` decimal(10,2) DEFAULT NULL COMMENT 'Tiempo estimado del proceso, en minutos',
  PRIMARY KEY (`idrecetaproceso`),
  KEY `idarticulo` (`idarticulo`),
  KEY `idproceso` (`idproceso`),
  CONSTRAINT `recetas_procesos_ibfk_1` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recetas_procesos_ibfk_2` FOREIGN KEY (`idproceso`) REFERENCES `procesos` (`idproceso`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Receta de procesos: secuencia de procesos productivos necesarios para fabricar cada producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas_procesos`
--

LOCK TABLES `recetas_procesos` WRITE;
/*!40000 ALTER TABLE `recetas_procesos` DISABLE KEYS */;
INSERT INTO `recetas_procesos` VALUES (1,102,1,1,45.00),(2,102,4,2,90.00),(3,102,2,3,30.00),(4,102,5,5,55.00),(5,102,3,6,25.00),(6,107,1,1,45.00),(7,107,4,2,95.00),(8,107,2,3,40.00),(9,107,5,5,45.00),(10,108,1,1,35.00),(11,108,4,2,80.00),(12,108,2,3,28.00),(13,108,5,5,45.00),(14,108,3,6,25.00),(15,105,1,1,40.00),(16,105,4,2,110.00),(17,105,8,4,165.00),(18,105,2,3,35.00),(19,105,5,5,45.00),(20,102,8,4,170.00),(21,108,8,4,150.00),(22,107,8,4,170.00),(23,104,1,1,35.00),(24,104,4,2,80.00),(25,104,2,3,28.00),(26,104,8,4,150.00),(27,104,5,5,45.00),(28,104,3,6,25.00);
/*!40000 ALTER TABLE `recetas_procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rechazos_produccion`
--

DROP TABLE IF EXISTS `rechazos_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rechazos_produccion` (
  `idrechazo` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del rechazo en producción',
  `idordenventa` int NOT NULL COMMENT 'Orden de venta (fabricación) relacionada',
  `idetapa` int NOT NULL COMMENT 'Etapa de producción donde ocurrió el rechazo',
  `idoperario` int NOT NULL COMMENT 'Operario que registró el rechazo',
  `fecha_hora` datetime NOT NULL COMMENT 'Fecha y hora del rechazo',
  `unidades_rechazadas` int NOT NULL COMMENT 'Cantidad de unidades rechazadas',
  `motivo` text COMMENT 'Motivo del rechazo',
  PRIMARY KEY (`idrechazo`),
  KEY `idordenventa` (`idordenventa`),
  KEY `idetapa` (`idetapa`),
  KEY `idoperario` (`idoperario`),
  CONSTRAINT `rechazos_produccion_ibfk_1` FOREIGN KEY (`idordenventa`) REFERENCES `ordenes_venta_cab` (`idordenventa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rechazos_produccion_ibfk_2` FOREIGN KEY (`idetapa`) REFERENCES `etapas_produccion` (`idetapa`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rechazos_produccion_ibfk_3` FOREIGN KEY (`idoperario`) REFERENCES `usuarios` (`idusr`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Rechazos de unidades registrados durante la producción';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rechazos_produccion`
--

LOCK TABLES `rechazos_produccion` WRITE;
/*!40000 ALTER TABLE `rechazos_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `rechazos_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitos_cab`
--

DROP TABLE IF EXISTS `remitos_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitos_cab` (
  `idremito` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de remito',
  `fecha_emision` date NOT NULL COMMENT 'Fecha de emisión del remito',
  `idestado` int DEFAULT NULL COMMENT 'Estado actual del remito',
  `datos_cliente` text COMMENT 'Datos del cliente relacionados',
  `datos_transporte` text COMMENT 'Datos del transporte',
  `identrega` int DEFAULT NULL COMMENT 'Tipo de entrega asociado',
  PRIMARY KEY (`idremito`),
  KEY `idestado` (`idestado`),
  KEY `identrega` (`identrega`),
  CONSTRAINT `remitos_cab_ibfk_1` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `remitos_cab_ibfk_2` FOREIGN KEY (`identrega`) REFERENCES `entregas` (`identrega`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cabecera de remitos de entrega a clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitos_cab`
--

LOCK TABLES `remitos_cab` WRITE;
/*!40000 ALTER TABLE `remitos_cab` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitos_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitos_det`
--

DROP TABLE IF EXISTS `remitos_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitos_det` (
  `idrem_det` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de remito',
  `idremito` int NOT NULL COMMENT 'Remito al que pertenece el detalle',
  `idordenventa` int NOT NULL COMMENT 'Orden de venta/fabricación de origen de esta línea (un remito puede incluir líneas de varias órdenes)',
  `idarticulo` int NOT NULL COMMENT 'Artículo entregado',
  `cantidad` int NOT NULL COMMENT 'Cantidad entregada',
  `peso` decimal(10,3) DEFAULT NULL COMMENT 'Peso asociado al artículo',
  `idestado` int DEFAULT NULL COMMENT 'Estado del detalle',
  PRIMARY KEY (`idrem_det`),
  KEY `idremito` (`idremito`),
  KEY `idordenventa` (`idordenventa`),
  KEY `idarticulo` (`idarticulo`),
  KEY `idestado` (`idestado`),
  CONSTRAINT `remitos_det_ibfk_1` FOREIGN KEY (`idremito`) REFERENCES `remitos_cab` (`idremito`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remitos_det_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `remitos_det_ibfk_3` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `remitos_det_ibfk_4` FOREIGN KEY (`idordenventa`) REFERENCES `ordenes_venta_cab` (`idordenventa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de artículos entregados en un remito; cada línea referencia la orden de venta/fabricación de origen, lo que permite remitir varias órdenes en un mismo remito';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitos_det`
--

LOCK TABLES `remitos_det` WRITE;
/*!40000 ALTER TABLE `remitos_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitos_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas_materiales`
--

DROP TABLE IF EXISTS `reservas_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas_materiales` (
  `idreserva` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la reserva de material',
  `idordenventa` int NOT NULL COMMENT 'Orden de venta (fabricación) para la cual se reserva',
  `idarticulo` int NOT NULL COMMENT 'Artículo reservado',
  `cantidad_reservada` int NOT NULL COMMENT 'Cantidad de material reservada',
  `fecha_reserva` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la reserva',
  PRIMARY KEY (`idreserva`),
  KEY `idordenventa` (`idordenventa`),
  KEY `idarticulo` (`idarticulo`),
  CONSTRAINT `reservas_materiales_ibfk_1` FOREIGN KEY (`idordenventa`) REFERENCES `ordenes_venta_cab` (`idordenventa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservas_materiales_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Reserva de materia prima al cargar una orden en fabricación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas_materiales`
--

LOCK TABLES `reservas_materiales` WRITE;
/*!40000 ALTER TABLE `reservas_materiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservas_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubros`
--

DROP TABLE IF EXISTS `rubros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubros` (
  `idrubro` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único y automático del rubro',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del rubro (único)',
  PRIMARY KEY (`idrubro`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Rubros de proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubros`
--

LOCK TABLES `rubros` WRITE;
/*!40000 ALTER TABLE `rubros` DISABLE KEYS */;
INSERT INTO `rubros` VALUES (20,'CHAPA APOYO'),(2,'CLAVOS'),(12,'CUERINA'),(21,'CUEROS'),(22,'CURTIEMBRE'),(24,'ELECTRICIDAD'),(11,'ESQUINEROS'),(6,'HERRAMIENTAS'),(17,'LACAS'),(7,'LIBRERIA'),(14,'LOGOS'),(23,'MADERA ESPECIAL'),(4,'MADERAS'),(9,'MANIJAS'),(8,'MAQUINAS ELECT.'),(5,'PEGAMENTOS'),(16,'PINTURAS'),(10,'REGATONES'),(19,'RUEDAS'),(3,'TARUGOS'),(15,'TELAS'),(18,'TONERS'),(1,'TORNILLOS'),(13,'VINILICOS');
/*!40000 ALTER TABLE `rubros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_compra`
--

DROP TABLE IF EXISTS `solicitud_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_compra` (
  `idsolicitud` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de solicitud de compra',
  `area_solicitante` varchar(100) NOT NULL COMMENT 'Área que solicita la compra',
  `fecha_solicitud` date NOT NULL COMMENT 'Fecha de solicitud',
  `autorizada_por` int DEFAULT NULL COMMENT 'Usuario que autorizó la solicitud',
  `idestado` int DEFAULT NULL COMMENT 'Estado actual de la solicitud',
  `observaciones` text COMMENT 'Observaciones adicionales',
  PRIMARY KEY (`idsolicitud`),
  KEY `autorizada_por` (`autorizada_por`),
  KEY `idestado` (`idestado`),
  CONSTRAINT `solicitud_compra_ibfk_1` FOREIGN KEY (`autorizada_por`) REFERENCES `usuarios` (`idusr`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `solicitud_compra_ibfk_2` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Solicitudes internas de compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_compra`
--

LOCK TABLES `solicitud_compra` WRITE;
/*!40000 ALTER TABLE `solicitud_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_compra_det`
--

DROP TABLE IF EXISTS `solicitud_compra_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_compra_det` (
  `iddetalle` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de solicitud de compra',
  `idsolicitud` int NOT NULL COMMENT 'Solicitud de compra a la que pertenece',
  `idarticulo` int NOT NULL COMMENT 'Artículo solicitado',
  `cantidad` int NOT NULL COMMENT 'Cantidad solicitada',
  PRIMARY KEY (`iddetalle`),
  KEY `idsolicitud` (`idsolicitud`),
  KEY `idarticulo` (`idarticulo`),
  CONSTRAINT `solicitud_compra_det_ibfk_1` FOREIGN KEY (`idsolicitud`) REFERENCES `solicitud_compra` (`idsolicitud`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `solicitud_compra_det_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de artículos solicitados en una solicitud de compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_compra_det`
--

LOCK TABLES `solicitud_compra_det` WRITE;
/*!40000 ALTER TABLE `solicitud_compra_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_compra_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_movimientos`
--

DROP TABLE IF EXISTS `stock_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_movimientos` (
  `idmovimiento` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del movimiento de stock',
  `idarticulo` int NOT NULL COMMENT 'Artículo afectado por el movimiento',
  `fecha_hora` datetime NOT NULL COMMENT 'Fecha y hora del movimiento',
  `cantidad` int NOT NULL COMMENT 'Cantidad movida',
  `tipo_movimiento` enum('Ingreso','Salida','Ajuste','Reserva','Liberacion') NOT NULL COMMENT 'Tipo de movimiento de stock',
  `referencia` varchar(100) DEFAULT NULL COMMENT 'Referencia o motivo del movimiento',
  `idusuario` int DEFAULT NULL COMMENT 'Usuario responsable del movimiento',
  PRIMARY KEY (`idmovimiento`),
  KEY `idarticulo` (`idarticulo`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `stock_movimientos_ibfk_1` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`idarticulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `stock_movimientos_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusr`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Movimientos de stock: ingresos, salidas, ajustes, reservas y liberaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movimientos`
--

LOCK TABLES `stock_movimientos` WRITE;
/*!40000 ALTER TABLE `stock_movimientos` DISABLE KEYS */;
INSERT INTO `stock_movimientos` VALUES (1,1,'2016-03-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(2,2,'2007-01-01 00:00:00',35,'Ingreso','Carga inicial de stock',NULL),(3,3,'2007-01-01 00:00:00',21,'Ingreso','Carga inicial de stock',NULL),(4,4,'2007-01-01 00:00:00',18,'Ingreso','Carga inicial de stock',NULL),(5,5,'2018-08-02 00:00:00',30,'Ingreso','Carga inicial de stock',NULL),(6,6,'2010-01-08 00:00:00',65,'Ingreso','Carga inicial de stock',NULL),(7,7,'2010-02-08 00:00:00',60,'Ingreso','Carga inicial de stock',NULL),(8,8,'2010-04-20 00:00:00',90,'Ingreso','Carga inicial de stock',NULL),(9,9,'2010-04-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(10,10,'2019-04-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(11,11,'2010-04-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(12,12,'2013-02-08 00:00:00',1600000,'Ingreso','Carga inicial de stock',NULL),(13,13,'2018-08-08 00:00:00',12,'Ingreso','Carga inicial de stock',NULL),(14,14,'2018-08-08 00:00:00',12,'Ingreso','Carga inicial de stock',NULL),(15,15,'2010-11-03 00:00:00',180,'Ingreso','Carga inicial de stock',NULL),(16,16,'2010-03-08 00:00:00',138,'Ingreso','Carga inicial de stock',NULL),(17,17,'2010-10-02 00:00:00',145,'Ingreso','Carga inicial de stock',NULL),(18,18,'2010-11-03 00:00:00',180,'Ingreso','Carga inicial de stock',NULL),(19,19,'2020-01-01 00:00:00',80,'Ingreso','Carga inicial de stock',NULL),(20,20,'2018-08-04 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(21,21,'2018-08-04 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(22,22,'2016-03-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(23,23,'2018-08-02 00:00:00',130,'Ingreso','Carga inicial de stock',NULL),(24,24,'2018-08-02 00:00:00',50,'Ingreso','Carga inicial de stock',NULL),(25,25,'2018-08-04 00:00:00',40,'Ingreso','Carga inicial de stock',NULL),(26,26,'2018-08-08 00:00:00',38,'Ingreso','Carga inicial de stock',NULL),(27,27,'2010-08-08 00:00:00',62,'Ingreso','Carga inicial de stock',NULL),(28,28,'2012-08-08 00:00:00',80,'Ingreso','Carga inicial de stock',NULL),(29,29,'2012-08-08 00:00:00',98,'Ingreso','Carga inicial de stock',NULL),(30,30,'2012-08-08 00:00:00',480,'Ingreso','Carga inicial de stock',NULL),(31,31,'2012-08-08 00:00:00',500,'Ingreso','Carga inicial de stock',NULL),(32,32,'2016-03-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(33,33,'2012-08-08 00:00:00',41,'Ingreso','Carga inicial de stock',NULL),(34,34,'2018-06-08 00:00:00',42,'Ingreso','Carga inicial de stock',NULL),(35,35,'2010-07-08 00:00:00',19,'Ingreso','Carga inicial de stock',NULL),(36,36,'2018-08-08 00:00:00',5,'Ingreso','Carga inicial de stock',NULL),(37,37,'2021-10-08 00:00:00',3,'Ingreso','Carga inicial de stock',NULL),(38,38,'2019-08-05 00:00:00',40092,'Ingreso','Carga inicial de stock',NULL),(39,39,'2019-03-01 00:00:00',80000,'Ingreso','Carga inicial de stock',NULL),(40,40,'2016-03-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(41,41,'2016-03-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(42,42,'2010-08-08 00:00:00',20,'Ingreso','Carga inicial de stock',NULL),(43,43,'2010-09-08 00:00:00',19,'Ingreso','Carga inicial de stock',NULL),(44,44,'2012-08-08 00:00:00',18,'Ingreso','Carga inicial de stock',NULL),(45,45,'2012-08-08 00:00:00',22,'Ingreso','Carga inicial de stock',NULL),(46,46,'2018-08-08 00:00:00',60,'Ingreso','Carga inicial de stock',NULL),(47,47,'2012-08-08 00:00:00',35,'Ingreso','Carga inicial de stock',NULL),(48,48,'2018-08-08 00:00:00',30,'Ingreso','Carga inicial de stock',NULL),(49,49,'2017-08-03 00:00:00',200,'Ingreso','Carga inicial de stock',NULL),(50,50,'2018-02-06 00:00:00',20,'Ingreso','Carga inicial de stock',NULL),(51,51,'2013-02-08 00:00:00',150,'Ingreso','Carga inicial de stock',NULL),(52,52,'2013-08-08 00:00:00',220,'Ingreso','Carga inicial de stock',NULL),(53,53,'2018-08-06 00:00:00',250,'Ingreso','Carga inicial de stock',NULL),(54,54,'2020-08-12 00:00:00',12000,'Ingreso','Carga inicial de stock',NULL),(55,55,'2020-10-03 00:00:00',20000,'Ingreso','Carga inicial de stock',NULL),(56,56,'2019-08-08 00:00:00',12,'Ingreso','Carga inicial de stock',NULL),(57,57,'2018-08-06 00:00:00',180,'Ingreso','Carga inicial de stock',NULL),(58,58,'2018-08-06 00:00:00',97,'Ingreso','Carga inicial de stock',NULL),(59,59,'2018-08-06 00:00:00',650,'Ingreso','Carga inicial de stock',NULL),(60,60,'2018-08-06 00:00:00',450,'Ingreso','Carga inicial de stock',NULL),(61,61,'2020-08-08 00:00:00',25,'Ingreso','Carga inicial de stock',NULL),(62,62,'2020-08-08 00:00:00',15,'Ingreso','Carga inicial de stock',NULL),(63,63,'2020-10-03 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(64,64,'2017-08-10 00:00:00',80,'Ingreso','Carga inicial de stock',NULL),(65,65,'2017-08-10 00:00:00',120,'Ingreso','Carga inicial de stock',NULL),(66,66,'2019-03-14 00:00:00',78,'Ingreso','Carga inicial de stock',NULL),(67,67,'2014-02-05 00:00:00',405,'Ingreso','Carga inicial de stock',NULL),(68,68,'2014-08-04 00:00:00',605,'Ingreso','Carga inicial de stock',NULL),(69,69,'2016-03-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(70,70,'2019-08-02 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(71,71,'2016-03-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(72,72,'2014-08-08 00:00:00',12,'Ingreso','Carga inicial de stock',NULL),(73,73,'2014-02-08 00:00:00',14,'Ingreso','Carga inicial de stock',NULL),(74,74,'2014-08-10 00:00:00',16,'Ingreso','Carga inicial de stock',NULL),(75,75,'2016-03-10 00:00:00',100,'Ingreso','Carga inicial de stock',NULL),(76,76,'2014-08-10 00:00:00',12,'Ingreso','Carga inicial de stock',NULL),(77,77,'2017-08-18 00:00:00',14,'Ingreso','Carga inicial de stock',NULL),(78,78,'2017-08-10 00:00:00',16,'Ingreso','Carga inicial de stock',NULL),(79,79,'2017-08-04 00:00:00',24,'Ingreso','Carga inicial de stock',NULL),(80,80,'2017-08-03 00:00:00',23,'Ingreso','Carga inicial de stock',NULL),(81,81,'2017-08-03 00:00:00',22,'Ingreso','Carga inicial de stock',NULL),(82,82,'2018-08-02 00:00:00',1350,'Ingreso','Carga inicial de stock',NULL),(83,83,'2019-08-02 00:00:00',2500,'Ingreso','Carga inicial de stock',NULL),(84,84,'2019-08-01 00:00:00',4560,'Ingreso','Carga inicial de stock',NULL),(85,85,'2018-08-02 00:00:00',1000,'Ingreso','Carga inicial de stock',NULL),(86,86,'2021-10-10 00:00:00',25,'Ingreso','Carga inicial de stock',NULL),(87,87,'2021-10-10 00:00:00',15,'Ingreso','Carga inicial de stock',NULL),(88,88,'2021-10-10 00:00:00',8,'Ingreso','Carga inicial de stock',NULL),(89,89,'2021-11-10 00:00:00',30,'Ingreso','Carga inicial de stock',NULL),(90,90,'2021-10-10 00:00:00',55,'Ingreso','Carga inicial de stock',NULL),(91,91,'2021-11-10 00:00:00',5,'Ingreso','Carga inicial de stock',NULL),(92,92,'2021-10-20 00:00:00',16,'Ingreso','Carga inicial de stock',NULL),(93,93,'2018-08-03 00:00:00',12,'Ingreso','Carga inicial de stock',NULL),(94,94,'2018-01-12 00:00:00',8,'Ingreso','Carga inicial de stock',NULL),(95,95,'2018-08-03 00:00:00',14,'Ingreso','Carga inicial de stock',NULL),(96,96,'2018-01-10 00:00:00',3,'Ingreso','Carga inicial de stock',NULL),(97,79,'2026-10-16 20:58:04',1,'Reserva','OV 2',4),(98,6,'2026-10-16 20:58:04',1,'Reserva','OV 2',4),(99,42,'2026-10-16 20:58:04',1,'Reserva','OV 2',4),(100,44,'2026-10-16 20:58:04',1,'Reserva','OV 2',4),(101,28,'2026-10-16 20:58:04',1,'Reserva','OV 2',4),(102,35,'2026-10-16 20:58:04',1,'Reserva','OV 2',4),(103,76,'2026-10-16 20:58:04',2,'Reserva','OV 2',4),(104,72,'2026-10-16 20:58:04',2,'Reserva','OV 2',4),(105,57,'2026-10-16 20:58:04',4,'Reserva','OV 2',4),(106,46,'2026-10-16 20:58:04',1,'Reserva','OV 2',4),(107,67,'2026-10-16 20:58:04',8,'Reserva','OV 2',4),(108,52,'2026-10-16 20:58:04',4,'Reserva','OV 2',4),(109,53,'2026-10-16 20:58:04',4,'Reserva','OV 2',4),(110,31,'2026-10-16 20:58:04',2,'Reserva','OV 2',4),(111,30,'2026-10-16 20:58:04',4,'Reserva','OV 2',4),(112,70,'2026-10-16 20:58:04',6,'Reserva','OV 2',4),(113,82,'2026-10-16 20:58:04',760,'Reserva','OV 2',4),(114,29,'2026-10-16 20:58:04',8,'Reserva','OV 2',4),(115,23,'2026-10-16 20:58:04',1,'Reserva','OV 2',4),(116,79,'2026-10-16 21:00:10',1,'Liberacion','OV 2',4),(117,6,'2026-10-16 21:00:10',1,'Liberacion','OV 2',4),(118,42,'2026-10-16 21:00:10',1,'Liberacion','OV 2',4),(119,44,'2026-10-16 21:00:10',1,'Liberacion','OV 2',4),(120,28,'2026-10-16 21:00:10',1,'Liberacion','OV 2',4),(121,35,'2026-10-16 21:00:10',1,'Liberacion','OV 2',4),(122,76,'2026-10-16 21:00:10',2,'Liberacion','OV 2',4),(123,72,'2026-10-16 21:00:10',2,'Liberacion','OV 2',4),(124,57,'2026-10-16 21:00:10',4,'Liberacion','OV 2',4),(125,46,'2026-10-16 21:00:10',1,'Liberacion','OV 2',4),(126,67,'2026-10-16 21:00:10',8,'Liberacion','OV 2',4),(127,52,'2026-10-16 21:00:10',4,'Liberacion','OV 2',4),(128,53,'2026-10-16 21:00:10',4,'Liberacion','OV 2',4),(129,31,'2026-10-16 21:00:10',2,'Liberacion','OV 2',4),(130,30,'2026-10-16 21:00:10',4,'Liberacion','OV 2',4),(131,70,'2026-10-16 21:00:10',6,'Liberacion','OV 2',4),(132,82,'2026-10-16 21:00:10',760,'Liberacion','OV 2',4),(133,29,'2026-10-16 21:00:10',8,'Liberacion','OV 2',4),(134,23,'2026-10-16 21:00:10',1,'Liberacion','OV 2',4),(173,69,'2026-10-16 21:10:28',1,'Reserva','OV 8',4),(174,1,'2026-10-16 21:10:28',1,'Reserva','OV 8',4),(175,40,'2026-10-16 21:10:28',1,'Reserva','OV 8',4),(176,41,'2026-10-16 21:10:28',1,'Reserva','OV 8',4),(177,22,'2026-10-16 21:10:28',1,'Reserva','OV 8',4),(178,32,'2026-10-16 21:10:28',1,'Reserva','OV 8',4),(179,75,'2026-10-16 21:10:28',2,'Reserva','OV 8',4),(180,71,'2026-10-16 21:10:28',2,'Reserva','OV 8',4),(181,57,'2026-10-16 21:10:28',4,'Reserva','OV 8',4),(182,20,'2026-10-16 21:10:28',6,'Reserva','OV 8',4),(183,46,'2026-10-16 21:10:28',1,'Reserva','OV 8',4),(184,67,'2026-10-16 21:10:28',8,'Reserva','OV 8',4),(185,52,'2026-10-16 21:10:28',4,'Reserva','OV 8',4),(186,53,'2026-10-16 21:10:28',4,'Reserva','OV 8',4),(187,31,'2026-10-16 21:10:28',2,'Reserva','OV 8',4),(188,10,'2026-10-16 21:10:28',2,'Reserva','OV 8',4),(189,30,'2026-10-16 21:10:28',4,'Reserva','OV 8',4),(190,15,'2026-10-16 21:10:28',5,'Reserva','OV 8',4),(191,82,'2026-10-16 21:10:28',760,'Reserva','OV 8',4),(192,29,'2026-10-16 21:10:28',8,'Reserva','OV 8',4),(193,24,'2026-10-16 21:10:28',1,'Reserva','OV 8',4),(231,69,'2026-10-16 21:11:08',1,'Liberacion','OV 8',4),(232,1,'2026-10-16 21:11:08',1,'Liberacion','OV 8',4),(233,40,'2026-10-16 21:11:08',1,'Liberacion','OV 8',4),(234,41,'2026-10-16 21:11:08',1,'Liberacion','OV 8',4),(235,22,'2026-10-16 21:11:08',1,'Liberacion','OV 8',4),(236,32,'2026-10-16 21:11:08',1,'Liberacion','OV 8',4),(237,75,'2026-10-16 21:11:08',2,'Liberacion','OV 8',4),(238,71,'2026-10-16 21:11:08',2,'Liberacion','OV 8',4),(239,57,'2026-10-16 21:11:08',4,'Liberacion','OV 8',4),(240,20,'2026-10-16 21:11:08',6,'Liberacion','OV 8',4),(241,46,'2026-10-16 21:11:08',1,'Liberacion','OV 8',4),(242,67,'2026-10-16 21:11:08',8,'Liberacion','OV 8',4),(243,52,'2026-10-16 21:11:08',4,'Liberacion','OV 8',4),(244,53,'2026-10-16 21:11:08',4,'Liberacion','OV 8',4),(245,31,'2026-10-16 21:11:08',2,'Liberacion','OV 8',4),(246,10,'2026-10-16 21:11:08',2,'Liberacion','OV 8',4),(247,30,'2026-10-16 21:11:08',4,'Liberacion','OV 8',4),(248,15,'2026-10-16 21:11:08',5,'Liberacion','OV 8',4),(249,82,'2026-10-16 21:11:08',760,'Liberacion','OV 8',4),(250,29,'2026-10-16 21:11:08',8,'Liberacion','OV 8',4),(251,24,'2026-10-16 21:11:08',1,'Liberacion','OV 8',4),(252,79,'2026-10-16 21:11:10',1,'Reserva','OV 8',4),(253,6,'2026-10-16 21:11:10',1,'Reserva','OV 8',4),(254,42,'2026-10-16 21:11:10',1,'Reserva','OV 8',4),(255,44,'2026-10-16 21:11:10',1,'Reserva','OV 8',4),(256,28,'2026-10-16 21:11:10',1,'Reserva','OV 8',4),(257,35,'2026-10-16 21:11:10',1,'Reserva','OV 8',4),(258,76,'2026-10-16 21:11:10',2,'Reserva','OV 8',4),(259,72,'2026-10-16 21:11:10',2,'Reserva','OV 8',4),(260,57,'2026-10-16 21:11:10',4,'Reserva','OV 8',4),(261,46,'2026-10-16 21:11:10',1,'Reserva','OV 8',4),(262,67,'2026-10-16 21:11:10',8,'Reserva','OV 8',4),(263,52,'2026-10-16 21:11:10',4,'Reserva','OV 8',4),(264,53,'2026-10-16 21:11:10',4,'Reserva','OV 8',4),(265,31,'2026-10-16 21:11:10',2,'Reserva','OV 8',4),(266,30,'2026-10-16 21:11:10',4,'Reserva','OV 8',4),(267,15,'2026-10-16 21:11:10',6,'Reserva','OV 8',4),(268,82,'2026-10-16 21:11:10',820,'Reserva','OV 8',4),(269,29,'2026-10-16 21:11:10',8,'Reserva','OV 8',4),(270,85,'2026-10-16 21:11:10',1,'Reserva','OV 8',4),(271,79,'2026-10-16 21:11:39',1,'Liberacion','OV 8',4),(272,6,'2026-10-16 21:11:39',1,'Liberacion','OV 8',4),(273,42,'2026-10-16 21:11:39',1,'Liberacion','OV 8',4),(274,44,'2026-10-16 21:11:39',1,'Liberacion','OV 8',4),(275,28,'2026-10-16 21:11:39',1,'Liberacion','OV 8',4),(276,35,'2026-10-16 21:11:39',1,'Liberacion','OV 8',4),(277,76,'2026-10-16 21:11:39',2,'Liberacion','OV 8',4),(278,72,'2026-10-16 21:11:39',2,'Liberacion','OV 8',4),(279,57,'2026-10-16 21:11:39',4,'Liberacion','OV 8',4),(280,46,'2026-10-16 21:11:39',1,'Liberacion','OV 8',4),(281,67,'2026-10-16 21:11:39',8,'Liberacion','OV 8',4),(282,52,'2026-10-16 21:11:39',4,'Liberacion','OV 8',4),(283,53,'2026-10-16 21:11:39',4,'Liberacion','OV 8',4),(284,31,'2026-10-16 21:11:39',2,'Liberacion','OV 8',4),(285,30,'2026-10-16 21:11:39',4,'Liberacion','OV 8',4),(286,15,'2026-10-16 21:11:39',6,'Liberacion','OV 8',4),(287,82,'2026-10-16 21:11:39',820,'Liberacion','OV 8',4),(288,29,'2026-10-16 21:11:39',8,'Liberacion','OV 8',4),(289,85,'2026-10-16 21:11:39',1,'Liberacion','OV 8',4),(362,79,'2026-10-17 08:44:33',1,'Reserva','OV 16',4),(363,6,'2026-10-17 08:44:33',1,'Reserva','OV 16',4),(364,42,'2026-10-17 08:44:33',1,'Reserva','OV 16',4),(365,44,'2026-10-17 08:44:33',1,'Reserva','OV 16',4),(366,28,'2026-10-17 08:44:33',1,'Reserva','OV 16',4),(367,35,'2026-10-17 08:44:33',1,'Reserva','OV 16',4),(368,76,'2026-10-17 08:44:33',2,'Reserva','OV 16',4),(369,72,'2026-10-17 08:44:33',2,'Reserva','OV 16',4),(370,57,'2026-10-17 08:44:33',4,'Reserva','OV 16',4),(371,46,'2026-10-17 08:44:33',1,'Reserva','OV 16',4),(372,67,'2026-10-17 08:44:33',8,'Reserva','OV 16',4),(373,52,'2026-10-17 08:44:33',4,'Reserva','OV 16',4),(374,53,'2026-10-17 08:44:33',4,'Reserva','OV 16',4),(375,31,'2026-10-17 08:44:33',2,'Reserva','OV 16',4),(376,30,'2026-10-17 08:44:33',4,'Reserva','OV 16',4),(377,70,'2026-10-17 08:44:33',6,'Reserva','OV 16',4),(378,82,'2026-10-17 08:44:33',760,'Reserva','OV 16',4),(379,29,'2026-10-17 08:44:33',8,'Reserva','OV 16',4),(380,23,'2026-10-17 08:44:33',1,'Reserva','OV 16',4),(381,79,'2026-10-17 08:44:40',1,'Liberacion','OV 16',4),(382,6,'2026-10-17 08:44:40',1,'Liberacion','OV 16',4),(383,42,'2026-10-17 08:44:40',1,'Liberacion','OV 16',4),(384,44,'2026-10-17 08:44:40',1,'Liberacion','OV 16',4),(385,28,'2026-10-17 08:44:40',1,'Liberacion','OV 16',4),(386,35,'2026-10-17 08:44:40',1,'Liberacion','OV 16',4),(387,76,'2026-10-17 08:44:40',2,'Liberacion','OV 16',4),(388,72,'2026-10-17 08:44:40',2,'Liberacion','OV 16',4),(389,57,'2026-10-17 08:44:40',4,'Liberacion','OV 16',4),(390,46,'2026-10-17 08:44:40',1,'Liberacion','OV 16',4),(391,67,'2026-10-17 08:44:40',8,'Liberacion','OV 16',4),(392,52,'2026-10-17 08:44:40',4,'Liberacion','OV 16',4),(393,53,'2026-10-17 08:44:40',4,'Liberacion','OV 16',4),(394,31,'2026-10-17 08:44:40',2,'Liberacion','OV 16',4),(395,30,'2026-10-17 08:44:40',4,'Liberacion','OV 16',4),(396,70,'2026-10-17 08:44:40',6,'Liberacion','OV 16',4),(397,82,'2026-10-17 08:44:40',760,'Liberacion','OV 16',4),(398,29,'2026-10-17 08:44:40',8,'Liberacion','OV 16',4),(399,23,'2026-10-17 08:44:40',1,'Liberacion','OV 16',4),(400,79,'2026-10-17 09:04:32',1,'Reserva','OV 17',4),(401,6,'2026-10-17 09:04:32',1,'Reserva','OV 17',4),(402,42,'2026-10-17 09:04:32',1,'Reserva','OV 17',4),(403,44,'2026-10-17 09:04:32',1,'Reserva','OV 17',4),(404,28,'2026-10-17 09:04:32',1,'Reserva','OV 17',4),(405,35,'2026-10-17 09:04:32',1,'Reserva','OV 17',4),(406,76,'2026-10-17 09:04:32',2,'Reserva','OV 17',4),(407,72,'2026-10-17 09:04:32',2,'Reserva','OV 17',4),(408,57,'2026-10-17 09:04:32',4,'Reserva','OV 17',4),(409,46,'2026-10-17 09:04:32',1,'Reserva','OV 17',4),(410,67,'2026-10-17 09:04:32',8,'Reserva','OV 17',4),(411,52,'2026-10-17 09:04:32',4,'Reserva','OV 17',4),(412,53,'2026-10-17 09:04:32',4,'Reserva','OV 17',4),(413,31,'2026-10-17 09:04:32',2,'Reserva','OV 17',4),(414,30,'2026-10-17 09:04:32',4,'Reserva','OV 17',4),(415,70,'2026-10-17 09:04:32',6,'Reserva','OV 17',4),(416,82,'2026-10-17 09:04:32',760,'Reserva','OV 17',4),(417,29,'2026-10-17 09:04:32',8,'Reserva','OV 17',4),(418,23,'2026-10-17 09:04:32',1,'Reserva','OV 17',4),(419,1,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(420,2,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(421,3,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(422,4,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(423,5,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(424,6,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(425,7,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(426,8,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(427,9,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(428,10,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(429,11,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(430,12,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(431,13,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(432,14,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(433,15,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(434,16,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(435,17,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(436,18,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(437,19,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(438,20,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(439,21,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(440,22,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(441,23,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(442,24,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(443,25,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(444,26,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(445,27,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(446,28,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(447,29,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(448,30,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(449,31,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(450,32,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(451,33,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(452,34,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(453,35,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(454,36,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(455,37,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(456,38,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(457,39,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(458,40,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(459,41,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(460,42,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(461,43,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(462,44,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(463,45,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(464,46,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(465,47,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(466,48,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(467,49,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(468,50,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(469,51,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(470,52,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(471,53,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(472,54,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(473,55,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(474,56,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(475,57,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(476,58,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(477,59,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(478,60,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(479,61,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(480,62,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(481,63,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(482,64,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(483,65,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(484,66,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(485,67,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(486,68,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(487,69,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(488,70,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(489,71,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(490,72,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(491,73,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(492,74,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(493,75,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(494,76,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(495,77,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(496,78,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(497,79,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(498,80,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(499,81,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(500,82,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(501,83,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(502,84,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(503,85,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(504,86,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(505,87,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(506,88,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(507,89,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(508,90,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(509,91,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(510,92,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(511,93,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(512,94,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(513,95,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(514,96,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(515,97,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(516,98,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(517,99,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(518,100,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(519,101,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(520,102,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(521,103,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(522,104,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(523,105,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(524,106,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(525,107,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(526,108,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(527,109,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(528,110,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(529,111,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(530,112,'2026-10-17 09:10:23',100000,'Ingreso','Carga de stock',4),(531,79,'2026-10-17 09:27:11',1,'Liberacion','OV 17',4),(532,6,'2026-10-17 09:27:11',1,'Liberacion','OV 17',4),(533,42,'2026-10-17 09:27:11',1,'Liberacion','OV 17',4),(534,44,'2026-10-17 09:27:11',1,'Liberacion','OV 17',4),(535,28,'2026-10-17 09:27:11',1,'Liberacion','OV 17',4),(536,35,'2026-10-17 09:27:11',1,'Liberacion','OV 17',4),(537,76,'2026-10-17 09:27:11',2,'Liberacion','OV 17',4),(538,72,'2026-10-17 09:27:11',2,'Liberacion','OV 17',4),(539,57,'2026-10-17 09:27:11',4,'Liberacion','OV 17',4),(540,46,'2026-10-17 09:27:11',1,'Liberacion','OV 17',4),(541,67,'2026-10-17 09:27:11',8,'Liberacion','OV 17',4),(542,52,'2026-10-17 09:27:11',4,'Liberacion','OV 17',4),(543,53,'2026-10-17 09:27:11',4,'Liberacion','OV 17',4),(544,31,'2026-10-17 09:27:11',2,'Liberacion','OV 17',4),(545,30,'2026-10-17 09:27:11',4,'Liberacion','OV 17',4),(546,70,'2026-10-17 09:27:11',6,'Liberacion','OV 17',4),(547,82,'2026-10-17 09:27:11',760,'Liberacion','OV 17',4),(548,29,'2026-10-17 09:27:11',8,'Liberacion','OV 17',4),(549,23,'2026-10-17 09:27:11',1,'Liberacion','OV 17',4),(550,79,'2026-10-17 09:27:22',120,'Reserva','OV 18',4),(551,6,'2026-10-17 09:27:22',120,'Reserva','OV 18',4),(552,42,'2026-10-17 09:27:22',120,'Reserva','OV 18',4),(553,44,'2026-10-17 09:27:22',120,'Reserva','OV 18',4),(554,28,'2026-10-17 09:27:22',120,'Reserva','OV 18',4),(555,35,'2026-10-17 09:27:22',120,'Reserva','OV 18',4),(556,76,'2026-10-17 09:27:22',240,'Reserva','OV 18',4),(557,72,'2026-10-17 09:27:22',240,'Reserva','OV 18',4),(558,57,'2026-10-17 09:27:22',480,'Reserva','OV 18',4),(559,46,'2026-10-17 09:27:22',120,'Reserva','OV 18',4),(560,67,'2026-10-17 09:27:22',960,'Reserva','OV 18',4),(561,52,'2026-10-17 09:27:22',480,'Reserva','OV 18',4),(562,53,'2026-10-17 09:27:22',480,'Reserva','OV 18',4),(563,31,'2026-10-17 09:27:22',240,'Reserva','OV 18',4),(564,30,'2026-10-17 09:27:22',480,'Reserva','OV 18',4),(565,70,'2026-10-17 09:27:22',696,'Reserva','OV 18',4),(566,82,'2026-10-17 09:27:22',91200,'Reserva','OV 18',4),(567,29,'2026-10-17 09:27:22',960,'Reserva','OV 18',4),(568,23,'2026-10-17 09:27:22',120,'Reserva','OV 18',4),(569,79,'2026-10-17 09:27:25',120,'Liberacion','OV 18',4),(570,6,'2026-10-17 09:27:25',120,'Liberacion','OV 18',4),(571,42,'2026-10-17 09:27:25',120,'Liberacion','OV 18',4),(572,44,'2026-10-17 09:27:25',120,'Liberacion','OV 18',4),(573,28,'2026-10-17 09:27:25',120,'Liberacion','OV 18',4),(574,35,'2026-10-17 09:27:25',120,'Liberacion','OV 18',4),(575,76,'2026-10-17 09:27:25',240,'Liberacion','OV 18',4),(576,72,'2026-10-17 09:27:25',240,'Liberacion','OV 18',4),(577,57,'2026-10-17 09:27:25',480,'Liberacion','OV 18',4),(578,46,'2026-10-17 09:27:25',120,'Liberacion','OV 18',4),(579,67,'2026-10-17 09:27:25',960,'Liberacion','OV 18',4),(580,52,'2026-10-17 09:27:25',480,'Liberacion','OV 18',4),(581,53,'2026-10-17 09:27:25',480,'Liberacion','OV 18',4),(582,31,'2026-10-17 09:27:25',240,'Liberacion','OV 18',4),(583,30,'2026-10-17 09:27:25',480,'Liberacion','OV 18',4),(584,70,'2026-10-17 09:27:25',696,'Liberacion','OV 18',4),(585,82,'2026-10-17 09:27:25',91200,'Liberacion','OV 18',4),(586,29,'2026-10-17 09:27:25',960,'Liberacion','OV 18',4),(587,23,'2026-10-17 09:27:25',120,'Liberacion','OV 18',4);
/*!40000 ALTER TABLE `stock_movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `idtipo` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único y automático del tipo de producto',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripción del tipo (ej: COMBO, CABEZAL, CAJA, COMPONENTE, INSUMO, SERVICIOS)',
  PRIMARY KEY (`idtipo`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tipos/categorías de producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (2,'CABEZAL'),(3,'CAJA'),(1,'COMBO'),(4,'COMPONENTE'),(5,'INSUMO'),(6,'SERVICIOS');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `idunidad` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único y automático de la unidad',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre de la unidad (ejemplo: Kg, metro) único',
  PRIMARY KEY (`idunidad`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Unidades de medida de los artículos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (2,'CADA UNO'),(4,'CENTIMETROS CUBICOS'),(5,'KILOGRAMO'),(7,'KILOWATS HORA'),(8,'LITROS'),(1,'METROS CUADRADOS'),(3,'METROS LINEALES'),(6,'MILIMETROS');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusr` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del usuario',
  `usuario` varchar(50) NOT NULL COMMENT 'Nombre de usuario para login (único)',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre de usuario',
  `apellido` varchar(100) NOT NULL COMMENT 'Apellido de usuario',
  `sector` varchar(100) DEFAULT NULL COMMENT 'Sector donde trabaja',
  `interno` varchar(20) DEFAULT NULL COMMENT 'Número interno o extensión',
  `idestado` int DEFAULT NULL COMMENT 'Estado del usuario',
  `fechaalta` date DEFAULT NULL COMMENT 'Fecha de alta del usuario',
  `fechabaja` date DEFAULT NULL COMMENT 'Fecha de baja del usuario',
  `idpuesto` int DEFAULT NULL COMMENT 'Puesto de trabajo del usuario',
  PRIMARY KEY (`idusr`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `idpuesto` (`idpuesto`),
  KEY `idestado` (`idestado`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idpuesto`) REFERENCES `puestos` (`idpuesto`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Usuarios del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'RLOPEZ','Roberto','Lopez','ADM','2001',3,NULL,NULL,NULL),(2,'LPEREZ','Liliana','Perez','ADM','2008',3,NULL,NULL,NULL),(3,'RMOLES','Raul','Moles','PRD','2004',3,NULL,NULL,NULL),(4,'CRAMIREZ','Carlos','Ramirez','VTA','2007',3,NULL,NULL,NULL),(5,'JGOMEZ','Julio','Gomez','VTA','2009',3,NULL,NULL,NULL),(6,'MMARTINEZ','Marino','Martinez','PRD','2012',3,NULL,NULL,NULL),(7,'PPEREZ','Pedro','Perez','PRD','2013',3,NULL,NULL,NULL),(8,'VGONZALEZ','Valeria','Gonzalez','COM','2020',3,NULL,NULL,NULL),(9,'MGARCIA','Maria','Garcia','COM','2021',3,NULL,NULL,NULL),(10,'MLOPEZ','Marcelo','Lopez','EXP','2022',3,NULL,NULL,NULL),(11,'JGUTIERREZ','Juan','Gutierrez','PRD','2020',3,NULL,NULL,NULL),(12,'CPEREYRA','Carlos','Pereyra','PRD','2019',3,NULL,NULL,NULL),(13,'AGARCIA','Andres','Garcia','PRD','2017',3,NULL,NULL,NULL),(14,'RLACARRA','Ruperto','Lacarra','PRD','2019',3,NULL,NULL,NULL),(15,'CCARRANZA','Carlos','Carranza','PRD','2001',3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'box_sa'
--

--
-- Dumping routines for database 'box_sa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-23 12:27:18
