-- MySQL dump 10.13  Distrib 5.5.52, for Win32 (x86)
--
-- Host: localhost    Database: sct
-- ------------------------------------------------------
-- Server version	5.5.52

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cnumber` char(3) NOT NULL,
  `cname` char(12) DEFAULT NULL,
  `chours` int(11) DEFAULT NULL,
  `credit` float(5,1) DEFAULT NULL,
  `csemster` int(11) DEFAULT NULL,
  PRIMARY KEY (`cnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('1','数据库',40,6.0,1),('2','数据结构',40,6.0,3),('3','编译原理',40,6.0,7),('4','C语言',30,4.5,6),('5','高等数学',80,12.0,2),('6','计算机网络',20,3.0,4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc`
--

DROP TABLE IF EXISTS `sc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc` (
  `snumber` char(8) NOT NULL,
  `cnumber` char(3) NOT NULL,
  `score` float(5,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc`
--

LOCK TABLES `sc` WRITE;
/*!40000 ALTER TABLE `sc` DISABLE KEYS */;
INSERT INTO `sc` VALUES ('98030101','1',90.0),('98030101','2',86.0),('98030101','6',62.0),('98030102','2',78.0),('98030102','4',66.0),('98030102','1',82.0),('98030102','5',92.0),('98030102','6',50.0),('98030103','2',68.0),('98030103','6',62.0),('98020101','1',80.0),('98020101','5',95.0),('98020102','5',85.0);
/*!40000 ALTER TABLE `sc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `snumber` char(8) NOT NULL,
  `sname` char(10) NOT NULL,
  `ssex` char(2) DEFAULT NULL,
  `sage` int(11) DEFAULT NULL,
  `dname` char(10) DEFAULT NULL,
  `sclass` char(6) DEFAULT NULL,
  PRIMARY KEY (`snumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('98020101','李三','女',18,'能源','980201'),('98020102','李四','男',19,'能源','980201'),('98030101','张三','男',20,'计算机','980301'),('98030102','张四','女',20,'计算机','980301'),('98030103','张五','男',19,'计算机','980301'),('98040201','王三','男',20,'自动控制','980402'),('98040202','王四','男',21,'自动控制','980402'),('98040203','王五','女',19,'自动控制','980402');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-04 14:18:25
