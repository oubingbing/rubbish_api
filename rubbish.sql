/*
 Navicat Premium Data Transfer

 Source Server         : 华为
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 139.159.243.207:3306
 Source Schema         : heping

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 09/11/2022 13:38:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '笔记的标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '笔记内容',
  `attachments` json NULL COMMENT '封面图片，暂时为空',
  `from_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '来源类型1=官网，2=第三方',
  `category_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '文章类型,1=攻略，2=新闻资讯，3=妖灵图鉴',
  `strategy_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '攻略类型，1=图灵攻略，2=官方，3=新手指南，活动玩法',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态',
  `game` tinyint(4) NOT NULL DEFAULT 3 COMMENT '所属游戏，1=和平精英，2=垃圾分类，3=云顶之弈,4=自走棋',
  `posted_at` timestamp(0) NULL DEFAULT NULL COMMENT '发布日期',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `articles_posted_at_index`(`posted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16972 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : 华为
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 139.159.243.207:3306
 Source Schema         : heping

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 09/11/2022 13:39:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for examinations
-- ----------------------------
DROP TABLE IF EXISTS `examinations`;
CREATE TABLE `examinations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `answer` json NULL COMMENT '答题结果',
  `total` int(11) NOT NULL DEFAULT 0 COMMENT '题目数量',
  `right` int(11) NOT NULL DEFAULT 0 COMMENT '正确数',
  `error` int(11) NOT NULL DEFAULT 0 COMMENT '正确数',
  `score` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '得分',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : 华为
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 139.159.243.207:3306
 Source Schema         : heping

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 09/11/2022 13:39:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


/*
 Navicat Premium Data Transfer

 Source Server         : 华为
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 139.159.243.207:3306
 Source Schema         : heping

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 09/11/2022 13:39:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qiniu_tokens
-- ----------------------------
DROP TABLE IF EXISTS `qiniu_tokens`;
CREATE TABLE `qiniu_tokens`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `token` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '七牛上传的凭证',
  `expired_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '过期时间时间',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '该记录创建的时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qiniu_tokens_expired_at_index`(`expired_at`) USING BTREE,
  INDEX `qiniu_tokens_created_at_index`(`created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


/*
 Navicat Premium Data Transfer

 Source Server         : 华为
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 139.159.243.207:3306
 Source Schema         : heping

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 09/11/2022 13:39:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rubbish_categories
-- ----------------------------
DROP TABLE IF EXISTS `rubbish_categories`;
CREATE TABLE `rubbish_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `father_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父类分级ID',
  `level` tinyint(4) NOT NULL DEFAULT 1 COMMENT '分类等级，1=一级，2=二级',
  `describe` json NULL COMMENT '分类描述',
  `attachments` json NULL COMMENT '附件',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rubbish_categories_name_index`(`name`) USING BTREE,
  INDEX `rubbish_categories_father_id_index`(`father_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rubbish_categories
-- ----------------------------
INSERT INTO `rubbish_categories` VALUES (1, '可回收物', NULL, 1, NULL, '[\"/images/kehuishou.png\"]', NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (2, '有害垃圾', NULL, 1, NULL, '[\"/images/youhai.png\"]', NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (3, '湿垃圾', NULL, 1, NULL, '[\"/images/shi.png\"]', NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (4, '干垃圾', NULL, 1, NULL, '[\"/images/gan.png\"]', NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (5, '废纸张', '1', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (6, '废塑料', '1', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (7, '废玻璃制品', '1', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (8, '废金属', '1', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (9, '废织物', '1', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (11, '废镍镉电池和废氧化汞电池', '2', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (12, '废荧光灯管', '2', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (13, '废药品及其包装物', '2', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (14, '废油漆和溶剂及其包装物', '2', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (15, '废含汞温度计和血压计', '2', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (16, '废杀虫剂消毒剂及其包装物', '2', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (17, '废胶片及废相纸', '2', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (18, '食材废料', '3', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (19, '剩饭剩菜', '3', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (20, '过期食品', '3', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (21, '瓜皮果核', '3', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (22, '花卉植物', '3', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (23, '其他', '1', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (24, '其他', '2', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (25, '其他', '3', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (26, '其他', '4', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `rubbish_categories` VALUES (27, '干垃圾', '4', 2, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;


/*
 Navicat Premium Data Transfer

 Source Server         : 华为
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 139.159.243.207:3306
 Source Schema         : heping

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 09/11/2022 13:39:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rubbishs
-- ----------------------------
DROP TABLE IF EXISTS `rubbishs`;
CREATE TABLE `rubbishs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `category_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类',
  `category_grandpa_id` int(11) NOT NULL DEFAULT 0 COMMENT '顶级分类',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=官方垃圾，2=收集的垃圾库',
  `attachments` json NULL COMMENT '附件',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rubbishs_name_index`(`name`) USING BTREE,
  INDEX `rubbishs_category_id_index`(`category_id`) USING BTREE,
  INDEX `rubbishs_category_grandpa_id_index`(`category_grandpa_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 583 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rubbishs
-- ----------------------------
INSERT INTO `rubbishs` VALUES (1, '报纸', 5, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (2, '纸箱', 5, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (3, '书本', 5, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (4, '纸塑铝复合包装', 5, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (5, '纸袋', 5, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (6, '信封', 5, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (7, '塑料瓶', 6, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (8, '玩具', 6, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (9, '油桶', 6, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (10, '乳液罐', 6, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (11, '食品保鲜盒', 6, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (12, '泡沫塑料', 6, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (13, '衣架', 6, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (14, '酒瓶', 7, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (15, '玻璃杯', 7, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (16, '玻璃放大镜', 7, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (17, '玻璃窗', 7, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (18, '碎玻璃', 7, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (19, '易拉罐', 8, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (20, '锅', 8, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (21, '螺丝刀', 8, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (22, '刀', 8, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (23, '床单', 9, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (24, '枕头', 9, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (25, '毛绒玩具', 9, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (26, '电路板', 23, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (27, '电线', 23, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (28, '插座', 23, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (29, '木积木', 23, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (30, '砧板', 23, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (31, '充电电池', 11, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (32, '镍镉电池', 11, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (33, '铅酸电池', 11, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (34, '蓄电池', 11, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (35, '纽扣电池', 11, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (36, '荧光灯', 12, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (37, '节能灯', 12, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (38, '卤素等', 12, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (39, '过期药品', 13, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (40, '药品包装', 13, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (41, '药片', 13, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (42, '过期胶囊药片', 13, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (43, '染发剂壳', 14, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (44, '废油漆桶', 14, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (45, '洗甲水', 14, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (46, '过期指甲油', 14, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (47, '水银血压计', 15, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (48, '水银体温计', 15, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (49, '消毒剂', 16, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (50, '老鼠药', 16, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (51, '杀虫喷雾', 16, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (52, 'X光片', 17, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (53, '感光片', 17, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (54, '相片底片', 17, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (55, '谷物及其加工食品', 18, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (56, '肉蛋及其加工食品', 18, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (57, '水产及其加工食品', 18, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (58, '蔬菜', 18, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (59, '调料', 18, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (60, '酱料', 18, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (61, '火锅汤底', 19, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (62, '鱼骨', 19, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (63, '碎骨', 19, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (64, '茶叶渣', 19, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (65, '咖啡渣', 19, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (66, '中药药渣', 19, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (67, '糕饼', 20, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (68, '糖果', 20, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (69, '风干食品', 20, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (70, '粉末类食品', 20, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (71, '宠物饲料', 20, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (72, '水果果肉', 21, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (73, '水果果皮', 21, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (74, '水果茎枝', 21, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (75, '果实', 21, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (76, '家养绿植', 22, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (77, '花卉', 22, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (78, '花瓣', 22, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (79, '枝叶', 22, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (80, '干果仁', 22, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (81, '动物内脏', 22, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (82, '蛋壳', 22, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (83, '餐巾纸', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (84, '卫生间用纸', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (85, '烟蒂', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (86, '陶瓷花盆', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (87, '纸尿裤', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (88, '胶带', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (89, '橡皮泥', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (90, '笔', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (91, '创可贴', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (92, '灰土', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (93, '头发', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (94, '眼镜', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (95, '防碎气泡膜', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (96, '内衣裤', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (97, '污损纸张', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (98, '旧毛巾', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (99, '破碎陶瓷碗', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (100, '污损塑料袋', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (101, '玩具', 27, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (102, '指甲钳', 8, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (103, '刀片', 8, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (104, '衣服', 9, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (105, '皮鞋', 9, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (121, '苹果', 0, 3, 2, NULL, '2019-07-05 12:29:21', '2019-07-05 12:29:21', NULL);
INSERT INTO `rubbishs` VALUES (122, '烂苹果', 0, 3, 2, NULL, '2019-07-05 12:29:21', '2019-07-05 12:29:21', NULL);
INSERT INTO `rubbishs` VALUES (123, '苹果核', 0, 3, 2, NULL, '2019-07-05 12:29:21', '2019-07-05 12:29:21', NULL);
INSERT INTO `rubbishs` VALUES (124, '笔袋', 0, 4, 2, NULL, '2019-07-05 12:55:33', '2019-07-05 12:55:33', NULL);
INSERT INTO `rubbishs` VALUES (125, '手表', 0, 1, 2, NULL, '2019-07-05 12:55:48', '2019-07-05 12:55:48', NULL);
INSERT INTO `rubbishs` VALUES (126, '电话手表', 0, 1, 2, NULL, '2019-07-05 12:55:48', '2019-07-05 12:55:48', NULL);
INSERT INTO `rubbishs` VALUES (127, '电子手表', 0, 1, 2, NULL, '2019-07-05 12:55:49', '2019-07-05 12:55:49', NULL);
INSERT INTO `rubbishs` VALUES (128, '鼠标垫', 0, 4, 2, NULL, '2019-07-05 12:56:57', '2019-07-05 12:56:57', NULL);
INSERT INTO `rubbishs` VALUES (129, '鼠标', 0, 1, 2, NULL, '2019-07-05 12:56:57', '2019-07-05 12:56:57', NULL);
INSERT INTO `rubbishs` VALUES (130, '鱼', 0, 3, 2, NULL, '2019-07-05 13:40:26', '2019-07-05 13:40:26', NULL);
INSERT INTO `rubbishs` VALUES (131, '鲍鱼', 0, 3, 2, NULL, '2019-07-05 13:40:26', '2019-07-05 13:40:26', NULL);
INSERT INTO `rubbishs` VALUES (132, '黄鱼', 0, 3, 2, NULL, '2019-07-05 13:40:26', '2019-07-05 13:40:26', NULL);
INSERT INTO `rubbishs` VALUES (133, '别针', 0, 4, 2, NULL, '2019-07-05 13:47:26', '2019-07-05 13:47:26', NULL);
INSERT INTO `rubbishs` VALUES (134, '针', 0, 4, 2, NULL, '2019-07-05 13:47:26', '2019-07-05 13:47:26', NULL);
INSERT INTO `rubbishs` VALUES (135, '玻璃杯子', 0, 1, 2, NULL, '2019-07-05 13:57:20', '2019-07-05 13:57:20', NULL);
INSERT INTO `rubbishs` VALUES (136, '瓷器杯子', 0, 4, 2, NULL, '2019-07-05 13:57:20', '2019-07-05 13:57:20', NULL);
INSERT INTO `rubbishs` VALUES (137, '奶茶杯子', 0, 4, 2, NULL, '2019-07-05 13:57:21', '2019-07-05 13:57:21', NULL);
INSERT INTO `rubbishs` VALUES (138, '书', 0, 1, 2, NULL, '2019-07-05 14:01:50', '2019-07-05 14:01:50', NULL);
INSERT INTO `rubbishs` VALUES (139, '废书', 0, 1, 2, NULL, '2019-07-05 14:01:50', '2019-07-05 14:01:50', NULL);
INSERT INTO `rubbishs` VALUES (140, '旧书', 0, 1, 2, NULL, '2019-07-05 14:01:50', '2019-07-05 14:01:50', NULL);
INSERT INTO `rubbishs` VALUES (141, '拖鞋', 0, 1, 2, NULL, '2019-07-05 14:43:39', '2019-07-05 14:43:39', NULL);
INSERT INTO `rubbishs` VALUES (142, '鞋', 0, 1, 2, NULL, '2019-07-05 14:43:39', '2019-07-05 14:43:39', NULL);
INSERT INTO `rubbishs` VALUES (143, '一次性拖鞋', 0, 4, 2, NULL, '2019-07-05 14:43:40', '2019-07-05 14:43:40', NULL);
INSERT INTO `rubbishs` VALUES (144, '发胶', 0, 4, 2, NULL, '2019-07-05 14:45:11', '2019-07-05 14:45:11', NULL);
INSERT INTO `rubbishs` VALUES (145, '发蜡', 0, 4, 2, NULL, '2019-07-05 14:45:11', '2019-07-05 14:45:11', NULL);
INSERT INTO `rubbishs` VALUES (146, '发票', 0, 4, 2, NULL, '2019-07-05 14:45:12', '2019-07-05 14:45:12', NULL);
INSERT INTO `rubbishs` VALUES (147, '鸡腿', 0, 3, 2, NULL, '2019-07-05 14:45:43', '2019-07-05 14:45:43', NULL);
INSERT INTO `rubbishs` VALUES (148, '鸡', 0, 3, 2, NULL, '2019-07-05 14:45:44', '2019-07-05 14:45:44', NULL);
INSERT INTO `rubbishs` VALUES (149, '鸡腿骨', 0, 3, 2, NULL, '2019-07-05 14:45:44', '2019-07-05 14:45:44', NULL);
INSERT INTO `rubbishs` VALUES (150, '玉米', 0, 3, 2, NULL, '2019-07-05 14:46:14', '2019-07-05 14:46:14', NULL);
INSERT INTO `rubbishs` VALUES (151, '米', 0, 3, 2, NULL, '2019-07-05 14:46:15', '2019-07-05 14:46:15', NULL);
INSERT INTO `rubbishs` VALUES (152, '玉', 0, 4, 2, NULL, '2019-07-05 14:46:15', '2019-07-05 14:46:15', NULL);
INSERT INTO `rubbishs` VALUES (153, '手套', 0, 1, 2, NULL, '2019-07-05 14:46:33', '2019-07-05 14:46:33', NULL);
INSERT INTO `rubbishs` VALUES (154, '皮手套', 0, 1, 2, NULL, '2019-07-05 14:46:33', '2019-07-05 14:46:33', NULL);
INSERT INTO `rubbishs` VALUES (155, '纱手套', 0, 1, 2, NULL, '2019-07-05 14:46:33', '2019-07-05 14:46:33', NULL);
INSERT INTO `rubbishs` VALUES (156, '其他垃圾桶', 0, 1, 2, NULL, '2019-07-05 17:28:55', '2019-07-05 17:28:55', NULL);
INSERT INTO `rubbishs` VALUES (157, '橡皮', 0, 4, 2, NULL, '2019-07-05 17:29:25', '2019-07-05 17:29:25', NULL);
INSERT INTO `rubbishs` VALUES (158, '橡皮擦', 0, 4, 2, NULL, '2019-07-05 17:29:25', '2019-07-05 17:29:25', NULL);
INSERT INTO `rubbishs` VALUES (159, '橡皮筋', 0, 4, 2, NULL, '2019-07-05 17:29:25', '2019-07-05 17:29:25', NULL);
INSERT INTO `rubbishs` VALUES (160, '香烟', 0, 4, 2, NULL, '2019-07-05 17:29:26', '2019-07-05 17:29:26', NULL);
INSERT INTO `rubbishs` VALUES (161, '香烟蒂', 0, 4, 2, NULL, '2019-07-05 17:29:26', '2019-07-05 17:29:26', NULL);
INSERT INTO `rubbishs` VALUES (162, '香烟盒', 0, 1, 2, NULL, '2019-07-05 17:29:26', '2019-07-05 17:29:26', NULL);
INSERT INTO `rubbishs` VALUES (163, '废鼠标', 0, 1, 2, NULL, '2019-07-05 18:08:02', '2019-07-05 18:08:02', NULL);
INSERT INTO `rubbishs` VALUES (164, '旧鼠标', 0, 1, 2, NULL, '2019-07-05 18:08:02', '2019-07-05 18:08:02', NULL);
INSERT INTO `rubbishs` VALUES (165, '饰品', 0, 4, 2, NULL, '2019-07-05 18:08:02', '2019-07-05 18:08:02', NULL);
INSERT INTO `rubbishs` VALUES (166, 'cd', 0, 1, 2, NULL, '2019-07-05 18:08:03', '2019-07-05 18:08:03', NULL);
INSERT INTO `rubbishs` VALUES (167, '飞机杯', 0, 4, 2, NULL, '2019-07-05 18:09:05', '2019-07-05 18:09:05', NULL);
INSERT INTO `rubbishs` VALUES (168, '螺丝', 0, 1, 2, NULL, '2019-07-05 18:14:43', '2019-07-05 18:14:43', NULL);
INSERT INTO `rubbishs` VALUES (169, '圆珠笔', 0, 4, 2, NULL, '2019-07-05 18:14:43', '2019-07-05 18:14:43', NULL);
INSERT INTO `rubbishs` VALUES (170, '圆珠笔杆', 0, 4, 2, NULL, '2019-07-05 18:14:43', '2019-07-05 18:14:43', NULL);
INSERT INTO `rubbishs` VALUES (171, '圆珠笔芯', 0, 4, 2, NULL, '2019-07-05 18:14:43', '2019-07-05 18:14:43', NULL);
INSERT INTO `rubbishs` VALUES (172, '钢笔', 0, 4, 2, NULL, '2019-07-05 18:14:44', '2019-07-05 18:14:44', NULL);
INSERT INTO `rubbishs` VALUES (173, '坏钢笔', 0, 4, 2, NULL, '2019-07-05 18:14:44', '2019-07-05 18:14:44', NULL);
INSERT INTO `rubbishs` VALUES (174, '画笔', 0, 4, 2, NULL, '2019-07-05 18:14:44', '2019-07-05 18:14:44', NULL);
INSERT INTO `rubbishs` VALUES (175, '袜子', 0, 1, 2, NULL, '2019-07-05 18:25:27', '2019-07-05 18:25:27', NULL);
INSERT INTO `rubbishs` VALUES (176, '臭袜子', 0, 4, 2, NULL, '2019-07-05 18:25:27', '2019-07-05 18:25:27', NULL);
INSERT INTO `rubbishs` VALUES (177, '旧袜子', 0, 4, 2, NULL, '2019-07-05 18:25:27', '2019-07-05 18:25:27', NULL);
INSERT INTO `rubbishs` VALUES (178, '钥匙', 0, 1, 2, NULL, '2019-07-05 18:25:59', '2019-07-05 18:25:59', NULL);
INSERT INTO `rubbishs` VALUES (179, '车钥匙', 0, 4, 2, NULL, '2019-07-05 18:26:00', '2019-07-05 18:26:00', NULL);
INSERT INTO `rubbishs` VALUES (180, '卷笔刀', 0, 4, 2, NULL, '2019-07-05 18:26:01', '2019-07-05 18:26:01', NULL);
INSERT INTO `rubbishs` VALUES (181, '坏发卡', 0, 4, 2, NULL, '2019-07-05 18:26:01', '2019-07-05 18:26:01', NULL);
INSERT INTO `rubbishs` VALUES (182, '卡', 0, 4, 2, NULL, '2019-07-05 18:26:01', '2019-07-05 18:26:01', NULL);
INSERT INTO `rubbishs` VALUES (183, '打火机', 0, 4, 2, NULL, '2019-07-05 18:26:02', '2019-07-05 18:26:02', NULL);
INSERT INTO `rubbishs` VALUES (184, '打火机油', 0, 4, 2, NULL, '2019-07-05 18:26:02', '2019-07-05 18:26:02', NULL);
INSERT INTO `rubbishs` VALUES (185, '火机', 0, 4, 2, NULL, '2019-07-05 18:26:02', '2019-07-05 18:26:02', NULL);
INSERT INTO `rubbishs` VALUES (186, '风扇', 0, 1, 2, NULL, '2019-07-05 18:27:40', '2019-07-05 18:27:40', NULL);
INSERT INTO `rubbishs` VALUES (187, '电风扇', 0, 1, 2, NULL, '2019-07-05 18:27:40', '2019-07-05 18:27:40', NULL);
INSERT INTO `rubbishs` VALUES (188, '空调两用风扇', 0, 1, 2, NULL, '2019-07-05 18:27:41', '2019-07-05 18:27:41', NULL);
INSERT INTO `rubbishs` VALUES (189, '小刀', 0, 1, 2, NULL, '2019-07-05 21:31:15', '2019-07-05 21:31:15', NULL);
INSERT INTO `rubbishs` VALUES (190, '肉', 0, 3, 2, NULL, '2019-07-05 21:31:16', '2019-07-05 21:31:16', NULL);
INSERT INTO `rubbishs` VALUES (191, '药瓶', 0, 2, 2, NULL, '2019-07-05 21:31:56', '2019-07-05 21:31:56', NULL);
INSERT INTO `rubbishs` VALUES (192, '废药瓶', 0, 2, 2, NULL, '2019-07-05 21:31:56', '2019-07-05 21:31:56', NULL);
INSERT INTO `rubbishs` VALUES (193, '空药瓶', 0, 2, 2, NULL, '2019-07-05 21:31:56', '2019-07-05 21:31:56', NULL);
INSERT INTO `rubbishs` VALUES (194, '筷子', 0, 4, 2, NULL, '2019-07-05 21:32:56', '2019-07-05 21:32:56', NULL);
INSERT INTO `rubbishs` VALUES (195, '旧筷子', 0, 4, 2, NULL, '2019-07-05 21:32:56', '2019-07-05 21:32:56', NULL);
INSERT INTO `rubbishs` VALUES (196, '木筷子', 0, 1, 2, NULL, '2019-07-05 21:32:57', '2019-07-05 21:32:57', NULL);
INSERT INTO `rubbishs` VALUES (197, '布鞋', 0, 1, 2, NULL, '2019-07-05 21:33:46', '2019-07-05 21:33:46', NULL);
INSERT INTO `rubbishs` VALUES (198, '旧鞋', 0, 1, 2, NULL, '2019-07-05 21:33:46', '2019-07-05 21:33:46', NULL);
INSERT INTO `rubbishs` VALUES (199, '吸尘器', 0, 1, 2, NULL, '2019-07-05 21:34:08', '2019-07-05 21:34:08', NULL);
INSERT INTO `rubbishs` VALUES (200, '吸尘器垃圾', 0, 4, 2, NULL, '2019-07-05 21:34:08', '2019-07-05 21:34:08', NULL);
INSERT INTO `rubbishs` VALUES (201, '铁锤', 0, 1, 2, NULL, '2019-07-05 21:34:08', '2019-07-05 21:34:08', NULL);
INSERT INTO `rubbishs` VALUES (202, '铁', 0, 1, 2, NULL, '2019-07-05 21:34:08', '2019-07-05 21:34:08', NULL);
INSERT INTO `rubbishs` VALUES (203, '面', 0, 3, 2, NULL, '2019-07-05 21:34:09', '2019-07-05 21:34:09', NULL);
INSERT INTO `rubbishs` VALUES (204, '电熨斗', 0, 1, 2, NULL, '2019-07-05 21:34:58', '2019-07-05 21:34:58', NULL);
INSERT INTO `rubbishs` VALUES (205, '电水壶', 0, 1, 2, NULL, '2019-07-05 21:34:59', '2019-07-05 21:34:59', NULL);
INSERT INTO `rubbishs` VALUES (206, '暖水壶', 0, 1, 2, NULL, '2019-07-05 21:34:59', '2019-07-05 21:34:59', NULL);
INSERT INTO `rubbishs` VALUES (207, '电热水壶', 0, 1, 2, NULL, '2019-07-05 21:34:59', '2019-07-05 21:34:59', NULL);
INSERT INTO `rubbishs` VALUES (208, '旧枕头', 0, 1, 2, NULL, '2019-07-05 21:36:46', '2019-07-05 21:36:46', NULL);
INSERT INTO `rubbishs` VALUES (209, '碎布料枕头', 0, 1, 2, NULL, '2019-07-05 21:36:47', '2019-07-05 21:36:47', NULL);
INSERT INTO `rubbishs` VALUES (210, '围裙', 0, 1, 2, NULL, '2019-07-05 21:36:47', '2019-07-05 21:36:47', NULL);
INSERT INTO `rubbishs` VALUES (211, '手帕', 0, 4, 2, NULL, '2019-07-05 21:36:47', '2019-07-05 21:36:47', NULL);
INSERT INTO `rubbishs` VALUES (212, '包包', 0, 1, 2, NULL, '2019-07-05 21:36:48', '2019-07-05 21:36:48', NULL);
INSERT INTO `rubbishs` VALUES (213, '包子', 0, 3, 2, NULL, '2019-07-05 21:36:48', '2019-07-05 21:36:48', NULL);
INSERT INTO `rubbishs` VALUES (214, '布包', 0, 1, 2, NULL, '2019-07-05 21:36:48', '2019-07-05 21:36:48', NULL);
INSERT INTO `rubbishs` VALUES (215, '浴巾', 0, 4, 2, NULL, '2019-07-05 21:36:48', '2019-07-05 21:36:48', NULL);
INSERT INTO `rubbishs` VALUES (216, '面包', 0, 3, 2, NULL, '2019-07-05 21:37:16', '2019-07-05 21:37:16', NULL);
INSERT INTO `rubbishs` VALUES (217, '笔记本电脑', 0, 1, 2, NULL, '2019-07-05 21:38:49', '2019-07-05 21:38:49', NULL);
INSERT INTO `rubbishs` VALUES (218, '笔记本', 0, 1, 2, NULL, '2019-07-05 21:38:49', '2019-07-05 21:38:49', NULL);
INSERT INTO `rubbishs` VALUES (219, '电脑', 0, 1, 2, NULL, '2019-07-05 21:38:49', '2019-07-05 21:38:49', NULL);
INSERT INTO `rubbishs` VALUES (220, '显示器', 0, 1, 2, NULL, '2019-07-05 21:38:50', '2019-07-05 21:38:50', NULL);
INSERT INTO `rubbishs` VALUES (221, '食物托盘', 0, 1, 2, NULL, '2019-07-05 22:08:56', '2019-07-05 22:08:56', NULL);
INSERT INTO `rubbishs` VALUES (222, '塑料托盘', 0, 1, 2, NULL, '2019-07-05 22:08:56', '2019-07-05 22:08:56', NULL);
INSERT INTO `rubbishs` VALUES (223, '相框', 0, 1, 2, NULL, '2019-07-05 22:08:56', '2019-07-05 22:08:56', NULL);
INSERT INTO `rubbishs` VALUES (224, '电视机', 0, 1, 2, NULL, '2019-07-05 22:08:57', '2019-07-05 22:08:57', NULL);
INSERT INTO `rubbishs` VALUES (225, '电视', 0, 1, 2, NULL, '2019-07-05 22:08:57', '2019-07-05 22:08:57', NULL);
INSERT INTO `rubbishs` VALUES (226, '坏电视机', 0, 1, 2, NULL, '2019-07-05 22:08:57', '2019-07-05 22:08:57', NULL);
INSERT INTO `rubbishs` VALUES (227, '用的创可贴', 0, 4, 2, NULL, '2019-07-05 22:09:45', '2019-07-05 22:09:45', NULL);
INSERT INTO `rubbishs` VALUES (228, '使用过的创可贴', 0, 4, 2, NULL, '2019-07-05 22:09:45', '2019-07-05 22:09:45', NULL);
INSERT INTO `rubbishs` VALUES (229, '手机', 0, 1, 2, NULL, '2019-07-05 22:09:46', '2019-07-05 22:09:46', NULL);
INSERT INTO `rubbishs` VALUES (230, '废手机', 0, 1, 2, NULL, '2019-07-05 22:09:46', '2019-07-05 22:09:46', NULL);
INSERT INTO `rubbishs` VALUES (231, '坏手机', 0, 1, 2, NULL, '2019-07-05 22:09:46', '2019-07-05 22:09:46', NULL);
INSERT INTO `rubbishs` VALUES (232, '纸巾', 0, 4, 2, NULL, '2019-07-05 22:10:19', '2019-07-05 22:10:19', NULL);
INSERT INTO `rubbishs` VALUES (233, '干纸巾', 0, 4, 2, NULL, '2019-07-05 22:10:20', '2019-07-05 22:10:20', NULL);
INSERT INTO `rubbishs` VALUES (234, '湿纸巾', 0, 4, 2, NULL, '2019-07-05 22:10:20', '2019-07-05 22:10:20', NULL);
INSERT INTO `rubbishs` VALUES (235, '键盘', 0, 1, 2, NULL, '2019-07-05 22:11:17', '2019-07-05 22:11:17', NULL);
INSERT INTO `rubbishs` VALUES (236, '废键盘', 0, 1, 2, NULL, '2019-07-05 22:11:17', '2019-07-05 22:11:17', NULL);
INSERT INTO `rubbishs` VALUES (237, '旧背包', 0, 1, 2, NULL, '2019-07-05 22:12:05', '2019-07-05 22:12:05', NULL);
INSERT INTO `rubbishs` VALUES (238, '无花果壳', 0, 3, 2, NULL, '2019-07-05 22:12:55', '2019-07-05 22:12:55', NULL);
INSERT INTO `rubbishs` VALUES (239, '花', 0, 3, 2, NULL, '2019-07-05 22:12:55', '2019-07-05 22:12:55', NULL);
INSERT INTO `rubbishs` VALUES (240, '石榴皮', 0, 3, 2, NULL, '2019-07-05 22:12:55', '2019-07-05 22:12:55', NULL);
INSERT INTO `rubbishs` VALUES (241, '虫', 0, 3, 2, NULL, '2019-07-05 22:12:56', '2019-07-05 22:12:56', NULL);
INSERT INTO `rubbishs` VALUES (242, '面包机', 0, 1, 2, NULL, '2019-07-05 22:14:27', '2019-07-05 22:14:27', NULL);
INSERT INTO `rubbishs` VALUES (243, '放大镜', 0, 1, 2, NULL, '2019-07-05 22:16:37', '2019-07-05 22:16:37', NULL);
INSERT INTO `rubbishs` VALUES (244, '硬盘', 0, 1, 2, NULL, '2019-07-05 22:17:53', '2019-07-05 22:17:53', NULL);
INSERT INTO `rubbishs` VALUES (245, '移动硬盘', 0, 1, 2, NULL, '2019-07-05 22:17:53', '2019-07-05 22:17:53', NULL);
INSERT INTO `rubbishs` VALUES (246, '乳液瓶', 0, 1, 2, NULL, '2019-07-05 22:19:15', '2019-07-05 22:19:15', NULL);
INSERT INTO `rubbishs` VALUES (247, '冰箱', 0, 1, 2, NULL, '2019-07-05 22:19:15', '2019-07-05 22:19:15', NULL);
INSERT INTO `rubbishs` VALUES (248, '电冰箱', 0, 1, 2, NULL, '2019-07-05 22:19:15', '2019-07-05 22:19:15', NULL);
INSERT INTO `rubbishs` VALUES (249, '旧冰箱', 0, 1, 2, NULL, '2019-07-05 22:19:16', '2019-07-05 22:19:16', NULL);
INSERT INTO `rubbishs` VALUES (250, '防晒霜', 0, 4, 2, NULL, '2019-07-05 22:19:16', '2019-07-05 22:19:16', NULL);
INSERT INTO `rubbishs` VALUES (251, '防晒霜罐', 0, 1, 2, NULL, '2019-07-05 22:19:16', '2019-07-05 22:19:16', NULL);
INSERT INTO `rubbishs` VALUES (252, '带防晒霜的防晒霜罐', 0, 4, 2, NULL, '2019-07-05 22:19:16', '2019-07-05 22:19:16', NULL);
INSERT INTO `rubbishs` VALUES (253, '菜', 0, 3, 2, NULL, '2019-07-05 22:19:59', '2019-07-05 22:19:59', NULL);
INSERT INTO `rubbishs` VALUES (254, '电锅', 0, 1, 2, NULL, '2019-07-05 22:19:59', '2019-07-05 22:19:59', NULL);
INSERT INTO `rubbishs` VALUES (255, '锅巴', 0, 3, 2, NULL, '2019-07-05 22:19:59', '2019-07-05 22:19:59', NULL);
INSERT INTO `rubbishs` VALUES (256, '垃圾箱', 0, 1, 2, NULL, '2019-07-05 22:20:00', '2019-07-05 22:20:00', NULL);
INSERT INTO `rubbishs` VALUES (257, '菜花', 0, 3, 2, NULL, '2019-07-05 22:20:00', '2019-07-05 22:20:00', NULL);
INSERT INTO `rubbishs` VALUES (258, '盘子', 0, 4, 2, NULL, '2019-07-05 22:26:04', '2019-07-05 22:26:04', NULL);
INSERT INTO `rubbishs` VALUES (259, '玻璃盘子', 0, 1, 2, NULL, '2019-07-05 22:26:04', '2019-07-05 22:26:04', NULL);
INSERT INTO `rubbishs` VALUES (260, '肉包', 0, 3, 2, NULL, '2019-07-05 22:26:04', '2019-07-05 22:26:04', NULL);
INSERT INTO `rubbishs` VALUES (261, '黄瓜', 0, 3, 2, NULL, '2019-07-05 22:26:05', '2019-07-05 22:26:05', NULL);
INSERT INTO `rubbishs` VALUES (262, '瓜', 0, 3, 2, NULL, '2019-07-05 22:26:05', '2019-07-05 22:26:05', NULL);
INSERT INTO `rubbishs` VALUES (263, '黄瓜皮', 0, 3, 2, NULL, '2019-07-05 22:26:05', '2019-07-05 22:26:05', NULL);
INSERT INTO `rubbishs` VALUES (264, '草莓', 0, 3, 2, NULL, '2019-07-05 22:26:05', '2019-07-05 22:26:05', NULL);
INSERT INTO `rubbishs` VALUES (265, '草', 0, 3, 2, NULL, '2019-07-05 22:26:06', '2019-07-05 22:26:06', NULL);
INSERT INTO `rubbishs` VALUES (266, '钟表', 0, 1, 2, NULL, '2019-07-06 00:10:30', '2019-07-06 00:10:30', NULL);
INSERT INTO `rubbishs` VALUES (267, '钟', 0, 4, 2, NULL, '2019-07-06 00:10:30', '2019-07-06 00:10:30', NULL);
INSERT INTO `rubbishs` VALUES (268, '塑料钟表', 0, 1, 2, NULL, '2019-07-06 00:10:30', '2019-07-06 00:10:30', NULL);
INSERT INTO `rubbishs` VALUES (269, '饭', 0, 3, 2, NULL, '2019-07-06 00:11:28', '2019-07-06 00:11:28', NULL);
INSERT INTO `rubbishs` VALUES (270, '菜饭', 0, 3, 2, NULL, '2019-07-06 00:11:28', '2019-07-06 00:11:28', NULL);
INSERT INTO `rubbishs` VALUES (271, '饭菜', 0, 3, 2, NULL, '2019-07-06 00:11:28', '2019-07-06 00:11:28', NULL);
INSERT INTO `rubbishs` VALUES (272, '墨水瓶', 0, 1, 2, NULL, '2019-07-06 00:12:30', '2019-07-06 00:12:30', NULL);
INSERT INTO `rubbishs` VALUES (273, '酒瓶子', 0, 1, 2, NULL, '2019-07-06 00:12:30', '2019-07-06 00:12:30', NULL);
INSERT INTO `rubbishs` VALUES (274, '铝瓶子', 0, 1, 2, NULL, '2019-07-06 00:12:30', '2019-07-06 00:12:30', NULL);
INSERT INTO `rubbishs` VALUES (275, '铁瓶子', 0, 1, 2, NULL, '2019-07-06 00:12:30', '2019-07-06 00:12:30', NULL);
INSERT INTO `rubbishs` VALUES (276, '叶', 0, 3, 2, NULL, '2019-07-06 00:48:16', '2019-07-06 00:48:16', NULL);
INSERT INTO `rubbishs` VALUES (277, '扫帚', 0, 4, 2, NULL, '2019-07-06 00:48:16', '2019-07-06 00:48:16', NULL);
INSERT INTO `rubbishs` VALUES (278, '鹅', 0, 3, 2, NULL, '2019-07-06 00:48:17', '2019-07-06 00:48:17', NULL);
INSERT INTO `rubbishs` VALUES (279, '碗', 0, 4, 2, NULL, '2019-07-06 00:48:40', '2019-07-06 00:48:40', NULL);
INSERT INTO `rubbishs` VALUES (280, '蚊帐', 0, 1, 2, NULL, '2019-07-06 00:48:56', '2019-07-06 00:48:56', NULL);
INSERT INTO `rubbishs` VALUES (281, '牛', 0, 3, 2, NULL, '2019-07-06 00:49:23', '2019-07-06 00:49:23', NULL);
INSERT INTO `rubbishs` VALUES (282, '洗发水桶', 0, 1, 2, NULL, '2019-07-06 10:35:01', '2019-07-06 10:35:01', NULL);
INSERT INTO `rubbishs` VALUES (283, '茶碗', 0, 4, 2, NULL, '2019-07-06 10:35:01', '2019-07-06 10:35:01', NULL);
INSERT INTO `rubbishs` VALUES (284, '纸盒', 0, 1, 2, NULL, '2019-07-06 10:58:59', '2019-07-06 10:58:59', NULL);
INSERT INTO `rubbishs` VALUES (285, '纸', 0, 1, 2, NULL, '2019-07-06 10:58:59', '2019-07-06 10:58:59', NULL);
INSERT INTO `rubbishs` VALUES (286, '毛巾', 0, 4, 2, NULL, '2019-07-06 12:25:25', '2019-07-06 12:25:25', NULL);
INSERT INTO `rubbishs` VALUES (287, '废毛巾', 0, 4, 2, NULL, '2019-07-06 12:25:25', '2019-07-06 12:25:25', NULL);
INSERT INTO `rubbishs` VALUES (288, '干毛巾', 0, 4, 2, NULL, '2019-07-06 12:25:25', '2019-07-06 12:25:25', NULL);
INSERT INTO `rubbishs` VALUES (289, '废毯子', 0, 1, 2, NULL, '2019-07-06 12:25:26', '2019-07-06 12:25:26', NULL);
INSERT INTO `rubbishs` VALUES (290, '塑料毯子', 0, 1, 2, NULL, '2019-07-06 12:25:27', '2019-07-06 12:25:27', NULL);
INSERT INTO `rubbishs` VALUES (291, '毛毯', 0, 1, 2, NULL, '2019-07-06 12:25:27', '2019-07-06 12:25:27', NULL);
INSERT INTO `rubbishs` VALUES (292, '羊毛毯', 0, 1, 2, NULL, '2019-07-06 12:25:28', '2019-07-06 12:25:28', NULL);
INSERT INTO `rubbishs` VALUES (293, '抹布', 0, 4, 2, NULL, '2019-07-06 12:25:29', '2019-07-06 12:25:29', NULL);
INSERT INTO `rubbishs` VALUES (294, '布', 0, 1, 2, NULL, '2019-07-06 12:25:29', '2019-07-06 12:25:29', NULL);
INSERT INTO `rubbishs` VALUES (295, '废抹布', 0, 4, 2, NULL, '2019-07-06 12:25:30', '2019-07-06 12:25:30', NULL);
INSERT INTO `rubbishs` VALUES (296, '头盔', 0, 4, 2, NULL, '2019-07-06 14:26:58', '2019-07-06 14:26:58', NULL);
INSERT INTO `rubbishs` VALUES (297, '啤酒瓶', 0, 1, 2, NULL, '2019-07-06 17:40:31', '2019-07-06 17:40:31', NULL);
INSERT INTO `rubbishs` VALUES (298, '啤酒瓶盖', 0, 1, 2, NULL, '2019-07-06 17:40:31', '2019-07-06 17:40:31', NULL);
INSERT INTO `rubbishs` VALUES (299, '汽水瓶', 0, 1, 2, NULL, '2019-07-06 17:40:32', '2019-07-06 17:40:32', NULL);
INSERT INTO `rubbishs` VALUES (300, '盐', 0, 3, 2, NULL, '2019-07-06 17:40:32', '2019-07-06 17:40:32', NULL);
INSERT INTO `rubbishs` VALUES (301, '残花', 0, 3, 2, NULL, '2019-07-06 17:41:09', '2019-07-06 17:41:09', NULL);
INSERT INTO `rubbishs` VALUES (302, '火柴', 0, 4, 2, NULL, '2019-07-06 17:41:09', '2019-07-06 17:41:09', NULL);
INSERT INTO `rubbishs` VALUES (303, '植物', 0, 3, 2, NULL, '2019-07-06 17:41:10', '2019-07-06 17:41:10', NULL);
INSERT INTO `rubbishs` VALUES (304, '废植物', 0, 3, 2, NULL, '2019-07-06 17:41:10', '2019-07-06 17:41:10', NULL);
INSERT INTO `rubbishs` VALUES (305, '多肉植物', 0, 3, 2, NULL, '2019-07-06 17:41:10', '2019-07-06 17:41:10', NULL);
INSERT INTO `rubbishs` VALUES (306, '电脑包', 0, 1, 2, NULL, '2019-07-06 17:41:39', '2019-07-06 17:41:39', NULL);
INSERT INTO `rubbishs` VALUES (307, '废电脑', 0, 1, 2, NULL, '2019-07-06 17:41:39', '2019-07-06 17:41:39', NULL);
INSERT INTO `rubbishs` VALUES (308, '儿童玩具', 0, 1, 2, NULL, '2019-07-06 17:41:53', '2019-07-06 17:41:53', NULL);
INSERT INTO `rubbishs` VALUES (309, '儿童尿不湿', 0, 4, 2, NULL, '2019-07-06 17:41:53', '2019-07-06 17:41:53', NULL);
INSERT INTO `rubbishs` VALUES (310, '儿童电动玩具', 0, 1, 2, NULL, '2019-07-06 17:41:53', '2019-07-06 17:41:53', NULL);
INSERT INTO `rubbishs` VALUES (311, '塑料篮子', 0, 1, 2, NULL, '2019-07-06 17:41:54', '2019-07-06 17:41:54', NULL);
INSERT INTO `rubbishs` VALUES (312, '旧塑料篮子', 0, 1, 2, NULL, '2019-07-06 17:41:54', '2019-07-06 17:41:54', NULL);
INSERT INTO `rubbishs` VALUES (313, '金属制菜篮子', 0, 1, 2, NULL, '2019-07-06 17:41:54', '2019-07-06 17:41:54', NULL);
INSERT INTO `rubbishs` VALUES (314, '粉笔', 0, 4, 2, NULL, '2019-07-06 17:42:30', '2019-07-06 17:42:30', NULL);
INSERT INTO `rubbishs` VALUES (315, '汉堡', 0, 3, 2, NULL, '2019-07-06 17:42:38', '2019-07-06 17:42:38', NULL);
INSERT INTO `rubbishs` VALUES (316, '芝士', 0, 3, 2, NULL, '2019-07-06 17:42:38', '2019-07-06 17:42:38', NULL);
INSERT INTO `rubbishs` VALUES (317, '梨', 0, 3, 2, NULL, '2019-07-06 17:42:40', '2019-07-06 17:42:40', NULL);
INSERT INTO `rubbishs` VALUES (318, '小龙虾', 0, 3, 2, NULL, '2019-07-06 17:43:03', '2019-07-06 17:43:03', NULL);
INSERT INTO `rubbishs` VALUES (319, '龙虾', 0, 3, 2, NULL, '2019-07-06 17:43:03', '2019-07-06 17:43:03', NULL);
INSERT INTO `rubbishs` VALUES (320, '小龙虾壳', 0, 3, 2, NULL, '2019-07-06 17:43:03', '2019-07-06 17:43:03', NULL);
INSERT INTO `rubbishs` VALUES (321, '虾', 0, 3, 2, NULL, '2019-07-06 17:43:04', '2019-07-06 17:43:04', NULL);
INSERT INTO `rubbishs` VALUES (322, '咖啡', 0, 3, 2, NULL, '2019-07-06 17:43:25', '2019-07-06 17:43:25', NULL);
INSERT INTO `rubbishs` VALUES (323, '巧克力', 0, 3, 2, NULL, '2019-07-06 17:43:26', '2019-07-06 17:43:26', NULL);
INSERT INTO `rubbishs` VALUES (324, '明信片', 0, 1, 2, NULL, '2019-07-06 17:44:09', '2019-07-06 17:44:09', NULL);
INSERT INTO `rubbishs` VALUES (325, '绳子', 0, 4, 2, NULL, '2019-07-06 17:44:10', '2019-07-06 17:44:10', NULL);
INSERT INTO `rubbishs` VALUES (326, '纽扣', 0, 4, 2, NULL, '2019-07-06 17:44:10', '2019-07-06 17:44:10', NULL);
INSERT INTO `rubbishs` VALUES (327, '塑料纽扣', 0, 1, 2, NULL, '2019-07-06 17:44:11', '2019-07-06 17:44:11', NULL);
INSERT INTO `rubbishs` VALUES (328, '项链', 0, 1, 2, NULL, '2019-07-06 17:52:40', '2019-07-06 17:52:40', NULL);
INSERT INTO `rubbishs` VALUES (329, '避孕套', 0, 4, 2, NULL, '2019-07-06 18:00:14', '2019-07-06 18:00:14', NULL);
INSERT INTO `rubbishs` VALUES (330, '用过的避孕套', 0, 4, 2, NULL, '2019-07-06 18:00:14', '2019-07-06 18:00:14', NULL);
INSERT INTO `rubbishs` VALUES (331, '镜子', 0, 4, 2, NULL, '2019-07-06 18:00:36', '2019-07-06 18:00:36', NULL);
INSERT INTO `rubbishs` VALUES (332, '旧镜子', 0, 4, 2, NULL, '2019-07-06 18:00:36', '2019-07-06 18:00:36', NULL);
INSERT INTO `rubbishs` VALUES (333, '过滤器', 0, 4, 2, NULL, '2019-07-06 18:10:30', '2019-07-06 18:10:30', NULL);
INSERT INTO `rubbishs` VALUES (334, '火锅', 0, 3, 2, NULL, '2019-07-06 18:18:10', '2019-07-06 18:18:10', NULL);
INSERT INTO `rubbishs` VALUES (335, '火锅包装', 0, 4, 2, NULL, '2019-07-06 18:18:11', '2019-07-06 18:18:11', NULL);
INSERT INTO `rubbishs` VALUES (336, '注射器', 0, 4, 2, NULL, '2019-07-06 18:26:48', '2019-07-06 18:26:48', NULL);
INSERT INTO `rubbishs` VALUES (337, '无菌注射器包装', 0, 4, 2, NULL, '2019-07-06 18:26:48', '2019-07-06 18:26:48', NULL);
INSERT INTO `rubbishs` VALUES (338, '油菜花', 0, 3, 2, NULL, '2019-07-06 18:57:14', '2019-07-06 18:57:14', NULL);
INSERT INTO `rubbishs` VALUES (339, '烧烤棒', 0, 4, 2, NULL, '2019-07-06 18:57:33', '2019-07-06 18:57:33', NULL);
INSERT INTO `rubbishs` VALUES (340, '披萨', 0, 3, 2, NULL, '2019-07-06 18:57:34', '2019-07-06 18:57:34', NULL);
INSERT INTO `rubbishs` VALUES (341, '披萨盒', 0, 4, 2, NULL, '2019-07-06 18:57:34', '2019-07-06 18:57:34', NULL);
INSERT INTO `rubbishs` VALUES (342, '披萨饼盒', 0, 4, 2, NULL, '2019-07-06 18:57:34', '2019-07-06 18:57:34', NULL);
INSERT INTO `rubbishs` VALUES (343, '花盆', 0, 4, 2, NULL, '2019-07-06 19:26:37', '2019-07-06 19:26:37', NULL);
INSERT INTO `rubbishs` VALUES (344, '废花盆', 0, 4, 2, NULL, '2019-07-06 19:26:37', '2019-07-06 19:26:37', NULL);
INSERT INTO `rubbishs` VALUES (345, '外套', 0, 1, 2, NULL, '2019-07-06 19:59:18', '2019-07-06 19:59:18', NULL);
INSERT INTO `rubbishs` VALUES (346, '打印机', 0, 1, 2, NULL, '2019-07-06 19:59:18', '2019-07-06 19:59:18', NULL);
INSERT INTO `rubbishs` VALUES (347, '复印机', 0, 1, 2, NULL, '2019-07-06 19:59:19', '2019-07-06 19:59:19', NULL);
INSERT INTO `rubbishs` VALUES (348, '手机壳', 0, 4, 2, NULL, '2019-07-06 20:35:26', '2019-07-06 20:35:26', NULL);
INSERT INTO `rubbishs` VALUES (349, '手机膜', 0, 4, 2, NULL, '2019-07-06 20:35:26', '2019-07-06 20:35:26', NULL);
INSERT INTO `rubbishs` VALUES (350, '铁桶', 0, 1, 2, NULL, '2019-07-06 21:56:38', '2019-07-06 21:56:38', NULL);
INSERT INTO `rubbishs` VALUES (351, '一次性杯子', 0, 4, 2, NULL, '2019-07-06 21:56:39', '2019-07-06 21:56:39', NULL);
INSERT INTO `rubbishs` VALUES (352, '纸质一次性杯子', 0, 4, 2, NULL, '2019-07-06 21:56:39', '2019-07-06 21:56:39', NULL);
INSERT INTO `rubbishs` VALUES (353, '滤水壶滤芯', 0, 4, 2, NULL, '2019-07-06 21:56:39', '2019-07-06 21:56:39', NULL);
INSERT INTO `rubbishs` VALUES (354, '塑料充气沙发', 0, 1, 2, NULL, '2019-07-06 22:03:47', '2019-07-06 22:03:47', NULL);
INSERT INTO `rubbishs` VALUES (355, '废旧抹布', 0, 4, 2, NULL, '2019-07-06 22:03:47', '2019-07-06 22:03:47', NULL);
INSERT INTO `rubbishs` VALUES (356, '帽子', 0, 1, 2, NULL, '2019-07-06 22:22:33', '2019-07-06 22:22:33', NULL);
INSERT INTO `rubbishs` VALUES (357, '乐高玩具', 0, 1, 2, NULL, '2019-07-06 22:41:53', '2019-07-06 22:41:53', NULL);
INSERT INTO `rubbishs` VALUES (358, '过期化妆粉饼', 0, 4, 2, NULL, '2019-07-06 22:51:59', '2019-07-06 22:51:59', NULL);
INSERT INTO `rubbishs` VALUES (359, '被子', 0, 1, 2, NULL, '2019-07-07 00:18:59', '2019-07-07 00:18:59', NULL);
INSERT INTO `rubbishs` VALUES (360, '牙膏壳', 0, 4, 2, NULL, '2019-07-07 00:22:54', '2019-07-07 00:22:54', NULL);
INSERT INTO `rubbishs` VALUES (361, '牙膏皮', 0, 4, 2, NULL, '2019-07-07 00:22:54', '2019-07-07 00:22:54', NULL);
INSERT INTO `rubbishs` VALUES (362, '牙膏软管', 0, 4, 2, NULL, '2019-07-07 00:22:54', '2019-07-07 00:22:54', NULL);
INSERT INTO `rubbishs` VALUES (363, '牙刷', 0, 4, 2, NULL, '2019-07-07 00:23:00', '2019-07-07 00:23:00', NULL);
INSERT INTO `rubbishs` VALUES (364, '废旧牙刷', 0, 4, 2, NULL, '2019-07-07 00:23:00', '2019-07-07 00:23:00', NULL);
INSERT INTO `rubbishs` VALUES (365, '棉签', 0, 4, 2, NULL, '2019-07-07 00:23:51', '2019-07-07 00:23:51', NULL);
INSERT INTO `rubbishs` VALUES (366, '棉', 0, 1, 2, NULL, '2019-07-07 00:23:51', '2019-07-07 00:23:51', NULL);
INSERT INTO `rubbishs` VALUES (367, '剪刀', 0, 1, 2, NULL, '2019-07-07 00:26:10', '2019-07-07 00:26:10', NULL);
INSERT INTO `rubbishs` VALUES (368, '口香糖', 0, 4, 2, NULL, '2019-07-07 00:27:44', '2019-07-07 00:27:44', NULL);
INSERT INTO `rubbishs` VALUES (369, '糖', 0, 3, 2, NULL, '2019-07-07 00:27:44', '2019-07-07 00:27:44', NULL);
INSERT INTO `rubbishs` VALUES (370, '口香糖包装纸', 0, 4, 2, NULL, '2019-07-07 00:27:44', '2019-07-07 00:27:44', NULL);
INSERT INTO `rubbishs` VALUES (371, '剃须刀', 0, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (372, '耳机', 0, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (373, '耳塞', 0, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `rubbishs` VALUES (374, '牛仔裤', 0, 1, 2, NULL, '2019-07-07 11:41:26', '2019-07-07 11:41:26', NULL);
INSERT INTO `rubbishs` VALUES (375, '防晒霜空瓶', 0, 1, 2, NULL, '2019-07-07 11:54:14', '2019-07-07 11:54:14', NULL);
INSERT INTO `rubbishs` VALUES (376, '防晒霜玻璃空瓶', 0, 1, 2, NULL, '2019-07-07 11:54:14', '2019-07-07 11:54:14', NULL);
INSERT INTO `rubbishs` VALUES (377, '防晒霜塑料空瓶', 0, 1, 2, NULL, '2019-07-07 11:54:14', '2019-07-07 11:54:14', NULL);
INSERT INTO `rubbishs` VALUES (378, '假发', 0, 4, 2, NULL, '2019-07-07 11:57:15', '2019-07-07 11:57:15', NULL);
INSERT INTO `rubbishs` VALUES (379, '浴帽', 0, 4, 2, NULL, '2019-07-07 17:57:46', '2019-07-07 17:57:46', NULL);
INSERT INTO `rubbishs` VALUES (380, '猫粮', 0, 3, 2, NULL, '2019-07-07 20:24:52', '2019-07-07 20:24:52', NULL);
INSERT INTO `rubbishs` VALUES (381, '猫毛', 0, 4, 2, NULL, '2019-07-07 20:24:52', '2019-07-07 20:24:52', NULL);
INSERT INTO `rubbishs` VALUES (382, '猫砂', 0, 4, 2, NULL, '2019-07-07 20:24:52', '2019-07-07 20:24:52', NULL);
INSERT INTO `rubbishs` VALUES (383, '油画', 0, 4, 2, NULL, '2019-07-07 20:25:32', '2019-07-07 20:25:32', NULL);
INSERT INTO `rubbishs` VALUES (384, '油画棒', 0, 4, 2, NULL, '2019-07-07 20:25:32', '2019-07-07 20:25:32', NULL);
INSERT INTO `rubbishs` VALUES (385, '瓷碗', 0, 4, 2, NULL, '2019-07-07 20:33:58', '2019-07-07 20:33:58', NULL);
INSERT INTO `rubbishs` VALUES (386, '陶瓷碗', 0, 4, 2, NULL, '2019-07-07 20:33:58', '2019-07-07 20:33:58', NULL);
INSERT INTO `rubbishs` VALUES (387, '洗碗布', 0, 4, 2, NULL, '2019-07-07 20:33:58', '2019-07-07 20:33:58', NULL);
INSERT INTO `rubbishs` VALUES (388, '旧浴巾', 0, 4, 2, NULL, '2019-07-07 20:36:23', '2019-07-07 20:36:23', NULL);
INSERT INTO `rubbishs` VALUES (389, '餐巾纸盒', 0, 1, 2, NULL, '2019-07-07 20:37:32', '2019-07-07 20:37:32', NULL);
INSERT INTO `rubbishs` VALUES (390, '餐巾纸包装', 0, 4, 2, NULL, '2019-07-07 20:37:32', '2019-07-07 20:37:32', NULL);
INSERT INTO `rubbishs` VALUES (391, '鞋带', 0, 1, 2, NULL, '2019-07-07 20:47:45', '2019-07-07 20:47:45', NULL);
INSERT INTO `rubbishs` VALUES (392, '火锅底料', 0, 3, 2, NULL, '2019-07-07 20:48:13', '2019-07-07 20:48:13', NULL);
INSERT INTO `rubbishs` VALUES (393, '火锅调料', 0, 3, 2, NULL, '2019-07-07 20:48:13', '2019-07-07 20:48:13', NULL);
INSERT INTO `rubbishs` VALUES (394, '冰淇淋', 0, 3, 2, NULL, '2019-07-07 20:48:23', '2019-07-07 20:48:23', NULL);
INSERT INTO `rubbishs` VALUES (395, '土豆', 0, 3, 2, NULL, '2019-07-07 21:06:40', '2019-07-07 21:06:40', NULL);
INSERT INTO `rubbishs` VALUES (396, '鱼骨头', 0, 3, 2, NULL, '2019-07-07 22:28:17', '2019-07-07 22:28:17', NULL);
INSERT INTO `rubbishs` VALUES (397, '带鱼骨头', 0, 3, 2, NULL, '2019-07-07 22:28:17', '2019-07-07 22:28:17', NULL);
INSERT INTO `rubbishs` VALUES (398, '灯泡', 0, 2, 2, NULL, '2019-07-07 22:52:45', '2019-07-07 22:52:45', NULL);
INSERT INTO `rubbishs` VALUES (399, '玻璃灯罩', 0, 1, 2, NULL, '2019-07-07 22:52:45', '2019-07-07 22:52:45', NULL);
INSERT INTO `rubbishs` VALUES (400, '门锁', 0, 1, 2, NULL, '2019-07-08 00:02:06', '2019-07-08 00:02:06', NULL);
INSERT INTO `rubbishs` VALUES (401, '蜡烛', 0, 4, 2, NULL, '2019-07-08 00:02:21', '2019-07-08 00:02:21', NULL);
INSERT INTO `rubbishs` VALUES (402, '生日蜡烛', 0, 4, 2, NULL, '2019-07-08 00:02:21', '2019-07-08 00:02:21', NULL);
INSERT INTO `rubbishs` VALUES (403, '铝锅', 0, 1, 2, NULL, '2019-07-08 00:03:21', '2019-07-08 00:03:21', NULL);
INSERT INTO `rubbishs` VALUES (404, '砂锅', 0, 4, 2, NULL, '2019-07-08 00:03:21', '2019-07-08 00:03:21', NULL);
INSERT INTO `rubbishs` VALUES (405, '玉米棒', 0, 3, 2, NULL, '2019-07-08 00:03:31', '2019-07-08 00:03:31', NULL);
INSERT INTO `rubbishs` VALUES (406, '香蕉', 0, 3, 2, NULL, '2019-07-08 00:03:43', '2019-07-08 00:03:43', NULL);
INSERT INTO `rubbishs` VALUES (407, '烂香蕉', 0, 3, 2, NULL, '2019-07-08 00:03:44', '2019-07-08 00:03:44', NULL);
INSERT INTO `rubbishs` VALUES (408, '香蕉干', 0, 3, 2, NULL, '2019-07-08 00:03:44', '2019-07-08 00:03:44', NULL);
INSERT INTO `rubbishs` VALUES (409, '圆珠笔笔套', 0, 1, 2, NULL, '2019-07-08 00:03:58', '2019-07-08 00:03:58', NULL);
INSERT INTO `rubbishs` VALUES (410, '笔盖', 0, 4, 2, NULL, '2019-07-08 00:03:59', '2019-07-08 00:03:59', NULL);
INSERT INTO `rubbishs` VALUES (411, '笔杆', 0, 4, 2, NULL, '2019-07-08 00:03:59', '2019-07-08 00:03:59', NULL);
INSERT INTO `rubbishs` VALUES (412, '西装', 0, 1, 2, NULL, '2019-07-08 00:18:42', '2019-07-08 00:18:42', NULL);
INSERT INTO `rubbishs` VALUES (413, '金属哑铃', 0, 1, 2, NULL, '2019-07-08 00:18:42', '2019-07-08 00:18:42', NULL);
INSERT INTO `rubbishs` VALUES (414, '塑料打火机', 0, 4, 2, NULL, '2019-07-08 09:15:47', '2019-07-08 09:15:47', NULL);
INSERT INTO `rubbishs` VALUES (415, '衣物', 0, 1, 2, NULL, '2019-07-08 11:14:04', '2019-07-08 11:14:04', NULL);
INSERT INTO `rubbishs` VALUES (416, '化纤衣物', 0, 1, 2, NULL, '2019-07-08 11:14:04', '2019-07-08 11:14:04', NULL);
INSERT INTO `rubbishs` VALUES (417, '衣物干燥剂', 0, 4, 2, NULL, '2019-07-08 11:14:04', '2019-07-08 11:14:04', NULL);
INSERT INTO `rubbishs` VALUES (418, '窗帘', 0, 1, 2, NULL, '2019-07-08 15:04:04', '2019-07-08 15:04:04', NULL);
INSERT INTO `rubbishs` VALUES (419, '快餐盒', 0, 4, 2, NULL, '2019-07-08 20:03:42', '2019-07-08 20:03:42', NULL);
INSERT INTO `rubbishs` VALUES (420, '伞', 0, 4, 2, NULL, '2019-07-09 11:46:18', '2019-07-09 11:46:18', NULL);
INSERT INTO `rubbishs` VALUES (421, '背心', 0, 1, 2, NULL, '2019-07-09 11:46:31', '2019-07-09 11:46:31', NULL);
INSERT INTO `rubbishs` VALUES (422, '南瓜', 0, 3, 2, NULL, '2019-07-09 11:49:54', '2019-07-09 11:49:54', NULL);
INSERT INTO `rubbishs` VALUES (423, '海绵', 0, 4, 2, NULL, '2019-07-09 18:41:23', '2019-07-09 18:41:23', NULL);
INSERT INTO `rubbishs` VALUES (424, '花生', 0, 3, 2, NULL, '2019-07-09 18:41:43', '2019-07-09 18:41:43', NULL);
INSERT INTO `rubbishs` VALUES (425, '花生壳', 0, 3, 2, NULL, '2019-07-09 18:41:43', '2019-07-09 18:41:43', NULL);
INSERT INTO `rubbishs` VALUES (426, '篮球', 0, 1, 2, NULL, '2019-07-09 18:41:54', '2019-07-09 18:41:54', NULL);
INSERT INTO `rubbishs` VALUES (427, '辣椒', 0, 3, 2, NULL, '2019-07-09 18:42:08', '2019-07-09 18:42:08', NULL);
INSERT INTO `rubbishs` VALUES (428, '干辣椒', 0, 3, 2, NULL, '2019-07-09 18:42:08', '2019-07-09 18:42:08', NULL);
INSERT INTO `rubbishs` VALUES (429, '辣椒酱', 0, 3, 2, NULL, '2019-07-09 18:42:08', '2019-07-09 18:42:08', NULL);
INSERT INTO `rubbishs` VALUES (430, '蟹壳', 0, 3, 2, NULL, '2019-07-09 18:42:26', '2019-07-09 18:42:26', NULL);
INSERT INTO `rubbishs` VALUES (431, '干蟹壳', 0, 3, 2, NULL, '2019-07-09 18:42:27', '2019-07-09 18:42:27', NULL);
INSERT INTO `rubbishs` VALUES (432, '螃蟹壳', 0, 3, 2, NULL, '2019-07-09 18:42:27', '2019-07-09 18:42:27', NULL);
INSERT INTO `rubbishs` VALUES (433, '甘蔗皮', 0, 4, 2, NULL, '2019-07-09 18:42:45', '2019-07-09 18:42:45', NULL);
INSERT INTO `rubbishs` VALUES (434, '蛋糕', 0, 3, 2, NULL, '2019-07-09 18:42:53', '2019-07-09 18:42:53', NULL);
INSERT INTO `rubbishs` VALUES (435, '风味蛋糕', 0, 3, 2, NULL, '2019-07-09 18:42:53', '2019-07-09 18:42:53', NULL);
INSERT INTO `rubbishs` VALUES (436, '奶油蛋糕', 0, 3, 2, NULL, '2019-07-09 18:42:53', '2019-07-09 18:42:53', NULL);
INSERT INTO `rubbishs` VALUES (437, '西红柿', 0, 3, 2, NULL, '2019-07-09 18:42:58', '2019-07-09 18:42:58', NULL);
INSERT INTO `rubbishs` VALUES (438, '西瓜皮', 0, 3, 2, NULL, '2019-07-09 18:43:07', '2019-07-09 18:43:07', NULL);
INSERT INTO `rubbishs` VALUES (439, '瓜皮', 0, 3, 2, NULL, '2019-07-09 18:43:08', '2019-07-09 18:43:08', NULL);
INSERT INTO `rubbishs` VALUES (440, '西瓜', 0, 3, 2, NULL, '2019-07-09 18:43:08', '2019-07-09 18:43:08', NULL);
INSERT INTO `rubbishs` VALUES (441, '水彩笔', 0, 4, 2, NULL, '2019-07-09 18:43:29', '2019-07-09 18:43:29', NULL);
INSERT INTO `rubbishs` VALUES (442, '彩笔', 0, 4, 2, NULL, '2019-07-09 18:43:29', '2019-07-09 18:43:29', NULL);
INSERT INTO `rubbishs` VALUES (443, '羊毛', 0, 1, 2, NULL, '2019-07-09 22:26:24', '2019-07-09 22:26:24', NULL);
INSERT INTO `rubbishs` VALUES (444, '腐烂蔬菜', 0, 3, 2, NULL, '2019-07-09 23:27:04', '2019-07-09 23:27:04', NULL);
INSERT INTO `rubbishs` VALUES (445, '干花', 0, 3, 2, NULL, '2019-07-10 12:09:33', '2019-07-10 12:09:33', NULL);
INSERT INTO `rubbishs` VALUES (446, '粽子', 0, 3, 2, NULL, '2019-07-10 16:12:15', '2019-07-10 16:12:15', NULL);
INSERT INTO `rubbishs` VALUES (447, '粽子叶', 0, 4, 2, NULL, '2019-07-10 16:12:15', '2019-07-10 16:12:15', NULL);
INSERT INTO `rubbishs` VALUES (448, '打印间碎纸', 0, 1, 2, NULL, '2019-07-10 20:06:55', '2019-07-10 20:06:55', NULL);
INSERT INTO `rubbishs` VALUES (449, '尿布', 0, 4, 2, NULL, '2019-07-11 00:23:44', '2019-07-11 00:23:44', NULL);
INSERT INTO `rubbishs` VALUES (450, '狗尿布', 0, 4, 2, NULL, '2019-07-11 00:23:44', '2019-07-11 00:23:44', NULL);
INSERT INTO `rubbishs` VALUES (451, '书包', 0, 1, 2, NULL, '2019-07-12 17:09:23', '2019-07-12 17:09:23', NULL);
INSERT INTO `rubbishs` VALUES (452, '冰棍棒', 0, 4, 2, NULL, '2019-07-13 13:39:50', '2019-07-13 13:39:50', NULL);
INSERT INTO `rubbishs` VALUES (453, '卫生纸', 0, 4, 2, NULL, '2019-07-13 15:51:02', '2019-07-13 15:51:02', NULL);
INSERT INTO `rubbishs` VALUES (454, '蟑螂', 0, 3, 2, NULL, '2019-07-13 16:20:18', '2019-07-13 16:20:18', NULL);
INSERT INTO `rubbishs` VALUES (455, '死蟑螂', 0, 3, 2, NULL, '2019-07-13 16:20:18', '2019-07-13 16:20:18', NULL);
INSERT INTO `rubbishs` VALUES (456, '蟑螂丸', 0, 2, 2, NULL, '2019-07-13 16:20:18', '2019-07-13 16:20:18', NULL);
INSERT INTO `rubbishs` VALUES (457, '面包干', 0, 3, 2, NULL, '2019-07-14 13:42:57', '2019-07-14 13:42:57', NULL);
INSERT INTO `rubbishs` VALUES (458, '围巾', 0, 1, 2, NULL, '2019-07-14 14:43:07', '2019-07-14 14:43:07', NULL);
INSERT INTO `rubbishs` VALUES (459, '大衣', 0, 1, 2, NULL, '2019-07-14 19:13:06', '2019-07-14 19:13:06', NULL);
INSERT INTO `rubbishs` VALUES (460, '线', 0, 4, 2, NULL, '2019-07-14 23:44:53', '2019-07-14 23:44:53', NULL);
INSERT INTO `rubbishs` VALUES (461, '海洋球', 0, 1, 2, NULL, '2019-07-15 13:30:14', '2019-07-15 13:30:14', NULL);
INSERT INTO `rubbishs` VALUES (462, '仙人球', 0, 3, 2, NULL, '2019-07-15 17:04:36', '2019-07-15 17:04:36', NULL);
INSERT INTO `rubbishs` VALUES (463, '仙人掌', 0, 3, 2, NULL, '2019-07-15 17:04:36', '2019-07-15 17:04:36', NULL);
INSERT INTO `rubbishs` VALUES (464, '湿报纸', 0, 4, 2, NULL, '2019-07-15 17:05:55', '2019-07-15 17:05:55', NULL);
INSERT INTO `rubbishs` VALUES (465, '果冻', 0, 3, 2, NULL, '2019-07-15 17:09:32', '2019-07-15 17:09:32', NULL);
INSERT INTO `rubbishs` VALUES (466, '果冻盒', 0, 4, 2, NULL, '2019-07-15 17:09:33', '2019-07-15 17:09:33', NULL);
INSERT INTO `rubbishs` VALUES (467, '彩色铅笔', 0, 4, 2, NULL, '2019-07-15 18:12:49', '2019-07-15 18:12:49', NULL);
INSERT INTO `rubbishs` VALUES (468, '木头铅笔', 0, 4, 2, NULL, '2019-07-15 18:12:49', '2019-07-15 18:12:49', NULL);
INSERT INTO `rubbishs` VALUES (469, '棉花', 0, 4, 2, NULL, '2019-07-15 21:26:14', '2019-07-15 21:26:14', NULL);
INSERT INTO `rubbishs` VALUES (470, '奶茶杯', 0, 4, 2, NULL, '2019-07-15 21:48:00', '2019-07-15 21:48:00', NULL);
INSERT INTO `rubbishs` VALUES (471, '塑料奶茶杯', 0, 4, 2, NULL, '2019-07-15 21:48:00', '2019-07-15 21:48:00', NULL);
INSERT INTO `rubbishs` VALUES (472, '草莓叶', 0, 3, 2, NULL, '2019-07-16 09:17:37', '2019-07-16 09:17:37', NULL);
INSERT INTO `rubbishs` VALUES (473, '水果茶', 0, 3, 2, NULL, '2019-07-16 09:17:38', '2019-07-16 09:17:38', NULL);
INSERT INTO `rubbishs` VALUES (474, '水果脆', 0, 3, 2, NULL, '2019-07-16 09:17:38', '2019-07-16 09:17:38', NULL);
INSERT INTO `rubbishs` VALUES (475, '水果干', 0, 3, 2, NULL, '2019-07-16 09:17:38', '2019-07-16 09:17:38', NULL);
INSERT INTO `rubbishs` VALUES (476, '矿泉水瓶', 0, 1, 2, NULL, '2019-07-16 11:27:01', '2019-07-16 11:27:01', NULL);
INSERT INTO `rubbishs` VALUES (477, '铝罐', 0, 1, 2, NULL, '2019-07-16 15:59:25', '2019-07-16 15:59:25', NULL);
INSERT INTO `rubbishs` VALUES (478, '铁罐', 0, 1, 2, NULL, '2019-07-16 15:59:25', '2019-07-16 15:59:25', NULL);
INSERT INTO `rubbishs` VALUES (479, '玻璃罐', 0, 1, 2, NULL, '2019-07-16 15:59:25', '2019-07-16 15:59:25', NULL);
INSERT INTO `rubbishs` VALUES (480, '乌龟壳', 0, 4, 2, NULL, '2019-07-16 20:45:26', '2019-07-16 20:45:26', NULL);
INSERT INTO `rubbishs` VALUES (481, '蟹', 0, 3, 2, NULL, '2019-07-16 20:45:27', '2019-07-16 20:45:27', NULL);
INSERT INTO `rubbishs` VALUES (482, '酒瓶塞子', 0, 4, 2, NULL, '2019-07-18 16:27:29', '2019-07-18 16:27:29', NULL);
INSERT INTO `rubbishs` VALUES (483, '海螺', 0, 4, 2, NULL, '2019-07-18 16:30:03', '2019-07-18 16:30:03', NULL);
INSERT INTO `rubbishs` VALUES (484, '海螺壳', 0, 4, 2, NULL, '2019-07-18 16:30:03', '2019-07-18 16:30:03', NULL);
INSERT INTO `rubbishs` VALUES (485, '海螺肉', 0, 3, 2, NULL, '2019-07-18 16:30:03', '2019-07-18 16:30:03', NULL);
INSERT INTO `rubbishs` VALUES (486, '毛笔', 0, 4, 2, NULL, '2019-07-19 12:12:15', '2019-07-19 12:12:15', NULL);
INSERT INTO `rubbishs` VALUES (487, '羽毛', 0, 4, 2, NULL, '2019-07-19 12:12:16', '2019-07-19 12:12:16', NULL);
INSERT INTO `rubbishs` VALUES (488, '锡纸', 0, 4, 2, NULL, '2019-07-19 14:18:08', '2019-07-19 14:18:08', NULL);
INSERT INTO `rubbishs` VALUES (489, '锡纸盒', 0, 4, 2, NULL, '2019-07-19 14:18:09', '2019-07-19 14:18:09', NULL);
INSERT INTO `rubbishs` VALUES (490, '肥皂', 0, 4, 2, NULL, '2019-07-19 16:49:04', '2019-07-19 16:49:04', NULL);
INSERT INTO `rubbishs` VALUES (491, '青菜杆', 0, 3, 2, NULL, '2019-07-19 20:55:37', '2019-07-19 20:55:37', NULL);
INSERT INTO `rubbishs` VALUES (492, '塑料筷子', 0, 1, 2, NULL, '2019-07-19 21:59:09', '2019-07-19 21:59:09', NULL);
INSERT INTO `rubbishs` VALUES (493, '一次性筷子', 0, 4, 2, NULL, '2019-07-19 21:59:09', '2019-07-19 21:59:09', NULL);
INSERT INTO `rubbishs` VALUES (494, '鸡骨头', 0, 3, 2, NULL, '2019-07-20 02:31:52', '2019-07-20 02:31:52', NULL);
INSERT INTO `rubbishs` VALUES (495, '鸡骨', 0, 3, 2, NULL, '2019-07-20 02:31:52', '2019-07-20 02:31:52', NULL);
INSERT INTO `rubbishs` VALUES (496, '柠檬', 0, 3, 2, NULL, '2019-07-20 11:06:46', '2019-07-20 11:06:46', NULL);
INSERT INTO `rubbishs` VALUES (497, '领带', 0, 1, 2, NULL, '2019-07-20 14:33:49', '2019-07-20 14:33:49', NULL);
INSERT INTO `rubbishs` VALUES (498, '乒乓球', 0, 1, 2, NULL, '2019-07-20 15:04:24', '2019-07-20 15:04:24', NULL);
INSERT INTO `rubbishs` VALUES (499, '口红', 0, 4, 2, NULL, '2019-07-20 21:16:57', '2019-07-20 21:16:57', NULL);
INSERT INTO `rubbishs` VALUES (500, '过期口红', 0, 4, 2, NULL, '2019-07-20 21:16:57', '2019-07-20 21:16:57', NULL);
INSERT INTO `rubbishs` VALUES (501, '菠萝', 0, 3, 2, NULL, '2019-07-20 21:46:06', '2019-07-20 21:46:06', NULL);
INSERT INTO `rubbishs` VALUES (502, '菠萝蜜核', 0, 4, 2, NULL, '2019-07-20 21:46:06', '2019-07-20 21:46:06', NULL);
INSERT INTO `rubbishs` VALUES (503, '菠萝蜜壳', 0, 4, 2, NULL, '2019-07-20 21:46:06', '2019-07-20 21:46:06', NULL);
INSERT INTO `rubbishs` VALUES (504, '菠萝包', 0, 3, 2, NULL, '2019-07-20 21:46:07', '2019-07-20 21:46:07', NULL);
INSERT INTO `rubbishs` VALUES (505, '菠萝干', 0, 3, 2, NULL, '2019-07-20 21:46:07', '2019-07-20 21:46:07', NULL);
INSERT INTO `rubbishs` VALUES (506, '烤肉', 0, 3, 2, NULL, '2019-07-20 21:50:21', '2019-07-20 21:50:21', NULL);
INSERT INTO `rubbishs` VALUES (507, '过期食品', 0, 3, 2, NULL, '2019-07-21 08:44:08', '2019-07-21 08:44:08', NULL);
INSERT INTO `rubbishs` VALUES (508, '牛奶盒', 0, 1, 2, NULL, '2019-07-21 12:19:14', '2019-07-21 12:19:14', NULL);
INSERT INTO `rubbishs` VALUES (509, '光盘', 0, 4, 2, NULL, '2019-07-21 12:20:44', '2019-07-21 12:20:44', NULL);
INSERT INTO `rubbishs` VALUES (510, '铝盆', 0, 1, 2, NULL, '2019-07-21 13:01:38', '2019-07-21 13:01:38', NULL);
INSERT INTO `rubbishs` VALUES (511, '玻璃盆', 0, 1, 2, NULL, '2019-07-21 13:01:38', '2019-07-21 13:01:38', NULL);
INSERT INTO `rubbishs` VALUES (512, '录像带', 0, 2, 2, NULL, '2019-07-21 14:25:15', '2019-07-21 14:25:15', NULL);
INSERT INTO `rubbishs` VALUES (513, '蚊香', 0, 4, 2, NULL, '2019-07-21 14:57:54', '2019-07-21 14:57:54', NULL);
INSERT INTO `rubbishs` VALUES (514, '电蚊香片', 0, 4, 2, NULL, '2019-07-21 14:57:54', '2019-07-21 14:57:54', NULL);
INSERT INTO `rubbishs` VALUES (515, '电热蚊香片', 0, 4, 2, NULL, '2019-07-21 14:57:54', '2019-07-21 14:57:54', NULL);
INSERT INTO `rubbishs` VALUES (516, '猪脚', 0, 3, 2, NULL, '2019-07-21 16:15:32', '2019-07-21 16:15:32', NULL);
INSERT INTO `rubbishs` VALUES (517, '猪脑', 0, 3, 2, NULL, '2019-07-21 16:15:32', '2019-07-21 16:15:32', NULL);
INSERT INTO `rubbishs` VALUES (518, '猪皮', 0, 3, 2, NULL, '2019-07-21 16:15:33', '2019-07-21 16:15:33', NULL);
INSERT INTO `rubbishs` VALUES (519, '方便面', 0, 3, 2, NULL, '2019-07-21 16:15:58', '2019-07-21 16:15:58', NULL);
INSERT INTO `rubbishs` VALUES (520, '方便面袋', 0, 4, 2, NULL, '2019-07-21 16:15:58', '2019-07-21 16:15:58', NULL);
INSERT INTO `rubbishs` VALUES (521, '方便面盒', 0, 4, 2, NULL, '2019-07-21 16:15:59', '2019-07-21 16:15:59', NULL);
INSERT INTO `rubbishs` VALUES (522, '蜘蛛', 0, 3, 2, NULL, '2019-07-21 17:28:25', '2019-07-21 17:28:25', NULL);
INSERT INTO `rubbishs` VALUES (523, '番薯', 0, 3, 2, NULL, '2019-07-21 19:02:53', '2019-07-21 19:02:53', NULL);
INSERT INTO `rubbishs` VALUES (524, '鼻屎', 0, 4, 2, NULL, '2019-07-21 19:03:19', '2019-07-21 19:03:19', NULL);
INSERT INTO `rubbishs` VALUES (525, '垃圾袋', 0, 4, 2, NULL, '2019-07-21 19:28:59', '2019-07-21 19:28:59', NULL);
INSERT INTO `rubbishs` VALUES (526, '指甲油', 0, 2, 2, NULL, '2019-07-21 19:28:59', '2019-07-21 19:28:59', NULL);
INSERT INTO `rubbishs` VALUES (527, '桃核', 0, 3, 2, NULL, '2019-07-21 21:12:36', '2019-07-21 21:12:36', NULL);
INSERT INTO `rubbishs` VALUES (528, '狗粮', 0, 3, 2, NULL, '2019-07-22 04:45:59', '2019-07-22 04:45:59', NULL);
INSERT INTO `rubbishs` VALUES (529, '狗毛', 0, 4, 2, NULL, '2019-07-22 04:46:00', '2019-07-22 04:46:00', NULL);
INSERT INTO `rubbishs` VALUES (530, '咖啡纸杯', 0, 4, 2, NULL, '2019-07-22 16:31:49', '2019-07-22 16:31:49', NULL);
INSERT INTO `rubbishs` VALUES (531, '奶茶纸杯', 0, 4, 2, NULL, '2019-07-22 16:31:49', '2019-07-22 16:31:49', NULL);
INSERT INTO `rubbishs` VALUES (532, '瓜子', 0, 3, 2, NULL, '2019-07-22 17:59:02', '2019-07-22 17:59:02', NULL);
INSERT INTO `rubbishs` VALUES (533, '白瓜子', 0, 3, 2, NULL, '2019-07-22 17:59:02', '2019-07-22 17:59:02', NULL);
INSERT INTO `rubbishs` VALUES (534, '可乐空罐', 0, 1, 2, NULL, '2019-07-23 00:33:14', '2019-07-23 00:33:14', NULL);
INSERT INTO `rubbishs` VALUES (535, '可乐空瓶', 0, 1, 2, NULL, '2019-07-23 00:33:14', '2019-07-23 00:33:14', NULL);
INSERT INTO `rubbishs` VALUES (536, '可口可乐纸杯', 0, 4, 2, NULL, '2019-07-23 00:33:14', '2019-07-23 00:33:14', NULL);
INSERT INTO `rubbishs` VALUES (537, '荔枝', 0, 3, 2, NULL, '2019-07-23 12:27:06', '2019-07-23 12:27:06', NULL);
INSERT INTO `rubbishs` VALUES (538, '瓜子壳', 0, 3, 2, NULL, '2019-07-23 16:13:54', '2019-07-23 16:13:54', NULL);
INSERT INTO `rubbishs` VALUES (539, '南瓜子壳', 0, 3, 2, NULL, '2019-07-23 16:13:54', '2019-07-23 16:13:54', NULL);
INSERT INTO `rubbishs` VALUES (540, '葡萄皮', 0, 3, 2, NULL, '2019-07-23 16:14:30', '2019-07-23 16:14:30', NULL);
INSERT INTO `rubbishs` VALUES (541, '葡萄', 0, 3, 2, NULL, '2019-07-23 16:14:30', '2019-07-23 16:14:30', NULL);
INSERT INTO `rubbishs` VALUES (542, '剩饭', 0, 3, 2, NULL, '2019-07-23 16:15:57', '2019-07-23 16:15:57', NULL);
INSERT INTO `rubbishs` VALUES (543, '残渣剩饭', 0, 3, 2, NULL, '2019-07-23 16:15:57', '2019-07-23 16:15:57', NULL);
INSERT INTO `rubbishs` VALUES (544, '剩饭剩菜', 0, 3, 2, NULL, '2019-07-23 16:15:58', '2019-07-23 16:15:58', NULL);
INSERT INTO `rubbishs` VALUES (545, '狗屎纸', 0, 4, 2, NULL, '2019-07-23 16:16:20', '2019-07-23 16:16:20', NULL);
INSERT INTO `rubbishs` VALUES (546, '铁锅', 0, 1, 2, NULL, '2019-07-23 16:17:03', '2019-07-23 16:17:03', NULL);
INSERT INTO `rubbishs` VALUES (547, '假牙', 0, 4, 2, NULL, '2019-07-23 16:17:21', '2019-07-23 16:17:21', NULL);
INSERT INTO `rubbishs` VALUES (548, '塑料', 0, 1, 2, NULL, '2019-07-23 16:19:34', '2019-07-23 16:19:34', NULL);
INSERT INTO `rubbishs` VALUES (549, '贝壳', 0, 4, 2, NULL, '2019-07-23 18:58:14', '2019-07-23 18:58:14', NULL);
INSERT INTO `rubbishs` VALUES (550, '贝壳肉', 0, 3, 2, NULL, '2019-07-23 18:58:14', '2019-07-23 18:58:14', NULL);
INSERT INTO `rubbishs` VALUES (551, '大贝壳', 0, 4, 2, NULL, '2019-07-23 18:58:14', '2019-07-23 18:58:14', NULL);
INSERT INTO `rubbishs` VALUES (552, '蛤蜊', 0, 4, 2, NULL, '2019-07-23 18:58:56', '2019-07-23 18:58:56', NULL);
INSERT INTO `rubbishs` VALUES (553, '蛤蜊壳', 0, 4, 2, NULL, '2019-07-23 18:58:56', '2019-07-23 18:58:56', NULL);
INSERT INTO `rubbishs` VALUES (554, '蛤蜊肉', 0, 3, 2, NULL, '2019-07-23 18:58:57', '2019-07-23 18:58:57', NULL);
INSERT INTO `rubbishs` VALUES (555, '验孕棒', 0, 4, 2, NULL, '2019-07-24 01:00:36', '2019-07-24 01:00:36', NULL);
INSERT INTO `rubbishs` VALUES (556, '鸟粮', 0, 3, 2, NULL, '2019-07-24 08:40:32', '2019-07-24 08:40:32', NULL);
INSERT INTO `rubbishs` VALUES (557, '鸟笼', 0, 4, 2, NULL, '2019-07-24 08:40:33', '2019-07-24 08:40:33', NULL);
INSERT INTO `rubbishs` VALUES (558, '空煤气罐', 0, 1, 2, NULL, '2019-07-24 13:07:10', '2019-07-24 13:07:10', NULL);
INSERT INTO `rubbishs` VALUES (559, '饼干', 0, 3, 2, NULL, '2019-07-24 13:07:32', '2019-07-24 13:07:32', NULL);
INSERT INTO `rubbishs` VALUES (560, '饼干袋', 0, 4, 2, NULL, '2019-07-24 13:07:32', '2019-07-24 13:07:32', NULL);
INSERT INTO `rubbishs` VALUES (561, '饼干渣', 0, 3, 2, NULL, '2019-07-24 13:07:33', '2019-07-24 13:07:33', NULL);
INSERT INTO `rubbishs` VALUES (562, '粽叶', 0, 4, 2, NULL, '2019-07-24 13:12:06', '2019-07-24 13:12:06', NULL);
INSERT INTO `rubbishs` VALUES (563, '螺丝钉', 0, 1, 2, NULL, '2019-07-24 21:44:26', '2019-07-24 21:44:26', NULL);
INSERT INTO `rubbishs` VALUES (564, '卫生巾', 0, 4, 2, NULL, '2019-07-25 11:52:09', '2019-07-25 11:52:09', NULL);
INSERT INTO `rubbishs` VALUES (565, '棉质卫生巾', 0, 4, 2, NULL, '2019-07-25 11:52:09', '2019-07-25 11:52:09', NULL);
INSERT INTO `rubbishs` VALUES (566, '玉米芯', 0, 3, 2, NULL, '2019-07-26 08:44:45', '2019-07-26 08:44:45', NULL);
INSERT INTO `rubbishs` VALUES (567, '玉米皮', 0, 4, 2, NULL, '2019-07-26 08:44:54', '2019-07-26 08:44:54', NULL);
INSERT INTO `rubbishs` VALUES (568, '核桃壳', 0, 4, 2, NULL, '2019-07-26 08:49:03', '2019-07-26 08:49:03', NULL);
INSERT INTO `rubbishs` VALUES (569, '大核桃壳', 0, 4, 2, NULL, '2019-07-26 08:49:03', '2019-07-26 08:49:03', NULL);
INSERT INTO `rubbishs` VALUES (570, '珍珠米', 0, 3, 2, NULL, '2019-07-26 08:50:43', '2019-07-26 08:50:43', NULL);
INSERT INTO `rubbishs` VALUES (571, '鞋子', 0, 1, 2, NULL, '2022-11-09 10:57:45', '2022-11-09 10:57:45', NULL);
INSERT INTO `rubbishs` VALUES (572, '塑料拖鞋', 0, 1, 2, NULL, '2022-11-09 10:57:45', '2022-11-09 10:57:45', NULL);
INSERT INTO `rubbishs` VALUES (573, '运动鞋', 0, 1, 2, NULL, '2022-11-09 10:57:45', '2022-11-09 10:57:45', NULL);
INSERT INTO `rubbishs` VALUES (574, '高跟鞋', 0, 1, 2, NULL, '2022-11-09 10:57:45', '2022-11-09 10:57:45', NULL);
INSERT INTO `rubbishs` VALUES (575, '雨鞋', 0, 1, 2, NULL, '2022-11-09 10:57:45', '2022-11-09 10:57:45', NULL);
INSERT INTO `rubbishs` VALUES (576, '裤子', 0, 1, 2, NULL, '2022-11-09 11:00:49', '2022-11-09 11:00:49', NULL);
INSERT INTO `rubbishs` VALUES (577, '塑料梳子', 0, 1, 2, NULL, '2022-11-09 11:00:49', '2022-11-09 11:00:49', NULL);
INSERT INTO `rubbishs` VALUES (578, '本子', 0, 1, 2, NULL, '2022-11-09 11:00:49', '2022-11-09 11:00:49', NULL);
INSERT INTO `rubbishs` VALUES (579, '酸奶利乐包装盒', 0, 1, 2, NULL, '2022-11-09 11:00:51', '2022-11-09 11:00:51', NULL);
INSERT INTO `rubbishs` VALUES (580, '金属奶粉罐', 0, 1, 2, NULL, '2022-11-09 11:00:51', '2022-11-09 11:00:51', NULL);
INSERT INTO `rubbishs` VALUES (581, '金属酒瓶盖', 0, 1, 2, NULL, '2022-11-09 11:00:51', '2022-11-09 11:00:51', NULL);
INSERT INTO `rubbishs` VALUES (582, '平底锅', 0, 1, 2, NULL, '2022-11-09 11:00:51', '2022-11-09 11:00:51', NULL);

SET FOREIGN_KEY_CHECKS = 1;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nickname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户微信昵称',
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信头像',
  `phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `gender` tinyint(4) NOT NULL DEFAULT 0 COMMENT '默认一个性别',
  `open_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `union_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zh_CN',
  `province` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户类型',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户状态',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_open_id_unique`(`open_id`) USING BTREE,
  INDEX `users_union_id_index`(`union_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3527 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;