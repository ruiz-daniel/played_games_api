/*
 Navicat Premium Data Transfer

 Source Server         : drg_mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : drg_db

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 22/07/2021 10:20:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory`  (
  `MigrationId` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playedgame
-- ----------------------------
DROP TABLE IF EXISTS `playedgame`;
CREATE TABLE `playedgame`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `developer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `publisher` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `genre` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `rating` int NULL DEFAULT NULL,
  `platformid` int NULL DEFAULT NULL,
  `statusid` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'image URL',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IX_playedgame_platformid`(`platformid`) USING BTREE,
  INDEX `IX_playedgame_statusid`(`statusid`) USING BTREE,
  CONSTRAINT `FK_playedgame_platform_platformid` FOREIGN KEY (`platformid`) REFERENCES `platform` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_playedgame_status_statusid` FOREIGN KEY (`statusid`) REFERENCES `status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for top10actiongames
-- ----------------------------
DROP TABLE IF EXISTS `top10actiongames`;
CREATE TABLE `top10actiongames`  (
  `id` int NOT NULL,
  `game_fk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pos` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `top10_game`(`game_fk`) USING BTREE,
  CONSTRAINT `top10actiongames_ibfk_1` FOREIGN KEY (`game_fk`) REFERENCES `playedgame` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for top10games
-- ----------------------------
DROP TABLE IF EXISTS `top10games`;
CREATE TABLE `top10games`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `gameid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pos` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_top10games_playedgame_game_fk`(`gameid`) USING BTREE,
  CONSTRAINT `top10_game` FOREIGN KEY (`gameid`) REFERENCES `playedgame` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for top10nonactiongames
-- ----------------------------
DROP TABLE IF EXISTS `top10nonactiongames`;
CREATE TABLE `top10nonactiongames`  (
  `id` int NOT NULL,
  `gameid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pos` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `top10_game`(`gameid`) USING BTREE,
  CONSTRAINT `top10nonactiongames_ibfk_1` FOREIGN KEY (`gameid`) REFERENCES `playedgame` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for top10rpg
-- ----------------------------
DROP TABLE IF EXISTS `top10rpg`;
CREATE TABLE `top10rpg`  (
  `id` int NOT NULL,
  `gameid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pos` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `top10_game`(`gameid`) USING BTREE,
  CONSTRAINT `top10rpg_ibfk_1` FOREIGN KEY (`gameid`) REFERENCES `playedgame` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for top10turnbasedgames
-- ----------------------------
DROP TABLE IF EXISTS `top10turnbasedgames`;
CREATE TABLE `top10turnbasedgames`  (
  `id` int NOT NULL,
  `gameid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pos` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `top10_game`(`gameid`) USING BTREE,
  CONSTRAINT `top10turnbasedgames_ibfk_1` FOREIGN KEY (`gameid`) REFERENCES `playedgame` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
