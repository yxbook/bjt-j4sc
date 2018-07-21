/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 5.7.21-log : Database - j4sc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`j4sc` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `j4sc`;

/*Table structure for table `auth_log` */

DROP TABLE IF EXISTS `auth_log`;

CREATE TABLE `auth_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `description` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `start_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `spend_time` int(11) DEFAULT NULL COMMENT '消耗时间',
  `base_path` varchar(500) DEFAULT NULL COMMENT '根路径',
  `uri` varchar(500) DEFAULT NULL COMMENT 'URI',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `parameter` mediumtext,
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户标识',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `result` mediumtext,
  `permissions` varchar(100) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`log_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

/*Data for the table `auth_log` */

insert  into `auth_log`(`log_id`,`description`,`username`,`start_time`,`spend_time`,`base_path`,`uri`,`url`,`method`,`parameter`,`user_agent`,`ip`,`result`,`permissions`) values 
(445,'新增楼宇信息','admin',1528940988520,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/Build',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134','111.121.64.148',NULL,'bjt:system:build:add'),
(446,'新增楼宇信息','admin',1528941004340,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/BuildUser',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134','111.121.64.148',NULL,'bjt:system:build:add'),
(447,'新增系统公告','admin',1528941079064,NULL,'/system/notice/add','http://api.bangjiat.com/system/notice/add/Notice',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134','111.121.64.148',NULL,'bjt:system:notice:add'),
(448,'停车场管理添加','admin',1528941236401,NULL,'/system/carpark/add','http://api.bangjiat.com/system/carpark/add/CarparkSpace',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134','111.121.64.148',NULL,'bjt:system:carpark:add'),
(449,'停车场管理添加','admin',1528941255421,NULL,'/system/carpark/add','http://api.bangjiat.com/system/carpark/add/SpaceUser',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134','111.121.64.148',NULL,'bjt:system:carpark:add'),
(450,'新增轮播图','admin',1528965562739,NULL,'/system/carousel/add','http://api.bangjiat.com/system/carousel/add/AppCarousel',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:add'),
(451,'新增轮播图','admin',1528965584968,NULL,'/system/carousel/add','http://api.bangjiat.com/system/carousel/add/AppCarousel',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:add'),
(452,'新增轮播图','admin',1528965608851,NULL,'/system/carousel/add','http://api.bangjiat.com/system/carousel/add/AppCarousel',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:add'),
(453,'新增轮播图','admin',1528965636724,NULL,'/system/carousel/add','http://api.bangjiat.com/system/carousel/add/AppCarousel',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:add'),
(454,'轮播图修改','admin',1528965664669,NULL,'/system/carousel/update','http://api.bangjiat.com/system/carousel/update/AppCarousel',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:update'),
(455,'轮播图修改','admin',1528965671575,NULL,'/system/carousel/update','http://api.bangjiat.com/system/carousel/update/AppCarousel',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:update'),
(456,'轮播图修改','admin',1528965677131,NULL,'/system/carousel/update','http://api.bangjiat.com/system/carousel/update/AppCarousel',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:update'),
(457,'轮播图修改','admin',1528965682669,NULL,'/system/carousel/update','http://api.bangjiat.com/system/carousel/update/AppCarousel',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:update'),
(458,'轮播图修改','admin',1528965687301,NULL,'/system/carousel/update','http://api.bangjiat.com/system/carousel/update/AppCarousel',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:update'),
(459,'轮播图删除','admin',1528965710737,NULL,'/system/carousel/delete','http://api.bangjiat.com/system/carousel/delete/AppCarousel',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:delete'),
(460,'新增轮播图','admin',1528965733813,NULL,'/system/carousel/add','http://api.bangjiat.com/system/carousel/add/AppCarousel',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.64.148',NULL,'bjt:system:carousel:add'),
(461,'新增楼宇信息','admin',1529034581428,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/Build',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','111.121.64.148',NULL,'bjt:system:build:add'),
(462,'新增楼宇信息','admin',1529034608213,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/BuildUser',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','111.121.64.148',NULL,'bjt:system:build:add'),
(463,'新增系统公告','admin',1529047027727,NULL,'/system/notice/add','http://api.bangjiat.com/system/notice/add/Notice',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:add'),
(464,'新增系统公告','admin',1529047041890,NULL,'/system/notice/add','http://api.bangjiat.com/system/notice/add/Notice',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:add'),
(465,'新增系统公告','admin',1529047185707,NULL,'/system/notice/add','http://api.bangjiat.com/system/notice/add/Notice',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:add'),
(466,'系统公告修改','admin',1529047262714,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:update'),
(467,'系统公告修改','admin',1529047393915,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:update'),
(468,'系统公告修改','admin',1529047400657,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:update'),
(469,'新增系统公告','admin',1529047754354,NULL,'/system/notice/add','http://api.bangjiat.com/system/notice/add/Notice',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:add'),
(470,'系统公告删除','admin',1529049135123,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:delete'),
(471,'系统公告删除','admin',1529049135130,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:delete'),
(472,'系统公告删除','admin',1529049481958,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','111.121.65.98',NULL,'bjt:system:notice:delete'),
(473,'系统公告删除','admin',1529460460252,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.117.234',NULL,'bjt:system:notice:delete'),
(474,'新增楼宇信息','admin',1529460869784,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/Build',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.117.234',NULL,'bjt:system:build:add'),
(475,'新增楼宇信息','admin',1529460904092,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/BuildUser',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.117.234',NULL,'bjt:system:build:add'),
(476,'新增楼宇信息','admin',1529479704951,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/BuildUser',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.117.234',NULL,'bjt:system:build:add'),
(477,'系统公告删除','admin',1529629835058,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:notice:delete'),
(478,'系统公告删除','admin',1529629868410,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:notice:delete'),
(479,'系统公告修改','admin',1529629897615,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:notice:update'),
(480,'系统公告修改','admin',1529630000428,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:notice:update'),
(481,'系统公告删除','admin',1529630722442,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:notice:delete'),
(482,'系统公告删除','admin',1529630727149,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:notice:delete'),
(483,'新增系统公告','admin',1529633873807,NULL,'/system/notice/add','http://api.bangjiat.com/system/notice/add/Notice',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.112.77',NULL,'bjt:system:notice:add'),
(484,'系统公告修改','admin',1529633904828,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.112.77',NULL,'bjt:system:notice:update'),
(485,'系统公告修改','admin',1529633988344,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.112.77',NULL,'bjt:system:notice:update'),
(486,'系统公告删除','admin',1529634197197,NULL,'/system/notice/delete','http://api.bangjiat.com/system/notice/delete/Notice',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.112.77',NULL,'bjt:system:notice:delete'),
(487,'系统公告修改','admin',1529634218661,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.112.77',NULL,'bjt:system:notice:update'),
(488,'新增系统公告','admin',1529634790410,NULL,'/system/notice/add','http://api.bangjiat.com/system/notice/add/Notice',NULL,'POST','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.112.77',NULL,'bjt:system:notice:add'),
(489,'系统公告修改','admin',1529646034629,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.112.77',NULL,'bjt:system:notice:update'),
(490,'系统公告修改','admin',1529646052084,NULL,'/system/notice/update','http://api.bangjiat.com/system/notice/update/Notice',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','1.204.112.77',NULL,'bjt:system:notice:update'),
(491,'新增楼宇信息','admin',1529647300648,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/Build',NULL,'POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','1.204.112.77',NULL,'bjt:system:build:add'),
(492,'新增楼宇信息','admin',1529647317364,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/BuildUser',NULL,'POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','1.204.112.77',NULL,'bjt:system:build:add'),
(493,'新增楼宇信息','admin',1529647363521,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/BuildUser',NULL,'POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','1.204.112.77',NULL,'bjt:system:build:add'),
(494,'楼宇信息删除','admin',1529647372466,NULL,'/system/build/delete','http://api.bangjiat.com/system/build/delete/BuildUser',NULL,'DELETE','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','1.204.112.77',NULL,'bjt:system:build:delete'),
(495,'新增楼宇信息','admin',1529647384849,NULL,'/system/build/add','http://api.bangjiat.com/system/build/add/BuildUser',NULL,'POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','1.204.112.77',NULL,'bjt:system:build:add'),
(496,'楼宇信息删除','admin',1529718713337,NULL,'/system/build/delete','http://api.bangjiat.com/system/build/delete/BuildUser',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:build:delete'),
(497,'楼宇信息删除','admin',1529718723753,NULL,'/system/build/delete','http://api.bangjiat.com/system/build/delete/BuildUser',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:build:delete'),
(498,'楼宇信息修改','admin',1529718774524,NULL,'/system/build/update','http://api.bangjiat.com/system/build/update/Build',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','1.204.112.77',NULL,'bjt:system:build:update'),
(499,'停车场管理添加','admin',1529725156323,NULL,'/system/carpark/add','http://api.bangjiat.com/system/carpark/add/CarparkSpace',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134','1.204.112.77',NULL,'bjt:system:carpark:add'),
(500,'停车场管理添加','admin',1529725174231,NULL,'/system/carpark/add','http://api.bangjiat.com/system/carpark/add/SpaceUser',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134','1.204.112.77',NULL,'bjt:system:carpark:add'),
(501,'停车场管理删除','admin',1531812703968,NULL,'/system/carpark/delete','http://192.168.0.118/system/carpark/delete/SpaceUser',NULL,'DELETE','{}','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','192.168.0.118',NULL,'bjt:system:carpark:delete'),
(502,'停车场管理添加','admin',1531812718183,NULL,'/system/carpark/add','http://192.168.0.118/system/carpark/add/SpaceUser',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','192.168.0.118',NULL,'bjt:system:carpark:add'),
(503,'系统权限修改','admin',1531898868725,NULL,'/permission/update','http://192.168.0.118/permission/update/Permission',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','192.168.0.118',NULL,'auth:permission:update'),
(504,'系统权限增加','admin',1531899256835,NULL,'/permission/add','http://192.168.0.118/permission/add/PermissionAuto',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','192.168.0.118',NULL,'auth:permission:add'),
(505,'系统权限修改','admin',1531899308260,NULL,'/permission/update','http://192.168.0.118/permission/update/Permission',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','192.168.0.118',NULL,'auth:permission:update'),
(506,'系统权限删除','admin',1531899353229,NULL,'/permission/delete','http://192.168.0.118/permission/delete/PermissionAuto?id=167',NULL,'DELETE','{id=[167]}','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','192.168.0.118',NULL,'auth:permission:delete'),
(507,'系统权限修改','admin',1531899758176,NULL,'/permission/update','http://192.168.0.118/permission/update/Permission',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','192.168.0.118',NULL,'auth:permission:update'),
(508,'系统应用修改','admin',1531900288870,NULL,'/system/update','http://192.168.0.118/system/update/System',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','192.168.0.118',NULL,'auth:system:update');

/*Table structure for table `auth_organization` */

DROP TABLE IF EXISTS `auth_organization`;

CREATE TABLE `auth_organization` (
  `organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '组织名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '组织描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='组织';

/*Data for the table `auth_organization` */

insert  into `auth_organization`(`organization_id`,`pid`,`name`,`description`,`ctime`) values 
(1,NULL,'总部','北京总部',1),
(4,NULL,'河北分部','河北石家庄',1488122466236),
(5,NULL,'河南分部','河南郑州',1488122480265),
(6,NULL,'湖北分部','湖北武汉',1488122493265),
(7,NULL,'湖南分部','湖南长沙',1488122502752);

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `system_id` int(10) unsigned NOT NULL COMMENT '所属系统',
  `pid` int(10) DEFAULT '0' COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1:目录,2:菜单,3:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `uri` varchar(100) DEFAULT NULL COMMENT '路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态(0:禁止,1:正常)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  `method` varchar(20) DEFAULT NULL COMMENT '请求类型',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COMMENT='权限';

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`permission_id`,`system_id`,`pid`,`name`,`type`,`permission_value`,`uri`,`icon`,`status`,`ctime`,`orders`,`method`) values 
(1,1,0,'系统应用管理',1,'auth:system','','monitor',1,1,1,'GET'),
(2,1,1,'查看系统应用',2,'auth:system:read','/system','document',1,2,2,'GET'),
(3,1,1,'新增系统应用',2,'auth:system:add','/system','android-add',1,3,3,'GET'),
(4,1,1,'系统应用查看',3,'auth:system:read','/system/select','',1,4,4,'GET'),
(5,1,1,'系统应用修改',3,'auth:system:update','/system/update','',1,6,6,'PUT'),
(6,1,1,'系统应用删除',3,'auth:system:delete','/system/delete','',1,5,5,'DELETE'),
(7,1,1,'系统应用添加',3,'auth:system:add','/system/add','',1,7,7,'POST'),
(8,1,0,'系统权限管理',1,'auth:permission','','pinpoint',1,12,12,'GET'),
(9,1,8,'查看系统权限',2,'auth:permission:read','/permission','key',1,14,14,'GET'),
(10,1,8,'系统权限总览',2,'auth:permission:read','/permission','document',1,15,15,'GET'),
(11,1,8,'系统权限查看',3,'auth:permission:read','/permission/select','',1,16,16,'GET'),
(12,1,8,'系统权限修改',3,'auth:permission:update','/permission/update','',1,17,17,'PUT'),
(13,1,8,'系统权限删除',3,'auth:permission:delete','/permission/delete','',1,18,18,'DELETE'),
(14,1,8,'系统权限增加',3,'auth:permission:add','/permission/add','',1,19,19,'POST'),
(21,2,20,'文章管理',2,'cms:article:read','/manage/article/index',NULL,1,21,21,NULL),
(22,2,20,'回收管理',2,'cms:article:read','/manage/article/recycle',NULL,1,22,22,NULL),
(30,1,6,'新增用户',3,'auth:user:create','/manage/user/create','zmdi zmdi-plus',1,30,30,NULL),
(31,1,6,'编辑用户',3,'auth:user:update','/manage/user/update','zmdi zmdi-edit',1,31,31,NULL),
(32,1,6,'删除用户',3,'auth:user:delete','/manage/user/delete','zmdi zmdi-close',1,32,32,NULL),
(33,1,5,'新增角色',3,'auth:role:create','/manage/role/create','zmdi zmdi-plus',1,33,33,NULL),
(34,1,5,'编辑角色',3,'auth:role:update','/manage/role/update','zmdi zmdi-edit',1,34,34,NULL),
(35,1,5,'删除角色',3,'auth:role:delete','/manage/role/delete','zmdi zmdi-close',1,35,35,NULL),
(36,1,39,'新增权限',3,'auth:permission:create','/manage/permission/create','zmdi zmdi-plus',1,36,36,NULL),
(37,1,39,'编辑权限',3,'auth:permission:update','/manage/permission/update','zmdi zmdi-edit',1,37,37,NULL),
(38,1,39,'删除权限',3,'auth:permission:delete','/manage/permission/delete','zmdi zmdi-close',1,38,38,NULL),
(39,1,7,'权限管理',2,'auth:permission:read','/manage/permission/index',NULL,1,39,39,NULL),
(46,1,5,'角色权限',3,'auth:role:permission','/manage/role/permission','zmdi zmdi-key',1,1488091928257,1488091928257,NULL),
(48,1,6,'用户组织',3,'auth:user:organization','/manage/user/organization','zmdi zmdi-accounts-list',1,1488120011165,1488120011165,NULL),
(50,1,6,'用户角色',3,'auth:user:role','/manage/user/role','zmdi zmdi-accounts',1,1488120554175,1488120554175,NULL),
(51,1,6,'用户权限',3,'auth:user:permission','/manage/user/permission','zmdi zmdi-key',1,1488092013302,1488092013302,NULL),
(53,1,14,'强制退出',3,'auth:session:forceout','/manage/session/forceout','zmdi zmdi-run',1,1488379514715,1488379514715,NULL),
(54,2,18,'新增标签',3,'cms:tag:create','/manage/tag/create','zmdi zmdi-plus',1,1489417315159,1489417315159,NULL),
(55,2,18,'编辑标签',3,'cms:tag:update','zmdi zmdi-edit','zmdi zmdi-widgets',1,1489417344931,1489417344931,NULL),
(56,2,18,'删除标签',3,'cms:tag:delete','/manage/tag/delete','zmdi zmdi-close',1,1489417372114,1489417372114,NULL),
(57,1,15,'删除权限',3,'auth:log:delete','/manage/log/delete','zmdi zmdi-close',1,1489503867909,1489503867909,NULL),
(58,2,19,'编辑类目',3,'cms:category:update','/manage/category/update','zmdi zmdi-edit',1,1489586600462,1489586600462,NULL),
(59,2,19,'删除类目',3,'cms:category:delete','/manage/category/delete','zmdi zmdi-close',1,1489586633059,1489586633059,NULL),
(60,2,19,'新增类目',3,'cms:category:create','/manage/category/create','zmdi zmdi-plus',1,1489590342089,1489590342089,NULL),
(61,2,0,'其他数据S',1,'','','zmdi zmdi-more',0,1489835455359,1489835455359,NULL),
(62,2,20,'评论管理',2,'cms:comment:read','/manage/comment/index','',1,1489591408224,1489591408224,NULL),
(63,2,62,'删除评论',3,'cms:comment:delete','/manage/comment/delete','zmdi zmdi-close',1,1489591449614,1489591449614,NULL),
(68,2,61,'菜单管理',2,'cms:menu:read','/manage/menu/index','zmdi zmdi-widgets',1,1489591746846,1489591746846,NULL),
(69,2,68,'新增菜单',3,'cms:menu:create','/manage/menu/create','zmdi zmdi-plus',1,1489591791747,1489591791747,NULL),
(70,2,68,'编辑菜单',3,'cms:menu:update','/manage/menu/update','zmdi zmdi-edit',1,1489591831878,1489591831878,NULL),
(71,2,68,'删除菜单',3,'cms:menu:delete','/manage/menu/delete','zmdi zmdi-close',1,1489591865454,1489591865454,NULL),
(72,2,61,'系统设置',2,'cms:setting:read','/manage/setting/index','zmdi zmdi-widgets',1,1489591981165,1489591981165,NULL),
(73,2,72,'新增设置',3,'cms:setting:create','/manage/setting/create','zmdi zmdi-plus',1,1489592024762,1489592024762,NULL),
(74,2,72,'编辑设置',3,'cms:setting:update','/manage/setting/update','zmdi zmdi-edit',1,1489592052582,1489592052582,NULL),
(75,2,72,'删除设置',3,'cms:setting:delete','/manage/setting/delete','zmdi zmdi-close',1,1489592081426,1489592081426,NULL),
(76,2,21,'新增文章',3,'cms:article:create','/manage/article/create','zmdi zmdi-plus',1,1489820150404,1489820150404,NULL),
(77,2,21,'编辑文章',3,'cms:article:update','/manage/article/update','zmdi zmdi-edit',1,1489820178269,1489820178269,NULL),
(78,2,21,'删除文章',3,'cms:article:delete','/manage/article/delete','zmdi zmdi-close',1,1489820207607,1489820207607,NULL),
(79,2,0,'单页题管理',1,'','','zmdi zmdi-view-web',1,1489835320327,1489835320327,NULL),
(84,2,68,'上移菜单',3,'cms:menu:up','/manage/menu/up','zmdi zmdi-long-arrow-up',1,1489846486548,1489846486548,NULL),
(85,2,68,'下移菜单',3,'cms:menu:down','/manage/menu/down','zmdi zmdi-long-arrow-down',1,1489846578051,1489846578051,NULL),
(86,3,0,'楼宇管理',1,NULL,NULL,'ios-grid-view',1,86,86,'GET'),
(87,3,86,'楼宇信息',2,'bjt:system:build','/system/build','search',1,87,87,'GET'),
(88,3,86,'楼宇信息查看',3,'bjt:system:build:read','/system/build/select','iyicon',1,88,88,'GET'),
(89,3,86,'楼宇信息修改',3,'bjt:system:build:update','/system/build/update','ivicon',1,89,89,'PUT'),
(90,3,86,'楼宇信息删除',3,'bjt:system:build:delete','/system/build/delete','ivicon',1,90,90,'DELETE'),
(91,3,86,'新增楼宇信息',3,'bjt:system:build:add','/system/build/add','ivicon',1,91,91,'POST'),
(92,3,0,'系统公告管理',1,NULL,NULL,'lyicon',1,86,86,'GET'),
(93,3,92,'系统公告',2,'bjt:system:notice','/system/notice','document',1,87,87,'GET'),
(94,3,92,'系统公告查看',3,'bjt:system:notice:read','/system/notice/select','iyicon',1,88,88,'GET'),
(95,3,92,'系统公告修改',3,'bjt:system:notice:update','/system/notice/update','ivicon',1,89,89,'PUT'),
(96,3,92,'系统公告删除',3,'bjt:system:notice:delete','/system/notice/delete','ivicon',1,90,90,'DELETE'),
(97,3,92,'新增系统公告',3,'bjt:system:notice:add','/system/notice/add','ivicon',1,91,91,'POST'),
(98,3,86,'楼宇信息添加',2,'bjt:system:build','/system/build','compose',1,87,87,'GET'),
(126,1,0,'角色用户管理',1,'auth:roleuser','/roleuser','person',1,1523414288492,NULL,'GET'),
(143,1,126,'角色管理',2,'auth:role','/role','cube',1,1523415753197,NULL,'GET'),
(144,1,143,'角色查看',3,'auth:role:read','/role/select',NULL,1,1523415753197,NULL,'GET'),
(145,1,143,'角色删除',3,'auth:role:delete','/role/delete',NULL,1,1523415753197,NULL,'DELETE'),
(146,1,143,'角色修改',3,'auth:role:update','/role/update',NULL,1,1523415753197,NULL,'PUT'),
(147,1,143,'角色添加',3,'auth:role:add','/role/add',NULL,1,1523415753197,NULL,'POST'),
(148,1,126,'用户管理',2,'auth:user','/user','ios-people',1,1523415838426,NULL,'GET'),
(149,1,148,'用户查看',3,'auth:user:read','/user/select',NULL,1,1523415838426,NULL,'GET'),
(150,1,148,'用户删除',3,'auth:user:delete','/user/delete',NULL,1,1523415838426,NULL,'DELETE'),
(151,1,148,'用户修改',3,'auth:user:update','/user/update',NULL,1,1523415838426,NULL,'PUT'),
(152,1,148,'用户添加',3,'auth:user:add','/user/add',NULL,1,1523415838426,NULL,'POST'),
(154,3,0,'停车场管理',1,NULL,NULL,'ios-people',1,1526092350059,NULL,'GET'),
(155,3,154,'停车场管理查看',3,'bjt:system:carparkl:read','/system/carpark/select',NULL,1,1526092350059,NULL,'GET'),
(156,3,154,'停车场管理删除',3,'bjt:system:carpark:delete','/system/carpark/delete',NULL,1,1526092350059,NULL,'DELETE'),
(157,3,154,'停车场管理修改',3,'bjt:system:carparkl:update','/system/carpark/update',NULL,1,1526092350059,NULL,'PUT'),
(158,3,154,'停车场管理添加',3,'bjt:system:carpark:add','/system/carpark/add',NULL,1,1526092350059,NULL,'POST'),
(159,3,154,'停车场信息',2,'bjt:system:carpark','/system/carpark','ios-people',1,1526092455371,NULL,'GET'),
(160,3,154,'停车场信息添加',2,'bjt:system:carpark','/system/carpark','ios-people',1,1526092497670,NULL,'GET'),
(161,3,0,'轮播图管理',1,'','','ivicon',1,87,87,'GET'),
(162,3,161,'轮播图',2,'bjt:system:carousel','/system/carousel','document',1,87,87,'GET'),
(163,3,161,'轮播图查看',3,'bjt:system:carousel:read','/system/carousel/select','iyicon',1,88,88,'GET'),
(164,3,161,'轮播图修改',3,'bjt:system:carousel:update','/system/carousel/update','ivicon',1,89,89,'PUT'),
(165,3,161,'轮播图删除',3,'bjt:system:carousel:delete','/system/carousel/delete','ivicon',1,90,90,'DELETE'),
(166,3,161,'新增轮播图',3,'bjt:system:carousel:add','/system/carousel/add','ivicon',1,91,91,'POST');

/*Table structure for table `auth_role` */

DROP TABLE IF EXISTS `auth_role`;

CREATE TABLE `auth_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `title` varchar(20) DEFAULT NULL COMMENT '角色标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '角色描述',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  `orders` bigint(20) NOT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

/*Data for the table `auth_role` */

insert  into `auth_role`(`role_id`,`name`,`title`,`description`,`ctime`,`orders`) values 
(1,'super','超级管理员','拥有所有权限的',1,1),
(2,'admin','管理锁定员换个个','拥有除权限管理系统外的所有权限',1487471013117,1487471013117),
(3,'bjtadmin','帮家团管理员','楼宇管理权限',1,1),
(4,'楼宇管理员','楼宇管理员','243535',1527129777750,1527129777750);

/*Table structure for table `auth_role_permission` */

DROP TABLE IF EXISTS `auth_role_permission`;

CREATE TABLE `auth_role_permission` (
  `role_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`role_permission_id`),
  KEY `FK_Reference_23` (`role_id`),
  KEY `FK_Reference_24_idx` (`permission_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联表';

/*Data for the table `auth_role_permission` */

insert  into `auth_role_permission`(`role_permission_id`,`role_id`,`permission_id`) values 
(380,3,4),
(381,3,2),
(382,3,3),
(383,3,11),
(384,3,9),
(385,3,10),
(386,3,144),
(387,3,149),
(388,3,86),
(389,3,88),
(390,3,89),
(391,3,90),
(392,3,91),
(393,3,87),
(394,3,98),
(395,3,92),
(396,3,94),
(397,3,95),
(398,3,96),
(399,3,97),
(400,3,93),
(401,3,1),
(402,3,8),
(403,3,126),
(404,3,143),
(405,3,148),
(511,1,1),
(512,1,4),
(513,1,5),
(514,1,6),
(515,1,7),
(516,1,2),
(517,1,3),
(518,1,8),
(519,1,11),
(520,1,12),
(521,1,13),
(522,1,14),
(523,1,9),
(524,1,10),
(525,1,126),
(526,1,143),
(527,1,144),
(528,1,145),
(529,1,146),
(530,1,147),
(531,1,148),
(532,1,149),
(533,1,150),
(534,1,151),
(535,1,152),
(536,1,86),
(537,1,88),
(538,1,89),
(539,1,90),
(540,1,91),
(541,1,87),
(542,1,98),
(543,1,92),
(544,1,94),
(545,1,95),
(546,1,96),
(547,1,97),
(548,1,93),
(549,1,154),
(550,1,155),
(551,1,156),
(552,1,157),
(553,1,158),
(554,1,159),
(555,1,160),
(556,1,161),
(557,1,163),
(558,1,164),
(559,1,165),
(560,1,166),
(561,1,162),
(562,2,1),
(563,2,4),
(564,2,5),
(565,2,6),
(566,2,7),
(567,2,2),
(568,2,3),
(569,2,8),
(570,2,11),
(571,2,12),
(572,2,13),
(573,2,14),
(574,2,9),
(575,2,10),
(576,2,126),
(577,2,143),
(578,2,144),
(579,2,145),
(580,2,146),
(581,2,147),
(582,2,148),
(583,2,149),
(584,2,150),
(585,2,151),
(586,2,152),
(587,2,79),
(588,2,86),
(589,2,88),
(590,2,89),
(591,2,90),
(592,2,91),
(593,2,87),
(594,2,98),
(595,2,92),
(596,2,94),
(597,2,95),
(598,2,96),
(599,2,97),
(600,2,93),
(601,2,154),
(602,2,155),
(603,2,156),
(604,2,157),
(605,2,158),
(606,2,159),
(607,2,160),
(608,2,161),
(609,2,163),
(610,2,164),
(611,2,165),
(612,2,166),
(613,2,162);

/*Table structure for table `auth_system` */

DROP TABLE IF EXISTS `auth_system`;

CREATE TABLE `auth_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `banner` varchar(150) DEFAULT NULL COMMENT '背景',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `basepath` varchar(100) DEFAULT NULL COMMENT '根目录',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(-1:黑名单,1:正常)',
  `name` varchar(20) DEFAULT NULL COMMENT '系统名称',
  `title` varchar(20) DEFAULT NULL COMMENT '系统标题',
  `description` varchar(300) DEFAULT NULL COMMENT '系统描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='系统';

/*Data for the table `auth_system` */

insert  into `auth_system`(`system_id`,`icon`,`banner`,`theme`,`basepath`,`status`,`name`,`title`,`description`,`ctime`,`orders`) values 
(1,'J4SC','/resources/','#29A176','auth',1,'j4sc-auth-server','平台管理系统','J4SC-平台管理系统',1,1),
(2,NULL,NULL,NULL,NULL,NULL,'test-server','测试系统','测测是是是',1523333245336,NULL),
(3,NULL,NULL,NULL,NULL,NULL,'bjt-api-server','帮家团系统','帮家团系统',1523333330476,NULL),
(4,NULL,NULL,NULL,NULL,NULL,'测试这是啥所属','不知道是啥1','不知道是啥',1528077243364,NULL);

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码MD5(密码+盐)',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `locked` tinyint(4) DEFAULT NULL COMMENT '状态(0:正常,1:锁定)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

/*Data for the table `auth_user` */

insert  into `auth_user`(`user_id`,`username`,`password`,`salt`,`realname`,`avatar`,`phone`,`email`,`sex`,`locked`,`ctime`) values 
(1,'admins','3038D9CB63B3152A79B8153FB06C02F7','66f1b370c660445a8657bf8bf1794486','帮家团','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg','','uho4@qq.com',1,0,1),
(2,'test','285C9762F5F9046F5893F752DFAF3476','d2d0d03310444ad388a8b290b0fe8564','z','/resources/s/avatar.jpg','','41huo414@qq.com',1,0,1493394720495),
(3,'admin','3038D9CB63B3152A79B8153FB06C02F7','66f1b370c660445a8657bf8bf1794486','帮家团','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg','','uho4@qq.com',1,0,1);

/*Table structure for table `auth_user_organization` */

DROP TABLE IF EXISTS `auth_user_organization`;

CREATE TABLE `auth_user_organization` (
  `user_organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `organization_id` int(10) unsigned NOT NULL COMMENT '组织编号',
  PRIMARY KEY (`user_organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='用户组织关联表';

/*Data for the table `auth_user_organization` */

insert  into `auth_user_organization`(`user_organization_id`,`user_id`,`organization_id`) values 
(19,1,1),
(20,1,4),
(21,1,5),
(22,1,6),
(23,1,7);

/*Table structure for table `auth_user_permission` */

DROP TABLE IF EXISTS `auth_user_permission`;

CREATE TABLE `auth_user_permission` (
  `user_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  `type` tinyint(4) NOT NULL COMMENT '权限类型(-1:减权限,1:增权限)',
  PRIMARY KEY (`user_permission_id`),
  KEY `FK_Reference_23_idx` (`user_id`),
  KEY `FK_Reference_26_idx` (`permission_id`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限关联表';

/*Data for the table `auth_user_permission` */

insert  into `auth_user_permission`(`user_permission_id`,`user_id`,`permission_id`,`type`) values 
(9,2,32,-1),
(10,2,51,-1),
(11,2,48,-1),
(12,2,50,-1),
(13,2,35,-1),
(14,2,46,-1),
(15,2,37,-1),
(16,2,38,-1),
(17,2,57,-1),
(18,2,56,-1),
(19,2,59,-1),
(20,2,78,-1),
(23,2,71,-1),
(24,2,75,-1);

/*Table structure for table `auth_user_role` */

DROP TABLE IF EXISTS `auth_user_role`;

CREATE TABLE `auth_user_role` (
  `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_role_id`),
  KEY `FK_Reference_26_idx` (`user_id`),
  KEY `FK_Reference_26_idx1` (`role_id`),
  KEY `FK_Reference_26_idx2` (`role_id`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_28` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

/*Data for the table `auth_user_role` */

insert  into `auth_user_role`(`user_role_id`,`user_id`,`role_id`) values 
(4,1,3),
(18,2,2),
(28,3,1),
(29,3,4);

/*Table structure for table `bjt_carpark_apply` */

DROP TABLE IF EXISTS `bjt_carpark_apply`;

CREATE TABLE `bjt_carpark_apply` (
  `apply_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `company` varchar(100) NOT NULL COMMENT '公司名称',
  `company_id` int(10) NOT NULL COMMENT '公司编号',
  `applyer` varchar(20) DEFAULT NULL COMMENT '申请人',
  `status` int(5) DEFAULT NULL COMMENT '状态:1待审核，2已通过，3未通过',
  `applyer_id` varchar(32) NOT NULL COMMENT '申请人编号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `approver` varchar(20) DEFAULT NULL COMMENT '审批人',
  `approver_id` varchar(32) DEFAULT NULL COMMENT '审批人编号',
  `approval_time` bigint(20) DEFAULT NULL COMMENT '审批时间',
  `apply_time` bigint(20) DEFAULT NULL COMMENT '申请时间',
  `build_id` int(10) DEFAULT NULL COMMENT '楼宇编号',
  `build_name` varchar(100) DEFAULT NULL COMMENT '楼宇名称',
  `space_name` varchar(100) DEFAULT NULL COMMENT '停车场名称',
  `space_id` int(11) DEFAULT NULL COMMENT '停车场编号',
  `detail` varchar(5000) DEFAULT NULL COMMENT '停车申请明细',
  `opinion` varchar(200) DEFAULT NULL COMMENT '审批意见',
  `apply_username` varchar(13) DEFAULT NULL COMMENT '申请人账号',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`apply_id`),
  KEY `FK-Reference-A1_idx` (`company_id`),
  KEY `FK-Reference-A2_idx` (`applyer_id`),
  KEY `FK-Reference-A3_idx` (`space_id`),
  CONSTRAINT `FK-Reference-A1` FOREIGN KEY (`company_id`) REFERENCES `bjt_park_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK-Reference-A2` FOREIGN KEY (`applyer_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK-Reference-A3` FOREIGN KEY (`space_id`) REFERENCES `bjt_carpark_space` (`space_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='停车申请表';

/*Data for the table `bjt_carpark_apply` */

/*Table structure for table `bjt_carpark_apply_detail` */

DROP TABLE IF EXISTS `bjt_carpark_apply_detail`;

CREATE TABLE `bjt_carpark_apply_detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '明细编号',
  `car_name` varchar(20) NOT NULL COMMENT '车主姓名',
  `plate_number` varchar(20) NOT NULL COMMENT '车牌号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `apply_id` int(10) NOT NULL COMMENT '申请编号',
  `type` tinyint(4) NOT NULL COMMENT '类型：1、固定；2、临时',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `space_id` int(11) DEFAULT NULL COMMENT '停车场编号',
  `space_name` varchar(100) NOT NULL COMMENT '停车场名称',
  `lot_number` varchar(20) DEFAULT NULL COMMENT '车位编号',
  `status` tinyint(4) NOT NULL COMMENT '状态:1、待审批；2、（已通过）但未缴费；3、未通过；4、正常',
  `begin_time` bigint(20) DEFAULT NULL COMMENT '生效日期',
  `car_id` int(11) NOT NULL COMMENT '车辆信息编号',
  `end_time` bigint(20) DEFAULT NULL COMMENT '失效日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `resource` varchar(300) DEFAULT NULL COMMENT '车辆照片路径',
  `terminal_time` bigint(20) DEFAULT NULL COMMENT '终止时间(跟缴费无关)',
  PRIMARY KEY (`detail_id`),
  KEY `FK-Reference-A-D4_idx` (`car_id`),
  KEY `FK-Reference-A-D3_idx` (`space_id`),
  CONSTRAINT `FK-Reference-A-D3` FOREIGN KEY (`space_id`) REFERENCES `bjt_carpark_space` (`space_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK-Reference-A-D4` FOREIGN KEY (`car_id`) REFERENCES `bjt_carpark_car` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='停车申请明细表';

/*Data for the table `bjt_carpark_apply_detail` */

/*Table structure for table `bjt_carpark_car` */

DROP TABLE IF EXISTS `bjt_carpark_car`;

CREATE TABLE `bjt_carpark_car` (
  `car_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '车辆信息编号',
  `name` varchar(50) NOT NULL COMMENT '车主姓名',
  `id_number` varchar(18) NOT NULL COMMENT '身份证号',
  `licence_number` varchar(18) NOT NULL COMMENT '驾驶证号',
  `drive_number` varchar(45) NOT NULL COMMENT '行驶证号',
  `resource` varchar(1000) DEFAULT NULL COMMENT '车辆照片json数据',
  `plate_number` varchar(30) NOT NULL COMMENT '车牌号',
  `brand` varchar(30) DEFAULT NULL COMMENT '品牌',
  `model` varchar(40) DEFAULT NULL COMMENT '型号',
  `color` varchar(20) DEFAULT NULL COMMENT '颜色',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `username` varchar(13) NOT NULL COMMENT '用户名',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`car_id`),
  KEY `FK-Reference-CC1_idx` (`user_id`),
  CONSTRAINT `FK-Reference-CC1` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='车辆信息表';

/*Data for the table `bjt_carpark_car` */

/*Table structure for table `bjt_carpark_parking_lot` */

DROP TABLE IF EXISTS `bjt_carpark_parking_lot`;

CREATE TABLE `bjt_carpark_parking_lot` (
  `lot_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车位主键编号',
  `number` varchar(20) DEFAULT NULL COMMENT '车位编号',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型：1、固定车位；2、临时车位',
  `space_id` int(11) DEFAULT NULL COMMENT '停车场编号',
  `space_name` varchar(100) DEFAULT NULL COMMENT '停车场名称',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1、空闲；2、使用中',
  PRIMARY KEY (`lot_id`),
  KEY `FK-Reference-PL1_idx` (`space_id`),
  CONSTRAINT `FK-Reference-PL1` FOREIGN KEY (`space_id`) REFERENCES `bjt_carpark_space` (`space_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='停车位信息';

/*Data for the table `bjt_carpark_parking_lot` */

insert  into `bjt_carpark_parking_lot`(`lot_id`,`number`,`type`,`space_id`,`space_name`,`ctime`,`remark`,`status`) values 
(53,'100',1,17,'互联网金融停车场',NULL,NULL,1);

/*Table structure for table `bjt_carpark_payment` */

DROP TABLE IF EXISTS `bjt_carpark_payment`;

CREATE TABLE `bjt_carpark_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '缴费编号',
  `car_id` int(11) NOT NULL COMMENT '车辆编号',
  `plate_number` varchar(20) NOT NULL COMMENT '车牌号',
  `fee` decimal(7,2) DEFAULT NULL COMMENT '每月/每年 单价费用',
  `number` int(10) DEFAULT NULL COMMENT '缴纳月数/年数',
  `begin_time` bigint(20) NOT NULL COMMENT '生效日期',
  `end_time` bigint(20) NOT NULL COMMENT '截止日期',
  `total_fee` decimal(10,2) NOT NULL COMMENT '合计金额',
  `pay_way` tinyint(4) DEFAULT NULL COMMENT '缴费方式(1是支付宝，2是微信，3是银行卡)',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1、待缴费；2、缴费成功；3；缴费失败',
  `space_id` int(11) NOT NULL COMMENT '停车场编号',
  `space_name` varchar(100) DEFAULT NULL COMMENT '停车场名称',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `username` varchar(13) DEFAULT NULL COMMENT '用户账号',
  `realname` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `cut_off_time` bigint(20) DEFAULT NULL COMMENT '支付截止时间',
  `type` tinyint(4) DEFAULT NULL COMMENT '缴费类型：1、按月缴费；2、按年缴费',
  `resource` varchar(300) DEFAULT NULL COMMENT '车辆照片路径',
  PRIMARY KEY (`payment_id`),
  KEY `FK-Reference-P1_idx` (`car_id`),
  KEY `FK-Reference-P2_idx` (`user_id`),
  KEY `FK-Reference-P3_idx` (`space_id`),
  CONSTRAINT `FK-Reference-P1` FOREIGN KEY (`car_id`) REFERENCES `bjt_carpark_car` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK-Reference-P2` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK-Reference-P3` FOREIGN KEY (`space_id`) REFERENCES `bjt_carpark_space` (`space_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='停车缴费记录表';

/*Data for the table `bjt_carpark_payment` */

/*Table structure for table `bjt_carpark_space` */

DROP TABLE IF EXISTS `bjt_carpark_space`;

CREATE TABLE `bjt_carpark_space` (
  `space_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '停车场编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `address` varchar(100) NOT NULL COMMENT '位置',
  `longitude` varchar(15) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(15) DEFAULT NULL COMMENT '纬度',
  `number` int(10) DEFAULT NULL COMMENT '车位数量',
  `open` int(2) DEFAULT NULL COMMENT '是否对外开放：1、是；2、否',
  `month_fee` decimal(10,2) DEFAULT NULL COMMENT '月卡单价',
  `year_fee` decimal(10,2) DEFAULT NULL COMMENT '年卡单价',
  `hour_fee` decimal(10,2) DEFAULT NULL COMMENT '每小时费用',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `temporary_number` int(10) DEFAULT NULL COMMENT '临时停车位总数量',
  `fixed_number` int(10) DEFAULT NULL COMMENT '固定停车位总数量',
  `temporary` int(10) DEFAULT NULL COMMENT '剩余临时停车位数量',
  `fixed` int(10) DEFAULT NULL COMMENT '剩余固定停车位数量',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `contact_way` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `park_id` varchar(50) DEFAULT NULL COMMENT '停车场系统的停车场编号',
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='停车场信息表';

/*Data for the table `bjt_carpark_space` */

insert  into `bjt_carpark_space`(`space_id`,`name`,`address`,`longitude`,`latitude`,`number`,`open`,`month_fee`,`year_fee`,`hour_fee`,`ctime`,`temporary_number`,`fixed_number`,`temporary`,`fixed`,`contact`,`contact_way`,`park_id`) values 
(17,'互联网金融停车场','贵州省-贵阳市-观山湖区-贵阳富力中心','106.626043','26.654584',10,1,1.00,1.00,1.00,1529725156462,1,1,NULL,NULL,'徐徐','18275317961',NULL);

/*Table structure for table `bjt_carpark_space_user` */

DROP TABLE IF EXISTS `bjt_carpark_space_user`;

CREATE TABLE `bjt_carpark_space_user` (
  `space_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `username` varchar(13) NOT NULL COMMENT '用户名',
  `space_id` int(11) NOT NULL COMMENT '停车场编号',
  `realname` varchar(20) NOT NULL COMMENT '用户姓名',
  `space_name` varchar(200) NOT NULL COMMENT '停车场名称',
  PRIMARY KEY (`space_user_id`),
  KEY `FK-Reference-SU1_idx` (`user_id`),
  KEY `FK-Reference-SU2_idx` (`space_id`),
  CONSTRAINT `FK-Reference-SU1` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK-Reference-SU2` FOREIGN KEY (`space_id`) REFERENCES `bjt_carpark_space` (`space_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='停车场管理员中间表';

/*Data for the table `bjt_carpark_space_user` */

insert  into `bjt_carpark_space_user`(`space_user_id`,`user_id`,`username`,`space_id`,`realname`,`space_name`) values 
(16,'3e360a2d56b14b39864535e7072b5d5e','13261656101',17,'Adeep蛋疼','互联网金融停车场');

/*Table structure for table `bjt_park_attribution` */

DROP TABLE IF EXISTS `bjt_park_attribution`;

CREATE TABLE `bjt_park_attribution` (
  `attribution_id` int(11) NOT NULL COMMENT '编号',
  `build_id` int(11) DEFAULT NULL COMMENT '楼宇编号',
  `name` varchar(100) DEFAULT NULL COMMENT '楼宇名称',
  `address` varchar(500) DEFAULT NULL COMMENT '楼宇地址',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `attribution` varchar(100) DEFAULT NULL COMMENT '产权方',
  `property` varchar(100) DEFAULT NULL COMMENT '物业方',
  `type` int(5) DEFAULT NULL COMMENT '产权方类型：0是个人、1是公司等',
  `park` varchar(100) DEFAULT NULL COMMENT '所属园区',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `simple` varchar(50) DEFAULT NULL COMMENT '产权方简称',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_way` varchar(13) DEFAULT NULL COMMENT '联系方式',
  `company_address` varchar(45) DEFAULT NULL COMMENT '公司地址',
  PRIMARY KEY (`attribution_id`),
  KEY `FK_Reference_1_idx` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产权方表';

/*Data for the table `bjt_park_attribution` */

/*Table structure for table `bjt_park_build` */

DROP TABLE IF EXISTS `bjt_park_build`;

CREATE TABLE `bjt_park_build` (
  `build_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '楼宇名称',
  `address` varchar(500) DEFAULT NULL COMMENT '地址',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `latitude` varchar(30) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(30) DEFAULT NULL COMMENT '经度',
  `property` varchar(100) DEFAULT NULL COMMENT '物业方',
  `attribution` varchar(100) DEFAULT NULL COMMENT '产权方',
  `floor` int(10) DEFAULT NULL COMMENT '楼层高度',
  `park` varchar(100) DEFAULT NULL COMMENT '所属园区',
  `remake` varchar(500) DEFAULT NULL COMMENT '备注',
  `code` varchar(12) DEFAULT NULL COMMENT '邀请码',
  `contact` varchar(45) DEFAULT NULL COMMENT '物业方联系人',
  `contact_way` varchar(45) DEFAULT NULL COMMENT '联系方式：手机号或电话号码',
  `area` varchar(45) DEFAULT NULL COMMENT '总面积',
  `space_id` int(11) DEFAULT NULL COMMENT '停车场编号',
  `space_name` varchar(50) DEFAULT NULL COMMENT '停车场名称',
  PRIMARY KEY (`build_id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `build_id` (`build_id`),
  KEY `FK-Reference-B11_idx` (`space_id`),
  CONSTRAINT `FK-Reference-B11` FOREIGN KEY (`space_id`) REFERENCES `bjt_carpark_space` (`space_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COMMENT='楼宇表';

/*Data for the table `bjt_park_build` */

insert  into `bjt_park_build`(`build_id`,`name`,`address`,`ctime`,`utime`,`latitude`,`longitude`,`property`,`attribution`,`floor`,`park`,`remake`,`code`,`contact`,`contact_way`,`area`,`space_id`,`space_name`) values 
(82,'互联网金融特区大厦','贵州省-贵阳市-观山湖区-金朱东路-中天会展城B区金融商务区-北区',1529034581559,1529718774655,'26.65716','106.657911','中天城投','旅文投',80,'金融城','贵阳市唯一互联网特区','A53EBA74E4','王金辉','18785081362',NULL,NULL,NULL),
(83,'美的临城B座','贵州省-贵阳市-观山湖区-长岭北路-美的.林城时代-北区',1529460869801,NULL,'26.646693','106.656303','美的物业公司','美的集团',78,'美的临城','不错','268DC204D5','彦燕','18682020313',NULL,NULL,NULL),
(84,'智能大厦','贵州省-贵阳市-观山湖区-金朱东路-恒大中央公园',1529647300780,NULL,'26.66004','106.650774','智能物业','智能物业',10,'高新区',NULL,'05B463C806','徐尧','18275317961',NULL,NULL,NULL);

/*Table structure for table `bjt_park_build_agreement` */

DROP TABLE IF EXISTS `bjt_park_build_agreement`;

CREATE TABLE `bjt_park_build_agreement` (
  `agreement_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（主键）',
  `name` varchar(100) NOT NULL COMMENT '合同名称',
  `first_party` varchar(100) DEFAULT NULL COMMENT '甲方（物业公司或产权方）',
  `door_plate` varchar(100) DEFAULT NULL COMMENT '房间号',
  `secend_party` varchar(100) DEFAULT NULL COMMENT '乙方：公司',
  `number` varchar(30) DEFAULT NULL COMMENT '合同编号',
  `begin_time` bigint(20) DEFAULT NULL COMMENT '合同开始日期',
  `end_time` bigint(20) DEFAULT NULL COMMENT '合同结束日期',
  `payment` int(5) DEFAULT NULL COMMENT '缴费方式：1、按月缴纳；2、按季度缴纳；3、按年缴纳',
  `pay_fee` varchar(20) DEFAULT NULL COMMENT '缴纳费用',
  `next_time` bigint(20) DEFAULT NULL COMMENT '下次缴费日期',
  `resource` varchar(1000) DEFAULT NULL COMMENT '附件信息json字符串',
  `type` tinyint(4) DEFAULT NULL COMMENT '合同类型：1、物业合同；2、租赁合同',
  `company_id` int(11) DEFAULT NULL COMMENT '公司编号',
  `area` int(10) DEFAULT NULL COMMENT '面积',
  `unit_price` int(10) DEFAULT NULL COMMENT '单价：/平方米/月',
  `total_price` int(10) DEFAULT NULL COMMENT '总价',
  `deposit` int(10) DEFAULT NULL COMMENT '押金',
  `contract` bigint(20) DEFAULT NULL COMMENT '合同生效日期',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `open` tinyint(4) DEFAULT NULL COMMENT '是否开启缴费(1、开启；2、关闭)',
  `build_id` int(11) DEFAULT NULL COMMENT '楼宇编号',
  `build_name` varchar(100) DEFAULT NULL COMMENT '楼宇名称',
  PRIMARY KEY (`agreement_id`),
  KEY `FK_Reference_b_a2_idx` (`company_id`),
  KEY `FK-Reference-BA2_idx` (`build_id`),
  CONSTRAINT `FK-Reference-BA1` FOREIGN KEY (`company_id`) REFERENCES `bjt_park_company` (`company_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK-Reference-BA2` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='合同表';

/*Data for the table `bjt_park_build_agreement` */

/*Table structure for table `bjt_park_build_agreement_record` */

DROP TABLE IF EXISTS `bjt_park_build_agreement_record`;

CREATE TABLE `bjt_park_build_agreement_record` (
  `agreement_id` int(11) NOT NULL COMMENT '编号（主键）',
  `name` varchar(100) DEFAULT NULL COMMENT '合同名称',
  `first_party` varchar(100) DEFAULT NULL COMMENT '甲方（物业公司或产权方）',
  `door_plate` varchar(100) DEFAULT NULL COMMENT '房间号',
  `secend_party` varchar(100) DEFAULT NULL COMMENT '乙方：公司',
  `number` varchar(30) DEFAULT NULL COMMENT '合同编号',
  `begin_time` bigint(20) DEFAULT NULL COMMENT '合同开始日期',
  `end_time` bigint(20) DEFAULT NULL COMMENT '合同结束日期',
  `payment` int(5) DEFAULT NULL COMMENT '缴费方式：1、按月缴纳；2、按季度缴纳；3、按年缴纳',
  `pay_fee` varchar(20) DEFAULT NULL COMMENT '缴纳费用',
  `next_time` bigint(20) DEFAULT NULL COMMENT '下次缴费日期',
  `resource` varchar(1000) DEFAULT NULL COMMENT '附件信息json字符串',
  `type` tinyint(4) DEFAULT NULL COMMENT '合同类型：1、物业合同；2、租赁合同',
  `company_id` int(11) DEFAULT NULL COMMENT '公司编号',
  `area` int(10) DEFAULT NULL COMMENT '面积',
  `unit_price` int(10) DEFAULT NULL COMMENT '单价：/平方米/月',
  `total_price` int(10) DEFAULT NULL COMMENT '总价',
  `deposit` int(10) DEFAULT NULL COMMENT '押金',
  `contract` bigint(20) DEFAULT NULL COMMENT '合同生效日期',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `open` tinyint(4) DEFAULT NULL COMMENT '是否开启缴费(1、开启；2、关闭)',
  `operate` tinyint(4) DEFAULT NULL COMMENT '操作：1、合同续签；2、合同中止；3、合同到期',
  PRIMARY KEY (`agreement_id`),
  KEY `FK_Reference_b_a2_idx` (`company_id`),
  CONSTRAINT `FK-Reference-AR1` FOREIGN KEY (`agreement_id`) REFERENCES `bjt_park_build_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='合同记录表';

/*Data for the table `bjt_park_build_agreement_record` */

/*Table structure for table `bjt_park_build_approval` */

DROP TABLE IF EXISTS `bjt_park_build_approval`;

CREATE TABLE `bjt_park_build_approval` (
  `b_approval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `application` varchar(100) DEFAULT NULL COMMENT '申请事项',
  `content` varchar(500) DEFAULT NULL COMMENT '具体内容',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '完成时间',
  `build_id` int(11) NOT NULL COMMENT '审批管理方',
  `company_id` int(11) NOT NULL COMMENT '审批申请方',
  `user_id` varchar(32) NOT NULL COMMENT '审批发起人',
  `sources` varchar(1000) DEFAULT NULL COMMENT '附件JSON字符串',
  `status` int(11) NOT NULL COMMENT '状态:1、待审批；2、已通过；3、拒绝 ',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `approval_user` varchar(1000) DEFAULT NULL COMMENT '审批人信息（Json字符串）',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `username` varchar(13) DEFAULT NULL COMMENT '申请人用户名',
  `user_realname` varchar(20) DEFAULT NULL COMMENT '申请人姓名',
  PRIMARY KEY (`b_approval_id`),
  KEY `b_approval_id` (`b_approval_id`),
  KEY `FK-Reference-A10_idx` (`build_id`),
  CONSTRAINT `FK-Reference-A10` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公司向楼宇申请审批表';

/*Data for the table `bjt_park_build_approval` */

/*Table structure for table `bjt_park_build_gate` */

DROP TABLE IF EXISTS `bjt_park_build_gate`;

CREATE TABLE `bjt_park_build_gate` (
  `gate_id` int(11) NOT NULL COMMENT '编号',
  `device_identifier` varchar(100) NOT NULL COMMENT '设备编号',
  `build_id` int(11) NOT NULL COMMENT '楼宇编号',
  `describe` varchar(200) DEFAULT NULL COMMENT '描述',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `build_name` varchar(200) DEFAULT NULL COMMENT '楼宇名称',
  PRIMARY KEY (`gate_id`),
  KEY `FK-Reference-G1_idx` (`build_id`),
  CONSTRAINT `FK-Reference-B-G1` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='闸机信息表';

/*Data for the table `bjt_park_build_gate` */

/*Table structure for table `bjt_park_build_gate_record` */

DROP TABLE IF EXISTS `bjt_park_build_gate_record`;

CREATE TABLE `bjt_park_build_gate_record` (
  `g_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `username` varchar(13) DEFAULT NULL COMMENT '用户名（手机号）',
  `device_identifier` varchar(100) DEFAULT NULL COMMENT '设备编号',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `company_id` int(11) DEFAULT NULL COMMENT '公司编号',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型：1、进；2、出',
  `time` bigint(20) DEFAULT NULL COMMENT '进或出的时间',
  `build_id` int(11) NOT NULL COMMENT '楼宇编号',
  PRIMARY KEY (`g_record_id`),
  KEY `FK-Reference-BR1_idx` (`build_id`),
  CONSTRAINT `FK-Reference-BR1` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='闸机记录';

/*Data for the table `bjt_park_build_gate_record` */

/*Table structure for table `bjt_park_build_guard` */

DROP TABLE IF EXISTS `bjt_park_build_guard`;

CREATE TABLE `bjt_park_build_guard` (
  `guard_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `username` varchar(45) NOT NULL COMMENT '用户账号',
  `user_realname` varchar(20) NOT NULL COMMENT '用户姓名',
  `apply_user_id` varchar(32) DEFAULT NULL COMMENT '帮助申请人ID',
  `apply_username` varchar(45) DEFAULT NULL COMMENT '帮助申请人账号',
  `apply_realname` varchar(45) DEFAULT NULL COMMENT '帮助申请人真实姓名',
  `company_name` varchar(45) DEFAULT NULL COMMENT '公司名称',
  `company_id` int(11) DEFAULT NULL COMMENT '公司编号',
  `door_plate` varchar(20) DEFAULT NULL COMMENT '门牌号',
  `id_number` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `guard_main_id` int(11) DEFAULT NULL COMMENT '门禁申请主表编号',
  `remake` varchar(500) DEFAULT NULL COMMENT '备注',
  `type` tinyint(4) DEFAULT NULL COMMENT '权限  1.正常 0.申请中 -1.禁止',
  `build_id` int(11) NOT NULL COMMENT '楼宇编号',
  `build_name` varchar(100) DEFAULT NULL COMMENT '楼宇名称',
  `end_time` bigint(20) DEFAULT NULL COMMENT '权限失效日期',
  PRIMARY KEY (`guard_id`),
  KEY `guard_id` (`guard_id`),
  KEY `FK_Reference_2_idx` (`user_id`),
  KEY `FK_Reference_3_idx` (`apply_user_id`),
  KEY `FK_Reference_B10_idx` (`user_id`,`apply_user_id`),
  KEY `FK_Reference_B14_idx` (`build_id`),
  CONSTRAINT `FK_Reference_B11` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_B14` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COMMENT='用户门禁权限表';

/*Data for the table `bjt_park_build_guard` */

insert  into `bjt_park_build_guard`(`guard_id`,`ctime`,`user_id`,`username`,`user_realname`,`apply_user_id`,`apply_username`,`apply_realname`,`company_name`,`company_id`,`door_plate`,`id_number`,`guard_main_id`,`remake`,`type`,`build_id`,`build_name`,`end_time`) values 
(59,1529479705105,'83f0318adeb34bb1aa8716400dcc2087','13985178336','彦燕',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,83,'美的临城B座',1561015705105),
(61,1529647384886,'ffdaf8c5ff044f6aa5b93cf3579d2040','18275317961','徐尧',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,84,'智能大厦',1561183384886);

/*Table structure for table `bjt_park_build_guard_main` */

DROP TABLE IF EXISTS `bjt_park_build_guard_main`;

CREATE TABLE `bjt_park_build_guard_main` (
  `guard_main_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '门禁申请主表编号',
  `company_name` varchar(100) NOT NULL COMMENT '公司名称',
  `company_id` int(11) NOT NULL COMMENT '公司编号',
  `apply_user_id` varchar(32) NOT NULL COMMENT '申请人编号',
  `apply_user_realname` varchar(20) DEFAULT NULL COMMENT '申请人姓名',
  `apply_time` bigint(20) DEFAULT NULL COMMENT '申请时间',
  `approval_user_id` varchar(32) DEFAULT NULL COMMENT '审批人编号',
  `approval_user_realname` varchar(20) DEFAULT NULL COMMENT '审批人姓名',
  `approval_time` bigint(20) DEFAULT NULL COMMENT '审批时间',
  `detail` varchar(5000) DEFAULT NULL COMMENT '申请明细Json字符串',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `build_id` int(11) NOT NULL COMMENT '楼宇编号',
  `remark` varchar(200) DEFAULT NULL COMMENT '额外备注',
  `apply_username` varchar(13) DEFAULT NULL COMMENT '申请人账号',
  `approval_username` varchar(13) DEFAULT NULL COMMENT '审批人账号',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型:1、待审批，2、已通过，3、未通过',
  `opinion` varchar(200) DEFAULT NULL COMMENT '拒绝时可能要填写的处理意见',
  `end_time` bigint(20) DEFAULT NULL COMMENT '权限失效日期',
  PRIMARY KEY (`guard_main_id`),
  KEY `FK-Reference-G1_idx` (`company_id`),
  KEY `FK-Reference-G2_idx` (`build_id`),
  CONSTRAINT `FK-Reference-G1` FOREIGN KEY (`company_id`) REFERENCES `bjt_park_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK-Reference-G2` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门禁申请主表';

/*Data for the table `bjt_park_build_guard_main` */

/*Table structure for table `bjt_park_build_house` */

DROP TABLE IF EXISTS `bjt_park_build_house`;

CREATE TABLE `bjt_park_build_house` (
  `house_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '房屋编号',
  `floor` int(5) DEFAULT NULL COMMENT '所在楼层',
  `house_number` varchar(15) DEFAULT NULL COMMENT '房间号',
  `area` int(10) DEFAULT NULL COMMENT '面积',
  `build_id` int(10) DEFAULT NULL COMMENT '楼宇编号',
  `build_name` varchar(100) DEFAULT NULL COMMENT '楼宇名称',
  `attribution` varchar(100) DEFAULT NULL COMMENT '产权方',
  `company` varchar(100) DEFAULT NULL COMMENT '公司',
  `company_id` int(10) DEFAULT NULL COMMENT '公司编号',
  `lease_agreement_id` int(10) DEFAULT NULL COMMENT '租赁合同编号',
  `lease_agreement_name` varchar(100) DEFAULT NULL COMMENT '合同名称',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`house_id`),
  KEY `build_id_idx` (`build_id`),
  KEY `FK_Reference_26_idx` (`company_id`),
  KEY `FK_Reference_4_idx` (`lease_agreement_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`company_id`) REFERENCES `bjt_park_company` (`company_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`lease_agreement_id`) REFERENCES `bjt_park_build_agreement` (`agreement_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='房屋信息表';

/*Data for the table `bjt_park_build_house` */

/*Table structure for table `bjt_park_build_notice` */

DROP TABLE IF EXISTS `bjt_park_build_notice`;

CREATE TABLE `bjt_park_build_notice` (
  `b_notice_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `build_id` int(10) NOT NULL COMMENT '楼宇ID',
  `user_id` varchar(36) NOT NULL COMMENT '发布用户ID',
  `name` varchar(36) NOT NULL COMMENT '发布者姓名',
  `content` varchar(5000) NOT NULL COMMENT '内容',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `source` varchar(100) DEFAULT NULL COMMENT '额外备注',
  PRIMARY KEY (`b_notice_id`),
  KEY `b_notice_id` (`b_notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='楼宇公告表';

/*Data for the table `bjt_park_build_notice` */

/*Table structure for table `bjt_park_build_pay_record` */

DROP TABLE IF EXISTS `bjt_park_build_pay_record`;

CREATE TABLE `bjt_park_build_pay_record` (
  `p_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录主键编号',
  `company_id` int(11) NOT NULL COMMENT '公司编号',
  `company_name` varchar(100) NOT NULL COMMENT '公司名称',
  `pay_time` bigint(20) NOT NULL COMMENT '缴费时间',
  `validity` bigint(20) NOT NULL COMMENT '有效期',
  `expire` bigint(20) NOT NULL COMMENT '合同到期日',
  `price` varchar(20) DEFAULT NULL COMMENT '单价',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `type` varchar(45) DEFAULT NULL COMMENT '类型（1租金、2停车、3物业费）',
  `door_plate` varchar(15) DEFAULT NULL COMMENT '门牌号',
  `attribution` varchar(50) DEFAULT NULL COMMENT '产权方',
  `contact` varchar(20) DEFAULT NULL COMMENT '产权方联系人',
  `contact_way` varchar(13) DEFAULT NULL COMMENT '产权方联系方式',
  `build_name` varchar(100) NOT NULL COMMENT '楼宇名称',
  `build_id` int(11) NOT NULL COMMENT '楼宇编号',
  PRIMARY KEY (`p_record_id`),
  KEY `FK-Reference-B-P1_idx` (`company_id`),
  KEY `FK-Reference-B-P2_idx` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='缴费记录表';

/*Data for the table `bjt_park_build_pay_record` */

/*Table structure for table `bjt_park_build_progress` */

DROP TABLE IF EXISTS `bjt_park_build_progress`;

CREATE TABLE `bjt_park_build_progress` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进度编号',
  `b_approval_id` int(11) NOT NULL COMMENT '申请审批编号',
  `last_user_id` varchar(32) DEFAULT NULL COMMENT '上一步处理人编号',
  `last_time` bigint(20) DEFAULT NULL COMMENT '上一步处理时间',
  `last_user_realname` varchar(20) DEFAULT NULL COMMENT '上一步处理人真实姓名',
  `user_id` varchar(32) DEFAULT NULL COMMENT '当前处理人编号',
  `user_realname` varchar(20) DEFAULT NULL COMMENT '当前处理人真实姓名',
  `status` int(5) DEFAULT NULL COMMENT '处理状态：1、待处理、2、已处理',
  `opinion` varchar(300) DEFAULT NULL COMMENT '处理意见',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '处理时间',
  `username` varchar(13) DEFAULT NULL COMMENT '当前处理人账号（手机号）',
  PRIMARY KEY (`progress_id`),
  KEY `FK_Reference_c_p3_idx` (`user_id`),
  KEY `FK_Reference_b_p4_idx` (`b_approval_id`),
  CONSTRAINT `FK_Reference_b_p2` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_b_p4` FOREIGN KEY (`b_approval_id`) REFERENCES `bjt_park_build_approval` (`b_approval_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公司向楼宇申请审批进度表';

/*Data for the table `bjt_park_build_progress` */

/*Table structure for table `bjt_park_build_user` */

DROP TABLE IF EXISTS `bjt_park_build_user`;

CREATE TABLE `bjt_park_build_user` (
  `build_user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `build_id` int(10) unsigned NOT NULL COMMENT '楼宇ID',
  `user_id` varchar(36) NOT NULL COMMENT '用户ID',
  `realname` varchar(20) DEFAULT NULL COMMENT '用户名',
  `username` varchar(13) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`build_user_id`),
  KEY `FK_Reference_b_u_idx` (`user_id`),
  CONSTRAINT `FK_Reference_b_u` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='楼宇管理员表';

/*Data for the table `bjt_park_build_user` */

insert  into `bjt_park_build_user`(`build_user_id`,`build_id`,`user_id`,`realname`,`username`) values 
(48,82,'ff3f2842f0e64015babc33b6b28541e1','王金辉','13381005918'),
(49,83,'83f0318adeb34bb1aa8716400dcc2087','彦燕','13985178336'),
(51,84,'ffdaf8c5ff044f6aa5b93cf3579d2040','徐尧','18275317961');

/*Table structure for table `bjt_park_build_visitor` */

DROP TABLE IF EXISTS `bjt_park_build_visitor`;

CREATE TABLE `bjt_park_build_visitor` (
  `visitor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访客编号',
  `visitor_phone` varchar(13) NOT NULL COMMENT '访客手机号',
  `visitor_name` varchar(20) NOT NULL COMMENT '访客姓名',
  `idcard_front` varchar(300) DEFAULT NULL COMMENT '身份证正面照path',
  `idcard_back` varchar(300) DEFAULT NULL COMMENT '身份证反面照path',
  `visitor_front` varchar(300) DEFAULT NULL COMMENT '访客正面照',
  `visit_matter` varchar(200) NOT NULL COMMENT '访问事宜',
  `interview_phone` varchar(13) NOT NULL COMMENT '被访人手机号',
  `visit_time` bigint(20) DEFAULT NULL COMMENT '访问时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态:1、待处理；2、已通过；3、未通过',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `interview_name` varchar(20) DEFAULT NULL COMMENT '被访人姓名',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `interview_user_id` varchar(32) DEFAULT NULL COMMENT '被访人编号',
  `build_id` int(11) DEFAULT NULL COMMENT '楼宇编号',
  `use_count` int(5) DEFAULT NULL COMMENT '使用次数：最多两次',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型：1、访客记录；2、邀请记录',
  `visitor_delete` tinyint(4) DEFAULT NULL COMMENT '被邀请者逻辑删除字段，默认为1，表示不删除，为2表示已删除',
  `interview_delete` tinyint(4) DEFAULT NULL COMMENT '邀请者或被拜访者逻辑删除字段，默认为1，表示不删除，为2表示已删除',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访客记录表';

/*Data for the table `bjt_park_build_visitor` */

/*Table structure for table `bjt_park_company` */

DROP TABLE IF EXISTS `bjt_park_company`;

CREATE TABLE `bjt_park_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `address` varchar(500) DEFAULT NULL COMMENT '公司具体地址',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `door_plate` varchar(80) DEFAULT NULL COMMENT '门牌号',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `simple` varchar(50) DEFAULT NULL COMMENT '公司简称',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_way` varchar(13) DEFAULT NULL COMMENT '联系方式',
  `build_id` int(11) DEFAULT NULL COMMENT '楼宇编号',
  `build_name` varchar(50) DEFAULT NULL COMMENT '楼宇名称',
  `code` varchar(12) DEFAULT NULL COMMENT '邀请码',
  `industry` varchar(100) DEFAULT NULL COMMENT '所在行业',
  `floor` varchar(45) DEFAULT NULL COMMENT '所在楼层',
  PRIMARY KEY (`company_id`),
  KEY `company_id` (`company_id`),
  KEY `FK_Reference_C11_idx` (`build_id`),
  CONSTRAINT `FK_Reference_C11` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COMMENT='楼宇公司表';

/*Data for the table `bjt_park_company` */

insert  into `bjt_park_company`(`company_id`,`name`,`address`,`ctime`,`utime`,`door_plate`,`remark`,`simple`,`contact`,`contact_way`,`build_id`,`build_name`,`code`,`industry`,`floor`) values 
(104,'中天物业','白云',1529631088583,NULL,NULL,NULL,'中天物业',NULL,NULL,NULL,NULL,NULL,'互联网',NULL),
(107,'vv','dd',1529653712365,NULL,NULL,NULL,'vv',NULL,NULL,NULL,NULL,NULL,'CC',NULL),
(108,'贵州贵成物业','贵州省贵阳市云岩区',1529719994960,NULL,NULL,NULL,'贵州贵成物业','18275317961','18275317961',NULL,NULL,NULL,'物业',NULL);

/*Table structure for table `bjt_park_company_admission` */

DROP TABLE IF EXISTS `bjt_park_company_admission`;

CREATE TABLE `bjt_park_company_admission` (
  `company_id` int(11) NOT NULL COMMENT '公司编号',
  `company_name` varchar(50) NOT NULL COMMENT '公司名称',
  `code` varchar(10) DEFAULT NULL COMMENT '邀请码',
  `build_id` int(11) NOT NULL COMMENT '楼宇编号',
  `build_name` varchar(50) NOT NULL COMMENT '楼宇名称',
  `apply_time` bigint(20) DEFAULT NULL COMMENT '申请时间',
  `approval_time` bigint(20) DEFAULT NULL COMMENT '审批时间',
  `apply_user_id` varchar(32) NOT NULL COMMENT '申请人用户编号',
  `approval_user_id` varchar(32) DEFAULT NULL COMMENT '审批人用户编号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1、待审批；2、已通过、3未通过',
  `opinion` varchar(200) DEFAULT NULL COMMENT '审批意见',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `applyer` varchar(30) DEFAULT NULL COMMENT '申请人姓名',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`company_id`),
  KEY `FK-Reference-CB1_idx` (`build_id`),
  CONSTRAINT `FK-Reference-CB2` FOREIGN KEY (`company_id`) REFERENCES `bjt_park_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公司申请入驻记录表';

/*Data for the table `bjt_park_company_admission` */

/*Table structure for table `bjt_park_company_clock` */

DROP TABLE IF EXISTS `bjt_park_company_clock`;

CREATE TABLE `bjt_park_company_clock` (
  `clock_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '打卡编号',
  `user_id` varchar(32) NOT NULL,
  `in_time` bigint(20) DEFAULT NULL COMMENT '上班打卡时间',
  `in_type` int(5) DEFAULT NULL COMMENT '上班打卡类型：1、正常；2、迟到；3、外勤打卡',
  `in_address` varchar(50) DEFAULT NULL COMMENT '打卡的地址',
  `in_longitude` varchar(30) DEFAULT NULL COMMENT '上班打卡的经度',
  `in_latitude` varchar(30) DEFAULT NULL COMMENT '上班打卡的纬度',
  `out_time` bigint(20) DEFAULT NULL COMMENT '下班打卡的时间',
  `out_type` int(5) DEFAULT NULL COMMENT '下班打卡的类型：1、正常;2、早退；3、外勤打卡',
  `out_address` varchar(50) DEFAULT NULL COMMENT '下班打卡的地址',
  `out_longitude` varchar(30) DEFAULT NULL COMMENT '下班打卡的经度',
  `out_latitude` varchar(30) DEFAULT NULL COMMENT '下班打卡的纬度',
  `user_realname` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `in_way` int(5) DEFAULT NULL COMMENT '上班打卡方式：1、WiFi、2、流量',
  `out_way` int(5) DEFAULT NULL COMMENT '下班打卡方式：1、WiFi、2、流量',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `late_remark` varchar(200) DEFAULT NULL COMMENT '迟到备注',
  `leave_remark` varchar(200) DEFAULT NULL COMMENT '早退备注',
  PRIMARY KEY (`clock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='考勤打卡表';

/*Data for the table `bjt_park_company_clock` */

insert  into `bjt_park_company_clock`(`clock_id`,`user_id`,`in_time`,`in_type`,`in_address`,`in_longitude`,`in_latitude`,`out_time`,`out_type`,`out_address`,`out_longitude`,`out_latitude`,`user_realname`,`remark`,`in_way`,`out_way`,`ctime`,`late_remark`,`leave_remark`) values 
(2,'63bda9ba4f2841a3be854702ffafe58e',1529628596392,1,'贵州省贵阳市观山湖区210国道附近','106.6576346536383','26.657417539241674',NULL,NULL,NULL,NULL,NULL,'赵倩',NULL,1,NULL,1529628596392,NULL,NULL),
(5,'e600034e6c664f6f9cb72232dcbeaf09',1529629956678,2,'贵州省贵阳市观山湖区210国道附近','106.65775117810702','26.657213834660919',NULL,NULL,NULL,NULL,NULL,'徐尧',NULL,2,NULL,1529629956678,'堵车',NULL),
(7,'3e360a2d56b14b39864535e7072b5d5e',NULL,NULL,NULL,NULL,NULL,1529653734472,2,'贵州省贵阳市观山湖区金朱东路7号靠近贵阳互联网金融特区大厦','106.651136','26.651651','旺旺',NULL,NULL,1,1529653734598,NULL,'CC');

/*Table structure for table `bjt_park_company_clock_rule` */

DROP TABLE IF EXISTS `bjt_park_company_clock_rule`;

CREATE TABLE `bjt_park_company_clock_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `in_time` varchar(45) NOT NULL COMMENT '上班时间',
  `out_time` varchar(45) NOT NULL COMMENT '下班时间',
  `work_day` varchar(15) NOT NULL COMMENT '上班日：1,2,3,4,5\n用,号分开，表示周一到周五都上班',
  `company_id` int(11) NOT NULL COMMENT '公司编号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `longitude` varchar(45) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(45) DEFAULT NULL COMMENT '纬度',
  `address` varchar(100) DEFAULT NULL COMMENT '楼宇名称',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `wifi_name` varchar(100) DEFAULT NULL COMMENT 'wifi名称',
  PRIMARY KEY (`rule_id`),
  KEY `FK_Reference_1_idx` (`company_id`),
  CONSTRAINT `FK_Reference_c` FOREIGN KEY (`company_id`) REFERENCES `bjt_park_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='打卡规则表';

/*Data for the table `bjt_park_company_clock_rule` */

insert  into `bjt_park_company_clock_rule`(`rule_id`,`in_time`,`out_time`,`work_day`,`company_id`,`remark`,`longitude`,`latitude`,`address`,`ctime`,`wifi_name`) values 
(3,'09:00','18:00','1,2,3,4,5',107,NULL,'106.651132106781','26.651649128786996','贵州省贵阳市观山湖区金麦社区服务中心金朱东路7号',1529653719032,'D-Link_DIR-605L');

/*Table structure for table `bjt_park_company_leave` */

DROP TABLE IF EXISTS `bjt_park_company_leave`;

CREATE TABLE `bjt_park_company_leave` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请编号',
  `user_id` varchar(32) NOT NULL COMMENT '申请人编号',
  `begin_time` bigint(20) DEFAULT NULL COMMENT '开始时间',
  `end_time` bigint(20) DEFAULT NULL COMMENT '结束时间',
  `long_time` int(10) DEFAULT NULL COMMENT '时长',
  `reason` varchar(500) NOT NULL COMMENT '事由',
  `resource` varchar(500) DEFAULT NULL COMMENT '图片json字符串',
  `approver` varchar(5000) DEFAULT NULL COMMENT '审批人',
  `copyer` varchar(45) DEFAULT NULL COMMENT '抄送人',
  `copyer_id` varchar(200) DEFAULT NULL COMMENT '抄送人编号',
  `remark` varchar(45) DEFAULT NULL COMMENT '备注',
  `applyer` varchar(20) DEFAULT NULL COMMENT '申请人姓名',
  `status` int(5) NOT NULL COMMENT '申请进度：1、待审批、2、通过、3、未通过',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `type` tinyint(4) DEFAULT NULL COMMENT '申请类型：1、事假；2、病假；3、出差；4、其他',
  `username` varchar(13) DEFAULT NULL COMMENT '申请人账号',
  PRIMARY KEY (`leave_id`),
  KEY `FK_Reference_b_c_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='请假、外出等申请表';

/*Data for the table `bjt_park_company_leave` */

/*Table structure for table `bjt_park_company_notice` */

DROP TABLE IF EXISTS `bjt_park_company_notice`;

CREATE TABLE `bjt_park_company_notice` (
  `c_notice_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `company_id` int(11) NOT NULL COMMENT '公司ID',
  `user_id` varchar(32) NOT NULL COMMENT '发布用户ID',
  `name` varchar(36) NOT NULL COMMENT '发布者姓名',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `source` varchar(200) DEFAULT NULL COMMENT '额外备注',
  PRIMARY KEY (`c_notice_id`),
  KEY `c_notice_id` (`c_notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公司公告表';

/*Data for the table `bjt_park_company_notice` */

/*Table structure for table `bjt_park_company_progress` */

DROP TABLE IF EXISTS `bjt_park_company_progress`;

CREATE TABLE `bjt_park_company_progress` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进度编号',
  `leave_id` int(11) DEFAULT NULL COMMENT '申请审批编号',
  `last_user_id` varchar(32) DEFAULT NULL COMMENT '上一步处理人编号',
  `last_time` bigint(20) DEFAULT NULL COMMENT '上一步处理时间',
  `last_user_realname` varchar(20) DEFAULT NULL COMMENT '上一步处理人真实姓名',
  `user_id` varchar(32) DEFAULT NULL COMMENT '当前处理人编号',
  `user_realname` varchar(20) DEFAULT NULL COMMENT '当前处理人真实姓名',
  `status` tinyint(4) DEFAULT NULL COMMENT '处理状态：0表示待审批，1表示同意，2表示拒绝，3表示转批',
  `opinion` varchar(300) DEFAULT NULL COMMENT '处理意见',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '处理时间',
  `username` varchar(20) DEFAULT NULL COMMENT '当前处理人账号（手机号）',
  PRIMARY KEY (`progress_id`),
  KEY `FK_Reference_c_p3_idx` (`user_id`),
  KEY `FK_Reference_c_p3_idx1` (`last_user_id`),
  KEY `FK_Reference_c_p1_idx` (`leave_id`),
  CONSTRAINT `FK_Reference_c_p1` FOREIGN KEY (`leave_id`) REFERENCES `bjt_park_company_leave` (`leave_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_c_p2` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_c_p3` FOREIGN KEY (`last_user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='申请审批进度表';

/*Data for the table `bjt_park_company_progress` */

/*Table structure for table `bjt_park_company_sign` */

DROP TABLE IF EXISTS `bjt_park_company_sign`;

CREATE TABLE `bjt_park_company_sign` (
  `sign_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '签到编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `user_realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sign_time` bigint(20) NOT NULL COMMENT '签到时间',
  `address` varchar(50) NOT NULL COMMENT '签到地址',
  `longitude` varchar(15) NOT NULL COMMENT '经度',
  `latitude` varchar(15) NOT NULL COMMENT '纬度',
  `resource` varchar(500) DEFAULT NULL COMMENT 'json字符串',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到表';

/*Data for the table `bjt_park_company_sign` */

/*Table structure for table `bjt_park_company_user` */

DROP TABLE IF EXISTS `bjt_park_company_user`;

CREATE TABLE `bjt_park_company_user` (
  `company_user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `company_id` int(10) unsigned NOT NULL COMMENT '公司ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `type` tinyint(4) NOT NULL COMMENT '员工类型：1、普通员工；2、工作台管理员；3、公司管理员',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `job` varchar(50) DEFAULT NULL COMMENT '职务',
  `realname` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  `phone` varchar(13) DEFAULT NULL COMMENT '员工手机号',
  `id_number` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `department` varchar(100) DEFAULT NULL COMMENT '部门',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别：1男，2女',
  PRIMARY KEY (`company_user_id`),
  KEY `FK_Reference_c_u` (`user_id`),
  CONSTRAINT `FK_Reference_c_u` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COMMENT='公司管理员表';

/*Data for the table `bjt_park_company_user` */

insert  into `bjt_park_company_user`(`company_user_id`,`company_id`,`user_id`,`type`,`company_name`,`job`,`realname`,`phone`,`id_number`,`department`,`sex`) values 
(185,104,'ff3f2842f0e64015babc33b6b28541e1',3,'中天物业',NULL,'王金辉','13381005918','133030197008181793',NULL,NULL),
(187,104,'ccf6e4ad87034ce8b8aae1815ee91dd0',1,'中天物业','null','柳溪','13518507442','522525196003058650','null',NULL),
(189,107,'3e360a2d56b14b39864535e7072b5d5e',3,'vv',NULL,'旺旺','15519138713','522121199303287638',NULL,NULL),
(190,104,'10f46ba871e1432ab84ca462b6b8252e',1,'中天物业','null','小丽','18785081362','133030197008181793','null',NULL),
(191,108,'ffdaf8c5ff044f6aa5b93cf3579d2040',3,'贵州贵成物业',NULL,'徐尧','18275317961','522423199412272637',NULL,NULL);

/*Table structure for table `bjt_system_app_carousel` */

DROP TABLE IF EXISTS `bjt_system_app_carousel`;

CREATE TABLE `bjt_system_app_carousel` (
  `carousel_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` int(5) DEFAULT NULL COMMENT '类型：1为广告，2为普通图片',
  `image_path` varchar(200) NOT NULL COMMENT '图片路径',
  `order_value` int(10) DEFAULT NULL COMMENT '显示顺序',
  `status` int(5) DEFAULT NULL COMMENT '状态：1为禁用、2为启用',
  `link` varchar(200) DEFAULT NULL COMMENT '跳转链接',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `show_start_time` bigint(20) DEFAULT NULL COMMENT '投放在APP首页的开始时间',
  `show_end_time` bigint(20) DEFAULT NULL COMMENT '投放在APP首页的结束时间',
  `belong` int(5) DEFAULT NULL COMMENT '所属的APP版本',
  PRIMARY KEY (`carousel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='APP首页轮播图';

/*Data for the table `bjt_system_app_carousel` */

insert  into `bjt_system_app_carousel`(`carousel_id`,`type`,`image_path`,`order_value`,`status`,`link`,`remark`,`ctime`,`name`,`show_start_time`,`show_end_time`,`belong`) values 
(1,NULL,'http://p7iv3nhe5.bkt.clouddn.com/img/1528965559831_img1.png',1,2,'http://www.bangjiat.com',NULL,1528965562887,'图1',1528992000000,1624636800000,NULL),
(2,NULL,'http://p7iv3nhe5.bkt.clouddn.com/img/1528965582743_img2.png',2,2,'http://www.bangjiat.com',NULL,1528965585124,'图2',1529078400000,1593187200000,NULL),
(3,NULL,'http://p7iv3nhe5.bkt.clouddn.com/img/1528965603756_img3.png',3,2,'http://www.bangjiat.com',NULL,1528965608984,'图3',1529683200000,1593187200000,NULL),
(5,NULL,'http://p7iv3nhe5.bkt.clouddn.com/img/1528965731076_img4.png',4,2,'http://www.bangjiat.com',NULL,1528965733945,'图4',1528992000000,1593187200000,NULL);

/*Table structure for table `bjt_system_download` */

DROP TABLE IF EXISTS `bjt_system_download`;

CREATE TABLE `bjt_system_download` (
  `key_id` varchar(100) NOT NULL COMMENT '链接key',
  `value` varchar(500) NOT NULL COMMENT '链接地址',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `key_UNIQUE` (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='下载信息表';

/*Data for the table `bjt_system_download` */

insert  into `bjt_system_download`(`key_id`,`value`) values 
('android_app','http://p7iv3nhe5.bkt.clouddn.com/file/1529550509285_bjtV1.2.9.apk');

/*Table structure for table `bjt_system_log` */

DROP TABLE IF EXISTS `bjt_system_log`;

CREATE TABLE `bjt_system_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `description` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `start_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `spend_time` int(11) DEFAULT NULL COMMENT '消耗时间',
  `base_path` varchar(500) DEFAULT NULL COMMENT '根路径',
  `uri` varchar(500) DEFAULT NULL COMMENT 'URI',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `parameter` mediumtext,
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户标识',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `result` mediumtext,
  `permissions` varchar(100) DEFAULT NULL COMMENT '权限值',
  `build_id` int(11) NOT NULL COMMENT '楼宇ID',
  PRIMARY KEY (`log_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=924 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

/*Data for the table `bjt_system_log` */

insert  into `bjt_system_log`(`log_id`,`description`,`username`,`start_time`,`spend_time`,`base_path`,`uri`,`url`,`method`,`parameter`,`user_agent`,`ip`,`result`,`permissions`,`build_id`) values 
(898,'角色添加','13381005918',1529034668651,NULL,'/admin/role/add','http://api.bangjiat.com/admin/role/add/Role',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','111.121.64.148',NULL,'bjt:manage:role:add',82),
(899,'角色添加','13381005918',1529034739551,NULL,'/admin/role/add','http://api.bangjiat.com/admin/role/add/addPermissionByRoleId',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','111.121.64.148',NULL,'bjt:manage:role:add',82),
(900,'角色修改','13381005918',1529034741918,NULL,'/admin/role/update','http://api.bangjiat.com/admin/role/update/Role',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','111.121.64.148',NULL,'bjt:manage:role:update',82),
(901,'角色添加','13381005918',1529034817142,NULL,'/admin/role/add','http://api.bangjiat.com/admin/role/add/addPermissionByRoleId',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','111.121.64.148',NULL,'bjt:manage:role:add',82),
(902,'角色修改','13381005918',1529034818853,NULL,'/admin/role/update','http://api.bangjiat.com/admin/role/update/Role',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','111.121.64.148',NULL,'bjt:manage:role:update',82),
(903,'管理员添加','13381005918',1529034831144,NULL,'/admin/user/add','http://api.bangjiat.com/admin/user/add/addRoleByUserId',NULL,'POST','{}','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','111.121.64.148',NULL,'bjt:manage:user:add',82),
(904,'角色添加','18275317961',1529654599150,NULL,'/admin/role/add','http://api.bangjiat.com/admin/role/add/Role',NULL,'POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','1.204.112.77',NULL,'bjt:manage:role:add',84),
(905,'角色添加','18275317961',1529654604376,NULL,'/admin/role/add','http://api.bangjiat.com/admin/role/add/addPermissionByRoleId',NULL,'POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','1.204.112.77',NULL,'bjt:manage:role:add',84),
(906,'管理员添加','18275317961',1529654613414,NULL,'/admin/user/add','http://api.bangjiat.com/admin/user/add/addRoleByUserId',NULL,'POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','1.204.112.77',NULL,'bjt:manage:user:add',84),
(907,'门禁修改','18275317961',1529741960896,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(908,'门禁修改','18275317961',1529741974398,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(909,'门禁修改','18275317961',1529742064822,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(910,'门禁修改','18275317961',1529742621793,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(911,'门禁修改','18275317961',1529742697786,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(912,'门禁修改','18275317961',1529742839751,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(913,'门禁修改','18275317961',1529742982889,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(914,'门禁修改','18275317961',1529743001524,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(915,'门禁修改','18275317961',1529743081655,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(916,'门禁修改','18275317961',1529743224924,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(917,'门禁修改','18275317961',1529743499876,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(918,'门禁修改','18275317961',1529743515215,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(919,'门禁修改','18275317961',1529743593845,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(920,'门禁修改','18275317961',1529743641870,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(921,'门禁修改','18275317961',1529743687087,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(922,'门禁修改','18275317961',1529743807629,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84),
(923,'门禁修改','18275317961',1529744019067,NULL,'/admin/guard/update','http://192.168.0.112/admin/guard/update/BuildGuard',NULL,'PUT','{}','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','192.168.0.112',NULL,'bjt:manage:guard:update',84);

/*Table structure for table `bjt_system_notice` */

DROP TABLE IF EXISTS `bjt_system_notice`;

CREATE TABLE `bjt_system_notice` (
  `s_notice_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `user_id` varchar(36) NOT NULL COMMENT '发布用户ID',
  `name` varchar(36) NOT NULL COMMENT '发布者姓名',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `source` varchar(100) DEFAULT NULL COMMENT '额外备注',
  `type` int(10) DEFAULT NULL COMMENT '公告类型',
  PRIMARY KEY (`s_notice_id`),
  KEY `s_notice_id` (`s_notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='系统公告表';

/*Data for the table `bjt_system_notice` */

insert  into `bjt_system_notice`(`s_notice_id`,`user_id`,`name`,`content`,`ctime`,`utime`,`source`,`type`) values 
(10,'3','vivo年度旗舰NEX全新发布','  增长乏力，中国智能手机市场加速了优胜劣汰，\"马太效应\"愈发明显。\n近日，手机市场各统计数据陆续发布，悬殊的对比数据是近年来市场激烈竞争的一面镜子。不过，以华为、OPPO、vivo为代表的中国市场头部竞争者格局依然牢固，上述三家厂商在2018Q1期间分别以23.8%，18.5%和16%的市场份额成为中国手机行业的前三强。\n值得一提的是，作为国内智能手机市场的前三甲，vivo近年来的成绩非常出色。对此，有研究机构甚至断言，\"以vivo为代表的中国安卓手机厂商的成功已经对苹果在中国市场的表现构成了更大的威胁。\"\n对于vivo快速获得市场份额的原因，引发了行业内众多参与者的思考，很多人试图简单地抽象出vivo成功的关键，渠道和娱乐营销被反复提及，但这仅仅是表象。事实上，vivo对提升用户体验和技术创新等方面投入了巨大的热忱。',1529047394048,NULL,NULL,NULL),
(11,'3','大戏开锣 围观俄罗斯世界杯的欢乐和哀伤','  大戏开锣，每隔四年的这一个月，中国球迷都将创造世界上“围观世界杯”的人数纪录。世界杯可以没有中国队，但中国球迷离不开世界杯。亲身到比赛城市领略世界杯风情的人毕竟是少数，更多的就是在电视机前，心和现场一起跳动。\n\n　　日前，西南财大发布公告：学校将从6月14日开始，在多媒体教室直播当日赛事，比赛期间，后勤各食堂在就餐时间将电视调至体育频道，方便同学们了解赛事信息。“又是人家的大学”……消息一出，叫好声一片。此举确实不错，从管理变为关怀，这才是最有人情味的大学生活，这段记忆一定会成为同学们不会淡忘的人生篇章。\n\n　　恐怕每个人都有一段电视机前看世界杯比赛的记忆，那是岁月、情感乃至灵魂深处的共鸣。1986年，世界杯在墨西哥举行，马拉多纳的个人英雄主义魅力令人为之心折，阿根廷队与英格兰队比赛值得一看再看，很多人因为那不可思议的“连过五人”，终生成为阿根廷队与马拉多纳的球迷。',1529047400672,NULL,NULL,NULL),
(12,'3','版本升级提示','2018年12月1日帮家团版本升级',1529634218792,NULL,NULL,NULL),
(13,'3','测试2','测试2',1529633873935,NULL,NULL,NULL),
(14,'3','测试4','abcdef',1529646052110,NULL,NULL,NULL);

/*Table structure for table `bjt_user_address_list` */

DROP TABLE IF EXISTS `bjt_user_address_list`;

CREATE TABLE `bjt_user_address_list` (
  `address_list_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通讯录主键ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '添加者的用户编号',
  `slave_user_id` varchar(32) DEFAULT NULL COMMENT '被添加者的用户编号',
  `status` int(5) DEFAULT NULL COMMENT '状态: 1是正常、2是删除、3是黑名单',
  `slave_nickname` varchar(50) DEFAULT NULL COMMENT '被添加者的昵称(添加者可改为备注)',
  `slave_username` varchar(13) DEFAULT NULL COMMENT '被添加者账号',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `avatar` varchar(1000) DEFAULT NULL COMMENT '联系人头像',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`address_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COMMENT='通讯录表';

/*Data for the table `bjt_user_address_list` */

insert  into `bjt_user_address_list`(`address_list_id`,`user_id`,`slave_user_id`,`status`,`slave_nickname`,`slave_username`,`ctime`,`avatar`,`remark`) values 
(89,'ff3f2842f0e64015babc33b6b28541e1','10f46ba871e1432ab84ca462b6b8252e',1,'小丽','18785081362',NULL,NULL,NULL),
(90,'3e360a2d56b14b39864535e7072b5d5e','3e360a2d56b14b39864535e7072b5d5e',1,'旺旺','15519138713',NULL,NULL,NULL),
(91,'e600034e6c664f6f9cb72232dcbeaf09','63bda9ba4f2841a3be854702ffafe58e',1,'赵倩','18083363565',NULL,NULL,NULL),
(92,'ccf6e4ad87034ce8b8aae1815ee91dd0','10f46ba871e1432ab84ca462b6b8252e',1,'王金辉','18785081362',NULL,NULL,NULL),
(93,'e600034e6c664f6f9cb72232dcbeaf09','3e360a2d56b14b39864535e7072b5d5e',1,'旺旺。','15519138713',NULL,'http://p7iv3nhe5.bkt.clouddn.com/img/1529484332453_20180620164532.jpg',NULL),
(94,'10f46ba871e1432ab84ca462b6b8252e','3e360a2d56b14b39864535e7072b5d5e',1,'旺旺。','15519138713',NULL,NULL,NULL),
(95,'3e360a2d56b14b39864535e7072b5d5e','10f46ba871e1432ab84ca462b6b8252e',1,'王金辉','18785081362',NULL,NULL,NULL),
(96,'3e360a2d56b14b39864535e7072b5d5e','ff3f2842f0e64015babc33b6b28541e1',1,'夏雨','13381005918',NULL,NULL,NULL),
(97,'3e360a2d56b14b39864535e7072b5d5e','e600034e6c664f6f9cb72232dcbeaf09',1,'徐尧1','17685302679',NULL,NULL,NULL);

/*Table structure for table `bjt_user_bill` */

DROP TABLE IF EXISTS `bjt_user_bill`;

CREATE TABLE `bjt_user_bill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `money` decimal(10,2) DEFAULT NULL COMMENT '缴费金额',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（0逾期、1已缴纳、2未缴纳等）',
  `type` tinyint(4) DEFAULT NULL COMMENT '账单类型（1房租、2物业费）',
  `pay_way` tinyint(4) DEFAULT NULL COMMENT '缴费方式(1是支付宝，2是微信，3是银行卡，4是其它)',
  `cut_off_time` bigint(20) DEFAULT NULL COMMENT '截止时间',
  `pay_time` bigint(20) DEFAULT NULL COMMENT '缴纳时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `username` varchar(20) DEFAULT NULL COMMENT '用户账号',
  `company_id` int(11) NOT NULL COMMENT '公司编号',
  `company_name` varchar(150) DEFAULT NULL COMMENT '公司名称',
  `house_number` varchar(20) DEFAULT NULL COMMENT '门牌号',
  `build_id` int(11) DEFAULT NULL COMMENT '楼宇编号',
  `agreement_id` int(11) DEFAULT NULL COMMENT '合同主键编号',
  PRIMARY KEY (`bill_id`),
  KEY `FK-Reference-UB1_idx` (`company_id`),
  KEY `FK-Reference-UB2_idx` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户账单';

/*Data for the table `bjt_user_bill` */

/*Table structure for table `bjt_user_consumption` */

DROP TABLE IF EXISTS `bjt_user_consumption`;

CREATE TABLE `bjt_user_consumption` (
  `consumption_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消费编号',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `money` decimal(10,2) DEFAULT NULL COMMENT '消费金额',
  `detail` varchar(300) DEFAULT NULL COMMENT '消费详情',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `trade_no` varchar(36) DEFAULT NULL COMMENT '交易流水号',
  PRIMARY KEY (`consumption_id`),
  KEY `FK_Reference_1_idx` (`user_id`),
  CONSTRAINT `FK_Reference_C1` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户消费记录';

/*Data for the table `bjt_user_consumption` */

/*Table structure for table `bjt_user_email_box` */

DROP TABLE IF EXISTS `bjt_user_email_box`;

CREATE TABLE `bjt_user_email_box` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮件ID',
  `sender` varchar(20) DEFAULT NULL COMMENT '发件人',
  `sender_id` varchar(32) NOT NULL COMMENT '发件人编号',
  `receiver` varchar(500) DEFAULT NULL COMMENT '收件人(用,分开)',
  `receiver_id` varchar(500) NOT NULL COMMENT '收件人编号(用,拼接的字符串)',
  `copyer` varchar(50) DEFAULT NULL COMMENT '抄送人',
  `copyer_id` varchar(32) DEFAULT NULL COMMENT '抄送人编号',
  `title` varchar(100) DEFAULT NULL COMMENT '主题',
  `content` varchar(2000) DEFAULT NULL COMMENT '邮件内容',
  `send_type` int(5) DEFAULT NULL COMMENT '发送类型：0：普通、1：急件',
  `send_date` bigint(20) DEFAULT NULL COMMENT '发送时间',
  `read_date` bigint(20) DEFAULT NULL COMMENT '读取时间',
  `box_type` int(5) DEFAULT NULL COMMENT '发件人邮箱类型：1：草稿箱、2：发件箱、3：垃圾箱',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `resource` varchar(1000) DEFAULT NULL COMMENT '附件json字符串',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `sender_username` varchar(13) DEFAULT NULL COMMENT '发件人账号',
  `receiver_avatar` varchar(3000) DEFAULT NULL COMMENT '收件人头像',
  `sender_avatar` varchar(300) DEFAULT NULL COMMENT '发件人头像',
  PRIMARY KEY (`email_id`),
  KEY `FK_Reference_E_B1_idx` (`sender_id`),
  CONSTRAINT `FK_Reference_E_B1` FOREIGN KEY (`sender_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COMMENT='邮箱表';

/*Data for the table `bjt_user_email_box` */

insert  into `bjt_user_email_box`(`email_id`,`sender`,`sender_id`,`receiver`,`receiver_id`,`copyer`,`copyer_id`,`title`,`content`,`send_type`,`send_date`,`read_date`,`box_type`,`ctime`,`resource`,`remark`,`sender_username`,`receiver_avatar`,`sender_avatar`) values 
(57,'柳溪','ccf6e4ad87034ce8b8aae1815ee91dd0','王金辉','10f46ba871e1432ab84ca462b6b8252e,1',NULL,NULL,'好好像','好好/',0,1529639706164,0,2,1529639706164,'http://p7iv3nhe5.bkt.clouddn.com/img/1529639705589_wx_camera_1529637699512.jpg',NULL,NULL,NULL,NULL),
(58,'徐尧1','e600034e6c664f6f9cb72232dcbeaf09','旺旺。','3e360a2d56b14b39864535e7072b5d5e,1',NULL,NULL,'贵州','好吧、贵州的小伙伴可以',0,1529644090947,NULL,2,1529644090947,NULL,NULL,'17685302679','http://p7iv3nhe5.bkt.clouddn.com/img/1529484332453_20180620164532.jpg','http://p7iv3nhe5.bkt.clouddn.com/img/1529028575786_20180615100937.jpg'),
(59,'王金辉','10f46ba871e1432ab84ca462b6b8252e','旺旺。','3e360a2d56b14b39864535e7072b5d5e,1',NULL,NULL,'十一月','打广告',0,1529644188750,0,2,1529644188750,NULL,NULL,NULL,NULL,NULL),
(60,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','王金辉','10f46ba871e1432ab84ca462b6b8252e,1',NULL,NULL,'你好','你好',0,1529644226599,0,2,1529644226599,NULL,NULL,NULL,NULL,NULL),
(61,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','夏雨','ff3f2842f0e64015babc33b6b28541e1,1',NULL,NULL,'你好','你好',0,1529644269538,0,2,1529644269538,NULL,NULL,NULL,NULL,NULL),
(62,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','王金辉','10f46ba871e1432ab84ca462b6b8252e,1',NULL,NULL,'梦想MC','对你的你',0,1529644299335,0,2,1529644299335,NULL,NULL,NULL,NULL,NULL),
(63,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','夏雨','ff3f2842f0e64015babc33b6b28541e1,1',NULL,NULL,'小魔仙','出门CK',0,1529644314479,0,2,1529644314479,NULL,NULL,NULL,NULL,NULL),
(64,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','徐尧1','e600034e6c664f6f9cb72232dcbeaf09,1',NULL,NULL,'你','是你',0,1529644369994,0,2,1529644369994,NULL,NULL,NULL,NULL,NULL),
(65,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','徐尧1','e600034e6c664f6f9cb72232dcbeaf09,1',NULL,NULL,'你好','你们',0,1529644389801,0,2,1529644389801,NULL,NULL,NULL,NULL,NULL),
(66,'徐尧1','e600034e6c664f6f9cb72232dcbeaf09','旺旺。','3e360a2d56b14b39864535e7072b5d5e,1',NULL,NULL,'你号','降价',0,1529644422265,0,2,1529644422265,NULL,NULL,NULL,NULL,NULL),
(67,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','徐尧1','e600034e6c664f6f9cb72232dcbeaf09,1',NULL,NULL,'信息','信息',0,1529644700783,0,2,1529644700783,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `bjt_user_email_box_record` */

DROP TABLE IF EXISTS `bjt_user_email_box_record`;

CREATE TABLE `bjt_user_email_box_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮件ID',
  `sender` varchar(50) DEFAULT NULL COMMENT '发件人',
  `sender_id` varchar(32) NOT NULL COMMENT '发件人编号',
  `receiver_id` varchar(32) NOT NULL COMMENT '收件人编号',
  `copyer` varchar(50) DEFAULT NULL COMMENT '抄送人',
  `copyer_id` varchar(32) DEFAULT NULL COMMENT '抄送人编号',
  `title` varchar(200) DEFAULT NULL COMMENT '主题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `send_type` int(5) DEFAULT NULL COMMENT '发送类型：0：普通、1：急件',
  `send_date` bigint(20) DEFAULT NULL COMMENT '发送时间',
  `read_date` bigint(20) DEFAULT NULL COMMENT '读取时间',
  `box_type` int(5) DEFAULT NULL COMMENT '邮箱类型：1：收件箱、2：垃圾箱',
  `email_status` int(5) DEFAULT NULL COMMENT '邮件状态：0：未读、1：已读、2：回复、3：转发、4：全部转发',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `resource` varchar(1000) DEFAULT NULL COMMENT '附件json字符串',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `email_id` int(11) NOT NULL COMMENT '发件的编号',
  `receiver_username` varchar(13) DEFAULT NULL COMMENT '收件人账号',
  `sender_avatar` varchar(300) DEFAULT NULL COMMENT '发件人头像',
  `sender_username` varchar(13) DEFAULT NULL COMMENT '发件人账号',
  PRIMARY KEY (`record_id`),
  KEY `FK_Reference_E_B_R1_idx` (`receiver_id`),
  CONSTRAINT `FK_Reference_E_B_R1` FOREIGN KEY (`receiver_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='邮件发送记录表';

/*Data for the table `bjt_user_email_box_record` */

insert  into `bjt_user_email_box_record`(`record_id`,`sender`,`sender_id`,`receiver_id`,`copyer`,`copyer_id`,`title`,`content`,`send_type`,`send_date`,`read_date`,`box_type`,`email_status`,`ctime`,`resource`,`remark`,`email_id`,`receiver_username`,`sender_avatar`,`sender_username`) values 
(57,'夏雨','ff3f2842f0e64015babc33b6b28541e1','10f46ba871e1432ab84ca462b6b8252e',NULL,NULL,'停电','今天听宫殿',0,1528987848236,1529639732037,1,1,1528987848236,'http://p7iv3nhe5.bkt.clouddn.com/img/1528987847645_magazine-unlock-05-2.3.1011-_D2009B233AD24F16430C9E9A5E955BA2.jpg',NULL,55,'18785081362',NULL,NULL),
(59,'柳溪','ccf6e4ad87034ce8b8aae1815ee91dd0','10f46ba871e1432ab84ca462b6b8252e',NULL,NULL,'好好像','好好/',0,1529639706175,1529639731979,1,1,1529639706175,'http://p7iv3nhe5.bkt.clouddn.com/img/1529639705589_wx_camera_1529637699512.jpg',NULL,57,'18785081362',NULL,NULL),
(60,'徐尧1','e600034e6c664f6f9cb72232dcbeaf09','3e360a2d56b14b39864535e7072b5d5e',NULL,NULL,'贵州','好吧、贵州的小伙伴可以',0,1529644090956,NULL,1,0,1529644090956,NULL,NULL,58,'15519138713','http://p7iv3nhe5.bkt.clouddn.com/img/1529028575786_20180615100937.jpg','17685302679'),
(61,'王金辉','10f46ba871e1432ab84ca462b6b8252e','3e360a2d56b14b39864535e7072b5d5e',NULL,NULL,'十一月','打广告',0,1529644188764,NULL,1,0,1529644188764,NULL,NULL,59,'15519138713',NULL,NULL),
(62,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','10f46ba871e1432ab84ca462b6b8252e',NULL,NULL,'你好','你好',0,1529644226615,NULL,1,0,1529644226615,NULL,NULL,60,'18785081362',NULL,NULL),
(63,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','ff3f2842f0e64015babc33b6b28541e1',NULL,NULL,'你好','你好',0,1529644269554,1529644371504,1,1,1529644269554,NULL,NULL,61,'13381005918',NULL,NULL),
(64,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','10f46ba871e1432ab84ca462b6b8252e',NULL,NULL,'梦想MC','对你的你',0,1529644299348,NULL,1,0,1529644299348,NULL,NULL,62,'18785081362',NULL,NULL),
(65,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','ff3f2842f0e64015babc33b6b28541e1',NULL,NULL,'小魔仙','出门CK',0,1529644314494,1529644369239,1,1,1529644314494,NULL,NULL,63,'13381005918',NULL,NULL),
(66,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','e600034e6c664f6f9cb72232dcbeaf09',NULL,NULL,'你','是你',0,1529644370004,NULL,1,0,1529644370004,NULL,NULL,64,'17685302679',NULL,NULL),
(67,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','e600034e6c664f6f9cb72232dcbeaf09',NULL,NULL,'你好','你们',0,1529644389811,NULL,1,0,1529644389811,NULL,NULL,65,'17685302679',NULL,NULL),
(68,'徐尧1','e600034e6c664f6f9cb72232dcbeaf09','3e360a2d56b14b39864535e7072b5d5e',NULL,NULL,'你号','降价',0,1529644422274,NULL,1,0,1529644422274,NULL,NULL,66,'15519138713',NULL,NULL),
(69,'旺旺。','3e360a2d56b14b39864535e7072b5d5e','e600034e6c664f6f9cb72232dcbeaf09',NULL,NULL,'信息','信息',0,1529644700791,NULL,1,0,1529644700791,NULL,NULL,67,'17685302679',NULL,NULL);

/*Table structure for table `bjt_user_feedback` */

DROP TABLE IF EXISTS `bjt_user_feedback`;

CREATE TABLE `bjt_user_feedback` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `content` varchar(500) DEFAULT NULL COMMENT '反馈内容',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `resource` varchar(1000) DEFAULT NULL COMMENT '图片json字符串',
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈表';

/*Data for the table `bjt_user_feedback` */

/*Table structure for table `bjt_user_organization` */

DROP TABLE IF EXISTS `bjt_user_organization`;

CREATE TABLE `bjt_user_organization` (
  `organization_id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `pid` int(11) DEFAULT NULL COMMENT '上级机构编号',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织机构';

/*Data for the table `bjt_user_organization` */

/*Table structure for table `bjt_user_organization_user` */

DROP TABLE IF EXISTS `bjt_user_organization_user`;

CREATE TABLE `bjt_user_organization_user` (
  `organization_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `organization_id` int(11) DEFAULT NULL COMMENT '组织机构编号',
  PRIMARY KEY (`organization_user_id`),
  KEY `FK_Reference_O_U_idx` (`user_id`),
  KEY `FK_Reference_O_U2_idx` (`organization_id`),
  CONSTRAINT `FK_Reference_O_U1` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_O_U2` FOREIGN KEY (`organization_id`) REFERENCES `bjt_user_organization` (`organization_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和组织机构关联表';

/*Data for the table `bjt_user_organization_user` */

/*Table structure for table `bjt_user_permission` */

DROP TABLE IF EXISTS `bjt_user_permission`;

CREATE TABLE `bjt_user_permission` (
  `permission_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` varchar(36) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1:目录,2:菜单,3:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `uri` varchar(100) DEFAULT NULL COMMENT '路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  `method` varchar(20) DEFAULT NULL COMMENT '请求类型',
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_id_UNIQUE` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COMMENT='权限';

/*Data for the table `bjt_user_permission` */

insert  into `bjt_user_permission`(`permission_id`,`pid`,`name`,`type`,`permission_value`,`uri`,`icon`,`status`,`ctime`,`orders`,`method`) values 
(1,'0','楼宇管理员管理',1,'bjt:manage','','monitor',1,1,1,'GET'),
(2,'1','管理员列表',2,'bjt:manage:user','/admin/user','ios-people',1,1,1,'GET'),
(3,'2','管理员查看',3,'bjt:manage:user:read','/admin/user/select',NULL,1,1,1,'GET'),
(4,'2','管理员修改',3,'bjt:manage:user:update','/admin/user/update',NULL,1,1,1,'PUT'),
(5,'2','管理员删除',3,'bjt:manage:user:delete','/admin/user/delete',NULL,1,1,1,'DELETE'),
(6,'2','管理员添加',3,'bjt:manage:user:add','/admin/user/add',NULL,1,1,1,'POST'),
(7,'1','管理员操作日志',2,'bjt:manage:log','/admin/log','ios-people',1,1,1,'GET'),
(8,'7','操作日志查看',3,'bjt:manage:log:read','/admin/log/select',NULL,1,1,1,'GET'),
(9,'1','角色管理',2,'bjt:manage:role','/admin/role','ios-people',1,1,1,'GET'),
(10,'9','角色查看',3,'bjt:manage:role:read','/admin/role/select',NULL,1,1,1,'GET'),
(11,'9','角色修改',3,'bjt:manage:role:update','/admin/role/update',NULL,1,1,1,'PUT'),
(12,'9','角色删除',3,'bjt:manage:role:delete','/admin/role/delete',NULL,1,1,1,'DELETE'),
(13,'9','角色添加',3,'bjt:manage:role:add','/admin/role/add',NULL,1,1,1,'POST'),
(14,'1','楼宇信息管理',2,'bjt:manage:build','/admin/build','ios-people',1,1,1,'GET'),
(15,'14','楼宇信息查看',3,'bjt:manage:build:read','/admin/build/select',NULL,1,1,1,'GET'),
(16,'14','楼宇信息修改',3,'bjt:manage:build:update','/admin/build/update',NULL,1,1,1,'PUT'),
(17,'0','楼宇管理',1,'bjt:manage',NULL,'monitor',1,1,1,'GET'),
(18,'17','楼宇信息公告管理',2,'bjt:manage:notice','/admin/notice','ios-people',1,1,1,'GET'),
(19,'18','楼宇信息公告查看',3,'bjt:manage:notice:read','/admin/notice/select',NULL,1,1,1,'GET'),
(20,'18','楼宇信息公告修改',3,'bjt:manage:notice:update','/admin/notice/update',NULL,1,1,1,'PUT'),
(21,'18','楼宇信息公告删除',3,'bjt:manage:notice:delete','/admin/notice/delete',NULL,1,1,1,'DELETE'),
(22,'18','楼宇信息公告添加',3,'bjt:manage:notice:add','/admin/notice/add',NULL,1,1,1,'POST'),
(23,'17','房屋管理',2,'bjt:manage:house','/admin/house','ios-people',1,1,1,'GET'),
(24,'23','房屋查看',3,'bjt:manage:house:read','/admin/house/select',NULL,1,1,1,'GET'),
(25,'23','房屋修改',3,'bjt:manage:house:update','/admin/house/update',NULL,1,1,1,'PUT'),
(26,'23','房屋删除',3,'bjt:manage:house:delete','/admin/house/delete',NULL,1,1,1,'DELETE'),
(27,'23','房屋添加',3,'bjt:manage:house:add','/admin/house/add',NULL,1,1,1,'POST'),
(28,'17','已入驻公司管理',2,'bjt:manage:company','/admin/admission','ios-people',1,1,1,'GET'),
(29,'28','已入驻公司查看',3,'bjt:manage:company:read','/admin/admission/select',NULL,1,1,1,'GET'),
(30,'28','已入驻公司删除',3,'bjt:manage:company:update','/admin/admission/delete',NULL,1,1,1,'DELETE'),
(31,'17','门禁管理',2,'bjt:manage:guard','/admin/guard','ios-people',1,1,1,'GET'),
(32,'31','门禁查看',3,'bjt:manage:guard:reda','/admin/guard/select',NULL,1,1,1,'GET'),
(33,'31','门禁修改',3,'bjt:manage:guard:update','/admin/guard/update',NULL,1,1,1,'PUT'),
(34,'17','公司管理',2,'bjt:manage:admission','/admin/admission','ios-people',1,1,1,'GET'),
(35,'34','公司入驻查看',3,'bjt:manage:admission:read','/admin/admission/select',NULL,1,1,1,'GET'),
(36,'34','公司入驻修改',3,'bjt:manage:admission:update','/admin/admission/update',NULL,1,1,1,'PUT'),
(37,'17','合同管理',2,'bjt:manage:agreement','/admin/agreement','ios-people',1,1,1,'GET'),
(38,'37','公司合同查看',3,'bjt:manage:agreement:read','/admin/agreement/select',NULL,1,1,1,'GET'),
(39,'0','记录管理',1,'bjt:manage',NULL,'monitor',1,1,1,'GET'),
(40,'39','缴费记录',2,'bjt:manage:record-pay','/admin/userBill','ios-people',1,1,1,'GET'),
(41,'40','缴费记录查看',3,'bjt:manage:record-pay:read','/admin/userBill/select',NULL,1,1,1,'GET'),
(42,'39','闸机记录',2,'bjt:manage:record-gate','/admin/gateRecord','ios-people',1,1,1,'GET'),
(43,'42','闸机记录查看',3,'bjt:manage:record-gate:read','/admin/gateRecord/select',NULL,1,1,1,'GET'),
(44,'39','访客记录',2,'bjt:manage:record-visitor','/admin/visitor','ios-people',1,1,1,'GET'),
(45,'44','访客记录查看',3,'bjt:manage:record-visitor:read','/admin/visitor/select',NULL,1,1,1,'GET'),
(46,'17','服务申请管理',2,'bjt:manage:build-approval','/admin/buildApproval','ios-people',1,1,1,'GET'),
(47,'46','服务申请查看',3,'bjt:manage:build-approval:read','/admin/buildApproval/select',NULL,1,1,1,'GET'),
(48,'46','服务申请修改',3,'bjt:manage:build-approval:update','/admin/buildApproval/update',NULL,1,1,1,'PUT'),
(49,'46','服务申请删除',3,'bjt:manage:build-approval:delete','/admin/buildApproval/delete',NULL,1,1,1,'DELETE'),
(50,'46','服务申请添加',3,'bjt:manage:build-approval:add','/admin/buildApproval/add',NULL,1,1,1,'POST'),
(51,'17','人员管理',2,'bjt:manage:build-approval','/admin/gurad','ios-people',1,1,1,'GET'),
(52,'51','人员管理',3,'bjt:manage:build-approval:read','/admin/guradl/select',NULL,1,1,1,'GET');

/*Table structure for table `bjt_user_permission_user` */

DROP TABLE IF EXISTS `bjt_user_permission_user`;

CREATE TABLE `bjt_user_permission_user` (
  `user_permission_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `permission_id` int(10) NOT NULL COMMENT '权限编号',
  `type` tinyint(4) NOT NULL COMMENT '权限类型(-1:减权限,1:增权限)',
  `build_id` int(10) NOT NULL COMMENT '楼宇ID',
  PRIMARY KEY (`user_permission_id`),
  UNIQUE KEY `user_permission_id_UNIQUE` (`user_permission_id`),
  KEY `FK_Reference_B1_idx` (`permission_id`),
  KEY `FK_Reference_B3_idx` (`build_id`),
  KEY `FK_Reference_B2_idx` (`user_id`),
  CONSTRAINT `FK_Reference_B1` FOREIGN KEY (`permission_id`) REFERENCES `bjt_user_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_B2` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_B3` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户权限关联表';

/*Data for the table `bjt_user_permission_user` */

/*Table structure for table `bjt_user_recharge` */

DROP TABLE IF EXISTS `bjt_user_recharge`;

CREATE TABLE `bjt_user_recharge` (
  `recharge_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `money` decimal(10,2) DEFAULT NULL COMMENT '充值金额',
  `trade_no` varchar(36) DEFAULT NULL COMMENT '交易流水号',
  `detail` varchar(300) DEFAULT NULL COMMENT '充值详情',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `type` int(10) DEFAULT NULL COMMENT '充值的类型（0支付宝、1微信、2银行卡）',
  PRIMARY KEY (`recharge_id`),
  UNIQUE KEY `recharge_id_UNIQUE` (`recharge_id`),
  KEY `FK_Reference_R_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户充值记录';

/*Data for the table `bjt_user_recharge` */

/*Table structure for table `bjt_user_role` */

DROP TABLE IF EXISTS `bjt_user_role`;

CREATE TABLE `bjt_user_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序值',
  `build_id` int(10) NOT NULL COMMENT '楼宇ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

/*Data for the table `bjt_user_role` */

insert  into `bjt_user_role`(`role_id`,`role_name`,`description`,`ctime`,`orders`,`build_id`) values 
(1,'楼宇管理员','拥有楼宇管理所有权限',1,1,0),
(8,'普通管理员','dsfs',1524038189295,NULL,58),
(10,'jyt','tyi',1524276560522,NULL,36),
(11,'普通管理员',NULL,1526955603777,NULL,59),
(12,'物业管理员',NULL,1527056259454,NULL,59),
(13,'物业管理员','楼宇管家',1527475908913,NULL,65),
(14,'楼宇管理员',NULL,1527590193753,NULL,66),
(15,'guanliyuan ',NULL,1527741997033,NULL,68),
(16,'楼管员','2',1528001689953,NULL,74),
(17,'楼与管理员','楼宇',1528448426154,NULL,77),
(18,'楼宇管理员',NULL,1528448764973,NULL,75),
(19,'普通管理员',NULL,1528448765946,NULL,75),
(20,'楼宇管理员','管理门禁申请和服务申请',1528510650483,NULL,79),
(21,'楼宇管理员','管理门禁审批和服务审批',1528708491460,NULL,80),
(22,'楼宇管理员','管理楼宇申请和门禁申请',1528941309226,NULL,81),
(23,'楼管员','全职',1529034669393,NULL,82),
(24,'楼宇管理员',NULL,1529654599427,NULL,84);

/*Table structure for table `bjt_user_role_permission` */

DROP TABLE IF EXISTS `bjt_user_role_permission`;

CREATE TABLE `bjt_user_role_permission` (
  `role_permission_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  `permission_id` int(10) NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`role_permission_id`),
  UNIQUE KEY `role_permission_id_UNIQUE` (`role_permission_id`),
  KEY `FK_Reference_B1_idx` (`role_id`),
  KEY `FK_Reference_B2_idx` (`permission_id`),
  CONSTRAINT `FK_Reference_B4` FOREIGN KEY (`permission_id`) REFERENCES `bjt_user_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_B5` FOREIGN KEY (`role_id`) REFERENCES `bjt_user_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1502 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联表';

/*Data for the table `bjt_user_role_permission` */

insert  into `bjt_user_role_permission`(`role_permission_id`,`role_id`,`permission_id`) values 
(8,1,1),
(9,1,2),
(10,1,3),
(11,1,4),
(12,1,5),
(13,1,6),
(14,1,7),
(15,1,8),
(16,1,9),
(17,1,10),
(18,1,11),
(19,1,12),
(20,1,13),
(21,1,14),
(22,1,15),
(23,1,16),
(281,8,17),
(282,8,18),
(283,8,19),
(284,8,20),
(285,8,21),
(286,8,22),
(287,8,23),
(288,8,24),
(289,8,25),
(290,8,26),
(291,8,27),
(292,8,28),
(293,8,29),
(294,8,30),
(295,8,31),
(296,8,32),
(297,8,33),
(298,8,34),
(299,8,35),
(300,8,36),
(301,8,37),
(302,8,38),
(303,8,39),
(304,8,40),
(305,8,41),
(306,8,42),
(307,8,43),
(308,8,44),
(309,8,45),
(590,10,17),
(591,10,18),
(592,10,19),
(593,10,20),
(594,10,21),
(595,10,22),
(596,10,23),
(597,10,24),
(598,10,25),
(599,10,26),
(600,10,27),
(601,10,28),
(602,10,29),
(603,10,30),
(604,10,31),
(605,10,32),
(606,10,33),
(607,10,34),
(608,10,35),
(609,10,36),
(610,10,37),
(611,10,38),
(612,10,46),
(613,10,47),
(614,10,48),
(615,10,49),
(616,10,50),
(617,10,39),
(618,10,40),
(619,10,41),
(620,10,42),
(621,10,43),
(622,10,44),
(623,10,45),
(760,11,17),
(761,11,18),
(762,11,19),
(763,11,20),
(764,11,21),
(765,11,22),
(766,11,23),
(767,11,24),
(768,11,25),
(769,11,26),
(770,11,27),
(771,11,28),
(772,11,29),
(773,11,30),
(774,11,31),
(775,11,32),
(776,11,33),
(777,11,34),
(778,11,35),
(779,11,36),
(780,11,37),
(781,11,38),
(782,11,46),
(783,11,47),
(784,11,48),
(785,11,49),
(786,11,50),
(787,11,39),
(788,11,40),
(789,11,41),
(790,11,42),
(791,11,43),
(792,11,44),
(793,11,45),
(828,13,17),
(829,13,18),
(830,13,19),
(831,13,20),
(832,13,21),
(833,13,22),
(834,13,23),
(835,13,24),
(836,13,25),
(837,13,26),
(838,13,27),
(839,13,28),
(840,13,29),
(841,13,30),
(842,13,31),
(843,13,32),
(844,13,33),
(845,13,34),
(846,13,35),
(847,13,36),
(848,13,37),
(849,13,38),
(850,13,46),
(851,13,47),
(852,13,48),
(853,13,49),
(854,13,50),
(855,13,39),
(856,13,40),
(857,13,41),
(858,13,42),
(859,13,43),
(860,13,44),
(861,13,45),
(896,15,17),
(897,15,18),
(898,15,19),
(899,15,20),
(900,15,21),
(901,15,22),
(902,15,23),
(903,15,24),
(904,15,25),
(905,15,26),
(906,15,27),
(907,15,28),
(908,15,29),
(909,15,30),
(910,15,31),
(911,15,32),
(912,15,33),
(913,15,34),
(914,15,35),
(915,15,36),
(916,15,37),
(917,15,38),
(918,15,46),
(919,15,47),
(920,15,48),
(921,15,49),
(922,15,50),
(923,15,39),
(924,15,40),
(925,15,41),
(926,15,42),
(927,15,43),
(928,15,44),
(929,15,45),
(930,12,17),
(931,12,18),
(932,12,19),
(933,12,20),
(934,12,21),
(935,12,22),
(936,12,23),
(937,12,24),
(938,12,25),
(939,12,26),
(940,12,27),
(941,12,28),
(942,12,29),
(943,12,30),
(944,12,31),
(945,12,32),
(946,12,33),
(947,12,34),
(948,12,35),
(949,12,36),
(950,12,37),
(951,12,38),
(952,12,46),
(953,12,47),
(954,12,48),
(955,12,49),
(956,12,50),
(957,12,39),
(958,12,40),
(959,12,41),
(960,12,42),
(961,12,43),
(962,12,44),
(963,12,45),
(964,14,18),
(965,14,19),
(966,14,20),
(967,14,21),
(968,14,22),
(969,14,23),
(970,14,24),
(971,14,25),
(972,14,26),
(973,14,27),
(974,14,28),
(975,14,29),
(976,14,30),
(977,14,31),
(978,14,32),
(979,14,33),
(980,14,34),
(981,14,35),
(982,14,36),
(983,14,37),
(984,14,38),
(985,14,46),
(986,14,47),
(987,14,48),
(988,14,49),
(989,14,50),
(990,14,39),
(991,14,40),
(992,14,41),
(993,14,42),
(994,14,43),
(995,14,44),
(996,14,45),
(997,14,17),
(1034,16,17),
(1035,16,18),
(1036,16,19),
(1037,16,20),
(1038,16,21),
(1039,16,22),
(1040,16,23),
(1041,16,24),
(1042,16,25),
(1043,16,26),
(1044,16,27),
(1045,16,28),
(1046,16,29),
(1047,16,30),
(1048,16,31),
(1049,16,32),
(1050,16,33),
(1051,16,34),
(1052,16,35),
(1053,16,36),
(1054,16,37),
(1055,16,38),
(1056,16,46),
(1057,16,47),
(1058,16,48),
(1059,16,49),
(1060,16,50),
(1061,16,51),
(1062,16,52),
(1063,16,39),
(1064,16,40),
(1065,16,41),
(1066,16,42),
(1067,16,43),
(1068,16,44),
(1069,16,45),
(1106,18,17),
(1107,18,18),
(1108,18,19),
(1109,18,20),
(1110,18,21),
(1111,18,22),
(1112,18,23),
(1113,18,24),
(1114,18,25),
(1115,18,26),
(1116,18,27),
(1117,18,28),
(1118,18,29),
(1119,18,30),
(1120,18,31),
(1121,18,32),
(1122,18,33),
(1123,18,34),
(1124,18,35),
(1125,18,36),
(1126,18,37),
(1127,18,38),
(1128,18,46),
(1129,18,47),
(1130,18,48),
(1131,18,49),
(1132,18,50),
(1133,18,51),
(1134,18,52),
(1135,18,39),
(1136,18,40),
(1137,18,41),
(1138,18,42),
(1139,18,43),
(1140,18,44),
(1141,18,45),
(1142,19,17),
(1143,19,18),
(1144,19,19),
(1145,19,20),
(1146,19,21),
(1147,19,22),
(1148,19,23),
(1149,19,24),
(1150,19,25),
(1151,19,26),
(1152,19,27),
(1153,19,28),
(1154,19,29),
(1155,19,30),
(1156,19,31),
(1157,19,32),
(1158,19,33),
(1159,19,34),
(1160,19,35),
(1161,19,36),
(1162,19,37),
(1163,19,38),
(1164,19,46),
(1165,19,47),
(1166,19,48),
(1167,19,49),
(1168,19,50),
(1169,19,51),
(1170,19,52),
(1171,19,39),
(1172,19,40),
(1173,19,41),
(1174,19,42),
(1175,19,43),
(1176,19,44),
(1177,19,45),
(1250,17,17),
(1251,17,18),
(1252,17,19),
(1253,17,20),
(1254,17,21),
(1255,17,22),
(1256,17,23),
(1257,17,24),
(1258,17,25),
(1259,17,26),
(1260,17,27),
(1261,17,28),
(1262,17,29),
(1263,17,30),
(1264,17,31),
(1265,17,32),
(1266,17,33),
(1267,17,34),
(1268,17,35),
(1269,17,36),
(1270,17,37),
(1271,17,38),
(1272,17,46),
(1273,17,47),
(1274,17,48),
(1275,17,49),
(1276,17,50),
(1277,17,51),
(1278,17,52),
(1279,17,39),
(1280,17,40),
(1281,17,41),
(1282,17,42),
(1283,17,43),
(1284,17,44),
(1285,17,45),
(1286,20,17),
(1287,20,18),
(1288,20,19),
(1289,20,20),
(1290,20,21),
(1291,20,22),
(1292,20,23),
(1293,20,24),
(1294,20,25),
(1295,20,26),
(1296,20,27),
(1297,20,28),
(1298,20,29),
(1299,20,30),
(1300,20,31),
(1301,20,32),
(1302,20,33),
(1303,20,34),
(1304,20,35),
(1305,20,36),
(1306,20,37),
(1307,20,38),
(1308,20,46),
(1309,20,47),
(1310,20,48),
(1311,20,49),
(1312,20,50),
(1313,20,51),
(1314,20,52),
(1315,20,39),
(1316,20,40),
(1317,20,41),
(1318,20,42),
(1319,20,43),
(1320,20,44),
(1321,20,45),
(1322,21,17),
(1323,21,18),
(1324,21,19),
(1325,21,20),
(1326,21,21),
(1327,21,22),
(1328,21,23),
(1329,21,24),
(1330,21,25),
(1331,21,26),
(1332,21,27),
(1333,21,28),
(1334,21,29),
(1335,21,30),
(1336,21,31),
(1337,21,32),
(1338,21,33),
(1339,21,34),
(1340,21,35),
(1341,21,36),
(1342,21,37),
(1343,21,38),
(1344,21,46),
(1345,21,47),
(1346,21,48),
(1347,21,49),
(1348,21,50),
(1349,21,51),
(1350,21,52),
(1351,21,39),
(1352,21,40),
(1353,21,41),
(1354,21,42),
(1355,21,43),
(1356,21,44),
(1357,21,45),
(1358,22,17),
(1359,22,18),
(1360,22,19),
(1361,22,20),
(1362,22,21),
(1363,22,22),
(1364,22,23),
(1365,22,24),
(1366,22,25),
(1367,22,26),
(1368,22,27),
(1369,22,28),
(1370,22,29),
(1371,22,30),
(1372,22,31),
(1373,22,32),
(1374,22,33),
(1375,22,34),
(1376,22,35),
(1377,22,36),
(1378,22,37),
(1379,22,38),
(1380,22,46),
(1381,22,47),
(1382,22,48),
(1383,22,49),
(1384,22,50),
(1385,22,51),
(1386,22,52),
(1387,22,39),
(1388,22,40),
(1389,22,41),
(1390,22,42),
(1391,22,43),
(1392,22,44),
(1393,22,45),
(1430,23,17),
(1431,23,18),
(1432,23,19),
(1433,23,20),
(1434,23,21),
(1435,23,22),
(1436,23,23),
(1437,23,24),
(1438,23,25),
(1439,23,26),
(1440,23,27),
(1441,23,28),
(1442,23,29),
(1443,23,30),
(1444,23,31),
(1445,23,32),
(1446,23,33),
(1447,23,34),
(1448,23,35),
(1449,23,36),
(1450,23,37),
(1451,23,38),
(1452,23,46),
(1453,23,47),
(1454,23,48),
(1455,23,49),
(1456,23,50),
(1457,23,51),
(1458,23,52),
(1459,23,39),
(1460,23,40),
(1461,23,41),
(1462,23,42),
(1463,23,43),
(1464,23,44),
(1465,23,45),
(1466,24,17),
(1467,24,18),
(1468,24,19),
(1469,24,20),
(1470,24,21),
(1471,24,22),
(1472,24,23),
(1473,24,24),
(1474,24,25),
(1475,24,26),
(1476,24,27),
(1477,24,28),
(1478,24,29),
(1479,24,30),
(1480,24,31),
(1481,24,32),
(1482,24,33),
(1483,24,34),
(1484,24,35),
(1485,24,36),
(1486,24,37),
(1487,24,38),
(1488,24,46),
(1489,24,47),
(1490,24,48),
(1491,24,49),
(1492,24,50),
(1493,24,51),
(1494,24,52),
(1495,24,39),
(1496,24,40),
(1497,24,41),
(1498,24,42),
(1499,24,43),
(1500,24,44),
(1501,24,45);

/*Table structure for table `bjt_user_user` */

DROP TABLE IF EXISTS `bjt_user_user`;

CREATE TABLE `bjt_user_user` (
  `user_id` varchar(32) NOT NULL COMMENT '编号',
  `username` varchar(20) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码MD5(密码+盐)',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(500) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别(1、男；2、女)',
  `locked` tinyint(4) DEFAULT NULL COMMENT '状态(0:正常,1:锁定)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `open_id` varchar(50) DEFAULT NULL COMMENT 'openId,第三方登录使用',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `birthday` varchar(20) DEFAULT NULL COMMENT '生日',
  `company` varchar(100) DEFAULT NULL COMMENT '公司',
  `job` varchar(100) DEFAULT NULL COMMENT '职务',
  `id_number` varchar(18) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户';

/*Data for the table `bjt_user_user` */

insert  into `bjt_user_user`(`user_id`,`username`,`password`,`salt`,`realname`,`avatar`,`phone`,`email`,`sex`,`locked`,`ctime`,`remark`,`open_id`,`nickname`,`birthday`,`company`,`job`,`id_number`) values 
('082291d0d6d84c53a4eab095659f7458','18786622413','95CDD7A3EA2CC98C4AC10610CB36BFE2','158d56fdfe0b4c26bb8064fdff70e7a9',NULL,NULL,'18786622413',NULL,0,0,0,NULL,NULL,'丰富','1970.01.01',NULL,NULL,NULL),
('10f46ba871e1432ab84ca462b6b8252e','18785081362','00A29D6CCCD864ED1519BF4E6DC6A752','1fa6b7c3b89541b2870bb5d46cd7f6f7','小丽','http://p7iv3nhe5.bkt.clouddn.com/img/1528987669904_20180614224749.jpg','18785081362',NULL,0,0,0,NULL,NULL,'王金辉','1970.08.18',NULL,NULL,'133030197008181793'),
('3e360a2d56b14b39864535e7072b5d5e','13261656101','983A30FC067D2605FF0317EED4DE406A','2f71018d67a0470397428dcbefbedb18','Adeep蛋疼','http://p7iv3nhe5.bkt.clouddn.com/img/1529484332453_20180620164532.jpg','15519138713',NULL,0,0,0,NULL,NULL,'旺旺。','1994.01.04',NULL,NULL,'522121199303287638'),
('4024e603c3b64c1fbe0dd42554b95b81','13765035935','EC4F3ACA39A7DADD8D6465602F970F37','502f9936be4a4058b1453f270e76bfae',NULL,NULL,'13765035935',NULL,NULL,0,1529069643525,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('51ff193418754be5b0a0126dde2890db','15761674649','B48A9925123D6837B948F11FC73BBB15','44ba62645e4a414b80e33b68aa3f1abc',NULL,NULL,'15761674649',NULL,NULL,0,1529569903702,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('63bda9ba4f2841a3be854702ffafe58e','18083363565','3D91146BEAD37A9091D5EE751D0D7B8F','e1d93a94e9ab46d6b3d4d0adb6caaf3c','赵倩',NULL,'18083363565',NULL,0,0,1529485247619,NULL,NULL,'赵倩','2018.06.20',NULL,NULL,'522501199507246922'),
('83f0318adeb34bb1aa8716400dcc2087','13985178336','EBE8D26AE1CA9B542B43E7084AD1B970','d9f37234b50f42bd96be7eba49fcf723','彦燕','http://p7iv3nhe5.bkt.clouddn.com/img/1529397218228_20180619163334.jpg','13985178336',NULL,1,0,0,NULL,NULL,'彦燕','1986.05.16',NULL,NULL,'520102198605162464'),
('8f4c20c499e84686aacf4fb4cfdb53fb','18096000268','D5348FEC0CB49D4975511047467D4B55','eafdfa7cd9db49afa077097244dc7ff7',NULL,NULL,'18096000268',NULL,NULL,0,1528975104132,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('ccf6e4ad87034ce8b8aae1815ee91dd0','13518507442','5FAC40676923FE70FEB555844AF6FFC1','9c19a806e1f34729ba7301f70f54a347','柳溪','http://p7iv3nhe5.bkt.clouddn.com/img/1529638986374_20180622114305.jpg','13518507442',NULL,0,0,0,NULL,NULL,'柳溪','1960.03.05',NULL,NULL,'522525196003058650'),
('e600034e6c664f6f9cb72232dcbeaf09','17685302679','3802B4F493763D48195A3030F2D93C0C','188604a4498443518c3bab98de287eb8','徐尧','http://p7iv3nhe5.bkt.clouddn.com/img/1529028575786_20180615100937.jpg','17685302679',NULL,0,0,0,NULL,NULL,'徐尧1',NULL,NULL,NULL,'522423199412272637'),
('ff3f2842f0e64015babc33b6b28541e1','13381005918','3038D9CB63B3152A79B8153FB06C02F7','1796f0df35e643239ad7b94a7aa703e3','王金辉','http://p7iv3nhe5.bkt.clouddn.com/img/1528987229870_20180614224026.jpg','13381005918',NULL,0,0,0,NULL,NULL,'夏雨','1970.08.18',NULL,NULL,'133030197008181793'),
('ffdaf8c5ff044f6aa5b93cf3579d2040','18275317961','2827ED31BFBA17EBD776B0C7ED89EEE3','edc416906dd743688c4321bb83980330','徐尧',NULL,'18275317961',NULL,0,0,0,NULL,NULL,'徐尧','2018.06.22',NULL,NULL,'522423199412272637');

/*Table structure for table `bjt_user_user_role` */

DROP TABLE IF EXISTS `bjt_user_user_role`;

CREATE TABLE `bjt_user_user_role` (
  `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  `build_id` int(10) NOT NULL COMMENT '楼宇ID',
  PRIMARY KEY (`user_role_id`),
  KEY `FK_Reference_B7_idx` (`build_id`),
  KEY `FK_Reference_B8_idx` (`role_id`),
  KEY `FK_Reference_B6_idx` (`user_id`),
  CONSTRAINT `FK_Reference_B6` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_B7` FOREIGN KEY (`build_id`) REFERENCES `bjt_park_build` (`build_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_B8` FOREIGN KEY (`role_id`) REFERENCES `bjt_user_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

/*Data for the table `bjt_user_user_role` */

insert  into `bjt_user_user_role`(`user_role_id`,`user_id`,`role_id`,`build_id`) values 
(53,'ff3f2842f0e64015babc33b6b28541e1',1,82),
(54,'ff3f2842f0e64015babc33b6b28541e1',23,82),
(55,'83f0318adeb34bb1aa8716400dcc2087',1,83),
(56,'ffdaf8c5ff044f6aa5b93cf3579d2040',1,84),
(57,'ffdaf8c5ff044f6aa5b93cf3579d2040',1,84),
(58,'ffdaf8c5ff044f6aa5b93cf3579d2040',24,84);

/*Table structure for table `bjt_user_wallet` */

DROP TABLE IF EXISTS `bjt_user_wallet`;

CREATE TABLE `bjt_user_wallet` (
  `user_id` varchar(36) NOT NULL COMMENT '用户编号',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `consumption` decimal(10,2) DEFAULT NULL COMMENT '累计消费',
  `recharge` decimal(10,2) DEFAULT NULL COMMENT '累计充值',
  `score` int(10) DEFAULT NULL COMMENT '积分',
  `ctime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_Reference_w` FOREIGN KEY (`user_id`) REFERENCES `bjt_user_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户钱包表';

/*Data for the table `bjt_user_wallet` */

insert  into `bjt_user_wallet`(`user_id`,`balance`,`consumption`,`recharge`,`score`,`ctime`) values 
('082291d0d6d84c53a4eab095659f7458',0.00,0.00,0.00,0,1529131310038),
('10f46ba871e1432ab84ca462b6b8252e',0.00,0.00,0.00,0,1528987459804),
('3e360a2d56b14b39864535e7072b5d5e',0.00,0.00,0.00,0,1529027485590),
('4024e603c3b64c1fbe0dd42554b95b81',0.00,0.00,0.00,0,1529069643528),
('51ff193418754be5b0a0126dde2890db',0.00,0.00,0.00,0,1529569903707),
('63bda9ba4f2841a3be854702ffafe58e',0.00,0.00,0.00,0,1529485247627),
('83f0318adeb34bb1aa8716400dcc2087',0.00,0.00,0.00,0,1529397171854),
('8f4c20c499e84686aacf4fb4cfdb53fb',0.00,0.00,0.00,0,1528975104142),
('ccf6e4ad87034ce8b8aae1815ee91dd0',0.00,0.00,0.00,0,1529638536324),
('e600034e6c664f6f9cb72232dcbeaf09',0.00,0.00,0.00,0,1528970974556),
('ff3f2842f0e64015babc33b6b28541e1',0.00,0.00,0.00,0,1528971360457),
('ffdaf8c5ff044f6aa5b93cf3579d2040',0.00,0.00,0.00,0,1529647131583);

/*Table structure for table `oss_log` */

DROP TABLE IF EXISTS `oss_log`;

CREATE TABLE `oss_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(36) NOT NULL COMMENT '上传用户ID',
  `source` varchar(500) NOT NULL COMMENT '地址',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `utime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `remake` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`log_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COMMENT='文件系统日志表';

/*Data for the table `oss_log` */

insert  into `oss_log`(`log_id`,`user_id`,`source`,`ctime`,`utime`,`remake`) values 
(499,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1528971562928_zpsl.jpg',1528971562928,1528971562928,NULL),
(500,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1528971572171_zpsl.jpg',1528971572171,1528971572171,NULL),
(501,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1528987141054_20180614223857.jpg',1528987141054,1528987141054,NULL),
(502,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1528987229870_20180614224026.jpg',1528987229870,1528987229870,NULL),
(503,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1528987669904_20180614224749.jpg',1528987669904,1528987669904,NULL),
(504,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1528987847645_magazine-unlock-05-2.3.1011-_D2009B233AD24F16430C9E9A5E955BA2.jpg',1528987847645,1528987847645,NULL),
(505,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529023965728_微信图片编辑_20180615084311.jpg',1529023965728,1529023965728,NULL),
(506,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529024076624_微信图片编辑_20180615084311.jpg',1529024076624,1529024076624,NULL),
(507,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529027716352_20180615095518.jpg',1529027716352,1529027716352,NULL),
(508,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529027737667_20180615095540.jpg',1529027737667,1529027737667,NULL),
(509,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529028575786_20180615100937.jpg',1529028575786,1529028575786,NULL),
(510,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529052253166_20180615164406.jpg',1529052253166,1529052253166,NULL),
(511,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529397218228_20180619163334.jpg',1529397218228,1529397218228,NULL),
(512,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529484332453_20180620164532.jpg',1529484332453,1529484332453,NULL),
(513,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529637744512_微信图片_20180622111257.jpg',1529637744512,1529637744512,NULL),
(514,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638185214_蜂胶.png',1529638185214,1529638185214,NULL),
(515,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638195206_蜂胶.png',1529638195206,1529638195206,NULL),
(516,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638225687_蜂胶.png',1529638225687,1529638225687,NULL),
(517,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638251157_蜂胶.png',1529638251157,1529638251157,NULL),
(518,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638300149_蜂胶.png',1529638300149,1529638300149,NULL),
(519,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638385932_蜂胶.png',1529638385932,1529638385932,NULL),
(520,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638440852_蜂胶.png',1529638440852,1529638440852,NULL),
(521,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638592003_蜂胶.png',1529638592003,1529638592003,NULL),
(522,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638944561_20180622114221.jpg',1529638944561,1529638944561,NULL),
(523,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638971781_20180622114247.jpg',1529638971781,1529638971781,NULL),
(524,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529638986374_20180622114305.jpg',1529638986374,1529638986374,NULL),
(525,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529639126106_微信图片编辑_20180622114150.jpg',1529639126106,1529639126106,NULL),
(526,'1','http://p7iv3nhe5.bkt.clouddn.com/img/1529639705589_wx_camera_1529637699512.jpg',1529639705589,1529639705589,NULL),
(527,'1','http://p7iv3nhe5.bkt.clouddn.com/file/1529747457508_bjtV1.3.1.apk',1529747457508,1529747457508,NULL),
(528,'1','http://p7iv3nhe5.bkt.clouddn.com/file/1529747530054_bjtV1.3.1.apk',1529747530054,1529747530054,NULL);

/*Table structure for table `pay_order` */

DROP TABLE IF EXISTS `pay_order`;

CREATE TABLE `pay_order` (
  `order_id` varchar(32) NOT NULL COMMENT '订单ID',
  `system_id` int(11) NOT NULL COMMENT '系统ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户账号',
  `ctime` bigint(20) DEFAULT NULL COMMENT '生成时间',
  `money` decimal(11,2) DEFAULT NULL COMMENT '订单金额',
  `name` varchar(100) DEFAULT NULL COMMENT '订单标题（支付宝 微信用）',
  `info` varchar(500) DEFAULT NULL COMMENT '订单内容（支付宝 微信用）',
  `info_self` varchar(500) DEFAULT NULL COMMENT '订单内容',
  `type` int(10) NOT NULL COMMENT '订单类型-由系统自定义',
  `state` int(10) NOT NULL DEFAULT '0' COMMENT '订单状态-0：交易创建，-1：未付款交易超时关闭，或支付完成后全额退款，1：交易支付完成，2：交易结束，不可退款',
  `notify_url` varchar(500) DEFAULT NULL COMMENT '回调接口',
  `notify_json` varchar(500) DEFAULT NULL COMMENT '回调JSON请求体',
  `channel` varchar(45) NOT NULL COMMENT '支付渠道',
  PRIMARY KEY (`order_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付订单';

/*Data for the table `pay_order` */

/*Table structure for table `pay_order_record` */

DROP TABLE IF EXISTS `pay_order_record`;

CREATE TABLE `pay_order_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `order_id` varchar(32) NOT NULL COMMENT '订单ID',
  `content` varchar(500) DEFAULT NULL COMMENT '记录内容',
  `type` int(10) NOT NULL COMMENT '记录类型',
  `ctime` bigint(20) DEFAULT NULL COMMENT '生成时间',
  PRIMARY KEY (`record_id`),
  KEY `record_id` (`record_id`),
  KEY `FK_Reference_j1` (`order_id`),
  CONSTRAINT `FK_Reference_j1` FOREIGN KEY (`order_id`) REFERENCES `pay_order` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付订单记录';

/*Data for the table `pay_order_record` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
