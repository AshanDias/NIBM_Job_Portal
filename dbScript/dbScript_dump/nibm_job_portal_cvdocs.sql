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
-- Table structure for table `cvdocs`
--

DROP TABLE IF EXISTS `cvdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cvdocs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `document_url` longtext,
  `file_name` longtext,
  `alias` longtext,
  `added_date` longtext,
  `StudentId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_CVDocs_StudentId` (`StudentId`),
  CONSTRAINT `FK_CVDocs_Student_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `student` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cvdocs`
--

LOCK TABLES `cvdocs` WRITE;
/*!40000 ALTER TABLE `cvdocs` DISABLE KEYS */;
INSERT INTO `cvdocs` VALUES (4,'http://www.africau.edu/images/default/sample.pdf','sample.pdf','My Sample PDF','2021-04-06 10:12:22',11),(5,'http://google.com','cv1','cv1','2021-10-07',14),(13,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F960390067V_1633767000876?alt=media&token=6feaefa8-b4c5-4573-8534-87435f08ddea','mycv - Copy.pdf','common cv','09.10.2021',17),(14,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F960390067V_1633767596800?alt=media&token=5e4b51cd-d8bb-4079-933f-6b89de3c22d3','PERMITION TO TRAVE TILL 30th July 2021 .pdf','secondary cv','09.10.2021',17),(15,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F952981846V_1633881173865?alt=media&token=0facb76e-9d4c-4a1e-9927-9d7e6db7157d','CV Example.pdf','CV','10.10.2021',19),(19,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F980082210V_1633971121001?alt=media&token=7b14fe8c-10a2-4485-8bc5-9a4fa96f6788','dummy (1).pdf','vabq','11.10.2021',20),(20,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F980082210V_1633971151046?alt=media&token=2ef299e7-071c-4f4a-9eb8-bb530732ca22','Get_Started_With_Smallpdf (1).pdf','hhh','11.10.2021',20),(21,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F963070080V_1634051197790?alt=media&token=d3694d74-811b-420b-bec9-822fdd85b44e','file-sample_150kB.pdf','Node JS','12.10.2021',15),(23,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F973311158V_1634052358092?alt=media&token=131683ee-8683-401e-8b65-b65ba4ed7599','cv.pdf','tt','12.10.2021',18),(24,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F945591617V_1634124654930?alt=media&token=dc3bdc14-314a-4892-8194-f1f42ca5fdd0','Timing 2021 Augb.pdf','Testing CV','13.10.2021',16),(25,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F952981846V_1634130818161?alt=media&token=3fbc4cfd-5adb-48c6-b6a0-e3af14c63324','new CV.pdf','New CV','13.10.2021',19);
/*!40000 ALTER TABLE `cvdocs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 12:49:22
