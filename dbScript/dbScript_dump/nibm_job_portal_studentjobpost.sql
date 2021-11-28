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
-- Table structure for table `studentjobpost`
--

DROP TABLE IF EXISTS `studentjobpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentjobpost` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Email` longtext,
  `Date` longtext,
  `Ql1` longtext,
  `Ql2` longtext,
  `Ql3` longtext,
  `Ql4` longtext,
  `Sk1` longtext,
  `Sk2` longtext,
  `Sk3` longtext,
  `Sk4` longtext,
  `Sk5` longtext,
  `Sk6` longtext,
  `Sk7` longtext,
  `Sk8` longtext,
  `Sk9` longtext,
  `Sk10` longtext,
  `Description` longtext,
  `Age` int(11) NOT NULL,
  `CV` longtext,
  `JobId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_StudentJobPost_JobId` (`JobId`),
  KEY `IX_StudentJobPost_StudentId` (`StudentId`),
  CONSTRAINT `FK_StudentJobPost_Job_JobId` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_StudentJobPost_Student_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `student` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentjobpost`
--

LOCK TABLES `studentjobpost` WRITE;
/*!40000 ALTER TABLE `studentjobpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentjobpost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 12:50:38
