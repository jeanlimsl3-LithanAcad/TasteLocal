-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tastelocal_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add vendor',10,'add_vendor'),(26,'Can change vendor',10,'change_vendor'),(27,'Can delete vendor',10,'delete_vendor'),(28,'Can view vendor',10,'view_vendor'),(29,'Can add review',9,'add_review'),(30,'Can change review',9,'change_review'),(31,'Can delete review',9,'delete_review'),(32,'Can view review',9,'view_review'),(33,'Can add itinerary',8,'add_itinerary'),(34,'Can change itinerary',8,'change_itinerary'),(35,'Can delete itinerary',8,'delete_itinerary'),(36,'Can view itinerary',8,'view_itinerary'),(37,'Can add booking',7,'add_booking'),(38,'Can change booking',7,'change_booking'),(39,'Can delete booking',7,'delete_booking'),(40,'Can view booking',7,'view_booking'),(41,'Can add experience',11,'add_experience'),(42,'Can change experience',11,'change_experience'),(43,'Can delete experience',11,'delete_experience'),(44,'Can view experience',11,'view_experience'),(45,'Can add booking',12,'add_booking'),(46,'Can change booking',12,'change_booking'),(47,'Can delete booking',12,'delete_booking'),(48,'Can view booking',12,'view_booking');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$CdE8txn6DtNAgihRxpvefm$giWTxkl//1Ynkjx7x5VC0irGEPPkz3ALKPhbrAjdBC8=','2026-03-14 12:28:49.430876',1,'admin1','','','admin1@tastelocal.com',1,1,'2026-03-12 17:30:16.000000'),(2,'pbkdf2_sha256$1200000$4KuCDRwSGQZCr9IxWivAlO$FykRz5H8vnu0Yr41yKdnbsJATQfpF68y5LH3uf2Q//0=',NULL,0,'admin2','','','',1,1,'2026-03-13 15:18:45.000000'),(4,'pbkdf2_sha256$1200000$LzcklsBajgUPrNoyy1KbgT$a+21z+PUi0PxJK5hXcVzlzeg1VQzRcIs5KSkOrXCgqU=','2026-03-14 13:40:19.786791',0,'user1','','','',0,1,'2026-03-14 12:36:49.486927'),(5,'pbkdf2_sha256$1200000$cSuLllqvbS86SYZrUdLO7T$3dp0vXTMkmHbMFn159YSidTT/FK4viCZjOmrgYND61g=','2026-03-14 14:36:34.629382',0,'user2','','','user2@gmail.com',0,1,'2026-03-14 14:22:23.351293');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_booking`
--

DROP TABLE IF EXISTS `bookings_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number_of_guests` int unsigned NOT NULL,
  `booking_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `experience_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_booking_experience_id_2c9cdf5a_fk_experienc` (`experience_id`),
  KEY `bookings_booking_user_id_834dfc23_fk_auth_user_id` (`user_id`),
  CONSTRAINT `bookings_booking_experience_id_2c9cdf5a_fk_experienc` FOREIGN KEY (`experience_id`) REFERENCES `experiences_experience` (`id`),
  CONSTRAINT `bookings_booking_user_id_834dfc23_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `bookings_booking_chk_1` CHECK ((`number_of_guests` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_booking`
--

LOCK TABLES `bookings_booking` WRITE;
/*!40000 ALTER TABLE `bookings_booking` DISABLE KEYS */;
INSERT INTO `bookings_booking` VALUES (6,6,'2026-03-21','pending','2026-03-14 13:41:56.404907',2,4),(7,4,'2026-03-15','pending','2026-03-14 14:36:53.070821',1,5);
/*!40000 ALTER TABLE `bookings_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-03-12 17:36:49.357182','1','admin1',2,'[{\"changed\": {\"fields\": [\"Username\", \"Email address\"]}}]',4,1),(2,'2026-03-13 05:19:51.230171','1','Maxwell Hawker Food Tour - Chinatown',1,'[{\"added\": {}}]',11,1),(3,'2026-03-13 05:21:34.753018','1','admin1 booking for Maxwell Hawker Food Tour - Chinatown',1,'[{\"added\": {}}]',12,1),(4,'2026-03-13 15:18:46.569899','2','admin2',1,'[{\"added\": {}}]',4,1),(5,'2026-03-13 15:19:03.386553','2','Peranakan Heritage Cuisine - Katong',1,'[{\"added\": {}}]',11,1),(6,'2026-03-13 15:21:46.370424','1','Maxwell Hawker Food Tour - Chinatown',2,'[{\"changed\": {\"fields\": [\"Description\", \"Price\", \"Image\"]}}]',11,1),(7,'2026-03-14 01:06:37.713267','3','A Taste of Heritage: A Peranakan Culinary Experience - Crawford Lane',1,'[{\"added\": {}}]',11,1),(8,'2026-03-14 07:41:19.093158','3','user1',1,'[{\"added\": {}}]',4,1),(9,'2026-03-14 07:42:00.537175','3','user1 booking for Peranakan Heritage Cuisine - Katong',1,'[{\"added\": {}}]',12,1),(10,'2026-03-14 12:29:40.471888','2','admin2',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(11,'2026-03-14 12:30:23.414875','3','user1',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(12,'2026-03-14 12:35:48.151050','3','user1',3,'',4,1),(13,'2026-03-14 12:36:51.161027','4','user1',1,'[{\"added\": {}}]',4,1),(14,'2026-03-14 13:44:35.244448','1','admin1 booking for Maxwell Hawker Food Tour - Chinatown',3,'',12,1),(15,'2026-03-14 13:44:46.059067','2','admin1 booking for A Taste of Heritage: A Peranakan Culinary Experience - Crawford Lane',3,'',12,1),(16,'2026-03-14 13:44:51.735201','4','admin1 booking for A Taste of Heritage: A Peranakan Culinary Experience - Crawford Lane',3,'',12,1),(17,'2026-03-14 13:44:56.901162','5','admin1 booking for A Taste of Heritage: A Peranakan Culinary Experience - Crawford Lane',3,'',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(12,'bookings','booking'),(5,'contenttypes','contenttype'),(11,'experiences','experience'),(6,'sessions','session'),(7,'users','booking'),(8,'users','itinerary'),(9,'users','review'),(10,'users','vendor');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-12 17:26:01.953154'),(2,'auth','0001_initial','2026-03-12 17:26:02.713791'),(3,'admin','0001_initial','2026-03-12 17:26:03.036885'),(4,'admin','0002_logentry_remove_auto_add','2026-03-12 17:26:03.044328'),(5,'admin','0003_logentry_add_action_flag_choices','2026-03-12 17:26:03.052729'),(6,'contenttypes','0002_remove_content_type_name','2026-03-12 17:26:03.206314'),(7,'auth','0002_alter_permission_name_max_length','2026-03-12 17:26:03.294709'),(8,'auth','0003_alter_user_email_max_length','2026-03-12 17:26:03.326615'),(9,'auth','0004_alter_user_username_opts','2026-03-12 17:26:03.340114'),(10,'auth','0005_alter_user_last_login_null','2026-03-12 17:26:03.416020'),(11,'auth','0006_require_contenttypes_0002','2026-03-12 17:26:03.420359'),(12,'auth','0007_alter_validators_add_error_messages','2026-03-12 17:26:03.429119'),(13,'auth','0008_alter_user_username_max_length','2026-03-12 17:26:03.519555'),(14,'auth','0009_alter_user_last_name_max_length','2026-03-12 17:26:03.625272'),(15,'auth','0010_alter_group_name_max_length','2026-03-12 17:26:03.646448'),(16,'auth','0011_update_proxy_permissions','2026-03-12 17:26:03.657652'),(17,'auth','0012_alter_user_first_name_max_length','2026-03-12 17:26:03.748836'),(18,'sessions','0001_initial','2026-03-12 17:26:03.801711'),(19,'users','0001_initial','2026-03-12 17:26:04.132371'),(20,'experiences','0001_initial','2026-03-12 23:16:26.114717'),(21,'experiences','0002_alter_experience_options_experience_image_and_more','2026-03-13 00:55:36.085884'),(22,'bookings','0001_initial','2026-03-13 05:11:16.115794');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01jtdv9hsf5fobkhfl4kqzzwvznby4it','e30:1w1OcD:cBPJPpg2ndc1LMtXP8qB7FRlC4c2k8LvT85KByacsPI','2026-03-28 13:01:13.231143'),('15pg07qqv3vatj0nctewwkesmznnhw18','.eJxVjEEOwiAQRe_C2pAO0AIu3fcMZGYAqRqalHZlvLsh6UK3_7333yLgsZdwtLSFJYqrAHH53Qj5mWoH8YH1vkpe674tJLsiT9rkvMb0up3u30HBVnptxyE5zqRGDQYmdEahceyY9MDkPKroUSerMmuTbBwhAwExwzB558XnC-YlN_s:1w1O6r:VWMvjm0bY3bW57KWqLDHDY09B9MXOh8TsOfPTOJCOHU','2026-03-28 12:28:49.440008'),('j6qgdnl2kmuop1462jyvyzgiuwf5j42k','e30:1w1Nyx:qjwBoyGGoFtIl9gaUI2s3M-sKuviaGgyi28zrLrsNUc','2026-03-28 12:20:39.728342'),('kvjcmpkfbvnoyeyeqpxm777guy1b275r','e30:1w1NyU:spDHCighIzL2j1hYbKScn-eFHpnh1CyARQFoXkHJ4io','2026-03-28 12:20:10.366251'),('lqt6zzyzafg2jpdtpp8a036dfr7oz8jm','e30:1w1Nox:G2nW4OSzIRLWD8lTb1WRghZ38mXIkhmfpbwYmCtaWkM','2026-03-28 12:10:19.959602'),('mtb3x801ib3g619tk8mmbfp038y9e8zr','.eJxVjEEOwiAQAP_C2RBaWGA9eu8bCCwgVQNJaU_GvxuSHvQ6M5k3c_7Yizt62twa2ZUBu_yy4OmZ6hDx4eu9cWp139bAR8JP2_nSYnrdzvZvUHwvYytsRjRgUILSoJO2hJOyEkEIocBLIwnnQJYAKRBN2WjIMokgU8gz-3wBosE3BQ:1w1Q6U:yzQWaDvU8OZT-JwlU_uiu4ZHhI-7rnEKa7HgYToA54s','2026-03-28 14:36:34.634021'),('ug1j8xj94aqv5lbvrv5c2rqxajiulbzy','e30:1w1Npv:bXjc7DF9DSQx67Mba9gnGiGAUIt99bSPI5yMwwwPgvA','2026-03-28 12:11:19.376157');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences_experience`
--

DROP TABLE IF EXISTS `experiences_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiences_experience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `category` varchar(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `capacity` int unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `vendor_id` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `experiences_experience_vendor_id_3d62c569_fk_auth_user_id` (`vendor_id`),
  CONSTRAINT `experiences_experience_vendor_id_3d62c569_fk_auth_user_id` FOREIGN KEY (`vendor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `experiences_experience_chk_1` CHECK ((`capacity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences_experience`
--

LOCK TABLES `experiences_experience` WRITE;
/*!40000 ALTER TABLE `experiences_experience` DISABLE KEYS */;
INSERT INTO `experiences_experience` VALUES (1,'Maxwell Hawker Food Tour','Experience authentic Singapore street food at famous hawker centres.','hawker','Chinatown',20.00,10,1,'2026-03-13 05:19:51.220607','2026-03-13 15:21:46.359359',1,'experiences/hawker_centre.jpeg'),(2,'Peranakan Heritage Cuisine','Discover traditional Nyonya dishes and Singapore\'s Peranakan culinary heritage.','restaurant','Katong',60.00,10,1,'2026-03-13 15:19:03.382130','2026-03-13 15:19:03.382178',2,'experiences/peranakan_food.png'),(3,'A Taste of Heritage: A Peranakan Culinary Experience','Experience authentic Peranakan traditions at The Intan, where cooking serves as a living vessel for cultural identity. Our mission is to preserve this vibrant heritage through immersive education and shared history.','workshop','Crawford Lane',100.00,12,1,'2026-03-14 01:06:37.651745','2026-03-14 01:06:37.651786',1,'experiences/cooking_class3.jpg');
/*!40000 ALTER TABLE `experiences_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_booking`
--

DROP TABLE IF EXISTS `users_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(200) NOT NULL,
  `customer_email` varchar(254) NOT NULL,
  `booking_date` date NOT NULL,
  `number_of_guests` int unsigned NOT NULL,
  `special_requests` longtext,
  `created_at` datetime(6) NOT NULL,
  `vendor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_booking_vendor_id_64adf8e7_fk_users_vendor_id` (`vendor_id`),
  CONSTRAINT `users_booking_vendor_id_64adf8e7_fk_users_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `users_vendor` (`id`),
  CONSTRAINT `users_booking_chk_1` CHECK ((`number_of_guests` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_booking`
--

LOCK TABLES `users_booking` WRITE;
/*!40000 ALTER TABLE `users_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_itinerary`
--

DROP TABLE IF EXISTS `users_itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_itinerary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `planned_date` date DEFAULT NULL,
  `notes` longtext,
  `status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `vendor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_itinerary_vendor_id_d29e8172_fk_users_vendor_id` (`vendor_id`),
  CONSTRAINT `users_itinerary_vendor_id_d29e8172_fk_users_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `users_vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_itinerary`
--

LOCK TABLES `users_itinerary` WRITE;
/*!40000 ALTER TABLE `users_itinerary` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_review`
--

DROP TABLE IF EXISTS `users_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reviewer_name` varchar(200) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `vendor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_review_vendor_id_945f97fd_fk_users_vendor_id` (`vendor_id`),
  CONSTRAINT `users_review_vendor_id_945f97fd_fk_users_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `users_vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_review`
--

LOCK TABLES `users_review` WRITE;
/*!40000 ALTER TABLE `users_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_vendor`
--

DROP TABLE IF EXISTS `users_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_vendor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(200) NOT NULL,
  `experience_title` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `location` varchar(200) NOT NULL,
  `region` varchar(50) NOT NULL,
  `price_range` varchar(50) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `map_embed_url` varchar(200) DEFAULT NULL,
  `map_link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_vendor`
--

LOCK TABLES `users_vendor` WRITE;
/*!40000 ALTER TABLE `users_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 21:19:20
