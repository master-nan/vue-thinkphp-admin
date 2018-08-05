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

 Date: 05/08/2018 15:17:19
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
  `rule_id` tinyint(3) DEFAULT NULL,
  `d_id` tinyint(3) DEFAULT '0' COMMENT '部门id',
  `p_id` tinyint(3) DEFAULT '0' COMMENT '岗位',
  `last_login_at` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_logout_at` int(10) DEFAULT NULL COMMENT '上次退出时间',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像路径',
  `status` tinyint(1) DEFAULT '1' COMMENT '当前状态0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `m_admin_user` VALUES (1, '管理员', 'admin', 'cea3e8e1659582206e0be32539729e9f', NULL, NULL, NULL, NULL, 1533453390, 1533453383, NULL, 1);
INSERT INTO `m_admin_user` VALUES (2, '测试', 'dev', 'c9a973c677899e92518c823c31527716', NULL, 1, 5, 6, 1533287732, 1533287755, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for m_department
-- ----------------------------
DROP TABLE IF EXISTS `m_department`;
CREATE TABLE `m_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of m_department
-- ----------------------------
BEGIN;
INSERT INTO `m_department` VALUES (1, '总经办', 1);
INSERT INTO `m_department` VALUES (2, '财务部', 1);
INSERT INTO `m_department` VALUES (3, '研发部', 1);
INSERT INTO `m_department` VALUES (4, '设计部', 1);
INSERT INTO `m_department` VALUES (5, '市场部', 1);
INSERT INTO `m_department` VALUES (6, '测试部', 1);
INSERT INTO `m_department` VALUES (7, '项目部', 1);
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
  `redirect` varchar(255) DEFAULT 'noredirect' COMMENT '面包屑点击跳转路径',
  `show` tinyint(1) DEFAULT '1' COMMENT '是否始终在左侧显示',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '是否在左侧隐藏',
  `sort` tinyint(2) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1',
  `op` varchar(64) DEFAULT NULL COMMENT '后台判断权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of m_menu
-- ----------------------------
BEGIN;
INSERT INTO `m_menu` VALUES (1, 0, 'menu', '菜单管理', '#nan-icon-drxx11', 'home', '/menu', '/menu/index', 1, 0, 0, 1, NULL);
INSERT INTO `m_menu` VALUES (2, 0, 'post', '岗位管理', '#nan-icon-drxx12', 'home', '/position', '/position/index', 1, 0, 1, 1, NULL);
INSERT INTO `m_menu` VALUES (3, 0, 'rule', '权限管理', '#nan-icon-drxx08', 'home', '/rule', '/rule/index', 1, 0, 2, 1, NULL);
INSERT INTO `m_menu` VALUES (4, 1, 'addMenu', '菜单增加', '#nan-icon-shouye', 'addMenu', 'add', 'noredirect', 1, 0, 2, 1, 'admin-Menu-save');
INSERT INTO `m_menu` VALUES (5, 1, 'menuDetail', '菜单详情', '', 'menuDetail', 'index', 'noredirect', 1, 0, 1, 1, 'admin-Menu-index');
INSERT INTO `m_menu` VALUES (6, 0, 'department', '部门管理', '#nan-icon-bumen', 'home', '/department', '/department/index', 1, 0, 3, 1, NULL);
INSERT INTO `m_menu` VALUES (7, 6, 'departmentDetail', '部门详情', '', 'departmentDetail', 'index', 'noredirect', 1, 0, 0, 1, 'admin-Department-index');
INSERT INTO `m_menu` VALUES (8, 6, 'addDepartment', '部门增加', '', 'addDepartment', 'add', 'noredirect', 1, 0, 1, 1, 'admin-Department-save');
INSERT INTO `m_menu` VALUES (9, 6, 'editDepartment', '部门编辑', '', 'editDepartment', 'edit/:id(\\\\d+)', 'noredirect', 1, 1, 2, 1, 'admin-Department-update');
INSERT INTO `m_menu` VALUES (10, 1, 'editMenu', '菜单编辑', '', 'editMenu', 'edit/:id(\\\\d+)', 'noredirect', 1, 1, 3, 1, 'admin-Menu-update');
INSERT INTO `m_menu` VALUES (11, 2, 'positionDetail', '岗位详情', '', 'positionDetail', 'index', 'noredirect', 1, 0, 0, 1, 'admin-Position-index');
INSERT INTO `m_menu` VALUES (12, 2, 'editPosition', '岗位编辑', '', 'editPosition', 'edit/:id(\\\\d+)', 'noredirect', 1, 1, 0, 1, 'admin-Position-update');
INSERT INTO `m_menu` VALUES (13, 2, 'addPosition', '岗位增加', '', 'addPosition', 'add', 'noredirect', 1, 0, 1, 1, 'admin-Position-save');
INSERT INTO `m_menu` VALUES (14, 3, 'ruleDetail', '权限详情', '', 'ruleDetail', 'index', 'noredirect', 1, 0, 0, 1, 'admin-Rule-index');
INSERT INTO `m_menu` VALUES (15, 3, 'addRule', '权限增加', '', 'addRule', 'add', 'noredirect', 1, 0, 0, 1, 'admin-Rule-save');
INSERT INTO `m_menu` VALUES (16, 3, 'editRule', '权限编辑', '', 'editRule', 'edit/:id(\\\\d+)', 'noredirect', 1, 1, 1, 1, 'admin-Rule-update');
INSERT INTO `m_menu` VALUES (17, 0, 'user', '用户管理', '#nan-icon-drxx10', 'home', '/user', '/user/index', 1, 0, 2, 1, NULL);
INSERT INTO `m_menu` VALUES (18, 17, 'userDetail', '用户详情', NULL, 'userDetail', 'index', 'noredirect', 1, 0, 0, 1, 'admin-AdminUser-index');
INSERT INTO `m_menu` VALUES (19, 17, 'addUser', '用户增加', NULL, 'addUser', 'add', 'noredirect', 1, 0, 0, 1, 'admin-AdminUser-save');
INSERT INTO `m_menu` VALUES (20, 17, 'editUser', '用户编辑', NULL, 'editUser', 'edit/:id(\\\\d+)', 'noredirect', 1, 1, 1, 1, 'admin-AdminUser-update');
COMMIT;

-- ----------------------------
-- Table structure for m_position
-- ----------------------------
DROP TABLE IF EXISTS `m_position`;
CREATE TABLE `m_position` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `create_at` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of m_position
-- ----------------------------
BEGIN;
INSERT INTO `m_position` VALUES (1, '后端开发工程师', '1122223111', 1484706862, 1);
INSERT INTO `m_position` VALUES (2, '前端开发工程师', '擦擦', 1484706863, 1);
INSERT INTO `m_position` VALUES (3, '设计师', NULL, 1484706863, 1);
INSERT INTO `m_position` VALUES (4, '文案策划', NULL, 1484706863, 1);
INSERT INTO `m_position` VALUES (5, '产品助理', NULL, 1484706863, 1);
INSERT INTO `m_position` VALUES (6, '总经理', NULL, 1484706863, 1);
INSERT INTO `m_position` VALUES (7, '项目经理', NULL, 1484706863, 1);
INSERT INTO `m_position` VALUES (8, '项目助理', NULL, 1484706863, 1);
INSERT INTO `m_position` VALUES (9, '测试工程师', NULL, 1484706863, 1);
INSERT INTO `m_position` VALUES (10, '人事经理', NULL, 1484706863, 1);
INSERT INTO `m_position` VALUES (11, 'CEO', NULL, 1484706863, 1);
COMMIT;

-- ----------------------------
-- Table structure for m_rule
-- ----------------------------
DROP TABLE IF EXISTS `m_rule`;
CREATE TABLE `m_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `rs` varchar(4000) DEFAULT NULL COMMENT '权限id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限组';

-- ----------------------------
-- Records of m_rule
-- ----------------------------
BEGIN;
INSERT INTO `m_rule` VALUES (1, '测试', '6,7,8', '测试', 1);
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
