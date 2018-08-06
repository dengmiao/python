/*
Navicat MySQL Data Transfer

Source Server         : localhost-3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : flask_movie

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-08-06 22:59:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'pbkdf2:sha256:50000$BoWISWEd$136d06d8b92063d5a687d62460860d6b9b580494b9ca9d03d55ebfd7466460a9', '0', '1', '2018-07-28 14:50:32');
INSERT INTO `admin` VALUES ('2', 'admin1', 'pbkdf2:sha256:50000$QtackcQB$3c5ae3bd27ab534557a055c6d6e6e752b0c26aca9e6b54f032103584086dd42e', '0', '1', '2018-07-28 22:53:41');
INSERT INTO `admin` VALUES ('3', 'adb123', 'pbkdf2:sha256:50000$kXwf1S75$91de2fde206c9cb828f0423e4732fedfd156ddc9726696917f821d6cc3cbe34e', '1', '3', '2018-08-05 13:12:35');

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_Adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('1', '1', '127.0.0.1', '2018-08-05 11:14:44');
INSERT INTO `adminlog` VALUES ('2', '1', '127.0.0.1', '2018-08-05 11:14:59');
INSERT INTO `adminlog` VALUES ('3', '1', '127.0.0.1', '2018-08-05 11:15:06');
INSERT INTO `adminlog` VALUES ('4', '1', '127.0.0.1', '2018-08-05 11:15:18');
INSERT INTO `adminlog` VALUES ('5', '1', '127.0.0.1', '2018-08-05 11:25:27');
INSERT INTO `adminlog` VALUES ('6', '1', '127.0.0.1', '2018-08-05 14:36:18');
INSERT INTO `adminlog` VALUES ('7', '1', '127.0.0.1', '2018-08-05 14:39:56');
INSERT INTO `adminlog` VALUES ('8', '3', '127.0.0.1', '2018-08-05 14:42:07');
INSERT INTO `adminlog` VALUES ('9', '3', '127.0.0.1', '2018-08-05 14:43:27');
INSERT INTO `adminlog` VALUES ('10', '3', '127.0.0.1', '2018-08-05 14:46:08');
INSERT INTO `adminlog` VALUES ('11', '1', '127.0.0.1', '2018-08-05 14:55:04');
INSERT INTO `adminlog` VALUES ('12', '1', '127.0.0.1', '2018-08-05 14:57:24');
INSERT INTO `adminlog` VALUES ('13', '1', '127.0.0.1', '2018-08-05 14:58:55');
INSERT INTO `adminlog` VALUES ('14', '1', '127.0.0.1', '2018-08-05 14:59:58');
INSERT INTO `adminlog` VALUES ('15', '1', '127.0.0.1', '2018-08-05 15:01:09');
INSERT INTO `adminlog` VALUES ('16', '3', '127.0.0.1', '2018-08-05 15:01:32');
INSERT INTO `adminlog` VALUES ('17', '1', '127.0.0.1', '2018-08-05 15:01:41');
INSERT INTO `adminlog` VALUES ('18', '1', '127.0.0.1', '2018-08-05 15:08:37');
INSERT INTO `adminlog` VALUES ('19', '1', '127.0.0.1', '2018-08-05 15:13:07');
INSERT INTO `adminlog` VALUES ('20', '3', '127.0.0.1', '2018-08-05 15:14:36');
INSERT INTO `adminlog` VALUES ('21', '1', '127.0.0.1', '2018-08-05 15:15:05');
INSERT INTO `adminlog` VALUES ('22', '1', '127.0.0.1', '2018-08-05 15:21:14');
INSERT INTO `adminlog` VALUES ('23', '3', '127.0.0.1', '2018-08-05 15:33:44');
INSERT INTO `adminlog` VALUES ('24', '1', '127.0.0.1', '2018-08-05 16:48:43');
INSERT INTO `adminlog` VALUES ('25', '3', '127.0.0.1', '2018-08-05 16:48:59');
INSERT INTO `adminlog` VALUES ('26', '1', '127.0.0.1', '2018-08-05 17:10:04');
INSERT INTO `adminlog` VALUES ('27', '1', '127.0.0.1', '2018-08-05 19:19:10');
INSERT INTO `adminlog` VALUES ('28', '1', '127.0.0.1', '2018-08-05 20:55:41');
INSERT INTO `adminlog` VALUES ('29', '3', '127.0.0.1', '2018-08-05 20:56:56');
INSERT INTO `adminlog` VALUES ('30', '1', '127.0.0.1', '2018-08-05 20:57:14');
INSERT INTO `adminlog` VALUES ('31', '1', '127.0.0.1', '2018-08-05 21:54:58');
INSERT INTO `adminlog` VALUES ('32', '3', '127.0.0.1', '2018-08-05 21:55:09');
INSERT INTO `adminlog` VALUES ('33', '1', '127.0.0.1', '2018-08-06 20:14:49');

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('1', '缺省', '/admin/', '2018-08-05 15:14:01');
INSERT INTO `auth` VALUES ('2', '后台首页', '/admin/index/', '2018-08-05 15:15:29');
INSERT INTO `auth` VALUES ('3', '添加标签', '/admin/tag/add/', '2018-08-05 15:16:19');
INSERT INTO `auth` VALUES ('4', '标签列表', '/admin/tag/list/<int:page>/', '2018-08-05 15:16:49');
INSERT INTO `auth` VALUES ('5', '标签删除', '/admin/tag/del/<int:id>/', '2018-08-05 15:17:07');
INSERT INTO `auth` VALUES ('6', '标签编辑', '/admin/tag/edit/<int:id>/', '2018-08-05 15:18:03');
INSERT INTO `auth` VALUES ('7', '电影添加', '/admin/movie/add/', '2018-08-05 15:18:30');
INSERT INTO `auth` VALUES ('8', '电影列表', '/admin/movie/list/<int:page>/', '2018-08-05 15:18:48');
INSERT INTO `auth` VALUES ('9', '电影删除', '/admin/movie/del/<int:id>/', '2018-08-05 15:19:14');
INSERT INTO `auth` VALUES ('10', '电影编辑', '/admin/movie/edit/<int:id>/', '2018-08-05 15:19:29');
INSERT INTO `auth` VALUES ('11', '上映预告添加', '/admin/preview/add/', '2018-08-05 15:19:51');
INSERT INTO `auth` VALUES ('12', '上映预告列表', '/admin/preview/list/<int:page>/', '2018-08-05 15:20:09');
INSERT INTO `auth` VALUES ('13', '上映预告删除', '/admin/preview/del/<int:id>/', '2018-08-05 15:20:27');
INSERT INTO `auth` VALUES ('14', '上映预告编辑', '/admin/preview/edit/<int:id>/', '2018-08-05 15:20:43');
INSERT INTO `auth` VALUES ('16', '会员列表', '/admin/user/list/<int:page>/', '2018-08-05 15:22:56');
INSERT INTO `auth` VALUES ('17', '会员详情', '/admin/user/view/<int:id>/', '2018-08-05 15:23:25');
INSERT INTO `auth` VALUES ('18', '会员删除', '/admin/user/del/<int:id>/', '2018-08-05 15:23:40');
INSERT INTO `auth` VALUES ('19', '评论列表', '/admin/comment/list/<int:page>/', '2018-08-05 15:24:03');
INSERT INTO `auth` VALUES ('20', '评论删除', '/admin/comment/del/<int:id>/', '2018-08-05 15:24:18');
INSERT INTO `auth` VALUES ('21', '电影收藏列表', '/admin/moviecol/list/<int:page>/', '2018-08-05 15:24:49');
INSERT INTO `auth` VALUES ('22', '电影收藏删除', '/admin/moviecol/del/<int:id>/', '2018-08-05 15:25:30');
INSERT INTO `auth` VALUES ('23', '操作日志列表', '/admin/oplog/list/<int:page>/', '2018-08-05 15:26:02');
INSERT INTO `auth` VALUES ('24', '管理员登录日志列表', '/admin/adminloginlog/list/<int:page>/', '2018-08-05 15:26:25');
INSERT INTO `auth` VALUES ('25', '会员登录日志列表', '/admin/userloginlog/list/<int:page>/', '2018-08-05 15:26:40');
INSERT INTO `auth` VALUES ('26', '角色添加', '/admin/role/add/', '2018-08-05 15:26:55');
INSERT INTO `auth` VALUES ('27', '角色列表', '/admin/role/list/<int:page>/', '2018-08-05 15:27:10');
INSERT INTO `auth` VALUES ('28', '角色删除', '/admin/role/del/<int:id>/', '2018-08-05 15:27:24');
INSERT INTO `auth` VALUES ('29', '角色编辑', '/admin/role/edit/<int:id>/', '2018-08-05 15:27:39');
INSERT INTO `auth` VALUES ('30', '权限添加', '/admin/auth/add/', '2018-08-05 15:28:01');
INSERT INTO `auth` VALUES ('31', '权限列表', '/admin/auth/list/<int:page>/', '2018-08-05 15:28:18');
INSERT INTO `auth` VALUES ('32', '权限删除', '/admin/auth/del/<int:id>/', '2018-08-05 15:28:32');
INSERT INTO `auth` VALUES ('33', '权限编辑', '/admin/auth/edit/<int:id>/', '2018-08-05 15:28:47');
INSERT INTO `auth` VALUES ('34', '管理员添加', '/admin/admin/add/', '2018-08-05 15:29:14');
INSERT INTO `auth` VALUES ('35', '管理员列表', '/admin/admin/list/<int:page>/', '2018-08-05 15:29:30');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '女主很漂亮', '3', '1', '2018-08-05 09:51:33');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `logo` varchar(255) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('3', 'the gifted S01E08', '2018080508253629921ae424f041478aa035d02a26d832.mp4', '天赋异禀 S01E08', '20180805082537a88151afb1a444b093462b2130bff54b.jpg', '4', '0', '0', '1', '美国', '2018-08-02', '5', '2018-08-05 07:54:21');

-- ----------------------------
-- Table structure for moviecol
-- ----------------------------
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moviecol
-- ----------------------------
INSERT INTO `moviecol` VALUES ('2', '3', '1', '2018-08-05 10:19:47');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_Oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES ('1', '1', '127.0.0.1', '添加标签:喜剧', '2018-08-05 11:05:04');

-- ----------------------------
-- Table structure for preview
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preview
-- ----------------------------
INSERT INTO `preview` VALUES ('1', '木乃伊4', '20180805092336d42f3b290dd0499d87e992f17900ee9e.jpg', '2018-08-05 08:47:51');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '', '2018-07-28 14:42:47');
INSERT INTO `role` VALUES ('3', '标签管理员', '1,2,3,4,5,6', '2018-08-05 12:44:09');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '科幻', '2018-08-04 09:37:22');
INSERT INTO `tag` VALUES ('2', '爱情', '2018-08-04 09:40:20');
INSERT INTO `tag` VALUES ('3', '动作', '2018-08-04 10:14:56');
INSERT INTO `tag` VALUES ('6', '喜剧', '2018-08-05 11:05:04');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zhangsan', '123456', '123@qq.com', '19908237863', '张三', '201712211609272740001.jpg', '2018-08-05 09:37:57', '5ba33a90-9850-11e8-8851-4ccc6ae02670');
INSERT INTO `user` VALUES ('2', 'lisi123', 'pbkdf2:sha256:50000$c7T8norz$e2099cc199da91cb3efad541987f36f4fde814e094393118f288a3cca40f1266', 'lisi@qq.com', '19912345678', '阿斯达', '20180806224656da67c35f0e05404e8d2cab0a7d29fd59.jpg', '2018-08-06 21:25:18', 'f5420f2403324da394025cd996633152');
INSERT INTO `user` VALUES ('3', 'wangwu', 'pbkdf2:sha256:50000$nSN9UL3C$45a4b47dd9957ceda6fd9bdb91ef684cd78a8102e53eb4569b4fe206c3f65a69', 'wang@qq.com', '19912345677', null, null, '2018-08-06 21:26:16', '26e2c345cc6b4f4085ef690d496fff58');

-- ----------------------------
-- Table structure for userlog
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('1', '1', '127.0.0.1', '2018-08-05 11:20:13');
INSERT INTO `userlog` VALUES ('2', '1', '127.0.0.1', '2018-08-05 11:20:25');
INSERT INTO `userlog` VALUES ('3', '1', '127.0.0.1', '2018-08-05 11:20:39');
INSERT INTO `userlog` VALUES ('4', '1', '127.0.0.1', '2018-08-06 21:41:20');
INSERT INTO `userlog` VALUES ('5', '2', '127.0.0.1', '2018-08-06 21:42:46');
INSERT INTO `userlog` VALUES ('6', '2', '127.0.0.1', '2018-08-06 21:48:38');
INSERT INTO `userlog` VALUES ('7', '2', '127.0.0.1', '2018-08-06 22:47:56');
