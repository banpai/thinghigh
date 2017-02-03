/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : thinghigh

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-02-03 09:25:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `user_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '用户名称',
  `title` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '网址总标题的名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作日志表一级';

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '常用', '2017-01-20 13:59:48', '2017-01-20 13:59:51');
INSERT INTO `address` VALUES ('2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '资料', '2017-01-20 14:00:29', '2017-01-20 14:00:32');
INSERT INTO `address` VALUES ('3', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '项目', '2017-01-20 14:00:59', '2017-01-20 14:01:03');

-- ----------------------------
-- Table structure for address_li
-- ----------------------------
DROP TABLE IF EXISTS `address_li`;
CREATE TABLE `address_li` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `aid` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT 'address表中的id',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `user_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '用户名称',
  `title_zi` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '网址父标题的名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作日志表一级';

-- ----------------------------
-- Records of address_li
-- ----------------------------
INSERT INTO `address_li` VALUES ('1', '1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '读', '2017-01-20 14:01:46', '2017-01-20 14:01:49');
INSERT INTO `address_li` VALUES ('2', '1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '写', '2017-01-20 14:02:14', '2017-01-20 14:02:17');
INSERT INTO `address_li` VALUES ('3', '1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '听', '2017-01-20 14:02:58', '2017-01-20 14:03:01');
INSERT INTO `address_li` VALUES ('4', '1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '看', '2017-01-20 14:03:26', '2017-01-20 14:03:41');
INSERT INTO `address_li` VALUES ('5', '1', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '其它', '2017-01-20 14:04:59', '2017-01-20 14:05:01');
INSERT INTO `address_li` VALUES ('6', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '白鹭引擎', '2017-01-20 14:07:20', '2017-01-20 14:07:22');
INSERT INTO `address_li` VALUES ('7', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '微信小程序', '2017-01-20 14:24:01', '2017-01-20 14:24:07');
INSERT INTO `address_li` VALUES ('8', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', 'createjs', '2017-01-20 14:26:07', '2017-01-20 14:26:09');
INSERT INTO `address_li` VALUES ('9', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', 'week', '2017-01-20 14:26:49', '2017-01-20 14:26:51');
INSERT INTO `address_li` VALUES ('10', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', '前端博客', '2017-01-20 14:27:52', '2017-01-20 14:30:12');
INSERT INTO `address_li` VALUES ('11', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', 'UI库', '2017-01-20 14:32:19', '2017-01-20 14:32:22');
INSERT INTO `address_li` VALUES ('12', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', 'react', '2017-01-20 14:32:55', '2017-01-20 14:32:58');
INSERT INTO `address_li` VALUES ('13', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', 'webpack', '2017-01-20 14:33:39', '2017-01-20 14:33:42');
INSERT INTO `address_li` VALUES ('14', '2', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '半拍', 'gulp', '2017-01-20 14:34:46', '2017-01-20 14:34:49');
INSERT INTO `address_li` VALUES ('15', '2', 'D307F3C7EB32', '半拍', 'canvas', '2017-01-20 14:35:25', '2017-01-20 14:35:27');
INSERT INTO `address_li` VALUES ('16', '2', 'D307F3C7EB32', '半拍', 'vue.js', '2017-01-20 14:40:13', '2017-01-20 14:40:15');
INSERT INTO `address_li` VALUES ('17', '2', 'D307F3C7EB32', '半拍', 'noedejs', '2017-01-20 14:42:41', '2017-01-20 14:42:43');
INSERT INTO `address_li` VALUES ('18', '2', 'D307F3C7EB32', '半拍', 'Electron', '2017-01-20 14:43:06', '2017-01-20 14:43:09');
INSERT INTO `address_li` VALUES ('19', '2', 'D307F3C7EB32', '半拍', 'thinkjs', '2017-01-20 14:49:09', '2017-01-20 14:49:12');
INSERT INTO `address_li` VALUES ('20', '2', 'D307F3C7EB32', '半拍', 'js语法', '2017-01-20 14:49:45', '2017-01-20 14:49:48');
INSERT INTO `address_li` VALUES ('21', '2', 'D307F3C7EB32', '半拍', 'avalon', '2017-01-20 14:51:13', '0000-00-00 00:00:00');
INSERT INTO `address_li` VALUES ('22', '2', 'D307F3C7EB32', '半拍', 'es6', '2017-01-22 08:42:51', '2017-01-22 08:42:53');
INSERT INTO `address_li` VALUES ('23', '2', 'D307F3C7EB32', '半拍', 'mySql', '2017-01-22 08:43:39', '2017-01-22 08:43:48');
INSERT INTO `address_li` VALUES ('24', '2', 'D307F3C7EB32', '半拍', 'three.js', '2017-01-22 08:43:43', '2017-01-22 08:43:51');
INSERT INTO `address_li` VALUES ('25', '2', 'D307F3C7EB32', '半拍', '漫画', '2017-01-22 08:43:46', '2017-01-22 08:43:54');
INSERT INTO `address_li` VALUES ('26', '2', 'D307F3C7EB32', '半拍', '编剧', '2017-01-22 08:45:28', '2017-01-22 08:45:31');
INSERT INTO `address_li` VALUES ('27', '2', 'D307F3C7EB32', '半拍', '工具', '2017-01-23 10:38:55', '2017-01-23 10:38:58');
INSERT INTO `address_li` VALUES ('28', '2', 'D307F3C7EB32', '半拍', '其它', '2017-01-23 10:39:17', '2017-01-23 10:39:19');

-- ----------------------------
-- Table structure for address_li_record
-- ----------------------------
DROP TABLE IF EXISTS `address_li_record`;
CREATE TABLE `address_li_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `aid` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT 'address表中的id',
  `alid` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT 'address_li表中的id',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `user_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '用户名称',
  `name` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '网址的名称',
  `address` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '网址的地址',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作日志表一级';

-- ----------------------------
-- Records of address_li_record
-- ----------------------------
INSERT INTO `address_li_record` VALUES ('1', '1', '1', 'D307F3C7EB32', '半拍', '虎嗅', 'https://www.huxiu.com/', '2017-01-22 08:48:54', '2017-01-22 08:48:57');
INSERT INTO `address_li_record` VALUES ('2', '1', '1', 'D307F3C7EB32', '半拍', '极客公园', 'http://www.geekpark.net/', '2017-01-22 08:50:45', '2017-01-22 08:50:58');
INSERT INTO `address_li_record` VALUES ('3', '1', '1', 'D307F3C7EB32', '半拍', '36氪', 'http://36kr.com/', '2017-01-22 08:50:48', '2017-01-22 08:51:01');
INSERT INTO `address_li_record` VALUES ('4', '1', '1', 'D307F3C7EB32', '半拍', '知乎Live', 'https://zhuanlan.zhihu.com/zhihulive', '2017-01-22 08:50:51', '2017-01-22 08:51:05');
INSERT INTO `address_li_record` VALUES ('5', '1', '1', 'D307F3C7EB32', '半拍', '知乎', 'https://www.zhihu.com/question/24156227', '2017-01-22 08:50:54', '2017-01-22 08:51:08');
INSERT INTO `address_li_record` VALUES ('6', '1', '1', 'D307F3C7EB32', '半拍', '新浪微博', 'http://weibo.com/u/5213177197/home?wvr=5&c=spr_web_sq_firefox_weibo_t001', '2017-01-22 08:50:56', '2017-01-22 08:51:12');
INSERT INTO `address_li_record` VALUES ('7', '1', '2', 'D307F3C7EB32', '半拍', '作品管理', 'http://write.qq.com/public/login.html', '2017-01-22 09:03:34', '2017-01-22 09:03:44');
INSERT INTO `address_li_record` VALUES ('8', '1', '2', 'D307F3C7EB32', '半拍', '简书', 'http://www.jianshu.com/', '2017-01-22 09:03:37', '2017-01-22 09:03:46');
INSERT INTO `address_li_record` VALUES ('9', '1', '2', 'D307F3C7EB32', '半拍', '便签-锤子', 'https://cloud.smartisan.com/#/notes', '2017-01-22 09:03:39', '2017-01-22 09:03:49');
INSERT INTO `address_li_record` VALUES ('10', '1', '2', 'D307F3C7EB32', '半拍', 'ProcessOn', 'https://www.processon.com/diagrams#', '2017-01-22 09:03:42', '2017-01-22 09:03:51');
INSERT INTO `address_li_record` VALUES ('11', '1', '3', 'D307F3C7EB32', '半拍', 'musicForProgramming', 'http://musicforprogramming.net/', '2017-01-22 09:07:41', '2017-01-22 09:07:53');
INSERT INTO `address_li_record` VALUES ('12', '1', '3', 'D307F3C7EB32', '半拍', '喜马拉雅', 'http://www.ximalaya.com/', '2017-01-22 09:07:44', '2017-01-22 09:07:56');
INSERT INTO `address_li_record` VALUES ('13', '1', '3', 'D307F3C7EB32', '半拍', '落网', 'http://www.luoo.net/', '2017-01-22 09:07:47', '2017-01-22 09:07:58');
INSERT INTO `address_li_record` VALUES ('14', '1', '3', 'D307F3C7EB32', '半拍', '男人变态有什么错', 'http://www.missevan.com/explore/channel/16808', '2017-01-22 09:07:49', '2017-01-22 09:08:01');
INSERT INTO `address_li_record` VALUES ('15', '1', '4', 'D307F3C7EB32', '半拍', 'MOOC学院', 'http://mooc.guokr.com/', '2017-01-22 09:15:10', '2017-01-22 09:16:21');
INSERT INTO `address_li_record` VALUES ('16', '1', '4', 'D307F3C7EB32', '半拍', '优酷网', 'http://www.youku.com/', '2017-01-22 09:15:14', '2017-01-22 09:16:23');
INSERT INTO `address_li_record` VALUES ('17', '1', '4', 'D307F3C7EB32', '半拍', '爱奇艺', 'http://www.iqiyi.com/', '2017-01-22 09:15:18', '2017-01-22 09:16:26');
INSERT INTO `address_li_record` VALUES ('18', '1', '4', 'D307F3C7EB32', '半拍', '乐视', 'http://www.le.com/', '2017-01-22 09:15:20', '2017-01-22 09:16:28');
INSERT INTO `address_li_record` VALUES ('19', '1', '5', 'D307F3C7EB32', '半拍', '爱淘宝', 'http://ai.taobao.com/?pid=mm_28347190_2425761_17624777', '2017-01-22 09:34:17', '2017-01-22 09:34:54');
INSERT INTO `address_li_record` VALUES ('20', '1', '5', 'D307F3C7EB32', '半拍', '苏宁易购', 'http://order.suning.com/onlineOrder/orderSuccess.do?orderIds=1047770467&random=74b32cf3-9bff-4598-94f0-f94c47ea7c46&check=2134b521662f843b242cb6dbf07bcbdb', '2017-01-22 09:34:20', '2017-01-22 09:34:57');
INSERT INTO `address_li_record` VALUES ('21', '1', '5', 'D307F3C7EB32', '半拍', '京东', 'https://www.jd.com/', '2017-01-22 09:34:23', '2017-01-22 09:35:00');
INSERT INTO `address_li_record` VALUES ('22', '1', '5', 'D307F3C7EB32', '半拍', '什么值得买', 'http://search.smzdm.com/?c=youhui&s=%E9%94%A4%E5%AD%90&v=b', '2017-01-22 09:34:26', '2017-01-22 09:35:02');
INSERT INTO `address_li_record` VALUES ('23', '1', '5', 'D307F3C7EB32', '半拍', '网易邮箱', 'http://mail.yeah.net/', '2017-01-22 09:34:28', '2017-01-22 09:35:04');
INSERT INTO `address_li_record` VALUES ('24', '1', '5', 'D307F3C7EB32', '半拍', '笑笑鸟', 'http://www.jokebird.com/', '2017-01-22 09:34:31', '2017-01-22 09:35:07');
INSERT INTO `address_li_record` VALUES ('25', '1', '5', 'D307F3C7EB32', '半拍', '云服务器管理控制台', 'https://account.aliyun.com/login/login.htm?oauth_callback=https%3A%2F%2Fecs.console.aliyun.com%2F#/server/i-28d64wn6e/detail?regionId=cn-qingdao', '2017-01-22 09:34:48', '2017-01-22 09:35:10');
INSERT INTO `address_li_record` VALUES ('26', '1', '5', 'D307F3C7EB32', '半拍', 'eyemore | 首款人眼引擎相机', 'http://www.eyemore.cn/', '2017-01-22 09:34:51', '2017-01-22 09:35:12');
INSERT INTO `address_li_record` VALUES ('27', '2', '6', 'D307F3C7EB32', '半拍', '白鹭开发者中心', 'http://developer.egret.com/cn/example/egret2d/index.html#010-disp-basic', '2017-01-22 09:37:11', '2017-01-22 09:37:13');
INSERT INTO `address_li_record` VALUES ('28', '2', '7', 'D307F3C7EB32', '半拍', '微信小程序weui\r\n微信小程序weui', 'https://github.com/weui/weui-wxss?from=timeline&isappinstalled=0', '2017-01-22 09:42:13', '2017-01-22 09:42:34');
INSERT INTO `address_li_record` VALUES ('29', '2', '7', 'D307F3C7EB32', '半拍', '野狗后端', 'https://docs.wilddog.com/overview/index.html', '2017-01-22 09:42:16', '2017-01-22 09:42:36');
INSERT INTO `address_li_record` VALUES ('30', '2', '7', 'D307F3C7EB32', '半拍', '\r\nQ&A · 小程序', 'https://mp.weixin.qq.com/debug/wxadoc/dev/qa/qa.html?t=1476197489869', '2017-01-22 09:42:18', '2017-01-22 09:42:38');
INSERT INTO `address_li_record` VALUES ('31', '2', '7', 'D307F3C7EB32', '半拍', '微信公众平台', 'https://mp.weixin.qq.com/', '2017-01-22 09:42:21', '2017-01-22 09:42:41');
INSERT INTO `address_li_record` VALUES ('32', '2', '7', 'D307F3C7EB32', '半拍', '\r\n掘金微信小程序', 'https://gold.xitu.io/tag/%25E5%25BE%25AE%25E4%25BF%25A1%25E5%25B0%258F%25E7%25A8%258B%25E5%25BA%258F', '2017-01-22 09:42:24', '2017-01-22 09:42:43');
INSERT INTO `address_li_record` VALUES ('33', '2', '7', 'D307F3C7EB32', '半拍', '微信开发者社区', 'https://developers.weixin.qq.com/home?token=1285648536&lang=zh_CN', '2017-01-22 09:42:26', '2017-01-22 09:42:46');
INSERT INTO `address_li_record` VALUES ('34', '2', '7', 'D307F3C7EB32', '半拍', '微信小程序weapp的底层实现原理', 'https://developers.weixin.qq.com/blogdetail?action=get_post_info&lang=zh_CN&token=1285648536&docid=d1421cd729a51548672430e544c458b2', '2017-01-22 09:42:29', '2017-01-22 09:42:49');
INSERT INTO `address_li_record` VALUES ('35', '2', '7', 'D307F3C7EB32', '半拍', '一键登录 获取session_key和openid', 'http://blog.csdn.net/qq_31383345/article/details/53193490', '2017-01-22 09:42:31', '2017-01-22 09:42:52');
INSERT INTO `address_li_record` VALUES ('36', '2', '7', 'D307F3C7EB32', '半拍', '微信小程序仿闲鱼『下拉菜单', 'https://gold.xitu.io/post/584cafb8128fe1006c86b60b', '2017-01-22 09:44:21', '2017-01-22 09:44:23');
INSERT INTO `address_li_record` VALUES ('37', '2', '8', 'D307F3C7EB32', '半拍', 'EaselJS入门教程', 'https://lengziyu.gitbooks.io/learn-createjs/content/', '2017-01-22 09:48:16', '2017-01-22 09:48:21');
INSERT INTO `address_li_record` VALUES ('38', '2', '8', 'D307F3C7EB32', '半拍', 'CreateJS官网', 'http://createjs.com/', '2017-01-22 09:48:19', '2017-01-22 09:48:24');
INSERT INTO `address_li_record` VALUES ('39', '2', '9', 'D307F3C7EB32', '半拍', 'Tutorial · GitBook', 'https://weex-project.io/guide/', '2017-01-22 09:52:41', '2017-01-22 09:52:56');
INSERT INTO `address_li_record` VALUES ('40', '2', '9', 'D307F3C7EB32', '半拍', 'Syntax · Weex', 'https://weex-project.io/guide/', '2017-01-22 09:52:44', '2017-01-22 09:52:58');
INSERT INTO `address_li_record` VALUES ('41', '2', '9', 'D307F3C7EB32', '半拍', 'Weex 新手入门', 'http://www.weex.help/getstart', '2017-01-22 09:52:46', '2017-01-22 09:53:01');
INSERT INTO `address_li_record` VALUES ('42', '2', '9', 'D307F3C7EB32', '半拍', 'Get Started · Weex', 'https://weex-project.io/cn/guide/', '2017-01-22 09:52:48', '2017-01-22 09:53:04');
INSERT INTO `address_li_record` VALUES ('43', '2', '9', 'D307F3C7EB32', '半拍', 'weex教程', 'https://github.com/joggerplus/awesome-weex', '2017-01-22 09:52:50', '2017-01-22 09:53:06');
INSERT INTO `address_li_record` VALUES ('44', '2', '9', 'D307F3C7EB32', '半拍', 'Android Studio', 'http://www.android-studio.org/', '2017-01-22 09:52:53', '2017-01-22 09:53:08');
INSERT INTO `address_li_record` VALUES ('45', '2', '10', 'D307F3C7EB32', '半拍', 'AnnatarHe', 'https://annatarhe.github.io/', '2017-01-22 10:01:18', '2017-01-22 10:01:43');
INSERT INTO `address_li_record` VALUES ('46', '2', '10', 'D307F3C7EB32', '半拍', 'purplebamboo', 'http://purplebamboo.github.io/', '2017-01-22 10:01:21', '2017-01-22 10:01:46');
INSERT INTO `address_li_record` VALUES ('47', '2', '10', 'D307F3C7EB32', '半拍', 'JerryQu', 'https://imququ.com/', '2017-01-22 10:01:24', '2017-01-22 10:01:48');
INSERT INTO `address_li_record` VALUES ('48', '2', '10', 'D307F3C7EB32', '半拍', 'Category', 'http://www.barretlee.com/blog/categories/JavaScript/', '2017-01-22 10:01:26', '2017-01-22 10:01:50');
INSERT INTO `address_li_record` VALUES ('49', '2', '10', 'D307F3C7EB32', '半拍', '阿城', 'https://qiutc.me/', '2017-01-22 10:01:28', '2017-01-22 10:01:52');
INSERT INTO `address_li_record` VALUES ('50', '2', '10', 'D307F3C7EB32', '半拍', '掘金', 'https://gold.xitu.io/', '2017-01-22 10:01:30', '2017-01-22 10:01:55');
INSERT INTO `address_li_record` VALUES ('51', '2', '10', 'D307F3C7EB32', '半拍', '前端外刊评论', 'http://qianduan.guru/', '2017-01-22 10:01:32', '2017-01-22 10:01:56');
INSERT INTO `address_li_record` VALUES ('52', '2', '10', 'D307F3C7EB32', '半拍', '归档 | yatessss', 'http://www.yatessss.com/', '2017-01-22 10:01:34', '2017-01-22 10:01:58');
INSERT INTO `address_li_record` VALUES ('53', '2', '10', 'D307F3C7EB32', '半拍', 'SegmentFault', 'https://segmentfault.com/', '2017-01-22 10:01:36', '2017-01-22 10:02:01');
INSERT INTO `address_li_record` VALUES ('54', '2', '10', 'D307F3C7EB32', '半拍', '独家号/团队号 - 开发者头条', 'https://toutiao.io/explore', '2017-01-22 10:01:38', '2017-01-22 10:02:03');
INSERT INTO `address_li_record` VALUES ('55', '2', '11', 'D307F3C7EB32', '半拍', '70个老司机技巧教你更好的进行CSS编程（by 网瘾少年） - 众成翻译', 'http://www.zcfy.cc/article/70-expert-ideas-for-better-css-coding-hackhands-1078.html', '2017-01-22 10:01:40', '2017-01-22 10:02:05');
INSERT INTO `address_li_record` VALUES ('56', '2', '11', 'D307F3C7EB32', '半拍', 'G2（图形语法）', 'https://antv.alipay.com/g2/doc/', '2017-01-22 10:33:58', '2017-01-22 10:34:50');
INSERT INTO `address_li_record` VALUES ('57', '2', '11', 'D307F3C7EB32', '半拍', 'iView', 'https://www.iviewui.com/', '2017-01-22 10:34:01', '2017-01-22 10:34:52');
INSERT INTO `address_li_record` VALUES ('58', '2', '11', 'D307F3C7EB32', '半拍', 'WePayUI - 付款记录', 'https://wepayui.github.io/', '2017-01-22 10:34:04', '2017-01-22 10:34:55');
INSERT INTO `address_li_record` VALUES ('59', '2', '11', 'D307F3C7EB32', '半拍', 'jQuery WEUI', 'http://jqweui.com/components#msg', '2017-01-22 10:34:07', '2017-01-22 10:34:58');
INSERT INTO `address_li_record` VALUES ('60', '2', '11', 'D307F3C7EB32', '半拍', 'Waver(波浪效果)', 'https://github.com/unixzii/Waver.js', '2017-01-22 10:34:09', '2017-01-22 10:35:01');
INSERT INTO `address_li_record` VALUES ('61', '2', '11', 'D307F3C7EB32', '半拍', 'animate.css（css3特效）', 'https://github.com/daneden/animate.css', '2017-01-22 10:34:12', '2017-01-22 10:35:03');
INSERT INTO `address_li_record` VALUES ('62', '2', '11', 'D307F3C7EB32', '半拍', 'ThreeJS太阳系漫游', 'https://zhuanlan.zhihu.com/p/20796329?refer=sayfe', '2017-01-22 10:34:15', '2017-01-22 10:35:07');
INSERT INTO `address_li_record` VALUES ('63', '2', '11', 'D307F3C7EB32', '半拍', 'weui/weui.js', 'https://github.com/weui/weui.js', '2017-01-22 10:34:18', '2017-01-22 10:35:10');
INSERT INTO `address_li_record` VALUES ('64', '2', '11', 'D307F3C7EB32', '半拍', '移动端页面控制台(微信)', 'https://github.com/WechatFE/vConsole/blob/master/README_CN.md', '2017-01-22 10:34:20', '2017-01-22 10:35:13');
INSERT INTO `address_li_record` VALUES ('65', '2', '11', 'D307F3C7EB32', '半拍', 'ueditor(富文本编辑)', 'https://github.com/banpai/ueditor', '2017-01-22 10:34:24', '2017-01-22 10:35:16');
INSERT INTO `address_li_record` VALUES ('66', '2', '11', 'D307F3C7EB32', '半拍', 'weui样式库(微信样式库)', 'https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1455784134&token=&lang=zh_CN', '2017-01-22 10:34:27', '2017-01-22 10:35:18');
INSERT INTO `address_li_record` VALUES ('67', '2', '11', 'D307F3C7EB32', '半拍', 'jquery-weui: UI', 'https://github.com/lihongxun945/jquery-weui', '2017-01-22 10:34:30', '2017-01-22 10:35:20');
INSERT INTO `address_li_record` VALUES ('68', '2', '11', 'D307F3C7EB32', '半拍', 'vux', 'https://vuxjs.gitbooks.io/vux/content/about/before.html', '2017-01-22 10:34:33', '2017-01-22 10:35:23');
INSERT INTO `address_li_record` VALUES ('69', '2', '11', 'D307F3C7EB32', '半拍', '控制面板', 'http://c1754893860.wezhan.cn/login?ReturnUrl=%2fAdmin%2fSiteAdmin%2findex2', '2017-01-22 10:34:35', '2017-01-22 10:35:25');
INSERT INTO `address_li_record` VALUES ('70', '2', '11', 'D307F3C7EB32', '半拍', '图形工具', 'https://github.com/phodal/toolbox/blob/master/graphics.md', '2017-01-22 10:34:38', '2017-01-22 10:35:27');
INSERT INTO `address_li_record` VALUES ('71', '2', '11', 'D307F3C7EB32', '半拍', 'GitHub - myronliu347/vue-carbon: 基于vue开发的material design ui库', 'https://github.com/myronliu347/vue-carbon', '2017-01-22 10:34:40', '2017-01-22 10:35:29');
INSERT INTO `address_li_record` VALUES ('72', '2', '11', 'D307F3C7EB32', '半拍', 'Font Awesome', 'http://www.bootcss.com/p/font-awesome/', '2017-01-22 10:34:42', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('73', '2', '11', 'D307F3C7EB32', '半拍', 'Vonic', 'https://wangdahoo.github.io/', '2017-01-22 10:34:44', '2017-01-22 10:35:34');
INSERT INTO `address_li_record` VALUES ('74', '2', '11', ' D307F3C7EB32', '半拍', '介绍 · Vonic', 'https://wangdahoo.gitbooks.io/vonic/content/zh-CN/', '2017-01-22 10:34:47', '2017-01-22 10:35:36');
INSERT INTO `address_li_record` VALUES ('75', '2', '12', 'D307F3C7EB32', '半拍', '和我一起实战react', 'https://icepy.gitbooks.io/follow-react/content/', '2017-01-22 10:38:45', '2017-01-22 10:39:05');
INSERT INTO `address_li_record` VALUES ('76', '2', '12', 'D307F3C7EB32', '半拍', '快速开始 | React', 'http://reactjs.cn/react/docs/getting-started.html', '2017-01-22 10:38:47', '2017-01-22 10:39:07');
INSERT INTO `address_li_record` VALUES ('77', '2', '12', 'D307F3C7EB32', '半拍', '1.1 React 介绍 - LeanReact - 知乎专栏', 'https://zhuanlan.zhihu.com/p/21108312?refer=leanreact', '2017-01-22 10:38:50', '2017-01-22 10:39:09');
INSERT INTO `address_li_record` VALUES ('78', '2', '12', 'D307F3C7EB32', '半拍', 'Radmin前端框架', 'http://radmin.qq.com/example.html', '2017-01-22 10:38:52', '2017-01-22 10:39:11');
INSERT INTO `address_li_record` VALUES ('79', '2', '12', 'D307F3C7EB32', '半拍', 'React 入门实例教程', 'http://www.ruanyifeng.com/blog/2015/03/react.html', '2017-01-22 10:38:55', '2017-01-22 10:39:13');
INSERT INTO `address_li_record` VALUES ('80', '2', '12', 'D307F3C7EB32', '半拍', 'React Native 中文网', 'http://reactnative.cn/', '2017-01-22 10:38:58', '2017-01-22 10:39:16');
INSERT INTO `address_li_record` VALUES ('81', '2', '12', 'D307F3C7EB32', '半拍', '开发环境 | Radmin', 'http://radmin.qq.com/', '2017-01-22 10:39:01', '2017-01-22 10:39:18');
INSERT INTO `address_li_record` VALUES ('82', '2', '13', 'D307F3C7EB32', '半拍', 'webpack入坑之旅', 'http://blog.guowenfh.com/2016/03/24/vue-webpack-01-base/', '2017-01-22 10:48:03', '2017-01-22 10:48:05');
INSERT INTO `address_li_record` VALUES ('83', '2', '14', 'D307F3C7EB32', '半拍', 'gulp使用小结(一)', 'http://www.fefork.com/gulp_1/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('84', '2', '15', 'D307F3C7EB32', '半拍', '每周一点canvas动画(1)', 'https://segmentfault.com/a/1190000004852668', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('85', '2', '15', 'D307F3C7EB32', '半拍', 'Sandbox | jCanvas', 'https://projects.calebevans.me/jcanvas/sandbox/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('86', '', '16', 'D307F3C7EB32', '半拍', 'vue.js源码学习', 'http://www.html5dw.com/post?id=1044', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('87', '', '16', 'D307F3C7EB32', '半拍', '使用 vue 完成上传文件页面', 'https://gold.xitu.io/entry/57611a11207703006b8afa02/view', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('88', '', '16', 'D307F3C7EB32', '半拍', 'vue.js2.0中文文档', 'https://vuefe.cn/v2/guide/instance.html#构造器', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('89', '', '17', 'D307F3C7EB32', '半拍', 'Node初学者入门', 'http://ourjs.com/detail/529ca5950cb6498814000005', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('90', '', '18', 'D307F3C7EB32', '半拍', 'electron', 'https://github.com/electron/electron/tree/master/docs-translations/zh-CN', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('91', '', '18', 'D307F3C7EB32', '半拍', 'Electron', 'http://electron.atom.io/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('92', '', '18', 'D307F3C7EB32', '半拍', 'Electron中文社区', 'https://atom-china.org/t/guan-fang-bo-ke-atom-shell-xian-zai-gai-ming-electron-liao/93', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('93', '', '18', 'D307F3C7EB32', '半拍', '教程 | electron 中文文档', 'https://wangdashuaihenshuai.gitbooks.io/electron-zh-document/content/tutorial/README-2.html', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('94', '', '18', 'D307F3C7EB32', '半拍', 'Electron 中文文档', 'http://www.kancloud.cn/wizardforcel/electron-doc/137776', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('95', '', '18', 'D307F3C7EB32', '半拍', '沃尔得国际英语', 'file:///C:/Users/%E5%8D%8A%E6%8B%8D/Desktop/EnglishHtmlWork2/%E6%B2%83%E5%B0%94%E5%BE%97%E5%9B%BD%E9%99%85%E8%8B%B1%E8%AF%AD.html', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('96', '', '19', 'D307F3C7EB32', '半拍', 'ThinkJS', 'https://thinkjs.org/zh-cn/doc/2.2/index.html', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('97', '', '20', 'D307F3C7EB32', '半拍', '20个正则', 'http://www.jianshu.com/p/e7bb97218946', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('98', '', '20', 'D307F3C7EB32', '半拍', 'JavaScript 数组去重', 'JavaScript 数组去重', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('99', '', '20', 'D307F3C7EB32', '半拍', '为什么说DOM操作很慢', 'https://leozdgao.me/why-dom-slow/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('100', '', '20', 'D307F3C7EB32', '半拍', 'JavaScript 的 prototype', 'https://gold.xitu.io/entry/576118daa341310064b61798/view', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('101', '', '21', 'D307F3C7EB32', '半拍', 'avalon_git', 'https://github.com/RubyLouvre/avalon', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('102', '', '21', 'D307F3C7EB32', '半拍', 'avalon2', 'http://avalonjs.coding.me/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('103', '', '21', 'D307F3C7EB32', '半拍', 'avalon中文官网', 'http://avalonjs.github.io/index2.html', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('104', '', '22', 'D307F3C7EB32', '半拍', 'ECMAScript 6入门', 'http://es6.ruanyifeng.com/#docs/intro', '2017-01-22 11:08:18', '0000-00-00 00:00:00');
INSERT INTO `address_li_record` VALUES ('105', '', '22', 'D307F3C7EB32', '半拍', 'ES6 中的箭头函数', 'https://imququ.com/post/arrow-function-in-es6.html', '2017-01-22 11:08:18', '0000-00-00 00:00:00');
INSERT INTO `address_li_record` VALUES ('106', '', '23', 'D307F3C7EB32', '半拍', '21条MySQL性能优化', 'http://www.phpxs.com/post/5092/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('107', '', '23', 'D307F3C7EB32', '半拍', '用Nodejs连接MySQL', 'http://blog.fens.me/nodejs-mysql-intro/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('108', '', '24', 'D307F3C7EB32', '半拍', 'ThreeGUI', 'http://threejsplaygnd.brangerbriz.net/gui/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('109', '', '24', 'D307F3C7EB32', '半拍', 'three.js - Javascript 3D library', 'https://threejs.org/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('110', '', '24', 'D307F3C7EB32', '半拍', '使用 Three.js 的 3D飞机', 'http://qianduan.guru/2016/06/12/The_Making_of_The_Aviator_Animating_a_Basic_3D_Scene_with_Three_js/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('111', '', '24', 'D307F3C7EB32', '半拍', 'test2', 'file:///C:/Users/%E5%8D%8A%E6%8B%8D/Documents/Repository/specialShow/three.js/testThree.js/test2.html', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('112', '', '24', 'D307F3C7EB32', '半拍', 'The Aviator: The Game | Codrops', 'file:///C:/Users/%E5%8D%8A%E6%8B%8D/Documents/Repository/specialShow/three.js/TheAviator/index.html', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('113', '', '25', 'D307F3C7EB32', '半拍', '饭糕学院', 'http://www.fangao.cc/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('114', '', '25', 'D307F3C7EB32', '半拍', 'unityios的分享', 'http://url.pansoso.com/?a=url&k=9de56b03&u=aHR0cDovL3l1bi5iYWlkdS5jb20vc2hhcmUvaG9tZT91az0zMTA3ODIyMTQz&t=55m!5bqm5LqR572R55uYLXVuaXR5aW9z55qE5YiG5Lqr&s=6aWt57OV572R5Z!56K6t6KeG6aKR5LqR55uY', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('115', '', '25', 'D307F3C7EB32', '半拍', '漫画14期 班级', 'http://bbs.fangao.org/forum.php?mod=forumdisplay&fid=243', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('116', '', '25', 'D307F3C7EB32', '半拍', '乐子的黑历史 | 饭糕学院', 'http://www.fangao.cc/news/lezi', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('117', '', '26', 'D307F3C7EB32', '半拍', '编剧：从入门到创作，表达你自己 - 知乎专栏', 'https://zhuanlan.zhihu.com/bianju2016', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('118', '', '26', 'D307F3C7EB32', '半拍', '基本演绎法：故事棋盘式布局的验证', 'http://mp.weixin.qq.com/s?__biz=MzIxMjQxMTM4Mg==&mid=2247483994&idx=1&sn=192d4120f77694792354439240611417&scene=21#wechat_redirect', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('119', '', '26', 'D307F3C7EB32', '半拍', '原来这就是美剧好看的原因', 'http://mp.weixin.qq.com/s?__biz=MzIxMjQxMTM4Mg==&mid=2247483896&idx=1&sn=8a4332f1242b5b2842c796674ae4469e&scene=21#wechat_redirect', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('120', '', '26', 'D307F3C7EB32', '半拍', '类型片再探讨，重发：安利一部喜剧《如果上帝愿意》', 'http://mp.weixin.qq.com/s?__biz=MzIxMjQxMTM4Mg==&mid=2247484010&idx=1&sn=1b9cd51b6cc824f9085b1c7db5a507ad&scene=21#wechat_redirect', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('121', '', '27', 'D307F3C7EB32', '半拍', 'JSON压缩', 'http://www.bejson.com/zhuanyi/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('122', '', '27', 'D307F3C7EB32', '半拍', '图片压缩', 'https://tinypng.com/', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('123', '', '28', 'D307F3C7EB32', '半拍', '工具武装的前端开发工程师 - 埋名 - SegmentFault', 'https://segmentfault.com/a/1190000005994196#articleHeader8', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('124', '', '28', 'D307F3C7EB32', '半拍', '前端工程师必备实用网站 - 简书', 'http://www.jianshu.com/p/53a7da454057', '2017-01-22 11:08:18', '2017-01-22 11:08:18');
INSERT INTO `address_li_record` VALUES ('125', '', '28', 'D307F3C7EB32', '半拍', 'rem', 'https://github.com/hbxeagle/rem/blob/master/README.md', '2017-01-22 11:08:18', '2017-01-22 11:08:18');

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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码库表';

-- ----------------------------
-- Records of code
-- ----------------------------
INSERT INTO `code` VALUES ('1', '', '2', '存单表数据', '> 框架方法：将post过来的数据存入数据库\n\n~~~\n$time = date(\"Y-m-d H:i:s\"); // 获取当前时间\n$sql = \"INSERT INTO \".$codename.\" (user_guid,title,content,createtime) values(?,?,?,?)\";\n$rs1 = $db->execute($sql, array($user_guid, $title, $textcode, $time));\n~~~', '2016-12-26 15:31:39', '2016-12-26 15:31:41');
INSERT INTO `code` VALUES ('8', '', '1', '获取省份证号码信息', '~~~\nfunction IdCard(UUserCard, num) {\n    if (num == 1) {\n        //获取出生日期\n        birth = UUserCard.substring(6, 10) + \"-\" + UUserCard.substring(10, 12) + \"-\" + UUserCard.substring(12, 14);\n        return birth;\n    }\n    if (num == 2) {\n        //获取性别\n        if (parseInt(UUserCard.substr(16, 1)) % 2 == 1) {\n            //男\n            return \"男\";\n        } else {\n            //女\n            return \"女\";\n        }\n    }\n    if (num == 3) {\n        //获取年龄\n        var myDate = new Date();\n        var month = myDate.getMonth() + 1;\n        var day = myDate.getDate();\n        var age = myDate.getFullYear() - UUserCard.substring(6, 10) - 1;\n        if (UUserCard.substring(10, 12) < month || UUserCard.substring(10, 12) == month && UUserCard.substring(12, 14) <= day) {\n            age++;\n        }\n        return age;\n    }\n}\n~~~', '2016-12-27 11:36:04', '2016-12-27 11:36:04');
INSERT INTO `code` VALUES ('9', '', '4', 'fixed居中', '~~~\n.btnfbtm {\n    position: fixed;\n    bottom: 0;\n    width: 980px;\n    height: 60px;\n    right: 30px;\n    margin:auto;\n    left:0;\n    right:0;\n    bottom:0;\n}\n~~~', '2016-12-27 11:38:49', '2016-12-27 11:38:49');
INSERT INTO `code` VALUES ('10', null, '2', '跳转页面', '~~~\nPage::view($url);\n\nRedirect::to($url);\n~~~', '2016-12-27 11:41:11', '2016-12-27 15:40:16');
INSERT INTO `code` VALUES ('11', null, '5', '滚动加载', '> 利用 jquery weui 的滚动加载\n\n~~~\n<style media=\"screen\">\n    .copyright{\n        margin-bottom: 100px;\n    }\n</style>\n\n<style>\n    #gddw{\n        position: fixed;\n        bottom: 15px;\n        left: 50%;\n        margin-left: -65px;\n        display: none;\n    }\n</style>\n\n<div id=\"gddw\" class=\"weui-infinite-scroll\">\n  <div class=\"infinite-preloader\"></div><!-- 菊花 -->\n  正在加载... <!-- 文案，可以自行修改 -->\n</div>\n\n\n\n//滚动加载\nvar gdjz = (function () {\n    var gdcallback;\n    //初始化事件\n    var infinite = function () {\n        $(document.body).infinite();\n    };\n    //销毁事件\n    var end = function () {\n        $(\'#gddw\').hide();\n        $(document.body).destroyInfinite();\n    };\n    //监听事件\n    var watch = function () {\n        var loading = false;  //状态标记\n        $(document.body).infinite().on(\"infinite\", function () {\n            if (loading) return;\n            $(\'#gddw\').show();\n            loading = true;\n            setTimeout(function () {\n                gdcallback();\n                loading = false;\n                $(\'#gddw\').hide();\n            }, 1500);   //模拟延迟\n        });\n    };\n    var start = function (callback) {\n        infinite();\n        watch();\n        gdcallback = callback;\n    };\n    return {\n        start: start,\n        end: end\n    }\n}());\n\n        gdjz.start();\n~~~', '2016-12-27 11:52:00', '2017-01-10 15:33:33');
INSERT INTO `code` VALUES ('12', '', '3', 'pubs_official(后台授权)', '~~~\n/*\nNavicat MySQL Data Transfer\n\nSource Server         : localhost\nSource Server Version : 50547\nSource Host           : localhost:3306\nSource Database       : wy_zlqgh\n\nTarget Server Type    : MYSQL\nTarget Server Version : 50547\nFile Encoding         : 65001\n\nDate: 2016-08-12 09:44:44\n*/\n\nSET FOREIGN_KEY_CHECKS=0;\n\n-- ----------------------------\n-- Table structure for pubs_official\n-- ----------------------------\nDROP TABLE IF EXISTS `pubs_official`;\nCREATE TABLE `pubs_official` (\n  `id` bigint(20) NOT NULL AUTO_INCREMENT,\n  `wid` bigint(20) NOT NULL,\n  `invokeid` varchar(20) NOT NULL COMMENT \'接口标识\',\n  `name` varchar(100) DEFAULT NULL COMMENT \'公众号名称\',\n  `appid` varchar(50) NOT NULL COMMENT \'接口ID\',\n  `logo` varchar(255) DEFAULT NULL COMMENT \'公众号头像\',\n  `type` tinyint(2) DEFAULT NULL COMMENT \'授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号\',\n  `qrcode` varchar(255) DEFAULT NULL COMMENT \'二维码地址\',\n  `accesstoken` varchar(512) NOT NULL COMMENT \'调用接口access_token\',\n  `accesstoken_lastupdate` datetime NOT NULL COMMENT \'调用接口access_token最后更新时间\',\n  `state` tinyint(1) DEFAULT \'0\' COMMENT \'0:未授权 1:已授权\',\n  `createtime` datetime NOT NULL COMMENT \'权限签名\',\n  `updatetime` datetime NOT NULL COMMENT \'调用接口jsapi_ticket最后更新时间\',\n  PRIMARY KEY (`id`)\n) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT=\'公众号基本信息表\';\n\n-- ----------------------------\n-- Records of pubs_official\n-- ----------------------------\nINSERT INTO `pubs_official` VALUES (\'1\', \'1\', \'dy93d7f96b93eb4308da\', \'萭事通\', \'wx08de066938343eb9\', \'http://wx.qlogo.cn/mmopen/TvjQ8s7myLBRhC9JWBFJfGU22Qd6AOrtOp8jmuE1aJBxbRNqYopks3vHjbUbTTYPo5SpYV8mUyHV1COQsYVibLmpwhzHDghwk/0\', \'2\', \'http://mmbiz.qpic.cn/mmbiz/qMLYktpIZfGf16DSGBfUVKX\', \'2lAihUFhKM8WLRXovClc2Mx5fnGVkWZJhPlydsIX4XG91qlfck6M9O8KdWMEctvH5YaY7rN8ll5qzhQQSe_3Z0jyyp\', \'2016-08-09 10:15:16\', \'1\', \'2016-08-09 10:15:18\', \'2016-08-09 10:15:20\');\nINSERT INTO `pubs_official` VALUES (\'3\', \'1\', \'dy9ba170ec4321e409ee\', \'微校云\', \'wxbc793b5d2aabb6cf\', \'http://wx.qlogo.cn/mmopen/SLT3TvgmPkBYuvJMMHbakQpyvC604RRI95mWia0Zo5S1n0nS990cQpaCEzK9sRntj4fJH84lyl4AmyvrMMxLWGVpjefTuT6y1/0\', \'2\', \'http://mmbiz.qpic.cn/mmbiz/VS9tepwuTF0SOOoXawO5MNOV2aUdYsUNwqQSZA0JJU3iagpnY2BTicDdPr4qoA2vPiaFJbaq5CDumnbrYWyRjFLXg/0\', \'ylT-lKAOmRGog2NrbwMlV04RXTLmfOET6J6wfhYBCFQmmCHwZayk5Rqg_0SEigDk05mZsh5ogbmXqDrpN50NE6fOS9\', \'2016-08-09 13:38:05\', \'1\', \'2016-08-09 12:33:38\', \'2016-08-09 13:38:05\');\n\n~~~', '2016-12-27 12:00:25', '2016-12-27 12:00:25');
INSERT INTO `code` VALUES ('13', '', '1', '倒计时', '~~~\n//倒计时\n    var backTime = function(index) {\n        if (index) {\n            timeBack = index.split(\":\");\n            hour = timeBack[0];\n            minutes = timeBack[1];\n            second = timeBack[2];\n        }\n        if (+second === 0) {\n            if (+minutes === 0) {\n                if (+hour === 0) {\n                    timeFlag = 0;\n                    $(\".weui_loading_toast\").css(\"display\", \"block\");\n                    vm.index = vm.questionLen + 1;\n                    vm.readEnd = false;\n                    vm.subEnd = true;\n                    sureTest();\n                } else {\n                    hour = +hour - 1;\n                    minutes = 59;\n                }\n            } else {\n                minutes = +minutes - 1;\n                second = 59;\n            }\n        } else {\n            second = +second - 1;\n        }\n        if (timeFlag === 1) {\n            setTimeout(function() {\n                if (hour < 10 && hour.length === 1) {\n                    hour = \"0\" + hour;\n                }\n                if (minutes < 10 && typeof(minutes.length) === \"undefined\") {\n                    minutes = \"0\" + minutes;\n                }\n                if (second < 10 && typeof(second.length) === \"undefined\") {\n                    second = \"0\" + second;\n                }\n                vm.answertime = hour + \":\" + minutes + \":\" + second;\n                backTime();\n            }, 1000);\n        }\n    };\n~~~', '2016-12-27 15:42:43', '2016-12-27 15:42:43');
INSERT INTO `code` VALUES ('14', '', '1', 'js单独', '~~~\n//avalon绑定\nvar vm = avalon.define({\n    $id: \'avalonId\'\n});\n\n/**初始化数据 */\nvar dealDataWay = (function() {\n    //获取数据\n    var ajaxGetData= function(){\n\n    };\n    //提交数据\n    var ajaxPutData = function() {\n\n    };\n    //初始化数据\n    var loadData = function(){\n\n    };\n    return {\n        ajaxGetData: ajaxGetData,\n        ajaxPutData: ajaxPutData,\n        loadData: loadData\n    }\n}());\n~~~', '2016-12-27 15:51:27', '2016-12-27 15:51:27');
INSERT INTO `code` VALUES ('15', '', '1', '获取当前时间，格式YYYY-MM-DD', '~~~\nfunction getNowFormatDate() {\n  var date = new Date();\n  var seperator1 = \"-\";\n  var year = date.getFullYear();\n  var month = date.getMonth() + 1;\n  var strDate = date.getDate();\n  if (month >= 1 && month <= 9) {\n    month = \"0\" + month;\n  }\n  if (strDate >= 0 && strDate <= 9) {\n    strDate = \"0\" + strDate;\n  }\n  var currentdate = year + seperator1 + month + seperator1 + strDate;\n  return currentdate;\n}\n~~~', '2016-12-27 15:52:27', '2016-12-27 15:52:27');
INSERT INTO `code` VALUES ('35', null, '4', 'bootstrap弹出框的规范', '~~~\n/*bootstrap弹出框的规范 start*/\n.modal_align{\n    margin-left: 30px;margin-right: 30px;\n     -webkit-box-shadow: 0 0px 0px rgba(0,0,0,0.5);\n    box-shadow: 0 0px 0px rgba(0,0,0,0.5);\n    background: #fff;\n    border-radius: 5px;\n    overflow: hidden;\n}\n.modal-content{\n    -webkit-box-shadow: 0 0px 0px rgba(0,0,0,0.5);\n   box-shadow: 0 0px 0px rgba(0,0,0,0.5);\n}\n/*bootstrap弹出框的规范 end*/\n~~~', '2016-12-28 13:49:52', '2016-12-28 13:53:18');
INSERT INTO `code` VALUES ('36', '', '4', 'bootstrap去掉label字体加粗效', '~~~\n/*bootstrap去掉label字体加粗效果 start*/\nlabel{\n    font-weight: normal;\n}\n/*bootstrap去掉label字体加粗效果 end*/\n~~~', '2016-12-28 13:55:34', '2016-12-28 13:55:34');
INSERT INTO `code` VALUES ('37', '', '4', '修改input 框内颜色', '~~~\ninput::-webkit-input-placeholder {\n  /* WebKit browsers */\n  color: #B2B2B2;\n}\ntextarea::-webkit-input-placeholder {\n  /* WebKit browsers */\n  color: #B2B2B2;\n}\ninput:-moz-placeholder {\n  /* Mozilla Firefox 4 to 18 */\n  color: #B2B2B2;\n}\ninput::-moz-placeholder {\n  /* Mozilla Firefox 19+ */\n  color: #B2B2B2;\n}\ninput:-ms-input-placeholder {\n  /* Internet Explorer 10+ */\n  color: #B2B2B2;\n}\n~~~', '2016-12-28 14:03:10', '2016-12-28 14:03:10');
INSERT INTO `code` VALUES ('38', '', '4', '去掉bootstrap 弹出层的阴影', '~~~\n\n.modal-content {\n    -webkit-box-shadow: 0 0px 0px rgba(0,0,0,0.5);\n    box-shadow: 0 0px 0px rgba(0,0,0,0.5);\n}\n\n~~~', '2016-12-28 14:03:38', '2016-12-28 14:03:38');
INSERT INTO `code` VALUES ('39', '', '4', 'CSS悬浮提示文本', '~~~\na { \n    border-bottom:1px solid #bbb;\n    color:#666;\n    display:inline-block;\n    position:relative;\n    text-decoration:none;\n}\na:hover,\na:focus {\n    color:#36c;\n}\na:active {\n    top:1px; \n}\n\n/* Tooltip styling */\na[data-tooltip]:after {\n    border-top: 8px solid #222;\n    border-top: 8px solid hsla(0,0%,0%,.85);\n    border-left: 8px solid transparent;\n    border-right: 8px solid transparent;\n    content: \"\";\n    display: none;\n    height: 0;\n    width: 0;\n    left: 25%;\n    position: absolute;\n}\na[data-tooltip]:before {\n    background: #222;\n    background: hsla(0,0%,0%,.85);\n    color: #f6f6f6;\n    content: attr(data-tooltip);\n    display: none;\n    font-family: sans-serif;\n    font-size: 14px;\n    height: 32px;\n    left: 0;\n    line-height: 32px;\n    padding: 0 15px;\n    position: absolute;\n    text-shadow: 0 1px 1px hsla(0,0%,0%,1);\n    white-space: nowrap;\n    -webkit-border-radius: 5px;\n    -moz-border-radius: 5px;\n    -o-border-radius: 5px;\n    border-radius: 5px;\n}\na[data-tooltip]:hover:after {\n    display: block;\n    top: -9px;\n}\na[data-tooltip]:hover:before {\n    display: block;\n    top: -41px;\n}\na[data-tooltip]:active:after {\n    top: -10px;\n}\na[data-tooltip]:active:before {\n    top: -42px;\n}\n~~~', '2016-12-28 14:04:16', '2016-12-28 14:04:16');
INSERT INTO `code` VALUES ('40', '', '4', 'CSS3对话气泡', '~~~\n.chat-bubble {\n    background-color: #ededed;\n    border: 2px solid #666;\n    font-size: 35px;\n    line-height: 1.3em;\n    margin: 10px auto;\n    padding: 10px;\n    position: relative;\n    text-align: center;\n    width: 300px;\n    -moz-border-radius: 20px;\n    -webkit-border-radius: 20px;\n    -moz-box-shadow: 0 0 5px #888;\n    -webkit-box-shadow: 0 0 5px #888;\n    font-family: \'Bangers\', arial, serif; \n}\n.chat-bubble-arrow-border {\n    border-color: #666 transparent transparent transparent;\n    border-style: solid;\n    border-width: 20px;\n    height: 0;\n    width: 0;\n    position: absolute;\n    bottom: -42px;\n    left: 30px;\n}\n.chat-bubble-arrow {\n    border-color: #ededed transparent transparent transparent;\n    border-style: solid;\n    border-width: 20px;\n    height: 0;\n    width: 0;\n    position: absolute;\n    bottom: -39px;\n    left: 30px;\n}\n~~~', '2016-12-28 14:04:54', '2016-12-28 14:04:54');
INSERT INTO `code` VALUES ('41', '', '4', '网页顶部盒阴影', '~~~\nbody:before {\n    content: \"\";\n    position: fixed;\n    top: -10px;\n    left: 0;\n    width: 100%;\n    height: 10px;\n\n    -webkit-box-shadow: 0px 0px 10px rgba(0,0,0,.8);\n    -moz-box-shadow: 0px 0px 10px rgba(0,0,0,.8);\n    box-shadow: 0px 0px 10px rgba(0,0,0,.8);\n    z-index: 100;\n}\n~~~', '2016-12-28 14:05:25', '2016-12-28 14:05:25');
INSERT INTO `code` VALUES ('42', '', '4', 'CSS3 列文本', '~~~\n#columns-3 {\n    text-align: justify;\n    -moz-column-count: 3;\n    -moz-column-gap: 12px;\n    -moz-column-rule: 1px solid #c4c8cc;\n    -webkit-column-count: 3;\n    -webkit-column-gap: 12px;\n    -webkit-column-rule: 1px solid #c4c8cc;\n}\n~~~', '2016-12-28 14:06:21', '2016-12-28 14:06:21');
INSERT INTO `code` VALUES ('43', '', '4', '外部CSS3 盒阴影', '~~~\n#mydiv { \n    -webkit-box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.52);\n    -moz-box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.52);\n    box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.52);\n}\n~~~', '2016-12-28 14:06:47', '2016-12-28 14:06:47');
INSERT INTO `code` VALUES ('44', '', '4', '内部CSS3 盒阴影', '~~~\n#mydiv { \n    -moz-box-shadow: inset 2px 0 4px #000;\n    -webkit-box-shadow: inset 2px 0 4px #000;\n    box-shadow: inset 2px 0 4px #000;\n}\n~~~', '2016-12-28 14:07:22', '2016-12-28 14:07:22');
INSERT INTO `code` VALUES ('45', '', '4', 'CSS3渐变模板', '~~~\n#colorbox {\n    background: #629721;\n    background-image: -webkit-gradient(linear, left top, left bottom, from(#83b842), to(#629721));\n    background-image: -webkit-linear-gradient(top, #83b842, #629721);\n    background-image: -moz-linear-gradient(top, #83b842, #629721);\n    background-image: -ms-linear-gradient(top, #83b842, #629721);\n    background-image: -o-linear-gradient(top, #83b842, #629721);\n    background-image: linear-gradient(top, #83b842, #629721);\n}\n~~~', '2016-12-28 14:07:48', '2016-12-28 14:07:48');
INSERT INTO `code` VALUES ('46', null, '4', '内容垂直居中', '~~~\n.container {\n    min-height: 6.5em;\n    display: table-cell;\n    vertical-align: middle;\n}\n~~~', '2016-12-28 14:09:45', '2016-12-28 14:15:43');
INSERT INTO `code` VALUES ('47', '', '4', '通用媒体查询', '~~~\n/* Smartphones (portrait and landscape) ----------- */\n@media only screen \nand (min-device-width : 320px) and (max-device-width : 480px) {\n  /* Styles */\n}\n\n/* Smartphones (landscape) ----------- */\n@media only screen and (min-width : 321px) {\n  /* Styles */\n}\n\n/* Smartphones (portrait) ----------- */\n@media only screen and (max-width : 320px) {\n  /* Styles */\n}\n\n/* iPads (portrait and landscape) ----------- */\n@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) {\n  /* Styles */\n}\n\n/* iPads (landscape) ----------- */\n@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : landscape) {\n  /* Styles */\n}\n\n/* iPads (portrait) ----------- */\n@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : portrait) {\n  /* Styles */\n}\n\n/* Desktops and laptops ----------- */\n@media only screen and (min-width : 1224px) {\n  /* Styles */\n}\n\n/* Large screens ----------- */\n@media only screen and (min-width : 1824px) {\n  /* Styles */\n}\n\n/* iPhone 4 ----------- */\n@media only screen and (-webkit-min-device-pixel-ratio:1.5), only screen and (min-device-pixel-ratio:1.5) {\n  /* Styles */\n}\n~~~', '2016-12-28 14:10:21', '2016-12-28 14:10:21');
INSERT INTO `code` VALUES ('48', '', '4', '样式重置', '~~~\nhtml, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {\n  margin: 0;\n  padding: 0;\n  border: 0;\n  font-size: 100%;\n  font: inherit;\n  vertical-align: baseline;\n  outline: none;\n  -webkit-box-sizing: border-box;\n  -moz-box-sizing: border-box;\n  box-sizing: border-box;\n}\nhtml { height: 101%; }\nbody { font-size: 62.5%; line-height: 1; font-family: Arial, Tahoma, sans-serif; }\n\narticle, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }\nol, ul { list-style: none; }\n\nblockquote, q { quotes: none; }\nblockquote:before, blockquote:after, q:before, q:after { content: \'\'; content: none; }\nstrong { font-weight: bold; } \n\ntable { border-collapse: collapse; border-spacing: 0; }\nimg { border: 0; max-width: 100%; }\n\np { font-size: 1.2em; line-height: 1.0em; color: #333; }\n~~~', '2016-12-28 14:10:58', '2016-12-28 14:10:58');
INSERT INTO `code` VALUES ('49', '', '4', '用CSS动画实现省略号动画', '~~~\n.loading:after {\n    overflow: hidden;\n    display: inline-block;\n    vertical-align: bottom;\n    animation: ellipsis 2s infinite;\n    content: \"\\2026\"; /* ascii code for the ellipsis character */\n}\n@keyframes ellipsis {\n    from {\n        width: 2px;\n    }\n    to {\n        width: 15px;\n    }\n}\n~~~', '2016-12-28 14:12:09', '2016-12-28 14:12:09');
INSERT INTO `code` VALUES ('50', '', '4', '包裹长文本', '~~~\npre {\n    white-space: pre-line;\n    word-wrap: break-word;\n}\n~~~', '2016-12-28 14:13:29', '2016-12-28 14:13:29');
INSERT INTO `code` VALUES ('51', '', '4', '背景渐变动画', '~~~\nbutton {\n    background-image: linear-gradient(#5187c4, #1c2f45);\n    background-size: auto 200%;\n    background-position: 0 100%;\n    transition: background-position 0.5s;\n}    \nbutton:hover {\n    background-position: 0 0;\n}\n~~~', '2016-12-28 14:14:09', '2016-12-28 14:14:09');
INSERT INTO `code` VALUES ('52', '', '4', '垂直对齐', '~~~\n.verticalcenter{\n    position: relative;\n    top: 50%;\n    -webkit-transform: translateY(-50%);\n    -o-transform: translateY(-50%);\n    transform: translateY(-50%);\n}\n~~~', '2016-12-28 14:15:07', '2016-12-28 14:15:07');
INSERT INTO `code` VALUES ('53', '', '1', 'js 获取前天、昨天、今天、明天、后天的时间', '~~~\nvar getNowFormatDate = function(AddDayCount) {\n        var date = new Date();\n        date.setDate(date.getDate()+AddDayCount);\n        var seperator1 = \"-\";\n        var year = date.getFullYear();\n        var month = date.getMonth() + 1;\n        var strDate = date.getDate();\n        if (month >= 1 && month <= 9) {\n            month = \"0\" + month;\n        }\n        if (strDate >= 0 && strDate <= 9) {\n            strDate = \"0\" + strDate;\n        }\n        var currentdate = year + seperator1 + month + seperator1 + strDate;\n        return currentdate;\n    };\n    document.write(\"前天：\"+GetDateStr(-2));\n    document.write(\"&lt;br /&gt;昨天：\"+GetDateStr(-1));\n    document.write(\"&lt;br /&gt;今天：\"+GetDateStr(0));\n    document.write(\"&lt;br /&gt;明天：\"+GetDateStr(1));\n    document.write(\"&lt;br /&gt;后天：\"+GetDateStr(2));\n    document.write(\"&lt;br /&gt;大后天：\"+GetDateStr(3));\n~~~', '2016-12-28 14:16:21', '2016-12-28 14:16:21');
INSERT INTO `code` VALUES ('54', '', '1', '日期加上天数后的新日期', '~~~\nfunction AddDays(date,days){\nvar nd = new Date(date);\n   nd = nd.valueOf();\n   nd = nd + days * 24 * 60 * 60 * 1000;\n   nd = new Date(nd);\n   //alert(nd.getFullYear() + \"年\" + (nd.getMonth() + 1) + \"月\" + nd.getDate() + \"日\");\nvar y = nd.getFullYear();\nvar m = nd.getMonth()+1;\nvar d = nd.getDate();\nif(m <= 9) m = \"0\"+m;\nif(d <= 9) d = \"0\"+d; \nvar cdate = y+\"-\"+m+\"-\"+d;\nreturn cdate;\n}\n~~~', '2016-12-28 14:16:55', '2016-12-28 14:16:55');
INSERT INTO `code` VALUES ('55', '', '1', 'url加密解密', '~~~\nencodeURIComponent\n~~~', '2016-12-28 14:17:33', '2016-12-28 14:17:33');
INSERT INTO `code` VALUES ('56', '', '1', '动态加载css文件和js文件', '~~~\n//动态加载js和css文件\nvar dynamicLoading = {\n    css: function(path){\n    	if(!path || path.length === 0){\n			throw new Error(\'argument \"path\" is required !\');\n		}\n		var head = document.getElementsByTagName(\'head\')[0];\n        var link = document.createElement(\'link\');\n        link.href = path;\n        link.rel = \'stylesheet\';\n        link.type = \'text/css\';\n        head.appendChild(link);\n    },\n    js: function(path){\n		if(!path || path.length === 0){\n			throw new Error(\'argument \"path\" is required !\');\n		}\n		var head = document.getElementsByTagName(\'head\')[0];\n        var script = document.createElement(\'script\');\n        script.src = path;\n        script.type = \'text/javascript\';\n        head.appendChild(script);\n    }\n}\n~~~', '2016-12-28 14:42:25', '2016-12-28 14:42:25');
INSERT INTO `code` VALUES ('57', '', '1', 'sessionStorage', '~~~\nsessionStorage.setItem(\"key\", \"value\");\nvar value = sessionStorage.getItem(\"key\");\nvar value = sessionStorage.getItem(\"key\");\n~~~', '2016-12-28 14:44:02', '2016-12-28 14:44:02');
INSERT INTO `code` VALUES ('58', '', '1', '正则校验日期', '~~~\n\nvar reg = /^(\\\\d{1,4})(-|\\\\/)(\\\\d{1,2})\\\\2(\\\\d{1,2})$/; \nvar r = fieldValue.match(reg);             \nif(r==null)alert(\'Date format error!\');\n\n~~~', '2016-12-28 14:44:30', '2016-12-28 14:44:30');
INSERT INTO `code` VALUES ('59', '', '1', 'url参数取得', '~~~\n/**\n * url参数取得;\n */\n$.extend({\n    getUrlVars: function () {\n        var vars = [],\n            hash;\n        var hashes = window.location.href.slice(window.location.href.indexOf(\'?\') + 1).split(\'&\');\n        for (var i = 0; i < hashes.length; i++) {\n            hash = hashes[i].split(\'=\');\n            vars.push(hash[0]);\n            vars[hash[0]] = hash[1];\n        }\n        return vars;\n    },\n    getUrlVar: function (name) {\n        if ($.getUrlVars()[name]) {\n            return $.getUrlVars()[name];\n        } else {\n            return \'\';\n        }\n    }\n});\n~~~', '2016-12-28 14:44:50', '2016-12-28 14:44:50');
INSERT INTO `code` VALUES ('60', '', '1', '拿日期', '~~~\n/**\n * 拿日期\n */\nfunction getDate() {\n    var date = new Date();\n    var seperator1 = \"-\";\n    var year = date.getFullYear();\n    var mouth1 = date.getMonth();\n    var month = date.getMonth() + 1;\n    var strDate = date.getDate();\n    if (month >= 1 && month <= 9) {\n        month = \"0\" + month;\n    }\n    if (strDate >= 0 && strDate <= 9) {\n        strDate = \"0\" + strDate;\n    }\n    var uom = new Date(year, mouth1, strDate);\n    uom.setDate(uom.getDate() - 1);\n    var LINT_MM = uom.getMonth();\n    LINT_MM++;\n    var LSTR_MM = LINT_MM > 10 ? LINT_MM : (\"0\" + LINT_MM)\n    var LINT_DD = uom.getDate();\n    var LSTR_DD = LINT_DD > 10 ? LINT_DD : (\"0\" + LINT_DD)\n    uom = uom.getFullYear() + \"-\" + LSTR_MM + \"-\" + LSTR_DD;\n    var date = {};\n    date.nowday = year + seperator1 + month + seperator1 + strDate;\n    date.day = month + \'月\' + strDate + \'日\';\n    date.lastday = uom;\n    return date;\n};\n~~~', '2016-12-28 14:45:13', '2016-12-28 14:45:13');
INSERT INTO `code` VALUES ('61', '', '1', '验证身份证', '~~~\n//验证身份证\nfunction isCardNo(card) {\n    var pattern = /(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)/;\n    return pattern.test(card);\n}\n~~~', '2016-12-28 14:45:35', '2016-12-28 14:45:35');
INSERT INTO `code` VALUES ('62', '', '1', '验证手机号', '~~~\n//验证手机号\nfunction isPhoneNo(phone) {\n    var pattern = /^1[34578]\\d{9}$/;\n    return pattern.test(phone);\n}\n~~~', '2016-12-28 14:45:56', '2016-12-28 14:45:56');
INSERT INTO `code` VALUES ('63', '', '1', 'banner轮播', '~~~\n//banner方法封装\nvar banner = (function () {\n    var j = 0,\n        len, thatdom, timesetinterval, flagok, quandom;\n    //隐藏显示\n    var banneranimate = function (j) {\n        thatdom.css(\"display\", \"none\");\n        thatdom.each(function (i) {\n            if (i === j) {\n                $(this).animate({\n                    display: \'block\',\n                    opacity: \'toggle\'\n                }, \"100\");\n            }\n        });\n        yuanquanshow();\n    };\n    //添加圆圈\n    var yuanquanfun = function () {\n        quandom.append(function () {\n            var str = \"<li></li>\";\n            var strcircle = \"\";\n            for (var i = 0; i < len; i++) {\n                strcircle = strcircle + str;\n            }\n            return strcircle;\n        });\n        quandom.find(\"li\").each(function (i) {\n            $(this).click(function () {\n                clearInterval(flagok);\n                j = i;\n                banneranimate(j);\n                timeevery();\n            });\n        });\n        yuanquanshow();\n    };\n    //圆圈显示\n    var yuanquanshow = function () {\n        quandom.find(\"li\").each(function (i) {\n            $(this).css(\"background\", \"#fff\");\n            if (i === j) {\n                $(this).css(\"background\", \"#ED6C00\");\n            }\n        });\n    };\n    //添加定时函数\n    var timeevery = function () {\n        flagok = setInterval(function () {\n            j = j + 1;\n            if (j === len) {\n                j = 0;\n            }\n            banneranimate(j, thatdom);\n        }, timesetinterval);\n    };\n    //开始\n    var start = function (thatimgdom, circledom, time) {\n        len = thatimgdom.length;\n        thatdom = thatimgdom;\n        quandom = circledom;\n        timesetinterval = time;\n        banneranimate(j);\n        timeevery();\n        yuanquanfun();\n    };\n    //点击耳朵\n    var ear = function (flagclick) {\n        clearInterval(flagok);\n        if (flagclick === \"left\") {\n            j = j - 1;\n            if (j === -1) {\n                j = (len - 1);\n            }\n        }\n        if (flagclick === \"right\") {\n            j = j + 1;\n            if (j === len) {\n                j = 0;\n            }\n        }\n        banneranimate(j);\n        timeevery();\n    };\n    return {\n        start: start,\n        ear: ear\n    }\n} ());\n\n//运行\nvar imgdom = $(\".header_banner\").find(\".header_banner_img\");\nvar circledom = $(\".clickcircle\").find(\"ul\");\nbanner.start(imgdom, circledom, 8000);\n~~~', '2016-12-28 14:47:13', '2016-12-28 14:47:13');
INSERT INTO `code` VALUES ('64', '', '1', 'avolon绑定页面通用格式', '~~~\n//avalon绑定\nvar vm = avalon.define({\n    $id: \'avalonId\'\n});\n\n//ajax方法的封装\nvar ajaxfun = (function(){\n    var ajaxgetdata = function(data, callback){\n        if(data.errcode === \"0\"){\n            callback();\n        }else{\n            if(data.errmsg){\n                tusi(data.errmsg);\n            }else{\n                tusi(\'数据加载失败\');\n            }\n        }\n    };\n    return{\n        ajax: ajaxgetdata\n    }\n}());\n\n//打印数据\nvar printData = (function(){\n    var logData = function(data){\n        var xx = JSON.stringify(data);\n        console.log(xx);\n    };\n    var alertData = function(data){\n        var xx = JSON.stringify(data);\n        alert(xx);\n    };\n    return {\n        alertData: alertData,\n        logData: logData\n    };\n}());\n\n/**初始化数据 */\nvar commonway = (function() {\n    var ajaxGetData = function(){\n        var ajaxurl = \'\';\n        var jsonurl = \'/js/wxindex/json/common-listpubs.json\';\n        ajax(jsonurl,{\n\n        }, function(data){\n            ajaxfun.ajax(data, function(){\n                var xx = JSON.stringify(data);\n                alert(xx);\n            });\n        });\n    };\n    var loadData = function() {\n        ajaxGetData();\n    };\n    return {\n        loadData: loadData\n    }\n}());\n\n/**页面初始化 */\n$(document).ready(function() {\n    /**初始化avalon绑定方法 */\n    avalon.config({\n        interpolate: [\"[%\", \"%]\"]\n    });\n    /**ajax吐司提示加载 */\n    $(document).ajaxStart(function() {\n        loading(\'正在加载\');\n    }).ajaxComplete(function() {\n        loading(false);\n    });\n    commonway.loadData();\n});\n\n~~~', '2016-12-28 14:48:00', '2016-12-28 14:48:00');
INSERT INTO `code` VALUES ('65', '', '2', '数组遍历', '~~~\n$set = array();\n        foreach($res as $i => $v){\n            $set[$i][\'id\'] = $v[\'id\'];\n            //判断有没有点赞\n            $set[$i][\'cid\'] = $v[\'cid\'];\n            $set[$i][\'wid\'] = $v[\'wid\'];\n            $set[$i][\'userid\'] = $v[\'userid\'];\n            $set[$i][\'username\'] = $v[\'username\'];\n            $set[$i][\'photo\'] = $v[\'photo\'];\n            $set[$i][\'content\'] = str_replace(array(\"\\r\\n\", \"\\r\", \"\\n\"), \"<br/>\", $v[\'content\']);\n            $set[$i][\'kind\'] = $v[\'kind\'];\n            $set[$i][\'top\'] = $v[\'top\'];\n            $set[$i][\'commentNum\'] = $v[\'commentNum\'];\n            $set[$i][\'praiseNum\'] = $v[\'praiseNum\'];\n            $set[$i][\'createtime\'] = $v[\'createtime\'];\n            $set[$i][\'updatetime\'] = $v[\'updatetime\'];\n            $set[$i][\'photos\'] = String::string2array($v[\'photos\']);\n        }\n~~~', '2016-12-29 09:00:01', '2016-12-29 09:00:01');
INSERT INTO `code` VALUES ('66', '', '5', '微信端适配苹果手机audio没有声音', '~~~\n<audio src=\"/media/audio/zmjc/wdzg.mp3\" controls=\"controls\" loop=\"loop\"  webkit-playsinline playsinline id=\"wdzg\"></audio>\n\n<script>\n function autoPlayAudio1(demo) {\n    wx.config({\n       // 配置信息, 即使不正确也能使用 wx.ready\n       debug: false,\n       appId: \'\',\n       timestamp: 1,\n       nonceStr: \'\',\n       signature: \'\',\n       jsApiList: []\n    });\n    wx.ready(function() {\n       document.getElementById(demo).play();\n       document.getElementById(\"wdzg\").play();\n       document.getElementById(\"wdzg\").pause();\n       document.getElementById(\"yb\").play();\n       document.getElementById(\"yb\").pause();\n    });\n};\n</script>\n~~~', '2017-01-10 10:37:05', '2017-01-10 10:37:05');
INSERT INTO `code` VALUES ('67', null, '5', '3D旋转相册', '~~~\n<!--3d相册 start-->\n<div id=\"wrap\">\n	<div id=\"head\">\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n\n        <div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n		<div></div>\n\n        <div></div>\n		<div></div>\n	</div>\n</div>\n<!--3d相册 end-->\n\n<style>\n#wrap {\nheight: 257px;\nwidth: 100%;\noverflow: hidden;\nposition: relative;\nmargin: auto;\nmargin-top: 35px;\ndisplay: none;\n-webkit-perspective: 3500px;\n-moz-perspective: 3500px;\n-ms-transform: perspective(3500px);\n-ms-perspective: 3500px;\nperspective: 3500px;\n\n#head {\nwidth: 100px;\nheight: 100px;\nposition: absolute;\nleft: 50%;\nmargin-left: -50px;\nmargin-top: 70px;\n-webkit-transform-style: preserve-3d;\n-webkit-animation: donghua 50s linear 0s infinite;\n-moz-transform-style: preserve-3d;\n-moz-animation: donghua 50s linear 0s infinite;\n-ms-transform-style: preserve-3d;\n-ms-animation: donghua 50s linear 0s infinite;\ndiv {\nposition: absolute;\ntop: 0;\nleft: 0;\nwidth: 150px;\nheight: 112px;\n.img_split_zmjc;\n}\n}\n.img_split_zmjc{background:url(\'/media/images/dh/img.jpg\')  no-repeat;}\n.zmjc_15{height:112px;width:150px;background-position:0 0;}\n.zmjc_16{height:112px;width:150px;background-position:-150px 0;}\n.zmjc_14{height:112px;width:150px;background-position:-300px 0;}\n.zmjc_12{height:112px;width:150px;background-position:-450px 0;}\n.zmjc_13{height:112px;width:150px;background-position:-600px 0;}\n.zmjc_17{height:112px;width:150px;background-position:-750px 0;}\n.zmjc_21{height:112px;width:150px;background-position:-900px 0;}\n.zmjc_22{height:112px;width:150px;background-position:-1050px 0;}\n.zmjc_20{height:112px;width:150px;background-position:-1200px 0;}\n.zmjc_18{height:112px;width:150px;background-position:-1350px 0;}\n.zmjc_19{height:112px;width:150px;background-position:-1500px 0;}\n.zmjc_4{height:112px;width:150px;background-position:-1650px 0;}\n.zmjc_5{height:112px;width:150px;background-position:-1800px 0;}\n.zmjc_3{height:112px;width:150px;background-position:-1950px 0;}\n.zmjc_1{height:112px;width:150px;background-position:-2100px 0;}\n.zmjc_2{height:112px;width:150px;background-position:-2250px 0;}\n.zmjc_6{height:112px;width:150px;background-position:-2400px 0;}\n.zmjc_10{height:112px;width:150px;background-position:-2550px 0;}\n.zmjc_11{height:112px;width:150px;background-position:-2700px 0;}\n.zmjc_9{height:112px;width:150px;background-position:-2850px 0;}\n.zmjc_7{height:112px;width:150px;background-position:-3000px 0;}\n.zmjc_8{height:112px;width:150px;background-position:-3150px 0;}\n@translateZ: 520px;\n@bgsize: cover;\n.bprep{\nbackground-repeat: no-repeat;\n}\n@abpdeg: 17.14285714286deg;\n#head div:nth-child(1) {\n-webkit-transform: rotateY(@abpdeg * 0) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 0) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 0) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/1.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_1;\n}\n#head div:nth-child(2) {\n-webkit-transform: rotateY(@abpdeg * 1) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 1) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 1) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/2.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_2;\n}\n\n#head div:nth-child(3) {\n-webkit-transform: rotateY(@abpdeg * 2) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 2) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 2) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/3.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_3;\n}\n\n#head div:nth-child(4) {\n-webkit-transform: rotateY(@abpdeg * 3) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 3) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 3) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/4.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_4;\n}\n\n#head div:nth-child(5) {\n-webkit-transform: rotateY(@abpdeg * 4) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 4) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 4) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/5.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_5;\n}\n\n#head div:nth-child(6) {\n-webkit-transform: rotateY(@abpdeg * 5) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 5) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 5) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/6.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_6;\n}\n\n#head div:nth-child(7) {\n-webkit-transform: rotateY(@abpdeg * 6) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 6) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 6) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/7.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_7;\n}\n\n#head div:nth-child(8) {\n-webkit-transform: rotateY(@abpdeg * 7) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 7) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 7) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/8.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_8;\n}\n\n#head div:nth-child(9) {\n-webkit-transform: rotateY(@abpdeg * 8) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 8) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 8) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/9.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_9;\n}\n\n#head div:nth-child(10) {\n-webkit-transform: rotateY(@abpdeg * 9) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 9) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 9) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/10.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_10;\n}\n#head div:nth-child(11) {\n-webkit-transform: rotateY(@abpdeg * 10) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 10) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 10) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/11.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_11;\n}\n\n#head div:nth-child(12) {\n-webkit-transform: rotateY(@abpdeg * 11) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 11) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 11) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/12.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_12;\n}\n\n#head div:nth-child(13) {\n-webkit-transform: rotateY(@abpdeg * 12) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 12) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 12) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/13.jpg\") no-repeat 50%;\n// background-size: @bgsize;\n// .bprep;\n.zmjc_13;\n}\n\n#head div:nth-child(14) {\n-webkit-transform: rotateY(@abpdeg * 13) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 13) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 13) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/14.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_14;\n}\n\n#head div:nth-child(15) {\n-webkit-transform: rotateY(@abpdeg * 14) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 14) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 14) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/15.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_15;\n}\n\n#head div:nth-child(16) {\n-webkit-transform: rotateY(@abpdeg * 15) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 15) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 15) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/16.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_16;\n}\n#head div:nth-child(17) {\n-webkit-transform: rotateY(@abpdeg * 16) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 16) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 16) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/17.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_17;\n}\n\n#head div:nth-child(18) {\n-webkit-transform: rotateY(@abpdeg * 17) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 17) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 17) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/18.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_18;\n}\n#head div:nth-child(19) {\n-webkit-transform: rotateY(@abpdeg * 18) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 18) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 18) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/19.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_19;\n}\n#head div:nth-child(20) {\n-webkit-transform: rotateY(@abpdeg * 19) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 19) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 19) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/20.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_20;\n}\n#head div:nth-child(21) {\n-webkit-transform: rotateY(@abpdeg * 20) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 20) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 20) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/21.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_21;\n}\n#head div:nth-child(22) {\n-webkit-transform: rotateY(@abpdeg * 21) translateZ(@translateZ);\n-moz-transform: rotateY(@abpdeg * 21) translateZ(@translateZ);\n-ms-transform: rotateY(@abpdeg * 21) translateZ(@translateZ);\n// background: url(\"/media/images/dh/zmjc/22.jpg\");\n// background-size: @bgsize;\n// .bprep;\n.zmjc_22;\n}\n@-webkit-keyframes donghua {\n0% {\ntransform: rotateX(0deg) rotateY(0deg);\n}\n\n25% {\ntransform: rotateX(-6deg) rotateY(90deg);\n}\n\n50%{\ntransform: rotateX(0deg) rotateY(180deg);\n}\n\n75%{\ntransform: rotateX(6deg) rotateY(270deg);\n}\n\n100% {\ntransform: rotateX(0deg) rotateY(360deg);\n}\n}\n@-moz-keyframes donghua {\n0% {\ntransform: rotateY(0deg) rotateY(0deg);\n}\n\n25% {\ntransform: rotateX(-6deg) rotateY(90deg);\n}\n\n50%{\ntransform: rotateX(0deg) rotateY(180deg);\n}\n\n75%{\ntransform: rotateX(6deg) rotateY(270deg);\n}\n\n100% {\ntransform: rotateY(0deg) rotateY(360deg);\n}\n}\n@-ms-keyframes donghua {\n0% {\ntransform: rotateY(0deg) rotateY(0deg);\n}\n\n25% {\ntransform: rotateX(-6deg) rotateY(90deg);\n}\n\n50%{\ntransform: rotateX(0deg) rotateY(180deg);\n}\n\n75%{\ntransform: rotateX(6deg) rotateY(270deg);\n}\n\n100% {\ntransform: rotateY(0deg) rotateY(360deg);\n}\n}\n}\n</style>\n~~~', '2017-01-10 14:50:49', '2017-01-10 14:52:33');
INSERT INTO `code` VALUES ('68', '', '6', 'php模块上传图片、视频', '> php.ini 的配置，记得创建对应的缓存文件夹\n\n~~~\npost_max_size = 8888M\n\nupload_max_filesize = 888888M\n\nupload_tmp_dir = \"c:\\temp\"\n~~~\n\n>php接口端\n\n~~~\nif(Request::is_ajax()){\n	// 允许上传的图片后缀\n	$allowedExts = array(\"gif\", \"jpeg\", \"jpg\", \"png\", \'mp4\');\n	$temp = explode(\".\", $_FILES[\"file\"][\"name\"]);\n	echo $_FILES[\"file\"][\"size\"];\n	$extension = end($temp);     // 获取文件后缀名\n	if (\n	(($_FILES[\"file\"][\"type\"] == \"image/gif\")\n	|| ($_FILES[\"file\"][\"type\"] == \"image/jpeg\")\n	|| ($_FILES[\"file\"][\"type\"] == \"image/jpg\")\n	|| ($_FILES[\"file\"][\"type\"] == \"image/pjpeg\")\n	|| ($_FILES[\"file\"][\"type\"] == \"image/x-png\")\n	|| ($_FILES[\"file\"][\"type\"] == \"image/png\"))\n	&& ($_FILES[\"file\"][\"size\"] < 20480000000)   // 小于 200 kb\n	in_array($extension, $allowedExts))\n	{\n	if ($_FILES[\"file\"][\"error\"] > 0){\n		echo \"错误：: \" . $_FILES[\"file\"][\"error\"] . \"<br>\";\n	}else{\n		echo \"上传文件名: \" . $_FILES[\"file\"][\"name\"] . \"<br>\";\n		echo \"文件类型: \" . $_FILES[\"file\"][\"type\"] . \"<br>\";\n		echo \"文件大小: \" . ($_FILES[\"file\"][\"size\"] / 1024) . \" kB<br>\";\n		echo \"文件临时存储的位置: \" . $_FILES[\"file\"][\"tmp_name\"] . \"<br>\";\n		// 判断当期目录下的 upload 目录是否存在该文件\n		// 如果没有 upload 目录，你需要创建它，upload 目录权限为 777\n		if (file_exists(\"upload/\" . $_FILES[\"file\"][\"name\"])){\n			echo $_FILES[\"file\"][\"name\"] . \" 文件已经存在。 \";\n		}else{\n			$name = time();\n			// 如果 upload 目录不存在该文件则将文件上传到 upload 目录下\n			move_uploaded_file($_FILES[\"file\"][\"tmp_name\"], \"upload/\" . $name . \".png\");\n			echo \"文件存储在: \" . \"upload/\" . $_FILES[\"file\"][\"name\"];\n		}\n	}\n	}\n	else\n	{\n		echo \"非法的文件格式\";\n	}\n}\n~~~\n\n>前端html部分代码\n\n~~~\n<form action=\"upload.html\" method=\"post\" enctype=\"multipart/form-data\">\n<label for=\"file\">文件名：</label>\n	<input type=\"file\" name=\"file\" id=\"file\"><br>\n	<input type=\"submit\" name=\"submit\" value=\"提交\">\n</form>\n<form id=\"uploadForm\">\n    <p>指定文件名： <input type=\"text\" name=\"filename\" value=\"\" /></p>\n    <p>上传文件： <input type=\"file\" name=\"file\" /></ p>\n        <input type=\"button\" value=\"上传\" onclick=\"doUpload()\" />\n</form>\n~~~\n\n>JS部分\n\n~~~\nfunction doUpload() {\n    var formData = new FormData($(\"#uploadForm\")[0]);\n    $.ajax({\n        url: \'upload.html\',\n        type: \'POST\',\n        data: formData,\n        async: false,\n        cache: false,\n        contentType: false,\n        processData: false,\n        success: function(returndata) {\n            alert(returndata);\n        },\n        error: function(returndata) {\n            alert(returndata);\n        }\n    });\n}\n~~~', '2017-01-13 10:23:17', '2017-01-13 10:23:17');
INSERT INTO `code` VALUES ('69', '', '4', 'css自动隐藏文字加三个点', '~~~\nwidth: 100%;\noverflow: hidden;\ntext-overflow: ellipsis;\nwhite-space: nowrap;\nword-wrap: break-word;\nword-break: break-all;\n~~~', '2017-01-13 14:56:59', '2017-01-13 14:56:59');
INSERT INTO `code` VALUES ('70', '', '4', '1', '~~~\nsdc\n~~~', '2017-01-14 10:02:50', '2017-01-14 10:02:50');
INSERT INTO `code` VALUES ('71', '', '1', 'Vue的模板转义符更改', '>1.x版本\n\n~~~\nVue.config.delimiters = [\'[%\', \'%]\']\n~~~\n\n>2.0版本\n\n~~~\nnew Vue({ delimiters: [\'${\', \'}\'] }\n~~~', '2017-01-18 09:17:44', '2017-01-18 09:17:44');
INSERT INTO `code` VALUES ('72', '', '1', '页面强制刷新不走缓存', '~~~\nfunction updateUrl(url,key){\n    var key= (key || \'t\') +\'=\';  //默认是\"t\"\n    var reg=new RegExp(key+\'\\\\d+\');  //正则：t=1472286066028\n    var timestamp=+new Date();\n    if(url.indexOf(key)>-1){ //有时间戳，直接更新\n        return url.replace(reg,key+timestamp);\n    }else{  //没有时间戳，加上时间戳\n        if(url.indexOf(\'\\?\')>-1){\n            var urlArr=url.split(\'\\?\');\n            if(urlArr[1]){\n                return urlArr[0]+\'?\'+key+timestamp+\'&\'+urlArr[1];\n            }else{\n                return urlArr[0]+\'?\'+key+timestamp;\n            }\n        }else{\n            if(url.indexOf(\'#\')>-1){\n                return url.split(\'#\')[0]+\'?\'+key+timestamp+location.hash;\n            }else{\n                return url+\'?\'+key+timestamp;\n            }\n        }\n    }\n};\n~~~\n\n~~~\nwindow.location.href=updateUrl(window.location.href);\n~~~', '2017-01-19 13:50:58', '2017-01-19 13:50:58');

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
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_guid` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '用户guid',
  `name` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '任务名称',
  `state` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '任务状态0:未完成，1:已完成',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作任务表';

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('27', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '4.跑步看电影', '1', '2017-01-14 16:18:48', '2017-01-14 22:06:36');
INSERT INTO `task` VALUES ('23', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '1.TH项目：修改任务管理模块初始化选择', '1', '2017-01-13 23:48:21', '2017-02-03 09:22:20');
INSERT INTO `task` VALUES ('24', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '1.微风社保活动，底部按钮实时现实几题', '1', '2017-01-14 15:20:25', '2017-01-14 16:08:38');
INSERT INTO `task` VALUES ('25', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '2.TH添加地址管理模块，整理地址', '1', '2017-01-14 15:21:34', '2017-02-03 09:22:17');
INSERT INTO `task` VALUES ('26', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '3.微风找茬前面相同的项目完成', '1', '2017-01-14 16:18:11', '2017-01-18 08:46:11');
INSERT INTO `task` VALUES ('28', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '1.WF获取调查问卷三个ajax合并成一个', '1', '2017-01-18 09:46:51', '2017-01-19 10:42:53');
INSERT INTO `task` VALUES ('29', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '2.WF修改曹阳义画面样式幸运机位置', '1', '2017-01-18 10:12:06', '2017-01-18 12:08:56');
INSERT INTO `task` VALUES ('30', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '3.WF幸运机按钮点击范围大', '1', '2017-01-18 11:43:21', '2017-01-18 11:55:33');
INSERT INTO `task` VALUES ('31', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '4.WF幸运机中奖纪录框框没有区域隐藏', '1', '2017-01-18 11:43:51', '2017-01-18 11:53:21');
INSERT INTO `task` VALUES ('32', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '5.WF幸运机背景渐变色调整', '1', '2017-01-18 11:44:23', '2017-01-18 11:50:07');
INSERT INTO `task` VALUES ('33', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '6.WF调查问卷未开始和已结束隐藏开始按钮', '1', '2017-01-18 14:30:03', '2017-01-18 15:00:50');
INSERT INTO `task` VALUES ('34', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '7.WF找错未开始已结束隐藏开始按钮', '1', '2017-01-18 14:34:26', '2017-01-18 15:04:11');
INSERT INTO `task` VALUES ('35', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '8.WF整合活动参与过已结束未开始组件', '1', '2017-01-18 14:35:36', '2017-01-18 15:31:45');
INSERT INTO `task` VALUES ('36', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '9.WF添加调研开始未结束残参与过组件', '1', '2017-01-18 14:37:43', '2017-01-19 14:07:28');
INSERT INTO `task` VALUES ('37', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '10.WF添加刮刮卡开始未结束残参与过组件', '1', '2017-01-18 14:38:11', '2017-01-19 13:55:19');
INSERT INTO `task` VALUES ('38', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '11.WF添加砸金蛋开始未结束残参与过组件', '1', '2017-01-18 14:38:32', '2017-01-19 13:54:28');
INSERT INTO `task` VALUES ('39', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '12.WF添加找错开始未结束残参与过组件', '1', '2017-01-18 14:39:01', '2017-01-19 14:14:07');
INSERT INTO `task` VALUES ('40', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '13:WF找错三个ajax合并成一个', '1', '2017-01-18 14:41:34', '2017-01-19 11:59:02');
INSERT INTO `task` VALUES ('41', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '14.WF刮刮卡toendphp流程修改', '1', '2017-01-18 14:42:13', '2017-01-19 10:43:19');
INSERT INTO `task` VALUES ('42', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '15.WF砸金蛋toendphp流程修改', '1', '2017-01-18 14:42:37', '2017-01-19 10:43:21');
INSERT INTO `task` VALUES ('43', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '16.WF砸金蛋刮刮卡获奖信息只取前100条', '1', '2017-01-18 17:24:26', '2017-01-19 13:19:38');
INSERT INTO `task` VALUES ('48', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '18.找错的奖品信息从chaches里取', '1', '2017-01-19 10:43:55', '2017-01-19 12:25:45');
INSERT INTO `task` VALUES ('49', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '19:刮刮卡奖品设置从缓存取', '1', '2017-01-19 12:26:32', '2017-01-19 13:39:29');
INSERT INTO `task` VALUES ('47', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '17.调研查奖券名的sql去掉', '1', '2017-01-19 09:10:30', '2017-01-19 10:09:20');
INSERT INTO `task` VALUES ('50', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '20.砸金蛋奖品设置从缓存取', '1', '2017-01-19 12:26:56', '2017-01-19 13:19:33');
INSERT INTO `task` VALUES ('53', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '21.砸金蛋样式修改，滚动框红色背景图偏移', '1', '2017-01-19 13:22:10', '2017-01-19 13:22:28');
INSERT INTO `task` VALUES ('54', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '22.刮刮卡样式修改，滚动框红色背景图偏移', '1', '2017-01-19 13:22:26', '2017-01-19 13:39:32');
INSERT INTO `task` VALUES ('55', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '23.调查砸金蛋拿不到中奖纪录', '1', '2017-01-19 14:15:18', '2017-01-19 15:20:31');
INSERT INTO `task` VALUES ('56', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '24.调查answer页面需不需要弹出状态层', '1', '2017-01-19 14:15:49', '2017-01-19 14:19:08');
INSERT INTO `task` VALUES ('57', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '25.修改砸金蛋获取中奖信息有错误', '1', '2017-01-19 14:41:24', '2017-01-19 16:51:30');
INSERT INTO `task` VALUES ('58', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '26.修改刮刮卡缓存获取奖项设置错误  ', '1', '2017-01-19 14:44:56', '2017-01-19 16:51:28');
INSERT INTO `task` VALUES ('59', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '27.修改砸金蛋没有头图的样式', '1', '2017-01-19 15:22:24', '2017-01-19 15:31:25');
INSERT INTO `task` VALUES ('60', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '28.修改刮刮卡没有头图的样式', '1', '2017-01-19 15:23:16', '2017-01-19 15:31:23');
INSERT INTO `task` VALUES ('61', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '1.WF幸运机微信端关注判断', '1', '2017-01-22 13:41:01', '2017-01-22 14:41:13');
INSERT INTO `task` VALUES ('62', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '2.WF幸运机微信端参与次数', '1', '2017-01-22 13:41:19', '2017-01-22 14:42:25');
INSERT INTO `task` VALUES ('63', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '3.WF幸运机微信端中奖概率', '1', '2017-01-22 13:41:36', '2017-01-22 14:45:35');
INSERT INTO `task` VALUES ('64', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '4.WF幸运机微信端中奖次数', '1', '2017-01-22 13:45:47', '2017-01-22 14:45:37');
INSERT INTO `task` VALUES ('65', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '5.WF幸运机微信端显示当前用户的所有已领取的奖品信息', '1', '2017-01-22 13:47:07', '2017-01-22 14:46:30');
INSERT INTO `task` VALUES ('66', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '6.WF幸运机微信端兑换按钮', '1', '2017-01-22 13:47:30', '2017-01-24 08:51:06');
INSERT INTO `task` VALUES ('67', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '7.WF幸运机微信端奖品设置正确读取后台内容', '1', '2017-01-22 13:48:00', '2017-01-22 14:53:47');
INSERT INTO `task` VALUES ('68', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '8.WF幸运机微信端活动规则正确读取后台内容', '1', '2017-01-22 13:48:43', '2017-01-22 14:53:31');
INSERT INTO `task` VALUES ('69', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '9.WF幸运机微信端分享结果与后台一致', '1', '2017-01-22 13:49:20', '2017-01-22 14:50:25');
INSERT INTO `task` VALUES ('70', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '10.WF幸运机微信端管理员登陆消券列表', '1', '2017-01-22 13:51:03', '2017-01-24 08:51:04');
INSERT INTO `task` VALUES ('71', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '11.WF幸运机微信端微信扫码，自动消券，显示消券结果', '1', '2017-01-22 13:52:22', '2017-01-24 08:51:08');
INSERT INTO `task` VALUES ('72', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '12.WF幸运机后台需要关注，上传公众号的二维码', '1', '2017-01-22 13:53:24', '2017-01-22 14:48:04');
INSERT INTO `task` VALUES ('73', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '13.WF幸运机后台不需要关注，不需要上传二维码', '1', '2017-01-22 13:53:55', '2017-01-22 14:51:19');
INSERT INTO `task` VALUES ('74', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '14.WF幸运机分享设置是否成功', '1', '2017-01-22 13:54:32', '2017-01-22 14:51:16');
INSERT INTO `task` VALUES ('75', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '15.WF幸运机后台设定项确定是否显示成功', '1', '2017-01-22 13:58:15', '2017-01-22 14:53:14');
INSERT INTO `task` VALUES ('76', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '16.WF幸运机后台奖项设置看看是否显示成功', '1', '2017-01-22 13:58:57', '2017-01-22 14:51:59');
INSERT INTO `task` VALUES ('77', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '1.XW预约表单填写页面', '0', '2017-01-24 08:56:47', '2017-01-24 08:56:47');
INSERT INTO `task` VALUES ('78', 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32', '2.WX预约-简单版1页面样式', '0', '2017-01-24 09:00:28', '2017-01-24 09:00:28');

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
