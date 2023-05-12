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
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `student_paper_id` int NOT NULL COMMENT '学生考试记录编号',
  `question_id` int NOT NULL COMMENT '试题编号',
  `answer_id` int NOT NULL COMMENT '试题选项编号',
  PRIMARY KEY (`id`),
  KEY `paper_answers_question_options_id_fk` (`answer_id`),
  KEY `paper_answers_questions_id_fk` (`question_id`),
  KEY `paper_answers_student_papers_id_fk` (`student_paper_id`),
  CONSTRAINT `paper_answers_question_options_id_fk` FOREIGN KEY (`answer_id`) REFERENCES `question_options` (`id`),
  CONSTRAINT `paper_answers_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `paper_answers_student_papers_id_fk` FOREIGN KEY (`student_paper_id`) REFERENCES `student_papers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_answers`
--

LOCK TABLES `paper_answers` WRITE;
/*!40000 ALTER TABLE `paper_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_questions`
--

DROP TABLE IF EXISTS `paper_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` int NOT NULL COMMENT '试卷编号',
  `question_id` int NOT NULL COMMENT '试题编号',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paperId` (`paper_id`),
  KEY `questionId` (`question_id`),
  CONSTRAINT `paper_questions_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `papers` (`id`),
  CONSTRAINT `paper_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_questions`
--

LOCK TABLES `paper_questions` WRITE;
/*!40000 ALTER TABLE `paper_questions` DISABLE KEYS */;
INSERT INTO `paper_questions` VALUES (9,5,41,'2023-05-12 07:46:55','2023-05-12 07:46:55'),(10,5,42,'2023-05-12 07:46:55','2023-05-12 07:46:55');
/*!40000 ALTER TABLE `paper_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL COMMENT '教师编号',
  `paper_name` varchar(30) NOT NULL COMMENT '试卷名称',
  `total_score` int NOT NULL COMMENT '试卷总分',
  `start_time` datetime NOT NULL COMMENT '试卷开始时间',
  `end_time` datetime NOT NULL COMMENT '试卷结束时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacherId` (`teacher_id`),
  CONSTRAINT `papers_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES (5,2,'测试1',5,'2023-05-11 16:00:00','2023-05-11 19:00:00','2023-05-12 07:46:55','2023-05-12 07:46:55');
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_options`
--

DROP TABLE IF EXISTS `question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL COMMENT '试题编号',
  `content` varchar(1000) NOT NULL COMMENT '选项内容',
  `is_correct` tinyint(1) NOT NULL COMMENT '是否正确',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionId` (`question_id`),
  CONSTRAINT `question_options_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_options`
--

LOCK TABLES `question_options` WRITE;
/*!40000 ALTER TABLE `question_options` DISABLE KEYS */;
INSERT INTO `question_options` VALUES (131,40,'选项',0,'2023-05-12 02:46:05','2023-05-12 02:46:05'),(132,40,'选项',1,'2023-05-12 02:46:05','2023-05-12 02:46:05'),(133,40,'选项',0,'2023-05-12 02:46:05','2023-05-12 02:46:05'),(134,42,'1',0,'2023-05-12 05:25:15','2023-05-12 05:25:15'),(135,42,'1',0,'2023-05-12 05:25:15','2023-05-12 05:25:15'),(136,42,'1',1,'2023-05-12 05:25:15','2023-05-12 05:25:15'),(137,42,'1',0,'2023-05-12 05:25:15','2023-05-12 05:25:15'),(140,41,'选项',0,'2023-05-12 05:25:44','2023-05-12 05:25:44'),(141,41,'选项',1,'2023-05-12 05:25:44','2023-05-12 05:25:44'),(142,41,'选项',1,'2023-05-12 05:25:44','2023-05-12 05:25:44');
/*!40000 ALTER TABLE `question_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL COMMENT '试题类型, 0: 单选题, 1: 多选题, 2: 判断题, 3: 填空题, 4: 简答题',
  `content` varchar(1000) NOT NULL COMMENT '试题内容',
  `score` int NOT NULL COMMENT '分值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (40,0,'123132',0,'2023-05-12 02:26:52','2023-05-12 02:46:05'),(41,1,'选择题',5,'2023-05-12 02:46:23','2023-05-12 05:25:44'),(42,0,'111',0,'2023-05-12 05:25:15','2023-05-12 05:25:15');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` bigint NOT NULL COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `age` bigint NOT NULL COMMENT '年龄',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `permission` int NOT NULL COMMENT '权限, 0: 管理员, 1: 老师, 2: 学生',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,'张三',12,'123@qq.com','123456',0,'2023-04-23 08:01:54','2023-04-23 08:01:54'),(2,2,'李四',14,'422@qq.com','123456',1,'2023-04-23 18:45:55','2023-04-23 18:45:55'),(3,3,'王111',12,'133@qq.com','',2,'2023-04-26 14:18:53','2023-05-12 05:28:36'),(4,5,'菜单',17,'555@qq.com','123456',2,'2023-05-05 01:34:51','2023-05-05 01:34:51'),(135,200,'3',5,'232@qq.com','123456',2,'2023-05-12 05:23:39','2023-05-12 05:23:39');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_papers`
--

DROP TABLE IF EXISTS `student_papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_papers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL COMMENT '学生编号',
  `paper_id` int NOT NULL COMMENT '试卷编号',
  `score` int DEFAULT NULL COMMENT '得分',
  `total_score` int DEFAULT NULL COMMENT '总分',
  `answer_time` int DEFAULT NULL COMMENT '答题时间',
  `submit_time` datetime DEFAULT NULL COMMENT '交卷时间',
  `status` int DEFAULT NULL COMMENT '状态, 0: 未开始, 1: 进行中, 2: 已结束',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studentId` (`student_id`),
  KEY `paperId` (`paper_id`),
  CONSTRAINT `student_papers_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `student_papers_ibfk_2` FOREIGN KEY (`paper_id`) REFERENCES `papers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_papers`
--

LOCK TABLES `student_papers` WRITE;
/*!40000 ALTER TABLE `student_papers` DISABLE KEYS */;
INSERT INTO `student_papers` VALUES (3,4,5,NULL,NULL,NULL,NULL,NULL,'2023-05-12 07:46:55','2023-05-12 07:46:55'),(4,3,5,NULL,NULL,NULL,NULL,NULL,'2023-05-12 07:46:55','2023-05-12 07:46:55');
/*!40000 ALTER TABLE `student_papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_students`
--

DROP TABLE IF EXISTS `teacher_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacherId` int NOT NULL COMMENT '教师编号',
  `studentId` int NOT NULL COMMENT '学生编号',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacherId` (`teacherId`),
  KEY `studentId` (`studentId`),
  CONSTRAINT `teacher_students_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `roles` (`id`),
  CONSTRAINT `teacher_students_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='教师学生关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_students`
--

LOCK TABLES `teacher_students` WRITE;
/*!40000 ALTER TABLE `teacher_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-12 16:16:49
