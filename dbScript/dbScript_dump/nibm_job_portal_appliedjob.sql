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
-- Table structure for table `appliedjob`
--

DROP TABLE IF EXISTS `appliedjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appliedjob` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_url` longtext,
  `jobId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `date` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AppliedJob_jobId` (`jobId`),
  KEY `IX_AppliedJob_studentId` (`studentId`),
  CONSTRAINT `FK_AppliedJob_Job_jobId` FOREIGN KEY (`jobId`) REFERENCES `job` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AppliedJob_Student_studentId` FOREIGN KEY (`studentId`) REFERENCES `student` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appliedjob`
--

LOCK TABLES `appliedjob` WRITE;
/*!40000 ALTER TABLE `appliedjob` DISABLE KEYS */;
INSERT INTO `appliedjob` VALUES (3,'http://www.africau.edu/images/default/sample.pdf',8,11,'2021-5-5'),(4,'http://www.africau.edu/images/default/sample.pdf',9,11,'12-10-2021'),(5,'http://www.africau.edu/images/default/sample.pdf',12,11,'2021-5-5'),(6,'http://www.africau.edu/images/default/sample.pdf',9,10,'2021-5-5'),(7,'http://www.africau.edu/images/default/sample.pdf',10,10,'2021-5-5'),(8,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F963070080V_Angular%20CV?alt=media&token=07f1163a-0b40-481c-b6ea-05cb9d1366cd',1,15,'2021-5-5'),(9,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F963070080V_1633713053167?alt=media&token=56111064-d166-4bf9-bceb-a12eeb6f0118',7,15,'2021-5-5'),(10,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F963070080V_1633713053167?alt=media&token=56111064-d166-4bf9-bceb-a12eeb6f0118',9,15,'2021-5-5'),(11,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F963070080V_1633765374970?alt=media&token=9b8b0918-65eb-42ad-88a5-1ab52d38e798',13,15,'2021-5-5'),(12,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F960390067V_1633767000876?alt=media&token=6feaefa8-b4c5-4573-8534-87435f08ddea',2,17,'2021-5-5'),(13,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F960390067V_1633767000876?alt=media&token=6feaefa8-b4c5-4573-8534-87435f08ddea',15,17,'2021-5-5'),(14,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F960390067V_1633767000876?alt=media&token=6feaefa8-b4c5-4573-8534-87435f08ddea',17,17,'2021-5-5'),(15,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F963070080V_1633765374970?alt=media&token=9b8b0918-65eb-42ad-88a5-1ab52d38e798',17,15,'2021-5-5'),(16,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F980082210V_1633971121001?alt=media&token=7b14fe8c-10a2-4485-8bc5-9a4fa96f6788',15,20,'2021-5-5'),(17,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F952981846V_1633881173865?alt=media&token=0facb76e-9d4c-4a1e-9927-9d7e6db7157d',6,19,'2021-5-5'),(18,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F952981846V_1633881173865?alt=media&token=0facb76e-9d4c-4a1e-9927-9d7e6db7157d',15,19,'2021-5-5'),(19,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F963070080V_1634051197790?alt=media&token=d3694d74-811b-420b-bec9-822fdd85b44e',2,15,'12-10-2021'),(20,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F952981846V_1633881173865?alt=media&token=0facb76e-9d4c-4a1e-9927-9d7e6db7157d',18,19,NULL),(21,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F973311158V_1634052358092?alt=media&token=131683ee-8683-401e-8b65-b65ba4ed7599',8,18,'12-10-2021'),(22,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F945591617V_1634124654930?alt=media&token=dc3bdc14-314a-4892-8194-f1f42ca5fdd0',21,16,NULL),(23,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fstudent_cv%2F952981846V_1634130818161?alt=media&token=3fbc4cfd-5adb-48c6-b6a0-e3af14c63324',25,19,'13-10-2021');
/*!40000 ALTER TABLE `appliedjob` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 12:50:53
