/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : thinghigh

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-12-26 15:49:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `type` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT 'type:1:javascript,2:php,3:mysql,4:css,5:html,6:mixed',
  `title` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '搜索名称',
  `content` varchar(20000) COLLATE utf8_bin DEFAULT '' COMMENT '代码内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码库表';

DROP TABLE IF EXISTS `codename`;
CREATE TABLE `codename` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `codeid` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT 'code表的id',
  `type` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT 'type:1:javascript,2:php,3:mysql,4:css,5:html,6:mixed',
  `title` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '搜索名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码名称表';

-- ----------------------------
-- Records of code
-- ----------------------------
INSERT INTO `code` VALUES ('1', '', '2', '存单表数据', '> 框架方法：将post过来的数据存入数据库\n\n~~~\n$time = date(\"Y-m-d H:i:s\"); // 获取当前时间\n$sql = \"INSERT INTO \".$codename.\" (user_guid,title,content,createtime) values(?,?,?,?)\";\n$rs1 = $db->execute($sql, array($user_guid, $title, $textcode, $time));\n~~~', '2016-12-26 15:31:39', '2016-12-26 15:31:41');

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nid` bigint(20) NOT NULL COMMENT '一级日志的id',
  `name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '日志名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作日志表二级';

-- ----------------------------
-- Records of note
-- ----------------------------

-- ----------------------------
-- Table structure for notestate
-- ----------------------------
DROP TABLE IF EXISTS `notestate`;
CREATE TABLE `notestate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nnid` bigint(20) NOT NULL COMMENT '二级日志的id',
  `state` tinyint(2) DEFAULT '0' COMMENT '工作状态：0开始，1完成，新建的未开始的日志不需要存这张表',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间，2个状态对应的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作日志状态表';

-- ----------------------------
-- Records of notestate
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `user_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '用户名称',
  `user_sign` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户签名',
  `user_password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '学习学习再学习！', '152417');

-- ----------------------------
-- Table structure for worknote
-- ----------------------------


-- ----------------------------
-- Records of worknote
-- ----------------------------


