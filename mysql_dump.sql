-- MySQL dump 10.13  Distrib 5.6.29, for Linux (x86_64)
--
-- Host: localhost    Database: secondhand
-- ------------------------------------------------------
-- Server version	5.6.29

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `addressID` varchar(100) NOT NULL DEFAULT '' COMMENT '主键',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `userName` varchar(100) DEFAULT NULL COMMENT '收件人明',
  `tel` varchar(100) DEFAULT NULL COMMENT '手机号',
  `addressName` varchar(500) DEFAULT NULL COMMENT '简单描述',
  `isdefault` tinyint(1) DEFAULT NULL COMMENT '是否是默认地址',
  `province` varchar(100) DEFAULT NULL COMMENT '省份',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `area` varchar(100) DEFAULT NULL COMMENT '区县',
  `description` varchar(100) DEFAULT NULL COMMENT '详细描述，街道，小区等',
  `zipCode` varchar(100) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`addressID`),
  KEY `userID` (`userID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('',NULL,NULL,NULL,'南京工作地址',1,'江苏','南京','雨花台','张府\r\n园','210000');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminInfo`
--

DROP TABLE IF EXISTS `adminInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminInfo` (
  `adminID` varchar(100) NOT NULL DEFAULT '' COMMENT '管理员ID',
  `adminPW` varchar(100) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminInfo`
--

LOCK TABLES `adminInfo` WRITE;
/*!40000 ALTER TABLE `adminInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allPrices`
--

DROP TABLE IF EXISTS `allPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allPrices` (
  `userID` varchar(100) NOT NULL DEFAULT '' COMMENT '用户ID',
  `recommendPrice` float DEFAULT '0' COMMENT '精品推荐价格',
  `matchPrice` float DEFAULT '0' COMMENT '匹配发布价格',
  `inspectPrice` float DEFAULT '0' COMMENT '第三方验货价格',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allPrices`
--

LOCK TABLES `allPrices` WRITE;
/*!40000 ALTER TABLE `allPrices` DISABLE KEYS */;
/*!40000 ALTER TABLE `allPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `cityID` varchar(100) NOT NULL DEFAULT '' COMMENT '城市ID',
  `cityName` varchar(1000) DEFAULT NULL COMMENT '城市名称',
  `provinceID` varchar(100) DEFAULT NULL COMMENT '省份ID',
  PRIMARY KEY (`cityID`),
  KEY `provinceID` (`provinceID`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`provinceID`) REFERENCES `province` (`provinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('0','南京',NULL),('1','北京',NULL),('2','上海',NULL),('3','广州',NULL),('4','深圳',NULL);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collegeInfo`
--

DROP TABLE IF EXISTS `collegeInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collegeInfo` (
  `collegeID` varchar(100) NOT NULL DEFAULT '' COMMENT '学校ID',
  `collegeName` varchar(1000) DEFAULT NULL COMMENT '学校名称',
  `cityID` varchar(100) DEFAULT NULL COMMENT '城市',
  `isSupport` tinyint(1) DEFAULT '0' COMMENT '是否已支持验货',
  PRIMARY KEY (`collegeID`),
  KEY `cityID` (`cityID`),
  CONSTRAINT `collegeInfo_ibfk_1` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collegeInfo`
--

LOCK TABLES `collegeInfo` WRITE;
/*!40000 ALTER TABLE `collegeInfo` DISABLE KEYS */;
INSERT INTO `collegeInfo` VALUES ('0','所有学校','0',0),('1','南京大学','1',0),('2','南京邮电大学','1',0),('3','南京理>工大学','1',0),('4','河海大学','1',0),('5','信息工程大学','1',0),('6','东南大学','1',0);
/*!40000 ALTER TABLE `collegeInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressAll`
--

DROP TABLE IF EXISTS `expressAll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressAll` (
  `expressID` varchar(100) NOT NULL DEFAULT '' COMMENT '快递服务ID',
  `publishedTime` datetime DEFAULT NULL COMMENT '发布时间',
  `tel` varchar(100) DEFAULT NULL COMMENT '电话',
  `logisticsID` varchar(100) DEFAULT NULL COMMENT '快递状态ID',
  `expressCompany` varchar(100) DEFAULT NULL COMMENT '快递公司',
  `expressNum` varchar(100) DEFAULT NULL COMMENT '快递号',
  `userName` varchar(1000) DEFAULT NULL COMMENT '用户名',
  `tag` varchar(10) DEFAULT NULL COMMENT '标记，0代表代拿，1代表代发',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `collegeID` varchar(100) DEFAULT NULL COMMENT '大学ID',
  `takeTime` datetime DEFAULT NULL COMMENT '取货时间',
  PRIMARY KEY (`expressID`),
  KEY `userID` (`userID`),
  KEY `logisticsID` (`logisticsID`),
  CONSTRAINT `expressAll_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `expressAll_ibfk_2` FOREIGN KEY (`logisticsID`) REFERENCES `logistics` (`logisticsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressAll`
--

LOCK TABLES `expressAll` WRITE;
/*!40000 ALTER TABLE `expressAll` DISABLE KEYS */;
/*!40000 ALTER TABLE `expressAll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressInfo`
--

DROP TABLE IF EXISTS `expressInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressInfo` (
  `expressID` varchar(100) NOT NULL DEFAULT '' COMMENT '快递代拿ID',
  `expressName` varchar(1000) DEFAULT NULL COMMENT '代拿名称',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `receiver` varchar(1000) DEFAULT NULL COMMENT '收件人',
  `tel` varchar(100) DEFAULT NULL COMMENT '电话',
  `expressCompany` varchar(100) DEFAULT NULL COMMENT '快递公司',
  `expressAddress` varchar(1000) DEFAULT NULL COMMENT '收件人地址，送货地址',
  `expressGetAddress` varchar(1000) DEFAULT NULL COMMENT '拿货地址',
  `publishedTime` datetime DEFAULT NULL COMMENT '发布时间',
  `logisticsID` varchar(100) DEFAULT NULL COMMENT '快递状态信息',
  `expressNum` varchar(100) DEFAULT NULL COMMENT '快递单号',
  `collegeID` varchar(100) DEFAULT NULL COMMENT '大学ID',
  `takeTime` datetime DEFAULT NULL COMMENT '送货时间',
  `getTime` varchar(1000) DEFAULT NULL COMMENT '取货时间，例如，中午1点之前，',
  PRIMARY KEY (`expressID`),
  KEY `userID` (`userID`),
  KEY `logisticsID` (`logisticsID`),
  CONSTRAINT `expressInfo_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `expressInfo_ibfk_2` FOREIGN KEY (`logisticsID`) REFERENCES `logistics` (`logisticsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressInfo`
--

LOCK TABLES `expressInfo` WRITE;
/*!40000 ALTER TABLE `expressInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `expressInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger create_order_logistics_get before insert
on expressInfo
for each row
begin
insert into logistics(logisticsID, logisticsCompanyID) values (new.logisticsID, new.expressCompany);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger create_express_get after insert
on expressInfo
for each row
begin
        insert into expressAll(expressID,publishedTime,tel,logisticsID,expressCompany,expressNum,userName,tag,userID,collegeID,takeTime)
        select expressID,publishedTime,tel,logisticsID,expressCompany,
        expressNum,receiver,'0',userID,collegeID,takeTime from expressInfo where expressInfo.expressID like new.expressID;

        insert into expressState(expressID,expressStatusID,modifyTime) values(new.expressID, '0', now());

        insert into workerTask(taskID, status, collegeID, tag, userID, userName, userTel,fromTime, fromAddress, takeTime, toAddress)
        select expressID, '0', collegeID, 0, userID, receiver,tel, getTime, expressGetAddress, takeTime, expressAddress
        from expressInfo
        where expressInfo.expressID like new.expressID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger delete_expressall_get after delete
on expressInfo
for each row
begin
delete from expressAll where expressID like old.expressID;
delete from logistics where logisticsID like old.logisticsID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `expressPost`
--

DROP TABLE IF EXISTS `expressPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressPost` (
  `expressPostID` varchar(100) NOT NULL DEFAULT '' COMMENT '快递代发ID',
  `userName` varchar(1000) DEFAULT NULL COMMENT '寄件人姓名',
  `tel` varchar(100) DEFAULT NULL COMMENT '手机号',
  `expressCompany` varchar(100) DEFAULT NULL COMMENT '快递公司',
  `receiverCity` varchar(100) DEFAULT NULL COMMENT '收件人城市',
  `isOverWeight` tinyint(1) DEFAULT NULL COMMENT '是否超重',
  `addressInfo` varchar(100) DEFAULT NULL COMMENT '取件地址',
  `publishedTime` datetime DEFAULT NULL COMMENT '发布时间',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `logisticsID` varchar(100) DEFAULT NULL COMMENT '快递状态信息',
  `expressNum` varchar(100) DEFAULT NULL COMMENT '快递单号',
  `collegeID` varchar(100) DEFAULT NULL COMMENT '大学ID',
  `takeTime` datetime DEFAULT NULL COMMENT '取货时间',
  PRIMARY KEY (`expressPostID`),
  KEY `userID` (`userID`),
  KEY `logisticsID` (`logisticsID`),
  CONSTRAINT `expressPost_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `expressPost_ibfk_2` FOREIGN KEY (`logisticsID`) REFERENCES `logistics` (`logisticsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressPost`
--

LOCK TABLES `expressPost` WRITE;
/*!40000 ALTER TABLE `expressPost` DISABLE KEYS */;
/*!40000 ALTER TABLE `expressPost` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger create_order_logistics_post before insert
on expressPost
for each row
begin
insert into logistics(logisticsID, logisticsCompanyID) values (new.logisticsID, new.expressCompany);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger create_express_post after insert
on expressPost
for each row
begin

        insert into expressAll(expressID,publishedTime,tel,logisticsID,expressCompany,expressNum,userName,tag,userID,collegeID,takeTime)
        select expressPostID,publishedTime,tel,logisticsID,expressCompany,expressNum,userName,'1',userID,collegeID,takeTime
        from expressPost
        where expressPost.expressPostID like new.expressPostID;

        insert into expressState(expressID,expressStatusID,modifyTime) values(new.expressPostID, '0', now());
        insert into workerTask(taskID, status, collegeID, tag, userID, userName, userTel, takeTime, fromAddress)
        select expressPostID, '0', collegeID, 1, userID, userName, tel,takeTime, addressInfo
        from expressPost
        where expressPost.expressPostID like new.expressPostID;
        end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger update_express_post after update
on expressPost
for each row
begin
        declare varExpressNum nvarchar(100);
        declare varExpressID nvarchar(100);
        declare varExpressCompany nvarchar(100);
        set varExpressNum = new.expressNum;
        set varExpressID = new.expressPostID;
        set varExpressCompany = new.expressCompany;

        update expressAll set expressNum = varExpressNum, expressCompany = varExpressCompany where expressID like varExpressID;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger delete_expressall_post after delete
on expressPost
for each row
begin
delete from expressAll where expressID like old.expressPostID;
delete from logistics where logisticsID like old.logisticsID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `expressState`
--

DROP TABLE IF EXISTS `expressState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressState` (
  `expressID` varchar(100) NOT NULL DEFAULT '' COMMENT '快递代发ID',
  `expressStatusID` varchar(100) DEFAULT NULL COMMENT '状态',
  `modifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`expressID`),
  KEY `expressStatusID` (`expressStatusID`),
  CONSTRAINT `expressState_ibfk_1` FOREIGN KEY (`expressStatusID`) REFERENCES `expressStatusTable` (`expressStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressState`
--

LOCK TABLES `expressState` WRITE;
/*!40000 ALTER TABLE `expressState` DISABLE KEYS */;
/*!40000 ALTER TABLE `expressState` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger set_expressStatus after update on expressState for each row
begin
        declare varExpressStatusID nvarchar(100);
        declare varUserID nvarchar(100);
        declare varTaskID nvarchar(100);

        set varExpressStatusID = new.expressStatusID;
        set varTaskID = new.expressID;

        if(varExpressStatusID = '1') then
                select userID into varUserID from expressInfo where expressID like new.expressID;

                update workerTask set status = 2 where taskID like varTaskID;
        end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `expressStatusTable`
--

DROP TABLE IF EXISTS `expressStatusTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressStatusTable` (
  `expressStatusID` varchar(100) NOT NULL DEFAULT '' COMMENT '状态ID',
  `expressStatusName` varchar(1000) DEFAULT NULL COMMENT '状态名',
  PRIMARY KEY (`expressStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressStatusTable`
--

LOCK TABLES `expressStatusTable` WRITE;
/*!40000 ALTER TABLE `expressStatusTable` DISABLE KEYS */;
INSERT INTO `expressStatusTable` VALUES ('0','已创建'),('1','已支付'),('2','已填写单号'),('3','已评价');
/*!40000 ALTER TABLE `expressStatusTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite` (
  `favoriteID` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏的ID',
  `merchandiseID` varchar(100) DEFAULT NULL COMMENT '收藏商品的ID',
  `userID` varchar(100) DEFAULT NULL COMMENT '收藏者的ID',
  `timeAndDate` datetime DEFAULT NULL COMMENT '收藏的时间',
  PRIMARY KEY (`favoriteID`),
  KEY `merchandiseID` (`merchandiseID`),
  KEY `userID` (`userID`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`merchandiseID`) REFERENCES `merchandiseList` (`merchandiseID`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imgPath`
--

DROP TABLE IF EXISTS `imgPath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imgPath` (
  `imgPathID` varchar(100) NOT NULL DEFAULT '' COMMENT '图片主键',
  `path` varchar(100) DEFAULT NULL COMMENT '照片的路径',
  `merchandiseID` varchar(100) DEFAULT NULL COMMENT '照片对应的商品',
  PRIMARY KEY (`imgPathID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imgPath`
--

LOCK TABLES `imgPath` WRITE;
/*!40000 ALTER TABLE `imgPath` DISABLE KEYS */;
INSERT INTO `imgPath` VALUES ('1','1.jpg','6202e009450214acad68fab997622d1e'),('6','6.jpg','918aabc89ab8ebf1a1feede9dc97c573'),('7','7.jpg','6d821c1ea62066c894a3feaedb2f3677');
/*!40000 ALTER TABLE `imgPath` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger set_merchandiselist_path after insert
on imgPath
for each row
begin
        declare varMerchandiseID varchar(100);
        declare varImgPath varchar(1000);

        declare varcount int;
        set varMerchandiseID = new.merchandiseID;
        set varImgPath = new.path;

        select count(*) into varcount from merchandiseList where merchandiseID like varMerchandiseID;

        insert into tmp(varMerchandiseID, varImgPath, varcount) values(varMerchandiseID, varImgPath, varcount > 1);
        update merchandiseList set imgPath = varImgPath where merchandiseID like varMerchandiseID;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logistics` (
  `logisticsID` varchar(100) NOT NULL DEFAULT '' COMMENT '物流ID',
  `company` varchar(1000) DEFAULT NULL COMMENT '物流公司',
  `state` smallint(6) DEFAULT NULL COMMENT '物流状态',
  `location` varchar(1000) DEFAULT NULL COMMENT '详细地址',
  `logisticsCompanyID` int(11) DEFAULT NULL COMMENT '物流公司ID',
  `imgpath` varchar(1000) DEFAULT NULL COMMENT '照片路径',
  `logisticsNum` varchar(100) DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`logisticsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics`
--

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger update_logistics after update
on logistics
for each row
begin
        declare varLogisticsID nvarchar(100);
        set varLogisticsID = new.logisticsID;

        update merchandiseOrder set orderstate = '3' where logisticsID = varLogisticsID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logisticsCompany`
--

DROP TABLE IF EXISTS `logisticsCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logisticsCompany` (
  `logisticsCompanyID` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流公司ID',
  `companyName` varchar(100) DEFAULT NULL COMMENT '物流公司名称',
  `abbr` varchar(100) DEFAULT NULL COMMENT '物流公司简称',
  `imgpath` varchar(1000) DEFAULT NULL COMMENT '照片路径',
  PRIMARY KEY (`logisticsCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logisticsCompany`
--

LOCK TABLES `logisticsCompany` WRITE;
/*!40000 ALTER TABLE `logisticsCompany` DISABLE KEYS */;
INSERT INTO `logisticsCompany` VALUES (1,'宅急送快递','zhaijisong',NULL),(2,'Aramex','aramex',NULL),(3,'爱彼西快递','abc',NULL),(4,'安迅物流','anxun',NULL),(5,'安得物流','ande',NULL),(6,'AOL快递','aol',NULL),(7,'包裹/挂号信/小包','pingyou',NULL),(8,'宝通达物流','baotongda',NULL),(9,'百千诚国际物流','baiqian',NULL),(10,'贝邮宝','ppbyb',NULL),(11,'CCES快递','cces',NULL),(12,'CityLink快递','citylink',NULL),(13,'出口易','chukouyi',NULL),(14,'递达快递','dida',NULL),(15,'店通快递','diantong',NULL),(16,'大金物流','dajin',NULL),(17,'大顺物流','dashun',NULL),(18,'德邦快递','debang',NULL),(19,'冠达快递','guada',NULL),(20,'布谷鸟快递','bgn',NULL),(21,'蓝狐快递','lanhu',NULL),(22,'广东ems快递','gdems',NULL),(23,'祥龙运通','xlyt',NULL),(24,'国际包裹','gjbg',NULL),(25,'易通达','yitongda',NULL),(26,'高铁速递','gtsd',NULL),(27,'大达物流','dada',NULL),(28,'飞远物流','feiyuan',NULL),(29,'飞特物流','feite',NULL),(30,'方方达物流','fangfangda',NULL),(31,'挂号信','pingyou',NULL),(32,'国内小包','gnxb',NULL),(33,'港快速递','gangkuai',NULL),(34,'华诚物流','huacheng',NULL),(35,'河北建华物流','hebeijianhua',NULL),(36,'海盟速递','haimeng',NULL),(37,'华翰物流','huahan',NULL),(38,'恒宇运通','hengyu',NULL),(39,'华航快递','huahang',NULL),(40,'好来运快递','haolaiyun',NULL),(41,'合众速递','ucs',NULL),(42,'加运美物流','jiayunmei',NULL),(43,'晋越快递','jinyue',NULL),(44,'急先达物流','jixianda',NULL),(45,'佳惠尔快递','jiahuier',NULL),(46,'久易快递','jiuyi',NULL),(47,'捷特快递','jiete',NULL),(48,'京世物流','jingshi',NULL),(49,'跨越快递','kuayue',NULL),(50,'快淘快递','kuaitao',NULL),(51,'蓝镖快递','lanbiao',NULL),(52,'明亮物流','mingliang',NULL),(53,'闽盛物流','minsheng',NULL),(54,'蒙速快递','mengsu',NULL),(55,'南北快递','nanbei',NULL),(56,'平邮包裹','pingyou',NULL),(57,'平安达快递','pinganda',NULL),(58,'陪行物流','peixing',NULL),(59,'全际通快递','quanjitong',NULL),(60,'RPX保时达','rpx',NULL),(61,'瑞丰速递','ruifeng',NULL),(62,'日本邮政','jppost',NULL),(63,'日昱物流','riyu',NULL),(64,'荣庆物流','rongqing',NULL),(65,'穗佳物流','suijia',NULL),(66,'思迈快递','simai',NULL),(67,'速腾快递','suteng',NULL),(68,'晟邦物流','shengbang',NULL),(69,'速呈宅配','suchengzhaipei',NULL),(70,'TNT快递','tnt',NULL),(71,'USPS快递','usps',NULL),(72,'万家物流','wanjia',NULL),(73,'五环速递','wuhuan',NULL),(74,'小包','pingyou',NULL),(75,'星程宅配','xingchengzhaipei',NULL),(76,'新加坡邮政','singpost',NULL),(77,'香港邮政','hkpost',NULL),(78,'源伟丰快递','ywfex',NULL),(79,'远成物流','yuancheng',NULL),(80,'越丰快递','yuefeng',NULL),(81,'一统飞鸿快递','ytfh',NULL),(82,'银捷快递','yinjie',NULL),(83,'邮政小包','gnxb',NULL),(84,'誉美捷快递','yumeijie',NULL),(85,'燕文物流','yanwen',NULL),(86,'中国邮政快递','pingyou',NULL),(87,'中国邮政国际包裹','intmail',NULL),(88,'中信达快递','zhongxinda',NULL),(89,'中天快运','zhongtian',NULL),(90,'佐川急便','zuochuan',NULL),(91,'纵行物流','zongxing',NULL),(92,'E邮宝','eyoubao',NULL),(93,'AAE快递','aae',NULL),(94,'程光快递','chengguang',NULL),(95,'城市之星','cszx',NULL),(96,'传志快递','chuanzhi',NULL),(97,'DHL快递','dhl',NULL),(98,'DPEX快递','dpex',NULL),(99,'Fedex联邦快递(国际)','fedex',NULL),(100,'Fedex联邦快递(国内)','fedexcn',NULL),(101,'飞康达快递','fkd',NULL),(102,'飞豹快递','feibao',NULL),(103,'飞狐快递','feihu',NULL),(104,'国通快递','guotong',NULL),(105,'百世汇通','huitong',NULL),(106,'天天快递','tiantian',NULL),(107,'汇强快递','huiqiang',NULL),(108,'嘉里大通','jldt',NULL),(109,'佳吉物流','jiaji',NULL),(110,'京广速递(KKE快递)','jingguang',NULL),(111,'快捷快递','kuaijie',NULL),(112,'龙邦物流','longbang',NULL),(113,'联昊通快递','lianhaotong',NULL),(114,'乐捷递','lejiedi',NULL),(115,'成都立即送快递','lijisong',NULL),(116,'民邦速递','minbang',NULL),(117,'民航快递','minhang',NULL),(118,'OCS国际快递','ocs',NULL),(119,'全峰快递','quanfeng',NULL),(120,'全一快递','quanyi',NULL),(121,'全晨快递','quanchen',NULL),(122,'全日通快递','quanritong',NULL),(123,'申通快递','shentong',NULL),(124,'顺丰快递(顺丰速运)','shunfeng',NULL),(125,'山东海红快递','haihong',NULL),(126,'三态速递','santai',NULL),(127,'盛辉物流','shenghui',NULL),(128,'盛丰物流','shengfeng',NULL),(129,'圣安物流','shengan',NULL),(130,'赛澳递','saiaodi',NULL),(131,'UPS快递','ups',NULL),(132,'优速快递','yousu',NULL),(133,'新邦物流','xinbang',NULL),(134,'圆通快递','yuantong',NULL),(135,'韵达快递','yunda',NULL),(136,'一邦快递','yibang',NULL),(137,'亚风快递','yafeng',NULL),(138,'中通快递','zhongtong',NULL),(139,'中铁快运','zhongtie',NULL),(140,'中邮物流','zhongyou',NULL),(141,'京东快递','jingdong',NULL),(142,'增益快递','zengyi',NULL),(143,'华企快递','huaqi',NULL),(144,'凡宇快递','fanyu',NULL),(145,'源安达快递','yad',NULL),(146,'飞洋快递','feiyang',NULL),(147,'万博快递','wanbo',NULL),(148,'丰达快递','fengda',NULL),(149,'新蛋物流','xindan',NULL),(150,'百福东方','bfdf',NULL),(151,'包裹、平邮、挂号信','bgpyghx',NULL),(152,'东方快递','coe',NULL),(153,'EMS','ems',NULL),(154,'恒路物流','henglu',NULL),(155,'华夏龙物流','hxlwl',NULL),(156,'康力物流','klwl',NULL),(157,'美国快递','meiguo',NULL),(158,'申通E物流','shentong',NULL),(159,'微特派快递','weitepai',NULL),(160,'运通快递','yuntong',NULL),(161,'远成物流','ycwl',NULL),(162,'宅急送快递','zjs',NULL),(163,'郑州建华快递','zzjh',NULL),(164,'中天万运快递','ztwy',NULL),(165,'城际快递','chengji',NULL),(166,'安能物流','anwl',NULL),(167,'世运快递','shiyun',NULL),(168,'宇鑫物流','yxwl',NULL),(169,'美龙快递','meilong',NULL),(170,'广通速递','guangtong',NULL),(171,'百福东方快递(EES)','ees',NULL),(172,'递四方速递','disifang',NULL),(173,'D速快递','dsu',NULL),(174,'如风达快递','rufeng',NULL),(175,'安捷快递','anjie',NULL),(176,'安信达快递','anxinda',NULL),(177,'长通物流','changtong',NULL),(178,'城市100快递','chengshi100',NULL),(179,'传喜物流(传喜快递)','chuanxi',NULL),(180,'大田物流','datian',NULL),(181,'大洋物流快递','dayang',NULL),(182,'飞邦物流','feibang',NULL),(183,'共速达物流','gongsuda',NULL),(184,'昊盛物流','haosheng',NULL),(185,'音速快递(音速速运)','yinsu',NULL),(186,'华夏龙物流','huaxialong',NULL),(187,'佳怡物流','jiayi',NULL),(188,'宽容物流','kuanrong',NULL),(189,'尼尔物流(尼尔快递)','nell',NULL),(190,'速尔快递','sure',NULL),(191,'速通物流','sutong',NULL),(192,'天地华宇物流','huayu',NULL),(193,'通成物流','tongcheng',NULL),(194,'通和天下物流','tonghe',NULL),(195,'万象物流','wanxiang',NULL),(196,'伟邦快递(SCS快递)','scs',NULL),(197,'信丰快递','xinfeng',NULL),(198,'元智捷诚快递','yuanzhi',NULL),(199,'原飞航快递','feihang',NULL),(200,'芝麻开门','zhima',NULL),(201,'港中能达快递','nengda',NULL),(202,'海尔日日顺物流','ririshun',NULL);
/*!40000 ALTER TABLE `logisticsCompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managerInfo`
--

DROP TABLE IF EXISTS `managerInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managerInfo` (
  `managerid` varchar(100) NOT NULL DEFAULT '' COMMENT '管理员ID',
  `username` varchar(100) DEFAULT NULL COMMENT '管理员用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`managerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managerInfo`
--

LOCK TABLES `managerInfo` WRITE;
/*!40000 ALTER TABLE `managerInfo` DISABLE KEYS */;
INSERT INTO `managerInfo` VALUES ('1','anthow','pbkdf2:sha1:1000$VObuG2hp$fb6b5f7b51769abd2ab1ddd86e67ccf1e4766e91');
/*!40000 ALTER TABLE `managerInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchandise`
--

DROP TABLE IF EXISTS `merchandise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchandise` (
  `merchandiseID` varchar(100) NOT NULL DEFAULT '' COMMENT '自增主键',
  `merchandiseName` varchar(100) DEFAULT NULL COMMENT '商品内容',
  `currentPrice` float DEFAULT NULL COMMENT '现在的价格',
  `oldPrice` float DEFAULT NULL COMMENT '以前的价格',
  `visitedCount` int(11) DEFAULT '0' COMMENT '访问数',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户名ID',
  `info` varchar(1000) DEFAULT NULL COMMENT '商品信息',
  `publishedTime` datetime DEFAULT NULL COMMENT '发布时间',
  `swap` tinyint(1) DEFAULT NULL COMMENT '是否物物交换',
  `autoShipment` tinyint(1) DEFAULT '0' COMMENT '是否支持智能运费',
  `inspection` tinyint(1) DEFAULT NULL COMMENT '是否接受验货',
  `college` varchar(100) DEFAULT NULL COMMENT '学校',
  `merchandiseTypeID` varchar(100) DEFAULT NULL COMMENT '商品类型ID',
  `matching` tinyint(1) DEFAULT NULL COMMENT '匹配卖货',
  `recommendation` tinyint(1) DEFAULT NULL COMMENT '精品推荐',
  `city` varchar(1000) DEFAULT NULL COMMENT '城市列表',
  `shipmentPrice` float DEFAULT '0' COMMENT '运费',
  `longitude` float DEFAULT '118.46' COMMENT '经度',
  `latitude` float DEFAULT '32.03' COMMENT '维度',
  PRIMARY KEY (`merchandiseID`),
  KEY `userID` (`userID`),
  KEY `merchandiseTypeID` (`merchandiseTypeID`),
  CONSTRAINT `merchandise_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `merchandise_ibfk_2` FOREIGN KEY (`merchandiseTypeID`) REFERENCES `merchandiseType` (`merchandiseTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchandise`
--

LOCK TABLES `merchandise` WRITE;
/*!40000 ALTER TABLE `merchandise` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchandise` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger create_post after insert
on merchandise
for each row
begin
        declare varMerchandiseID varchar(100);
        set varMerchandiseID = new.merchandiseID;


        insert into merchandiseList
        (merchandiseID,merchandiseName,currentPrice,
        oldPrice,visitedCount,info,publishedTime,
        swap,autoShipment,inspection,college
        ,matching,recommendation,city,userName,portraitPath,merchandiseType,shipmentPrice,imgPath,
        userID,longitude,latitude)
        select merchandise.merchandiseID,merchandiseName,currentPrice,
        oldPrice,visitedCount,merchandise.info,publishedTime,
        swap,autoShipment,inspection,collegeName,
        matching,recommendation,cityName, userName, portraitPath,merchandiseTypeName,shipmentPrice,imgPath.path,
        userInfo.userID,longitude,latitude
        from merchandise,userinfo,merchandiseType,imgPath,city,collegeInfo
		where userInfo.userID = merchandise.userID
        and merchandise.merchandiseTypeID = merchandiseType.merchandiseTypeID
        and imgPath.merchandiseID = merchandise.merchandiseID
        and city.cityID like new.city
        and merchandise.college = collegeInfo.collegeID
        and merchandise.merchandiseID  like varMerchandiseID;

        insert into PostedMerchandise
        (merchandiseID,merchandiseName,currentPrice,
        oldPrice,visitedCount,userID,info,publishedTime,
        swap,autoShipment,inspection,college,
        merchandiseTypeID,matching,recommendation,city,shipmentPrice,longitude,latitude)
        select merchandiseID,merchandiseName,currentPrice,
        oldPrice,visitedCount,userID,info,publishedTime,
        swap,autoShipment,inspection,college,
        merchandiseTypeID,matching,recommendation,city,shipmentPrice,longitude,latitude from merchandise where merchandise.merchandiseID like varMerchandiseID;


end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger update_post after update
on merchandise
for each row
begin
        declare varMerchandiseType varchar(100);
        select merchandiseTypename into varMerchandiseType from merchandiseType where merchandiseTypeID like new.merchandiseTypeID;

        update  merchandiseList set
        merchandiseName = new.merchandiseName,currentPrice = new.currentPrice,
        oldPrice = new.oldPrice,visitedCount= new.visitedCount,info = new.info,publishedTime=new.publishedTime,
        swap=new.swap,autoShipment=new.autoShipment,inspection=new.inspection,college=(select collegeName from collegeInfo where collegeID like new.college),
        merchandiseType=varMerchandiseType,matching=new.matching,recommendation=new.recommendation,city=(select cityName from city where city.cityID like new.city),
        longitude=new.longitude, latitude=new.latitude
        where merchandiseList.merchandiseID like new.merchandiseID;


        update PostedMerchandise set
        merchandiseName = new.merchandiseName,currentPrice = new.currentPrice,
        oldPrice = new.oldPrice,visitedCount= new.visitedCount,info = new.info,publishedTime=new.publishedTime,
        swap=new.swap,autoShipment=new.autoShipment,inspection=new.inspection,college=new.college,
        merchandiseTypeID=new.merchandiseTypeID,matching=new.matching,recommendation=new.recommendation,city=new.city,
		longitude=new.longitude, latitude=new.latitude
        where PostedMerchandise.merchandiseID like new.merchandiseID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger delete_post before delete
on merchandise
for each row
begin
        declare varMerchandiseID varchar(100);
        set varMerchandiseID = old.merchandiseID;
        update PostedMerchandise set status = 'deleted' where PostedMerchandise.merchandiseID like varMerchandiseID;
        delete from merchandiseList where merchandiseList.merchandiseID like varMerchandiseID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `merchandiseList`
--

DROP TABLE IF EXISTS `merchandiseList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchandiseList` (
  `merchandiseID` varchar(100) NOT NULL DEFAULT '' COMMENT '自增主键',
  `merchandiseName` varchar(100) DEFAULT NULL COMMENT '商品内容',
  `currentPrice` float DEFAULT NULL COMMENT '现在的价格',
  `oldPrice` float DEFAULT NULL COMMENT '以前的价格',
  `visitedCount` int(11) DEFAULT NULL COMMENT '访问数',
  `userName` varchar(100) DEFAULT NULL COMMENT '用户名',
  `info` varchar(1000) DEFAULT NULL COMMENT '商品信息',
  `publishedTime` datetime DEFAULT NULL COMMENT '发布时间',
  `swap` tinyint(1) DEFAULT NULL COMMENT '是否物物交换',
  `autoShipment` tinyint(1) DEFAULT NULL COMMENT '是否支持智能运费',
  `inspection` tinyint(1) DEFAULT NULL COMMENT '是否接受验货',
  `college` varchar(100) DEFAULT NULL COMMENT '学校',
  `merchandiseType` varchar(1000) DEFAULT NULL COMMENT '商品类型',
  `matching` tinyint(1) DEFAULT NULL COMMENT '匹配卖货',
  `recommendation` tinyint(1) DEFAULT NULL COMMENT '精品推荐',
  `city` varchar(1000) DEFAULT NULL COMMENT '城市列表',
  `imgPath` varchar(100) NOT NULL DEFAULT '' COMMENT '首张图片',
  `portraitPath` varchar(1000) DEFAULT NULL COMMENT '发布商品人头像',
  `favorite` tinyint(1) DEFAULT '0' COMMENT '是否被关注',
  `shipmentPrice` float DEFAULT NULL COMMENT '运费',
  `freeze` tinyint(1) DEFAULT '0' COMMENT '是否被买，生成订单也会被锁定',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `longitude` float DEFAULT '118.46' COMMENT '经度',
  `latitude` float DEFAULT '32.03' COMMENT '维度',
  PRIMARY KEY (`merchandiseID`,`imgPath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchandiseList`
--

LOCK TABLES `merchandiseList` WRITE;
/*!40000 ALTER TABLE `merchandiseList` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchandiseList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchandiseOrder`
--

DROP TABLE IF EXISTS `merchandiseOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchandiseOrder` (
  `orderID` varchar(100) NOT NULL DEFAULT '' COMMENT '订单ID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `orderstate` varchar(100) DEFAULT NULL COMMENT '订单状态',
  `sellerID` varchar(100) DEFAULT NULL COMMENT '卖家ID',
  `buyerID` varchar(100) DEFAULT NULL COMMENT '买家ID',
  `logisticsID` varchar(100) DEFAULT NULL COMMENT '快递ID',
  `merchandiseID` varchar(100) DEFAULT NULL COMMENT '商品ID',
  `addressID` varchar(100) DEFAULT NULL COMMENT '地址ID',
  `alipayID` varchar(100) DEFAULT NULL COMMENT '支付宝交易ID',
  PRIMARY KEY (`orderID`),
  KEY `sellerID` (`sellerID`),
  KEY `buyerID` (`buyerID`),
  KEY `logisticsID` (`logisticsID`),
  KEY `merchandiseID` (`merchandiseID`),
  KEY `addressID` (`addressID`),
  CONSTRAINT `merchandiseOrder_ibfk_1` FOREIGN KEY (`sellerID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `merchandiseOrder_ibfk_2` FOREIGN KEY (`buyerID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `merchandiseOrder_ibfk_3` FOREIGN KEY (`logisticsID`) REFERENCES `logistics` (`logisticsID`),
  CONSTRAINT `merchandiseOrder_ibfk_4` FOREIGN KEY (`merchandiseID`) REFERENCES `postedMerchandise` (`merchandiseID`),
  CONSTRAINT `merchandiseOrder_ibfk_5` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchandiseOrder`
--

LOCK TABLES `merchandiseOrder` WRITE;
/*!40000 ALTER TABLE `merchandiseOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchandiseOrder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger create_order_logistics before insert
on merchandiseOrder
for each row
begin

    declare varOrderState nvarchar(100);
        declare varCollegeID nvarchar(100);
        declare varSellerID nvarchar(100);
        declare varSellerName nvarchar(1000);
        declare varTel nvarchar(20);
        insert into logistics(logisticsID) values(new.orderID);
        update merchandiseList set freeze = true where merchandiseList.merchandiseID like new.merchandiseID;



        set varOrderState = new.orderState;
        set varSellerID = new.sellerID;

        select college into varCollegeID from merchandise where merchandiseID like new.merchandiseID;
        select userName, tel into varSellerName, varTel from userInfo where userID like varSellerID;
		
        if(varOrderState = '2') then
            insert into workerTask(taskID, status, collegeID, tag, userID, userName, userTel,takeTime)
                values(new.orderID, 0, varCollegeID, 2, varSellerID, varSellerName, varTel, new.createTime);
        end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger update_order after update
on merchandiseOrder
for each row
begin
        declare varOrderState nvarchar(100);
        declare varCollegeID nvarchar(100);
        declare varSellerID nvarchar(100);
        declare varSellerName nvarchar(1000);
        declare varTel nvarchar(20);
        declare varTaskCount int;
        declare varMerchandiseID nvarchar(100);
        declare varPrice float;

        set varOrderState = new.orderState;
        set varSellerID = new.sellerID;
        set varMerchandiseID = new.merchandiseID;

        select college into varCollegeID from merchandise where merchandiseID like new.merchandiseID;
        select userName, tel into varSellerName, varTel from userInfo where userID like varSellerID;

        if(varOrderState = '2') then
            select count(*) into varTaskCount from workerTask where taskID like new.orderID;
			if(varTaskCount < 1) then
                        insert into workerTask(taskID, status, collegeID, tag, userID, userName, userTel,takeTime)
                        values(new.orderID, 0, varCollegeID, 2, varSellerID, varSellerName, varTel, new.createTime);
                end if;
        elseif(varOrderState = '4') then
                select currentPrice into varPrice  from merchandise where merchandiseID like varMerchandiseID;
                update userinfo set account = account + varPrice where userID like new.sellerID;
        end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger delete_order after delete
on merchandiseOrder
for each row
begin
    declare varOrderState nvarchar(100);
    declare varMerchandiseID nvarchar(100);

        set varOrderState = old.orderstate;
        set varMerchandiseID = old.merchandiseID;

        if varOrderState > '3' then
            delete from merchandise where merchandiseID like varMerchandiseID;
        elseif varOrderState = '1' then
            update merchandiseList set freeze = 0 where merchandiseID like old.merchandiseID;
        end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `merchandiseType`
--

DROP TABLE IF EXISTS `merchandiseType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchandiseType` (
  `merchandiseTypeID` varchar(100) NOT NULL DEFAULT '' COMMENT '商品类型ID',
  `merchandiseTypeName` varchar(100) DEFAULT NULL COMMENT '商品类型的名称',
  `imgpath` varchar(1000) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`merchandiseTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchandiseType`
--

LOCK TABLES `merchandiseType` WRITE;
/*!40000 ALTER TABLE `merchandiseType` DISABLE KEYS */;
INSERT INTO `merchandiseType` VALUES ('0','全部','books.png'),('1','数码电子','digital.png'),('2','交通工具','traffic.png'),('3','快递服务','delivery.png'),('4','彩妆护肤','cosmetics.png'),('5','鞋包服饰','clothse.png'),('6','日用百货','daily.png'),('7','书籍旧刊','books.png');
/*!40000 ALTER TABLE `merchandiseType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postedMerchandise`
--

DROP TABLE IF EXISTS `postedMerchandise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postedMerchandise` (
  `merchandiseID` varchar(100) NOT NULL DEFAULT '' COMMENT '自增主键',
  `merchandiseName` varchar(100) DEFAULT NULL COMMENT '商品内容',
  `currentPrice` float DEFAULT NULL COMMENT '现在的价格',
  `merchandisePrice` float DEFAULT NULL COMMENT '以前的价格',
  `visitedCount` int(11) DEFAULT NULL COMMENT '访问数',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户名ID',
  `info` varchar(1000) DEFAULT NULL COMMENT '商品信息',
  `publishedTime` datetime DEFAULT NULL COMMENT '发布时间',
  `swap` tinyint(1) DEFAULT NULL COMMENT '是否物物交换',
  `autoShipment` tinyint(1) DEFAULT NULL COMMENT '是否支持智能运费',
  `inspection` tinyint(1) DEFAULT NULL COMMENT '是否接受验货',
  `college` varchar(100) DEFAULT NULL COMMENT '学校',
  `merchandiseTypeID` varchar(100) DEFAULT NULL COMMENT '商品类型ID',
  `matching` tinyint(1) DEFAULT NULL COMMENT '匹配卖货',
  `recommendation` tinyint(1) DEFAULT NULL COMMENT '精品推荐',
  `status` varchar(100) DEFAULT 'created' COMMENT '商品的状态',
  `city` varchar(1000) DEFAULT NULL COMMENT '城市',
  `shipmentPrice` float DEFAULT NULL COMMENT '运费',
  `longitude` float DEFAULT '118.46' COMMENT '经度',
  `latitude` float DEFAULT '32.03' COMMENT '维度',
  PRIMARY KEY (`merchandiseID`),
  KEY `userID` (`userID`),
  KEY `merchandiseTypeID` (`merchandiseTypeID`),
  CONSTRAINT `postedMerchandise_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `postedMerchandise_ibfk_2` FOREIGN KEY (`merchandiseTypeID`) REFERENCES `merchandiseType` (`merchandiseTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postedMerchandise`
--

LOCK TABLES `postedMerchandise` WRITE;
/*!40000 ALTER TABLE `postedMerchandise` DISABLE KEYS */;
/*!40000 ALTER TABLE `postedMerchandise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `provinceID` varchar(100) NOT NULL DEFAULT '' COMMENT '省份ID',
  `provinceName` varchar(1000) DEFAULT NULL COMMENT '省份名称',
  PRIMARY KEY (`provinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirement` (
  `requirementID` varchar(100) NOT NULL DEFAULT '' COMMENT '需求的ID',
  `info` varchar(1000) DEFAULT NULL COMMENT '需求的详细内容',
  `userID` varchar(100) DEFAULT NULL COMMENT '发布人的ID',
  `merchandiseTypeID` varchar(100) DEFAULT NULL COMMENT '分类',
  `publishedTime` datetime DEFAULT NULL COMMENT '发布的时间',
  `collegeID` varchar(100) DEFAULT NULL COMMENT '学校ID',
  `cityID` varchar(100) DEFAULT NULL COMMENT '城市ID',
  PRIMARY KEY (`requirementID`),
  KEY `userID` (`userID`),
  KEY `merchandiseTypeID` (`merchandiseTypeID`),
  KEY `collegeID` (`collegeID`),
  KEY `cityID` (`cityID`),
  CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `requirement_ibfk_2` FOREIGN KEY (`merchandiseTypeID`) REFERENCES `merchandiseType` (`merchandiseTypeID`),
  CONSTRAINT `requirement_ibfk_3` FOREIGN KEY (`collegeID`) REFERENCES `collegeInfo` (`collegeID`),
  CONSTRAINT `requirement_ibfk_4` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sortType`
--

DROP TABLE IF EXISTS `sortType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sortType` (
  `sortTypeID` varchar(100) NOT NULL DEFAULT '' COMMENT '排序种类ID',
  `sortTypeName` varchar(1000) DEFAULT NULL COMMENT '排序种类名称',
  PRIMARY KEY (`sortTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sortType`
--

LOCK TABLES `sortType` WRITE;
/*!40000 ALTER TABLE `sortType` DISABLE KEYS */;
INSERT INTO `sortType` VALUES ('0','综合排序'),('1','发布时间'),('2','价格降序'),('3','价格升序'),('4','销量降序');
/*!40000 ALTER TABLE `sortType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spread`
--

DROP TABLE IF EXISTS `spread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spread` (
  `spreadID` varchar(100) NOT NULL DEFAULT '' COMMENT '推广的ID',
  `price` float DEFAULT NULL COMMENT '推广价格',
  `timeAndDate` datetime DEFAULT NULL COMMENT '推广的时间',
  `userID` varchar(100) DEFAULT NULL COMMENT '需要推广的用户',
  PRIMARY KEY (`spreadID`),
  KEY `userID` (`userID`),
  CONSTRAINT `spread_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spread`
--

LOCK TABLES `spread` WRITE;
/*!40000 ALTER TABLE `spread` DISABLE KEYS */;
INSERT INTO `spread` VALUES ('1',100,'2015-07-07 00:00:00','767871f9d0632e2241cd4b56407d62f9');
/*!40000 ALTER TABLE `spread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp`
--

DROP TABLE IF EXISTS `tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp` (
  `varMerchandiseID` varchar(100) NOT NULL DEFAULT '',
  `varImgPath` varchar(1000) DEFAULT NULL,
  `varcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`varMerchandiseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp`
--

LOCK TABLES `tmp` WRITE;
/*!40000 ALTER TABLE `tmp` DISABLE KEYS */;
INSERT INTO `tmp` VALUES ('6202e009450214acad68fab997622d1e','1.jpg',0),('6d821c1ea62066c894a3feaedb2f3677','7.jpg',0),('918aabc89ab8ebf1a1feede9dc97c573','6.jpg',0);
/*!40000 ALTER TABLE `tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `tokenID` varchar(200) NOT NULL DEFAULT '' COMMENT '根据用户ID和时间生成的token',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `createtime` datetime DEFAULT NULL COMMENT 'token被创建的时间',
  `validity` mediumtext COMMENT 'token的有效时长',
  PRIMARY KEY (`tokenID`),
  KEY `userID` (`userID`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('f20c56321b814012e3171f9ae93ca963','767871f9d0632e2241cd4b56407d62f9','2016-04-10 15:54:35','100');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userInfo`
--

DROP TABLE IF EXISTS `userInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userInfo` (
  `userID` varchar(100) NOT NULL DEFAULT '' COMMENT '主键',
  `userName` varchar(100) DEFAULT NULL COMMENT '用户名，昵称',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `birthday` date DEFAULT NULL COMMENT '出生年月日',
  `info` varchar(1000) DEFAULT NULL COMMENT '个人简介，个性签名等',
  `portraitPath` varchar(1000) DEFAULT 'default_portrait.png' COMMENT '头像路径',
  `account` float DEFAULT '0' COMMENT '账户',
  `tel` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `gender` smallint(6) DEFAULT NULL COMMENT '性别',
  `residence` varchar(1000) DEFAULT NULL COMMENT '常住地',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userInfo`
--

LOCK TABLES `userInfo` WRITE;
/*!40000 ALTER TABLE `userInfo` DISABLE KEYS */;
INSERT INTO `userInfo` VALUES ('767871f9d0632e2241cd4b56407d62f9','158****9635','E822F630F5BF5AED3705D9F3975A9BA2',NULL,NULL,'default_portrait.png',0,'15852909635',NULL,NULL,NULL);
/*!40000 ALTER TABLE `userInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger user_all_prices after insert
ON `userInfo` for each row
begin
        insert into allPrices(userID, recommendPrice, matchPrice, inspectPrice)
        values(new.userID, 0, 0, 0);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger user_merchandiseList after update
ON `userInfo` for each row
begin
        declare varUserName varchar(100);
        declare varUserID varchar(100);
        declare varPortraitPath nvarchar(1000);

        set varUserName = new.userName;
        set varUserID = new.userID;
        set varPortraitPath = new.portraitPath;

        update merchandiseList set userName = varUserName, portraitPath =  varPortraitPath where merchandiseList.userID like varUserID;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker` (
  `workerID` varchar(100) NOT NULL DEFAULT '' COMMENT '工号',
  `workerName` varchar(1000) DEFAULT NULL COMMENT '姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `workerTag` varchar(100) DEFAULT NULL COMMENT '标记，是总代理还是派送员,0是总代理',
  `superior` varchar(100) DEFAULT '0' COMMENT '上司',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `info` varchar(1000) DEFAULT NULL COMMENT '简介',
  `portraitPath` varchar(1000) DEFAULT 'default_portrait.png' COMMENT '头像路径',
  `account` float DEFAULT '0' COMMENT '个人账户',
  `tel` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `gender` smallint(6) DEFAULT NULL COMMENT '性别',
  `residence` varchar(1000) DEFAULT NULL COMMENT '常住地',
  `area` varchar(100) DEFAULT NULL COMMENT '区域，用大学的ID标记',
  PRIMARY KEY (`workerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger insert_worker before insert
on worker
for each row
begin
        declare varSuperior varchar(100);
        declare varCollegeID varchar(100);
        declare varTag varchar(100);
        declare varWorkerID nvarchar(100);

        set varCollegeID = new.area;
        set varTag = new.workerTag;
        set varWorkerID = new.workerID;

        if varTag = '1' then
        select workerID into varSuperior from worker where area like varCollegeID;
        set new.superior = varSuperior;
        end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `workerTask`
--

DROP TABLE IF EXISTS `workerTask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workerTask` (
  `taskID` varchar(100) NOT NULL DEFAULT '' COMMENT 'task的ID',
  `workerID` varchar(100) DEFAULT '0' COMMENT '工作人员ID',
  `status` smallint(6) DEFAULT NULL COMMENT '当前任务的状态，0表示未被分配，1表示派送中，2表示已经派送完毕',
  `collegeID` varchar(100) DEFAULT NULL COMMENT '大学的ID',
  `description` varchar(1000) DEFAULT NULL COMMENT '简单描述，从任务列表里可以看到的简单位置信息',
  `tag` smallint(6) DEFAULT NULL COMMENT '类型，0表示快递待拿，1表示快递代发，2表示验货',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `userName` varchar(1000) DEFAULT NULL COMMENT '用户名',
  `userTel` varchar(20) DEFAULT NULL COMMENT '用户电话',
  `takeTime` datetime DEFAULT NULL COMMENT 'post:取货时间,inspection:验货时间,get:送货时间',
  `fromAddress` varchar(1000) DEFAULT NULL COMMENT '取货地点，验货地点',
  `fromTime` varchar(1000) DEFAULT NULL COMMENT '取货时间',
  `toAddress` varchar(1000) DEFAULT NULL COMMENT '送货地点',
  `price` float DEFAULT '0' COMMENT '本次交易价格',
  PRIMARY KEY (`taskID`),
  KEY `collegeID` (`collegeID`),
  CONSTRAINT `workerTask_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `collegeInfo` (`collegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workerTask`
--

LOCK TABLES `workerTask` WRITE;
/*!40000 ALTER TABLE `workerTask` DISABLE KEYS */;
/*!40000 ALTER TABLE `workerTask` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`secondhand`@`%`*/ /*!50003 trigger price_changed after update 
on workerTask
for each row
begin
    declare varWorkerID nvarchar(100);
    declare varPrice float;

        set varPrice = new.price;
        set varWorkerID = new.workerID;

    if (new.price != old.price)  then
        update worker set account = account + varPrice where workerID like varWorkerID;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-15 12:26:32
