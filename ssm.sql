/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/10/2022 12:33:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 703 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (684, '姓名_81');
INSERT INTO `t_dept` VALUES (685, '姓名_82');
INSERT INTO `t_dept` VALUES (686, '姓名_83');
INSERT INTO `t_dept` VALUES (687, '姓名_84');
INSERT INTO `t_dept` VALUES (688, '姓名_85');
INSERT INTO `t_dept` VALUES (689, '姓名_86');
INSERT INTO `t_dept` VALUES (690, '姓名_87');
INSERT INTO `t_dept` VALUES (691, '姓名_88');
INSERT INTO `t_dept` VALUES (692, '姓名_89');
INSERT INTO `t_dept` VALUES (693, '姓名_90');
INSERT INTO `t_dept` VALUES (694, '姓名_91');
INSERT INTO `t_dept` VALUES (695, '姓名_92');
INSERT INTO `t_dept` VALUES (696, '姓名_93');
INSERT INTO `t_dept` VALUES (697, '姓名_94');
INSERT INTO `t_dept` VALUES (698, '姓名_95');
INSERT INTO `t_dept` VALUES (699, '姓名_96');
INSERT INTO `t_dept` VALUES (700, '姓名_97');
INSERT INTO `t_dept` VALUES (701, '姓名_98');
INSERT INTO `t_dept` VALUES (702, '姓名_99');
INSERT INTO `t_dept` VALUES (703, '姓名_100');

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp`  (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES (1, '钱钱钱', 1, '男', NULL);
INSERT INTO `t_emp` VALUES (2, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (3, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (4, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (5, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (6, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (7, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (8, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (9, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (10, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (11, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (12, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (13, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (14, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (15, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (16, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (17, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (18, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (19, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (20, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (21, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (22, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (23, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (24, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (25, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (26, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (27, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (28, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (29, 'aaa', NULL, NULL, NULL);
INSERT INTO `t_emp` VALUES (30, 'aaa', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'root', '123', 23, '男', '12345@qq.com');
INSERT INTO `t_user` VALUES (2, 'admin', '123456', 23, '男', '12345@qq.com');
INSERT INTO `t_user` VALUES (4, 'insert', '123456', 33, '女', '123@qq.com');

-- ----------------------------
-- Procedure structure for addTestData
-- ----------------------------
DROP PROCEDURE IF EXISTS `addTestData`;
delimiter ;;
CREATE PROCEDURE `addTestData`()
begin
declare number int;
set number = 1;
while number <= 100 #插入N条数据
do
insert into t_dept(dept_id,dept_name)
values(null,concat('姓名_',number));  # 为了区分姓名，我们加上后缀
set number = number + 1;
end
while;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
