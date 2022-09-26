-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: project_travelagency
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `Num_street` varchar(20) NOT NULL,
  `additional_address` varchar(50) NOT NULL,
  `postal_code` int NOT NULL,
  `idCity` int NOT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `Address_City_FK` (`idCity`),
  CONSTRAINT `Address_City_FK` FOREIGN KEY (`idCity`) REFERENCES `city` (`idCity`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'5','rue de paris',75500,1),(2,'2','rue d\'Italie',75500,1),(3,'1','rue de gaulle',13400,2),(4,'2','rue dubak',75000,1),(5,'5','rue ivoire',75000,1),(6,'1','du val fleuri',13040,2),(7,'2','way of hemington',69000,3),(8,'5','rue duvie',13500,2),(9,'5','rue duvie',13500,2),(10,'45','batiment d',75016,1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `idCity` int NOT NULL AUTO_INCREMENT,
  `City` varchar(20) NOT NULL,
  PRIMARY KEY (`idCity`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Paris'),(2,'Marseille'),(3,'Lyon'),(4,'Toulouse');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Last_name_C` varchar(50) NOT NULL,
  `First_name_C` varchar(50) NOT NULL,
  `Phone_C` int NOT NULL,
  `Mail_C` varchar(20) NOT NULL,
  `Birthdate_C` date NOT NULL,
  `Gender_C` enum('M','F') NOT NULL,
  `idAddress` int NOT NULL,
  `idEmployees` int NOT NULL,
  `idAddress_Billing` int NOT NULL,
  PRIMARY KEY (`idClient`),
  KEY `Client_Address_FK` (`idAddress`),
  KEY `Client_Employees0_FK` (`idEmployees`),
  KEY `Client_Address1_FK` (`idAddress_Billing`),
  CONSTRAINT `Client_Address1_FK` FOREIGN KEY (`idAddress_Billing`) REFERENCES `address` (`idAddress`),
  CONSTRAINT `Client_Address_FK` FOREIGN KEY (`idAddress`) REFERENCES `address` (`idAddress`),
  CONSTRAINT `Client_Employees0_FK` FOREIGN KEY (`idEmployees`) REFERENCES `employees` (`idEmployees`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Dupuis','Jean',699199947,'d.jean@gmail.com','1994-02-14','M',1,5,1),(2,'jouanneau','Louis',677877742,'j.louis@gmail.com','1975-04-23','M',2,5,2),(3,'Duarte','hugo',612334566,'d.hugo@gmail.com','1985-02-01','M',3,5,3),(4,'Dupont','Hector',612323453,'d.hector@gmail.com','1995-03-17','M',4,5,4),(5,'Marie','Alex',612313213,'m.alex@gmail.com','1963-02-09','M',4,7,4),(6,'Jeunot','Lucie',712321431,'j.lucie@gmail.com','2009-07-03','F',1,7,1),(7,'Eziko','Lea',712321324,'e.lea@gmail.com','1992-09-03','F',2,10,2),(8,'Genevieve','Laura',813123213,'g.laura@gmail.com','1972-12-25','F',3,10,3),(9,'Sfaxi','Adam',123123123,'s.adam@gmail.com','1992-05-04','M',5,10,5),(10,'Zimo','Nazim',132213213,'z.nazim@gamil.com','1993-06-25','M',5,10,5);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commands` (
  `idClient` int NOT NULL,
  `idTrip` int NOT NULL,
  `idOrder` int NOT NULL,
  PRIMARY KEY (`idClient`,`idTrip`),
  KEY `Commands_Trip0_FK` (`idTrip`),
  CONSTRAINT `Commands_Client_FK` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`),
  CONSTRAINT `Commands_Trip0_FK` FOREIGN KEY (`idTrip`) REFERENCES `trip` (`idTrip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,6,6);
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departure_so`
--

DROP TABLE IF EXISTS `departure_so`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departure_so` (
  `idStopOver` int NOT NULL,
  `idCity` int NOT NULL,
  `idTransport` int NOT NULL,
  `DEPARTURE_SO` date NOT NULL,
  PRIMARY KEY (`idStopOver`,`idCity`,`idTransport`),
  KEY `DEPARTURE_SO_City0_FK` (`idCity`),
  KEY `DEPARTURE_SO_Transport1_FK` (`idTransport`),
  CONSTRAINT `DEPARTURE_SO_City0_FK` FOREIGN KEY (`idCity`) REFERENCES `city` (`idCity`),
  CONSTRAINT `DEPARTURE_SO_StopOver_FK` FOREIGN KEY (`idStopOver`) REFERENCES `stopover` (`idStopOver`),
  CONSTRAINT `DEPARTURE_SO_Transport1_FK` FOREIGN KEY (`idTransport`) REFERENCES `transport` (`idTransport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departure_so`
--

LOCK TABLES `departure_so` WRITE;
/*!40000 ALTER TABLE `departure_so` DISABLE KEYS */;
INSERT INTO `departure_so` VALUES (1,1,1,'2020-03-01'),(2,2,2,'2020-04-15'),(3,3,2,'2020-09-17'),(4,3,2,'2021-02-20'),(5,4,1,'2021-03-20'),(6,1,3,'2021-03-25'),(7,3,1,'2021-04-06'),(8,3,2,'2021-04-07'),(9,2,2,'2021-05-13'),(10,2,2,'2021-05-14'),(11,4,2,'2021-05-15');
/*!40000 ALTER TABLE `departure_so` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distance`
--

DROP TABLE IF EXISTS `distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distance` (
  `idCity` int NOT NULL,
  `idCity_Distance` int NOT NULL,
  `Distance_Cities` int NOT NULL,
  PRIMARY KEY (`idCity`,`idCity_Distance`),
  KEY `Distance_City0_FK` (`idCity_Distance`),
  CONSTRAINT `Distance_City0_FK` FOREIGN KEY (`idCity_Distance`) REFERENCES `city` (`idCity`),
  CONSTRAINT `Distance_City_FK` FOREIGN KEY (`idCity`) REFERENCES `city` (`idCity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distance`
--

LOCK TABLES `distance` WRITE;
/*!40000 ALTER TABLE `distance` DISABLE KEYS */;
INSERT INTO `distance` VALUES (1,2,700),(1,3,500),(1,4,400),(2,3,300),(2,4,150),(3,4,244);
/*!40000 ALTER TABLE `distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `idEmployees` int NOT NULL AUTO_INCREMENT,
  `Last_name_E` varchar(50) NOT NULL,
  `First_name_E` varchar(50) NOT NULL,
  `Phone_E` int NOT NULL,
  `Promail_E` varchar(50) NOT NULL,
  `Title_E` varchar(20) NOT NULL,
  `Hiredate_E` datetime NOT NULL,
  `idAddress` int NOT NULL,
  PRIMARY KEY (`idEmployees`),
  KEY `Employees_Address_FK` (`idAddress`),
  CONSTRAINT `Employees_Address_FK` FOREIGN KEY (`idAddress`) REFERENCES `address` (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Jones','Lewis',553624159,'j.lewis@agv.com','CEO','2018-11-23 00:00:00',6),(2,'Adams','Charles',596874003,'a.charles@agv.com','Secretary','2017-01-15 00:00:00',7),(3,'Pete','sebastian',629736500,'p.sebastian@agv.com','Secretary','2015-11-30 00:00:00',7),(4,'Barteloni','Giovanni',661372545,'b.giovanni@agv.com','IT expert','2021-05-23 00:00:00',8),(5,'Williams','Louis',775980130,'w.louis@agv.com','Salesman','2020-12-16 00:00:00',8),(6,'Haas','Pierre',615952435,'h.pierre@agv.com','Salesman','2016-06-12 00:00:00',9),(7,'Hamilton','Andre',559531424,'h.andre@agv.com','Salesman','2018-08-18 00:00:00',10),(8,'Leclerc','Pierre',596993614,'l.pierre@agv.com','Salesman','2014-11-13 00:00:00',9),(9,'Vettel','Jean',525364896,'v.jean@agv.com','Secretary','2015-02-23 00:00:00',10),(10,'Schumi','Michael',753142502,'s.michael@agv.com','Salesman','2016-07-19 00:00:00',10);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `idTransport` int NOT NULL,
  `idCity` int NOT NULL,
  PRIMARY KEY (`idTransport`,`idCity`),
  KEY `Has_City0_FK` (`idCity`),
  CONSTRAINT `Has_City0_FK` FOREIGN KEY (`idCity`) REFERENCES `city` (`idCity`),
  CONSTRAINT `Has_Transport_FK` FOREIGN KEY (`idTransport`) REFERENCES `transport` (`idTransport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(3,2),(4,2),(1,3),(2,3),(3,3),(4,3),(1,4),(2,4),(3,4),(4,4);
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installments`
--

DROP TABLE IF EXISTS `installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `installments` (
  `idInstallments` int NOT NULL AUTO_INCREMENT,
  `Payment_method` enum('Paypal','Cheque','Espece','CB') NOT NULL,
  `Payment_date` datetime NOT NULL,
  `Payment_amount` int NOT NULL,
  `idTrip` int NOT NULL,
  PRIMARY KEY (`idInstallments`),
  KEY `Installments_Trip_FK` (`idTrip`),
  CONSTRAINT `Installments_Trip_FK` FOREIGN KEY (`idTrip`) REFERENCES `trip` (`idTrip`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installments`
--

LOCK TABLES `installments` WRITE;
/*!40000 ALTER TABLE `installments` DISABLE KEYS */;
INSERT INTO `installments` VALUES (1,'Paypal','2020-03-19 00:00:00',262,1),(2,'Cheque','2020-04-19 00:00:00',262,1),(3,'Espece','2020-04-15 00:00:00',75,2),(4,'CB','2020-05-15 00:00:00',75,2),(5,'CB','2020-09-18 00:00:00',150,3),(6,'Cheque','2021-02-20 00:00:00',150,4),(7,'Paypal','2021-03-20 00:00:00',262,5),(8,'CB','2021-03-26 00:00:00',225,6),(9,'Cheque','2021-04-06 00:00:00',295,7),(10,'Paypal','2021-04-07 00:00:00',150,8),(11,'Cheque','2021-05-13 00:00:00',50,9),(12,'Paypal','2021-06-13 00:00:00',50,9),(13,'CB','2021-07-13 00:00:00',50,9),(14,'CB','2021-05-14 00:00:00',75,10),(15,'CB','2021-06-14 00:00:00',75,10);
/*!40000 ALTER TABLE `installments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_so`
--

DROP TABLE IF EXISTS `return_so`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_so` (
  `idStopOver` int NOT NULL,
  `idCity` int NOT NULL,
  `idTransport` int NOT NULL,
  `RETURN_SO` date NOT NULL,
  PRIMARY KEY (`idStopOver`,`idCity`,`idTransport`),
  KEY `RETURN_SO_City0_FK` (`idCity`),
  KEY `RETURN_SO_Transport1_FK` (`idTransport`),
  CONSTRAINT `RETURN_SO_City0_FK` FOREIGN KEY (`idCity`) REFERENCES `city` (`idCity`),
  CONSTRAINT `RETURN_SO_StopOver_FK` FOREIGN KEY (`idStopOver`) REFERENCES `stopover` (`idStopOver`),
  CONSTRAINT `RETURN_SO_Transport1_FK` FOREIGN KEY (`idTransport`) REFERENCES `transport` (`idTransport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_so`
--

LOCK TABLES `return_so` WRITE;
/*!40000 ALTER TABLE `return_so` DISABLE KEYS */;
INSERT INTO `return_so` VALUES (1,2,1,'2020-03-25'),(2,2,2,'2020-04-30'),(3,3,2,'2020-09-30'),(4,3,2,'2021-02-15'),(5,4,3,'2021-03-31'),(6,4,1,'2021-03-31'),(7,2,1,'2021-04-20'),(8,3,2,'2021-04-30'),(9,2,2,'2021-05-17'),(10,2,2,'2021-05-24');
/*!40000 ALTER TABLE `return_so` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stopover`
--

DROP TABLE IF EXISTS `stopover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stopover` (
  `idStopOver` int NOT NULL AUTO_INCREMENT,
  `idTrip` int NOT NULL,
  PRIMARY KEY (`idStopOver`),
  KEY `StopOver_Trip_FK` (`idTrip`),
  CONSTRAINT `StopOver_Trip_FK` FOREIGN KEY (`idTrip`) REFERENCES `trip` (`idTrip`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stopover`
--

LOCK TABLES `stopover` WRITE;
/*!40000 ALTER TABLE `stopover` DISABLE KEYS */;
INSERT INTO `stopover` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(11,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `stopover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport` (
  `idTransport` int NOT NULL AUTO_INCREMENT,
  `Transport_Available` enum('Bus','Train','Plane','Boat') NOT NULL,
  PRIMARY KEY (`idTransport`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'Plane'),(2,'Bus'),(3,'Train'),(4,'Boat');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `idTrip` int NOT NULL AUTO_INCREMENT,
  `Stopover_nbr` int NOT NULL,
  `Offer` enum('Billing','Flatrate') NOT NULL,
  `Order_date` date NOT NULL,
  `DEPARTURE` date NOT NULL,
  `RETURN_` date NOT NULL,
  `idCity` int NOT NULL,
  PRIMARY KEY (`idTrip`),
  KEY `Trip_City_FK` (`idCity`),
  CONSTRAINT `Trip_City_FK` FOREIGN KEY (`idCity`) REFERENCES `city` (`idCity`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,1,'Billing','2020-03-15','2020-03-18','2020-03-25',2),(2,1,'Flatrate','2020-04-13','2020-04-15','2020-04-30',2),(3,1,'Flatrate','2020-08-16','2020-09-17','2020-09-30',3),(4,1,'Flatrate','2021-02-17','2021-02-20','2021-02-15',3),(5,1,'Billing','2021-03-17','2021-03-20','2021-03-31',4),(6,1,'Billing','2021-03-20','2021-03-25','2021-03-31',4),(7,2,'Billing','2021-04-04','2020-04-06','2021-04-20',2),(8,1,'Flatrate','2021-04-04','2021-04-07','2021-04-30',3),(9,1,'Flatrate','2021-05-10','2021-05-13','2021-05-17',2),(10,1,'Flatrate','2021-05-10','2021-05-13','2021-05-24',2);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-26 18:21:48
