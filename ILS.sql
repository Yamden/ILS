-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: livestore
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `category`
-- --

-- LOCK TABLES `category` WRITE;
-- /*!40000 ALTER TABLE `category` DISABLE KEYS */;
-- INSERT INTO `category` VALUES ('0268ae07-fcf1-4d7e-80ba-3d0aaa7fad2a','BlackBerry','BlackBerry'),('03d3a135-cdd7-4315-b281-5d7486cbf2ce','Sumsung','Sumsung345'),('908c3fcb-75ff-4dbc-8f68-38063c1a92b3','Lenovo','Lenovo'),('98c2af25-68ca-49b0-8250-285f738f815a','Dell','Dell'),('ca5f514e-007d-427f-8da8-aaab7533f866','Intel','Intel'),('db288168-dba8-4ec8-b69a-97ab3e1f7357','IPHONE','IPHONE'),('e23f567e-2f88-4346-aca6-50c95b867993','XIAOMIX','XIAOMIX');
-- /*!40000 ALTER TABLE `category` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `id` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `product_id` varchar(40) DEFAULT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_FK` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_id_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

-- LOCK TABLES `orderitem` WRITE;
-- /*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
-- INSERT INTO `orderitem` VALUES ('46d013b6-ef05-4060-9128-f36b30996963',1,111,'0e7fa4bb-b21f-4aa8-89ea-fb55d9ec9f38','53ed810c-cb06-4fad-a533-de2043efba98'),('4e10aae3-65c1-4913-aa91-4b06a27d5b2c',1,111,'0e7fa4bb-b21f-4aa8-89ea-fb55d9ec9f38','f2d2eb9f-85f8-4e49-acd0-3e8fc30d731d'),('797dd6f6-fcd6-4c9c-85a3-b9623e18d419',1,300,'c00136ef-416a-4f49-9fbc-df1f7b87b20d','53ed810c-cb06-4fad-a533-de2043efba98');
-- /*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` varchar(40) NOT NULL,
  `ordertime` datetime NOT NULL,
  `state` tinyint(1) NOT NULL,
  `price` double NOT NULL,
  `user_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_FK` (`user_id`),
  CONSTRAINT `user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

-- LOCK TABLES `orders` WRITE;
-- /*!40000 ALTER TABLE `orders` DISABLE KEYS */;
-- INSERT INTO `orders` VALUES ('53ed810c-cb06-4fad-a533-de2043efba98','2017-09-25 23:22:29',1,411,'73f95b01-0583-4eac-a37a-2b74eb571421'),('f2d2eb9f-85f8-4e49-acd0-3e8fc30d731d','2017-09-25 23:22:17',0,111,'73f95b01-0583-4eac-a37a-2b74eb571421');
-- /*!40000 ALTER TABLE `orders` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `seller` varchar(40) DEFAULT NULL,
  `price` double NOT NULL,
  `image` varchar(200) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id_FK` (`category_id`),
  CONSTRAINT `category_id_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

-- LOCK TABLES `product` WRITE;
-- /*!40000 ALTER TABLE `product` DISABLE KEYS */;
-- INSERT INTO `product` VALUES ('0e7fa4bb-b21f-4aa8-89ea-fb55d9ec9f38','Dell11','Dell',111,'14d358e5-d1bf-4feb-8815-e64ea51f815fasd.jpg','Dell','98c2af25-68ca-49b0-8250-285f738f815a'),('c00136ef-416a-4f49-9fbc-df1f7b87b20d','IPHONE5','3333',300,'5eb365f6-a973-4f6d-8728-d7b3bf8264e721.jpg','Apple','db288168-dba8-4ec8-b69a-97ab3e1f7357');
-- /*!40000 ALTER TABLE `product` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `fax` varchar(40) DEFAULT NULL,
  `cellphone` varchar(40) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

-- LOCK TABLES `user` WRITE;
-- /*!40000 ALTER TABLE `user` DISABLE KEYS */;
-- INSERT INTO `user` VALUES ('497ae2a5-a2eb-45ad-9e4a-d9e34c21531a','123','123','123','123','123','213'),('73f95b01-0583-4eac-a37a-2b74eb571421','asd','asd','123','23','123','123'),('92737f9a-9239-45b4-bda0-09754e50969a','qwe','qwe','123','123','aqwe','qwe');
-- /*!40000 ALTER TABLE `user` ENABLE KEYS */;
-- UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-19 14:45:15
