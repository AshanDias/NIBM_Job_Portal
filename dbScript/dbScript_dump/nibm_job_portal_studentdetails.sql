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
-- Table structure for table `studentdetails`
--

DROP TABLE IF EXISTS `studentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentdetails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `about` longtext,
  `github_url` longtext,
  `linkedin_url` longtext,
  `image_url` longtext,
  `highest_qualification` longtext,
  `qualified_year` longtext,
  `skills` longtext,
  `categories` longtext,
  `StudentId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_StudentDetails_StudentId` (`StudentId`),
  CONSTRAINT `FK_StudentDetails_Student_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `student` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentdetails`
--

LOCK TABLES `studentdetails` WRITE;
/*!40000 ALTER TABLE `studentdetails` DISABLE KEYS */;
INSERT INTO `studentdetails` VALUES (1,'In publishing and graphic design, Lorem ipsum is a placeholder text commonly ','https://github.com/','https://lk.linkedin.com/','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW00_xTQHubL4_u5BhAA2D3PzmqD0fYT3Rfg&usqp=CAU','Digree','2021','.Net Development,NodeJS','Quality Assurance,Dev Ops',11),(2,'In publishing and graphic design, Lorem ipsum is a placeholder text commonly ','https://github.com/','https://lk.linkedin.com/','https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80','Digree','2021','English, Programming,C#,JAVA','Quality Assurance,Dev Ops,Software Development',10),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14),(6,'Android & iOS developer at Vezuel Tech','','','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fprofile_images%2F963070080v?alt=media&token=f4a3cd9e-b1ba-4f23-8c73-b63948b37639','Bachelor\'s Degree','2021','NodeJS,iOS (Swift),Android (Java)','Quality Assurance,Data Scientist,Software Development',15),(7,'I am a hardworking and honest individual, always willing to learn new skills. I can work well as an individual, also in a team environment. ','https://github.com/ImashaHansini','','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fprofile_images%2F945591617v?alt=media&token=2c052f52-abf6-46e7-a7cb-c2562faa94e0','Honours Degree','2021','Business Analysis','Data Scientist,Dev Ops,Business Analyst,Project Manager,Data Entry,Quality Assurance,Software Development,Graphics Designer,Implementation,Tech Lead,Software Architect',16),(8,'',NULL,NULL,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fprofile_images%2F960390067v?alt=media&token=e5a1a0a0-6b02-49b6-b4a5-35dd1fad2806','Bachelor\'s Degree','2019','Quality Assurance,Skills-2,.Net Development,Android (Java),iOS (Swift),Business Analysis,NodeJS,React Native,Test Automation','Quality Assurance,Dev Ops,Project Manager,Data Scientist,Software Development,Business Analyst,Graphics Designer,Data Entry,Implementation,Tech Lead,Software Architect',17),(9,'test',NULL,NULL,NULL,'National Diploma','2014','NodeJS','Software Development,Dev Ops',18),(10,'Hi, This is my profile.',NULL,NULL,'https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/student%2Fprofile_images%2F952981846v?alt=media&token=a4c9b742-9262-4d3b-9b24-e5544f3ba8c3','Bachelor\'s Degree','2018','Quality Assurance,Angular,Android (Java),iOS (Swift),React Native','Quality Assurance,Software Development,Graphics Designer,Tech Lead,Software Architect,Dev Ops,Data Scientist,Business Analyst,Project Manager,Data Entry,Implementation',19),(11,'',NULL,NULL,NULL,'National Diploma','2011','Android (Java),.Net Development,iOS (Swift),Business Analysis,NodeJS,React Native,Test Automation,Angular,Quality Assurance','Dev Ops,Software Development',20),(12,'',NULL,NULL,NULL,'Bachelor\'s Degree','2021','Android (Java),NodeJS,Business Analysis','Dev Ops,Graphics Designer,Project Manager',21);
/*!40000 ALTER TABLE `studentdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 12:49:53
