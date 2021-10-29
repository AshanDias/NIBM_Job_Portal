-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: nibmdb.mysql.database.azure.com    Database: nibm_job_portal
-- ------------------------------------------------------
-- Server version	5.6.47.0

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Name` longtext,
  `Logo_path` longtext,
  `Email` longtext,
  `Physical_Address` longtext,
  `Contact_1` longtext,
  `Contact_2` longtext,
  `State` longtext,
  `Image` longtext,
  `IndustryId` int(11) NOT NULL,
  `Contact_No` longtext,
  `Description` longtext,
  `IsEnable` int(11) NOT NULL,
  `Website` longtext,
  `ApplicationUserId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Company_ApplicationUserId` (`ApplicationUserId`),
  KEY `IX_Company_IndustryId` (`IndustryId`),
  CONSTRAINT `FK_Company_AspNetUsers_ApplicationUserId` FOREIGN KEY (`ApplicationUserId`) REFERENCES `aspnetusers` (`Id`),
  CONSTRAINT `FK_Company_Industry_IndustryId` FOREIGN KEY (`IndustryId`) REFERENCES `industry` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Ashan ',NULL,'ashandias.info@gmail.com',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,'e8cb89db-d6d8-4bf8-b16a-b31b4c645e65'),(2,'hSenid Software','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fcompany_logo%2Fhsenid-logo-medium-final.png?alt=media&token=898affa7-c3e9-4923-99f4-b780b740f44f','rusira986@gmail.com','01/01',NULL,NULL,NULL,NULL,1,'0114875256',NULL,1,'www.hsenid.com','c07ce0b1-1bc1-4b40-8485-5b6e5170dbd7'),(3,'99X Technology','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fcompany_logo%2Fauthor_99x.png?alt=media&token=dd00d7ef-14b6-42dc-b033-0fae9f2a061f','hisharadilshan2@gmail.com','No 36/B, colombo',NULL,NULL,NULL,NULL,1,'0711116601','99x Developers',1,'www.nibm-job-potal.azurewebsites.net','ab7aa22e-a7a1-418f-bce7-fa8ae175e9e3'),(4,'Marshmallow','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fcompany_logo%2Flogo_mmc.png?alt=media&token=2b4c5e9d-3990-40a0-9194-dd9c57f66b9b','marshmallow.yongshin@gmail.com','Marshmallow, Somewhere',NULL,NULL,NULL,NULL,1,'0718677001','A startup software company with a small group of people.',1,'https://marshmallow.com','1fafe919-4954-451d-81fa-ae20b6976e6c'),(5,'ABC company','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fcompany_logo%2F21378466.jpg?alt=media&token=d654e398-c4c5-4a01-b798-5d8de24388cf','w.l.n.ishara@gmail.com','colombo',NULL,NULL,NULL,NULL,1,'0714747489','Test',1,'https://www.google.com/','faf15ca7-2032-4a60-8b06-4ffea6c16cd1'),(6,'DMS','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fcompany_logo%2Fdms-governance-squarelogo-1498743295635.png?alt=media&token=04f2648a-02db-45ee-9eb7-a367377a2212','dms.info@gmail.com','Malabe',NULL,NULL,NULL,NULL,1,'0714251426','Test',1,'https://www.google.com/','a64a9431-d28c-4cbc-89f9-097862b402ec'),(7,'ICTA','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fcompany_logo%2Fdownload.png?alt=media&token=ebcfae33-516b-46b6-bc54-75f8d8ac4bfb','icta@gmail.com','Colombo',NULL,NULL,NULL,NULL,1,'0114526541','Colombo',1,'https://www.google.com/','4e6b982b-818e-4178-bf08-d32642d2c130'),(8,'QSD',NULL,'qsd@gmail.com',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL,'d9c35517-fbeb-495b-8f7c-711d34efc604'),(9,'dddd',NULL,'aaaa@gmail.com',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,'6a5a795d-c31e-4591-81b9-d1b70cdb927b'),(10,'QSD',NULL,'1234@gmail.com',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL,'5ae2fa62-7b98-4e2c-a4bd-9591f66acf79'),(11,'ERT',NULL,'ert@gmail.com',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,'a9dfbdeb-60b0-4fe6-a7b0-b4c2d0f48a66'),(12,'NIBM','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fcompany_logo%2F2009-Audi-Sportback-Concept-01-1600x1200.jpg?alt=media&token=078d16e2-10cb-4894-a66a-96ee9ad36a1d','nibm1@gmail.com','01/101',NULL,NULL,NULL,NULL,1,'0114578965','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,'nibm1@gmail.com','2b7c8cdc-5e1d-473f-b8c7-52e9b1c60935');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 12:49:15
