-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ah_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.32-MariaDB

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
-- Table structure for table `ahi_client`
--

DROP TABLE IF EXISTS `ahi_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(45) NOT NULL,
  `client_desc` varchar(400) DEFAULT NULL,
  `client_location` varchar(45) DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_client`
--

LOCK TABLES `ahi_client` WRITE;
/*!40000 ALTER TABLE `ahi_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_client` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_client_AFTER_INSERT` AFTER INSERT ON `ahi_client` FOR EACH ROW
INSERT into `ah_db`.`ahi_client_audit`
SET
`client_id` = NEW.client_id,
`client_name` = NEW.client_name,
`client_desc` = NEW.client_desc,
`client_location` = NEW.client_location,
`who_updated` = NEW.who_updated,
`client_audit_action` = 'INSERT',
`client_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_client_AFTER_UPDATE` AFTER UPDATE ON `ahi_client` FOR EACH ROW

INSERT into `ah_db`.`ahi_client_audit`
SET
`client_id` = NEW.client_id,
`client_name` = NEW.client_name,
`client_desc` = NEW.client_desc,
`client_location` = NEW.client_location,
`who_updated` = NEW.who_updated,
`client_audit_action` = 'UPDATE',
`client_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_client_BEFORE_DELETE` BEFORE DELETE ON `ahi_client` FOR EACH ROW
INSERT into `ah_db`.`ahi_client_audit`
SET
`client_id` = OLD.client_id,
`client_name` = OLD.client_name,
`client_desc` = OLD.client_desc,
`client_location` = OLD.client_location,
`who_updated` = OLD.who_updated,
`client_audit_action` = 'DELETE',
`client_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ahi_client_audit`
--

DROP TABLE IF EXISTS `ahi_client_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_client_audit` (
  `client_audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `client_name` varchar(45) DEFAULT NULL,
  `client_desc` varchar(400) DEFAULT NULL,
  `client_location` varchar(45) DEFAULT NULL,
  `client_audit_action` varchar(45) DEFAULT NULL,
  `client_audit_date` datetime DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_audit_id`),
  UNIQUE KEY `client_audit_id_UNIQUE` (`client_audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_client_audit`
--

LOCK TABLES `ahi_client_audit` WRITE;
/*!40000 ALTER TABLE `ahi_client_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_client_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahi_departments`
--

DROP TABLE IF EXISTS `ahi_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_departments` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `department_description` varchar(400) NOT NULL,
  `headed_by_user_id` int(10) DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_id_UNIQUE` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_departments`
--

LOCK TABLES `ahi_departments` WRITE;
/*!40000 ALTER TABLE `ahi_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_departments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_departments_AFTER_INSERT` AFTER INSERT ON `ahi_departments` FOR EACH ROW
INSERT INTO
 `ah_db`.`ahi_departments_audit`
SET

`department_id` = NEW.department_id,
`department_name` = NEW.department_name,
`department_description` = NEW.department_description,
`headed_by_user_id` = NEW.headed_by_user_id,
`who_updated` = NEW.who_updated,
`department_audit_action` = 'INSERT',
`department_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_departments_AFTER_UPDATE` AFTER UPDATE ON `ahi_departments` FOR EACH ROW
INSERT INTO
 `ah_db`.`ahi_departments_audit`
SET
`department_id` = NEW.department_id,
`department_name` = NEW.department_name,
`department_description` = NEW.department_description,
`headed_by_user_id` = NEW.headed_by_user_id,
`who_updated` = NEW.who_updated,
`department_audit_action` = 'UPDATE',
`department_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_departments_BEFORE_DELETE` BEFORE DELETE ON `ahi_departments` FOR EACH ROW
INSERT INTO
 `ah_db`.`ahi_departments_audit`
SET
`department_id` = OLD.department_id,
`department_name` = OLD.department_name,
`department_description` = OLD.department_description,
`headed_by_user_id` = OLD.headed_by_user_id,
`who_updated` = OLD.who_updated,
`department_audit_action` = 'DELETE',
`department_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ahi_departments_audit`
--

DROP TABLE IF EXISTS `ahi_departments_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_departments_audit` (
  `department_audit_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_id` int(10) DEFAULT NULL,
  `department_name` varchar(200) DEFAULT NULL,
  `department_description` varchar(400) DEFAULT NULL,
  `headed_by_user_id` int(10) DEFAULT NULL,
  `department_audit_action` varchar(45) DEFAULT NULL,
  `department_audit_date` datetime DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`department_audit_id`),
  UNIQUE KEY `department_audit_id_UNIQUE` (`department_audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_departments_audit`
--

LOCK TABLES `ahi_departments_audit` WRITE;
/*!40000 ALTER TABLE `ahi_departments_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_departments_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahi_projects`
--

DROP TABLE IF EXISTS `ahi_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_projects` (
  `project_id` int(10) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(200) NOT NULL,
  `project_description` varchar(400) NOT NULL,
  `headed_by_user_id` int(10) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_id_UNIQUE` (`project_id`),
  KEY `client_id_ts_idx` (`client_id`),
  CONSTRAINT `client_id_ts` FOREIGN KEY (`client_id`) REFERENCES `ahi_client` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_projects`
--

LOCK TABLES `ahi_projects` WRITE;
/*!40000 ALTER TABLE `ahi_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_projects_AFTER_INSERT` AFTER INSERT ON `ahi_projects` FOR EACH ROW
INSERT into `ah_db`.`ahi_projects_audit`
SET
`project_id` = NEW.project_id,
`project_name` = NEW.project_name,
`project_description` = NEW.project_description,
`headed_by_user_id` = NEW.headed_by_user_id,
`who_updated` = NEW.who_updated,
`project_audit_action` = 'INSERT',
`project_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_projects_AFTER_UPDATE` AFTER UPDATE ON `ahi_projects` FOR EACH ROW
INSERT into `ah_db`.`ahi_projects_audit`
SET
`project_id` = NEW.project_id,
`project_name` = NEW.project_name,
`project_description` = NEW.project_description,
`headed_by_user_id` = NEW.headed_by_user_id,
`who_updated` = NEW.who_updated,
`project_audit_action` = 'UPDATE',
`project_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_projects_BEFORE_DELETE` BEFORE DELETE ON `ahi_projects` FOR EACH ROW
INSERT into `ah_db`.`ahi_projects_audit`
SET
`project_id` = OLD.project_id,
`project_name` = OLD.project_name,
`project_description` = OLD.project_description,
`headed_by_user_id` = OLD.headed_by_user_id,
`who_updated` = OLD.who_updated,
`project_audit_action` = 'DELETE',
`project_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ahi_projects_audit`
--

DROP TABLE IF EXISTS `ahi_projects_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_projects_audit` (
  `project_audit_id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT NULL,
  `project_name` varchar(200) DEFAULT NULL,
  `project_description` varchar(400) DEFAULT NULL,
  `headed_by_user_id` int(10) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `project_audit_action` varchar(45) DEFAULT NULL,
  `project_audit_date` datetime DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_audit_id`),
  UNIQUE KEY `project_audit_id_UNIQUE` (`project_audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_projects_audit`
--

LOCK TABLES `ahi_projects_audit` WRITE;
/*!40000 ALTER TABLE `ahi_projects_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_projects_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahi_security_group`
--

DROP TABLE IF EXISTS `ahi_security_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_security_group` (
  `security_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `security_group_code` varchar(255) DEFAULT NULL,
  `security_group_name` varchar(255) DEFAULT NULL,
  `when_created` datetime DEFAULT NULL,
  `when_updated` datetime DEFAULT NULL,
  `who_created` varchar(255) DEFAULT NULL,
  `who_updated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`security_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_security_group`
--

LOCK TABLES `ahi_security_group` WRITE;
/*!40000 ALTER TABLE `ahi_security_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_security_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahi_tasks`
--

DROP TABLE IF EXISTS `ahi_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_tasks` (
  `task_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(200) NOT NULL,
  `task_description` varchar(400) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `task_id_UNIQUE` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_tasks`
--

LOCK TABLES `ahi_tasks` WRITE;
/*!40000 ALTER TABLE `ahi_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_tasks_AFTER_INSERT` AFTER INSERT ON `ahi_tasks` FOR EACH ROW
INSERT into `ah_db`.`ahi_tasks_audit`
SET
`task_id` = NEW.task_id,
`task_name` = NEW.task_name,
`task_description` = NEW.task_description,
`user_id` = NEW.user_id,
`who_updated` = NEW.who_updated,
`task_audit_action` = 'INSERT',
`task_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_tasks_AFTER_UPDATE` AFTER UPDATE ON `ahi_tasks` FOR EACH ROW
INSERT into `ah_db`.`ahi_tasks_audit`
SET
`task_id` = NEW.task_id,
`task_name` = NEW.task_name,
`task_description` = NEW.task_description,
`user_id` = NEW.user_id,
`who_updated` = NEW.who_updated,
`task_audit_action` = 'UPDATE',
`task_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_tasks_BEFORE_DELETE` BEFORE DELETE ON `ahi_tasks` FOR EACH ROW
INSERT into `ah_db`.`ahi_tasks_audit`
SET
`task_id` = OLD.task_id,
`task_name` = OLD.task_name,
`task_description` = OLD.task_description,
`user_id` = OLD.user_id,
`who_updated` = OLD.who_updated,
`task_audit_action` = 'DELETE',
`task_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ahi_tasks_audit`
--

DROP TABLE IF EXISTS `ahi_tasks_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_tasks_audit` (
  `task_audit_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) DEFAULT NULL,
  `task_name` varchar(200) DEFAULT NULL,
  `task_description` varchar(400) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `task_audit_action` varchar(45) DEFAULT NULL,
  `task_audit_date` datetime DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`task_audit_id`),
  UNIQUE KEY `task_audit_id_UNIQUE` (`task_audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_tasks_audit`
--

LOCK TABLES `ahi_tasks_audit` WRITE;
/*!40000 ALTER TABLE `ahi_tasks_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_tasks_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahi_timesheet`
--

DROP TABLE IF EXISTS `ahi_timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_timesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_desc` varchar(400) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_hours` int(11) DEFAULT NULL,
  `emp_id` int(10) DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id_ts_idx` (`project_id`),
  KEY `task_id_ts_idx` (`task_id`),
  KEY `idx_id` (`id`,`emp_id`,`date`),
  CONSTRAINT `project_id_ts` FOREIGN KEY (`project_id`) REFERENCES `ahi_projects` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_id_ts` FOREIGN KEY (`task_id`) REFERENCES `ahi_tasks` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_timesheet`
--

LOCK TABLES `ahi_timesheet` WRITE;
/*!40000 ALTER TABLE `ahi_timesheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_timesheet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_timesheet_AFTER_INSERT` AFTER INSERT ON `ahi_timesheet` FOR EACH ROW
INSERT into `ah_db`.`ahi_timesheet_audit`
SET
`id` = NEW.id,
`project_id` = NEW.project_id,
`task_id` = NEW.task_id,
`task_desc` = NEW.task_desc,
`date` = NEW.date,
`total_hours` = NEW.total_hours,
`emp_id` = NEW.emp_id,
`who_updated` = NEW.who_updated,
`timesheet_audit_action` = 'INSERT',
`timesheet_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_timesheet_AFTER_UPDATE` AFTER UPDATE ON `ahi_timesheet` FOR EACH ROW
INSERT into `ah_db`.`ahi_timesheet_audit`
SET
`id` = NEW.id,
`project_id` = NEW.project_id,
`task_id` = NEW.task_id,
`task_desc` = NEW.task_desc,
`date` = NEW.date,
`total_hours` = NEW.total_hours,
`emp_id` = NEW.emp_id,
`who_updated` = NEW.who_updated,
`timesheet_audit_action` = 'UPDATE',
`timesheet_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_timesheet_BEFORE_DELETE` BEFORE DELETE ON `ahi_timesheet` FOR EACH ROW
INSERT into `ah_db`.`ahi_timesheet_audit`
SET
`id` = OLD.id,
`project_id` = OLD.project_id,
`task_id` = OLD.task_id,
`task_desc` = OLD.task_desc,
`date` = OLD.date,
`total_hours` = OLD.total_hours,
`emp_id` = OLD.emp_id,
`who_updated` = OLD.who_updated,
`timesheet_audit_action` = 'DELETE',
`timesheet_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ahi_timesheet_audit`
--

DROP TABLE IF EXISTS `ahi_timesheet_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_timesheet_audit` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `task_desc` varchar(400) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_hours` int(11) DEFAULT NULL,
  `emp_id` int(10) DEFAULT NULL,
  `timesheet_audit_action` varchar(45) DEFAULT NULL,
  `timesheet_audit_date` datetime DEFAULT NULL,
  `who_updated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`audit_id`),
  UNIQUE KEY `audit_id_UNIQUE` (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_timesheet_audit`
--

LOCK TABLES `ahi_timesheet_audit` WRITE;
/*!40000 ALTER TABLE `ahi_timesheet_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_timesheet_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahi_timesheet_new`
--

DROP TABLE IF EXISTS `ahi_timesheet_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_timesheet_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `d1` int(11) DEFAULT NULL,
  `d2` int(11) DEFAULT NULL,
  `d3` int(11) DEFAULT NULL,
  `d4` int(11) DEFAULT NULL,
  `d5` int(11) DEFAULT NULL,
  `d6` int(11) DEFAULT NULL,
  `d7` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id_tsn_idx` (`project_id`),
  KEY `task_id_tsn_idx` (`task_id`),
  CONSTRAINT `project_id_tsn` FOREIGN KEY (`project_id`) REFERENCES `ahi_projects` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_id_tsn` FOREIGN KEY (`task_id`) REFERENCES `ahi_tasks` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_timesheet_new`
--

LOCK TABLES `ahi_timesheet_new` WRITE;
/*!40000 ALTER TABLE `ahi_timesheet_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_timesheet_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahi_user`
--

DROP TABLE IF EXISTS `ahi_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `when_created` datetime DEFAULT NULL,
  `when_updated` datetime DEFAULT NULL,
  `who_created` varchar(255) DEFAULT NULL,
  `who_updated` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `designation` varchar(60) DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `supervisor_id` int(10) unsigned DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_id_UNIQUE` (`login_id`),
  KEY `supervisor_fk_iidx1` (`supervisor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9992 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_user`
--

LOCK TABLES `ahi_user` WRITE;
/*!40000 ALTER TABLE `ahi_user` DISABLE KEYS */;
INSERT INTO `ahi_user` VALUES (1,'','Surjit','Konjengbam','100001','$2a$10$PSk111GESB2Sjq0xc.Q.FezCoI1qAnfBydJemYvQy5NS0r/YmlLqq','surjit.konjengbam@gmail.com','2018-01-30 11:51:51','2018-01-30 11:51:51','admin','admin','1980-09-09 00:00:00','software developer','2018-01-30 00:00:00','admin',1,'USA');
/*!40000 ALTER TABLE `ahi_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_user_AFTER_INSERT` AFTER INSERT ON `ahi_user` FOR EACH ROW
INSERT into `ah_db`.`ahi_user_audit`
SET
`user_id` = NEW.user_id,
`active` = NEW.active,
`first_name` = NEW.first_name,
`last_name` = NEW.last_name,
`login_id` = NEW.login_id,
`password` = NEW.password,
`email` = NEW.email,
`when_created` = NEW.when_created,
`when_updated` = NEW.when_updated,
`who_created` = NEW.who_created,
`who_updated` = NEW.who_updated,
`dob` = NEW.dob,
`designation` = NEW.designation,
`joining_date` = NEW.joining_date,
`role` = NEW.role,
`supervisor_id` = NEW.supervisor_id,
`location` = NEW.location,
`user_audit_action` = 'INSERT',
`user_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_user_AFTER_UPDATE` AFTER UPDATE ON `ahi_user` FOR EACH ROW
INSERT into `ah_db`.`ahi_user_audit`
SET
`user_id` = NEW.user_id,
`active` = NEW.active,
`first_name` = NEW.first_name,
`last_name` = NEW.last_name,
`login_id` = NEW.login_id,
`password` = NEW.password,
`email` = NEW.email,
`when_created` = NEW.when_created,
`when_updated` = NEW.when_updated,
`who_created` = NEW.who_created,
`who_updated` = NEW.who_updated,
`dob` = NEW.dob,
`designation` = NEW.designation,
`joining_date` = NEW.joining_date,
`role` = NEW.role,
`supervisor_id` = NEW.supervisor_id,
`location` = NEW.location,
`user_audit_action` = 'UPDATE',
`user_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ah_db`.`ahi_user_BEFORE_DELETE` BEFORE DELETE ON `ahi_user` FOR EACH ROW
INSERT into `ah_db`.`ahi_user_audit`
SET
`user_id` = OLD.user_id,
`active` = OLD.active,
`first_name` = OLD.first_name,
`last_name` = OLD.last_name,
`login_id` = OLD.login_id,
`password` = OLD.password,
`email` = OLD.email,
`when_created` = OLD.when_created,
`when_updated` = OLD.when_updated,
`who_created` = OLD.who_created,
`who_updated` = OLD.who_updated,
`dob` = OLD.dob,
`designation` = OLD.designation,
`joining_date` = OLD.joining_date,
`role` = OLD.role,
`supervisor_id` = OLD.supervisor_id,
`location` = OLD.location,
`user_audit_action` = 'DELETE',
`user_audit_date` = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ahi_user_audit`
--

DROP TABLE IF EXISTS `ahi_user_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_user_audit` (
  `user_audit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `when_created` datetime DEFAULT NULL,
  `when_updated` datetime DEFAULT NULL,
  `who_created` varchar(255) DEFAULT NULL,
  `who_updated` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `designation` varchar(60) DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `supervisor_id` int(10) unsigned DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `user_audit_action` varchar(45) DEFAULT NULL,
  `user_audit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_audit_id`),
  UNIQUE KEY `user_audit_id_UNIQUE` (`user_audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_user_audit`
--

LOCK TABLES `ahi_user_audit` WRITE;
/*!40000 ALTER TABLE `ahi_user_audit` DISABLE KEYS */;
INSERT INTO `ahi_user_audit` VALUES (62,1,'','Surjit','Konjengbam','100001','$2a$10$PSk111GESB2Sjq0xc.Q.FezCoI1qAnfBydJemYvQy5NS0r/YmlLqq','surjit.konjengbam@gmail.com','2018-01-30 11:51:51','2018-01-30 11:51:51','admin','admin','1980-09-09 00:00:00','software developer','2018-01-30 00:00:00','admin',1,'USA','INSERT','2019-01-08 06:31:07');
/*!40000 ALTER TABLE `ahi_user_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahi_user_security_group`
--

DROP TABLE IF EXISTS `ahi_user_security_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahi_user_security_group` (
  `security_group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`security_group_id`),
  KEY `id_idx` (`user_id`),
  KEY `id1` (`security_group_id`),
  CONSTRAINT `id1` FOREIGN KEY (`security_group_id`) REFERENCES `ahi_security_group` (`security_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id2` FOREIGN KEY (`user_id`) REFERENCES `ahi_user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahi_user_security_group`
--

LOCK TABLES `ahi_user_security_group` WRITE;
/*!40000 ALTER TABLE `ahi_user_security_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahi_user_security_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08 12:01:53
