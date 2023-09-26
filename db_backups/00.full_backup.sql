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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add category',7,'add_category'),
(26,'Can change category',7,'change_category'),
(27,'Can delete category',7,'delete_category'),
(28,'Can view category',7,'view_category'),
(29,'Can add sub category',8,'add_subcategory'),
(30,'Can change sub category',8,'change_subcategory'),
(31,'Can delete sub category',8,'delete_subcategory'),
(32,'Can view sub category',8,'view_subcategory'),
(33,'Can add transaction',9,'add_transaction'),
(34,'Can change transaction',9,'change_transaction'),
(35,'Can delete transaction',9,'delete_transaction'),
(36,'Can view transaction',9,'view_transaction'),
(37,'Can add merchant',10,'add_merchant'),
(38,'Can change merchant',10,'change_merchant'),
(39,'Can delete merchant',10,'delete_merchant'),
(40,'Can view merchant',10,'view_merchant'),
(41,'Can add profile',11,'add_profile'),
(42,'Can change profile',11,'change_profile'),
(43,'Can delete profile',11,'delete_profile'),
(44,'Can view profile',11,'view_profile'),
(49,'Can add translation',12,'add_translation'),
(50,'Can change translation',12,'change_translation'),
(51,'Can delete translation',12,'delete_translation'),
(52,'Can view translation',12,'view_translation');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(2,'pbkdf2_sha256$600000$appvGzRwXRPgVBnc8nA77V$/1y15zAq53KWkTj6Vj3taBC1sVnOhcZobdRNYvjuiGY=','2023-09-19 19:13:40.985525',1,'lupino','','','',1,1,'2023-09-19 19:13:02.122213');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(63,'2023-09-19 20:19:11.260873','2','[it] login - Accedi',1,'[{\"added\": {}}]',12,2),
(64,'2023-09-19 20:19:27.982836','3','[de] login - Anmelden',1,'[{\"added\": {}}]',12,2),
(65,'2023-09-19 20:19:37.114094','4','[en] logout - Logout',1,'[{\"added\": {}}]',12,2),
(66,'2023-09-19 20:19:43.809954','5','[it] logout - Esci',1,'[{\"added\": {}}]',12,2),
(67,'2023-09-19 20:19:54.927395','6','[en] username - Username',1,'[{\"added\": {}}]',12,2),
(68,'2023-09-19 20:20:03.545045','7','[en] password - Password',1,'[{\"added\": {}}]',12,2),
(69,'2023-09-19 20:20:13.551124','8','[it] password - Password',1,'[{\"added\": {}}]',12,2),
(70,'2023-09-19 20:20:22.031046','9','[en] signin - Sign In',1,'[{\"added\": {}}]',12,2),
(71,'2023-09-19 20:20:30.255200','10','[it] signin - Accedi',1,'[{\"added\": {}}]',12,2),
(72,'2023-09-19 20:20:49.033983','11','[de] signin - Anmelden',1,'[{\"added\": {}}]',12,2),
(73,'2023-09-19 20:21:01.547748','12','[en] invalidcredentials - Invalid Credentials',1,'[{\"added\": {}}]',12,2),
(74,'2023-09-19 20:21:14.333855','13','[en] registernewuser - Register New User',1,'[{\"added\": {}}]',12,2),
(75,'2023-09-19 20:21:31.822377','14','[en] passwordsdontmatch - Passwords don\'t match, please try again',1,'[{\"added\": {}}]',12,2),
(76,'2023-09-19 20:21:40.298429','15','[en] name - Name',1,'[{\"added\": {}}]',12,2),
(77,'2023-09-19 20:21:47.734446','16','[en] surname - Surname',1,'[{\"added\": {}}]',12,2),
(78,'2023-09-19 20:21:53.953021','17','[en] email - Email',1,'[{\"added\": {}}]',12,2),
(79,'2023-09-19 20:22:07.330495','18','[en] repassword - Re-Enter Password',1,'[{\"added\": {}}]',12,2),
(80,'2023-09-19 20:22:17.881405','19','[en] createaccount - Create Account',1,'[{\"added\": {}}]',12,2),
(81,'2023-09-19 20:22:28.096291','20','[en] forgotpassword - Forgot Password?',1,'[{\"added\": {}}]',12,2),
(82,'2023-09-19 20:22:44.705932','21','[it] forgotpassword - Hai dimenticato la password?',1,'[{\"added\": {}}]',12,2),
(83,'2023-09-19 20:23:02.447557','22','[en] accounttext - Account',1,'[{\"added\": {}}]',12,2),
(84,'2023-09-19 20:23:14.877946','23','[it] accounttext - Account',1,'[{\"added\": {}}]',12,2),
(85,'2023-09-19 20:23:30.824631','24','[en] accountinformation - Account Information',1,'[{\"added\": {}}]',12,2),
(86,'2023-09-19 20:23:37.503022','25','[en] home - Home',1,'[{\"added\": {}}]',12,2),
(87,'2023-09-19 20:23:44.061745','26','[it] home - Home',1,'[{\"added\": {}}]',12,2),
(88,'2023-09-19 20:23:53.668409','27','[en] overview - Overview',1,'[{\"added\": {}}]',12,2),
(89,'2023-09-19 20:24:12.124232','28','[en] category - Category',1,'[{\"added\": {}}]',12,2),
(90,'2023-09-19 20:24:21.798514','29','[en] categories - Categories',1,'[{\"added\": {}}]',12,2),
(91,'2023-09-19 20:24:31.889725','30','[en] transaction - Transaction',1,'[{\"added\": {}}]',12,2),
(92,'2023-09-19 20:24:40.730771','31','[en] transactions - Transactions',1,'[{\"added\": {}}]',12,2),
(93,'2023-09-19 20:24:54.559890','32','[en] footer - Mattia Ruta 2021-2023 | Powered by Python 3 using Django Framework |',1,'[{\"added\": {}}]',12,2),
(94,'2023-09-19 20:25:08.087844','33','[en] privacypolicy - Privacy Policy',1,'[{\"added\": {}}]',12,2),
(95,'2023-09-19 21:01:14.089239','1','lupino - GBP',1,'[{\"added\": {}}]',11,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'lupobudgets','category'),
(10,'lupobudgets','merchant'),
(8,'lupobudgets','subcategory'),
(9,'lupobudgets','transaction'),
(12,'lupobudgets','translation'),
(11,'registration','profile'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2023-09-19 19:12:32.104799'),
(2,'auth','0001_initial','2023-09-19 19:12:32.321459'),
(3,'admin','0001_initial','2023-09-19 19:12:32.376601'),
(4,'admin','0002_logentry_remove_auto_add','2023-09-19 19:12:32.386777'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-09-19 19:12:32.394929'),
(6,'contenttypes','0002_remove_content_type_name','2023-09-19 19:12:32.429492'),
(7,'auth','0002_alter_permission_name_max_length','2023-09-19 19:12:32.452867'),
(8,'auth','0003_alter_user_email_max_length','2023-09-19 19:12:32.469337'),
(9,'auth','0004_alter_user_username_opts','2023-09-19 19:12:32.476135'),
(10,'auth','0005_alter_user_last_login_null','2023-09-19 19:12:32.495323'),
(11,'auth','0006_require_contenttypes_0002','2023-09-19 19:12:32.497392'),
(12,'auth','0007_alter_validators_add_error_messages','2023-09-19 19:12:32.507822'),
(13,'auth','0008_alter_user_username_max_length','2023-09-19 19:12:32.521244'),
(14,'auth','0009_alter_user_last_name_max_length','2023-09-19 19:12:32.533951'),
(15,'auth','0010_alter_group_name_max_length','2023-09-19 19:12:32.551085'),
(16,'auth','0011_update_proxy_permissions','2023-09-19 19:12:32.561586'),
(17,'auth','0012_alter_user_first_name_max_length','2023-09-19 19:12:32.574160'),
(18,'lupobudgets','0001_initial','2023-09-19 19:12:32.724222'),
(19,'registration','0001_initial','2023-09-19 19:12:32.759251'),
(20,'sessions','0001_initial','2023-09-19 19:12:32.779125'),
(21,'lupobudgets','0002_translation','2023-09-19 19:34:08.230700'),
(22,'lupobudgets','0003_alter_translation_lang','2023-09-19 20:12:11.966049'),
(23,'lupobudgets','0004_alter_translation_unique_together','2023-09-19 20:36:04.519676');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('opnt5hb6cyeizf7hk7209affa13dgby6','.eJxVjMsOwiAQRf-FtSHDe-rSvd9AYACpGkhKuzL-uzbpQrf3nHNfzIdtrX4befFzYmcm2el3i4Eeue0g3UO7dU69rcsc-a7wgw5-7Sk_L4f7d1DDqN_aYIKoCVGic6oIhRoxWwekJ1FgAofRqEhCyQhSupRtshpCdlSoBMPeH7WAN04:1qigAG:guA2kM56kvrvZSz3zPFulJD5VpSRmuE14zWWGfHxyms','2023-10-03 19:13:40.988021');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lupobudgets_category`
--

DROP TABLE IF EXISTS `lupobudgets_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lupobudgets_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lupobudgets_category_user_id_7ec1fcdd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `lupobudgets_category_user_id_7ec1fcdd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lupobudgets_category`
--

LOCK TABLES `lupobudgets_category` WRITE;
/*!40000 ALTER TABLE `lupobudgets_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `lupobudgets_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lupobudgets_merchant`
--

DROP TABLE IF EXISTS `lupobudgets_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lupobudgets_merchant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mapcode` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lupobudgets_merchant_user_id_437c42fd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `lupobudgets_merchant_user_id_437c42fd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lupobudgets_merchant`
--

LOCK TABLES `lupobudgets_merchant` WRITE;
/*!40000 ALTER TABLE `lupobudgets_merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `lupobudgets_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lupobudgets_subcategory`
--

DROP TABLE IF EXISTS `lupobudgets_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lupobudgets_subcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lupobudgets_subcateg_category_id_5664daa3_fk_lupobudge` (`category_id`),
  KEY `lupobudgets_subcategory_user_id_ced7fbdd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `lupobudgets_subcateg_category_id_5664daa3_fk_lupobudge` FOREIGN KEY (`category_id`) REFERENCES `lupobudgets_category` (`id`),
  CONSTRAINT `lupobudgets_subcategory_user_id_ced7fbdd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lupobudgets_subcategory`
--

LOCK TABLES `lupobudgets_subcategory` WRITE;
/*!40000 ALTER TABLE `lupobudgets_subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `lupobudgets_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lupobudgets_transaction`
--

DROP TABLE IF EXISTS `lupobudgets_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lupobudgets_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `is_expense` tinyint(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mapcode` varchar(30) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lupobudgets_transact_category_id_ac25f08f_fk_lupobudge` (`category_id`),
  KEY `lupobudgets_transaction_user_id_c022030a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `lupobudgets_transact_category_id_ac25f08f_fk_lupobudge` FOREIGN KEY (`category_id`) REFERENCES `lupobudgets_subcategory` (`id`),
  CONSTRAINT `lupobudgets_transaction_user_id_c022030a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lupobudgets_transaction`
--

LOCK TABLES `lupobudgets_transaction` WRITE;
/*!40000 ALTER TABLE `lupobudgets_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `lupobudgets_transaction` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `registration_profile`
--

DROP TABLE IF EXISTS `registration_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_profile_user_id_e133ce43_fk_auth_user_id` (`user_id`),
  CONSTRAINT `registration_profile_user_id_e133ce43_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_profile`
--

LOCK TABLES `registration_profile` WRITE;
/*!40000 ALTER TABLE `registration_profile` DISABLE KEYS */;
INSERT INTO `registration_profile` VALUES
(1,'GBP',2);
/*!40000 ALTER TABLE `registration_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 21:01:42
