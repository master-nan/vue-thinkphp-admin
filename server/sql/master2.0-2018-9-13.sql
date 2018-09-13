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

 Date: 13/09/2018 15:55:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_access_logs
-- ----------------------------
DROP TABLE IF EXISTS `m_access_logs`;
CREATE TABLE `m_access_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) DEFAULT NULL,
  `area` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `isp` varchar(16) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_access_logs
-- ----------------------------
BEGIN;
INSERT INTO `m_access_logs` VALUES (1, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533539406);
INSERT INTO `m_access_logs` VALUES (2, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533539517);
INSERT INTO `m_access_logs` VALUES (3, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533540472);
INSERT INTO `m_access_logs` VALUES (4, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533540532);
INSERT INTO `m_access_logs` VALUES (5, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541000);
INSERT INTO `m_access_logs` VALUES (6, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541071);
INSERT INTO `m_access_logs` VALUES (7, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541193);
INSERT INTO `m_access_logs` VALUES (8, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541325);
INSERT INTO `m_access_logs` VALUES (9, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541403);
INSERT INTO `m_access_logs` VALUES (10, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541575);
INSERT INTO `m_access_logs` VALUES (11, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533541601);
INSERT INTO `m_access_logs` VALUES (12, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533544764);
INSERT INTO `m_access_logs` VALUES (13, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547459);
INSERT INTO `m_access_logs` VALUES (14, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547586);
INSERT INTO `m_access_logs` VALUES (15, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547634);
INSERT INTO `m_access_logs` VALUES (16, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547840);
INSERT INTO `m_access_logs` VALUES (17, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547892);
INSERT INTO `m_access_logs` VALUES (18, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533547991);
INSERT INTO `m_access_logs` VALUES (19, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533548018);
INSERT INTO `m_access_logs` VALUES (20, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533548057);
INSERT INTO `m_access_logs` VALUES (21, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533548090);
INSERT INTO `m_access_logs` VALUES (22, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533549630);
INSERT INTO `m_access_logs` VALUES (23, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533549645);
INSERT INTO `m_access_logs` VALUES (24, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1533549951);
INSERT INTO `m_access_logs` VALUES (25, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536803816);
INSERT INTO `m_access_logs` VALUES (26, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536818396);
INSERT INTO `m_access_logs` VALUES (27, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536820769);
INSERT INTO `m_access_logs` VALUES (28, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536821043);
INSERT INTO `m_access_logs` VALUES (29, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536821657);
INSERT INTO `m_access_logs` VALUES (30, '0.0.0.0', '', 'XX', 'XX', '内网IP', '内网IP', 1536822747);
COMMIT;

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
  `r_id` tinyint(3) DEFAULT NULL,
  `d_id` tinyint(3) DEFAULT '0' COMMENT '部门id',
  `p_id` tinyint(3) DEFAULT '0' COMMENT '岗位',
  `last_login_at` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_logout_at` int(10) DEFAULT NULL COMMENT '上次退出时间',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像路径',
  `status` tinyint(1) DEFAULT '1' COMMENT '当前状态0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `m_admin_user` VALUES (1, '管理员', 'admin', 'cea3e8e1659582206e0be32539729e9f', NULL, NULL, NULL, NULL, 1536822747, 1536822238, NULL, 1);
INSERT INTO `m_admin_user` VALUES (2, '测试', 'dev', 'c9a973c677899e92518c823c31527716', NULL, 1, 5, 6, 1533547892, 1533547981, NULL, 1);
INSERT INTO `m_admin_user` VALUES (3, 'test', 'test', 'f2e52e3efb6647bc3aceb89349568b88', NULL, 2, 6, 9, 1533549645, 1533549944, NULL, 1);
INSERT INTO `m_admin_user` VALUES (4, '231', '321', '91f544db40265dbe9eb4a4580634ba55', NULL, 2, 5, 7, 0, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for m_department
-- ----------------------------
DROP TABLE IF EXISTS `m_department`;
CREATE TABLE `m_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of m_department
-- ----------------------------
BEGIN;
INSERT INTO `m_department` VALUES (1, '总经办1', '321', 1);
INSERT INTO `m_department` VALUES (2, '财务部', NULL, 1);
INSERT INTO `m_department` VALUES (3, '研发部', NULL, 1);
INSERT INTO `m_department` VALUES (4, '设计部', NULL, 1);
INSERT INTO `m_department` VALUES (5, '市场部', NULL, 1);
INSERT INTO `m_department` VALUES (6, '测试部', NULL, 1);
INSERT INTO `m_department` VALUES (7, '项目部', NULL, 1);
INSERT INTO `m_department` VALUES (8, '321', '11', 1);
COMMIT;

-- ----------------------------
-- Table structure for m_files
-- ----------------------------
DROP TABLE IF EXISTS `m_files`;
CREATE TABLE `m_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `u_id` int(10) DEFAULT '0',
  `ext` varchar(16) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `create_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `redirect` varchar(255) DEFAULT '' COMMENT '面包屑点击跳转路径   弃用',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '是否在左侧隐藏',
  `sort` tinyint(2) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `op` varchar(64) DEFAULT NULL COMMENT '后台判断权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of m_menu
-- ----------------------------
BEGIN;
INSERT INTO `m_menu` VALUES (1, 0, 'organization', '组织架构', 'el-icon-menu', 'home', '/organization', '', 0, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (2, 0, 'system', '系统管理', 'el-icon-setting', 'home', '/system', '', 0, 1, 1, NULL);
INSERT INTO `m_menu` VALUES (3, 1, 'department', '部门管理', '', 'department', 'department/index', '', 0, 0, 1, 'admin-Department-index');
INSERT INTO `m_menu` VALUES (4, 1, 'position', '岗位管理', '', 'position', 'position/index', '', 0, 1, 1, 'admin-Position-index');
INSERT INTO `m_menu` VALUES (5, 1, 'user', '用户管理', '', 'user', 'user/index', '', 0, 2, 1, 'admin-AdminUser-index');
INSERT INTO `m_menu` VALUES (6, 2, 'menu', '菜单管理', '', 'menu', 'menu/index', '', 0, 0, 1, 'admin-Menu-index');
INSERT INTO `m_menu` VALUES (7, 2, 'rule', '权限管理', '', 'rule', 'rule/index', '', 0, 1, 1, 'admin-Rule-index');
INSERT INTO `m_menu` VALUES (8, 1, 'add', '部门增加', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (9, 1, 'edit', '部门编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (10, 1, 'add', '岗位增加', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (11, 1, 'edit', '岗位编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (12, 1, 'add', '用户增加', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (13, 1, 'edit', '用户编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (14, 2, 'add', '菜单增加', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (15, 2, 'edit', '菜单编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (16, 2, 'add', '权限增加', NULL, NULL, NULL, '', 1, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (17, 2, 'edit', '权限编辑', NULL, NULL, NULL, '', 1, 0, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for m_position
-- ----------------------------
DROP TABLE IF EXISTS `m_position`;
CREATE TABLE `m_position` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of m_position
-- ----------------------------
BEGIN;
INSERT INTO `m_position` VALUES (1, '后端开发工程师', '1122223111', 1);
INSERT INTO `m_position` VALUES (2, '前端开发工程师', '擦擦', 1);
INSERT INTO `m_position` VALUES (3, '设计师', '231', 1);
INSERT INTO `m_position` VALUES (4, '文案策划', NULL, 1);
INSERT INTO `m_position` VALUES (5, '产品助理', NULL, 1);
INSERT INTO `m_position` VALUES (6, '总经理', NULL, 1);
INSERT INTO `m_position` VALUES (7, '项目经理', NULL, 1);
INSERT INTO `m_position` VALUES (8, '项目助理', NULL, 1);
INSERT INTO `m_position` VALUES (9, '测试工程师', NULL, 1);
INSERT INTO `m_position` VALUES (10, '人事经理', NULL, 1);
INSERT INTO `m_position` VALUES (11, 'CEO', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for m_rule
-- ----------------------------
DROP TABLE IF EXISTS `m_rule`;
CREATE TABLE `m_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `rs` varchar(4000) DEFAULT NULL COMMENT '权限id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='权限组';

-- ----------------------------
-- Records of m_rule
-- ----------------------------
BEGIN;
INSERT INTO `m_rule` VALUES (1, '测试1', '1,5,4,10,2,11,12,13,6,7,8,9,3,14,15,16', '测试1', 1);
INSERT INTO `m_rule` VALUES (2, '测试2', '1,5,2,11,12,13,6,7,8,9', '', 1);
COMMIT;

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
