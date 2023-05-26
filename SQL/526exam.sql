-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: exam_system
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `paper_answers`
--

DROP TABLE IF EXISTS `paper_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_answers` (
  `paper_answer_id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '答案内容',
  `is_correct` tinyint(1) NOT NULL COMMENT '是否正确',
  `student_paper_id` int NOT NULL COMMENT '学生考试记录编号',
  `question_id` int NOT NULL COMMENT '试题编号',
  `paper_id` int NOT NULL COMMENT '试卷id',
  PRIMARY KEY (`paper_answer_id`),
  KEY `paper_answers_questions_id_fk` (`question_id`),
  KEY `paper_answers_student_papers_id_fk` (`student_paper_id`),
  CONSTRAINT `paper_answers_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `paper_answers_student_papers_id_fk` FOREIGN KEY (`student_paper_id`) REFERENCES `student_papers` (`student_paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_answers`
--

LOCK TABLES `paper_answers` WRITE;
/*!40000 ALTER TABLE `paper_answers` DISABLE KEYS */;
INSERT INTO `paper_answers` VALUES (24,'2023-05-26 09:40:35','2023-05-26 09:40:35','260',1,298,71,49),(25,'2023-05-26 09:40:35','2023-05-26 09:40:35','282,285,286',1,298,76,49),(26,'2023-05-26 09:40:35','2023-05-26 09:40:35','电子电气',1,298,82,49),(27,'2023-05-26 09:40:35','2023-05-26 09:40:35','正确',1,298,83,49),(28,'2023-05-26 09:40:35','2023-05-26 09:40:35','270',1,298,73,49),(29,'2023-05-26 09:42:08','2023-05-26 09:42:08','260',1,303,71,49),(30,'2023-05-26 09:42:08','2023-05-26 09:42:08','282,285',0,303,76,49),(31,'2023-05-26 09:42:08','2023-05-26 09:42:08','电子电气',1,303,82,49),(32,'2023-05-26 09:42:08','2023-05-26 09:42:08','错误',0,303,83,49),(33,'2023-05-26 09:42:08','2023-05-26 09:42:08','270',1,303,73,49),(34,'2023-05-26 09:44:59','2023-05-26 09:44:59','260',0,297,71,49),(35,'2023-05-26 09:44:59','2023-05-26 09:44:59','282,285,286',1,297,76,49),(36,'2023-05-26 09:44:59','2023-05-26 09:44:59','SUES',0,297,82,49),(37,'2023-05-26 09:44:59','2023-05-26 09:44:59','正确',1,297,83,49),(38,'2023-05-26 09:44:59','2023-05-26 09:44:59','270',1,297,73,49),(39,'2023-05-26 09:46:29','2023-05-26 09:46:29','260',1,389,71,50),(40,'2023-05-26 09:46:29','2023-05-26 09:46:29','SUES',0,389,82,50),(41,'2023-05-26 09:46:29','2023-05-26 09:46:29','SUES',1,389,79,50),(42,'2023-05-26 09:46:29','2023-05-26 09:46:29','289,292',1,389,77,50),(43,'2023-05-26 09:46:29','2023-05-26 09:46:29','276',0,389,74,50),(44,'2023-05-26 09:46:29','2023-05-26 09:46:29','正确',1,389,85,50),(45,'2023-05-26 09:46:29','2023-05-26 09:46:29','正确',0,389,87,50),(46,'2023-05-26 13:35:32','2023-05-26 13:35:32','261',0,301,71,49),(47,'2023-05-26 13:35:32','2023-05-26 13:35:32','284,285',0,301,76,49),(48,'2023-05-26 13:35:32','2023-05-26 13:35:32','SUES',0,301,82,49),(49,'2023-05-26 13:35:33','2023-05-26 13:35:33','正确',1,301,83,49),(50,'2023-05-26 13:35:33','2023-05-26 13:35:33','270',1,301,73,49);
/*!40000 ALTER TABLE `paper_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_questions`
--

DROP TABLE IF EXISTS `paper_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_questions` (
  `paper_question_id` int NOT NULL AUTO_INCREMENT,
  `paper_id` int NOT NULL COMMENT '试卷编号',
  `question_id` int NOT NULL COMMENT '试题编号',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`paper_question_id`),
  KEY `paperId` (`paper_id`),
  KEY `questionId` (`question_id`),
  CONSTRAINT `paper_questions_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `papers` (`paper_id`),
  CONSTRAINT `paper_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_questions`
--

LOCK TABLES `paper_questions` WRITE;
/*!40000 ALTER TABLE `paper_questions` DISABLE KEYS */;
INSERT INTO `paper_questions` VALUES (43,49,71,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(44,49,76,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(45,49,82,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(46,49,83,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(47,49,73,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(48,50,71,'2023-05-26 09:39:38','2023-05-26 09:39:38'),(49,50,82,'2023-05-26 09:39:38','2023-05-26 09:39:38'),(50,50,79,'2023-05-26 09:39:38','2023-05-26 09:39:38'),(51,50,77,'2023-05-26 09:39:38','2023-05-26 09:39:38'),(52,50,74,'2023-05-26 09:39:38','2023-05-26 09:39:38'),(53,50,85,'2023-05-26 09:39:38','2023-05-26 09:39:38'),(54,50,87,'2023-05-26 09:39:38','2023-05-26 09:39:38');
/*!40000 ALTER TABLE `paper_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papers` (
  `paper_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL COMMENT '教师编号',
  `paper_name` varchar(30) NOT NULL COMMENT '试卷名称',
  `total_score` int NOT NULL COMMENT '试卷总分',
  `start_time` datetime NOT NULL COMMENT '试卷开始时间',
  `end_time` datetime NOT NULL COMMENT '试卷结束时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`paper_id`),
  KEY `teacherId` (`teacher_id`),
  CONSTRAINT `papers_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES (49,181,'考试1',25,'2023-05-26 09:00:00','2023-05-26 10:00:00','2023-05-26 09:39:06','2023-05-26 09:39:06'),(50,181,'考试吕',35,'2023-05-26 09:00:00','2023-05-26 10:00:00','2023-05-26 09:39:38','2023-05-26 09:39:38');
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_options`
--

DROP TABLE IF EXISTS `question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_options` (
  `question_option_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL COMMENT '试题编号',
  `content` varchar(1000) NOT NULL COMMENT '选项内容',
  `is_correct` tinyint(1) NOT NULL COMMENT '是否正确',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`question_option_id`),
  KEY `questionId` (`question_id`),
  CONSTRAINT `question_options_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_options`
--

LOCK TABLES `question_options` WRITE;
/*!40000 ALTER TABLE `question_options` DISABLE KEYS */;
INSERT INTO `question_options` VALUES (260,71,'A',1,'2023-05-26 09:35:15','2023-05-26 09:35:15'),(261,71,'B',0,'2023-05-26 09:35:15','2023-05-26 09:35:15'),(262,71,'C',0,'2023-05-26 09:35:15','2023-05-26 09:35:15'),(263,71,'D',0,'2023-05-26 09:35:15','2023-05-26 09:35:15'),(264,72,'A',0,'2023-05-26 09:35:25','2023-05-26 09:35:25'),(265,72,'B',1,'2023-05-26 09:35:25','2023-05-26 09:35:25'),(266,72,'C',0,'2023-05-26 09:35:25','2023-05-26 09:35:25'),(267,72,'D',0,'2023-05-26 09:35:25','2023-05-26 09:35:25'),(268,73,'A',0,'2023-05-26 09:35:32','2023-05-26 09:35:32'),(269,73,'B',0,'2023-05-26 09:35:32','2023-05-26 09:35:32'),(270,73,'C',1,'2023-05-26 09:35:32','2023-05-26 09:35:32'),(271,73,'D',0,'2023-05-26 09:35:32','2023-05-26 09:35:32'),(272,74,'A',0,'2023-05-26 09:35:43','2023-05-26 09:35:43'),(273,74,'B',0,'2023-05-26 09:35:43','2023-05-26 09:35:43'),(274,74,'C',0,'2023-05-26 09:35:43','2023-05-26 09:35:43'),(275,74,'D',0,'2023-05-26 09:35:43','2023-05-26 09:35:43'),(276,74,'E',1,'2023-05-26 09:35:43','2023-05-26 09:35:43'),(277,75,'A',1,'2023-05-26 09:35:57','2023-05-26 09:35:57'),(278,75,'B',0,'2023-05-26 09:35:57','2023-05-26 09:35:57'),(279,75,'C',1,'2023-05-26 09:35:57','2023-05-26 09:35:57'),(280,75,'D',0,'2023-05-26 09:35:57','2023-05-26 09:35:57'),(281,75,'E',0,'2023-05-26 09:35:57','2023-05-26 09:35:57'),(282,76,'A',1,'2023-05-26 09:36:07','2023-05-26 09:36:07'),(283,76,'B',0,'2023-05-26 09:36:07','2023-05-26 09:36:07'),(284,76,'C',0,'2023-05-26 09:36:07','2023-05-26 09:36:07'),(285,76,'D',1,'2023-05-26 09:36:07','2023-05-26 09:36:07'),(286,76,'E',1,'2023-05-26 09:36:07','2023-05-26 09:36:07'),(287,77,'A',0,'2023-05-26 09:36:22','2023-05-26 09:36:22'),(288,77,'B',0,'2023-05-26 09:36:22','2023-05-26 09:36:22'),(289,77,'C',1,'2023-05-26 09:36:22','2023-05-26 09:36:22'),(290,77,'D',0,'2023-05-26 09:36:22','2023-05-26 09:36:22'),(291,77,'E',0,'2023-05-26 09:36:22','2023-05-26 09:36:22'),(292,77,'F',1,'2023-05-26 09:36:22','2023-05-26 09:36:22'),(293,78,'A',0,'2023-05-26 09:36:38','2023-05-26 09:36:38'),(294,78,'B',1,'2023-05-26 09:36:38','2023-05-26 09:36:38'),(295,78,'C',0,'2023-05-26 09:36:38','2023-05-26 09:36:38'),(296,78,'D',1,'2023-05-26 09:36:38','2023-05-26 09:36:38'),(297,78,'E',0,'2023-05-26 09:36:38','2023-05-26 09:36:38'),(298,78,'F',0,'2023-05-26 09:36:38','2023-05-26 09:36:38'),(299,79,'SUES',1,'2023-05-26 09:36:50','2023-05-26 09:36:50'),(300,80,'数据',1,'2023-05-26 09:36:59','2023-05-26 09:36:59'),(301,81,'微博',1,'2023-05-26 09:37:06','2023-05-26 09:37:06'),(302,82,'电子电气',1,'2023-05-26 09:37:19','2023-05-26 09:37:19'),(303,83,'正确',1,'2023-05-26 09:37:34','2023-05-26 09:37:34'),(304,83,'错误',0,'2023-05-26 09:37:34','2023-05-26 09:37:34'),(305,84,'正确',1,'2023-05-26 09:37:38','2023-05-26 09:37:38'),(306,84,'错误',0,'2023-05-26 09:37:38','2023-05-26 09:37:38'),(307,85,'正确',1,'2023-05-26 09:37:41','2023-05-26 09:37:41'),(308,85,'错误',0,'2023-05-26 09:37:41','2023-05-26 09:37:41'),(309,86,'正确',0,'2023-05-26 09:38:16','2023-05-26 09:38:16'),(310,86,'错误',1,'2023-05-26 09:38:16','2023-05-26 09:38:16'),(311,87,'正确',0,'2023-05-26 09:38:19','2023-05-26 09:38:19'),(312,87,'错误',1,'2023-05-26 09:38:19','2023-05-26 09:38:19'),(313,88,'正确',0,'2023-05-26 09:38:22','2023-05-26 09:38:22'),(314,88,'错误',1,'2023-05-26 09:38:22','2023-05-26 09:38:22');
/*!40000 ALTER TABLE `question_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL COMMENT '试题类型, 0: 单选题, 1: 多选题, 2: 判断题, 3: 填空题, 4: 简答题',
  `content` varchar(1000) NOT NULL COMMENT '试题内容',
  `score` int NOT NULL COMMENT '分值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (71,0,'答案A',5,'2023-05-26 09:35:15','2023-05-26 09:35:15'),(72,0,'答案B',5,'2023-05-26 09:35:25','2023-05-26 09:35:25'),(73,0,'答案C',5,'2023-05-26 09:35:32','2023-05-26 09:35:32'),(74,0,'答案E',5,'2023-05-26 09:35:43','2023-05-26 09:35:43'),(75,1,'答案AC',5,'2023-05-26 09:35:57','2023-05-26 09:35:57'),(76,1,'答案ADE',5,'2023-05-26 09:36:07','2023-05-26 09:36:07'),(77,1,'答案CF',5,'2023-05-26 09:36:22','2023-05-26 09:36:22'),(78,1,'答案BD',5,'2023-05-26 09:36:38','2023-05-26 09:36:38'),(79,2,'答案SUES',5,'2023-05-26 09:36:50','2023-05-26 09:36:50'),(80,2,'答案数据',5,'2023-05-26 09:36:59','2023-05-26 09:36:59'),(81,2,'答案微博',5,'2023-05-26 09:37:06','2023-05-26 09:37:06'),(82,2,'答案电子电气',5,'2023-05-26 09:37:19','2023-05-26 09:37:19'),(83,3,'答案正确',5,'2023-05-26 09:37:34','2023-05-26 09:37:34'),(84,3,'答案正确',5,'2023-05-26 09:37:38','2023-05-26 09:37:38'),(85,3,'答案正确',5,'2023-05-26 09:37:41','2023-05-26 09:37:41'),(86,3,'答案错误',5,'2023-05-26 09:38:16','2023-05-26 09:38:16'),(87,3,'答案错误',5,'2023-05-26 09:38:19','2023-05-26 09:38:19'),(88,3,'答案错误',5,'2023-05-26 09:38:22','2023-05-26 09:38:22');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_papers`
--

DROP TABLE IF EXISTS `student_papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_papers` (
  `student_paper_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL COMMENT '学生编号',
  `paper_id` int NOT NULL COMMENT '试卷编号',
  `score` int DEFAULT NULL COMMENT '得分',
  `answer_time` datetime DEFAULT NULL COMMENT '答题时间',
  `submit_time` datetime DEFAULT NULL COMMENT '交卷时间',
  `status` int DEFAULT NULL COMMENT '状态, 0: 未开始, 1: 进行中, 2: 已结束',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`student_paper_id`),
  KEY `studentId` (`student_id`),
  KEY `paperId` (`paper_id`),
  CONSTRAINT `student_papers_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `student_papers_ibfk_2` FOREIGN KEY (`paper_id`) REFERENCES `papers` (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_papers`
--

LOCK TABLES `student_papers` WRITE;
/*!40000 ALTER TABLE `student_papers` DISABLE KEYS */;
INSERT INTO `student_papers` VALUES (297,180,49,15,'2023-05-26 09:44:36','2023-05-26 09:44:59',1,'2023-05-26 09:39:06','2023-05-26 09:44:59'),(298,182,49,25,'2023-05-26 13:28:53','2023-05-26 09:40:35',1,'2023-05-26 09:39:06','2023-05-26 13:28:53'),(299,183,49,NULL,'2023-05-26 13:27:50',NULL,NULL,'2023-05-26 09:39:06','2023-05-26 13:27:50'),(300,190,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(301,191,49,10,'2023-05-26 13:38:45','2023-05-26 13:35:33',1,'2023-05-26 09:39:06','2023-05-26 13:38:45'),(302,192,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(303,193,49,15,'2023-05-26 13:29:10','2023-05-26 09:42:08',1,'2023-05-26 09:39:06','2023-05-26 13:29:10'),(304,194,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(305,195,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(306,196,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(307,197,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(308,198,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(309,199,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(310,200,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(311,201,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(312,202,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(313,203,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(314,204,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(315,205,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(316,206,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(317,207,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(318,208,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(319,209,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(320,210,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(321,211,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(322,212,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(323,213,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(324,214,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(325,215,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(326,216,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(327,217,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(328,218,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(329,219,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(330,220,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(331,221,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(332,222,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(333,223,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(334,224,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(335,225,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(336,226,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(337,227,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(338,228,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(339,229,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(340,230,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(341,231,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(342,232,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(343,233,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(344,234,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(345,235,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(346,236,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(347,237,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(348,238,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(349,239,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(350,240,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(351,241,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(352,242,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(353,243,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(354,244,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(355,245,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(356,246,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(357,247,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(358,248,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(359,249,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(360,250,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(361,251,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(362,252,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(363,253,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(364,254,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(365,255,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(366,256,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(367,257,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(368,258,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(369,259,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(370,260,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(371,261,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(372,262,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(373,263,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(374,264,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(375,265,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(376,266,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(377,267,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(378,268,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(379,269,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(380,270,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(381,271,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(382,272,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(383,273,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(384,274,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(385,275,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(386,276,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(387,277,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(388,278,49,NULL,NULL,NULL,NULL,'2023-05-26 09:39:06','2023-05-26 09:39:06'),(389,180,50,20,'2023-05-26 09:45:59','2023-05-26 09:46:29',1,'2023-05-26 09:39:38','2023-05-26 09:46:29');
/*!40000 ALTER TABLE `student_papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_students`
--

DROP TABLE IF EXISTS `teacher_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_students` (
  `teacher_student_id` int NOT NULL AUTO_INCREMENT,
  `teacherId` int NOT NULL COMMENT '教师编号',
  `studentId` int NOT NULL COMMENT '学生编号',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`teacher_student_id`),
  KEY `teacherId` (`teacherId`),
  KEY `studentId` (`studentId`),
  CONSTRAINT `teacher_students_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `users` (`user_id`),
  CONSTRAINT `teacher_students_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='教师学生关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_students`
--

LOCK TABLES `teacher_students` WRITE;
/*!40000 ALTER TABLE `teacher_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `no` bigint NOT NULL COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `age` bigint NOT NULL COMMENT '年龄',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `permission` int NOT NULL COMMENT '权限, 0: 管理员, 1: 老师, 2: 学生',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (179,1,'羊水tanh',20,'nascetur.ridiculus@hotmail.net','885922',1,'2023-05-25 18:33:03','2023-05-25 13:20:12'),(180,2,'吕坚诚',15,'senectus.et.netus@hotmail.ca','80722',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(181,3,'运寻梅',21,'mauris.molestie.pharetra@google.com','209670',1,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(182,4,'百里心远',15,'nec.ante@hotmail.ca','222500',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(183,5,'买寄灵',24,'elit.sed@google.ca','380609',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(184,6,'空智志',16,'nunc.lectus@outlook.org','717109',1,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(185,7,'书依心',15,'sodales.at@outlook.ca','89990',0,'2023-05-25 18:33:03','2023-05-25 13:22:22'),(186,8,'闫孤兰',26,'tellus.imperdiet@aol.ca','339733',1,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(187,9,'戏芳洲',24,'vitae@outlook.couk','633308',1,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(188,10,'麴起运',20,'aliquam.erat@outlook.org','699179',1,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(189,11,'凤香梅',24,'pellentesque@hotmail.edu','123456',1,'2023-05-25 18:33:03','2023-05-26 00:40:35'),(190,12,'甄涵韵',23,'ipsum.dolor@yahoo.org','785416',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(191,13,'尤琳',18,'phasellus.vitae.mauris@google.net','644928',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(192,14,'黄芷波',21,'adipiscing@google.couk','551033',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(193,15,'荀凝安',16,'dui.nec@icloud.couk','221876',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(194,16,'褒虹雨',17,'congue@hotmail.org','873847',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(195,17,'仲孙玟玉',16,'dapibus@icloud.edu','530843',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(196,18,'平乐珍',20,'mus.proin@yahoo.edu','720580',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(197,19,'王逸馨',21,'augue.eu@icloud.couk','325554',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(198,20,'夕乐语',20,'ac@protonmail.org','723964',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(199,21,'查昱',25,'faucibus@aol.ca','245724',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(200,22,'骑晴霞',17,'malesuada@outlook.net','435782',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(201,23,'廉振华',16,'vulputate.nisi.sem@aol.couk','193504',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(202,24,'滕兴旺',16,'odio.vel.est@outlook.ca','767338',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(203,25,'巢怿',17,'ut.nulla.cras@google.couk','637125',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(204,26,'文琼华',19,'non.nisi@yahoo.edu','228004',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(205,27,'堂星晴',22,'felis.nulla@aol.ca','923337',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(206,28,'牛俊英',20,'mauris@protonmail.couk','811428',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(207,29,'梅宏才',20,'dui.augue@protonmail.net','196248',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(208,30,'方天纵',18,'facilisis.lorem@protonmail.couk','394290',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(209,31,'礼飞',22,'nascetur@icloud.couk','665025',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(210,32,'俎承弼',25,'turpis.nulla.aliquet@yahoo.net','906356',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(211,33,'相迎蓉',16,'ac.sem@protonmail.couk','828791',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(212,34,'佛俊捷',23,'arcu.nunc@aol.edu','5160',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(213,35,'叔蔚',22,'natoque.penatibus@icloud.couk','128937',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(214,36,'臧访曼',24,'tempor.diam@aol.org','355392',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(215,37,'颜夏青',15,'et@aol.ca','460224',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(216,38,'典高远',18,'velit@hotmail.couk','178776',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(217,39,'童晴',19,'sagittis.lobortis@aol.ca','439307',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(218,40,'庹恺乐',24,'proin.ultrices.duis@aol.ca','652953',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(219,41,'松清宁',22,'sed.sem@outlook.edu','636301',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(220,42,'百雨凝',21,'volutpat.nulla@protonmail.com','893521',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(221,43,'问波鸿',15,'nulla.dignissim@google.ca','984821',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(222,44,'庚高旻',25,'mus.donec@icloud.org','548435',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(223,45,'勇思敏',24,'ante@hotmail.couk','653811',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(224,46,'清婉丽',23,'nunc.pulvinar@yahoo.ca','635231',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(225,47,'奇娇洁',21,'cras.eu@google.net','477071',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(226,48,'慈雪莲',26,'est@protonmail.org','145304',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(227,49,'千夏兰',19,'penatibus.et@outlook.edu','555338',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(228,50,'许英秀',22,'vitae.diam.proin@protonmail.org','353588',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(229,51,'漆昭',19,'porttitor.interdum@icloud.edu','397142',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(230,52,'检慧艳',20,'magna.lorem.ipsum@google.org','244567',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(231,53,'淡红螺',26,'suspendisse.non@yahoo.ca','481197',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(232,54,'陆郁',17,'imperdiet.ullamcorper@icloud.edu','913292',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(233,55,'盍叶',25,'urna@aol.org','730596',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(234,56,'莫旎',22,'maecenas.iaculis@yahoo.ca','310706',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(235,57,'訾曦之',19,'a.feugiat.tellus@yahoo.edu','55104',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(236,58,'霍其',18,'nunc.mauris@yahoo.com','33652',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(237,59,'殳明旭',17,'vulputate.eu@aol.ca','510295',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(238,60,'进冬梅',26,'morbi.tristique@aol.net','877168',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(239,61,'葛英飙',21,'gravida.praesent@protonmail.couk','537881',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(240,62,'硕子珍',22,'mauris.blandit@hotmail.com','349011',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(241,63,'莱兰月',22,'vestibulum.ante@outlook.ca','546644',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(242,64,'恭正业',20,'quis.tristique@outlook.couk','296507',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(243,65,'库曼雁',15,'lobortis.class@google.couk','742905',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(244,66,'牵海瑶',15,'a.magna@icloud.net','735129',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(245,67,'国滨海',18,'donec@hotmail.com','298575',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(246,68,'不梦雨',19,'aptent.taciti@protonmail.org','182254',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(247,69,'亓玄清',15,'magnis@outlook.edu','306215',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(248,70,'却哲',18,'auctor.vitae@yahoo.com','940173',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(249,71,'六嘉悦',18,'egestas.ligula.nullam@hotmail.edu','860788',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(250,72,'华山雁',17,'amet.consectetuer.adipiscing@icloud.net','468085',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(251,73,'益莞尔',17,'lectus.pede@outlook.com','384496',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(252,74,'阎逸云',23,'urna.et@yahoo.ca','55339',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(253,75,'环三春',26,'eget@aol.edu','555022',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(254,76,'励曼青',22,'risus.duis@icloud.ca','805618',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(255,77,'后俏丽',18,'tristique.senectus@hotmail.ca','780923',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(256,78,'常天赋',23,'metus@google.org','191797',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(257,79,'殷江雪',19,'ornare.elit@icloud.org','973756',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(258,80,'雀元白',18,'ridiculus.mus.donec@hotmail.edu','494844',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(259,81,'倪云岚',15,'praesent.luctus.curabitur@outlook.ca','298359',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(260,82,'屠元驹',15,'vivamus.non.lorem@google.com','469729',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(261,83,'甘建德',20,'ridiculus.mus@google.net','280358',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(262,84,'余平文',22,'ac.nulla@yahoo.couk','606341',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(263,85,'九丽雅',18,'netus.et@yahoo.org','44164',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(264,86,'雪阳夏',17,'id.mollis@yahoo.ca','264771',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(265,87,'马佳以南',15,'metus.facilisis@google.net','728701',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(266,88,'诸葛锐精',22,'nulla.eu@icloud.edu','79167',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(267,89,'刀昌燎',22,'sociis@google.com','49199',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(268,90,'戴雁露',22,'risus.donec.egestas@hotmail.edu','183014',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(269,91,'皮淑慧',18,'nunc.ut@hotmail.edu','429264',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(270,92,'寸悦来',17,'eu.sem@aol.couk','859072',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(271,93,'抄宛筠',16,'ridiculus.mus@icloud.com','133979',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(272,94,'望莞',19,'vitae.purus.gravida@protonmail.com','963275',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(273,95,'浑奇迈',25,'vitae.diam@google.ca','342977',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(274,96,'焉嘉歆',22,'iaculis.quis.pede@outlook.com','429411',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(275,97,'郸弘盛',19,'et.ipsum@aol.net','840679',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(276,98,'隗柔静',21,'amet.faucibus@hotmail.edu','392950',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(277,99,'吾合',25,'sit.amet@protonmail.com','231373',2,'2023-05-25 18:33:03','2023-05-25 18:33:03'),(278,100,'舒和蔼',23,'sapien@yahoo.com','8095',2,'2023-05-25 18:33:03','2023-05-25 18:33:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26 14:15:21
