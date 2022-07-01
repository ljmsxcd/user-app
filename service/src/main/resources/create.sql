/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 01/07/2022 11:55:26
*/

CREATE DATABASE test;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

use test1;

-- ----------------------------
-- Table structure for tbUser
-- ----------------------------
DROP TABLE IF EXISTS `tbUser`;
CREATE TABLE `tbUser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'aaaa@bb.com',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

