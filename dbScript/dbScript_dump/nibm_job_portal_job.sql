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
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Position` longtext,
  `JobCategoryId` int(11) NOT NULL,
  `Description` longtext,
  `jobFlyer` longtext,
  `CompanyId` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `posted_date` datetime(6) DEFAULT NULL,
  `ClosingDate` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Job_CompanyId` (`CompanyId`),
  KEY `IX_Job_JobCategoryId` (`JobCategoryId`),
  CONSTRAINT `FK_Job_Company_CompanyId` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Job_JobCategory_JobCategoryId` FOREIGN KEY (`JobCategoryId`) REFERENCES `jobcategory` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Data Science (Intern)',2,'Immediate data scientist required. Contact through 99xtech@99developers.lk','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fhiring-flyer-template-design-bfe078dccefd5c23224c815fb9a01a39_screen.jpg?alt=media&token=e6fd2ba0-c3e8-40e1-9b57-722d497fe0e9',3,0,'2021-10-05 00:00:00.000000','2021-10-29 00:00:00.000000'),(2,'Quality Assurance (Intern)',1,'Intern Quality assurance required.','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fjob-vacancy-flyer-design-template-38fb1ae9efdf1222e622249ab91a98bc_screen.jpg?alt=media&token=85a02764-c8f9-4e41-9320-eaf77f8443dc',3,0,'2021-10-05 00:00:00.000000','2021-10-30 00:00:00.000000'),(3,'Trainee Software Engineer',3,'Trainee Software Engineer is required.','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2FJob-Vacancy-Flyer-psd-template.jpg?alt=media&token=1441e8e3-6299-4f46-8a88-41f14a0ea0eb',3,0,'2021-10-05 00:00:00.000000','2021-10-26 00:00:00.000000'),(4,'Project Manager',6,'Project manager is required with a at least 5 years of experience.','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2F180a8bac148c8dc42a16858e43f18870.jpg?alt=media&token=0ffa05a3-b621-4f27-b995-37d213dc17e7',3,0,'2021-10-05 00:00:00.000000','2021-10-27 00:00:00.000000'),(5,'Associate Technical Lead',10,'Associate technical lead is required with at least 3 years of experience','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2F90c7a6b46a35e461e63d4ca4bd2dbc82.jpg?alt=media&token=b039b965-1b0e-4549-aed0-521812acbced',3,0,'2021-10-05 00:00:00.000000','2021-10-23 00:00:00.000000'),(6,'Senior',1,'A Quality Assurance persons are responsible for ensuring that products and services meet the established standards set by the company.','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fbusiness-flyer-template_52683-4095.jpg?alt=media&token=9caebe2f-ddf5-41a8-a107-2ec4df0025a3',2,1,'2021-10-05 00:00:00.000000','2021-10-21 00:00:00.000000'),(7,'Test',2,'Test','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fdsad.jpg?alt=media&token=1dad90ef-7a6e-4789-a772-5f3117b429f2',5,0,'2021-10-06 00:00:00.000000','2021-10-27 00:00:00.000000'),(8,'Software Engineer',3,'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.           ','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fdsad.jpg?alt=media&token=0e1fe720-c999-4e93-bc53-33535378d906',5,0,'2021-10-06 00:00:00.000000','2021-10-20 00:00:00.000000'),(9,'Dev Ops Engineer',4,'Test','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fdsad.jpg?alt=media&token=583d2160-5dec-462f-9d2b-f60e8f9fd725',5,0,'2021-10-06 00:00:00.000000','2021-10-20 00:00:00.000000'),(10,'QA Engineer',1,'QA Engineer','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fdsad.jpg?alt=media&token=b2ab8087-2286-46f3-abe6-956be13bd900',6,0,'2021-10-06 00:00:00.000000','2021-10-28 00:00:00.000000'),(11,'Data Entry Operator',8,'Data Entry Operator','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fdsad.jpg?alt=media&token=c835b2df-eba3-41e1-b861-44114c9b40b2',6,0,'2021-10-06 00:00:00.000000','2021-10-28 00:00:00.000000'),(12,'Intern',7,'Intern','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fdsad.jpg?alt=media&token=f566bfb4-9460-4425-a1d8-c92af5d9d62f',7,0,'2021-10-06 00:00:00.000000','2021-10-27 00:00:00.000000'),(13,'Intern BA',5,'Intern BA','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fdsad.jpg?alt=media&token=7089c0ca-8292-41a4-a445-7772ee9fa9d4',7,0,'2021-10-06 00:00:00.000000','2021-10-31 00:00:00.000000'),(14,'Intern',1,NULL,NULL,2,1,'2021-10-07 00:00:00.000000','2021-10-20 00:00:00.000000'),(15,'Intern',3,'Software Engineer Intern is someone who is responsible for contributing to software design and software development. Software Engineer Intern collaborates with other team members in creating secure and reliable software solutions.','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fbusiness-flyer-template_52683-4095.jpg?alt=media&token=d9b874ca-d72e-4b59-88f1-3043b00efde3',2,0,'2021-10-07 00:00:00.000000','2021-10-21 00:00:00.000000'),(16,'Intern',5,'sccscscs','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fbusiness-flyer-template_52683-4095.jpg?alt=media&token=6076fce6-f486-4b5d-bd17-cc0664dee432',11,0,'2021-10-09 00:00:00.000000','2021-10-21 00:00:00.000000'),(17,'Intern',1,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2FUser%20login.txt?alt=media&token=2fb1b80b-15f4-421b-a622-53ecf78d88ab',12,2,'2021-10-09 00:00:00.000000','2021-10-19 00:00:00.000000'),(18,'Associate Software Engineer',3,'Pearson is the world’s leading learning company, with 40,000 employees in more than 80 countries working to help people of all ages to make measurable progress in their lives through learning. With revenues over €5.2 billion in 2013 we provide learning materials, technologies, assessments and services to teachers and students in order to help people everywhere aim higher and fulﬁll their true potential. We put the learner at the center of everything we do..','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fbusiness-flyer-template_52683-4095.jpg?alt=media&token=94af01e9-7cb3-4d58-9205-35f230f09990',2,0,'2021-10-12 00:00:00.000000','2021-10-20 00:00:00.000000'),(19,'Senior',5,'hhrhrgrggegeg','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fbusiness-flyer-template_52683-4095.jpg?alt=media&token=f0df527a-bcd2-42b4-91f7-bc815f32601c',2,1,'2021-10-12 00:00:00.000000','2021-10-22 00:00:00.000000'),(20,'Quality Assurance Intern',1,'Get to know the job intimately that you\'re applying for. Don\'t just read the job description - study it and picture yourself performing every task required of you. When you interview, framing your responses so that you reveal your significant knowledge about the job gives you a massive advantage.\r\n','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fjob%20flyer%204.jpg?alt=media&token=0386a613-fc2b-4d4c-89d5-608961b17e84',4,0,'2021-10-13 00:00:00.000000','2021-11-01 00:00:00.000000'),(21,'Data Scientist Intern',2,'Get to know the job intimately that you\'re applying for. Don\'t just read the job description - study it and picture yourself performing every task required of you. When you interview, framing your responses so that you reveal your significant knowledge about the job gives you a massive advantage.\r\n','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fjob%20flyer%203.jpg?alt=media&token=c321be76-448f-419f-bb3d-b1510726bf65',4,0,'2021-10-13 00:00:00.000000','2021-11-01 00:00:00.000000'),(22,'DevOps Engineer ',4,'Get to know the job intimately that you\'re applying for. Don\'t just read the job description - study it and picture yourself performing every task required of you. When you interview, framing your responses so that you reveal your significant knowledge about the job gives you a massive advantage.','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fjob%20flyer%206.jpg?alt=media&token=b0774e54-eab8-4941-94e2-db706478920f',4,0,'2021-10-13 00:00:00.000000','2021-11-01 00:00:00.000000'),(23,'Associate Business Analyst',5,'Get to know the job intimately that you\'re applying for. Don\'t just read the job description - study it and picture yourself performing every task required of you. When you interview, framing your responses so that you reveal your significant knowledge about the job gives you a massive advantage.','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fjob%20flyer%208.jpg?alt=media&token=0c9b0543-35b7-4b03-9082-87c2042f899e',4,0,'2021-10-13 00:00:00.000000','2021-11-01 00:00:00.000000'),(24,'Graphic Designer',7,'Get to know the job intimately that you\'re applying for. Don\'t just read the job description - study it and picture yourself performing every task required of you. When you interview, framing your responses so that you reveal your significant knowledge about the job gives you a massive advantage.','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fjob%20flyer%207.jpg?alt=media&token=e8196d92-292f-49d9-82ed-6204fecc6e02',4,0,'2021-10-13 00:00:00.000000','2021-11-01 00:00:00.000000'),(25,'New',4,'fggdgsgsgsgs','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fbusiness-flyer-template_52683-4095.jpg?alt=media&token=c684f4dd-959b-4292-81bf-95f0ef2c2420',2,0,'2021-10-13 00:00:00.000000','2021-10-26 00:00:00.000000'),(26,'data scientist',2,'Data scientist','https://firebasestorage.googleapis.com/v0/b/nibmjobportal.appspot.com/o/company%2Fflyer_images%2Fdsad.jpg?alt=media&token=6179cf0a-132c-485e-beff-7d61d740cd9d',5,0,'2021-10-13 00:00:00.000000','2021-10-28 00:00:00.000000');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 12:50:46