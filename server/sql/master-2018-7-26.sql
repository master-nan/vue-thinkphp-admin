/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : master

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 26/07/2018 18:06:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `m_admin_user`;
CREATE TABLE `m_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  `ruel_id` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `m_admin_user` VALUES (1, '管理员', 'admin', 'cea3e8e1659582206e0be32539729e9f', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_class
-- ----------------------------
DROP TABLE IF EXISTS `m_class`;
CREATE TABLE `m_class` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class` varchar(32) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  `update_at` int(10) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_commodity
-- ----------------------------
DROP TABLE IF EXISTS `m_commodity`;
CREATE TABLE `m_commodity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class_id` int(10) DEFAULT NULL,
  `norm_id` int(10) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  `update_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_department
-- ----------------------------
DROP TABLE IF EXISTS `m_department`;
CREATE TABLE `m_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Table structure for m_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_menu`;
CREATE TABLE `m_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL COMMENT '路由中可跳转name，请保持唯一值',
  `title` varchar(64) DEFAULT NULL COMMENT '显示名称',
  `icon` varchar(64) DEFAULT NULL COMMENT '显示icon class，一级菜单有效',
  `component` varchar(255) DEFAULT NULL COMMENT '引入的vue在前端代码中的位置',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) DEFAULT 'noredirect' COMMENT '面包屑点击跳转路径',
  `show` tinyint(1) DEFAULT '1' COMMENT '是否始终在左侧显示',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '是否在左侧隐藏',
  `sort` tinyint(2) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of m_menu
-- ----------------------------
BEGIN;
INSERT INTO `m_menu` VALUES (1, 0, 'menu', '菜单管理', '', '@/views/public/Home', '/menu', '/menu/index', 1, 0, 0, 1);
INSERT INTO `m_menu` VALUES (2, 0, 'post', '岗位管理', '', '@/views/public/Home', '/post', '/post/index', 1, 0, 2, 1);
INSERT INTO `m_menu` VALUES (3, 0, 'rule', '权限管理', '', '@/views/public/Home', '/rule', '/rule/index', 1, 0, 1, 1);
INSERT INTO `m_menu` VALUES (4, 1, 'addMenu', '菜单增加', '', '@/views/menu/Add', 'add', 'noredirect', 1, 0, 5, 1);
INSERT INTO `m_menu` VALUES (5, 1, 'menuDetail', '菜单详情', '', '@/views/menu/index', 'index', 'noredirect', 1, 0, 5, 1);
COMMIT;

-- ----------------------------
-- Table structure for m_norm
-- ----------------------------
DROP TABLE IF EXISTS `m_norm`;
CREATE TABLE `m_norm` (
  `id` int(10) NOT NULL,
  `norm` varchar(16) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  `update_at` int(10) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_order
-- ----------------------------
DROP TABLE IF EXISTS `m_order`;
CREATE TABLE `m_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order` varchar(64) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  `update_at` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_order_details
-- ----------------------------
DROP TABLE IF EXISTS `m_order_details`;
CREATE TABLE `m_order_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order` varchar(64) DEFAULT NULL,
  `comm_id` int(10) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `offer` int(10) DEFAULT '0',
  `num` int(10) DEFAULT '0',
  `create_at` int(10) DEFAULT NULL,
  `update_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_post
-- ----------------------------
DROP TABLE IF EXISTS `m_post`;
CREATE TABLE `m_post` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `create_at` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '状态0启用,1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Table structure for m_rule
-- ----------------------------
DROP TABLE IF EXISTS `m_rule`;
CREATE TABLE `m_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `rules` varchar(4000) DEFAULT NULL COMMENT '权限id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组';

-- ----------------------------
-- Table structure for m_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `m_sys_config`;
CREATE TABLE `m_sys_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `logo` varchar(256) DEFAULT NULL,
  `session_valid` int(10) DEFAULT '0',
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置';

SET FOREIGN_KEY_CHECKS = 1;
