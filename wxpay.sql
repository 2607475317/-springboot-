/*
 Navicat Premium Data Transfer

 Source Server         : king
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : wxpay

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 12/04/2019 17:23:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL COMMENT '视频主键',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '章节名称',
  `ordered` int(11) DEFAULT NULL COMMENT '章节顺序',
  `create_time` timestamp(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `user_id` int(11) DEFAULT NULL,
  `head_img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `point` double(5, 2) DEFAULT NULL COMMENT '评分，10分满分',
  `up` int(11) DEFAULT NULL COMMENT '点赞数',
  `create_time` timestamp(0) DEFAULT NULL COMMENT '创建时间',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `video_id` int(11) DEFAULT NULL COMMENT '视频id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for episode
-- ----------------------------
DROP TABLE IF EXISTS `episode`;
CREATE TABLE `episode`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(524) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '集标题',
  `num` int(10) DEFAULT NULL COMMENT '第几集',
  `duration` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '时长 分钟，单位',
  `cover_img` varchar(524) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '封面图',
  `video_id` int(10) DEFAULT NULL COMMENT '视频id',
  `summary` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '集概述',
  `create_time` timestamp(0) DEFAULT NULL COMMENT '创建时间',
  `chapter_id` int(11) DEFAULT NULL COMMENT '章节主键id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `openid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信openid',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `head_img` varchar(524) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '手机号',
  `sign` varchar(524) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '全栈工程师' COMMENT '用户签名',
  `sex` tinyint(2) DEFAULT -1 COMMENT '0表示女，1表示男',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(524) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频标题',
  `summary` varchar(1026) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '概述',
  `cover_img` varchar(524) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '封面图',
  `view_num` int(10) DEFAULT 0 COMMENT '观看数',
  `price` int(11) DEFAULT NULL COMMENT '价格,分',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `online` int(5) DEFAULT 0 COMMENT '0表示未上线，1表示上线',
  `point` double(11, 2) DEFAULT 8.70 COMMENT '默认8.7，最高10分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, '\"springboot高级课程\"', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 12, 1000, '2019-04-12 00:00:00', 0, 8.70);
INSERT INTO `video` VALUES (2, '2018年 6.2新版本ELK ElasticSearch ', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 43, 500, '2019-04-12 00:00:00', 0, 9.70);
INSERT INTO `video` VALUES (3, 'JMeter接口测试入门到实战', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 53, 123, '2019-04-12 00:00:00', 0, 8.70);
INSERT INTO `video` VALUES (4, 'Spring Boot2.x零基础入门到高级实战', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 23, 199, '2019-04-12 00:00:00', 0, 6.20);
INSERT INTO `video` VALUES (5, '亿级流量处理搜索', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 64, 10, '2019-04-12 00:00:00', 0, 9.10);
INSERT INTO `video` VALUES (6, 'reidis消息队列高级实战', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 12, 10, '2019-04-12 00:00:00', 0, 6.70);
INSERT INTO `video` VALUES (7, '谷歌面试题', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 52, 23, '2019-04-12 00:00:00', 0, 5.10);
INSERT INTO `video` VALUES (8, 'js高级前端视频', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 54, 442, '2019-04-12 00:00:00', 0, 8.70);
INSERT INTO `video` VALUES (9, 'List消息队列高级实战', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 13, 32, '2019-04-12 00:00:00', 0, 4.30);

-- ----------------------------
-- Table structure for video_order
-- ----------------------------
DROP TABLE IF EXISTS `video_order`;
CREATE TABLE `video_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户标示',
  `out_trade_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单唯一标识',
  `state` int(11) DEFAULT NULL COMMENT '0表示未支付，1表示已支付',
  `create_time` datetime(0) DEFAULT NULL COMMENT '订单生成时间',
  `notify_time` datetime(0) DEFAULT NULL COMMENT '支付回调时间',
  `total_fee` int(11) DEFAULT NULL COMMENT '支付金额，单位分',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信昵称',
  `head_img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信头像',
  `video_id` int(11) DEFAULT NULL COMMENT '视频主键',
  `video_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频名称',
  `video_img` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频图片',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户ip地址',
  `del` int(5) DEFAULT 0 COMMENT '0表示未删除，1表示已经删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_order
-- ----------------------------
INSERT INTO `video_order` VALUES (1, 'werwewfwe', 'dasfweqdqf', 1, '2018-07-12 00:00:00', '2018-07-12 00:00:00', 12, '小D', 'xxx', 1, 'SpringBoot视频', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 1, '192.154.2.32', 0);
INSERT INTO `video_order` VALUES (2, '3452333', 'gasdfdf', 1, '2018-07-12 00:00:00', '2018-07-12 00:00:00', 12, '小X', 'xxx', 2, '2018年 6.2新版本ELK ElasticSearch ', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 2, '192.154.2.32', 0);
INSERT INTO `video_order` VALUES (3, 'sfsd', '432werew', 1, '2018-07-12 00:00:00', '2018-07-12 00:00:00', 12, '小C', 'xxx', 3, 'JMeter接口测试入门到实战', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 3, '192.154.2.32', 0);
INSERT INTO `video_order` VALUES (4, 'werqwe', '3432', 1, '2018-07-12 00:00:00', '2018-07-12 00:00:00', 12, '小D', 'xxx', 2, '2018年 6.2新版本ELK ElasticSearch ', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', 1, '192.154.2.32', 0);

SET FOREIGN_KEY_CHECKS = 1;
