/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : thinghigh

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-12-27 13:34:00
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码库表';

-- ----------------------------
-- Records of code
-- ----------------------------
INSERT INTO `code` VALUES ('1', '', '2', '存单表数据', '> 框架方法：将post过来的数据存入数据库\n\n~~~\n$time = date(\"Y-m-d H:i:s\"); // 获取当前时间\n$sql = \"INSERT INTO \".$codename.\" (user_guid,title,content,createtime) values(?,?,?,?)\";\n$rs1 = $db->execute($sql, array($user_guid, $title, $textcode, $time));\n~~~', '2016-12-26 15:31:39', '2016-12-26 15:31:41');
INSERT INTO `code` VALUES ('8', '', '1', '获取省份证号码信息', '~~~\nfunction IdCard(UUserCard, num) {\n    if (num == 1) {\n        //获取出生日期\n        birth = UUserCard.substring(6, 10) + \"-\" + UUserCard.substring(10, 12) + \"-\" + UUserCard.substring(12, 14);\n        return birth;\n    }\n    if (num == 2) {\n        //获取性别\n        if (parseInt(UUserCard.substr(16, 1)) % 2 == 1) {\n            //男\n            return \"男\";\n        } else {\n            //女\n            return \"女\";\n        }\n    }\n    if (num == 3) {\n        //获取年龄\n        var myDate = new Date();\n        var month = myDate.getMonth() + 1;\n        var day = myDate.getDate();\n        var age = myDate.getFullYear() - UUserCard.substring(6, 10) - 1;\n        if (UUserCard.substring(10, 12) < month || UUserCard.substring(10, 12) == month && UUserCard.substring(12, 14) <= day) {\n            age++;\n        }\n        return age;\n    }\n}\n~~~', '2016-12-27 11:36:04', '2016-12-27 11:36:04');
INSERT INTO `code` VALUES ('9', '', '4', 'fixed居中', '~~~\n.btnfbtm {\n    position: fixed;\n    bottom: 0;\n    width: 980px;\n    height: 60px;\n    right: 30px;\n    margin:auto;\n    left:0;\n    right:0;\n    bottom:0;\n}\n~~~', '2016-12-27 11:38:49', '2016-12-27 11:38:49');
INSERT INTO `code` VALUES ('10', '', '2', '跳转页面', '~~~\nPage::view($url);\n\nRedirect::to($url);\n~~~', '2016-12-27 11:41:11', '2016-12-27 11:41:11');
INSERT INTO `code` VALUES ('11', '', '5', '滚动加载', '~~~\n<style media=\"screen\">\n    .copyright{\n        margin-bottom: 100px;\n    }\n</style>\n\n<style>\n    #gddw{\n        position: fixed;\n        bottom: 15px;\n        left: 50%;\n        margin-left: -65px;\n        display: none;\n    }\n</style>\n\n<div id=\"gddw\" class=\"weui-infinite-scroll\">\n  <div class=\"infinite-preloader\"></div><!-- 菊花 -->\n  正在加载... <!-- 文案，可以自行修改 -->\n</div>\n\n\n\n//滚动加载\nvar gdjz = (function () {\n    var gdcallback;\n    //初始化事件\n    var infinite = function () {\n        $(document.body).infinite();\n    };\n    //销毁事件\n    var end = function () {\n        $(\'#gddw\').hide();\n        $(document.body).destroyInfinite();\n    };\n    //监听事件\n    var watch = function () {\n        var loading = false;  //状态标记\n        $(document.body).infinite().on(\"infinite\", function () {\n            if (loading) return;\n            $(\'#gddw\').show();\n            loading = true;\n            setTimeout(function () {\n                gdcallback();\n                loading = false;\n                $(\'#gddw\').hide();\n            }, 1500);   //模拟延迟\n        });\n    };\n    var start = function (callback) {\n        infinite();\n        watch();\n        gdcallback = callback;\n    };\n    return {\n        start: start,\n        end: end\n    }\n}());\n\n        gdjz.start();\n~~~', '2016-12-27 11:52:00', '2016-12-27 11:52:00');
INSERT INTO `code` VALUES ('12', '', '3', 'pubs_official(后台授权)', '~~~\n/*\nNavicat MySQL Data Transfer\n\nSource Server         : localhost\nSource Server Version : 50547\nSource Host           : localhost:3306\nSource Database       : wy_zlqgh\n\nTarget Server Type    : MYSQL\nTarget Server Version : 50547\nFile Encoding         : 65001\n\nDate: 2016-08-12 09:44:44\n*/\n\nSET FOREIGN_KEY_CHECKS=0;\n\n-- ----------------------------\n-- Table structure for pubs_official\n-- ----------------------------\nDROP TABLE IF EXISTS `pubs_official`;\nCREATE TABLE `pubs_official` (\n  `id` bigint(20) NOT NULL AUTO_INCREMENT,\n  `wid` bigint(20) NOT NULL,\n  `invokeid` varchar(20) NOT NULL COMMENT \'接口标识\',\n  `name` varchar(100) DEFAULT NULL COMMENT \'公众号名称\',\n  `appid` varchar(50) NOT NULL COMMENT \'接口ID\',\n  `logo` varchar(255) DEFAULT NULL COMMENT \'公众号头像\',\n  `type` tinyint(2) DEFAULT NULL COMMENT \'授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号\',\n  `qrcode` varchar(255) DEFAULT NULL COMMENT \'二维码地址\',\n  `accesstoken` varchar(512) NOT NULL COMMENT \'调用接口access_token\',\n  `accesstoken_lastupdate` datetime NOT NULL COMMENT \'调用接口access_token最后更新时间\',\n  `state` tinyint(1) DEFAULT \'0\' COMMENT \'0:未授权 1:已授权\',\n  `createtime` datetime NOT NULL COMMENT \'权限签名\',\n  `updatetime` datetime NOT NULL COMMENT \'调用接口jsapi_ticket最后更新时间\',\n  PRIMARY KEY (`id`)\n) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT=\'公众号基本信息表\';\n\n-- ----------------------------\n-- Records of pubs_official\n-- ----------------------------\nINSERT INTO `pubs_official` VALUES (\'1\', \'1\', \'dy93d7f96b93eb4308da\', \'萭事通\', \'wx08de066938343eb9\', \'http://wx.qlogo.cn/mmopen/TvjQ8s7myLBRhC9JWBFJfGU22Qd6AOrtOp8jmuE1aJBxbRNqYopks3vHjbUbTTYPo5SpYV8mUyHV1COQsYVibLmpwhzHDghwk/0\', \'2\', \'http://mmbiz.qpic.cn/mmbiz/qMLYktpIZfGf16DSGBfUVKX\', \'2lAihUFhKM8WLRXovClc2Mx5fnGVkWZJhPlydsIX4XG91qlfck6M9O8KdWMEctvH5YaY7rN8ll5qzhQQSe_3Z0jyyp\', \'2016-08-09 10:15:16\', \'1\', \'2016-08-09 10:15:18\', \'2016-08-09 10:15:20\');\nINSERT INTO `pubs_official` VALUES (\'3\', \'1\', \'dy9ba170ec4321e409ee\', \'微校云\', \'wxbc793b5d2aabb6cf\', \'http://wx.qlogo.cn/mmopen/SLT3TvgmPkBYuvJMMHbakQpyvC604RRI95mWia0Zo5S1n0nS990cQpaCEzK9sRntj4fJH84lyl4AmyvrMMxLWGVpjefTuT6y1/0\', \'2\', \'http://mmbiz.qpic.cn/mmbiz/VS9tepwuTF0SOOoXawO5MNOV2aUdYsUNwqQSZA0JJU3iagpnY2BTicDdPr4qoA2vPiaFJbaq5CDumnbrYWyRjFLXg/0\', \'ylT-lKAOmRGog2NrbwMlV04RXTLmfOET6J6wfhYBCFQmmCHwZayk5Rqg_0SEigDk05mZsh5ogbmXqDrpN50NE6fOS9\', \'2016-08-09 13:38:05\', \'1\', \'2016-08-09 12:33:38\', \'2016-08-09 13:38:05\');\n\n~~~', '2016-12-27 12:00:25', '2016-12-27 12:00:25');

-- ----------------------------
-- Table structure for level
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `li` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户的等级',
  `state` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '0：未到等级，1：已到等级',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='等级表';

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES ('1', '', '1', '0', '2016-12-26 15:55:30', '2016-12-26 15:55:33');
INSERT INTO `level` VALUES ('2', '', '2', '0', null, null);
INSERT INTO `level` VALUES ('3', '', '3', '0', null, null);
INSERT INTO `level` VALUES ('4', '', '4', '0', null, null);
INSERT INTO `level` VALUES ('5', '', '5', '0', null, null);
INSERT INTO `level` VALUES ('6', '', '6', '0', null, null);
INSERT INTO `level` VALUES ('7', '', '7', '0', null, null);
INSERT INTO `level` VALUES ('8', '', '8', '0', null, null);
INSERT INTO `level` VALUES ('9', '', '9', '0', null, null);
INSERT INTO `level` VALUES ('10', '', '10', '0', null, null);
INSERT INTO `level` VALUES ('11', '', '11', '0', null, null);

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
