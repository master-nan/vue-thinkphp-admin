/*
 Navicat Premium Data Transfer

 Source Server         : 个人网站
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : master

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 13/09/2018 15:45:59
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_access_logs
-- ----------------------------
BEGIN;
INSERT INTO `m_access_logs` VALUES (1, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1533630555);
INSERT INTO `m_access_logs` VALUES (2, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1533631474);
INSERT INTO `m_access_logs` VALUES (3, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1533695797);
INSERT INTO `m_access_logs` VALUES (4, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1533706201);
INSERT INTO `m_access_logs` VALUES (5, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1533706540);
INSERT INTO `m_access_logs` VALUES (6, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1533804177);
INSERT INTO `m_access_logs` VALUES (7, '125.95.121.9', '', '中国', '广东', '佛山', '电信', 1533804497);
INSERT INTO `m_access_logs` VALUES (8, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1534043854);
INSERT INTO `m_access_logs` VALUES (9, '43.224.1.181', '', '印度', '拉贾斯坦', 'XX', 'XX', 1534247350);
INSERT INTO `m_access_logs` VALUES (10, '221.222.139.196', '', '中国', '北京', '北京', '联通', 1534301768);
INSERT INTO `m_access_logs` VALUES (11, '114.229.127.150', '', '中国', '江苏', '镇江', '电信', 1534393242);
INSERT INTO `m_access_logs` VALUES (12, '114.229.127.150', '', '中国', '江苏', '镇江', '电信', 1534393247);
INSERT INTO `m_access_logs` VALUES (13, '114.229.127.150', '', '中国', '江苏', '镇江', '电信', 1534394019);
INSERT INTO `m_access_logs` VALUES (14, '222.186.50.10', NULL, NULL, NULL, NULL, NULL, 1534403031);
INSERT INTO `m_access_logs` VALUES (15, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1534403974);
INSERT INTO `m_access_logs` VALUES (16, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1534404060);
INSERT INTO `m_access_logs` VALUES (17, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1534404144);
INSERT INTO `m_access_logs` VALUES (18, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1534404160);
INSERT INTO `m_access_logs` VALUES (19, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1534404205);
INSERT INTO `m_access_logs` VALUES (20, '222.186.50.10', NULL, NULL, NULL, NULL, NULL, 1534404224);
INSERT INTO `m_access_logs` VALUES (21, '222.186.50.10', '', '中国', '江苏', '镇江', '电信', 1534484735);
INSERT INTO `m_access_logs` VALUES (22, '222.186.50.10', NULL, NULL, NULL, NULL, NULL, 1534485054);
INSERT INTO `m_access_logs` VALUES (23, '180.118.44.225', NULL, NULL, NULL, NULL, NULL, 1534683019);
INSERT INTO `m_access_logs` VALUES (24, '180.118.44.225', NULL, NULL, NULL, NULL, NULL, 1534683233);
INSERT INTO `m_access_logs` VALUES (25, '180.118.44.225', NULL, NULL, NULL, NULL, NULL, 1534686492);
INSERT INTO `m_access_logs` VALUES (26, '222.186.101.50', NULL, NULL, NULL, NULL, NULL, 1534755501);
INSERT INTO `m_access_logs` VALUES (27, '117.90.239.226', NULL, NULL, NULL, NULL, NULL, 1534942228);
INSERT INTO `m_access_logs` VALUES (28, '122.190.94.142', NULL, NULL, NULL, NULL, NULL, 1535221240);
INSERT INTO `m_access_logs` VALUES (29, '222.186.50.10', NULL, NULL, NULL, NULL, NULL, 1535591360);
INSERT INTO `m_access_logs` VALUES (30, '114.248.205.31', NULL, NULL, NULL, NULL, NULL, 1535705388);
INSERT INTO `m_access_logs` VALUES (31, '114.248.205.31', NULL, NULL, NULL, NULL, NULL, 1535705528);
INSERT INTO `m_access_logs` VALUES (32, '59.175.60.79', NULL, NULL, NULL, NULL, NULL, 1535724487);
INSERT INTO `m_access_logs` VALUES (33, '117.90.45.232', NULL, NULL, NULL, NULL, NULL, 1535724946);
INSERT INTO `m_access_logs` VALUES (34, '117.90.217.106', NULL, NULL, NULL, NULL, NULL, 1535811944);
INSERT INTO `m_access_logs` VALUES (35, '58.49.82.196', NULL, NULL, NULL, NULL, NULL, 1535846692);
INSERT INTO `m_access_logs` VALUES (36, '58.49.82.196', NULL, NULL, NULL, NULL, NULL, 1535848836);
INSERT INTO `m_access_logs` VALUES (37, '180.97.198.217', NULL, NULL, NULL, NULL, NULL, 1535898522);
INSERT INTO `m_access_logs` VALUES (38, '171.43.191.7', NULL, NULL, NULL, NULL, NULL, 1535965178);
INSERT INTO `m_access_logs` VALUES (39, '171.43.191.7', NULL, NULL, NULL, NULL, NULL, 1535965243);
INSERT INTO `m_access_logs` VALUES (40, '171.43.191.7', NULL, NULL, NULL, NULL, NULL, 1535966745);
INSERT INTO `m_access_logs` VALUES (41, '171.43.191.7', NULL, NULL, NULL, NULL, NULL, 1535974261);
INSERT INTO `m_access_logs` VALUES (42, '59.175.60.79', NULL, NULL, NULL, NULL, NULL, 1535988646);
INSERT INTO `m_access_logs` VALUES (43, '183.198.16.88', NULL, NULL, NULL, NULL, NULL, 1536076534);
INSERT INTO `m_access_logs` VALUES (44, '183.198.16.88', NULL, NULL, NULL, NULL, NULL, 1536076569);
INSERT INTO `m_access_logs` VALUES (45, '219.140.43.160', NULL, NULL, NULL, NULL, NULL, 1536145056);
INSERT INTO `m_access_logs` VALUES (46, '49.70.153.247', NULL, NULL, NULL, NULL, NULL, 1536238274);
INSERT INTO `m_access_logs` VALUES (47, '222.186.50.10', NULL, NULL, NULL, NULL, NULL, 1536304505);
INSERT INTO `m_access_logs` VALUES (48, '114.221.244.183', NULL, NULL, NULL, NULL, NULL, 1536644337);
INSERT INTO `m_access_logs` VALUES (49, '114.221.244.183', NULL, NULL, NULL, NULL, NULL, 1536649325);
INSERT INTO `m_access_logs` VALUES (50, '114.221.244.183', NULL, NULL, NULL, NULL, NULL, 1536650964);
INSERT INTO `m_access_logs` VALUES (51, '222.186.50.10', NULL, NULL, NULL, NULL, NULL, 1536653921);
INSERT INTO `m_access_logs` VALUES (52, '222.186.50.10', NULL, NULL, NULL, NULL, NULL, 1536654454);
INSERT INTO `m_access_logs` VALUES (53, '114.221.244.183', NULL, NULL, NULL, NULL, NULL, 1536659941);
INSERT INTO `m_access_logs` VALUES (54, '114.221.244.183', NULL, NULL, NULL, NULL, NULL, 1536663993);
INSERT INTO `m_access_logs` VALUES (55, '49.77.145.156', NULL, NULL, NULL, NULL, NULL, 1536734193);
INSERT INTO `m_access_logs` VALUES (56, '101.80.51.87', NULL, NULL, NULL, NULL, NULL, 1536823638);
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
  `rule_id` tinyint(3) DEFAULT NULL,
  `d_id` tinyint(3) DEFAULT '0' COMMENT '部门id',
  `p_id` tinyint(3) DEFAULT '0' COMMENT '岗位',
  `last_login_at` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_logout_at` int(10) DEFAULT NULL COMMENT '上次退出时间',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像路径',
  `status` tinyint(1) DEFAULT '1' COMMENT '当前状态0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `m_admin_user` VALUES (1, '管理员', 'admin', '417a4f7ed696ae1eb4f354c9f7b6c67c', NULL, NULL, NULL, NULL, 1536304505, 1534404233, NULL, 1);
INSERT INTO `m_admin_user` VALUES (2, '测试', 'dev', 'c9a973c677899e92518c823c31527716', NULL, 1, 5, 6, 1536823638, 1536654126, NULL, 1);
INSERT INTO `m_admin_user` VALUES (3, 'test', 'test', 'f2e52e3efb6647bc3aceb89349568b88', NULL, 2, 6, 9, 1536076534, 1536076561, NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of m_department
-- ----------------------------
BEGIN;
INSERT INTO `m_department` VALUES (1, '总经办', NULL, 1);
INSERT INTO `m_department` VALUES (2, '财务部', NULL, 1);
INSERT INTO `m_department` VALUES (3, '研发部', NULL, 1);
INSERT INTO `m_department` VALUES (4, '设计部', NULL, 1);
INSERT INTO `m_department` VALUES (5, '市场部', NULL, 1);
INSERT INTO `m_department` VALUES (6, '测试部', NULL, 1);
INSERT INTO `m_department` VALUES (7, '项目部', NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of m_position
-- ----------------------------
BEGIN;
INSERT INTO `m_position` VALUES (1, '后端开发工程师', '1122223111', 1);
INSERT INTO `m_position` VALUES (2, '前端开发工程师', '擦擦', 1);
INSERT INTO `m_position` VALUES (3, '设计师', NULL, 1);
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
  `rs` varchar(255) DEFAULT NULL COMMENT '权限id',
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
