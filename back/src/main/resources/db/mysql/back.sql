/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50613
Source Host           : 127.0.0.1:3306
Source Database       : back

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2013-09-04 14:24:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `password` char(40) DEFAULT NULL COMMENT '用户密码',
  `state` tinyint(4) DEFAULT '1' COMMENT 'Email',
  `time` int(11) DEFAULT '0',
  `role_id` int(11) DEFAULT NULL COMMENT '用户状态 0 无效 1 有效 2 已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `authority` varchar(50) DEFAULT NULL COMMENT '角色名',
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of authority
-- ----------------------------

-- ----------------------------
-- Table structure for `entitys`
-- ----------------------------
DROP TABLE IF EXISTS `entitys`;
CREATE TABLE `entitys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `list` text,
  `map` text,
  PRIMARY KEY (`id`),
  KEY `Index_Time` (`time`),
  KEY `Index_Name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='通用实体表';

-- ----------------------------
-- Records of entitys
-- ----------------------------

-- ----------------------------
-- Table structure for `login_logs`
-- ----------------------------
DROP TABLE IF EXISTS `login_logs`;
CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_Date` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `login_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `login_statistics`;
CREATE TABLE `login_statistics` (
  `user_id` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `time` int(11) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL COMMENT '手机',
  `last_ip` char(15) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`user_id`),
  KEY `INDEX_Time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of login_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `menu_id` int(11) DEFAULT '0',
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for `operate`
-- ----------------------------
DROP TABLE IF EXISTS `operate`;
CREATE TABLE `operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(50) NOT NULL COMMENT '操作连接',
  `name` varchar(50) DEFAULT NULL COMMENT '操作名称 用于显示',
  PRIMARY KEY (`id`),
  KEY `Index_ID` (`link`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='操作信息表';

-- ----------------------------
-- Records of operate
-- ----------------------------

-- ----------------------------
-- Table structure for `operate_logs`
-- ----------------------------
DROP TABLE IF EXISTS `operate_logs`;
CREATE TABLE `operate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户主键',
  `time` int(11) DEFAULT NULL COMMENT '操作时间',
  `content` varchar(500) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_Date` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日志信息表';

-- ----------------------------
-- Records of operate_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `page_logs`
-- ----------------------------
DROP TABLE IF EXISTS `page_logs`;
CREATE TABLE `page_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `page` varchar(200) DEFAULT NULL,
  `referrer` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `out_time` int(11) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_Date` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `page_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `page_statistics`;
CREATE TABLE `page_statistics` (
  `page` varchar(200) NOT NULL COMMENT '主键',
  `count` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL COMMENT '主键',
  `time` int(11) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`page`),
  KEY `INDEX_Time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of page_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `role_authority`
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `authority_id` int(11) DEFAULT '0',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色与权限关系表';

-- ----------------------------
-- Records of role_authority
-- ----------------------------

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_Menu` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色与菜单关系表';

-- ----------------------------
-- Records of role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `role_operate`
-- ----------------------------
DROP TABLE IF EXISTS `role_operate`;
CREATE TABLE `role_operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operate_id` int(11) DEFAULT '0',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色与操作关系表';

-- ----------------------------
-- Records of role_operate
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` char(40) DEFAULT NULL COMMENT '用户密码',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '用于显示',
  `mobile` char(11) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT 'Email',
  `time` int(11) DEFAULT '0',
  `state` tinyint(4) DEFAULT '1' COMMENT '用户状态 0 无效 1 有效 2 已删除',
  `sex` tinyint(4) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `register_ip` char(15) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_Name_Password` (`name`,`password`),
  KEY `INDEX_Email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------