/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : thinghigh

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-12-27 02:32:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `type` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT 'type:1:js,2:php,3:mysql,4:mixed',
  `title` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '搜索名称',
  `content` varchar(20000) COLLATE utf8_bin DEFAULT '' COMMENT '代码内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码库表';

-- ----------------------------
-- Records of code
-- ----------------------------
INSERT INTO `code` VALUES ('1', '', '2', '存单表数据', '> 框架方法：将post过来的数据存入数据库\n\n~~~\n$time = date(\"Y-m-d H:i:s\"); // 获取当前时间\n$sql = \"INSERT INTO \".$codename.\" (user_guid,title,content,createtime) values(?,?,?,?)\";\n$rs1 = $db->execute($sql, array($user_guid, $title, $textcode, $time));\n~~~', '2016-12-26 15:31:39', '2016-12-26 15:31:41');

-- ----------------------------
-- Table structure for codename
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码名称表';

-- ----------------------------
-- Records of codename
-- ----------------------------
INSERT INTO `codename` VALUES ('1', '', '1', '2', '存单表数据', '2016-12-27 00:32:53', '2016-12-27 00:32:56');

-- ----------------------------
-- Table structure for code_js
-- ----------------------------
DROP TABLE IF EXISTS `code_js`;
CREATE TABLE `code_js` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `title` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '搜索名称',
  `content` varchar(20000) COLLATE utf8_bin DEFAULT '' COMMENT '代码内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='js代码库表';

-- ----------------------------
-- Records of code_js
-- ----------------------------
INSERT INTO `code_js` VALUES ('1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '案例', '> 这里是背景注释第1行\n\n> 这里是背景注释第2行\n\n> 这里是背景注释第3行\n\n*这个是斜体*\n\n**这个是粗体**\n\n分割线\n***\n\n~~~\n//这里放代码块\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  $initHighlight;\n~~~', '2016-07-18 12:41:00', null);
INSERT INTO `code_js` VALUES ('2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '案列', '> 这里是背景注释第1行\n\n> 这里是背景注释第2行\n\n> 这里是背景注释第3行\n\n*这个是斜体*\n\n**这个是粗体**\n\n分割线\n***\n\n~~~\n//这里放代码块\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  $initHighlight;\n~~~', '2016-07-18 12:48:31', null);
INSERT INTO `code_js` VALUES ('3', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '案列', '> 这里是背景注释第1行\n\n> 这里是背景注释第2行\n\n> 这里是背景注释第3行\n\n*这个是斜体*\n\n**这个是粗体**\n\n分割线\n***\n\n~~~\n//这里放代码块\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  $initHighlight;\n~~~', '2016-07-18 12:53:57', null);
INSERT INTO `code_js` VALUES ('4', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '设计表的公共样式', '> 设计表的公共样式\n\n~~~\n//样式模板\nDROP TABLE IF EXISTS `coursewaretype`;\nCREATE TABLE `coursewaretype` (\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'编号\',\n  `typename` varchar(20) DEFAULT \'\' COMMENT \'类型名称\',\n  `typeinfo` varchar(200) DEFAULT \'\' COMMENT \'类型介绍\',\n  `createtime` datetime DEFAULT NULL COMMENT \'创建时间\',\n  `createop` varchar(10) DEFAULT NULL COMMENT \'创建者\',\n  `updatetime` datetime DEFAULT NULL COMMENT \'更新时间\',\n  `updateop` varchar(10) DEFAULT NULL COMMENT \'更新者\',  \n  PRIMARY KEY (`id`)\n) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT \'课件类型表\';\n~~~', '2016-07-18 13:05:09', null);
INSERT INTO `code_js` VALUES ('5', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '设计表的公共样式', '> 设计表的公共样式\n\n~~~\n//样式模板\nDROP TABLE IF EXISTS `coursewaretype`;\nCREATE TABLE `coursewaretype` (\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'编号\',\n  `typename` varchar(20) DEFAULT \'\' COMMENT \'类型名称\',\n  `typeinfo` varchar(200) DEFAULT \'\' COMMENT \'类型介绍\',\n  `createtime` datetime DEFAULT NULL COMMENT \'创建时间\',\n  `createop` varchar(10) DEFAULT NULL COMMENT \'创建者\',\n  `updatetime` datetime DEFAULT NULL COMMENT \'更新时间\',\n  `updateop` varchar(10) DEFAULT NULL COMMENT \'更新者\',  \n  PRIMARY KEY (`id`)\n) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT \'课件类型表\';\n~~~', '2016-07-18 13:05:09', null);
INSERT INTO `code_js` VALUES ('6', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', 'banner轮播', '> 自己写的并且封装的banner轮播\n\n~~~\n//banner方法封装\nvar banner = (function () {\n    var j = 0,\n        len, thatdom, timesetinterval, flagok, quandom;\n    //隐藏显示\n    var banneranimate = function (j) {\n        thatdom.css(\"display\", \"none\");\n        thatdom.each(function (i) {\n            if (i === j) {\n                $(this).animate({\n                    display: \'block\',\n                    opacity: \'toggle\'\n                }, \"100\");\n            }\n        });\n        yuanquanshow();\n    };\n    //添加圆圈\n    var yuanquanfun = function () {\n        quandom.append(function () {\n            var str = \"<li></li>\";\n            var strcircle = \"\";\n            for (var i = 0; i < len; i++) {\n                strcircle = strcircle + str;\n            }\n            return strcircle;\n        });\n        quandom.find(\"li\").each(function (i) {\n            $(this).click(function () {\n                clearInterval(flagok);\n                j = i;\n                banneranimate(j);\n                timeevery();\n            });\n        });\n        yuanquanshow();\n    };\n    //圆圈显示\n    var yuanquanshow = function () {\n        quandom.find(\"li\").each(function (i) {\n            $(this).css(\"background\", \"#fff\");\n            if (i === j) {\n                $(this).css(\"background\", \"#ED6C00\");\n            }\n        });\n    };\n    //添加定时函数\n    var timeevery = function () {\n        flagok = setInterval(function () {\n            j = j + 1;\n            if (j === len) {\n                j = 0;\n            }\n            banneranimate(j, thatdom);\n        }, timesetinterval);\n    };\n    //开始\n    var start = function (thatimgdom, circledom, time) {\n        len = thatimgdom.length;\n        thatdom = thatimgdom;\n        quandom = circledom;\n        timesetinterval = time;\n        banneranimate(j);\n        timeevery();\n        yuanquanfun();\n    };\n    //点击耳朵\n    var ear = function (flagclick) {\n        clearInterval(flagok);\n        if (flagclick === \"left\") {\n            j = j - 1;\n            if (j === -1) {\n                j = (len - 1);\n            }\n        }\n        if (flagclick === \"right\") {\n            j = j + 1;\n            if (j === len) {\n                j = 0;\n            }\n        }\n        banneranimate(j);\n        timeevery();\n    };\n    return {\n        start: start,\n        ear: ear\n    }\n} ());\n\n//运行\nvar imgdom = $(\".header_banner\").find(\".header_banner_img\");\nvar circledom = $(\".clickcircle\").find(\"ul\");\nbanner.start(imgdom, circledom, 8000);\n~~~', '2016-07-20 11:19:07', null);
INSERT INTO `code_js` VALUES ('7', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', 'xxxx', '> 这里是背景注释第1行\n\n*这个是斜体*\n\n**这个是粗体**\n\n分割线\n***\n\n~~~\n//这里放代码块\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  $initHighlight;\n~~~', '2016-08-06 11:36:29', null);

-- ----------------------------
-- Table structure for code_mixed
-- ----------------------------
DROP TABLE IF EXISTS `code_mixed`;
CREATE TABLE `code_mixed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `title` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '搜索名称',
  `content` varchar(20000) COLLATE utf8_bin DEFAULT '' COMMENT '代码内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='java代码库表';

-- ----------------------------
-- Records of code_mixed
-- ----------------------------
INSERT INTO `code_mixed` VALUES ('1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '模板一', '> 这里是背景注释第1行\n\n> 这里是背景注释第2行\n\n> 这里是背景注释第3行\n\n*这个是斜体*\n\n**这个是粗体**\n\n分割线\n***\n\n~~~\n//这里放代码块\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  $initHighlight;\n~~~', '2016-07-18 15:14:41', null);
INSERT INTO `code_mixed` VALUES ('2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', 'hh', '> 这里是背景注释第1行\n\n> 这里是背景注释第2行\n\n> 这里是背景注释第3行\n\n*这个是斜体*\n\n**这个是粗体**\n\n分割线\n***\n\n~~~\n//这里放代码块\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  $initHighlight;\n~~~', '2016-07-18 15:26:35', null);
INSERT INTO `code_mixed` VALUES ('3', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '使用 Flexbox 的居中布局', '~~~\n.vertical-container {\n  height: 300px;\n  display: -webkit-flex;\n  display:         flex;\n  -webkit-align-items: center;\n          align-items: center;\n  -webkit-justify-content: center;\n          justify-content: center;\n}\n~~~', '2016-07-19 16:33:39', null);

-- ----------------------------
-- Table structure for code_mysql
-- ----------------------------
DROP TABLE IF EXISTS `code_mysql`;
CREATE TABLE `code_mysql` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `title` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '搜索名称',
  `content` varchar(20000) COLLATE utf8_bin DEFAULT '' COMMENT '代码内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='mysql代码库表';

-- ----------------------------
-- Records of code_mysql
-- ----------------------------
INSERT INTO `code_mysql` VALUES ('1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '案列', '> 这里是背景注释第1行\n\n> 这里是背景注释第2行\n\n> 这里是背景注释第3行\n\n*这个是斜体*\n\n**这个是粗体**\n\n分割线\n***\n\n~~~\n//这里放代码块\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  $initHighlight;\n~~~', '2016-07-18 12:54:36', null);
INSERT INTO `code_mysql` VALUES ('2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '公司设计表的模板', '> 公司设计表的模板\n\n~~~\n//表的模板\nDROP TABLE IF EXISTS `coursewaretype`;\nCREATE TABLE `coursewaretype` (\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'编号\',\n  `typename` varchar(20) DEFAULT \'\' COMMENT \'类型名称\',\n  `typeinfo` varchar(200) DEFAULT \'\' COMMENT \'类型介绍\',\n  `createtime` datetime DEFAULT NULL COMMENT \'创建时间\',\n  `createop` varchar(10) DEFAULT NULL COMMENT \'创建者\',\n  `updatetime` datetime DEFAULT NULL COMMENT \'更新时间\',\n  `updateop` varchar(10) DEFAULT NULL COMMENT \'更新者\',  \n  PRIMARY KEY (`id`)\n) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT \'课件类型表\';\n~~~', '2016-07-18 13:16:57', null);
INSERT INTO `code_mysql` VALUES ('3', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '多表联合查询', '> 这个是多表联合查询\n\n~~~\n//这里放代码块\n $sql = \"select a.id,a.title,b.user_name from \".$codename.\" a,user b where a.user_guid = b.user_guid\";\n    $datatitle = $db->query($sql, array());\n~~~', '2016-07-18 15:48:47', null);

-- ----------------------------
-- Table structure for code_php
-- ----------------------------
DROP TABLE IF EXISTS `code_php`;
CREATE TABLE `code_php` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `title` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '搜索名称',
  `content` varchar(20000) COLLATE utf8_bin DEFAULT '' COMMENT '代码内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='php代码库表';

-- ----------------------------
-- Records of code_php
-- ----------------------------
INSERT INTO `code_php` VALUES ('1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '案列', '> 这里是背景注释第1行\n\n> 这里是背景注释第2行\n\n> 这里是背景注释第3行\n\n*这个是斜体*\n\n**这个是粗体**\n\n分割线\n***\n\n~~~\n//这里放代码块\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  $initHighlight;\n~~~', '2016-07-18 12:57:07', null);
INSERT INTO `code_php` VALUES ('2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '存单表数据', '> 框架方法：将post过来的数据存入数据库\n\n~~~\n$time = date(\"Y-m-d H:i:s\"); // 获取当前时间\n$sql = \"INSERT INTO \".$codename.\" (user_guid,title,content,createtime) values(?,?,?,?)\";\n$rs1 = $db->execute($sql, array($user_guid, $title, $textcode, $time));\n~~~', '2016-07-18 13:20:44', null);

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
DROP TABLE IF EXISTS `worknote`;
CREATE TABLE `worknote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '日志名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作日志表一级';

-- ----------------------------
-- Records of worknote
-- ----------------------------
