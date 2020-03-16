-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: task2
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `task2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `task2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `task2`;

--
-- Table structure for table `emp_work_status`
--

DROP TABLE IF EXISTS `emp_work_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_work_status` (
  `ews_id` int(50) NOT NULL AUTO_INCREMENT,
  `emp_id` int(50) NOT NULL,
  `position_id` int(50) NOT NULL,
  `project_id` int(50) NOT NULL,
  PRIMARY KEY (`ews_id`),
  KEY `emp_id` (`emp_id`),
  KEY `position_id` (`position_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `emp_work_status_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `emp_work_status_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `position` (`posit_id`),
  CONSTRAINT `emp_work_status_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `project` (`proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_work_status`
--

LOCK TABLES `emp_work_status` WRITE;
/*!40000 ALTER TABLE `emp_work_status` DISABLE KEYS */;
INSERT INTO `emp_work_status` VALUES (1,8,7,4),(2,36,4,2),(3,32,6,1),(4,14,2,5),(5,10,4,1),(6,7,1,2),(7,34,6,5),(8,33,8,5),(9,11,7,5),(10,9,1,6),(11,43,8,5),(12,20,2,4),(13,10,8,6),(14,43,1,5),(15,3,2,4),(16,34,8,6),(17,42,2,5),(18,28,2,6),(19,3,3,4),(20,38,7,7),(21,8,5,4),(22,17,6,2),(23,37,7,5),(24,8,2,6),(25,27,7,4),(26,16,1,5),(27,14,4,1),(28,37,6,7),(29,23,4,1),(30,5,1,2),(31,5,9,2),(32,45,8,5),(33,14,2,6),(34,5,7,2),(35,20,6,3),(36,9,8,2),(37,22,4,4),(38,23,3,3),(39,19,6,3),(40,41,5,2),(41,13,1,2),(42,13,5,7),(43,38,6,4),(44,26,9,3),(45,27,1,2),(46,18,1,3),(47,28,4,3),(48,12,7,2),(49,24,8,6),(50,32,1,2),(51,15,6,2),(52,40,8,4),(53,5,3,4),(54,28,1,3),(55,25,9,7),(56,31,6,7),(57,22,5,5),(58,33,5,1),(59,4,1,1),(60,35,6,2),(61,11,1,1),(62,17,1,5),(63,20,6,5),(64,35,7,1),(65,11,7,5),(66,29,3,1),(67,44,3,7),(68,30,9,1),(69,40,2,6),(70,30,1,4);
/*!40000 ALTER TABLE `emp_work_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Dimych'),(2,'SamyiKrutoiNaSele'),(3,'Katka'),(4,'Dimych'),(5,'SamyiKrutoiNaSele'),(6,'Kolyan'),(7,'Petro'),(8,'Dimych'),(9,'SamyiKrutoiNaSele'),(10,'Katka'),(11,'Petro'),(12,'Dimych'),(13,'Dimych'),(14,'Dimych'),(15,'Petro'),(16,'Kolyan'),(17,'Dimych'),(18,'Dimych'),(19,'Dimych'),(20,'SamyiKrutoiNaSele'),(21,'SamyiKrutoiNaSele'),(22,'Petro'),(23,'SamyiKrutoiNaSele'),(24,'Kolyan'),(25,'SamyiKrutoiNaSele'),(26,'Katka'),(27,'SamyiKrutoiNaSele'),(28,'Petro'),(29,'Dimych'),(30,'Kolyan'),(31,'Katka'),(32,'Petro'),(33,'Petro'),(34,'Kolyan'),(35,'Kolyan'),(36,'Kolyan'),(37,'Petro'),(38,'Katka'),(39,'Dimych'),(40,'Katka'),(41,'Petro'),(42,'SamyiKrutoiNaSele'),(43,'Dimych'),(44,'SamyiKrutoiNaSele'),(45,'Katka'),(46,'SamyiKrutoiNaSele'),(47,'Katka'),(48,'SamyiKrutoiNaSele'),(49,'SamyiKrutoiNaSele'),(50,'Kolyan');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `posit_id` int(50) NOT NULL AUTO_INCREMENT,
  `posit_name` varchar(50) NOT NULL,
  PRIMARY KEY (`posit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'dev'),(2,'lead'),(3,'superman'),(4,'BA'),(5,'bUhGAlTeR'),(6,'nanny'),(7,'kent'),(8,'superpuper'),(9,'employee'),(10,'HulkMaster');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `proj_id` int(50) NOT NULL AUTO_INCREMENT,
  `proj_name` varchar(50) NOT NULL,
  `open_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `close_date` datetime DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'CoolIgra','2020-03-12 12:56:23','2020-11-10 00:00:00','in progress'),(2,'BankStuff','2020-03-12 12:56:23','2020-11-10 00:00:00','in progress'),(3,'StavkiNaSport','2020-03-12 12:56:23','2020-11-10 00:00:00','in progress'),(4,'DreamLand','2020-03-12 12:56:23','2020-11-10 00:00:00','in progress'),(5,'Cheburek','2020-03-12 12:56:23','2020-11-10 00:00:00','in progress'),(6,'BigWall','2020-04-12 12:56:23','2020-11-10 00:00:00','in progress'),(7,'SmallKek','2020-03-12 12:56:23','2020-11-10 00:00:00','in progress'),(8,'DreamFood','2020-03-12 12:56:23','2020-11-10 00:00:00','in progress'),(9,'ThiIsVeryGood_PROJ','2020-03-12 19:15:12','2020-03-12 19:17:28','closed');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` int(50) NOT NULL AUTO_INCREMENT,
  `task_description` varchar(100) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `date_st_changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_st_ch_id` int(50) NOT NULL,
  `project_id` int(50) NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `emp_st_ch_id` (`emp_st_ch_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`emp_st_ch_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',26,3),(2,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',45,3),(3,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',5,7),(4,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',14,1),(5,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',27,2),(6,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',25,7),(7,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',36,3),(8,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',9,4),(9,'link to task description','2019-12-15 00:00:00','open','2020-03-16 13:20:20',39,2),(10,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',40,3),(11,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',13,4),(12,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',34,4),(13,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',40,6),(14,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',8,1),(15,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',25,4),(16,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',18,4),(17,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-16 13:20:20',27,3),(18,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',44,7),(19,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',23,2),(20,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',12,1),(21,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',15,2),(22,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',17,5),(23,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',21,6),(24,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',5,7),(25,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',16,7),(26,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',11,3),(27,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',38,7),(28,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',32,3),(29,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',21,2),(30,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',17,3),(31,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',42,5),(32,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',18,3),(33,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',10,4),(34,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',20,6),(35,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',5,5),(36,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',22,1),(37,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',13,4),(38,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',36,7),(39,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',32,6),(40,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',24,7),(41,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',43,6),(42,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',14,2),(43,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',16,2),(44,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',36,3),(45,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',21,3),(46,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',27,3),(47,'link to task description','2020-11-10 00:00:00','closed','2020-03-13 10:43:23',3,7),(48,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',16,4),(49,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',16,5),(50,'link to task description','2019-12-15 00:00:00','done','2020-03-16 13:20:20',3,4),(51,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',21,4),(52,'link to task description','2019-12-15 00:00:00','open','2020-03-16 13:20:20',3,3),(53,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',35,3),(54,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',42,4),(55,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',44,2),(56,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',7,1),(57,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',36,1),(58,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',29,3),(59,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',6,7),(60,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',41,6),(61,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',35,1),(62,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',40,6),(63,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',12,7),(64,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',6,6),(65,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',34,3),(66,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',3,1),(67,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',25,5),(68,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',20,7),(69,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',19,7),(70,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',11,7),(71,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',22,1),(72,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',3,5),(73,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',26,5),(74,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',41,3),(75,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',27,2),(76,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',42,5),(77,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',8,2),(78,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',11,1),(79,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',43,7),(80,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',33,5),(81,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',19,4),(82,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',16,2),(83,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',12,4),(84,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',8,7),(85,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',25,5),(86,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',20,2),(87,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',27,1),(88,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',32,4),(89,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',42,4),(90,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',44,7),(91,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',5,1),(92,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',7,3),(93,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',15,1),(94,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',16,6),(95,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:57:23',26,4),(96,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',28,6),(97,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',38,4),(98,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',14,7),(99,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',23,1),(100,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',45,1),(101,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',25,6),(102,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',35,7),(103,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',31,2),(104,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',22,2),(105,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',3,7),(106,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',23,5),(107,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',39,4),(108,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',31,6),(109,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',22,1),(110,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',10,6),(111,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',31,4),(112,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',43,7),(113,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',13,6),(114,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',11,2),(115,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',26,1),(116,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',23,2),(117,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',10,5),(118,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',29,2),(119,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',29,5),(120,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',17,3),(121,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',36,4),(122,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',24,1),(123,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',31,3),(124,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',17,7),(125,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',6,7),(126,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',4,7),(127,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',11,6),(128,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',38,5),(129,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',43,1),(130,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',28,3),(131,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',42,2),(132,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',19,6),(133,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',43,7),(134,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',23,4),(135,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',17,6),(136,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',30,4),(137,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',9,5),(138,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',19,1),(139,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',9,6),(140,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',41,5),(141,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',7,2),(142,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',41,3),(143,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',45,5),(144,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',21,6),(145,'link to task description','2020-11-10 00:00:00','open','2020-03-12 10:56:23',42,3),(146,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',6,5),(147,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',11,6),(148,'link to task description','2020-11-10 00:00:00','done','2020-03-12 10:56:23',8,4),(149,'link to task description','2020-11-10 00:00:00','needs refinement','2020-03-12 10:56:23',44,7),(150,'link to task description','2020-11-10 00:00:00','closed','2020-03-12 10:56:23',32,5),(151,'','2020-11-10 00:00:00','closed','2020-03-12 17:17:28',17,9);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-16 15:31:25
