-- MariaDB dump 10.19-11.1.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: budgets
-- ------------------------------------------------------
-- Server version	11.1.2-MariaDB-1:11.1.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE budgets;

--
-- Table structure for table `lupobudgets_translation`
--

DROP TABLE IF EXISTS `lupobudgets_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lupobudgets_translation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `lang` varchar(6) NOT NULL,
  `translation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lupobudgets_translation_key_lang_125e3f64_uniq` (`key`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lupobudgets_translation`
--

LOCK TABLES `lupobudgets_translation` WRITE;
/*!40000 ALTER TABLE `lupobudgets_translation` DISABLE KEYS */;
INSERT INTO `lupobudgets_translation` VALUES
(1,'login','en','Login'),
(2,'login','it','Accedi'),
(3,'login','de','Anmelden'),
(4,'logout','en','Logout'),
(5,'logout','it','Esci'),
(6,'username','en','Username'),
(7,'password','en','Password'),
(8,'password','it','Password'),
(9,'signin','en','Sign In'),
(10,'signin','it','Accedi'),
(11,'signin','de','Anmelden'),
(12,'invalidcredentials','en','Invalid Credentials'),
(13,'registernewuser','en','Register New User'),
(14,'passwordsdontmatch','en','Passwords don\'t match, please try again'),
(15,'name','en','Name'),
(16,'surname','en','Surname'),
(17,'email','en','Email'),
(18,'repassword','en','Re-Enter Password'),
(19,'createaccount','en','Create Account'),
(20,'forgotpassword','en','Forgot Password?'),
(21,'forgotpassword','it','Hai dimenticato la password?'),
(22,'accounttext','en','Account'),
(23,'accounttext','it','Account'),
(24,'accountinformation','en','Account Information'),
(25,'home','en','Home'),
(26,'home','it','Home'),
(27,'overview','en','Overview'),
(28,'category','en','Category'),
(29,'categories','en','Categories'),
(30,'transaction','en','Transaction'),
(31,'transactions','en','Transactions'),
(32,'footer','en','Mattia Ruta 2021-2023 | Powered by Python 3 using Django Framework |'),
(33,'privacypolicy','en','Privacy Policy'),
(34,'overview','it','Panoramica'),
(35,'categories','it','Categorie'),
(36,'transactions','it','Transazioni'),
(37,'footer','it','Mattia Ruta 2021-2023 | Alimentato da Python 3 utilizzando Django Framework |'),
(38,'privacypolicy','it','politica sulla riservatezza'),
(39,'logout','de','Ausloggen'),
(40,'overview','de','Überblick'),
(41,'categories','de','Kategorien'),
(42,'transactions','de','Transaktionen'),
(43,'home','de','Heim'),
(44,'footer','de','Mattia Ruta 2021-2023 | Unterstützt von Python 3 mit Django Framework |'),
(45,'privacypolicy','de','Datenschutzrichtlinie');
/*!40000 ALTER TABLE `lupobudgets_translation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 20:50:18
