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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20211003124823_init','5.0.9'),('20211003142024_Added cv docs','5.0.9'),('20211003152041_Added skills and cat','5.0.9'),('20211012145355_Added date for applied date','5.0.9');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `UserType` int(11) NOT NULL,
  `TemporyPassword` longtext,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('1fafe919-4954-451d-81fa-ae20b6976e6c',0,'zkuz2@LC','marshmallow.yongshin@gmail.com','MARSHMALLOW.YONGSHIN@GMAIL.COM','marshmallow.yongshin@gmail.com','MARSHMALLOW.YONGSHIN@GMAIL.COM',0,'AQAAAAEAACcQAAAAEKNt65YjNMw8hCZCvOBy7sNc0R1xhotDYY9iLot0iqoOl7s1eXumhSAexOiNB7vt5g==','B2EP4QQ77HQEZG7N3BZ2VGT2QDI6KJVP','1deeffd2-561c-4774-bc8d-881d3cd55741',NULL,0,0,NULL,1,0),('2b7c8cdc-5e1d-473f-b8c7-52e9b1c60935',0,'nlve3@NQ','nibm1@gmail.com','NIBM1@GMAIL.COM','nibm1@gmail.com','NIBM1@GMAIL.COM',0,'AQAAAAEAACcQAAAAEGIz9wd8STcfTam/EZ3hyI681QjIGn8GuVhAe1p/x5Zm5kRx++U8/X+8matKC7sHgQ==','3MTOTHZ7CPO7SUSLYUOLKQLFGQSTUPXV','85130073-156f-4aed-86b6-4804d3fc4109',NULL,0,0,NULL,1,0),('4e6b982b-818e-4178-bf08-d32642d2c130',0,'ccpe8@HM','icta@gmail.com','ICTA@GMAIL.COM','icta@gmail.com','ICTA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEE46aqtJKSCn83e13zpMMrzG7Ak1lFjAxgtpnE8KfrDkTwHLnqkM7S6AvYeDza//AQ==','64SXO2FMRKSFPHFFV2H6YCDKOTZ3FTSQ','36ee5f60-48f1-40c5-a3e9-4ad683b7567e',NULL,0,0,NULL,1,0),('5ae2fa62-7b98-4e2c-a4bd-9591f66acf79',0,'aycq7@PW','1234@gmail.com','1234@GMAIL.COM','1234@gmail.com','1234@GMAIL.COM',0,'AQAAAAEAACcQAAAAEF264WF+2JY+iSxZQCl+4H+8cUx0MtGKVaoOk1bq4BjdcezRrBYWhbZQhr8FjlgiLw==','EMXW7MTA4AJZ2ISRXA2FH7C5KQWIQLB7','f893c7e3-8173-4f75-9d35-32e96ad7320d',NULL,0,0,NULL,1,0),('6a5a795d-c31e-4591-81b9-d1b70cdb927b',0,'qmzs3@QQ','aaaa@gmail.com','AAAA@GMAIL.COM','aaaa@gmail.com','AAAA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEF1C8Eju70kg19A4cB1xL09hfoBRglLHMxcn/2fHHx+02cM8MAvRd4jAJtMlRk+qsw==','ODJF6L2R35DRB5RPGKLHFDBFKWT5CRB6','b8e7f58a-48d1-4097-8213-2cbbaf38cca6',NULL,0,0,NULL,1,0),('7c979933-57af-4d93-9837-6499cd9cb99b',1,NULL,'admin@gmail.com','ADMIN@GMAIL.COM','admin@gmail.com','ADMIN@GMAIL.COM',0,'AQAAAAEAACcQAAAAEKeRbklJIXFW1JDBjeaJBYrXzGEBF3o13+r2GDJPE4QoaZR+GWIHlkrKHFNBJHdX1w==','ZPFVU4JP6MGQPSL4EXQGB73HSSIGGAFZ','6531d210-e24a-4e9a-860a-be506e0324c6',NULL,0,0,NULL,1,0),('a64a9431-d28c-4cbc-89f9-097862b402ec',0,'ugca1@TJ','dms.info@gmail.com','DMS.INFO@GMAIL.COM','dms.info@gmail.com','DMS.INFO@GMAIL.COM',0,'AQAAAAEAACcQAAAAELjos/nRihjHk+7us+JvQDuZh/MYQjaJzLGAsm3N7jI3X7n+JFeagl/gx/go0+mEeA==','3OCFLPB6BABMJ3C5OYHGRSFAKUZE422Q','6da85c99-8f83-48cb-bc83-a011251df7c4',NULL,0,0,NULL,1,0),('a9dfbdeb-60b0-4fe6-a7b0-b4c2d0f48a66',0,'ybub8@IE','ert@gmail.com','ERT@GMAIL.COM','ert@gmail.com','ERT@GMAIL.COM',0,'AQAAAAEAACcQAAAAEL0TtC98PhNLfZKyHI1uh8IC+bzUP5t3KsZBnK0Pf+gb7HGi5I/+3HeTFNpfDlN4IQ==','TU7LCEKJCABSJ5G2W6KTKUFYBSVXKNWZ','218e097f-171f-47f6-91e0-3686e6324120',NULL,0,0,NULL,1,0),('ab7aa22e-a7a1-418f-bce7-fa8ae175e9e3',0,'bdlf9@CL','hisharadilshan2@gmail.com','HISHARADILSHAN2@GMAIL.COM','hisharadilshan2@gmail.com','HISHARADILSHAN2@GMAIL.COM',0,'AQAAAAEAACcQAAAAEJh3MQNnyGMGWvg4YvvLfbaJcVy/3OO5GbjVI895KWWqJtVM+LMY4yQqMjoigiQQyQ==','FMR7J2SZDA6VEO4PDZSDTDMDLH3EOUDI','96314309-303f-465a-af84-0f628aab751f',NULL,0,0,NULL,1,0),('c07ce0b1-1bc1-4b40-8485-5b6e5170dbd7',0,'gtfs5@WP','rusira986@gmail.com','RUSIRA986@GMAIL.COM','rusira986@gmail.com','RUSIRA986@GMAIL.COM',0,'AQAAAAEAACcQAAAAEMXAMKGBVsw6n4cQYuLEvLxwCST327GIIp1YUvr0Dq80NGA579ofucDzjAUq2wgybg==','53M6WGDGLU4RMQKSXCX7Y4L4A7LHC5PE','4611e2b9-ef5f-4210-8541-8c88b3d43246',NULL,0,0,NULL,1,0),('d9c35517-fbeb-495b-8f7c-711d34efc604',0,'yxms7@ZW','qsd@gmail.com','QSD@GMAIL.COM','qsd@gmail.com','QSD@GMAIL.COM',0,'AQAAAAEAACcQAAAAEMK2ngn5FQ8zMZBdjh/Xtwj1Q/oxnAdtO2XT9Aw8A2ENmfRydrJRmstlFcOl8p8ehw==','TQS3NSBVMUQ6TSLBOLND746GZPU2YMGZ','d528c0d0-3df8-43e5-ae70-322a342b137f',NULL,0,0,NULL,1,0),('e8cb89db-d6d8-4bf8-b16a-b31b4c645e65',0,'hwup6@LA','ashandias.info@gmail.com','ASHANDIAS.INFO@GMAIL.COM','ashandias.info@gmail.com','ASHANDIAS.INFO@GMAIL.COM',0,'AQAAAAEAACcQAAAAEKd/0itvslT0seMAocxgFUXk56vwdWJ1DQK2XALHZfXi59aQs+kwZUvHd9yddJrR1A==','HH3C4CRHNEGP7KAHT6FHEXVQ6A5JTVT7','96c561c2-6a91-4be5-9a4a-b81d41d7d99a',NULL,0,0,NULL,1,0),('faf15ca7-2032-4a60-8b06-4ffea6c16cd1',0,'neyt9@MM','w.l.n.ishara@gmail.com','W.L.N.ISHARA@GMAIL.COM','w.l.n.ishara@gmail.com','W.L.N.ISHARA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEKUt+7dAliJ+iVXFUv8MiqqChZhRcFgbSU9ctscPtcqQ2T9oWlLciKIeamkJI+sUPg==','L4P7QLAWUQKLGWP74X77CM2SRXPFHS2O','c9891228-05eb-40ca-bd1a-1f2db26d0bb3',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(128) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Quality Assurance'),(2,'Data Scientist'),(3,'Software Development'),(4,'Dev Ops'),(5,'Business Analyst'),(6,'Project Manager'),(7,'Graphics Designer'),(8,'Data Entry'),(9,'Implementation'),(10,'Tech Lead'),(11,'Software Architect');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry`
--

LOCK TABLES `industry` WRITE;
/*!40000 ALTER TABLE `industry` DISABLE KEYS */;
INSERT INTO `industry` VALUES (1,'Software'),(2,'HR');
/*!40000 ALTER TABLE `industry` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `jobcategory`
--

DROP TABLE IF EXISTS `jobcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobcategory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobcategory`
--

LOCK TABLES `jobcategory` WRITE;
/*!40000 ALTER TABLE `jobcategory` DISABLE KEYS */;
INSERT INTO `jobcategory` VALUES (1,'Quality Assurance'),(2,'Data Scientist'),(3,'Software Development'),(4,'Dev Ops'),(5,'Business Analyst'),(6,'Project Manager'),(7,'Graphics Designer'),(8,'Data Entry'),(9,'Implementation'),(10,'Tech Lead'),(11,'Software Architect');
/*!40000 ALTER TABLE `jobcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Quality Assurance'),(2,'Angular'),(3,'.Net Development'),(4,'Android (Java)'),(5,'iOS (Swift)'),(6,'Business Analysis'),(7,'NodeJS'),(8,'React Native'),(9,'Test Automation');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nic` longtext,
  `name` longtext,
  `email` longtext,
  `password` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (9,'953060080v','Testing Student 1','student@gmail.com','123456'),(10,'953064080v','Test','test@gmail.com','Abc@123'),(11,'953660080v','Hishara Dilshan','hisharadilshan2@gmail.com','Abc@123'),(12,'953070080v','Imasha Hansini','hish2k15@gmail.com','idmcc3'),(13,'993070080v','Imasha Hansini','imasha@gmail.com','idmcc3'),(14,'9723311154v','testuser','test@gmail.com','test@123'),(15,'963070080v','Hishara Weerasinghe','hish2k15@gmail.com','Abc@123'),(16,'945591617v','Imasha Hansini','imasha.hansini@gmail.com','Ima@123'),(17,'960390067v','Nimesh','nimeshlakshan923@gmail.com','Kzqq1430@'),(18,'973311158v','Fayas','fayas2626@gmail.com','1qazZAQ!'),(19,'952981846v','Rusira Nuwan','rusira986@gmail.com','Aa123456789Bb+'),(20,'980082210v','Maduranga','rusira986@gmail.com','Sathsara@@98'),(21,'950403640v','hasarel','cobsccomp192p-033@student.nibm.lk','1qaz1QAZ@');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2021-10-29 12:47:18
