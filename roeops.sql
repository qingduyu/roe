-- 请务必使用5.7 以上版本
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for allhosts
-- ----------------------------
DROP TABLE IF EXISTS `allhosts`;
CREATE TABLE `allhosts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_public` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_control` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_other` varchar(850) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostserver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpu_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpu_num` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memory` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sn` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cabinet` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uplink_port` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useuser` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` decimal(6, 0) DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sudo_passwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyfile` smallint(6) DEFAULT NULL,
  `ssh_status` int(11) DEFAULT NULL,
  `onlinedate` date NOT NULL,
  `end_time` date NOT NULL,
  `ctime` datetime(6) DEFAULT NULL,
  `utime` datetime(6) DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `idc_id` int(11) DEFAULT NULL,
  `tree_id_id` int(11) DEFAULT NULL,
  `is_pooled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ALLHOSTS_sn_d1221ddc_uniq`(`sn`) USING BTREE,
  INDEX `ALLHOSTS_tree_id_id_b6c172f6_fk_yewuTreeMptt_id`(`tree_id_id`) USING BTREE,
  INDEX `ALLHOSTS_ip_hostname_a91ce551_idx`(`ip`, `hostname`) USING BTREE,
  INDEX `ALLHOSTS_idc_id_7dabb6c1_fk_IDC_id`(`idc_id`) USING BTREE,
  CONSTRAINT `ALLHOSTS_idc_id_7dabb6c1_fk_IDC_id` FOREIGN KEY (`idc_id`) REFERENCES `idc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ALLHOSTS_tree_id_id_b6c172f6_fk_yewuTreeMptt_id` FOREIGN KEY (`tree_id_id`) REFERENCES `yewutreemptt` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 379 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of allhosts
-- ----------------------------
INSERT INTO `allhosts` VALUES (217, 'zlrac02', '10.0.40.38', NULL, NULL, '10.0.40.38', NULL, '物理机', NULL, '1', 'LENOVOSystem x3650 M5', 'Intel(R) Xeon(R) CPU E5-2630 v4  2.20GHz', '2', '128492', '5525220', 'J33KC44', '', '', '', '', '', 'CentOS 6.9 64', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-12-20', '2019-01-01', '2018-12-20 07:31:27.703164', '2018-12-21 11:33:01.322167', '', NULL, NULL, 1);
INSERT INTO `allhosts` VALUES (248, 'uatanomaly-data02.veredholdings.cn', '172.16.50.62', NULL, NULL, '172.16.50.62', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '593183ed-a9c5-4722-cd39-0025833bc69c', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:41.119353', '2018-12-25 06:14:06.629353', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (249, 'uatanomaly-data03.veredholdings.cn', '172.16.50.63', NULL, NULL, '172.16.50.63', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '60604daf-8763-a994-847c-43bdc1d90dc7', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:41.235273', '2018-12-25 06:14:06.665663', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (250, 'uatanomaly-control02.veredholdings.cn', '172.16.50.60', NULL, NULL, '172.16.50.64,172.16.50.60', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '2c31de5c-96d7-928d-ca67-8c4e85c1b462', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:41.333718', '2018-12-25 06:14:06.844122', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (251, 'uatanomaly-data01.veredholdings.cn', '172.16.50.61', NULL, NULL, '172.16.50.61', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '1efe83e0-7dbe-b988-1f4a-72cbb189d0d7', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:41.429057', '2018-12-25 06:14:06.741959', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (252, 'uatanomaly-data05.veredholdings.cn', '172.16.50.66', NULL, NULL, '172.16.50.66', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd29c4f05-954a-c005-f5df-99de901ce0a7', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:41.537907', '2018-12-25 06:14:06.780376', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (253, 'uatanomaly-data06.veredholdings.cn', '172.16.50.67', NULL, NULL, '172.16.50.67', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '09000593-6b27-2caa-dd61-3225a58e3341', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:41.636302', '2018-12-25 06:14:06.810204', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (254, 'uatanomaly-data04.veredholdings.cn', '172.16.50.65', NULL, NULL, '172.16.50.65', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '092483e1-1552-a76e-3503-c76cf028fc7f', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:41.830359', '2018-12-25 06:14:06.875301', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (255, 'dev-zijin-jiekou', '172.16.50.102', NULL, NULL, '172.16.50.102', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'b9123951-edf9-32c8-ceeb-337c61c612ab', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:41.926742', '2018-12-25 06:14:06.907241', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (257, 'uat-gw-intf', '172.16.50.104', NULL, NULL, '172.16.50.104', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '1a723aad-0bc1-1696-9735-6c493ebb701b', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:42.131330', '2018-12-25 06:14:06.969922', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (258, 'uatgw-app-console', '172.16.50.105', NULL, NULL, '172.16.50.105', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '7f7da8bd-fe37-42ca-e804-3cf062a198ec', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:42.236590', '2018-12-25 06:14:07.011327', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (260, 'uatgw-redis', '172.16.50.107', NULL, NULL, '172.16.50.107', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd11846d7-e871-04a1-a217-071c1ad17f08', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:42.434563', '2018-12-25 06:14:07.067136', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (269, 'uatvfc-info01.veredholdings.cn', '172.16.50.184', NULL, NULL, '172.16.50.184', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '64e1a404-f43e-f409-c87c-b39b04518476', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:43.413128', '2019-01-08 02:31:24.619317', '', 1, 67, 0);
INSERT INTO `allhosts` VALUES (270, 'uatvfc-info02.veredholdings.cn', '172.16.50.185', NULL, NULL, '172.16.50.185', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '98d13e11-6517-d6e2-d782-613e32c0ec59', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:43.554587', '2019-01-08 02:31:28.916374', '', 1, 67, 0);
INSERT INTO `allhosts` VALUES (271, 'uatdtin.veredholdings.cn', '172.16.50.186', NULL, NULL, '172.16.50.186', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd8bed138-4963-ac8e-a6ae-38e311166068', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:43.657378', '2018-12-25 06:14:07.380255', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (272, 'uatvfc-db-route01.veredholdings.cn', '172.16.50.187', NULL, NULL, '172.16.50.191,172.16.50.187', NULL, '虚拟机', NULL, '1', 'XenHVM domU', 'Intel(R) Xeon(R) CPU E5-2640 v4  2.40GHz', '4', '7816', '0', '0de9f66e-7be4-97e9-8622-48f784f7087c', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:43.742289', '2019-01-08 02:31:41.769301', '', 1, 67, 0);
INSERT INTO `allhosts` VALUES (273, 'fvtvfc-info01.veredholdings.cn', '172.16.50.75', NULL, NULL, '172.16.50.75', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '4846e8ea-68c5-9c4d-92ae-7e097b21087f', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:43.839478', '2019-01-08 02:31:53.168784', '', 1, 67, 0);
INSERT INTO `allhosts` VALUES (274, 'fvtvfc-dmz02.veredholdings.cn', '172.16.50.74', NULL, NULL, '172.16.50.74', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '256f3236-a246-3672-038e-6a133b606d46', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:43.951707', '2018-12-25 06:14:07.475125', NULL, 1, 67, 0);
INSERT INTO `allhosts` VALUES (275, 'fvtvfc-sec01.veredholdings.cn', '172.16.50.77', NULL, NULL, '172.16.50.77', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '36c84811-b0da-c3cf-c112-a2c05a8b6650', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.052052', '2018-12-25 06:14:07.501909', NULL, 1, 67, 0);
INSERT INTO `allhosts` VALUES (276, 'fvtvfc-info02.veredholdings.cn', '172.16.50.76', NULL, NULL, '172.16.50.76', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '84b4f548-56df-06e0-921c-dd8d26f8c8df', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.143350', '2018-12-25 06:14:07.531603', NULL, 1, 67, 0);
INSERT INTO `allhosts` VALUES (277, 'devzqjcyq-kf.veredholdings.cn', '172.16.50.71', NULL, NULL, '172.16.50.71', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'f6f9de95-a7e3-433a-0e7a-0211098d0097', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.238367', '2018-12-25 06:14:07.558310', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (278, 'devzqjcmc-kf.veredholdings.cn', '172.16.50.70', NULL, NULL, '172.16.50.70', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '436a3d38-446a-514f-b2d6-94fd3dc9dc98', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.325295', '2018-12-25 06:14:07.587401', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (279, 'fvtvfc-dmz01.veredholdings.cn', '172.16.50.73', NULL, NULL, '172.16.50.73', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '12f71672-2c6a-0236-11ea-2446a8addb99', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.441737', '2018-12-25 06:14:07.621212', NULL, 1, 67, 0);
INSERT INTO `allhosts` VALUES (280, 'devzqjcsjk-kf.veredholdings.cn', '172.16.50.72', NULL, NULL, '172.16.50.72', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '277247ef-af3b-a7c2-bdae-2125a1289e9d', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.532468', '2018-12-25 06:14:07.649824', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (281, 'fvtvfc-core01.veredholdings.cn', '172.16.50.79', NULL, NULL, '172.16.50.79', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'b8e6a46a-9681-0255-94d1-a70af94a72cd', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.612368', '2018-12-25 06:14:07.685245', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (282, 'fvtvfc-sec02.veredholdings.cn', '172.16.50.78', NULL, NULL, '172.16.50.78', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '9a3e7b46-6e01-4d83-50a2-8fcf10ebbb17', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.704170', '2018-12-25 06:14:07.712600', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (283, 'uatzqjcdb01-kf.veredholdings.cn', '172.16.50.174', NULL, NULL, '172.16.50.174', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'bd1d49b6-9925-d2ba-76a0-92b26c17d637', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.810117', '2018-12-25 06:14:07.741239', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (284, 'uatdatabus02-kf.veredholdings.cn', '172.16.50.177', NULL, NULL, '172.16.50.177', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '81c1648d-5bff-c194-4f50-e189bb20cc8a', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:44.922715', '2018-12-25 06:14:07.769888', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (285, 'uatdatabus01-kf.veredholdings.cn', '172.16.50.176', NULL, NULL, '172.16.50.176', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'c0fb65d2-aa4d-c57c-d6ea-f4aa58dd6056', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.059760', '2018-12-25 06:14:07.818630', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (286, 'uatzqjcyq02-kf.veredholdings.cn', '172.16.50.171', NULL, NULL, '172.16.50.171', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '9f92e5ea-3dc4-4eca-af0a-1e245b1c5b86', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.157486', '2018-12-25 06:14:07.852449', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (287, 'uatzqjcyq01-kf.veredholdings.cn', '172.16.50.170', NULL, NULL, '172.16.50.170', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '336aef7d-a440-3ba4-38a6-7bbb5bb3c4e7', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.249284', '2018-12-25 06:14:07.882410', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (288, 'uatzqjcweb02-kf.veredholdings.cn', '172.16.50.173', NULL, NULL, '172.16.50.173', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '817e5347-a13b-b059-1434-8aaf7316d470', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.330144', '2018-12-25 06:14:07.915425', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (289, 'uatzqjcweb01-kf.veredholdings.cn', '172.16.50.172', NULL, NULL, '172.16.50.172', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '02aaa06f-3eb6-d962-f0b8-db534b361da6', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.416145', '2018-12-25 06:14:07.944934', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (290, 'uatche300api02-kf.veredholdings.cn', '172.16.50.179', NULL, NULL, '172.16.50.179', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '583104b1-b286-92ff-a62f-beddfee9f9f5', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.502601', '2018-12-25 06:14:07.982557', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (291, 'dbopsplat', '172.16.50.220', NULL, NULL, '172.16.50.220', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d c2 60 64 75 8e 71-6b ee 4f c9 e9 5b 2e f7', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.596258', '2018-12-25 06:14:08.011507', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (292, 'scanhost', '172.16.50.223', NULL, NULL, '172.16.50.223', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d bd 67 5e fd 20 76-09 5a 49 00 6d c2 2e 58', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.685067', '2018-12-25 06:14:08.041737', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (293, 'mysql-upline', '172.16.50.222', NULL, NULL, '172.16.50.222', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d c8 6d 5e 9c 5c bd-19 d3 e9 29 6b de b1 c7', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.771595', '2018-12-25 06:14:08.074694', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (294, 'uatche300api01-kf.veredholdings.cn', '172.16.50.178', NULL, NULL, '172.16.50.178', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd1bb9e52-6291-25ba-6fe0-d7f0ad9ccd20', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.851716', '2018-12-25 06:14:08.109932', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (295, 'uatvfc-dmz01.veredholdings.cn', '172.16.50.164', NULL, NULL, '172.16.50.164', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '8112cd48-b0a8-1b24-e793-01eb73dbf6e0', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:45.937741', '2018-12-25 06:14:08.136442', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (296, 'uatvfc-dmz02.veredholdings.cn', '172.16.50.165', NULL, NULL, '172.16.50.165', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '61513b58-2c52-06bc-406c-6e73b4f3c4f3', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.016942', '2018-12-25 06:14:08.164995', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (297, 'uatvfc-sec02.veredholdings.cn', '172.16.50.168', NULL, NULL, '172.16.50.168', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '1f839743-67c1-8ce5-d353-0fd0164774ae', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.111875', '2018-12-25 06:14:08.194035', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (298, 'uatvfc-broker04.veredholdings.cn', '172.16.50.143', NULL, NULL, '172.16.50.143', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '7adc642f-7997-53dd-e829-0c4b6fbde4eb', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.194011', '2018-12-25 06:14:08.222347', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (299, 'fvtvfc-redis-zk03.veredholdings.cn', '172.16.50.88', NULL, NULL, '172.16.50.88', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '805ab9bd-1603-b107-397e-8f3ebb67b1e5', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.294395', '2018-12-25 06:14:08.252745', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (300, 'fvtvfc-mongodb01.veredholdings.cn', '172.16.50.89', NULL, NULL, '172.16.50.89', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'fa90a086-85b2-4883-6fe9-b99ec64b9b0e', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.401395', '2018-12-25 06:14:08.283838', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (301, 'uatzl-rbn-app01.veredholdings.cn', '172.16.50.209', NULL, NULL, '172.16.50.209', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '566a124e-1478-a628-3ab7-55487244ca9f', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.517813', '2018-12-25 06:14:08.315879', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (302, 'uatzl-rbn-db01.veredholdings.cn', '172.16.50.208', NULL, NULL, '172.16.50.208', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'ca8276b2-4cea-19ca-6133-8a13ba0ff55d', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.660835', '2018-12-25 06:14:08.350249', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (303, 'fvtvfc-core02.veredholdings.cn', '172.16.50.80', NULL, NULL, '172.16.50.80', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '4532910f-4b20-db19-8ec9-8761e1433d07', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.832760', '2018-12-25 06:14:08.386323', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (304, 'fvtvfc-core03.veredholdings.cn', '172.16.50.81', NULL, NULL, '172.16.50.81', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '21943fe4-b78a-d3bc-e4db-5c3276a10b96', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:46.938662', '2018-12-25 06:14:08.420204', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (305, 'fvtvfc-core04.veredholdings.cn', '172.16.50.82', NULL, NULL, '172.16.50.82', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '285f9a3f-9701-2acd-f5d6-1e1050b62cdf', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.030005', '2018-12-25 06:14:08.451269', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (306, 'broker-a', '172.16.50.83', NULL, NULL, '172.16.50.83', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '5ff22ba1-32c8-51b6-4ac7-4ab3431ec870', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.119138', '2018-12-25 06:14:08.486592', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (307, 'broker-a-s', '172.16.50.84', NULL, NULL, '172.16.50.84', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'ab6197f9-aa13-8d00-30c9-d9c17db36da0', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.209470', '2018-12-25 06:14:08.517024', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (308, 'fvtvfc-mysql01.veredholdings.cn', '172.16.50.85', NULL, NULL, '172.16.50.85', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '67362bf7-55aa-927a-5247-96e56b60192e', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.303622', '2018-12-25 06:14:08.550420', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (309, 'fvtvfc-redis-zk01.veredholdings.cn', '172.16.50.86', NULL, NULL, '172.16.50.86', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '88d9fdfd-3176-a2a7-c919-b65a0a5aeb54', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.397679', '2018-12-25 06:14:08.586310', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (310, 'fvtvfc-redis-zk02.veredholdings.cn', '172.16.50.87', NULL, NULL, '172.16.50.87', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '2a68c54a-5210-6f7c-d267-517ec413be95', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.471050', '2018-12-25 06:14:08.619198', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (311, 'uatvfc-nameserver01.veredholdings.cn', '172.16.50.144', NULL, NULL, '172.16.50.144', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'b8a55997-6f83-f5ce-7cf0-7ba08e7c503c', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.567285', '2018-12-25 06:14:08.653223', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (312, 'uat-cmdb01.veredholdings.cn', '172.16.50.145', NULL, NULL, '172.16.50.145', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'f3d769cc-0dad-4bcd-ca31-41c1846e1cdb', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.648829', '2018-12-25 06:14:08.686709', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (313, 'uatvfc-broker01.veredholdings.cn', '172.16.50.140', NULL, NULL, '172.16.50.140', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'c6c5525d-1f2e-fdc3-6380-43b5ecc37a9c', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.741587', '2018-12-25 06:14:08.718838', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (314, 'uatvfc-broker02.veredholdings.cn', '172.16.50.141', NULL, NULL, '172.16.50.141', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '2602d1c0-0d97-7363-f3ba-d0a2998198b8', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.841347', '2018-12-25 06:14:08.747320', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (315, 'uatvfc-broker03.veredholdings.cn', '172.16.50.142', NULL, NULL, '172.16.50.142', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '806d62a8-2a19-27ea-dbff-ac4d490edb60', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:47.954481', '2018-12-25 06:14:08.777319', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (316, 'cent6-fangtest-60-220', '172.16.50.230', NULL, NULL, '172.16.50.230', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d 37 ac c7 5f d4 76-f3 c5 5f ea 60 54 96 73', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.117870', '2018-12-25 06:14:08.804891', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (317, 'ldapslave', '172.16.50.214', NULL, NULL, '172.16.50.214', NULL, '虚拟机', NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d 43 7a 31 fd ab 79-fa 22 ef 1a 84 0d e9 2a', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.258495', '2019-01-23 09:20:32.022006', '', 1, 58, 0);
INSERT INTO `allhosts` VALUES (318, 'oraclerestore', '172.16.50.215', NULL, NULL, '172.16.50.215', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d 24 a8 71 e0 5b 6f-89 7d d2 24 f9 72 b3 33', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.350709', '2018-12-25 06:14:08.861436', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (319, 'roe', '172.16.50.216', NULL, NULL, '172.16.50.216', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d 0f 3d 5c d7 38 91-c4 42 3f 3a 28 97 90 ef', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.455223', '2018-12-25 06:14:08.892699', '', 1, NULL, 1);
INSERT INTO `allhosts` VALUES (320, 'localhost.localdomain', '172.16.50.210', NULL, NULL, '172.16.50.210', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'e72db40b-0aee-36af-9b4b-4fd22e0d7537', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.550682', '2018-12-25 06:14:08.919690', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (321, 'dev-50-211', '172.16.50.211', NULL, NULL, '172.16.50.211', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d 5f 1d 78 cb 77 04-60 fb e3 ff bf c3 ca a4', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.674865', '2018-12-25 06:14:08.950132', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (322, 'ldapmaster', '172.16.50.213', NULL, NULL, '172.16.50.213', NULL, '虚拟机', NULL, '1', 'VMware, Inc.VMware Virtual Platform', 'Intel(R) Xeon(R) CPU E5-2630 v4  2.20GHz', '4', '7822', '204800', 'VMware-56', NULL, NULL, NULL, NULL, '', 'CentOS 7.4.1708 64', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.761230', '2019-01-18 08:11:18.363189', '', 1, 58, 0);
INSERT INTO `allhosts` VALUES (323, 'fvtlb02.veredholdings.cn', '172.16.50.93', NULL, NULL, '172.16.50.93', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'dfe2beab-8bbc-d086-4bbf-8433cee03a36', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.846079', '2018-12-25 06:14:09.016842', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (324, 'fvtlb01.veredholdings.cn', '172.16.50.92', NULL, NULL, '172.16.50.94,172.16.50.92', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '51efb732-038f-30df-c520-b24ed2632674', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:48.937002', '2018-12-25 06:14:09.190019', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (325, 'fvtvfc-mongodb03.veredholdings.cn', '172.16.50.91', NULL, NULL, '172.16.50.91', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'ce15aa3a-8d97-724f-38bc-84a98b91eeb2', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.030521', '2018-12-25 06:14:09.073464', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (326, 'fvtvfc-mongodb02.veredholdings.cn', '172.16.50.90', NULL, NULL, '172.16.50.90', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'be07dcec-fbae-7b8b-0ba2-4246982c83c6', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.108655', '2018-12-25 06:14:09.103800', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (327, 'dbrestore.veredholdings.cn', '172.16.50.218', NULL, NULL, '172.16.50.218', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d d5 e7 da 66 07 f3-98 a8 bb 15 9e 67 58 8d', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.198875', '2018-12-25 06:14:09.131096', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (328, 'quant', '172.16.50.219', NULL, NULL, '172.16.50.219', NULL, NULL, NULL, '1', 'VMware, Inc.VMware Virtual Platform', NULL, NULL, NULL, NULL, 'VMware-56 4d 14 7c 2d 07 48 7d-ff fc 5f 5c d3 0d 67 e6', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.286443', '2018-12-25 06:14:09.159052', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (329, 'uatqczl-qz01.veredholdings.cn', '172.16.50.139', NULL, NULL, '172.16.50.139', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'f73e526a-7626-4ea3-f77a-a29a02cdf343', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.481535', '2018-12-25 06:14:09.220634', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (330, 'uatqczl-db01.veredholdings.cn', '172.16.50.138', NULL, NULL, '172.16.50.138', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'b7afa867-16d7-a2b0-33c6-2435bb44f5e3', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.574822', '2018-12-25 06:14:09.251433', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (331, 'uatblockchain01.veredholdings.cn', '172.16.50.133', NULL, NULL, '172.16.50.133', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '5af094e9-2608-d85f-b8c8-3e2532345a3f', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.667992', '2018-12-25 06:14:09.281414', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (332, 'uatqczl-oracle01.veredholdings.cn', '172.16.50.132', NULL, NULL, '172.16.50.132', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '34d03ea5-50d5-0e20-f150-31fb566992b3', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.763511', '2018-12-25 06:14:09.311198', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (333, 'uatblockchain03.veredholdings.cn', '172.16.50.135', NULL, NULL, '172.16.50.135', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'fe97ad72-ef2f-82c5-057b-4065ca69c1fe', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.849809', '2018-12-25 06:14:09.335204', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (334, 'uatblockchain02.veredholdings.cn', '172.16.50.134', NULL, NULL, '172.16.50.134', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'ee6e9867-6406-9416-cc13-471e4d021ae0', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:49.953425', '2018-12-25 06:14:09.363689', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (335, 'uatqczl-yq01.veredholdings.cn', '172.16.50.137', NULL, NULL, '172.16.50.137', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '1d07d70c-670f-ebff-ac04-f1a26c933afb', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.067066', '2018-12-25 06:14:09.394769', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (336, 'uatblockchain04.veredholdings.cn', '172.16.50.136', NULL, NULL, '172.16.50.136', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '0d2df011-4ece-eaeb-f4bb-0bff5526c4a4', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.156135', '2018-12-25 06:14:09.422392', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (337, 'wiki02.veredholdings.cn', '172.16.50.24', NULL, NULL, '172.16.50.24', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'e246466a-09c9-6040-b8c9-083419e4af59', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.249457', '2018-12-25 06:14:09.451133', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (338, 'uatqczl-mysql01.veredholdings.cn', '172.16.50.20', NULL, NULL, '172.16.50.20', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '774fdc73-842c-a91b-aa54-4676f70480f7', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.354783', '2018-12-25 06:14:09.481769', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (339, 'uatoa-app02.veredholdings.cn', '172.16.50.122', NULL, NULL, '172.16.50.122', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '3561a23b-f0ad-8864-6aa4-fcb622b1eb16', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.439367', '2018-12-25 06:14:09.514353', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (340, 'uatoa-oracle01.veredholdings.cn', '172.16.50.123', NULL, NULL, '172.16.50.123', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '10185344-a1e3-d909-8489-016beb736e67', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.522187', '2018-12-25 06:14:09.542515', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (341, 'uatoa-app01.veredholdings.cn', '172.16.50.121', NULL, NULL, '172.16.50.121', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '2118fd2e-519c-5c33-3c28-6a51b74e994f', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.604912', '2018-12-25 06:14:09.576799', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (342, 'uatwisdom-signDB01.veredholdings.cn', '172.16.50.126', NULL, NULL, '172.16.50.126', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '2c16a999-2bcc-af8d-7fcb-76de36641e11', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.698139', '2018-12-25 06:14:09.604800', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (343, 'uatwisdom-gateway01.veredholdings.cn', '172.16.50.127', NULL, NULL, '172.16.50.127', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '0a8e9138-05d7-5ade-2542-cfd7dec2bbce', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.801738', '2018-12-25 06:14:09.633074', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (344, 'uatwisdom-sign01.veredholdings.cn', '172.16.50.124', NULL, NULL, '172.16.50.124', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd75ac97b-e713-8580-c8dc-b06e65b7bf58', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:50.909094', '2018-12-25 06:14:09.673678', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (345, 'uatwisdom-sftp01.veredholdings.cn', '172.16.50.125', NULL, NULL, '172.16.50.125', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'c131d63a-559b-a3f2-0409-bdd96e787010', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.034608', '2018-12-25 06:14:09.702467', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (346, 'uatzabbix01.veredholdings.cn', '172.16.50.31', NULL, NULL, '172.16.50.31', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'f4e9656b-ab8d-52a1-a4e7-2e0b36ff72a0', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.129616', '2018-12-25 06:14:09.730656', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (347, 'uatanomaly-control01.veredholdings.cn', '172.16.50.59', NULL, NULL, '172.16.50.59', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '952f066c-27b1-04f5-4904-93add01ee3a0', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.222178', '2018-12-25 06:14:09.759060', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (348, 'uatetl-node01.veredholdings.cn', '172.16.50.58', NULL, NULL, '172.16.50.58', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd367b60c-ef19-b4ad-7e75-5d777d3b9cbb', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.296981', '2018-12-25 06:14:09.792171', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (349, 'uatclient-node01.veredholdings.cn', '172.16.50.57', NULL, NULL, '172.16.50.57', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'c2c77ecb-2657-81b1-59cd-32f5ddae4bfa', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.388932', '2018-12-25 06:14:09.823143', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (350, 'uatcontrol-node02.veredholdings.cn', '172.16.50.56', NULL, NULL, '172.16.50.52,172.16.50.56', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'dbc25aac-66e5-5f22-c0d5-beff90ff6815', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.472401', '2018-12-25 06:14:10.000007', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (351, 'uatdata-node03.veredholdings.cn', '172.16.50.55', NULL, NULL, '172.16.50.55', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'e600ef19-9e47-fda7-0705-2b231d2e5359', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.547937', '2018-12-25 06:14:09.888540', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (352, 'uatdata-node02.veredholdings.cn', '172.16.50.54', NULL, NULL, '172.16.50.54', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd1b10839-c14b-f503-5143-bbaf6bafa7cb', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.638898', '2018-12-25 06:14:09.917437', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (353, 'uatdata-node01.veredholdings.cn', '172.16.50.53', NULL, NULL, '172.16.50.53', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '37da7c5a-9692-ace1-f0d1-55f4854ce848', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.719682', '2018-12-25 06:14:09.971871', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (354, 'uatcontrol-node01.veredholdings.cn', '172.16.50.51', NULL, NULL, '172.16.50.51', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'dcdf1307-58a7-78c2-9bb3-67804929f5f4', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.906513', '2018-12-25 06:14:10.027160', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (355, 'uat-AIdata01.veredholdings.cn', '172.16.50.115', NULL, NULL, '172.16.50.115', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '0270fd78-53dc-fcfc-dc3d-4d1f2b9a5057', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:51.995761', '2018-12-25 06:14:10.054619', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (356, 'devmysql02.veredholdings.cn', '172.16.50.113', NULL, NULL, '172.16.50.113', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '22151e49-d15c-9687-a070-6f3fcaf37ec9', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:52.082209', '2018-12-25 06:14:10.087953', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (357, 'uatjenkins01.veredholdings.cn', '172.16.50.110', NULL, NULL, '172.16.50.110', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '18ed1e58-7eff-866b-c9c4-8ae7f457eaae', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:52.166858', '2018-12-25 06:14:10.129286', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (358, 'uatvfc-db-data03.veredholdings.cn', '172.16.50.199', NULL, NULL, '172.16.50.199', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'ecdb5a58-6440-2625-ff47-2e3e6c22bf68', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:52.260182', '2018-12-25 06:14:10.157384', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (359, 'uatvfc-db-data02.veredholdings.cn', '172.16.50.198', NULL, NULL, '172.16.50.198', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'f46eb5b4-6a22-66b0-feab-cc598096c2f1', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:52.356179', '2018-12-25 06:14:10.193799', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (360, 'uatvfc-db-data01.veredholdings.cn', '172.16.50.197', NULL, NULL, '172.16.50.197', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '3659ea29-8236-dbfb-b7cb-a7d803e68e3d', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:52.460716', '2018-12-25 06:14:10.222922', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (361, 'uatcx02.veredholdings.cn', '172.16.50.190', NULL, NULL, '172.16.50.190', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '487f9597-5a27-07bc-3ee2-1aed468d20a0', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 22, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-21 10:16:52.899546', '2018-12-25 06:14:10.344234', NULL, 1, NULL, 1);
INSERT INTO `allhosts` VALUES (362, 'zabbix01.veredholdings.cn', '10.0.8.40', NULL, NULL, '10.0.8.40', NULL, NULL, NULL, '1', 'Dell Inc.PowerEdge R730xd', NULL, NULL, NULL, NULL, '6YHDMM2', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.260642', '2018-12-27 07:28:46.260746', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (363, 'elk-node01.veredholdings.cn', '10.0.8.46', NULL, NULL, '10.0.8.44,10.0.8.46', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'ff5a2c0b-aea4-069b-ccc6-c7abff1685d7', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.298123', '2018-12-27 07:28:46.377541', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (364, 'elk-node03.veredholdings.cn', '10.0.8.47', NULL, NULL, '10.0.8.47', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '7fdb505d-b220-96d5-5305-1ea0f05c64d3', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.338048', '2018-12-27 07:28:46.338115', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (365, 'elk-node02.veredholdings.cn', '10.0.8.45', NULL, NULL, '10.0.8.45', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '2b8bb526-48c1-afbb-51ea-a2ae75170519', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.4', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.409916', '2018-12-27 07:28:46.409994', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (366, 'squid01.veredholdings.cn', '10.0.8.56', NULL, NULL, '10.0.8.56', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'c1a62f21-cf3c-b79a-63ae-a99b053cbb80', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.444456', '2018-12-27 07:28:46.444512', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (367, 'backup.veredholdings.cn', '10.0.8.30', NULL, NULL, '10.0.8.30', NULL, NULL, NULL, '1', 'Dell Inc.PowerEdge R730xd', NULL, NULL, NULL, NULL, '6QYHMM2', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.475196', '2018-12-27 07:28:46.475254', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (368, 'cmdb02.veredholdings.cn', '10.0.8.77', NULL, NULL, '10.0.8.77', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '55a3d1cb-9f81-c619-1d73-f57b821055d9', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.507118', '2018-12-27 07:48:08.096290', '', 2, 58, 0);
INSERT INTO `allhosts` VALUES (369, 'cmdb01.veredholdings.cn', '10.0.8.76', NULL, NULL, '10.0.8.78,10.0.8.76', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '2c147e1d-b284-f800-b845-0d05dd4c2bb5', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.541087', '2018-12-27 07:28:46.752006', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (370, 'cmdb-mysql01.veredholdings.cn', '10.0.8.75', NULL, NULL, '10.0.8.73,10.0.8.75', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '4bfa3463-2216-a565-cea2-11a09baba89a', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.569655', '2018-12-27 07:28:46.626447', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (371, 'cmdb-mysql02.veredholdings.cn', '10.0.8.74', NULL, NULL, '10.0.8.74', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '20a37e10-68a7-6987-935f-35dd806eca79', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.596047', '2018-12-27 07:28:46.596112', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (372, 'cmdb-ops02.veredholdings.cn', '10.0.8.72', NULL, NULL, '10.0.8.72', NULL, '虚拟机', NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'ce48c343-b6cd-9aee-98c7-5bae9a65d532', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.657791', '2018-12-27 07:48:29.668004', '', 2, 58, 0);
INSERT INTO `allhosts` VALUES (373, 'cmdb-ops01.veredholdings.cn', '10.0.8.71', NULL, NULL, '10.0.8.70,10.0.8.71', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd66af17a-7202-32f9-a18b-e2d35a885563', NULL, NULL, NULL, NULL, '', 'CentOS Linux 7.5', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.693148', '2018-12-27 07:28:46.723373', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (374, 'jump-lvs01.veredholdings.cn', '10.0.8.24', NULL, NULL, '10.0.8.22,10.0.8.24', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, '651601b9-d70a-16fc-a585-32334a1acf71', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.783562', '2018-12-27 07:28:46.850177', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (375, 'yum.veredholdings.cn', '10.0.8.50', NULL, NULL, '10.0.8.50', NULL, NULL, NULL, '1', 'Dell Inc.PowerEdge R730xd', NULL, NULL, NULL, NULL, '6QVDMM2', NULL, NULL, NULL, NULL, '', 'CentOS 6.10', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.812295', '2018-12-27 07:28:46.812354', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (376, 'jump-lvs02.veredholdings.cn', '10.0.8.23', NULL, NULL, '10.0.8.23', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'd32d3694-9624-6b44-e7f9-7735709ad358', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.881168', '2018-12-27 07:28:46.881224', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (377, 'jenkins01.veredholdings.cn', '10.0.8.60', NULL, NULL, '10.0.8.60', NULL, NULL, NULL, '1', 'Dell Inc.PowerEdge R730', NULL, NULL, NULL, NULL, 'C8BDMM2', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.915315', '2018-12-27 07:28:46.915369', NULL, 2, NULL, 1);
INSERT INTO `allhosts` VALUES (378, 'jenkins02.veredholdings.cn', '10.0.8.61', NULL, NULL, '10.0.8.61', NULL, NULL, NULL, '1', 'XenHVM domU', NULL, NULL, NULL, NULL, 'a77af03b-84bd-239e-2591-7d1eb3f5c67f', NULL, NULL, NULL, NULL, '', 'CentOS 6.9', 6666, 'root', 'aksejriewjfsadlfjiewqfjojfa;lsjfie', NULL, NULL, 1, '2018-01-01', '2019-01-01', '2018-12-27 07:28:46.948007', '2018-12-27 07:28:46.948064', NULL, 2, NULL, 1);

-- ----------------------------
-- Table structure for ansible_inventory
-- ----------------------------
DROP TABLE IF EXISTS `ansible_inventory`;
CREATE TABLE `ansible_inventory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` smallint(6) NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ansible_inventory_groups
-- ----------------------------
DROP TABLE IF EXISTS `ansible_inventory_groups`;
CREATE TABLE `ansible_inventory_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ext_vars` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `inventory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opsmanage_ansible_invent_inventory_id_group_name_488fbacf_uniq`(`inventory_id`, `group_name`) USING BTREE,
  CONSTRAINT `opsmanage_ansible_in_inventory_id_826d0d81_fk_opsmanage` FOREIGN KEY (`inventory_id`) REFERENCES `ansible_inventory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ansible_inventory_groups_host
-- ----------------------------
DROP TABLE IF EXISTS `ansible_inventory_groups_host`;
CREATE TABLE `ansible_inventory_groups_host`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` smallint(6) NOT NULL,
  `groups_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opsmanage_ansible_invent_groups_id_server_f1db7e0e_uniq`(`groups_id`, `server`) USING BTREE,
  CONSTRAINT `opsmanage_ansible_in_groups_id_4a4b0eb0_fk_opsmanage` FOREIGN KEY (`groups_id`) REFERENCES `ansible_inventory_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ansible_playbook
-- ----------------------------
DROP TABLE IF EXISTS `ansible_playbook`;
CREATE TABLE `ansible_playbook`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playbook_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `playbook_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `playbook_vars` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `playbook_uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `playbook_server_model` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `playbook_server_value` smallint(6) DEFAULT NULL,
  `playbook_file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `playbook_auth_group` smallint(6) DEFAULT NULL,
  `playbook_auth_user` smallint(6) DEFAULT NULL,
  `playbook_type` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `playbook_name`(`playbook_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ansible_playbook_number
-- ----------------------------
DROP TABLE IF EXISTS `ansible_playbook_number`;
CREATE TABLE `ansible_playbook_number`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playbook_host` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `playbook_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `opsmanage_ansible_pl_playbook_id_eac34b37_fk_opsmanage`(`playbook_id`) USING BTREE,
  CONSTRAINT `opsmanage_ansible_pl_playbook_id_eac34b37_fk_opsmanage` FOREIGN KEY (`playbook_id`) REFERENCES `ansible_playbook` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ansible_script
-- ----------------------------
DROP TABLE IF EXISTS `ansible_script`;
CREATE TABLE `ansible_script`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `script_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `script_uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script_server` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `script_file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `script_args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `script_group` smallint(6) DEFAULT NULL,
  `script_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_prod` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `script_name`(`script_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (3, 'DBA组');
INSERT INTO `auth_group` VALUES (5, '应用运维组');
INSERT INTO `auth_group` VALUES (7, '开发人员');
INSERT INTO `auth_group` VALUES (1, '运维开发组');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 936 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (9, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add permission', 5, 'add_permission');
INSERT INTO `auth_permission` VALUES (15, 'Can change permission', 5, 'change_permission');
INSERT INTO `auth_permission` VALUES (17, 'Can delete permission', 5, 'delete_permission');
INSERT INTO `auth_permission` VALUES (19, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (21, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (25, 'Can add content type', 9, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (27, 'Can change content type', 9, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (29, 'Can delete content type', 9, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (31, 'Can add session', 11, 'add_session');
INSERT INTO `auth_permission` VALUES (33, 'Can change session', 11, 'change_session');
INSERT INTO `auth_permission` VALUES (35, 'Can delete session', 11, 'delete_session');
INSERT INTO `auth_permission` VALUES (37, 'Can add user profile', 13, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (39, 'Can change user profile', 13, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (41, 'Can delete user profile', 13, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (43, 'Can add 菜单', 15, 'add_menus');
INSERT INTO `auth_permission` VALUES (45, 'Can change 菜单', 15, 'change_menus');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 菜单', 15, 'delete_menus');
INSERT INTO `auth_permission` VALUES (49, 'Can add role', 17, 'add_role');
INSERT INTO `auth_permission` VALUES (51, 'Can change role', 17, 'change_role');
INSERT INTO `auth_permission` VALUES (53, 'Can delete role', 17, 'delete_role');
INSERT INTO `auth_permission` VALUES (55, 'Can add yewu tree', 19, 'add_yewutree');
INSERT INTO `auth_permission` VALUES (57, 'Can change yewu tree', 19, 'change_yewutree');
INSERT INTO `auth_permission` VALUES (59, 'Can delete yewu tree', 19, 'delete_yewutree');
INSERT INTO `auth_permission` VALUES (61, 'Can add inter face', 21, 'add_interface');
INSERT INTO `auth_permission` VALUES (63, 'Can change inter face', 21, 'change_interface');
INSERT INTO `auth_permission` VALUES (65, 'Can delete inter face', 21, 'delete_interface');
INSERT INTO `auth_permission` VALUES (67, 'Can add ip source', 23, 'add_ipsource');
INSERT INTO `auth_permission` VALUES (69, 'Can change ip source', 23, 'change_ipsource');
INSERT INTO `auth_permission` VALUES (71, 'Can delete ip source', 23, 'delete_ipsource');
INSERT INTO `auth_permission` VALUES (73, 'Can add net device', 25, 'add_netdevice');
INSERT INTO `auth_permission` VALUES (75, 'Can change net device', 25, 'change_netdevice');
INSERT INTO `auth_permission` VALUES (77, 'Can delete net device', 25, 'delete_netdevice');
INSERT INTO `auth_permission` VALUES (79, 'Can add 数据中心', 27, 'add_idc');
INSERT INTO `auth_permission` VALUES (81, 'Can change 数据中心', 27, 'change_idc');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 数据中心', 27, 'delete_idc');
INSERT INTO `auth_permission` VALUES (85, 'Can add net group', 29, 'add_netgroup');
INSERT INTO `auth_permission` VALUES (87, 'Can change net group', 29, 'change_netgroup');
INSERT INTO `auth_permission` VALUES (89, 'Can delete net group', 29, 'delete_netgroup');
INSERT INTO `auth_permission` VALUES (91, 'Can add user profile', 31, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (93, 'Can change user profile', 31, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (95, 'Can delete user profile', 31, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (97, 'Can add role', 33, 'add_role');
INSERT INTO `auth_permission` VALUES (99, 'Can change role', 33, 'change_role');
INSERT INTO `auth_permission` VALUES (101, 'Can delete role', 33, 'delete_role');
INSERT INTO `auth_permission` VALUES (103, 'Can add Menus', 35, 'add_menus');
INSERT INTO `auth_permission` VALUES (105, 'Can change Menus', 35, 'change_menus');
INSERT INTO `auth_permission` VALUES (107, 'Can delete Menus', 35, 'delete_menus');
INSERT INTO `auth_permission` VALUES (109, 'Can add productline', 37, 'add_productline');
INSERT INTO `auth_permission` VALUES (111, 'Can change productline', 37, 'change_productline');
INSERT INTO `auth_permission` VALUES (113, 'Can delete productline', 37, 'delete_productline');
INSERT INTO `auth_permission` VALUES (115, 'Can add Oracle集群一个实例', 39, 'add_oracle_instance');
INSERT INTO `auth_permission` VALUES (117, 'Can change Oracle集群一个实例', 39, 'change_oracle_instance');
INSERT INTO `auth_permission` VALUES (119, 'Can delete Oracle集群一个实例', 39, 'delete_oracle_instance');
INSERT INTO `auth_permission` VALUES (121, 'Can add Oracle用户', 41, 'add_oracleuser');
INSERT INTO `auth_permission` VALUES (123, 'Can change Oracle用户', 41, 'change_oracleuser');
INSERT INTO `auth_permission` VALUES (125, 'Can delete Oracle用户', 41, 'delete_oracleuser');
INSERT INTO `auth_permission` VALUES (127, 'Can add mysql内部DB', 43, 'add_mysql_db');
INSERT INTO `auth_permission` VALUES (129, 'Can change mysql内部DB', 43, 'change_mysql_db');
INSERT INTO `auth_permission` VALUES (131, 'Can delete mysql内部DB', 43, 'delete_mysql_db');
INSERT INTO `auth_permission` VALUES (133, 'Can add Oracle 集群', 45, 'add_oraclecluster');
INSERT INTO `auth_permission` VALUES (135, 'Can change Oracle 集群', 45, 'change_oraclecluster');
INSERT INTO `auth_permission` VALUES (137, 'Can delete Oracle 集群', 45, 'delete_oraclecluster');
INSERT INTO `auth_permission` VALUES (139, 'Can add mysql集群一个实例', 47, 'add_mysql_instance');
INSERT INTO `auth_permission` VALUES (141, 'Can change mysql集群一个实例', 47, 'change_mysql_instance');
INSERT INTO `auth_permission` VALUES (143, 'Can delete mysql集群一个实例', 47, 'delete_mysql_instance');
INSERT INTO `auth_permission` VALUES (145, 'Can add Oracle 表空间', 49, 'add_oracletablespace');
INSERT INTO `auth_permission` VALUES (147, 'Can change Oracle 表空间', 49, 'change_oracletablespace');
INSERT INTO `auth_permission` VALUES (149, 'Can delete Oracle 表空间', 49, 'delete_oracletablespace');
INSERT INTO `auth_permission` VALUES (151, 'Can add mysql集群', 51, 'add_mysqlcluster');
INSERT INTO `auth_permission` VALUES (153, 'Can change mysql集群', 51, 'change_mysqlcluster');
INSERT INTO `auth_permission` VALUES (155, 'Can delete mysql集群', 51, 'delete_mysqlcluster');
INSERT INTO `auth_permission` VALUES (157, '读取资产权限', 51, 'can_read_mysql_cluster');
INSERT INTO `auth_permission` VALUES (159, '更改资产权限', 51, 'can_change_mysql_cluster');
INSERT INTO `auth_permission` VALUES (161, '添加资产权限', 51, 'can_add_mysql_cluster');
INSERT INTO `auth_permission` VALUES (163, '删除资产权限', 51, 'can_delete_mysql_cluster');
INSERT INTO `auth_permission` VALUES (165, '导出资产权限', 51, 'can_dumps_mysql_cluster');
INSERT INTO `auth_permission` VALUES (167, 'Can add mysql内部用户', 53, 'add_mysql_user');
INSERT INTO `auth_permission` VALUES (169, 'Can change mysql内部用户', 53, 'change_mysql_user');
INSERT INTO `auth_permission` VALUES (171, 'Can delete mysql内部用户', 53, 'delete_mysql_user');
INSERT INTO `auth_permission` VALUES (173, 'Can add 登陆失败主机', 55, 'add_host_fail');
INSERT INTO `auth_permission` VALUES (175, 'Can change 登陆失败主机', 55, 'change_host_fail');
INSERT INTO `auth_permission` VALUES (177, 'Can delete 登陆失败主机', 55, 'delete_host_fail');
INSERT INTO `auth_permission` VALUES (179, 'Can add 主机资产', 57, 'add_host');
INSERT INTO `auth_permission` VALUES (181, 'Can change 主机资产', 57, 'change_host');
INSERT INTO `auth_permission` VALUES (183, 'Can delete 主机资产', 57, 'delete_host');
INSERT INTO `auth_permission` VALUES (185, 'Can add host group', 59, 'add_hostgroup');
INSERT INTO `auth_permission` VALUES (187, 'Can change host group', 59, 'change_hostgroup');
INSERT INTO `auth_permission` VALUES (189, 'Can delete host group', 59, 'delete_hostgroup');
INSERT INTO `auth_permission` VALUES (191, 'Can add larryMenus', 61, 'add_larrymenus');
INSERT INTO `auth_permission` VALUES (193, 'Can change larryMenus', 61, 'change_larrymenus');
INSERT INTO `auth_permission` VALUES (195, 'Can delete larryMenus', 61, 'delete_larrymenus');
INSERT INTO `auth_permission` VALUES (197, 'Can add Token', 63, 'add_token');
INSERT INTO `auth_permission` VALUES (199, 'Can change Token', 63, 'change_token');
INSERT INTO `auth_permission` VALUES (201, 'Can delete Token', 63, 'delete_token');
INSERT INTO `auth_permission` VALUES (203, 'Can add 机房资产表', 65, 'add_zone_assets');
INSERT INTO `auth_permission` VALUES (205, 'Can change 机房资产表', 65, 'change_zone_assets');
INSERT INTO `auth_permission` VALUES (207, 'Can delete 机房资产表', 65, 'delete_zone_assets');
INSERT INTO `auth_permission` VALUES (209, '读取机房资产权限', 65, 'can_read_zone_assets');
INSERT INTO `auth_permission` VALUES (211, '更改机房资产权限', 65, 'can_change_zone_assets');
INSERT INTO `auth_permission` VALUES (213, '添加机房资产权限', 65, 'can_add_zone_assets');
INSERT INTO `auth_permission` VALUES (215, '删除机房资产权限', 65, 'can_delete_zone_assets');
INSERT INTO `auth_permission` VALUES (217, 'Can add 磁盘资产表', 67, 'add_disk_assets');
INSERT INTO `auth_permission` VALUES (219, 'Can change 磁盘资产表', 67, 'change_disk_assets');
INSERT INTO `auth_permission` VALUES (221, 'Can delete 磁盘资产表', 67, 'delete_disk_assets');
INSERT INTO `auth_permission` VALUES (223, '读取磁盘资产权限', 67, 'can_read_disk_assets');
INSERT INTO `auth_permission` VALUES (225, '更改磁盘资产权限', 67, 'can_change_disk_assets');
INSERT INTO `auth_permission` VALUES (227, '添加磁盘资产权限', 67, 'can_add_disk_assets');
INSERT INTO `auth_permission` VALUES (229, '删除磁盘资产权限', 67, 'can_delete_disk_assets');
INSERT INTO `auth_permission` VALUES (231, 'Can add 总资产表', 69, 'add_assets');
INSERT INTO `auth_permission` VALUES (233, 'Can change 总资产表', 69, 'change_assets');
INSERT INTO `auth_permission` VALUES (235, 'Can delete 总资产表', 69, 'delete_assets');
INSERT INTO `auth_permission` VALUES (237, '读取资产权限', 69, 'can_read_assets');
INSERT INTO `auth_permission` VALUES (239, '更改资产权限', 69, 'can_change_assets');
INSERT INTO `auth_permission` VALUES (241, '添加资产权限', 69, 'can_add_assets');
INSERT INTO `auth_permission` VALUES (243, '删除资产权限', 69, 'can_delete_assets');
INSERT INTO `auth_permission` VALUES (245, '导出资产权限', 69, 'can_dumps_assets');
INSERT INTO `auth_permission` VALUES (247, 'Can add 项目配置操作记录表', 71, 'add_log_assets');
INSERT INTO `auth_permission` VALUES (249, 'Can change 项目配置操作记录表', 71, 'change_log_assets');
INSERT INTO `auth_permission` VALUES (251, 'Can delete 项目配置操作记录表', 71, 'delete_log_assets');
INSERT INTO `auth_permission` VALUES (253, 'Can add 业务分组表', 73, 'add_service_assets');
INSERT INTO `auth_permission` VALUES (255, 'Can change 业务分组表', 73, 'change_service_assets');
INSERT INTO `auth_permission` VALUES (257, 'Can delete 业务分组表', 73, 'delete_service_assets');
INSERT INTO `auth_permission` VALUES (259, '读取业务资产权限', 73, 'can_read_service_assets');
INSERT INTO `auth_permission` VALUES (261, '更改业务资产权限', 73, 'can_change_service_assets');
INSERT INTO `auth_permission` VALUES (263, '添加业务资产权限', 73, 'can_add_service_assets');
INSERT INTO `auth_permission` VALUES (265, '删除业务资产权限', 73, 'can_delete_service_assets');
INSERT INTO `auth_permission` VALUES (267, 'Can add 项目资产表', 75, 'add_project_assets');
INSERT INTO `auth_permission` VALUES (269, 'Can change 项目资产表', 75, 'change_project_assets');
INSERT INTO `auth_permission` VALUES (271, 'Can delete 项目资产表', 75, 'delete_project_assets');
INSERT INTO `auth_permission` VALUES (273, '读取产品线权限', 75, 'can_read_project_assets');
INSERT INTO `auth_permission` VALUES (275, '更改产品线权限', 75, 'can_change_project_assets');
INSERT INTO `auth_permission` VALUES (277, '添加产品线权限', 75, 'can_add_project_assets');
INSERT INTO `auth_permission` VALUES (279, '删除产品线权限', 75, 'can_delete_project_assets');
INSERT INTO `auth_permission` VALUES (281, 'Can add Raid资产表', 77, 'add_raid_assets');
INSERT INTO `auth_permission` VALUES (283, 'Can change Raid资产表', 77, 'change_raid_assets');
INSERT INTO `auth_permission` VALUES (285, 'Can delete Raid资产表', 77, 'delete_raid_assets');
INSERT INTO `auth_permission` VALUES (287, '读取Raid资产权限', 77, 'can_read_raid_assets');
INSERT INTO `auth_permission` VALUES (289, '更改Raid资产权限', 77, 'can_change_raid_assets');
INSERT INTO `auth_permission` VALUES (291, '添加Raid资产权限', 77, 'can_add_raid_assets');
INSERT INTO `auth_permission` VALUES (293, '删除Raid资产权限', 77, 'can_delete_raid_assets');
INSERT INTO `auth_permission` VALUES (295, 'Can add 出口线路资产表', 79, 'add_line_assets');
INSERT INTO `auth_permission` VALUES (297, 'Can change 出口线路资产表', 79, 'change_line_assets');
INSERT INTO `auth_permission` VALUES (299, 'Can delete 出口线路资产表', 79, 'delete_line_assets');
INSERT INTO `auth_permission` VALUES (301, '读取出口线路资产权限', 79, 'can_read_line_assets');
INSERT INTO `auth_permission` VALUES (303, '更改出口线路资产权限', 79, 'can_change_line_assetss');
INSERT INTO `auth_permission` VALUES (305, '添加出口线路资产权限', 79, 'can_add_line_assets');
INSERT INTO `auth_permission` VALUES (307, '删除出口线路资产权限', 79, 'can_delete_line_assets');
INSERT INTO `auth_permission` VALUES (309, 'Can add 服务器资产表', 81, 'add_server_assets');
INSERT INTO `auth_permission` VALUES (311, 'Can change 服务器资产表', 81, 'change_server_assets');
INSERT INTO `auth_permission` VALUES (313, 'Can delete 服务器资产表', 81, 'delete_server_assets');
INSERT INTO `auth_permission` VALUES (315, '读取服务器资产权限', 81, 'can_read_server_assets');
INSERT INTO `auth_permission` VALUES (317, '更改服务器资产权限', 81, 'can_change_server_assets');
INSERT INTO `auth_permission` VALUES (319, '添加服务器资产权限', 81, 'can_add_server_assets');
INSERT INTO `auth_permission` VALUES (321, '删除服务器资产权限', 81, 'can_delete_server_assets');
INSERT INTO `auth_permission` VALUES (323, 'Can add 内存资产表', 83, 'add_ram_assets');
INSERT INTO `auth_permission` VALUES (325, 'Can change 内存资产表', 83, 'change_ram_assets');
INSERT INTO `auth_permission` VALUES (327, 'Can delete 内存资产表', 83, 'delete_ram_assets');
INSERT INTO `auth_permission` VALUES (329, '读取内存资产权限', 83, 'can_read_ram_assets');
INSERT INTO `auth_permission` VALUES (331, '更改内存资产权限', 83, 'can_change_ram_assets');
INSERT INTO `auth_permission` VALUES (333, '添加内存资产权限', 83, 'can_add_ram_assets');
INSERT INTO `auth_permission` VALUES (335, '删除内存资产权限', 83, 'can_delete_ram_assets');
INSERT INTO `auth_permission` VALUES (337, 'Can add 服务器网卡资产表', 85, 'add_networkcard_assets');
INSERT INTO `auth_permission` VALUES (339, 'Can change 服务器网卡资产表', 85, 'change_networkcard_assets');
INSERT INTO `auth_permission` VALUES (341, 'Can delete 服务器网卡资产表', 85, 'delete_networkcard_assets');
INSERT INTO `auth_permission` VALUES (343, 'Can add 用户服务器表', 87, 'add_user_server');
INSERT INTO `auth_permission` VALUES (345, 'Can change 用户服务器表', 87, 'change_user_server');
INSERT INTO `auth_permission` VALUES (347, 'Can delete 用户服务器表', 87, 'delete_user_server');
INSERT INTO `auth_permission` VALUES (349, '读取用户服务器表权限', 87, 'can_read_user_server');
INSERT INTO `auth_permission` VALUES (351, '更改用户服务器表权限', 87, 'can_change_user_server');
INSERT INTO `auth_permission` VALUES (353, '添加用户服务器表权限', 87, 'can_add_user_server');
INSERT INTO `auth_permission` VALUES (355, '删除用户服务器表权限', 87, 'can_delete_user_server');
INSERT INTO `auth_permission` VALUES (357, 'Can add 服务器操作日志表', 89, 'add_server_command_record');
INSERT INTO `auth_permission` VALUES (359, 'Can change 服务器操作日志表', 89, 'change_server_command_record');
INSERT INTO `auth_permission` VALUES (361, 'Can delete 服务器操作日志表', 89, 'delete_server_command_record');
INSERT INTO `auth_permission` VALUES (363, '读取服务器操作日志权限', 89, 'can_read_server_command_record');
INSERT INTO `auth_permission` VALUES (365, '更改服务器操作日志权限', 89, 'can_change_server_command_record');
INSERT INTO `auth_permission` VALUES (367, '添加服务器操作日志权限', 89, 'can_add_server_command_record');
INSERT INTO `auth_permission` VALUES (369, '删除服务器操作日志权限', 89, 'can_delete_server_command_record');
INSERT INTO `auth_permission` VALUES (371, 'Can add global_ config', 91, 'add_global_config');
INSERT INTO `auth_permission` VALUES (373, 'Can change global_ config', 91, 'change_global_config');
INSERT INTO `auth_permission` VALUES (375, 'Can delete global_ config', 91, 'delete_global_config');
INSERT INTO `auth_permission` VALUES (377, 'Can add email_ config', 93, 'add_email_config');
INSERT INTO `auth_permission` VALUES (379, 'Can change email_ config', 93, 'change_email_config');
INSERT INTO `auth_permission` VALUES (381, 'Can delete email_ config', 93, 'delete_email_config');
INSERT INTO `auth_permission` VALUES (383, 'Can add inception信息表', 95, 'add_inception_server_config');
INSERT INTO `auth_permission` VALUES (385, 'Can change inception信息表', 95, 'change_inception_server_config');
INSERT INTO `auth_permission` VALUES (387, 'Can delete inception信息表', 95, 'delete_inception_server_config');
INSERT INTO `auth_permission` VALUES (389, '读取inception信息表权限', 95, 'can_read_inception_server_config');
INSERT INTO `auth_permission` VALUES (391, '更改inception信息表权限', 95, 'can_change_inception_server_config');
INSERT INTO `auth_permission` VALUES (393, '添加inception信息表权限', 95, 'can_add_inception_server_config');
INSERT INTO `auth_permission` VALUES (395, '删除inception信息表权限', 95, 'can_delete_inception_server_config');
INSERT INTO `auth_permission` VALUES (397, 'Can add 数据库信息表', 97, 'add_database_server_config');
INSERT INTO `auth_permission` VALUES (399, 'Can change 数据库信息表', 97, 'change_database_server_config');
INSERT INTO `auth_permission` VALUES (401, 'Can delete 数据库信息表', 97, 'delete_database_server_config');
INSERT INTO `auth_permission` VALUES (403, '读取数据库信息表权限', 97, 'can_read_database_server_config');
INSERT INTO `auth_permission` VALUES (405, '更改数据库信息表权限', 97, 'can_change_database_server_config');
INSERT INTO `auth_permission` VALUES (407, '添加数据库信息表权限', 97, 'can_add_database_server_config');
INSERT INTO `auth_permission` VALUES (409, '删除数据库信息表权限', 97, 'can_delete_database_server_config');
INSERT INTO `auth_permission` VALUES (411, 'Can add SQL执行历史记录表', 99, 'add_sql_execute_histroy');
INSERT INTO `auth_permission` VALUES (413, 'Can change SQL执行历史记录表', 99, 'change_sql_execute_histroy');
INSERT INTO `auth_permission` VALUES (415, 'Can delete SQL执行历史记录表', 99, 'delete_sql_execute_histroy');
INSERT INTO `auth_permission` VALUES (417, '读取SQL执行历史表权限', 99, 'can_read_sql_execute_histroy');
INSERT INTO `auth_permission` VALUES (419, '更改SQL执行历史表权限', 99, 'can_change_sql_execute_histroy');
INSERT INTO `auth_permission` VALUES (421, '添加SQL执行历史表权限', 99, 'can_add_sql_execute_histroy');
INSERT INTO `auth_permission` VALUES (423, '删除SQL执行历史表权限', 99, 'can_delete_sql_execute_histroy');
INSERT INTO `auth_permission` VALUES (425, 'Can add 自定义高危SQL表', 101, 'add_custom_high_risk_sql');
INSERT INTO `auth_permission` VALUES (427, 'Can change 自定义高危SQL表', 101, 'change_custom_high_risk_sql');
INSERT INTO `auth_permission` VALUES (429, 'Can delete 自定义高危SQL表', 101, 'delete_custom_high_risk_sql');
INSERT INTO `auth_permission` VALUES (431, '读取高危SQL表权限', 101, 'can_read_custom_high_risk_sql');
INSERT INTO `auth_permission` VALUES (433, '更改高危SQL表权限', 101, 'can_change_custom_high_risk_sql');
INSERT INTO `auth_permission` VALUES (435, '添加高危SQL表权限', 101, 'can_add_custom_high_risk_sql');
INSERT INTO `auth_permission` VALUES (437, '删除高危SQL表权限', 101, 'can_delete_custom_high_risk_sql');
INSERT INTO `auth_permission` VALUES (439, 'Can add SQL审核配置', 103, 'add_sql_audit_control');
INSERT INTO `auth_permission` VALUES (441, 'Can change SQL审核配置', 103, 'change_sql_audit_control');
INSERT INTO `auth_permission` VALUES (443, 'Can delete SQL审核配置', 103, 'delete_sql_audit_control');
INSERT INTO `auth_permission` VALUES (445, '读取SQL审核配置表权限', 103, 'can_read_sql_audit_control');
INSERT INTO `auth_permission` VALUES (447, '更改SQL审核配置表权限', 103, 'can_change_sql_audit_control');
INSERT INTO `auth_permission` VALUES (449, '添加SQL审核配置权限', 103, 'can_add_sql_audit_control');
INSERT INTO `auth_permission` VALUES (451, '删除SQL审核配置权限', 103, 'can_delete_sql_audit_control');
INSERT INTO `auth_permission` VALUES (453, 'Can add 项目资产表', 105, 'add_project_assets');
INSERT INTO `auth_permission` VALUES (455, 'Can change 项目资产表', 105, 'change_project_assets');
INSERT INTO `auth_permission` VALUES (457, 'Can delete 项目资产表', 105, 'delete_project_assets');
INSERT INTO `auth_permission` VALUES (459, '读取产品线权限', 105, 'can_read_project_assets');
INSERT INTO `auth_permission` VALUES (461, '更改产品线权限', 105, 'can_change_project_assets');
INSERT INTO `auth_permission` VALUES (463, '添加产品线权限', 105, 'can_add_project_assets');
INSERT INTO `auth_permission` VALUES (465, '删除产品线权限', 105, 'can_delete_project_assets');
INSERT INTO `auth_permission` VALUES (467, 'Can add 业务分组表', 107, 'add_service_assets');
INSERT INTO `auth_permission` VALUES (469, 'Can change 业务分组表', 107, 'change_service_assets');
INSERT INTO `auth_permission` VALUES (471, 'Can delete 业务分组表', 107, 'delete_service_assets');
INSERT INTO `auth_permission` VALUES (473, '读取业务资产权限', 107, 'can_read_service_assets');
INSERT INTO `auth_permission` VALUES (475, '更改业务资产权限', 107, 'can_change_service_assets');
INSERT INTO `auth_permission` VALUES (477, '添加业务资产权限', 107, 'can_add_service_assets');
INSERT INTO `auth_permission` VALUES (479, '删除业务资产权限', 107, 'can_delete_service_assets');
INSERT INTO `auth_permission` VALUES (481, 'Can add 项目管理表', 109, 'add_project_config');
INSERT INTO `auth_permission` VALUES (483, 'Can change 项目管理表', 109, 'change_project_config');
INSERT INTO `auth_permission` VALUES (485, 'Can delete 项目管理表', 109, 'delete_project_config');
INSERT INTO `auth_permission` VALUES (487, '读取项目部署权限', 109, 'can_read_project_config');
INSERT INTO `auth_permission` VALUES (489, '更改项目部署权限', 109, 'can_change_project_config');
INSERT INTO `auth_permission` VALUES (491, '添加项目部署权限', 109, 'can_add_project_config');
INSERT INTO `auth_permission` VALUES (493, '删除项目部署权限', 109, 'can_delete_project_config');
INSERT INTO `auth_permission` VALUES (495, 'Can add 项目配置操作记录表', 111, 'add_log_project_config');
INSERT INTO `auth_permission` VALUES (497, 'Can change 项目配置操作记录表', 111, 'change_log_project_config');
INSERT INTO `auth_permission` VALUES (499, 'Can delete 项目配置操作记录表', 111, 'delete_log_project_config');
INSERT INTO `auth_permission` VALUES (501, 'Can add 项目成员表', 113, 'add_project_number');
INSERT INTO `auth_permission` VALUES (503, 'Can change 项目成员表', 113, 'change_project_number');
INSERT INTO `auth_permission` VALUES (505, 'Can delete 项目成员表', 113, 'delete_project_number');
INSERT INTO `auth_permission` VALUES (507, 'Can add 任务配置表', 115, 'add_cron_config');
INSERT INTO `auth_permission` VALUES (509, 'Can change 任务配置表', 115, 'change_cron_config');
INSERT INTO `auth_permission` VALUES (511, 'Can delete 任务配置表', 115, 'delete_cron_config');
INSERT INTO `auth_permission` VALUES (513, '读取任务配置权限', 115, 'can_read_cron_config');
INSERT INTO `auth_permission` VALUES (515, '更改任务配置权限', 115, 'can_change_cron_config');
INSERT INTO `auth_permission` VALUES (517, '添加任务配置权限', 115, 'can_add_cron_config');
INSERT INTO `auth_permission` VALUES (519, '删除任务配置权限', 115, 'can_delete_cron_config');
INSERT INTO `auth_permission` VALUES (521, 'Can add 任务配置操作记录表', 117, 'add_log_cron_config');
INSERT INTO `auth_permission` VALUES (523, 'Can change 任务配置操作记录表', 117, 'change_log_cron_config');
INSERT INTO `auth_permission` VALUES (525, 'Can delete 任务配置操作记录表', 117, 'delete_log_cron_config');
INSERT INTO `auth_permission` VALUES (527, 'Can add Ansible剧本成员表', 119, 'add_ansible_playbook_number');
INSERT INTO `auth_permission` VALUES (529, 'Can change Ansible剧本成员表', 119, 'change_ansible_playbook_number');
INSERT INTO `auth_permission` VALUES (531, 'Can delete Ansible剧本成员表', 119, 'delete_ansible_playbook_number');
INSERT INTO `auth_permission` VALUES (533, '读取Ansible剧本成员权限', 119, 'can_read_ansible_playbook_number');
INSERT INTO `auth_permission` VALUES (535, '更改Ansible剧本成员权限', 119, 'can_change_ansible_playbook_number');
INSERT INTO `auth_permission` VALUES (537, '添加Ansible剧本成员权限', 119, 'can_add_ansible_playbook_number');
INSERT INTO `auth_permission` VALUES (539, '删除Ansible剧本成员权限', 119, 'can_delete_ansible_playbook_number');
INSERT INTO `auth_permission` VALUES (541, 'Can add ansible_ call back_ play book_ result', 121, 'add_ansible_callback_playbook_result');
INSERT INTO `auth_permission` VALUES (543, 'Can change ansible_ call back_ play book_ result', 121, 'change_ansible_callback_playbook_result');
INSERT INTO `auth_permission` VALUES (545, 'Can delete ansible_ call back_ play book_ result', 121, 'delete_ansible_callback_playbook_result');
INSERT INTO `auth_permission` VALUES (547, 'Can add Ansible剧本配置表', 123, 'add_ansible_playbook');
INSERT INTO `auth_permission` VALUES (549, 'Can change Ansible剧本配置表', 123, 'change_ansible_playbook');
INSERT INTO `auth_permission` VALUES (551, 'Can delete Ansible剧本配置表', 123, 'delete_ansible_playbook');
INSERT INTO `auth_permission` VALUES (553, '读取Ansible剧本权限', 123, 'can_read_ansible_playbook');
INSERT INTO `auth_permission` VALUES (555, '更改Ansible剧本权限', 123, 'can_change_ansible_playbook');
INSERT INTO `auth_permission` VALUES (557, '添加Ansible剧本权限', 123, 'can_add_ansible_playbook');
INSERT INTO `auth_permission` VALUES (559, '删除Ansible剧本权限', 123, 'can_delete_ansible_playbook');
INSERT INTO `auth_permission` VALUES (561, '执行Ansible剧本权限', 123, 'can_exec_ansible_playbook');
INSERT INTO `auth_permission` VALUES (563, 'Can add Ansible脚本配置表', 125, 'add_ansible_script');
INSERT INTO `auth_permission` VALUES (565, 'Can change Ansible脚本配置表', 125, 'change_ansible_script');
INSERT INTO `auth_permission` VALUES (567, 'Can delete Ansible脚本配置表', 125, 'delete_ansible_script');
INSERT INTO `auth_permission` VALUES (569, '读取Ansible脚本权限', 125, 'can_read_ansible_script');
INSERT INTO `auth_permission` VALUES (571, '更改Ansible脚本权限', 125, 'can_change_ansible_script');
INSERT INTO `auth_permission` VALUES (573, '添加Ansible脚本权限', 125, 'can_add_ansible_script');
INSERT INTO `auth_permission` VALUES (575, '删除Ansible脚本权限', 125, 'can_delete_ansible_script');
INSERT INTO `auth_permission` VALUES (577, '执行Ansible脚本权限', 125, 'can_exec_ansible_script');
INSERT INTO `auth_permission` VALUES (579, '执行Ansible模块权限', 125, 'can_exec_ansible_model');
INSERT INTO `auth_permission` VALUES (581, '读取Ansible模块权限', 125, 'can_read_ansible_model');
INSERT INTO `auth_permission` VALUES (583, 'Can add Ansible剧本操作记录表', 127, 'add_log_ansible_playbook');
INSERT INTO `auth_permission` VALUES (585, 'Can change Ansible剧本操作记录表', 127, 'change_log_ansible_playbook');
INSERT INTO `auth_permission` VALUES (587, 'Can delete Ansible剧本操作记录表', 127, 'delete_log_ansible_playbook');
INSERT INTO `auth_permission` VALUES (589, '读取Ansible剧本执行记录权限', 127, 'can_read_log_ansible_playbook');
INSERT INTO `auth_permission` VALUES (591, '更改Ansible剧本执行记录权限', 127, 'can_change_log_ansible_playbook');
INSERT INTO `auth_permission` VALUES (593, '添加Ansible剧本执行记录权限', 127, 'can_add_log_ansible_playbook');
INSERT INTO `auth_permission` VALUES (595, '删除Ansible剧本执行记录权限', 127, 'can_delete_log_ansible_playbook');
INSERT INTO `auth_permission` VALUES (597, 'Can add Ansible资产表', 129, 'add_ansible_inventory');
INSERT INTO `auth_permission` VALUES (599, 'Can change Ansible资产表', 129, 'change_ansible_inventory');
INSERT INTO `auth_permission` VALUES (601, 'Can delete Ansible资产表', 129, 'delete_ansible_inventory');
INSERT INTO `auth_permission` VALUES (603, '读取ansible资产权限', 129, 'can_read_ansible_inventory');
INSERT INTO `auth_permission` VALUES (605, '更改ansbile资产权限', 129, 'can_change_ansible_inventory');
INSERT INTO `auth_permission` VALUES (607, '添加ansible资产权限', 129, 'can_add_ansible_inventory');
INSERT INTO `auth_permission` VALUES (609, '删除ansible资产权限', 129, 'can_delete_ansible_inventory');
INSERT INTO `auth_permission` VALUES (611, 'Can add ansible_ call back_ model_ result', 131, 'add_ansible_callback_model_result');
INSERT INTO `auth_permission` VALUES (613, 'Can change ansible_ call back_ model_ result', 131, 'change_ansible_callback_model_result');
INSERT INTO `auth_permission` VALUES (615, 'Can delete ansible_ call back_ model_ result', 131, 'delete_ansible_callback_model_result');
INSERT INTO `auth_permission` VALUES (617, 'Can add Ansible模块执行记录表', 133, 'add_log_ansible_model');
INSERT INTO `auth_permission` VALUES (619, 'Can change Ansible模块执行记录表', 133, 'change_log_ansible_model');
INSERT INTO `auth_permission` VALUES (621, 'Can delete Ansible模块执行记录表', 133, 'delete_log_ansible_model');
INSERT INTO `auth_permission` VALUES (623, '读取Ansible模块执行记录权限', 133, 'can_read_log_ansible_model');
INSERT INTO `auth_permission` VALUES (625, '更改Ansible模块执行记录权限', 133, 'can_change_log_ansible_model');
INSERT INTO `auth_permission` VALUES (627, '添加Ansible模块执行记录权限', 133, 'can_add_log_ansible_model');
INSERT INTO `auth_permission` VALUES (629, '删除Ansible模块执行记录权限', 133, 'can_delete_log_ansible_model');
INSERT INTO `auth_permission` VALUES (631, 'Can add Ansible资产成员表', 135, 'add_ansible_inventory_groups');
INSERT INTO `auth_permission` VALUES (633, 'Can change Ansible资产成员表', 135, 'change_ansible_inventory_groups');
INSERT INTO `auth_permission` VALUES (635, 'Can delete Ansible资产成员表', 135, 'delete_ansible_inventory_groups');
INSERT INTO `auth_permission` VALUES (637, 'Can add ansible_ inventory_ groups_ server', 137, 'add_ansible_inventory_groups_server');
INSERT INTO `auth_permission` VALUES (639, 'Can change ansible_ inventory_ groups_ server', 137, 'change_ansible_inventory_groups_server');
INSERT INTO `auth_permission` VALUES (641, 'Can delete ansible_ inventory_ groups_ server', 137, 'delete_ansible_inventory_groups_server');
INSERT INTO `auth_permission` VALUES (643, 'Can add 网络资产表', 139, 'add_network_assets');
INSERT INTO `auth_permission` VALUES (645, 'Can change 网络资产表', 139, 'change_network_assets');
INSERT INTO `auth_permission` VALUES (647, 'Can delete 网络资产表', 139, 'delete_network_assets');
INSERT INTO `auth_permission` VALUES (649, '读取网络资产权限', 139, 'can_read_network_assets');
INSERT INTO `auth_permission` VALUES (651, '更改网络资产权限', 139, 'can_change_network_assets');
INSERT INTO `auth_permission` VALUES (653, '添加网络资产权限', 139, 'can_add_network_assets');
INSERT INTO `auth_permission` VALUES (655, '删除网络资产权限', 139, 'can_delete_network_assets');
INSERT INTO `auth_permission` VALUES (657, 'Can add periodic task', 141, 'add_periodictask');
INSERT INTO `auth_permission` VALUES (659, 'Can change periodic task', 141, 'change_periodictask');
INSERT INTO `auth_permission` VALUES (661, 'Can delete periodic task', 141, 'delete_periodictask');
INSERT INTO `auth_permission` VALUES (663, 'Can add task', 143, 'add_taskstate');
INSERT INTO `auth_permission` VALUES (665, 'Can change task', 143, 'change_taskstate');
INSERT INTO `auth_permission` VALUES (667, 'Can delete task', 143, 'delete_taskstate');
INSERT INTO `auth_permission` VALUES (669, 'Can add worker', 145, 'add_workerstate');
INSERT INTO `auth_permission` VALUES (671, 'Can change worker', 145, 'change_workerstate');
INSERT INTO `auth_permission` VALUES (673, 'Can delete worker', 145, 'delete_workerstate');
INSERT INTO `auth_permission` VALUES (675, 'Can add crontab', 147, 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES (677, 'Can change crontab', 147, 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES (679, 'Can delete crontab', 147, 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES (681, 'Can add task state', 149, 'add_taskmeta');
INSERT INTO `auth_permission` VALUES (683, 'Can change task state', 149, 'change_taskmeta');
INSERT INTO `auth_permission` VALUES (685, 'Can delete task state', 149, 'delete_taskmeta');
INSERT INTO `auth_permission` VALUES (687, 'Can add saved group result', 151, 'add_tasksetmeta');
INSERT INTO `auth_permission` VALUES (689, 'Can change saved group result', 151, 'change_tasksetmeta');
INSERT INTO `auth_permission` VALUES (691, 'Can delete saved group result', 151, 'delete_tasksetmeta');
INSERT INTO `auth_permission` VALUES (693, 'Can add periodic tasks', 153, 'add_periodictasks');
INSERT INTO `auth_permission` VALUES (695, 'Can change periodic tasks', 153, 'change_periodictasks');
INSERT INTO `auth_permission` VALUES (697, 'Can delete periodic tasks', 153, 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES (699, 'Can add interval', 155, 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES (701, 'Can change interval', 155, 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES (703, 'Can delete interval', 155, 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES (705, 'Can add 代码部署工单表', 157, 'add_project_order');
INSERT INTO `auth_permission` VALUES (707, 'Can change 代码部署工单表', 157, 'change_project_order');
INSERT INTO `auth_permission` VALUES (709, 'Can delete 代码部署工单表', 157, 'delete_project_order');
INSERT INTO `auth_permission` VALUES (711, '读取代码部署工单权限', 157, 'can_read_project_order');
INSERT INTO `auth_permission` VALUES (713, '更改代码部署工单权限', 157, 'can_change_project_order');
INSERT INTO `auth_permission` VALUES (715, '添加代码部署工单限', 157, 'can_add_project_order');
INSERT INTO `auth_permission` VALUES (717, '删除代码部署工单权限', 157, 'can_delete_project_order');
INSERT INTO `auth_permission` VALUES (719, 'Can add SQL工单执行记录表', 159, 'add_sql_order_execute_result');
INSERT INTO `auth_permission` VALUES (721, 'Can change SQL工单执行记录表', 159, 'change_sql_order_execute_result');
INSERT INTO `auth_permission` VALUES (723, 'Can delete SQL工单执行记录表', 159, 'delete_sql_order_execute_result');
INSERT INTO `auth_permission` VALUES (725, 'Can add 工单系统表', 161, 'add_order_system');
INSERT INTO `auth_permission` VALUES (727, 'Can change 工单系统表', 161, 'change_order_system');
INSERT INTO `auth_permission` VALUES (729, 'Can delete 工单系统表', 161, 'delete_order_system');
INSERT INTO `auth_permission` VALUES (731, '读取工单系统权限', 161, 'can_read_order_system');
INSERT INTO `auth_permission` VALUES (733, '更改工单系统权限', 161, 'can_change_order_systemr');
INSERT INTO `auth_permission` VALUES (735, '添加工单系统权限', 161, 'can_add_order_system');
INSERT INTO `auth_permission` VALUES (737, '删除工单系统权限', 161, 'can_delete_order_system');
INSERT INTO `auth_permission` VALUES (739, 'Can add SQL审核工单表', 163, 'add_sql_audit_order');
INSERT INTO `auth_permission` VALUES (741, 'Can change SQL审核工单表', 163, 'change_sql_audit_order');
INSERT INTO `auth_permission` VALUES (743, 'Can delete SQL审核工单表', 163, 'delete_sql_audit_order');
INSERT INTO `auth_permission` VALUES (745, '读取SQL审核工单权限', 163, 'can_read_sql_audit_order');
INSERT INTO `auth_permission` VALUES (747, '更改SQL审核工单权限', 163, 'can_change_sql_audit_order');
INSERT INTO `auth_permission` VALUES (749, '添加SQL审核工单权限', 163, 'can_add_sql_audit_order');
INSERT INTO `auth_permission` VALUES (751, '删除SQL审核工单权限', 163, 'can_delete_sql_audit_order');
INSERT INTO `auth_permission` VALUES (753, 'Can add upload files', 165, 'add_uploadfiles');
INSERT INTO `auth_permission` VALUES (755, 'Can change upload files', 165, 'change_uploadfiles');
INSERT INTO `auth_permission` VALUES (757, 'Can delete upload files', 165, 'delete_uploadfiles');
INSERT INTO `auth_permission` VALUES (759, 'Can add 文件上传审核工单表', 167, 'add_fileupload_audit_order');
INSERT INTO `auth_permission` VALUES (761, 'Can change 文件上传审核工单表', 167, 'change_fileupload_audit_order');
INSERT INTO `auth_permission` VALUES (763, 'Can delete 文件上传审核工单表', 167, 'delete_fileupload_audit_order');
INSERT INTO `auth_permission` VALUES (765, '读取文件上传审核工单权限', 167, 'can_read_fileupload_audit_order');
INSERT INTO `auth_permission` VALUES (767, '更改文件上传审核工单权限', 167, 'can_change_fileupload_audit_order');
INSERT INTO `auth_permission` VALUES (769, '添加文件上传审核工单权限', 167, 'can_add_fileupload_audit_order');
INSERT INTO `auth_permission` VALUES (771, '删除文件上传审核工单权限', 167, 'can_delete_fileupload_audit_order');
INSERT INTO `auth_permission` VALUES (773, 'Can add 文件上传审核工单表', 169, 'add_filedownload_audit_order');
INSERT INTO `auth_permission` VALUES (775, 'Can change 文件上传审核工单表', 169, 'change_filedownload_audit_order');
INSERT INTO `auth_permission` VALUES (777, 'Can delete 文件上传审核工单表', 169, 'delete_filedownload_audit_order');
INSERT INTO `auth_permission` VALUES (779, '读取文件下载审核工单权限', 169, 'can_read_filedownload_audit_order');
INSERT INTO `auth_permission` VALUES (781, '更改文件下载审核工单权限', 169, 'can_change_filedownload_audit_order');
INSERT INTO `auth_permission` VALUES (783, '添加文件下载审核工单权限', 169, 'can_add_filedownload_audit_order');
INSERT INTO `auth_permission` VALUES (785, '删除文件下载审核工单权限', 169, 'can_delete_filedownload_audit_order');
INSERT INTO `auth_permission` VALUES (787, 'Can add wiki分类', 171, 'add_category');
INSERT INTO `auth_permission` VALUES (789, 'Can change wiki分类', 171, 'change_category');
INSERT INTO `auth_permission` VALUES (791, 'Can delete wiki分类', 171, 'delete_category');
INSERT INTO `auth_permission` VALUES (793, '读取分类权限', 171, 'can_read_wiki_category');
INSERT INTO `auth_permission` VALUES (795, '更改分类权限', 171, 'can_change_wiki_category');
INSERT INTO `auth_permission` VALUES (797, '添加分类权限', 171, 'can_add_wiki_category');
INSERT INTO `auth_permission` VALUES (799, '删除分类权限', 171, 'can_delete_wiki_category');
INSERT INTO `auth_permission` VALUES (801, 'Can add wiki标签', 173, 'add_tag');
INSERT INTO `auth_permission` VALUES (803, 'Can change wiki标签', 173, 'change_tag');
INSERT INTO `auth_permission` VALUES (805, 'Can delete wiki标签', 173, 'delete_tag');
INSERT INTO `auth_permission` VALUES (807, '读取标签权限', 173, 'can_read_wiki_tag');
INSERT INTO `auth_permission` VALUES (809, '更改标签权限', 173, 'can_change_wiki_tag');
INSERT INTO `auth_permission` VALUES (811, '添加标签权限', 173, 'can_add_wiki_tag');
INSERT INTO `auth_permission` VALUES (813, '删除标签权限', 173, 'can_delete_wiki_tag');
INSERT INTO `auth_permission` VALUES (815, 'Can add wiki文章', 175, 'add_post');
INSERT INTO `auth_permission` VALUES (817, 'Can change wiki文章', 175, 'change_post');
INSERT INTO `auth_permission` VALUES (819, 'Can delete wiki文章', 175, 'delete_post');
INSERT INTO `auth_permission` VALUES (821, '读取文章权限', 175, 'can_read_wiki_post');
INSERT INTO `auth_permission` VALUES (823, '更改文章权限', 175, 'can_change_wiki_post');
INSERT INTO `auth_permission` VALUES (825, '添加文章权限', 175, 'can_add_wiki_post');
INSERT INTO `auth_permission` VALUES (827, '删除文章权限', 175, 'can_delete_wiki_post');
INSERT INTO `auth_permission` VALUES (829, 'Can add wiki文章评论', 177, 'add_comment');
INSERT INTO `auth_permission` VALUES (831, 'Can change wiki文章评论', 177, 'change_comment');
INSERT INTO `auth_permission` VALUES (833, 'Can delete wiki文章评论', 177, 'delete_comment');
INSERT INTO `auth_permission` VALUES (835, '读取评论权限', 177, 'can_read_wiki_comment');
INSERT INTO `auth_permission` VALUES (837, '更改评论权限', 177, 'can_change_wiki_comment');
INSERT INTO `auth_permission` VALUES (839, '添加评论权限', 177, 'can_add_wiki_comment');
INSERT INTO `auth_permission` VALUES (841, '删除评论权限', 177, 'can_delete_wiki_comment');
INSERT INTO `auth_permission` VALUES (843, 'Can add 出版社', 179, 'add_publisher');
INSERT INTO `auth_permission` VALUES (845, 'Can change 出版社', 179, 'change_publisher');
INSERT INTO `auth_permission` VALUES (847, 'Can delete 出版社', 179, 'delete_publisher');
INSERT INTO `auth_permission` VALUES (849, 'Can add 书', 181, 'add_book');
INSERT INTO `auth_permission` VALUES (851, 'Can change 书', 181, 'change_book');
INSERT INTO `auth_permission` VALUES (853, 'Can delete 书', 181, 'delete_book');
INSERT INTO `auth_permission` VALUES (855, 'Can add yewuoraclecall', 183, 'add_yewuoraclecall');
INSERT INTO `auth_permission` VALUES (857, 'Can change yewuoraclecall', 183, 'change_yewuoraclecall');
INSERT INTO `auth_permission` VALUES (859, 'Can delete yewuoraclecall', 183, 'delete_yewuoraclecall');
INSERT INTO `auth_permission` VALUES (861, 'Can add auth', 185, 'add_auth');
INSERT INTO `auth_permission` VALUES (863, 'Can change auth', 185, 'change_auth');
INSERT INTO `auth_permission` VALUES (865, 'Can delete auth', 185, 'delete_auth');
INSERT INTO `auth_permission` VALUES (867, 'Can add yawd elfinder test model', 187, 'add_yawdelfindertestmodel');
INSERT INTO `auth_permission` VALUES (869, 'Can change yawd elfinder test model', 187, 'change_yawdelfindertestmodel');
INSERT INTO `auth_permission` VALUES (871, 'Can delete yawd elfinder test model', 187, 'delete_yawdelfindertestmodel');
INSERT INTO `auth_permission` VALUES (873, 'Can add scan_conf_cmd', 189, 'add_scan_conf_cmd');
INSERT INTO `auth_permission` VALUES (875, 'Can change scan_conf_cmd', 189, 'change_scan_conf_cmd');
INSERT INTO `auth_permission` VALUES (877, 'Can delete scan_conf_cmd', 189, 'delete_scan_conf_cmd');
INSERT INTO `auth_permission` VALUES (879, 'Can add scan_conf_ip', 191, 'add_scan_conf_ip');
INSERT INTO `auth_permission` VALUES (881, 'Can change scan_conf_ip', 191, 'change_scan_conf_ip');
INSERT INTO `auth_permission` VALUES (883, 'Can delete scan_conf_ip', 191, 'delete_scan_conf_ip');
INSERT INTO `auth_permission` VALUES (885, 'Can add scan_conf_keyfile', 193, 'add_scan_conf_keyfile');
INSERT INTO `auth_permission` VALUES (887, 'Can change scan_conf_keyfile', 193, 'change_scan_conf_keyfile');
INSERT INTO `auth_permission` VALUES (889, 'Can delete scan_conf_keyfile', 193, 'delete_scan_conf_keyfile');
INSERT INTO `auth_permission` VALUES (891, 'Can add scan_conf_port', 195, 'add_scan_conf_port');
INSERT INTO `auth_permission` VALUES (893, 'Can change scan_conf_port', 195, 'change_scan_conf_port');
INSERT INTO `auth_permission` VALUES (895, 'Can delete scan_conf_port', 195, 'delete_scan_conf_port');
INSERT INTO `auth_permission` VALUES (897, 'Can add scan_conf_sshpass', 197, 'add_scan_conf_sshpass');
INSERT INTO `auth_permission` VALUES (899, 'Can change scan_conf_sshpass', 197, 'change_scan_conf_sshpass');
INSERT INTO `auth_permission` VALUES (901, 'Can delete scan_conf_sshpass', 197, 'delete_scan_conf_sshpass');
INSERT INTO `auth_permission` VALUES (903, 'Can add scan_host_conf', 199, 'add_scan_host_conf');
INSERT INTO `auth_permission` VALUES (905, 'Can change scan_host_conf', 199, 'change_scan_host_conf');
INSERT INTO `auth_permission` VALUES (907, 'Can delete scan_host_conf', 199, 'delete_scan_host_conf');
INSERT INTO `auth_permission` VALUES (909, 'Can add bin日志解析', 201, 'add_binlogparseredo');
INSERT INTO `auth_permission` VALUES (911, 'Can change bin日志解析', 201, 'change_binlogparseredo');
INSERT INTO `auth_permission` VALUES (913, 'Can delete bin日志解析', 201, 'delete_binlogparseredo');
INSERT INTO `auth_permission` VALUES (915, 'Can add bin日志逆向解析', 203, 'add_binlogparseundo');
INSERT INTO `auth_permission` VALUES (917, 'Can change bin日志逆向解析', 203, 'change_binlogparseundo');
INSERT INTO `auth_permission` VALUES (919, 'Can delete bin日志逆向解析', 203, 'delete_binlogparseundo');
INSERT INTO `auth_permission` VALUES (920, 'Can add 业务树', 204, 'add_yewutreemptt');
INSERT INTO `auth_permission` VALUES (921, 'Can change 业务树', 204, 'change_yewutreemptt');
INSERT INTO `auth_permission` VALUES (922, 'Can delete 业务树', 204, 'delete_yewutreemptt');
INSERT INTO `auth_permission` VALUES (923, 'Can add 用户服务器表', 205, 'add_user_host');
INSERT INTO `auth_permission` VALUES (924, 'Can change 用户服务器表', 205, 'change_user_host');
INSERT INTO `auth_permission` VALUES (925, 'Can delete 用户服务器表', 205, 'delete_user_host');
INSERT INTO `auth_permission` VALUES (926, '读取用户服务器表权限', 205, 'can_read_user_host');
INSERT INTO `auth_permission` VALUES (927, '更改用户服务器表权限', 205, 'can_change_user_host');
INSERT INTO `auth_permission` VALUES (928, '添加用户服务器表权限', 205, 'can_add_user_host');
INSERT INTO `auth_permission` VALUES (929, '删除用户服务器表权限', 205, 'can_delete_user_host');
INSERT INTO `auth_permission` VALUES (930, 'Can add mysql fast sql', 206, 'add_mysqlfastsql');
INSERT INTO `auth_permission` VALUES (931, 'Can change mysql fast sql', 206, 'change_mysqlfastsql');
INSERT INTO `auth_permission` VALUES (932, 'Can delete mysql fast sql', 206, 'delete_mysqlfastsql');
INSERT INTO `auth_permission` VALUES (933, 'Can add mysql_sql_log', 207, 'add_mysql_sql_log');
INSERT INTO `auth_permission` VALUES (934, 'Can change mysql_sql_log', 207, 'change_mysql_sql_log');
INSERT INTO `auth_permission` VALUES (935, 'Can delete mysql_sql_log', 207, 'delete_mysql_sql_log');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$36000$4Z0ZJNJ4OJ6c$yeMfdzNE6eWIWNFSiU+JxiIQy9tXDpk4UCxDUQS9VvA=', '2019-02-11 01:42:12.482301', 1, 'admin', '', '', 'flc009@163.com', 1, 1, '2018-08-09 06:27:36.008195');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$36000$gfHjpuEDHpiT$oqYh4agUd+9ESz5RJ5LOeKev6JaM4uaRZ/BL+YDOLDY=', NULL, 0, 'fanglianchao', '', '', 'flc009@163.com', 0, 0, '2018-08-17 08:07:31.076292');
INSERT INTO `auth_user` VALUES (5, '', NULL, 0, 'root', '', '', 'flc009@163.com', 1, 1, '2018-09-04 03:34:11.609749');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token`  (
  `key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for binlogparseredo
-- ----------------------------
DROP TABLE IF EXISTS `binlogparseredo`;
CREATE TABLE `binlogparseredo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_pos` int(11) DEFAULT NULL,
  `end_pos` int(11) DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48938 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of binlogparseredo
-- ----------------------------
INSERT INTO `binlogparseredo` VALUES (48936, 'INSERT INTO `accountingdb`.`vfc_acct_entry_export_detail_config`(`update_time`, `col_key`, `seq`, `col_nm`, `entry_detail_config_id`, `eport_data_cd`, `priority`, `update_instance`, `entry_export_head_id`, `create_time`, `eport_data_type`, `create_instance`) VALUES (\'2018-08-18 00:00:00\', \'asst_ledger7\', 8, \'产品编码\', \'10210013\', \'5000013\', NULL, \'S0701\', \'9000002\', \'2018-08-18 00:00:00\', \'ITEM\', \'S0701\'); ', 30006533, 30006861, '2019-01-28', '20:39:39');
INSERT INTO `binlogparseredo` VALUES (48937, 'INSERT INTO `accountingdb`.`vfc_acct_entry_export_detail_config`(`update_time`, `col_key`, `seq`, `col_nm`, `entry_detail_config_id`, `eport_data_cd`, `priority`, `update_instance`, `entry_export_head_id`, `create_time`, `eport_data_type`, `create_instance`) VALUES (\'2018-08-18 00:00:00\', \'asst_ledger8\', 9, \'用途\', \'10210014\', \'5000014\', NULL, \'S0701\', \'9000002\', \'2018-08-18 00:00:00\', \'ITEM\', \'S0701\'); ', 30006966, 30007288, '2019-01-28', '20:39:39');

-- ----------------------------
-- Table structure for binlogparseundo
-- ----------------------------
DROP TABLE IF EXISTS `binlogparseundo`;
CREATE TABLE `binlogparseundo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_pos` int(11) DEFAULT NULL,
  `end_pos` int(11) DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9429 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of binlogparseundo
-- ----------------------------
INSERT INTO `binlogparseundo` VALUES (9423, 'INSERT INTO `ranger`.`x_policy_resource`(`is_recursive`, `update_time`, `is_excludes`, `create_time`, `res_def_id`, `added_by_id`, `guid`, `upd_by_id`, `id`, `policy_id`) VALUES (0, \'2018-07-06 01:28:14\', 0, \'2018-07-06 01:28:14\', 11, 1, NULL, 1, 85, 23); ', 190946636, 190953451, '2019-01-28', '17:20:06');
INSERT INTO `binlogparseundo` VALUES (9424, 'INSERT INTO `ranger`.`x_policy_resource`(`is_recursive`, `update_time`, `is_excludes`, `create_time`, `res_def_id`, `added_by_id`, `guid`, `upd_by_id`, `id`, `policy_id`) VALUES (0, \'2018-07-06 01:28:14\', 0, \'2018-07-06 01:28:14\', 15, 1, NULL, 1, 83, 23); ', 190946636, 190952975, '2019-01-28', '17:20:06');
INSERT INTO `binlogparseundo` VALUES (9425, 'INSERT INTO `ranger`.`x_policy_resource`(`is_recursive`, `update_time`, `is_excludes`, `create_time`, `res_def_id`, `added_by_id`, `guid`, `upd_by_id`, `id`, `policy_id`) VALUES (0, \'2018-07-06 01:28:14\', 0, \'2018-07-06 01:28:14\', 9, 1, NULL, 1, 81, 23); ', 190946636, 190952499, '2019-01-28', '17:20:06');
INSERT INTO `binlogparseundo` VALUES (9426, 'INSERT INTO `ranger`.`x_policy_resource`(`is_recursive`, `update_time`, `is_excludes`, `create_time`, `res_def_id`, `added_by_id`, `guid`, `upd_by_id`, `id`, `policy_id`) VALUES (0, \'2018-07-06 01:28:29\', 0, \'2018-07-06 01:25:33\', 11, 1, NULL, 1, 91, 21); ', 190920285, 190927101, '2019-01-28', '17:20:01');
INSERT INTO `binlogparseundo` VALUES (9427, 'INSERT INTO `ranger`.`x_policy_resource`(`is_recursive`, `update_time`, `is_excludes`, `create_time`, `res_def_id`, `added_by_id`, `guid`, `upd_by_id`, `id`, `policy_id`) VALUES (0, \'2018-07-06 01:28:29\', 0, \'2018-07-06 01:25:33\', 15, 1, NULL, 1, 89, 21); ', 190920285, 190926624, '2019-01-28', '17:20:01');
INSERT INTO `binlogparseundo` VALUES (9428, 'INSERT INTO `ranger`.`x_policy_resource`(`is_recursive`, `update_time`, `is_excludes`, `create_time`, `res_def_id`, `added_by_id`, `guid`, `upd_by_id`, `id`, `policy_id`) VALUES (0, \'2018-07-06 01:28:29\', 0, \'2018-07-06 01:25:33\', 9, 1, NULL, 1, 87, 21); ', 190920285, 190926148, '2019-01-28', '17:20:01');

-- ----------------------------
-- Table structure for celery_taskmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_taskmeta`;
CREATE TABLE `celery_taskmeta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `celery_taskmeta_hidden_23fd02dc`(`hidden`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 323 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of celery_taskmeta
-- ----------------------------
INSERT INTO `celery_taskmeta` VALUES (320, 'ec4cf591-643d-4d74-92c8-aaa827c18909', 'SUCCESS', NULL, '2019-02-10 20:00:00.194945', NULL, 0, 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES (321, '7a0e279a-8190-4e19-89a0-c96f61477e69', 'SUCCESS', NULL, '2019-02-11 02:10:25.263049', NULL, 0, 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');

-- ----------------------------
-- Table structure for celery_tasksetmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_tasksetmeta`;
CREATE TABLE `celery_tasksetmeta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `taskset_id`(`taskset_id`) USING BTREE,
  INDEX `celery_tasksetmeta_hidden_593cfc24`(`hidden`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmdb_hostgroup
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_hostgroup`;
CREATE TABLE `cmdb_hostgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmdb_hostgroup_serverlist
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_hostgroup_serverlist`;
CREATE TABLE `cmdb_hostgroup_serverlist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostgroup_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `CMDB_hostgroup_serverList_hostgroup_id_host_id_76f6ad74_uniq`(`hostgroup_id`, `host_id`) USING BTREE,
  INDEX `CMDB_hostgroup_serverList_host_id_fa0be4b3_fk_ALLHOSTS_id`(`host_id`) USING BTREE,
  CONSTRAINT `CMDB_hostgroup_serve_hostgroup_id_40b057fa_fk_CMDB_host` FOREIGN KEY (`hostgroup_id`) REFERENCES `cmdb_hostgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CMDB_hostgroup_serverList_host_id_fa0be4b3_fk_ALLHOSTS_id` FOREIGN KEY (`host_id`) REFERENCES `allhosts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmdb_netgroup
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_netgroup`;
CREATE TABLE `cmdb_netgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmdb_productline
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_productline`;
CREATE TABLE `cmdb_productline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `incharger` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qq` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weChat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `incharger`(`incharger`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_high_risk_sql
-- ----------------------------
DROP TABLE IF EXISTS `custom_high_risk_sql`;
CREATE TABLE `custom_high_risk_sql`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sql`(`sql`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (5, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (63, 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES (69, 'CMDB', 'assets');
INSERT INTO `django_content_type` VALUES (115, 'CMDB', 'cron_config');
INSERT INTO `django_content_type` VALUES (67, 'CMDB', 'disk_assets');
INSERT INTO `django_content_type` VALUES (57, 'CMDB', 'host');
INSERT INTO `django_content_type` VALUES (55, 'CMDB', 'host_fail');
INSERT INTO `django_content_type` VALUES (59, 'CMDB', 'hostgroup');
INSERT INTO `django_content_type` VALUES (27, 'CMDB', 'idc');
INSERT INTO `django_content_type` VALUES (21, 'CMDB', 'interface');
INSERT INTO `django_content_type` VALUES (23, 'CMDB', 'ipsource');
INSERT INTO `django_content_type` VALUES (79, 'CMDB', 'line_assets');
INSERT INTO `django_content_type` VALUES (71, 'CMDB', 'log_assets');
INSERT INTO `django_content_type` VALUES (117, 'CMDB', 'log_cron_config');
INSERT INTO `django_content_type` VALUES (43, 'CMDB', 'mysql_db');
INSERT INTO `django_content_type` VALUES (47, 'CMDB', 'mysql_instance');
INSERT INTO `django_content_type` VALUES (53, 'CMDB', 'mysql_user');
INSERT INTO `django_content_type` VALUES (51, 'CMDB', 'mysqlcluster');
INSERT INTO `django_content_type` VALUES (25, 'CMDB', 'netdevice');
INSERT INTO `django_content_type` VALUES (29, 'CMDB', 'netgroup');
INSERT INTO `django_content_type` VALUES (139, 'CMDB', 'network_assets');
INSERT INTO `django_content_type` VALUES (85, 'CMDB', 'networkcard_assets');
INSERT INTO `django_content_type` VALUES (39, 'CMDB', 'oracle_instance');
INSERT INTO `django_content_type` VALUES (45, 'CMDB', 'oraclecluster');
INSERT INTO `django_content_type` VALUES (49, 'CMDB', 'oracletablespace');
INSERT INTO `django_content_type` VALUES (41, 'CMDB', 'oracleuser');
INSERT INTO `django_content_type` VALUES (37, 'CMDB', 'productline');
INSERT INTO `django_content_type` VALUES (75, 'CMDB', 'project_assets');
INSERT INTO `django_content_type` VALUES (77, 'CMDB', 'raid_assets');
INSERT INTO `django_content_type` VALUES (83, 'CMDB', 'ram_assets');
INSERT INTO `django_content_type` VALUES (189, 'CMDB', 'scan_conf_cmd');
INSERT INTO `django_content_type` VALUES (191, 'CMDB', 'scan_conf_ip');
INSERT INTO `django_content_type` VALUES (193, 'CMDB', 'scan_conf_keyfile');
INSERT INTO `django_content_type` VALUES (195, 'CMDB', 'scan_conf_port');
INSERT INTO `django_content_type` VALUES (197, 'CMDB', 'scan_conf_sshpass');
INSERT INTO `django_content_type` VALUES (199, 'CMDB', 'scan_host_conf');
INSERT INTO `django_content_type` VALUES (81, 'CMDB', 'server_assets');
INSERT INTO `django_content_type` VALUES (73, 'CMDB', 'service_assets');
INSERT INTO `django_content_type` VALUES (183, 'CMDB', 'yewuoraclecall');
INSERT INTO `django_content_type` VALUES (19, 'CMDB', 'yewutree');
INSERT INTO `django_content_type` VALUES (204, 'CMDB', 'yewutreemptt');
INSERT INTO `django_content_type` VALUES (65, 'CMDB', 'zone_assets');
INSERT INTO `django_content_type` VALUES (111, 'CodeOps', 'log_project_config');
INSERT INTO `django_content_type` VALUES (105, 'CodeOps', 'project_assets');
INSERT INTO `django_content_type` VALUES (109, 'CodeOps', 'project_config');
INSERT INTO `django_content_type` VALUES (113, 'CodeOps', 'project_number');
INSERT INTO `django_content_type` VALUES (107, 'CodeOps', 'service_assets');
INSERT INTO `django_content_type` VALUES (9, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (147, 'djcelery', 'crontabschedule');
INSERT INTO `django_content_type` VALUES (155, 'djcelery', 'intervalschedule');
INSERT INTO `django_content_type` VALUES (141, 'djcelery', 'periodictask');
INSERT INTO `django_content_type` VALUES (153, 'djcelery', 'periodictasks');
INSERT INTO `django_content_type` VALUES (149, 'djcelery', 'taskmeta');
INSERT INTO `django_content_type` VALUES (151, 'djcelery', 'tasksetmeta');
INSERT INTO `django_content_type` VALUES (143, 'djcelery', 'taskstate');
INSERT INTO `django_content_type` VALUES (145, 'djcelery', 'workerstate');
INSERT INTO `django_content_type` VALUES (187, 'elfinder', 'yawdelfindertestmodel');
INSERT INTO `django_content_type` VALUES (201, 'MysqlOps', 'binlogparseredo');
INSERT INTO `django_content_type` VALUES (203, 'MysqlOps', 'binlogparseundo');
INSERT INTO `django_content_type` VALUES (101, 'MysqlOps', 'custom_high_risk_sql');
INSERT INTO `django_content_type` VALUES (97, 'MysqlOps', 'database_server_config');
INSERT INTO `django_content_type` VALUES (95, 'MysqlOps', 'inception_server_config');
INSERT INTO `django_content_type` VALUES (207, 'MysqlOps', 'mysql_sql_log');
INSERT INTO `django_content_type` VALUES (206, 'MysqlOps', 'mysqlfastsql');
INSERT INTO `django_content_type` VALUES (103, 'MysqlOps', 'sql_audit_control');
INSERT INTO `django_content_type` VALUES (99, 'MysqlOps', 'sql_execute_histroy');
INSERT INTO `django_content_type` VALUES (131, 'OpsControl', 'ansible_callback_model_result');
INSERT INTO `django_content_type` VALUES (121, 'OpsControl', 'ansible_callback_playbook_result');
INSERT INTO `django_content_type` VALUES (129, 'OpsControl', 'ansible_inventory');
INSERT INTO `django_content_type` VALUES (135, 'OpsControl', 'ansible_inventory_groups');
INSERT INTO `django_content_type` VALUES (137, 'OpsControl', 'ansible_inventory_groups_server');
INSERT INTO `django_content_type` VALUES (123, 'OpsControl', 'ansible_playbook');
INSERT INTO `django_content_type` VALUES (119, 'OpsControl', 'ansible_playbook_number');
INSERT INTO `django_content_type` VALUES (125, 'OpsControl', 'ansible_script');
INSERT INTO `django_content_type` VALUES (133, 'OpsControl', 'log_ansible_model');
INSERT INTO `django_content_type` VALUES (127, 'OpsControl', 'log_ansible_playbook');
INSERT INTO `django_content_type` VALUES (161, 'Orders', 'order_system');
INSERT INTO `django_content_type` VALUES (157, 'Orders', 'project_order');
INSERT INTO `django_content_type` VALUES (163, 'Orders', 'sql_audit_order');
INSERT INTO `django_content_type` VALUES (159, 'Orders', 'sql_order_execute_result');
INSERT INTO `django_content_type` VALUES (11, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (93, 'system', 'email_config');
INSERT INTO `django_content_type` VALUES (169, 'system', 'filedownload_audit_order');
INSERT INTO `django_content_type` VALUES (167, 'system', 'fileupload_audit_order');
INSERT INTO `django_content_type` VALUES (91, 'system', 'global_config');
INSERT INTO `django_content_type` VALUES (61, 'system', 'larrymenus');
INSERT INTO `django_content_type` VALUES (35, 'system', 'menus');
INSERT INTO `django_content_type` VALUES (33, 'system', 'role');
INSERT INTO `django_content_type` VALUES (89, 'system', 'server_command_record');
INSERT INTO `django_content_type` VALUES (165, 'system', 'uploadfiles');
INSERT INTO `django_content_type` VALUES (205, 'system', 'user_host');
INSERT INTO `django_content_type` VALUES (87, 'system', 'user_server');
INSERT INTO `django_content_type` VALUES (31, 'system', 'userprofile');
INSERT INTO `django_content_type` VALUES (185, 'test', 'auth');
INSERT INTO `django_content_type` VALUES (181, 'test', 'book');
INSERT INTO `django_content_type` VALUES (179, 'test', 'publisher');
INSERT INTO `django_content_type` VALUES (15, 'UserOps', 'menus');
INSERT INTO `django_content_type` VALUES (17, 'UserOps', 'role');
INSERT INTO `django_content_type` VALUES (13, 'UserOps', 'userprofile');
INSERT INTO `django_content_type` VALUES (171, 'wiki', 'category');
INSERT INTO `django_content_type` VALUES (177, 'wiki', 'comment');
INSERT INTO `django_content_type` VALUES (175, 'wiki', 'post');
INSERT INTO `django_content_type` VALUES (173, 'wiki', 'tag');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 225 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-07-02 10:22:46.959745');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-07-02 10:22:50.145435');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0001_initial', '2018-07-02 10:22:50.813644');
INSERT INTO `django_migrations` VALUES (7, 'admin', '0002_logentry_remove_auto_add', '2018-07-02 10:22:50.934981');
INSERT INTO `django_migrations` VALUES (9, 'contenttypes', '0002_remove_content_type_name', '2018-07-02 10:22:51.476243');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0002_alter_permission_name_max_length', '2018-07-02 10:22:51.761528');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0003_alter_user_email_max_length', '2018-07-02 10:22:51.881162');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0004_alter_user_username_opts', '2018-07-02 10:22:51.926433');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0005_alter_user_last_login_null', '2018-07-02 10:22:52.163014');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0006_require_contenttypes_0002', '2018-07-02 10:22:52.196580');
INSERT INTO `django_migrations` VALUES (21, 'auth', '0007_alter_validators_add_error_messages', '2018-07-02 10:22:52.246397');
INSERT INTO `django_migrations` VALUES (23, 'auth', '0008_alter_user_username_max_length', '2018-07-02 10:22:52.551109');
INSERT INTO `django_migrations` VALUES (25, 'sessions', '0001_initial', '2018-07-02 10:22:52.802152');
INSERT INTO `django_migrations` VALUES (27, 'UserOps', '0001_initial', '2018-08-09 06:25:21.663407');
INSERT INTO `django_migrations` VALUES (29, 'UserOps', '0002_auto_20180809_1425', '2018-08-09 06:25:22.257576');
INSERT INTO `django_migrations` VALUES (31, 'UserOps', '0003_auto_20180809_1439', '2018-08-09 06:39:14.382780');
INSERT INTO `django_migrations` VALUES (33, 'CMDB', '0001_initial', '2018-08-14 12:14:22.128920');
INSERT INTO `django_migrations` VALUES (35, 'UserOps', '0004_auto_20180814_2013', '2018-08-15 01:46:32.042616');
INSERT INTO `django_migrations` VALUES (37, 'UserOps', '0005_auto_20180815_0946', '2018-08-15 01:46:32.590557');
INSERT INTO `django_migrations` VALUES (39, 'CMDB', '0002_auto_20180816_1034', '2018-08-16 02:34:34.802652');
INSERT INTO `django_migrations` VALUES (41, 'system', '0001_initial', '2018-08-16 02:35:07.435420');
INSERT INTO `django_migrations` VALUES (43, 'system', '0002_auto_20180816_1723', '2018-08-16 09:23:37.216268');
INSERT INTO `django_migrations` VALUES (45, 'CMDB', '0003_productline', '2018-08-17 10:04:43.501161');
INSERT INTO `django_migrations` VALUES (47, 'system', '0003_auto_20180817_2326', '2018-08-17 15:26:48.053042');
INSERT INTO `django_migrations` VALUES (49, 'CMDB', '0004_auto_20180817_2327', '2018-08-18 00:47:46.050906');
INSERT INTO `django_migrations` VALUES (51, 'CMDB', '0005_auto_20180817_2345', '2018-08-18 00:47:46.919417');
INSERT INTO `django_migrations` VALUES (53, 'CMDB', '0006_auto_20180818_0847', '2018-08-18 00:47:53.977748');
INSERT INTO `django_migrations` VALUES (55, 'CMDB', '0007_auto_20180818_0849', '2018-08-18 00:49:48.368906');
INSERT INTO `django_migrations` VALUES (57, 'CMDB', '0008_host_host_fail_hostgroup_ipsource', '2018-08-18 01:38:51.322166');
INSERT INTO `django_migrations` VALUES (59, 'system', '0004_larrymenus', '2018-08-29 12:06:00.432423');
INSERT INTO `django_migrations` VALUES (61, 'system', '0005_auto_20180830_1052', '2018-08-30 02:52:30.183947');
INSERT INTO `django_migrations` VALUES (63, 'system', '0006_auto_20180830_1743', '2018-08-30 09:43:28.870979');
INSERT INTO `django_migrations` VALUES (65, 'system', '0007_auto_20180903_1200', '2018-09-03 04:01:03.262889');
INSERT INTO `django_migrations` VALUES (67, 'CMDB', '0009_auto_20180904_0921', '2018-09-04 01:21:33.718824');
INSERT INTO `django_migrations` VALUES (69, 'authtoken', '0001_initial', '2018-09-04 01:21:34.137886');
INSERT INTO `django_migrations` VALUES (71, 'authtoken', '0002_auto_20160226_1747', '2018-09-04 01:21:34.645129');
INSERT INTO `django_migrations` VALUES (73, 'CMDB', '0010_auto_20180904_1550', '2018-09-04 08:03:54.132378');
INSERT INTO `django_migrations` VALUES (75, 'system', '0008_auto_20180904_1550', '2018-09-04 08:03:54.908413');
INSERT INTO `django_migrations` VALUES (77, 'CMDB', '0011_auto_20180904_1607', '2018-09-04 08:08:00.381158');
INSERT INTO `django_migrations` VALUES (79, 'CMDB', '0012_auto_20180904_1614', '2018-09-04 08:14:26.496699');
INSERT INTO `django_migrations` VALUES (81, 'OpsControl', '0001_initial', '2018-09-04 08:15:26.225405');
INSERT INTO `django_migrations` VALUES (83, 'CodeOps', '0001_initial', '2018-09-04 08:15:59.569636');
INSERT INTO `django_migrations` VALUES (85, 'MysqlOps', '0001_initial', '2018-09-04 08:16:28.987361');
INSERT INTO `django_migrations` VALUES (87, 'CMDB', '0013_network_assets', '2018-09-04 09:01:13.356449');
INSERT INTO `django_migrations` VALUES (89, 'CMDB', '0014_auto_20180905_1701', '2018-09-05 09:02:07.407512');
INSERT INTO `django_migrations` VALUES (91, 'Orders', '0001_initial', '2018-09-05 09:02:09.527975');
INSERT INTO `django_migrations` VALUES (93, 'djcelery', '0001_initial', '2018-09-05 09:02:12.526783');
INSERT INTO `django_migrations` VALUES (95, 'system', '0009_filedownload_audit_order_fileupload_audit_order_uploadfiles', '2018-09-05 09:02:13.762200');
INSERT INTO `django_migrations` VALUES (97, 'test', '0001_initial', '2018-09-05 09:05:32.864435');
INSERT INTO `django_migrations` VALUES (99, 'test', '0002_auto_20180905_2014', '2018-09-05 12:14:27.326935');
INSERT INTO `django_migrations` VALUES (101, 'CMDB', '0015_auto_20180910_1659', '2018-09-10 08:59:43.482603');
INSERT INTO `django_migrations` VALUES (103, 'CMDB', '0016_auto_20180910_1825', '2018-09-10 10:26:38.003305');
INSERT INTO `django_migrations` VALUES (105, 'CMDB', '0017_auto_20180911_1758', '2018-09-11 10:20:00.015318');
INSERT INTO `django_migrations` VALUES (107, 'CMDB', '0017_auto_20180911_1836', '2018-09-11 10:51:43.638075');
INSERT INTO `django_migrations` VALUES (109, 'CMDB', '0018_auto_20180911_1853', '2018-09-11 10:59:09.541724');
INSERT INTO `django_migrations` VALUES (111, 'CMDB', '0019_auto_20180911_1859', '2018-09-11 10:59:09.579793');
INSERT INTO `django_migrations` VALUES (113, 'test', '0003_auth', '2018-09-11 10:59:10.551135');
INSERT INTO `django_migrations` VALUES (115, 'CMDB', '0020_auto_20180911_1900', '2018-09-11 11:04:50.394748');
INSERT INTO `django_migrations` VALUES (117, 'CMDB', '0002_mysqlcluster', '2018-09-11 11:11:49.803844');
INSERT INTO `django_migrations` VALUES (119, 'CMDB', '0003_mysql_db', '2018-09-11 11:12:55.760748');
INSERT INTO `django_migrations` VALUES (121, 'CMDB', '0004_mysql_instance', '2018-09-11 11:13:45.602373');
INSERT INTO `django_migrations` VALUES (123, 'CMDB', '0005_mysql_user', '2018-09-11 11:15:04.955340');
INSERT INTO `django_migrations` VALUES (125, 'wiki', '0001_initial', '2018-09-12 02:44:04.684943');
INSERT INTO `django_migrations` VALUES (127, 'CMDB', '0006_auto_20180912_2021', '2018-09-12 12:21:36.813766');
INSERT INTO `django_migrations` VALUES (129, 'elfinder', '0001_initial', '2018-09-13 05:01:42.101788');
INSERT INTO `django_migrations` VALUES (131, 'CMDB', '0002_auto_20180917_1932', '2018-09-17 11:32:44.997209');
INSERT INTO `django_migrations` VALUES (133, 'CMDB', '0003_auto_20180917_2249', '2018-09-17 14:50:03.947027');
INSERT INTO `django_migrations` VALUES (135, 'CMDB', '0004_auto_20180917_2255', '2018-09-17 14:56:40.475100');
INSERT INTO `django_migrations` VALUES (137, 'CMDB', '0005_auto_20180926_1736', '2018-09-26 09:36:38.688637');
INSERT INTO `django_migrations` VALUES (139, 'CMDB', '0006_auto_20180926_1827', '2018-09-26 10:27:34.821367');
INSERT INTO `django_migrations` VALUES (141, 'CMDB', '0007_auto_20180926_1851', '2018-09-26 10:51:58.210885');
INSERT INTO `django_migrations` VALUES (143, 'CMDB', '0008_auto_20180927_1042', '2018-09-27 02:42:50.536383');
INSERT INTO `django_migrations` VALUES (145, 'CMDB', '0009_auto_20180928_0955', '2018-09-28 01:55:54.383561');
INSERT INTO `django_migrations` VALUES (147, 'CMDB', '0010_auto_20180928_1020', '2018-09-28 02:20:59.900335');
INSERT INTO `django_migrations` VALUES (149, 'CMDB', '0011_mysql_db_memo', '2018-09-28 08:15:59.264643');
INSERT INTO `django_migrations` VALUES (151, 'CMDB', '0012_mysql_user_db_host', '2018-09-28 08:47:42.315417');
INSERT INTO `django_migrations` VALUES (153, 'CMDB', '0013_scan_conf_cmd_scan_conf_ip_scan_conf_keyfile_scan_conf_port_scan_conf_sshpass', '2018-10-09 10:23:32.804247');
INSERT INTO `django_migrations` VALUES (155, 'CMDB', '0014_auto_20181010_1809', '2018-10-10 10:09:16.341066');
INSERT INTO `django_migrations` VALUES (157, 'CMDB', '0015_auto_20181016_1642', '2018-10-16 08:42:46.811039');
INSERT INTO `django_migrations` VALUES (159, 'CMDB', '0016_scan_host_conf', '2018-10-16 08:49:06.266711');
INSERT INTO `django_migrations` VALUES (161, 'CMDB', '0017_auto_20181016_1714', '2018-10-16 09:14:43.176306');
INSERT INTO `django_migrations` VALUES (163, 'CMDB', '0018_auto_20181025_2127', '2018-10-25 13:28:04.561493');
INSERT INTO `django_migrations` VALUES (165, 'CMDB', '0019_auto_20181029_1539', '2018-10-29 07:40:14.543723');
INSERT INTO `django_migrations` VALUES (167, 'CMDB', '0020_auto_20181029_1540', '2018-10-29 07:40:14.694745');
INSERT INTO `django_migrations` VALUES (169, 'CMDB', '0021_auto_20181029_1729', '2018-10-29 09:29:52.328259');
INSERT INTO `django_migrations` VALUES (171, 'CMDB', '0022_mysql_user_memo', '2018-10-29 09:34:11.759616');
INSERT INTO `django_migrations` VALUES (173, 'CMDB', '0023_auto_20181029_2111', '2018-10-29 13:11:56.543442');
INSERT INTO `django_migrations` VALUES (175, 'CMDB', '0024_auto_20181031_1914', '2018-10-31 11:14:49.921026');
INSERT INTO `django_migrations` VALUES (177, 'MysqlOps', '0002_binlogparseredo', '2018-11-06 11:51:05.719666');
INSERT INTO `django_migrations` VALUES (179, 'MysqlOps', '0003_binlogparseundo', '2018-11-06 11:52:16.173113');
INSERT INTO `django_migrations` VALUES (181, 'MysqlOps', '0004_auto_20181107_1022', '2018-11-07 02:22:31.178008');
INSERT INTO `django_migrations` VALUES (183, 'MysqlOps', '0005_auto_20181107_1030', '2018-11-07 02:30:26.665294');
INSERT INTO `django_migrations` VALUES (185, 'MysqlOps', '0006_auto_20181107_1031', '2018-11-07 02:31:45.808553');
INSERT INTO `django_migrations` VALUES (187, 'MysqlOps', '0007_auto_20181107_1051', '2018-11-07 02:51:28.270518');
INSERT INTO `django_migrations` VALUES (188, 'CMDB', '0025_auto_20181112_1920', '2018-11-12 11:20:17.782076');
INSERT INTO `django_migrations` VALUES (189, 'OpsControl', '0002_auto_20181112_1920', '2018-11-12 11:20:17.902460');
INSERT INTO `django_migrations` VALUES (190, 'CMDB', '0026_auto_20181112_1950', '2018-11-12 11:51:15.867751');
INSERT INTO `django_migrations` VALUES (191, 'system', '0010_auto_20181113_1915', '2018-11-13 11:15:17.269479');
INSERT INTO `django_migrations` VALUES (192, 'CMDB', '0027_yewutreemptt_root', '2018-11-14 03:35:12.585451');
INSERT INTO `django_migrations` VALUES (193, 'system', '0011_auto_20181114_1817', '2018-11-14 10:17:06.474271');
INSERT INTO `django_migrations` VALUES (194, 'CMDB', '0028_yewutreemptt_islast', '2018-11-15 11:23:16.217770');
INSERT INTO `django_migrations` VALUES (195, 'CMDB', '0029_host_is_pooled', '2018-11-16 10:40:17.007685');
INSERT INTO `django_migrations` VALUES (196, 'CMDB', '0030_auto_20181116_1841', '2018-11-16 12:28:26.568725');
INSERT INTO `django_migrations` VALUES (197, 'CMDB', '0031_auto_20181116_2028', '2018-11-16 12:28:27.966588');
INSERT INTO `django_migrations` VALUES (198, 'CMDB', '0032_auto_20181120_1532', '2018-11-20 07:32:51.676991');
INSERT INTO `django_migrations` VALUES (199, 'OpsControl', '0003_auto_20181129_0914', '2018-11-29 01:14:22.929407');
INSERT INTO `django_migrations` VALUES (200, 'CMDB', '0033_auto_20181204_1630', '2018-12-04 08:30:57.482487');
INSERT INTO `django_migrations` VALUES (201, 'Orders', '0002_auto_20181204_1634', '2018-12-04 08:34:38.274555');
INSERT INTO `django_migrations` VALUES (202, 'system', '0012_auto_20181204_1642', '2018-12-04 08:43:03.217705');
INSERT INTO `django_migrations` VALUES (203, 'CMDB', '0034_auto_20181204_1644', '2018-12-04 08:44:49.008921');
INSERT INTO `django_migrations` VALUES (204, 'CodeOps', '0002_auto_20181204_1650', '2018-12-04 08:50:13.307565');
INSERT INTO `django_migrations` VALUES (205, 'MysqlOps', '0008_auto_20181204_1647', '2018-12-04 08:52:18.957848');
INSERT INTO `django_migrations` VALUES (206, 'MysqlOps', '0009_auto_20181207_1524', '2018-12-07 07:27:29.243711');
INSERT INTO `django_migrations` VALUES (207, 'wiki', '0002_auto_20181207_1524', '2018-12-07 07:27:29.686055');
INSERT INTO `django_migrations` VALUES (208, 'CMDB', '0035_auto_20181210_1927', '2018-12-10 11:27:48.693768');
INSERT INTO `django_migrations` VALUES (209, 'MysqlOps', '0010_custom_high_risk_sql', '2018-12-10 11:27:48.861069');
INSERT INTO `django_migrations` VALUES (210, 'CMDB', '0036_auto_20181213_1404', '2018-12-13 06:04:19.012341');
INSERT INTO `django_migrations` VALUES (211, 'CMDB', '0037_auto_20181219_2035', '2018-12-19 12:35:12.179815');
INSERT INTO `django_migrations` VALUES (212, 'CMDB', '0038_auto_20181221_1339', '2018-12-21 05:40:03.270349');
INSERT INTO `django_migrations` VALUES (213, 'CMDB', '0039_auto_20181221_1345', '2018-12-21 05:45:33.175915');
INSERT INTO `django_migrations` VALUES (214, 'CMDB', '0040_auto_20181221_1710', '2018-12-21 09:11:04.119339');
INSERT INTO `django_migrations` VALUES (215, 'CMDB', '0041_auto_20181221_1809', '2018-12-21 10:09:45.506447');
INSERT INTO `django_migrations` VALUES (216, 'MysqlOps', '0011_auto_20181224_1117', '2018-12-24 03:17:50.541273');
INSERT INTO `django_migrations` VALUES (217, 'CMDB', '0042_auto_20181224_1335', '2018-12-24 05:35:46.588569');
INSERT INTO `django_migrations` VALUES (218, 'CMDB', '0043_auto_20181224_1811', '2018-12-24 10:11:31.925857');
INSERT INTO `django_migrations` VALUES (219, 'MysqlOps', '0012_mysqlfastsql', '2019-01-06 11:24:29.967993');
INSERT INTO `django_migrations` VALUES (220, 'MysqlOps', '0013_auto_20190107_1122', '2019-01-07 03:22:53.283386');
INSERT INTO `django_migrations` VALUES (221, 'MysqlOps', '0014_auto_20190116_1157', '2019-01-16 03:57:14.653704');
INSERT INTO `django_migrations` VALUES (222, 'MysqlOps', '0015_auto_20190116_1532', '2019-01-16 07:33:02.391548');
INSERT INTO `django_migrations` VALUES (223, 'MysqlOps', '0016_auto_20190116_1553', '2019-01-16 07:53:18.521271');
INSERT INTO `django_migrations` VALUES (224, 'MysqlOps', '0017_auto_20190116_1810', '2019-01-16 10:10:49.969904');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1c6x0m317hu61m7df0vg3ivuh49dewez', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-09-14 03:08:07.247330');
INSERT INTO `django_session` VALUES ('1prb7xcosaqb64ncc79th5d7tbeubqpv', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-09-20 13:32:52.355316');
INSERT INTO `django_session` VALUES ('3f9mctw7ym7d2hrg38s7jup7d5hv9jkv', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2019-02-04 08:44:25.814440');
INSERT INTO `django_session` VALUES ('3wld8jxx534ruslf1uq7e35yi2raykuv', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-12-21 16:04:41.286763');
INSERT INTO `django_session` VALUES ('3yxclb0sylmptq8gdx6bt8rh28htnqvx', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-19 02:01:54.611672');
INSERT INTO `django_session` VALUES ('4levpvdxnza6g68sjg7g9sxysvdnh2vs', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2019-01-10 13:44:06.763368');
INSERT INTO `django_session` VALUES ('5br5z13jo4npf7ygx69t6l9pdctk6poa', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-12-26 01:12:07.092922');
INSERT INTO `django_session` VALUES ('5gr6y1lp7ywwlbqnl7qcnyk46jzqotaa', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-08-31 14:33:19.272623');
INSERT INTO `django_session` VALUES ('7eibrnczvy36491r1plzey7lz5jna5yk', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-12-17 06:56:50.996728');
INSERT INTO `django_session` VALUES ('8k6yg5wnfubgrpb1ah3n26mey8uanbq2', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-12-12 01:38:18.041385');
INSERT INTO `django_session` VALUES ('96jdggkl6nugq7nfve9q5l253pcw7q26', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2019-01-29 09:15:08.878627');
INSERT INTO `django_session` VALUES ('9bsz04ycmznvsqz9albxfuy8rlu2ln17', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-09-18 01:08:21.162602');
INSERT INTO `django_session` VALUES ('aij9t3tysghtb8dku7pvu80i0rkvx55j', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-12 11:14:36.537749');
INSERT INTO `django_session` VALUES ('avurk4b2hqyba1ycak49c7crs26m70sc', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-08-30 13:20:52.419934');
INSERT INTO `django_session` VALUES ('ayw1qnatz395132ukdkkr0u4bztsu44v', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-29 14:46:59.450087');
INSERT INTO `django_session` VALUES ('b0qsphe1jvz8ack1frdfnm331b439d6l', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-10-29 11:10:29.041572');
INSERT INTO `django_session` VALUES ('chn01dc09eb350b9d97cd8f2e420b55d', 'MmRmMzYzMDllZDljNWVmMWRiYTdmN2E0ZTZjNGFhMTUzMTNlYjI3ZDp7fQ==', '2018-12-20 09:30:39.267955');
INSERT INTO `django_session` VALUES ('chn1b3d32276238c2744ee96c832e3d3', 'MGJhZGQzOWU2MzkzNjQxNTY4YTVmY2NhNzhjZGNlYjQ4MDVkOGYxNDp7InNlc3Npb25pZCI6ImU0NHRocmF1Z3QweXkzYmNyMHF4cGF2dDNpZGc5dTU3IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-20 09:16:37.650547');
INSERT INTO `django_session` VALUES ('chn262caa70f0a7102350ba38ffff725', 'MGJhZGQzOWU2MzkzNjQxNTY4YTVmY2NhNzhjZGNlYjQ4MDVkOGYxNDp7InNlc3Npb25pZCI6ImU0NHRocmF1Z3QweXkzYmNyMHF4cGF2dDNpZGc5dTU3IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-21 10:36:03.054629');
INSERT INTO `django_session` VALUES ('chn2f61bd735dc520225d0fb7e3617a0', 'MmRmMzYzMDllZDljNWVmMWRiYTdmN2E0ZTZjNGFhMTUzMTNlYjI3ZDp7fQ==', '2018-12-20 09:05:35.446229');
INSERT INTO `django_session` VALUES ('chn385725d488110e48f694cf6153e98', 'OWUyMTI3MGYzMmU1NWQxNzUyNDhhZDA1NzBiZmJiOTFmYWQ4ZmUzYTp7InNlc3Npb25pZCI6ImF5dzFxbmF0ejM5NTEzMnVrZGtrcjB1NGJ6dHN1NDR2IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-13 03:16:28.474382');
INSERT INTO `django_session` VALUES ('chn3a3dbc862c698c0e6c5da3fd69acd', 'MmRmMzYzMDllZDljNWVmMWRiYTdmN2E0ZTZjNGFhMTUzMTNlYjI3ZDp7fQ==', '2018-11-27 12:10:30.288097');
INSERT INTO `django_session` VALUES ('chn42bdbbe0ef28340044253b8676a4f', 'ZDI0ZTAxZDlhNjdiZjg0YjIyNDhkMDU0OGY0MDNjYWQzOWY2NzEwMjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-11-27 12:09:39.092831');
INSERT INTO `django_session` VALUES ('chn462fae61e370d679794ec15d186b4', 'ZDI0ZTAxZDlhNjdiZjg0YjIyNDhkMDU0OGY0MDNjYWQzOWY2NzEwMjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-11-27 12:14:43.194463');
INSERT INTO `django_session` VALUES ('chn4d1f2a4ef013ad1bc303017c3ef34', 'MGJhZGQzOWU2MzkzNjQxNTY4YTVmY2NhNzhjZGNlYjQ4MDVkOGYxNDp7InNlc3Npb25pZCI6ImU0NHRocmF1Z3QweXkzYmNyMHF4cGF2dDNpZGc5dTU3IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-20 09:27:07.244219');
INSERT INTO `django_session` VALUES ('chn4f52487d71a658f82264ca9c03b5e', 'ZDI0ZTAxZDlhNjdiZjg0YjIyNDhkMDU0OGY0MDNjYWQzOWY2NzEwMjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-11-27 12:15:36.307121');
INSERT INTO `django_session` VALUES ('chn5fb883165eec7dc826250d956e53f', 'OWU5ZjMxZjU0MDIzZWM2MDJmOGFmYjhmZWM2MDVjYzQwZDQ3OTM1Nzp7InNlc3Npb25pZCI6InhlaXcxanl4YWh0bjRxYnZ0bW9kcnNoN2g4czc2Z21hIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2019-01-02 03:06:17.005260');
INSERT INTO `django_session` VALUES ('chn677b9c40194f5f296cbfa434e4e4a', 'YjIxOThmNDIwYzdlODEyMzc2NzAyMmQ5OWY1OGE0MmJjOTA4YjNmZjp7InNlc3Npb25pZCI6InhlaXcxanl4YWh0bjRxYnZ0bW9kcnNoN2g4czc2Z21hIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2019-01-04 05:38:11.227721');
INSERT INTO `django_session` VALUES ('chn73a84a79d0dec299afeb3b8da164d', 'YTYwYjljNmZmNmQ0NzI3ZmI4YjVhYTkxYjYwZTFiYzhiYWMwNGUxZjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-11-27 12:09:42.290539');
INSERT INTO `django_session` VALUES ('chn7d369031a22324d7e68478b8d6c6f', 'MGJhZGQzOWU2MzkzNjQxNTY4YTVmY2NhNzhjZGNlYjQ4MDVkOGYxNDp7InNlc3Npb25pZCI6ImU0NHRocmF1Z3QweXkzYmNyMHF4cGF2dDNpZGc5dTU3IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-18 14:34:48.074363');
INSERT INTO `django_session` VALUES ('chn7e9544b7dad1a158d690defb8be97', 'ZDI0ZTAxZDlhNjdiZjg0YjIyNDhkMDU0OGY0MDNjYWQzOWY2NzEwMjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-11-27 12:08:34.963461');
INSERT INTO `django_session` VALUES ('chn7ff1d3c926e30115c4edd5c6a3394', 'OWUyMTI3MGYzMmU1NWQxNzUyNDhhZDA1NzBiZmJiOTFmYWQ4ZmUzYTp7InNlc3Npb25pZCI6ImF5dzFxbmF0ejM5NTEzMnVrZGtrcjB1NGJ6dHN1NDR2IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-13 10:52:29.073657');
INSERT INTO `django_session` VALUES ('chn8b3b53a8ddcacfc7a66a1d5dbeb72', 'ZDI0ZTAxZDlhNjdiZjg0YjIyNDhkMDU0OGY0MDNjYWQzOWY2NzEwMjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-11-27 12:17:14.087785');
INSERT INTO `django_session` VALUES ('chn931d8932c8fe9ee19b32b336172fd', 'MGJhZGQzOWU2MzkzNjQxNTY4YTVmY2NhNzhjZGNlYjQ4MDVkOGYxNDp7InNlc3Npb25pZCI6ImU0NHRocmF1Z3QweXkzYmNyMHF4cGF2dDNpZGc5dTU3IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-20 09:16:37.569695');
INSERT INTO `django_session` VALUES ('chna04e4438d40c045a4088635d9a6da', 'MmRmMzYzMDllZDljNWVmMWRiYTdmN2E0ZTZjNGFhMTUzMTNlYjI3ZDp7fQ==', '2018-12-20 09:17:29.170354');
INSERT INTO `django_session` VALUES ('chna59513e536d414bf4f5274be05f5f', 'YjIxOThmNDIwYzdlODEyMzc2NzAyMmQ5OWY1OGE0MmJjOTA4YjNmZjp7InNlc3Npb25pZCI6InhlaXcxanl4YWh0bjRxYnZ0bW9kcnNoN2g4czc2Z21hIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2019-01-02 02:36:10.941233');
INSERT INTO `django_session` VALUES ('chnad6ab0c6b0a8d1b1bdc18d4eb1faa', 'ZGQ4YzkzZjYxODhhNDViYWFmMjQwOTQyNGMxOWMzMmMxYTYyYWY2ODp7InNlc3Npb25pZCI6IjdlaWJybmN6dnkzNjQ5MXIxcGx6ZXk3bHo1am5hNXlrIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-20 09:31:11.449244');
INSERT INTO `django_session` VALUES ('chnaee773fd948313997bf230d7d1be1', 'MGJhZGQzOWU2MzkzNjQxNTY4YTVmY2NhNzhjZGNlYjQ4MDVkOGYxNDp7InNlc3Npb25pZCI6ImU0NHRocmF1Z3QweXkzYmNyMHF4cGF2dDNpZGc5dTU3IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-20 09:18:32.951657');
INSERT INTO `django_session` VALUES ('chnb51b0e446953f6d87f912982a10d0', 'ZGQ4YzkzZjYxODhhNDViYWFmMjQwOTQyNGMxOWMzMmMxYTYyYWY2ODp7InNlc3Npb25pZCI6IjdlaWJybmN6dnkzNjQ5MXIxcGx6ZXk3bHo1am5hNXlrIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-20 09:04:49.139690');
INSERT INTO `django_session` VALUES ('chnb7347eb20402d59abfbcdf22343cd', 'YTYwYjljNmZmNmQ0NzI3ZmI4YjVhYTkxYjYwZTFiYzhiYWMwNGUxZjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-11-27 12:08:53.023322');
INSERT INTO `django_session` VALUES ('chnbd2ac4677d6bf7e7d2ab22f9e5ff4', 'MmRmMzYzMDllZDljNWVmMWRiYTdmN2E0ZTZjNGFhMTUzMTNlYjI3ZDp7fQ==', '2018-12-20 09:17:05.494838');
INSERT INTO `django_session` VALUES ('chnc7e65e27fee68d57471d40bc6afca', 'ZDI0ZTAxZDlhNjdiZjg0YjIyNDhkMDU0OGY0MDNjYWQzOWY2NzEwMjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-11-27 12:15:30.093788');
INSERT INTO `django_session` VALUES ('chnc855b5ef1dfca718ac756c2040cbd', 'MGJhZGQzOWU2MzkzNjQxNTY4YTVmY2NhNzhjZGNlYjQ4MDVkOGYxNDp7InNlc3Npb25pZCI6ImU0NHRocmF1Z3QweXkzYmNyMHF4cGF2dDNpZGc5dTU3IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-21 09:15:27.719071');
INSERT INTO `django_session` VALUES ('chnc92af66087909dac78af18dd53c97', 'OWUyMTI3MGYzMmU1NWQxNzUyNDhhZDA1NzBiZmJiOTFmYWQ4ZmUzYTp7InNlc3Npb25pZCI6ImF5dzFxbmF0ejM5NTEzMnVrZGtrcjB1NGJ6dHN1NDR2IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-12-05 06:37:44.446995');
INSERT INTO `django_session` VALUES ('chndb24c735eb1b1e2574adfa37887d9', 'YjIxOThmNDIwYzdlODEyMzc2NzAyMmQ5OWY1OGE0MmJjOTA4YjNmZjp7InNlc3Npb25pZCI6InhlaXcxanl4YWh0bjRxYnZ0bW9kcnNoN2g4czc2Z21hIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2019-01-02 02:33:19.550177');
INSERT INTO `django_session` VALUES ('chndb87c49e74dbca7f02d4c4e868199', 'YTYwYjljNmZmNmQ0NzI3ZmI4YjVhYTkxYjYwZTFiYzhiYWMwNGUxZjp7InNlc3Npb25pZCI6IncxeTh2d3d1eHppcWk4Z3d4NG5nZXBkZzA1M3hyMm13IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-11-27 12:09:04.647529');
INSERT INTO `django_session` VALUES ('chnddc63213ec2a44b63b6ee1afea08b', 'MmRmMzYzMDllZDljNWVmMWRiYTdmN2E0ZTZjNGFhMTUzMTNlYjI3ZDp7fQ==', '2018-12-20 09:04:31.494682');
INSERT INTO `django_session` VALUES ('chnf4ad5f7cbb197be7c96cc51da81a9', 'NTEwNGM5MzFjMmQ3YzY4OGYxM2UzNDY2MmRjZGEyZmI2NzMxOGIyMTp7InNlc3Npb25pZCI6InRyMzRoejRhY3ZxbGZ4djhsMms1eWN1M3A5cWJnZWQ5IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWQ5ZDU4ZGRlYzE2NzNlYmNjZGVmMzc4NGFiZjYwZGNjYzY0ZjdiOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-11-28 03:34:36.931203');
INSERT INTO `django_session` VALUES ('chnf7de964e24ede5ce4368a4990f8ea', 'MmRmMzYzMDllZDljNWVmMWRiYTdmN2E0ZTZjNGFhMTUzMTNlYjI3ZDp7fQ==', '2018-11-27 12:09:18.142603');
INSERT INTO `django_session` VALUES ('d05sowybgsx64vsayeowjppuot3ksjh6', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-10-12 11:17:01.542128');
INSERT INTO `django_session` VALUES ('e44thraugt0yy3bcr0qxpavt3idg9u57', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-12-11 15:28:19.639075');
INSERT INTO `django_session` VALUES ('flvh504im6q10wlt09j3mnl2w7hn3im6', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-09-28 10:02:47.333346');
INSERT INTO `django_session` VALUES ('fupcq3y03kwef7bc8jh2wxiz2ve1n349', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-08-30 13:07:32.720010');
INSERT INTO `django_session` VALUES ('ihlty9swma06why1090tlr8woxakvxxe', 'NjNiZDMwNGY4MWY3NjI3NWY4MTU0Y2Q4Yjk3YTFjOWIyNjAyY2VlODp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2018-09-19 09:10:22.651791');
INSERT INTO `django_session` VALUES ('j060biw8myjlhvizt1af3vz2kzacace8', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-10-30 07:13:53.840747');
INSERT INTO `django_session` VALUES ('oulfxrmyebx952dc8t7wu7l9sjlesob4', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2019-01-20 08:24:49.496743');
INSERT INTO `django_session` VALUES ('peimnr2luzhzj2o0tkfpk5sfrd0ahea9', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-12-21 16:02:31.393518');
INSERT INTO `django_session` VALUES ('q40yc2ce3nqr2tue8azaur7re3uz7liv', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2019-01-08 07:42:55.548132');
INSERT INTO `django_session` VALUES ('r79q4uelcqqi1ouwuh0wooecq8ndao1n', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2019-01-02 03:49:00.517589');
INSERT INTO `django_session` VALUES ('tr34hz4acvqlfxv8l2k5ycu3p9qbged9', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-27 03:55:23.426548');
INSERT INTO `django_session` VALUES ('viva12c7sqyeo5j78ul2usxdq2xqj5uj', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-10-13 07:50:11.271389');
INSERT INTO `django_session` VALUES ('w1y8vwwuxziqi8gwx4ngepdg053xr2mw', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-14 02:39:19.973375');
INSERT INTO `django_session` VALUES ('xeiw1jyxahtn4qbvtmodrsh7h8s76gma', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-12-31 11:14:46.393918');
INSERT INTO `django_session` VALUES ('zihjj7yw0bfylciasqzcckk055ocs3x0', 'MjZhZjMzNTQ1YWU1MzVhM2IxMWM2MGZhMTA1MmVjOTU0ZDA5MDgwNjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI1ZDlkNThkZGVjMTY3M2ViY2NkZWYzNzg0YWJmNjBkY2NjNjRmN2I4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2019-02-25 01:42:12.531836');

-- ----------------------------
-- Table structure for djcelery_crontabschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_crontabschedule`;
CREATE TABLE `djcelery_crontabschedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_week` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_month` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `month_of_year` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of djcelery_crontabschedule
-- ----------------------------
INSERT INTO `djcelery_crontabschedule` VALUES (1, '0', '4', '*', '*', '*');

-- ----------------------------
-- Table structure for djcelery_intervalschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_intervalschedule`;
CREATE TABLE `djcelery_intervalschedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for djcelery_periodictask
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictask`;
CREATE TABLE `djcelery_periodictask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kwargs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) UNSIGNED NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_`(`crontab_id`) USING BTREE,
  INDEX `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_`(`interval_id`) USING BTREE,
  CONSTRAINT `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of djcelery_periodictask
-- ----------------------------
INSERT INTO `djcelery_periodictask` VALUES (1, 'celery.backend_cleanup', 'celery.backend_cleanup', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2019-02-11 02:10:25.249670', 109, '2019-02-11 02:12:20.176125', '', 1, NULL);

-- ----------------------------
-- Table structure for djcelery_periodictasks
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictasks`;
CREATE TABLE `djcelery_periodictasks`  (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of djcelery_periodictasks
-- ----------------------------
INSERT INTO `djcelery_periodictasks` VALUES (1, '2018-12-24 07:04:52.365285');

-- ----------------------------
-- Table structure for djcelery_taskstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_taskstate`;
CREATE TABLE `djcelery_taskstate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kwargs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `traceback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `djcelery_taskstate_state_53543be4`(`state`) USING BTREE,
  INDEX `djcelery_taskstate_name_8af9eded`(`name`) USING BTREE,
  INDEX `djcelery_taskstate_tstamp_4c3f93a1`(`tstamp`) USING BTREE,
  INDEX `djcelery_taskstate_hidden_c3905e57`(`hidden`) USING BTREE,
  INDEX `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id`(`worker_id`) USING BTREE,
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 311 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of djcelery_taskstate
-- ----------------------------
INSERT INTO `djcelery_taskstate` VALUES (307, 'SUCCESS', 'ec4cf591-643d-4d74-92c8-aaa827c18909', 'celery.backend_cleanup', '2019-02-10 20:00:00.218758', '[]', '{}', NULL, NULL, '\'None\'', NULL, 0.190216693095863, 0, 0, 1);
INSERT INTO `djcelery_taskstate` VALUES (309, 'SUCCESS', '7a0e279a-8190-4e19-89a0-c96f61477e69', 'celery.backend_cleanup', '2019-02-11 02:10:25.264753', '[]', '{}', NULL, NULL, '\'None\'', NULL, 0.0101180132478476, 0, 0, 3);

-- ----------------------------
-- Table structure for djcelery_workerstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_workerstate`;
CREATE TABLE `djcelery_workerstate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hostname`(`hostname`) USING BTREE,
  INDEX `djcelery_workerstate_last_heartbeat_4539b544`(`last_heartbeat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of djcelery_workerstate
-- ----------------------------
INSERT INTO `djcelery_workerstate` VALUES (1, 'celery@roe', '2019-02-11 02:01:17.717506');
INSERT INTO `djcelery_workerstate` VALUES (3, 'celery@uat-cmdb01.veredholdings.cn', '2019-02-11 02:23:28.594405');

-- ----------------------------
-- Table structure for elfinder_yawdelfindertestmodel
-- ----------------------------
DROP TABLE IF EXISTS `elfinder_yawdelfindertestmodel`;
CREATE TABLE `elfinder_yawdelfindertestmodel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anyfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for email_config
-- ----------------------------
DROP TABLE IF EXISTS `email_config`;
CREATE TABLE `email_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` smallint(6) NOT NULL,
  `user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `passwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc_user` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for filedownload_audit_order
-- ----------------------------
DROP TABLE IF EXISTS `filedownload_audit_order`;
CREATE TABLE `filedownload_audit_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dest_server` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dest_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `opsmanage_filedownlo_order_id_cb27bfbd_fk_opsmanage` FOREIGN KEY (`order_id`) REFERENCES `order_system` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fileupload_audit_order
-- ----------------------------
DROP TABLE IF EXISTS `fileupload_audit_order`;
CREATE TABLE `fileupload_audit_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dest_server` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chown_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chown_rwx` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `opsmanage_fileupload_order_id_86839b06_fk_opsmanage` FOREIGN KEY (`order_id`) REFERENCES `order_system` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for global_config
-- ----------------------------
DROP TABLE IF EXISTS `global_config`;
CREATE TABLE `global_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ansible_model` smallint(6) DEFAULT NULL,
  `ansible_playbook` smallint(6) DEFAULT NULL,
  `cron` smallint(6) DEFAULT NULL,
  `project` smallint(6) DEFAULT NULL,
  `assets` smallint(6) DEFAULT NULL,
  `server` smallint(6) DEFAULT NULL,
  `email` smallint(6) DEFAULT NULL,
  `webssh` smallint(6) DEFAULT NULL,
  `sql` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of global_config
-- ----------------------------
INSERT INTO `global_config` VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, NULL);

-- ----------------------------
-- Table structure for host_loginfail
-- ----------------------------
DROP TABLE IF EXISTS `host_loginfail`;
CREATE TABLE `host_loginfail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_ssh` tinyint(1) NOT NULL,
  `port` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_inhost` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 688 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of host_loginfail
-- ----------------------------
INSERT INTO `host_loginfail` VALUES (672, '172.16.50.151', 1, 1, '22', 0);
INSERT INTO `host_loginfail` VALUES (673, '172.16.50.196', 1, 1, '22', 0);
INSERT INTO `host_loginfail` VALUES (674, '172.16.50.159', 1, 1, '22', 0);
INSERT INTO `host_loginfail` VALUES (675, '172.16.50.194', 1, 1, '22', 0);
INSERT INTO `host_loginfail` VALUES (676, '172.16.50.29', 1, 1, '22', 0);
INSERT INTO `host_loginfail` VALUES (677, '172.16.50.27', 1, 1, '22', 0);
INSERT INTO `host_loginfail` VALUES (678, '172.16.50.25', 1, 1, '22', 0);
INSERT INTO `host_loginfail` VALUES (679, '10.0.8.200', 1, 0, '', 0);
INSERT INTO `host_loginfail` VALUES (680, '10.0.8.68', 1, 0, '', 0);
INSERT INTO `host_loginfail` VALUES (681, '10.0.8.31', 1, 0, '', 0);
INSERT INTO `host_loginfail` VALUES (682, '10.0.8.21', 1, 0, '', 0);
INSERT INTO `host_loginfail` VALUES (683, '10.0.8.62', 1, 0, '', 0);
INSERT INTO `host_loginfail` VALUES (684, '10.0.8.63', 1, 0, '', 0);
INSERT INTO `host_loginfail` VALUES (685, '10.0.8.64', 1, 0, '', 0);
INSERT INTO `host_loginfail` VALUES (686, '10.0.8.66', 1, 0, '', 0);
INSERT INTO `host_loginfail` VALUES (687, '10.0.8.67', 1, 0, '', 0);

-- ----------------------------
-- Table structure for idc
-- ----------------------------
DROP TABLE IF EXISTS `idc`;
CREATE TABLE `idc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jigui` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_range` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bandwidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of idc
-- ----------------------------
INSERT INTO `idc` VALUES (1, '保利国际机房', 'BGP', '士大夫撒地方', '', '18515050075', '18515050075', '', '', '', '2018-09-02', '2018-09-29', '');
INSERT INTO `idc` VALUES (2, '鹏博士机房', 'BGP', '地址在哪里', '', '', '18515050075', '', '', '', '2018-09-27', '2018-09-29', '');

-- ----------------------------
-- Table structure for ipsource
-- ----------------------------
DROP TABLE IF EXISTS `ipsource`;
CREATE TABLE `ipsource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subnet` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `beizhu` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ip`(`ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 649 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ipsource
-- ----------------------------
INSERT INTO `ipsource` VALUES (41, '172.16.50.125', '255.255.255.0', NULL, 1, '供电所覆盖');
INSERT INTO `ipsource` VALUES (43, '172.16.50.126', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (45, '172.16.50.127', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (47, '172.16.50.131', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (49, '172.16.50.132', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (51, '172.16.50.133', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (53, '172.16.50.134', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (55, '172.16.50.135', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (57, '172.16.50.136', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (59, '172.16.50.137', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (61, '172.16.50.138', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (63, '172.16.50.139', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (65, '172.16.50.14', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (67, '172.16.50.140', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (69, '172.16.50.141', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (71, '172.16.50.142', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (73, '172.16.50.143', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (75, '172.16.50.144', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (77, '172.16.50.15', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (79, '172.16.50.151', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (81, '172.16.50.152', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (83, '172.16.50.153', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (85, '172.16.50.16', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (87, '172.16.50.163', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (89, '172.16.50.164', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (91, '172.16.50.165', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (93, '172.16.50.166', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (95, '172.16.50.167', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (97, '172.16.50.168', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (99, '172.16.50.169', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (101, '172.16.50.17', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (103, '172.16.50.170', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (105, '172.16.50.171', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (107, '172.16.50.172', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (109, '172.16.50.173', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (111, '172.16.50.174', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (113, '172.16.50.176', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (115, '172.16.50.177', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (117, '172.16.50.178', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (119, '172.16.50.179', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (121, '172.16.50.18', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (123, '172.16.50.180', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (125, '172.16.50.181', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (127, '172.16.50.182', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (129, '172.16.50.183', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (131, '172.16.50.184', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (133, '172.16.50.185', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (135, '172.16.50.186', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (137, '172.16.50.187', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (139, '172.16.50.188', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (141, '172.16.50.189', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (143, '172.16.50.19', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (145, '172.16.50.190', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (147, '172.16.50.191', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (149, '172.16.50.192', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (151, '172.16.50.193', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (153, '172.16.50.194', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (155, '172.16.50.195', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (157, '172.16.50.196', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (159, '172.16.50.197', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (161, '172.16.50.198', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (163, '172.16.50.199', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (165, '172.16.50.20', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (167, '172.16.50.200', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (169, '172.16.50.201', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (171, '172.16.50.208', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (173, '172.16.50.209', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (175, '172.16.50.21', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (177, '172.16.50.210', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (179, '172.16.50.211', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (181, '172.16.50.213', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (183, '172.16.50.214', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (185, '172.16.50.215', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (187, '172.16.50.216', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (189, '172.16.50.217', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (191, '172.16.50.218', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (193, '172.16.50.219', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (195, '172.16.50.220', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (197, '172.16.50.223', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (199, '172.16.50.23', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (201, '172.16.50.230', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (203, '172.16.50.24', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (205, '172.16.50.241', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (207, '172.16.50.242', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (209, '172.16.50.243', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (211, '172.16.50.244', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (213, '172.16.50.245', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (215, '172.16.50.246', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (217, '172.16.50.247', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (219, '172.16.50.25', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (221, '172.16.50.27', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (223, '172.16.50.29', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (225, '172.16.50.31', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (227, '172.16.50.50', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (229, '172.16.50.51', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (231, '172.16.50.52', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (233, '172.16.50.53', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (235, '172.16.50.54', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (237, '172.16.50.55', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (239, '172.16.50.56', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (241, '172.16.50.57', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (243, '172.16.50.58', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (245, '172.16.50.59', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (247, '172.16.50.60', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (249, '172.16.50.61', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (251, '172.16.50.62', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (253, '172.16.50.63', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (255, '172.16.50.64', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (257, '172.16.50.65', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (259, '172.16.50.66', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (261, '172.16.50.67', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (263, '172.16.50.70', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (265, '172.16.50.71', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (267, '172.16.50.72', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (269, '172.16.50.73', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (271, '172.16.50.74', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (273, '172.16.50.75', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (275, '172.16.50.76', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (277, '172.16.50.77', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (279, '172.16.50.78', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (281, '172.16.50.79', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (283, '172.16.50.80', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (285, '172.16.50.81', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (287, '172.16.50.82', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (289, '172.16.50.83', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (291, '172.16.50.84', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (293, '172.16.50.85', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (295, '172.16.50.86', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (297, '172.16.50.87', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (299, '172.16.50.88', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (301, '172.16.50.89', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (303, '172.16.50.90', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (305, '172.16.50.91', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (307, '172.16.50.92', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (309, '172.16.50.93', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (311, '172.16.50.94', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (313, '172.16.50.95', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (315, '172.16.50.96', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (317, '172.16.50.97', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (319, '172.16.50.98', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (321, '172.16.50.99', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (323, '172.16.60.1', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (325, '172.16.60.201', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (327, '172.16.60.203', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (329, '172.16.60.204', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (331, '172.16.60.205', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (333, '172.16.60.206', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (335, '172.16.60.208', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (337, '172.16.60.209', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (339, '172.16.60.21', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (341, '172.16.60.210', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (343, '172.16.60.22', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (345, '172.16.60.220', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (347, '172.16.60.225', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (349, '172.16.60.23', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (351, '172.16.60.24', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (353, '172.16.60.25', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (355, '172.16.60.31', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (357, '172.16.60.32', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (359, '172.16.60.33', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (361, '172.16.60.34', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (363, '172.16.60.35', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (365, '172.16.60.36', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (367, '172.16.60.37', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (369, '172.16.60.38', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (371, '172.16.60.39', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (373, '10.0.40.1', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (375, '10.0.40.124', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (377, '10.0.40.125', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (379, '10.0.40.128', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (381, '10.0.40.129', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (383, '10.0.40.137', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (385, '10.0.40.138', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (387, '10.0.40.141', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (389, '10.0.40.142', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (391, '10.0.40.144', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (393, '10.0.40.145', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (395, '10.0.40.146', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (397, '10.0.40.161', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (399, '10.0.40.162', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (401, '10.0.40.163', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (403, '10.0.40.172', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (405, '10.0.40.173', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (407, '10.0.40.174', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (409, '10.0.40.2', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (411, '10.0.40.24', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (413, '10.0.40.25', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (415, '10.0.40.26', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (417, '10.0.40.28', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (419, '10.0.40.29', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (421, '10.0.40.3', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (423, '10.0.40.30', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (425, '10.0.40.37', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (427, '10.0.40.38', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (429, '10.0.40.39', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (431, '10.0.40.40', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (433, '10.0.40.41', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (435, '10.0.40.42', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (437, '10.0.40.44', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (439, '10.0.40.45', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (441, '10.0.40.46', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (443, '10.0.40.48', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (445, '10.0.40.49', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (447, '10.0.40.50', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (449, '10.0.40.52', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (451, '10.0.40.53', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (453, '10.0.40.56', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (455, '10.0.40.57', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (457, '10.0.40.58', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (459, '10.0.40.60', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (461, '10.0.40.61', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (463, '10.0.40.68', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (465, '10.0.40.69', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (467, '10.0.40.70', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (469, '10.0.40.72', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (471, '10.0.40.76', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (473, '10.0.40.77', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (475, '10.0.40.78', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (477, '10.0.60.1', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (479, '10.0.60.2', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (481, '10.0.60.20', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (483, '10.0.60.21', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (485, '10.0.60.24', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (487, '10.0.60.25', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (489, '10.0.60.28', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (491, '10.0.60.29', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (493, '10.0.60.3', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (495, '10.0.60.32', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (497, '10.0.60.33', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (499, '10.0.41.1', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (501, '10.0.41.2', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (503, '10.0.41.20', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (505, '10.0.41.21', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (507, '10.0.41.22', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (509, '10.0.41.24', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (511, '10.0.41.25', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (513, '10.0.41.26', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (515, '10.0.41.3', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (517, '10.0.41.52', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (519, '10.0.41.53', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (521, '10.0.41.54', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (523, '10.0.41.55', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (525, '10.0.41.56', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (527, '10.0.41.57', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (529, '10.0.41.58', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (531, '10.0.41.59', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (533, '10.0.41.60', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (535, '10.0.52.1', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (537, '10.0.52.2', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (539, '10.0.52.200', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (541, '10.0.52.201', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (543, '10.0.52.202', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (545, '10.0.52.21', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (547, '10.0.52.22', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (549, '10.0.52.23', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (551, '10.0.52.24', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (553, '10.0.52.25', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (555, '10.0.52.26', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (557, '10.0.52.27', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (559, '10.0.52.28', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (561, '10.0.52.29', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (563, '10.0.52.3', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (565, '10.0.52.32', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (567, '10.0.52.33', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (569, '10.0.52.34', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (571, '10.0.52.36', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (573, '10.0.52.37', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (575, '10.0.52.38', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (583, '10.0.52.41', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (585, '172.16.50.1', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (587, '172.16.50.100', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (589, '172.16.50.101', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (591, '172.16.50.102', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (593, '172.16.50.103', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (595, '172.16.50.104', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (597, '172.16.50.105', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (599, '172.16.50.106', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (601, '172.16.50.107', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (603, '172.16.50.108', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (605, '172.16.50.109', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (607, '172.16.50.110', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (609, '172.16.50.112', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (611, '172.16.50.113', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (613, '172.16.50.115', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (615, '172.16.50.121', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (617, '172.16.50.122', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (619, '172.16.50.123', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (621, '172.16.50.124', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (623, '172.16.50.222', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (625, '10.0.52.39', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (627, '10.0.52.40', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (629, '172.16.50.150', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (631, '172.16.50.159', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (633, '172.16.50.162', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (635, '172.16.50.251', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (637, '172.16.50.252', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (638, '172.16.50.145', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (639, '172.16.60.111', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (640, '172.16.60.200', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (641, '172.16.60.202', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (642, '172.16.60.207', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (643, '172.16.60.212', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (644, '172.16.60.213', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (645, '172.16.60.214', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (646, '172.16.60.221', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (647, '172.16.60.222', '255.255.255.0', NULL, 1, NULL);
INSERT INTO `ipsource` VALUES (648, '172.16.60.239', '255.255.255.0', NULL, 1, NULL);

-- ----------------------------
-- Table structure for larrymenus
-- ----------------------------
DROP TABLE IF EXISTS `larrymenus`;
CREATE TABLE `larrymenus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `font` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spread` tinyint(1) NOT NULL,
  `pid_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `show` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `larryMenus_pid_id_82efcef7_fk_larryMenus_id`(`pid_id`) USING BTREE,
  CONSTRAINT `larryMenus_pid_id_82efcef7_fk_larryMenus_id` FOREIGN KEY (`pid_id`) REFERENCES `larrymenus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of larrymenus
-- ----------------------------
INSERT INTO `larrymenus` VALUES (1, '资产管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `larrymenus` VALUES (2, '作业平台', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `larrymenus` VALUES (3, '中间件管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `larrymenus` VALUES (5, '代码管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `larrymenus` VALUES (7, 'DB管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `larrymenus` VALUES (10, 'wiki', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `larrymenus` VALUES (11, '系统配置', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `larrymenus` VALUES (36, '主机资产', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0);
INSERT INTO `larrymenus` VALUES (37, 'DB资产', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0);
INSERT INTO `larrymenus` VALUES (39, 'oracle', NULL, NULL, '', NULL, NULL, 0, 37, NULL, 0);
INSERT INTO `larrymenus` VALUES (41, 'mysql', NULL, NULL, NULL, NULL, NULL, 0, 37, NULL, 0);
INSERT INTO `larrymenus` VALUES (43, 'mongo', NULL, NULL, '', NULL, NULL, 0, 37, NULL, 0);
INSERT INTO `larrymenus` VALUES (45, 'redis', NULL, NULL, '/developing', NULL, NULL, 0, 37, NULL, 0);
INSERT INTO `larrymenus` VALUES (61, '菜单管理', NULL, NULL, '/system/menuops', NULL, NULL, 0, 11, NULL, 0);
INSERT INTO `larrymenus` VALUES (63, '业务树', NULL, NULL, '/cmdb/yewutree', NULL, NULL, 0, 1, NULL, 0);
INSERT INTO `larrymenus` VALUES (65, '机房管理', NULL, NULL, '/cmdb/idc_show', NULL, NULL, 0, 1, NULL, 0);
INSERT INTO `larrymenus` VALUES (66, '权限管理', NULL, NULL, NULL, NULL, NULL, 0, 11, NULL, 0);
INSERT INTO `larrymenus` VALUES (67, '用户管理', NULL, NULL, '/system/users/manage', NULL, NULL, 0, 66, NULL, 0);
INSERT INTO `larrymenus` VALUES (73, '角色管理', NULL, NULL, '/system/users/rolelist', NULL, NULL, 0, 66, NULL, 0);
INSERT INTO `larrymenus` VALUES (74, 'webssh', NULL, NULL, '/system/websshlist/', NULL, NULL, 0, 11, NULL, 1);
INSERT INTO `larrymenus` VALUES (75, 'oracle_cluster', NULL, NULL, '/cmdb/db/oracle_cluster', NULL, NULL, 0, 39, NULL, 0);
INSERT INTO `larrymenus` VALUES (77, 'oracle_user', NULL, NULL, '/cmdb/db/oracle_user', NULL, NULL, 0, 39, NULL, 0);
INSERT INTO `larrymenus` VALUES (79, 'oracle_tablespace', NULL, NULL, '/cmdb/db/oracle_tablespace', NULL, NULL, 0, 39, NULL, 0);
INSERT INTO `larrymenus` VALUES (81, 'oracle_instance', NULL, NULL, '/cmdb/db/oracle_instance', NULL, NULL, 0, 39, NULL, 0);
INSERT INTO `larrymenus` VALUES (92, '文档列表', NULL, NULL, '/wiki/index', NULL, NULL, 0, 10, NULL, 0);
INSERT INTO `larrymenus` VALUES (93, '新建文档', NULL, NULL, '/wiki/add', NULL, NULL, 0, 10, NULL, 0);
INSERT INTO `larrymenus` VALUES (118, '任务调度', NULL, NULL, '/developing', NULL, NULL, 0, 2, NULL, 0);
INSERT INTO `larrymenus` VALUES (119, '调度类型', NULL, NULL, '/developing', NULL, NULL, 0, 118, NULL, 0);
INSERT INTO `larrymenus` VALUES (120, '运行日志', NULL, NULL, '/opscontrol/task_view', NULL, NULL, 0, 118, NULL, 0);
INSERT INTO `larrymenus` VALUES (121, '代码发布', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0);
INSERT INTO `larrymenus` VALUES (122, '项目配置', NULL, NULL, '/developing', NULL, NULL, 0, 121, NULL, 0);
INSERT INTO `larrymenus` VALUES (123, '项目列表', NULL, NULL, '/developing', NULL, NULL, 0, 121, NULL, 0);
INSERT INTO `larrymenus` VALUES (150, 'mysql_cluster', NULL, NULL, '/cmdb/db/mysql_cluster', NULL, NULL, 0, 41, NULL, 0);
INSERT INTO `larrymenus` VALUES (151, 'mysql_db', NULL, NULL, '/cmdb/db/mysql_db', NULL, NULL, 0, 41, NULL, 0);
INSERT INTO `larrymenus` VALUES (152, 'mysql_user', NULL, NULL, '/cmdb/db/mysql_user', NULL, NULL, 0, 41, NULL, 0);
INSERT INTO `larrymenus` VALUES (153, 'mysql_instance', NULL, NULL, '/cmdb/db/mysql_instance', NULL, NULL, 0, 41, NULL, 0);
INSERT INTO `larrymenus` VALUES (155, 'mongo_cluster', NULL, NULL, '/developing', NULL, NULL, 0, 43, NULL, 0);
INSERT INTO `larrymenus` VALUES (156, 'mongo_user', NULL, NULL, '/developing', NULL, NULL, 0, 43, NULL, 0);
INSERT INTO `larrymenus` VALUES (157, 'mongo_instance', NULL, NULL, '/developing', NULL, NULL, 0, 43, NULL, 0);
INSERT INTO `larrymenus` VALUES (158, 'mongo_db', NULL, NULL, '/developing', NULL, NULL, 0, 43, NULL, 0);
INSERT INTO `larrymenus` VALUES (160, '资产扫描配置', NULL, NULL, '/cmdb/scan/host/conf', NULL, NULL, 0, 36, NULL, 0);
INSERT INTO `larrymenus` VALUES (161, 'IP资源', NULL, NULL, '/cmdb/scan/ip/scan/', NULL, NULL, 0, 36, NULL, 0);
INSERT INTO `larrymenus` VALUES (162, '主机扫描', NULL, NULL, '/cmdb/scan/host/scan/', NULL, NULL, 0, 36, NULL, 0);
INSERT INTO `larrymenus` VALUES (163, '宿主机服务器', NULL, NULL, '/cmdb/suzhuhost/list', NULL, NULL, 0, 36, NULL, 0);
INSERT INTO `larrymenus` VALUES (164, '物理机服务器', NULL, NULL, '/cmdb/wulihost/list', NULL, NULL, 0, 36, NULL, 0);
INSERT INTO `larrymenus` VALUES (165, '虚拟机', NULL, NULL, '/cmdb/xunihost/list', NULL, NULL, 0, 36, NULL, 0);
INSERT INTO `larrymenus` VALUES (170, 'mysql管理', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 1);
INSERT INTO `larrymenus` VALUES (171, 'mysql部署', NULL, NULL, '/developing', NULL, NULL, 0, 170, NULL, 1);
INSERT INTO `larrymenus` VALUES (172, 'mysql日志解析', NULL, NULL, '/mysqlops/binlog_parse/', NULL, NULL, 0, 170, NULL, 1);
INSERT INTO `larrymenus` VALUES (173, 'mysql DML DDL', NULL, NULL, '/mysqlops/mysql_sql_cmd/', NULL, NULL, 0, 170, NULL, 1);
INSERT INTO `larrymenus` VALUES (174, 'mysql性能快查', NULL, NULL, '/developing', NULL, NULL, 0, 170, NULL, 1);
INSERT INTO `larrymenus` VALUES (175, '二进制软件部署', NULL, NULL, '/mysqlops/mysql_deploy_single_soft/', NULL, NULL, 0, 171, NULL, 1);
INSERT INTO `larrymenus` VALUES (176, '增加从库', NULL, NULL, '/mysqlops/mysql_deploy_single/', NULL, NULL, 0, 171, NULL, 1);
INSERT INTO `larrymenus` VALUES (177, '主库数据库创建', NULL, NULL, '/mysqlops/mysql_deploy_single_database', NULL, NULL, 0, 171, NULL, 1);
INSERT INTO `larrymenus` VALUES (178, 'innodb cluster 部署', NULL, NULL, '/developing', NULL, NULL, 0, 171, NULL, 1);
INSERT INTO `larrymenus` VALUES (179, 'sql命令管理', NULL, NULL, '/mysqlops/mysql_fast_SQL_list', NULL, NULL, 0, 174, NULL, 1);
INSERT INTO `larrymenus` VALUES (180, '作业执行', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 1);
INSERT INTO `larrymenus` VALUES (181, '快速执行命令', NULL, NULL, '/opscontrol/ansible_exe_modules', NULL, NULL, 0, 180, NULL, 1);
INSERT INTO `larrymenus` VALUES (182, '快速执行脚本', NULL, NULL, '/opscontrol/ansible_exe_script', NULL, NULL, 0, 180, NULL, 1);
INSERT INTO `larrymenus` VALUES (183, '快速分发文件', NULL, NULL, '/opscontrol/ansible_transfile', NULL, NULL, 0, 180, NULL, 1);
INSERT INTO `larrymenus` VALUES (184, '步骤式作业', NULL, NULL, NULL, NULL, NULL, 0, 180, NULL, 1);
INSERT INTO `larrymenus` VALUES (185, '常用作业执行', NULL, NULL, '/developing', NULL, NULL, 0, 184, NULL, 1);
INSERT INTO `larrymenus` VALUES (186, '新建作业', NULL, NULL, '/developing', NULL, NULL, 0, 184, NULL, 1);
INSERT INTO `larrymenus` VALUES (187, '作业管理', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 1);
INSERT INTO `larrymenus` VALUES (188, '脚本管理', NULL, NULL, '/developing', NULL, NULL, 0, 187, NULL, 1);
INSERT INTO `larrymenus` VALUES (189, 'ansible剧本', NULL, NULL, '/developing', NULL, NULL, 0, 187, NULL, 1);
INSERT INTO `larrymenus` VALUES (190, '快捷命令', NULL, NULL, '/mysqlops/mysql_fast_sql_show', NULL, NULL, 0, 174, NULL, 1);
INSERT INTO `larrymenus` VALUES (191, 'Oracle', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 1);
INSERT INTO `larrymenus` VALUES (192, 'oracle部署', NULL, NULL, NULL, NULL, NULL, 0, 191, NULL, 1);
INSERT INTO `larrymenus` VALUES (193, 'oracle 单机', NULL, NULL, '/developing', NULL, NULL, 0, 192, NULL, 1);
INSERT INTO `larrymenus` VALUES (194, 'oracle 主从', NULL, NULL, '/developing', NULL, NULL, 0, 192, NULL, 1);
INSERT INTO `larrymenus` VALUES (195, '添加新从库', NULL, NULL, '/developing', NULL, NULL, 0, 192, NULL, 1);
INSERT INTO `larrymenus` VALUES (196, 'RAC请人工', NULL, NULL, '/developing', NULL, NULL, 0, 192, NULL, 1);
INSERT INTO `larrymenus` VALUES (197, 'oracle命令执行', NULL, NULL, '/developing', NULL, NULL, 0, 191, NULL, 1);
INSERT INTO `larrymenus` VALUES (198, 'oracle性能快查', NULL, NULL, NULL, NULL, NULL, 0, 191, NULL, 1);
INSERT INTO `larrymenus` VALUES (199, 'sql命令管理', NULL, NULL, NULL, NULL, NULL, 0, 198, NULL, 1);
INSERT INTO `larrymenus` VALUES (200, '快捷命令', NULL, NULL, '/developing', NULL, NULL, 0, 198, NULL, 1);

-- ----------------------------
-- Table structure for log_ansible_model
-- ----------------------------
DROP TABLE IF EXISTS `log_ansible_model`;
CREATE TABLE `log_ansible_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ans_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans_args` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ans_server` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_ansible_model
-- ----------------------------
INSERT INTO `log_ansible_model` VALUES (1, 'admin', 'script', '', '172.16.50.222', '2018-12-03 09:40:01.103237');
INSERT INTO `log_ansible_model` VALUES (2, 'admin', 'script', '', '172.16.50.222', '2018-12-03 09:49:56.550825');
INSERT INTO `log_ansible_model` VALUES (3, 'admin', 'script', '/tmp/fast_script_20181203172920', '172.16.50.222', '2018-12-03 10:01:33.999702');
INSERT INTO `log_ansible_model` VALUES (4, 'admin', 'script', '/tmp/fast_script_20181203172920', '172.16.50.222', '2018-12-03 10:03:20.007018');
INSERT INTO `log_ansible_model` VALUES (5, 'admin', 'script', '/tmp/fast_script_20181203172920', '172.16.50.223,172.16.50.222,172.16.50.230', '2018-12-03 10:04:43.236015');
INSERT INTO `log_ansible_model` VALUES (6, 'admin', 'script', '/tmp/fast_script_20181203180521', '172.16.50.223,172.16.50.222,172.16.50.230', '2018-12-03 10:05:45.530414');
INSERT INTO `log_ansible_model` VALUES (7, 'admin', 'script', '/tmp/fast_script_20181204171439', '172.16.50.223,172.16.50.222', '2018-12-04 09:14:55.238022');
INSERT INTO `log_ansible_model` VALUES (8, 'admin', 'raw', 'ls /data', '206,207', '2018-12-05 05:35:15.488624');
INSERT INTO `log_ansible_model` VALUES (9, 'admin', 'raw', 'ls /data -l', '206,207', '2018-12-05 05:35:30.446559');
INSERT INTO `log_ansible_model` VALUES (10, 'admin', 'raw', 'ls /data -l', '207', '2018-12-05 05:35:53.772215');
INSERT INTO `log_ansible_model` VALUES (11, 'admin', 'script', '/tmp/fast_script_20181206163137', '172.16.50.222,172.16.50.215', '2018-12-06 08:32:12.110366');
INSERT INTO `log_ansible_model` VALUES (12, 'admin', 'ping', '', '208,207', '2018-12-10 10:52:17.373087');
INSERT INTO `log_ansible_model` VALUES (13, 'admin', 'ping', '', '208,207', '2018-12-10 10:52:54.749418');
INSERT INTO `log_ansible_model` VALUES (14, 'admin', 'script', '/tmp/fast_script_20181210185328', '172.16.50.223,172.16.50.222', '2018-12-10 10:53:59.756724');
INSERT INTO `log_ansible_model` VALUES (15, 'admin', 'ping', '', '208,207', '2018-12-19 03:51:22.288630');
INSERT INTO `log_ansible_model` VALUES (16, 'admin', 'ping', '', '177', '2018-12-21 02:47:08.574557');
INSERT INTO `log_ansible_model` VALUES (17, 'admin', 'script', '/tmp/fast_script_20181221104720', '172.16.50.59', '2018-12-21 02:47:47.243828');
INSERT INTO `log_ansible_model` VALUES (18, 'admin', 'script', '/tmp/fast_script_20181221104720', '172.16.50.223,172.16.50.222', '2018-12-21 02:48:28.034945');
INSERT INTO `log_ansible_model` VALUES (19, 'admin', 'script', '/tmp/fast_script_20181221104720', '172.16.50.223,172.16.50.222', '2018-12-21 02:48:46.213488');
INSERT INTO `log_ansible_model` VALUES (20, 'admin', 'script', '/tmp/fast_script_20181221104720', '172.16.50.223,172.16.50.222', '2018-12-21 02:49:37.669042');
INSERT INTO `log_ansible_model` VALUES (21, 'admin', 'script', '/tmp/fast_script_20181221112801', '172.16.50.220', '2018-12-21 03:28:26.368118');
INSERT INTO `log_ansible_model` VALUES (22, 'admin', 'ping', '', '207,208', '2018-12-21 03:30:05.492278');
INSERT INTO `log_ansible_model` VALUES (23, 'admin', 'script', '/tmp/fast_script_20181224115451', '172.16.50.189,172.16.50.180,172.16.50.181', '2018-12-24 03:55:18.819502');
INSERT INTO `log_ansible_model` VALUES (24, 'admin', 'script', '/tmp/fast_script_20181224115451', '172.16.50.189,172.16.50.180,172.16.50.181', '2018-12-24 05:03:38.293333');
INSERT INTO `log_ansible_model` VALUES (25, 'admin', 'script', '/tmp/fast_script_20181224130509', '172.16.50.180,172.16.50.182,172.16.50.183', '2018-12-24 05:05:33.370773');
INSERT INTO `log_ansible_model` VALUES (26, 'admin', 'script', '/tmp/fast_script_20181224150135', '172.16.50.182,172.16.50.183,172.16.50.74', '2018-12-24 07:02:07.442245');
INSERT INTO `log_ansible_model` VALUES (27, 'admin', 'script', '/tmp/fast_script_20181224150135', '172.16.50.182,172.16.50.183,172.16.50.74', '2018-12-24 07:03:00.791794');

-- ----------------------------
-- Table structure for log_ansible_playbook
-- ----------------------------
DROP TABLE IF EXISTS `log_ansible_playbook`;
CREATE TABLE `log_ansible_playbook`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ans_id` int(11) DEFAULT NULL,
  `ans_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans_content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans_host` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_ansible_playbook
-- ----------------------------
INSERT INTO `log_ansible_playbook` VALUES (1, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.223', '2018-12-05 10:08:25.753242');
INSERT INTO `log_ansible_playbook` VALUES (2, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.223', '2018-12-05 10:28:54.531405');
INSERT INTO `log_ansible_playbook` VALUES (3, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.223', '2018-12-05 10:29:37.469591');
INSERT INTO `log_ansible_playbook` VALUES (4, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.223', '2018-12-05 10:29:41.225967');
INSERT INTO `log_ansible_playbook` VALUES (5, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.223', '2018-12-05 10:29:51.955120');
INSERT INTO `log_ansible_playbook` VALUES (6, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.223', '2018-12-05 10:34:50.971770');
INSERT INTO `log_ansible_playbook` VALUES (7, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.223', '2018-12-05 10:35:21.239526');
INSERT INTO `log_ansible_playbook` VALUES (8, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 10:41:58.277529');
INSERT INTO `log_ansible_playbook` VALUES (9, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 10:44:18.103535');
INSERT INTO `log_ansible_playbook` VALUES (10, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 10:45:38.253062');
INSERT INTO `log_ansible_playbook` VALUES (11, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 10:48:33.793243');
INSERT INTO `log_ansible_playbook` VALUES (12, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 10:56:36.186745');
INSERT INTO `log_ansible_playbook` VALUES (13, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:00:42.404795');
INSERT INTO `log_ansible_playbook` VALUES (14, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:05:14.648494');
INSERT INTO `log_ansible_playbook` VALUES (15, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.220', '2018-12-05 11:07:08.129525');
INSERT INTO `log_ansible_playbook` VALUES (16, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:18:17.597799');
INSERT INTO `log_ansible_playbook` VALUES (17, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-05 11:20:31.214940');
INSERT INTO `log_ansible_playbook` VALUES (18, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:21:36.705022');
INSERT INTO `log_ansible_playbook` VALUES (19, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.222,172.16.50.215', '2018-12-05 11:27:47.131175');
INSERT INTO `log_ansible_playbook` VALUES (20, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:31:58.679079');
INSERT INTO `log_ansible_playbook` VALUES (21, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:31:58.696398');
INSERT INTO `log_ansible_playbook` VALUES (22, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:31:58.710614');
INSERT INTO `log_ansible_playbook` VALUES (23, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:37:56.956794');
INSERT INTO `log_ansible_playbook` VALUES (24, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:41:44.046237');
INSERT INTO `log_ansible_playbook` VALUES (25, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:43:07.714715');
INSERT INTO `log_ansible_playbook` VALUES (26, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:44:27.756995');
INSERT INTO `log_ansible_playbook` VALUES (27, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:46:30.158562');
INSERT INTO `log_ansible_playbook` VALUES (28, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:50:37.479243');
INSERT INTO `log_ansible_playbook` VALUES (29, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-05 11:51:56.056976');
INSERT INTO `log_ansible_playbook` VALUES (30, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-06 07:23:16.015883');
INSERT INTO `log_ansible_playbook` VALUES (31, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.215', '2018-12-06 07:24:23.299884');
INSERT INTO `log_ansible_playbook` VALUES (32, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-06 07:31:15.123516');
INSERT INTO `log_ansible_playbook` VALUES (33, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-06 07:32:57.097956');
INSERT INTO `log_ansible_playbook` VALUES (34, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-06 07:34:45.769090');
INSERT INTO `log_ansible_playbook` VALUES (35, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-06 07:35:42.658764');
INSERT INTO `log_ansible_playbook` VALUES (36, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-06 07:36:03.358276');
INSERT INTO `log_ansible_playbook` VALUES (37, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-06 07:37:31.354364');
INSERT INTO `log_ansible_playbook` VALUES (38, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-06 07:38:08.890288');
INSERT INTO `log_ansible_playbook` VALUES (39, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.230,172.16.50.215', '2018-12-06 07:38:52.657255');
INSERT INTO `log_ansible_playbook` VALUES (40, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.223,172.16.50.222', '2018-12-19 02:29:45.834300');
INSERT INTO `log_ansible_playbook` VALUES (41, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '172.16.50.222', '2018-12-19 02:35:35.475389');
INSERT INTO `log_ansible_playbook` VALUES (42, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 08:06:20.796768');
INSERT INTO `log_ansible_playbook` VALUES (43, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 08:10:49.625521');
INSERT INTO `log_ansible_playbook` VALUES (44, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 08:20:58.322956');
INSERT INTO `log_ansible_playbook` VALUES (45, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 09:07:26.009002');
INSERT INTO `log_ansible_playbook` VALUES (46, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 09:09:37.939164');
INSERT INTO `log_ansible_playbook` VALUES (47, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 09:11:39.644503');
INSERT INTO `log_ansible_playbook` VALUES (48, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 09:12:56.239157');
INSERT INTO `log_ansible_playbook` VALUES (49, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 09:42:01.110259');
INSERT INTO `log_ansible_playbook` VALUES (50, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 09:42:53.883575');
INSERT INTO `log_ansible_playbook` VALUES (51, 1, 'admin', 'copy_file_between_remote.yaml', '执行文件分发', '10.0.8.77', '2018-12-27 09:51:19.290059');
INSERT INTO `log_ansible_playbook` VALUES (52, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:11:02.166034');
INSERT INTO `log_ansible_playbook` VALUES (53, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:34:38.826597');
INSERT INTO `log_ansible_playbook` VALUES (54, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:40:00.826269');
INSERT INTO `log_ansible_playbook` VALUES (55, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:40:16.075051');
INSERT INTO `log_ansible_playbook` VALUES (56, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:40:30.770585');
INSERT INTO `log_ansible_playbook` VALUES (57, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:40:58.215575');
INSERT INTO `log_ansible_playbook` VALUES (58, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:41:18.247261');
INSERT INTO `log_ansible_playbook` VALUES (59, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:42:03.170760');
INSERT INTO `log_ansible_playbook` VALUES (60, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:50:21.494217');
INSERT INTO `log_ansible_playbook` VALUES (61, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:52:32.694351');
INSERT INTO `log_ansible_playbook` VALUES (62, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:54:02.058864');
INSERT INTO `log_ansible_playbook` VALUES (63, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 09:58:07.702362');
INSERT INTO `log_ansible_playbook` VALUES (64, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 10:05:24.490254');
INSERT INTO `log_ansible_playbook` VALUES (65, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 10:13:13.554300');
INSERT INTO `log_ansible_playbook` VALUES (66, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 10:17:27.996338');
INSERT INTO `log_ansible_playbook` VALUES (67, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 10:19:25.257225');
INSERT INTO `log_ansible_playbook` VALUES (68, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 10:23:24.767494');
INSERT INTO `log_ansible_playbook` VALUES (69, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 10:26:26.053817');
INSERT INTO `log_ansible_playbook` VALUES (70, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 10:30:40.515897');
INSERT INTO `log_ansible_playbook` VALUES (71, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 10:41:53.439714');
INSERT INTO `log_ansible_playbook` VALUES (72, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-22 11:29:38.163065');
INSERT INTO `log_ansible_playbook` VALUES (73, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 06:18:38.943755');
INSERT INTO `log_ansible_playbook` VALUES (74, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 06:44:19.844333');
INSERT INTO `log_ansible_playbook` VALUES (75, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 06:46:21.744700');
INSERT INTO `log_ansible_playbook` VALUES (76, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 08:28:44.499393');
INSERT INTO `log_ansible_playbook` VALUES (77, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 08:30:10.381228');
INSERT INTO `log_ansible_playbook` VALUES (78, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 08:37:37.997763');
INSERT INTO `log_ansible_playbook` VALUES (79, 1, 'admin', 'mysql5_7_soft_install.yaml', '执行文件分发', '172.16.50.214', '2019-01-23 09:22:28.884799');
INSERT INTO `log_ansible_playbook` VALUES (80, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 09:57:20.409704');
INSERT INTO `log_ansible_playbook` VALUES (81, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:03:33.607553');
INSERT INTO `log_ansible_playbook` VALUES (82, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:06:51.760736');
INSERT INTO `log_ansible_playbook` VALUES (83, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:11:27.286206');
INSERT INTO `log_ansible_playbook` VALUES (84, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.214', '2019-01-23 10:14:19.023204');
INSERT INTO `log_ansible_playbook` VALUES (85, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:28:37.549290');
INSERT INTO `log_ansible_playbook` VALUES (86, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:33:15.400901');
INSERT INTO `log_ansible_playbook` VALUES (87, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:35:44.533427');
INSERT INTO `log_ansible_playbook` VALUES (88, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:36:34.606001');
INSERT INTO `log_ansible_playbook` VALUES (89, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:40:54.864466');
INSERT INTO `log_ansible_playbook` VALUES (90, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:45:20.451762');
INSERT INTO `log_ansible_playbook` VALUES (91, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:51:07.353367');
INSERT INTO `log_ansible_playbook` VALUES (92, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:53:27.011587');
INSERT INTO `log_ansible_playbook` VALUES (93, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 10:59:38.310327');
INSERT INTO `log_ansible_playbook` VALUES (94, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 11:02:13.438028');
INSERT INTO `log_ansible_playbook` VALUES (95, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 11:05:20.533017');
INSERT INTO `log_ansible_playbook` VALUES (96, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 11:29:40.203758');
INSERT INTO `log_ansible_playbook` VALUES (97, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 11:35:44.422993');
INSERT INTO `log_ansible_playbook` VALUES (98, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 11:40:33.656851');
INSERT INTO `log_ansible_playbook` VALUES (99, 1, 'admin', 'mysql8_0_soft_install.yaml', '执行文件分发', '172.16.50.213', '2019-01-23 11:41:22.528728');

-- ----------------------------
-- Table structure for log_project_config
-- ----------------------------
DROP TABLE IF EXISTS `log_project_config`;
CREATE TABLE `log_project_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `project_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_branch` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mysql_cluster
-- ----------------------------
DROP TABLE IF EXISTS `mysql_cluster`;
CREATE TABLE `mysql_cluster`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arch` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_version` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `tree_id_id` int(11) DEFAULT NULL,
  `foreign_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `down_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `up_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foreign_port` int(11) DEFAULT NULL,
  `plat_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plat_user_pass` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pooled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `MySQL_Cluster_operator_id_3d5c4fce_fk_auth_user_id`(`operator_id`) USING BTREE,
  INDEX `MySQL_Cluster_tree_id_id_5787aaa2_fk_yewuTreeMptt_id`(`tree_id_id`) USING BTREE,
  CONSTRAINT `MySQL_Cluster_operator_id_3d5c4fce_fk_auth_user_id` FOREIGN KEY (`operator_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `MySQL_Cluster_tree_id_id_5787aaa2_fk_yewuTreeMptt_id` FOREIGN KEY (`tree_id_id`) REFERENCES `yewutreemptt` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mysql_cluster
-- ----------------------------
INSERT INTO `mysql_cluster` VALUES (11, '大数据灾难测试', '主从', '', NULL, NULL, 68, '172.16.50.64', NULL, '使用中', '2018-10-12', NULL, 3306, 'dba', 'NTg1Z@mYxZjdhZ', 1);
INSERT INTO `mysql_cluster` VALUES (12, '汽车生产金融3330', 'innodb_cluster', '8.0.12', '', NULL, NULL, '10.0.41.60', '', '', '', '', 3330, 'dba', 'NTg1Z@mYxZjdhZ', 0);
INSERT INTO `mysql_cluster` VALUES (13, '汽车金融3320', 'innodb_cluster', '8.0.12', '', NULL, NULL, '10.0.41.58', '', '服务中', '', '', 3320, 'dba', 'NTg1Z@mYxZjdhZ', 0);
INSERT INTO `mysql_cluster` VALUES (14, '瑞博恩租赁', '主从', '', NULL, NULL, NULL, '10.0.40.146', '', '', '', NULL, 3306, 'dba', 'NTg1Z@mYxZjdhZ', 0);
INSERT INTO `mysql_cluster` VALUES (15, '测试db', '单库', '5.7.20', NULL, NULL, NULL, '172.16.50.220', '', '服务中', '', NULL, 3306, 'dbops', 'dbops', 0);
INSERT INTO `mysql_cluster` VALUES (16, '大数据uat50.52', '主从', '5.7.20', NULL, NULL, NULL, '172.16.50.56', '', '', '', NULL, 3306, 'dba', 'NTg1Z@mYxZjdhZ', 0);

-- ----------------------------
-- Table structure for mysql_db
-- ----------------------------
DROP TABLE IF EXISTS `mysql_db`;
CREATE TABLE `mysql_db`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `db_size` double DEFAULT NULL,
  `dbcluster_id` int(11) DEFAULT NULL,
  `memo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_rows` int(11) DEFAULT NULL,
  `index_size` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `MySQL_DB_dbcluster_id_f91aca96_fk_MySQL_Cluster_id`(`dbcluster_id`) USING BTREE,
  CONSTRAINT `MySQL_DB_dbcluster_id_f91aca96_fk_MySQL_Cluster_id` FOREIGN KEY (`dbcluster_id`) REFERENCES `mysql_cluster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mysql_db
-- ----------------------------
INSERT INTO `mysql_db` VALUES (33, 'ambari', 130.68, 11, NULL, 17913, 4.12);
INSERT INTO `mysql_db` VALUES (35, 'ranger', 7.33, 11, NULL, 40829, 10.46);
INSERT INTO `mysql_db` VALUES (37, 'hive', 1.26, 11, NULL, 7810, 0.93);
INSERT INTO `mysql_db` VALUES (38, 'commondb', 82.56, 12, NULL, 271342, 0);
INSERT INTO `mysql_db` VALUES (39, 'paydb', 23.75, 12, NULL, 147483, 0.05);
INSERT INTO `mysql_db` VALUES (40, 'coopartnerdb', 5.14, 12, '不知道干啥的', 13112, 0.01);
INSERT INTO `mysql_db` VALUES (41, 'organizationdb', 4.47, 12, NULL, 20982, 0.01);
INSERT INTO `mysql_db` VALUES (42, 'notifydb', 1.24, 12, NULL, 3509, 0.23);
INSERT INTO `mysql_db` VALUES (43, 'fumindb', 0.19, 12, NULL, 1114, 0);
INSERT INTO `mysql_db` VALUES (44, 'mysql_innodb_cluster_metadata', 0.05, 12, NULL, 5, 0.11);
INSERT INTO `mysql_db` VALUES (45, 'expuser_hdp', 0, 12, NULL, 0, 0);
INSERT INTO `mysql_db` VALUES (46, 'contractdb', 44.88, 13, NULL, 168052, 1.46);
INSERT INTO `mysql_db` VALUES (47, 'accountingdb', 1.2, 13, NULL, 4517, 0.01);
INSERT INTO `mysql_db` VALUES (48, 'mysql_innodb_cluster_metadata', 0.05, 13, NULL, 8, 0.11);
INSERT INTO `mysql_db` VALUES (49, 'expuser_hdp', 0, 13, NULL, 0, 0);
INSERT INTO `mysql_db` VALUES (50, 'zl_rbn', 12.19, 14, NULL, 34953, 1.46);
INSERT INTO `mysql_db` VALUES (51, 'expuser_hdp', NULL, 14, NULL, NULL, NULL);
INSERT INTO `mysql_db` VALUES (52, 'test', 3.34, 15, NULL, 10732, 0.7);
INSERT INTO `mysql_db` VALUES (53, 'dbops', 0.83, 15, NULL, 1172, 1.29);
INSERT INTO `mysql_db` VALUES (54, 'dbplat', 0.48, 15, NULL, 579, 0.83);
INSERT INTO `mysql_db` VALUES (55, 'qw_cmdb', 0.36, 15, NULL, 657, 0.42);
INSERT INTO `mysql_db` VALUES (56, 'imoocc', 0.37, 15, NULL, 672, 0.27);
INSERT INTO `mysql_db` VALUES (57, 'baseplat', 0.26, 15, NULL, 138, 0.52);
INSERT INTO `mysql_db` VALUES (58, 'ewp_oms', 0.25, 15, NULL, 133, 0.46);
INSERT INTO `mysql_db` VALUES (59, 'adminset', 0.23, 15, NULL, 106, 0.26);
INSERT INTO `mysql_db` VALUES (60, 'archer', 0.12, 15, NULL, 52, 0.17);
INSERT INTO `mysql_db` VALUES (61, 'backup', 0.15, 15, NULL, 527, 0.01);
INSERT INTO `mysql_db` VALUES (62, 'sqlupline', 0.08, 15, NULL, 9, 0.14);
INSERT INTO `mysql_db` VALUES (63, 'glpi', 0.05, 15, NULL, 1434, 0.26);
INSERT INTO `mysql_db` VALUES (64, 'hive', 118.1, 16, NULL, 1065480, 56.63);
INSERT INTO `mysql_db` VALUES (65, 'ambari', 80.29, 16, NULL, 9104, 2.54);
INSERT INTO `mysql_db` VALUES (66, 'ranger', 7.42, 16, NULL, 49414, 10.46);

-- ----------------------------
-- Table structure for mysql_instance
-- ----------------------------
DROP TABLE IF EXISTS `mysql_instance`;
CREATE TABLE `mysql_instance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbtag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vist_ip` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_ip` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_ip` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `master_port` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idc` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memory` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dbcluster_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `MySQL_Instance_m_ip_port_f6799cd7_uniq`(`m_ip`, `port`) USING BTREE,
  INDEX `MySQL_Instance_dbcluster_id_c5cb6ed3_fk_MySQL_Cluster_id`(`dbcluster_id`) USING BTREE,
  CONSTRAINT `MySQL_Instance_dbcluster_id_c5cb6ed3_fk_MySQL_Cluster_id` FOREIGN KEY (`dbcluster_id`) REFERENCES `mysql_cluster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mysql_instance
-- ----------------------------
INSERT INTO `mysql_instance` VALUES (7, '', NULL, '172.16.50.59', '3306', '172.16.50.60', '3306', NULL, '从库', NULL, NULL, NULL, NULL, 11);
INSERT INTO `mysql_instance` VALUES (9, '', '172.16.50.64', '172.16.50.60', '3306', NULL, NULL, NULL, '主库', '服务中', NULL, NULL, NULL, 11);
INSERT INTO `mysql_instance` VALUES (10, '', '10.0.41.52', '10.0.41.52', '3320', '10.0.41.54', '3320', NULL, '从库', '服务中', NULL, NULL, NULL, 13);
INSERT INTO `mysql_instance` VALUES (11, '', '10.0.41.54', '10.0.41.54', '3320', NULL, NULL, NULL, '主库', '服务中', NULL, NULL, NULL, 13);
INSERT INTO `mysql_instance` VALUES (12, '虚拟实例ssd', '10.0.41.53', '10.0.41.53', '3320', '10.0.41.54', '3320', NULL, '从库', '服务中', NULL, NULL, NULL, 13);
INSERT INTO `mysql_instance` VALUES (13, '', '10.0.41.52', '10.0.41.52', '3330', NULL, NULL, NULL, '主库', '服务中', NULL, NULL, NULL, 12);
INSERT INTO `mysql_instance` VALUES (14, '', '10.0.41.54', '10.0.41.54', '3330', '10.0.41.52', '3330', NULL, '从库', '服务中', NULL, NULL, NULL, 12);
INSERT INTO `mysql_instance` VALUES (15, '', '10.0.41.53', '10.0.41.53', '3330', '10.0.41.52', '3330', NULL, '从库', '服务中', NULL, NULL, NULL, 12);
INSERT INTO `mysql_instance` VALUES (16, '', NULL, '10.0.40.144', '3306', '10.0.40.145', '3306', NULL, '从库', NULL, NULL, NULL, NULL, 14);
INSERT INTO `mysql_instance` VALUES (17, '', '10.0.40.146', '10.0.40.145', '3306', NULL, NULL, NULL, '主库', '服务中', NULL, NULL, NULL, 14);
INSERT INTO `mysql_instance` VALUES (18, '', '172.16.50.220', '172.16.50.220', '3306', NULL, NULL, NULL, '单库', '服务中', NULL, NULL, NULL, 15);
INSERT INTO `mysql_instance` VALUES (19, '', NULL, '172.16.50.51', '3306', '172.16.50.52', '3306', NULL, '从库', NULL, NULL, NULL, NULL, 16);
INSERT INTO `mysql_instance` VALUES (20, '', '172.16.50.56', '172.16.50.52', '3306', NULL, NULL, NULL, '主库', '服务中', NULL, NULL, NULL, 16);

-- ----------------------------
-- Table structure for mysql_user
-- ----------------------------
DROP TABLE IF EXISTS `mysql_user`;
CREATE TABLE `mysql_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privlige` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dbcluster_id` int(11) DEFAULT NULL,
  `db_host` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `MySQL_User_dbcluster_id_b3ab6229_fk_MySQL_Cluster_id`(`dbcluster_id`) USING BTREE,
  CONSTRAINT `MySQL_User_dbcluster_id_b3ab6229_fk_MySQL_Cluster_id` FOREIGN KEY (`dbcluster_id`) REFERENCES `mysql_cluster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mysql_user
-- ----------------------------
INSERT INTO `mysql_user` VALUES (71, 'ambari', NULL, 'GRANT USAGE ON *.* TO \'ambari\'@\'127.0.0.1\' ;  GRANT ALL PRIVILEGES ON `ambari`.* TO \'ambari\'@\'127.0.0.1\' ;  ', 11, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (73, 'hive', NULL, 'GRANT USAGE ON *.* TO \'hive\'@\'127.0.0.1\' ;  GRANT ALL PRIVILEGES ON `hive`.* TO \'hive\'@\'127.0.0.1\' ;  ', 11, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (75, 'ranger1', NULL, 'GRANT USAGE ON *.* TO \'ranger1\'@\'127.0.0.1\' ;  GRANT ALL PRIVILEGES ON `ranger`.* TO \'ranger1\'@\'127.0.0.1\' ;  ', 11, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (77, 'ambari', NULL, 'GRANT USAGE ON *.* TO \'ambari\'@\'172.16.50.%\' ;  GRANT ALL PRIVILEGES ON `ambari`.* TO \'ambari\'@\'172.16.50.%\' ;  ', 11, '172.16.50.%', NULL);
INSERT INTO `mysql_user` VALUES (79, 'hive', NULL, 'GRANT USAGE ON *.* TO \'hive\'@\'172.16.50.%\' ;  GRANT ALL PRIVILEGES ON `hive`.* TO \'hive\'@\'172.16.50.%\' ;  ', 11, '172.16.50.%', NULL);
INSERT INTO `mysql_user` VALUES (81, 'ranger1', NULL, 'GRANT USAGE ON *.* TO \'ranger1\'@\'172.16.50.%\' ;  GRANT ALL PRIVILEGES ON `ranger`.* TO \'ranger1\'@\'172.16.50.%\' ;  ', 11, '172.16.50.%', NULL);
INSERT INTO `mysql_user` VALUES (82, 'expuser_hdp', NULL, 'GRANT SELECT, SHOW VIEW ON *.* TO `expuser_hdp`@`%` ;  GRANT CREATE VIEW ON `expuser_hdp`.* TO `expuser_hdp`@`%` ;  ', 12, '%', NULL);
INSERT INTO `mysql_user` VALUES (83, 'commondb_d', NULL, 'GRANT USAGE ON *.* TO `commondb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `commondb`.* TO `commondb_d`@`10.0.41.%` ;  ', 12, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (84, 'coopartnerdb_d', NULL, 'GRANT USAGE ON *.* TO `coopartnerdb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `coopartnerdb`.* TO `coopartnerdb_d`@`10.0.41.%` ;  ', 12, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (85, 'fumindb_d', NULL, 'GRANT USAGE ON *.* TO `fumindb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `fumindb`.* TO `fumindb_d`@`10.0.41.%` ;  ', 12, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (86, 'notifydb_d', NULL, 'GRANT USAGE ON *.* TO `notifydb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `notifydb`.* TO `notifydb_d`@`10.0.41.%` ;  ', 12, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (87, 'organizationdb_d', 'organizationdb_prod_32qw', 'GRANT USAGE ON *.* TO `organizationdb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `organizationdb`.* TO `organizationdb_d`@`10.0.41.%` ;  ', 12, '10.0.41.%', '不知道干啥的');
INSERT INTO `mysql_user` VALUES (88, 'paydb_d', NULL, 'GRANT USAGE ON *.* TO `paydb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `paydb`.* TO `paydb_d`@`10.0.41.%` ;  ', 12, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (89, 'securitydb_d', 'securitydb_prod_asidfa', 'GRANT USAGE ON *.* TO `securitydb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `securitydb`.* TO `securitydb_d`@`10.0.41.%` ;  ', 12, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (90, 'sql_upline', 'Up_123456_sqlonline', 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `sql_upline`@`10.0.41.%` ;  GRANT BACKUP_ADMIN,BINLOG_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SET_USER_ID,SYSTEM_VARIABLES_ADMIN,XA_RECOVER_ADMIN ON *.* TO `sql_upline`@`10.0.41.%` ;  ', 12, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (91, 'vfc_reader', NULL, 'GRANT SELECT ON *.* TO `vfc_reader`@`10.0.41.%` ;  ', 12, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (92, 'commondb_d', NULL, 'GRANT USAGE ON *.* TO `commondb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `commondb`.* TO `commondb_d`@`10.0.61.%` ;  ', 12, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (93, 'coopartnerdb_d', NULL, 'GRANT USAGE ON *.* TO `coopartnerdb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `coopartnerdb`.* TO `coopartnerdb_d`@`10.0.61.%` ;  ', 12, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (94, 'notifydb_d', NULL, 'GRANT USAGE ON *.* TO `notifydb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `notifydb`.* TO `notifydb_d`@`10.0.61.%` ;  ', 12, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (95, 'organizationdb_d', NULL, 'GRANT USAGE ON *.* TO `organizationdb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `organizationdb`.* TO `organizationdb_d`@`10.0.61.%` ;  ', 12, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (96, 'paydb_d', NULL, 'GRANT USAGE ON *.* TO `paydb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `paydb`.* TO `paydb_d`@`10.0.61.%` ;  ', 12, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (97, 'securitydb_d', NULL, 'GRANT USAGE ON *.* TO `securitydb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `securitydb`.* TO `securitydb_d`@`10.0.61.%` ;  ', 12, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (98, 'sql_upline', NULL, 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `sql_upline`@`10.0.8.73` ;  GRANT BACKUP_ADMIN,BINLOG_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SET_USER_ID,SYSTEM_VARIABLES_ADMIN,XA_RECOVER_ADMIN ON *.* TO `sql_upline`@`10.0.8.73` ;  ', 12, '10.0.8.73', NULL);
INSERT INTO `mysql_user` VALUES (99, 'sql_upline', NULL, 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `sql_upline`@`10.0.8.74` ;  GRANT BACKUP_ADMIN,BINLOG_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SET_USER_ID,SYSTEM_VARIABLES_ADMIN,XA_RECOVER_ADMIN ON *.* TO `sql_upline`@`10.0.8.74` ;  ', 12, '10.0.8.74', NULL);
INSERT INTO `mysql_user` VALUES (100, 'fumindb_d', NULL, 'GRANT USAGE ON *.* TO `fumindb_d`@`172.16.%.%` ;  GRANT ALL PRIVILEGES ON `fumindb`.* TO `fumindb_d`@`172.16.%.%` ;  ', 12, '172.16.%.%', NULL);
INSERT INTO `mysql_user` VALUES (101, 'vfc_reader', NULL, 'GRANT SELECT ON *.* TO `vfc_reader`@`172.16.%.%` ;  GRANT SELECT ON `fumindb`.* TO `vfc_reader`@`172.16.%.%` ;  ', 12, '172.16.%.%', NULL);
INSERT INTO `mysql_user` VALUES (102, 'fumindb_d', NULL, 'GRANT USAGE ON *.* TO `fumindb_d`@`192.168.10.%` ;  GRANT ALL PRIVILEGES ON `fumindb`.* TO `fumindb_d`@`192.168.10.%` ;  ', 12, '192.168.10.%', NULL);
INSERT INTO `mysql_user` VALUES (103, 'vfc_reader', NULL, 'GRANT SELECT ON *.* TO `vfc_reader`@`192.168.10.%` ;  ', 12, '192.168.10.%', NULL);
INSERT INTO `mysql_user` VALUES (104, 'expuser_hdp', NULL, 'GRANT SELECT, SHOW VIEW ON *.* TO `expuser_hdp`@`%` ;  GRANT CREATE VIEW ON `expuser_hdp`.* TO `expuser_hdp`@`%` ;  ', 13, '%', NULL);
INSERT INTO `mysql_user` VALUES (105, 'accountingdb_d', NULL, 'GRANT USAGE ON *.* TO `accountingdb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `accountingdb`.* TO `accountingdb_d`@`10.0.41.%` ;  ', 13, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (106, 'contractdb_d', NULL, 'GRANT USAGE ON *.* TO `contractdb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `contractdb`.* TO `contractdb_d`@`10.0.41.%` ;  ', 13, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (107, 'receiptpaydb_d', NULL, 'GRANT USAGE ON *.* TO `receiptpaydb_d`@`10.0.41.%` ;  GRANT ALL PRIVILEGES ON `receiptpaydb`.* TO `receiptpaydb_d`@`10.0.41.%` ;  ', 13, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (108, 'sql_upline', NULL, 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `sql_upline`@`10.0.41.%` ;  GRANT BACKUP_ADMIN,BINLOG_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SET_USER_ID,SYSTEM_VARIABLES_ADMIN,XA_RECOVER_ADMIN ON *.* TO `sql_upline`@`10.0.41.%` ;  ', 13, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (109, 'vfc_reader', NULL, 'GRANT SELECT ON *.* TO `vfc_reader`@`10.0.41.%` ;  ', 13, '10.0.41.%', NULL);
INSERT INTO `mysql_user` VALUES (110, 'accountingdb_d', NULL, 'GRANT USAGE ON *.* TO `accountingdb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `accountingdb`.* TO `accountingdb_d`@`10.0.61.%` ;  ', 13, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (111, 'contractdb_d', NULL, 'GRANT USAGE ON *.* TO `contractdb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `contractdb`.* TO `contractdb_d`@`10.0.61.%` ;  ', 13, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (112, 'receiptpaydb_d', NULL, 'GRANT USAGE ON *.* TO `receiptpaydb_d`@`10.0.61.%` ;  GRANT ALL PRIVILEGES ON `receiptpaydb`.* TO `receiptpaydb_d`@`10.0.61.%` ;  ', 13, '10.0.61.%', NULL);
INSERT INTO `mysql_user` VALUES (113, 'sql_upline', NULL, 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `sql_upline`@`10.0.8.73` ;  GRANT BACKUP_ADMIN,BINLOG_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SET_USER_ID,SYSTEM_VARIABLES_ADMIN,XA_RECOVER_ADMIN ON *.* TO `sql_upline`@`10.0.8.73` ;  ', 13, '10.0.8.73', NULL);
INSERT INTO `mysql_user` VALUES (114, 'sql_upline', NULL, 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `sql_upline`@`10.0.8.74` ;  GRANT BACKUP_ADMIN,BINLOG_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SET_USER_ID,SYSTEM_VARIABLES_ADMIN,XA_RECOVER_ADMIN ON *.* TO `sql_upline`@`10.0.8.74` ;  ', 13, '10.0.8.74', NULL);
INSERT INTO `mysql_user` VALUES (115, 'vfc_reader', NULL, 'GRANT SELECT ON *.* TO `vfc_reader`@`172.16.%.%` ;  ', 13, '172.16.%.%', NULL);
INSERT INTO `mysql_user` VALUES (116, 'vfc_reader', NULL, 'GRANT SELECT ON *.* TO `vfc_reader`@`192.168.10.%` ;  ', 13, '192.168.10.%', NULL);
INSERT INTO `mysql_user` VALUES (117, 'expuser_hdp', NULL, 'GRANT USAGE ON *.* TO \'expuser_hdp\'@\'%\' ;  GRANT SELECT, CREATE VIEW, SHOW VIEW ON `expuser_hdp`.* TO \'expuser_hdp\'@\'%\' ;  GRANT SELECT ON `zl_rbn`.* TO \'expuser_hdp\'@\'%\' ;  ', 14, '%', NULL);
INSERT INTO `mysql_user` VALUES (118, 'zl_rbn_user', NULL, 'GRANT USAGE ON *.* TO \'zl_rbn_user\'@\'10.0.56.%\' ;  GRANT ALL PRIVILEGES ON `zl_rbn`.* TO \'zl_rbn_user\'@\'10.0.56.%\' ;  ', 14, '10.0.56.%', NULL);
INSERT INTO `mysql_user` VALUES (119, 'sql_upline', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'sql_upline\'@\'10.0.8.73\' ;  GRANT ALL PRIVILEGES ON `zl_rbn`.* TO \'sql_upline\'@\'10.0.8.73\' ;  ', 14, '10.0.8.73', NULL);
INSERT INTO `mysql_user` VALUES (120, 'sql_upline', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'sql_upline\'@\'10.0.8.74\' ;  GRANT ALL PRIVILEGES ON `zl_rbn`.* TO \'sql_upline\'@\'10.0.8.74\' ;  ', 14, '10.0.8.74', NULL);
INSERT INTO `mysql_user` VALUES (121, 'zl_rbn_read', NULL, 'GRANT USAGE ON *.* TO \'zl_rbn_read\'@\'172.16.%.%\' ;  GRANT SELECT ON `zl_rbn`.* TO \'zl_rbn_read\'@\'172.16.%.%\' ;  ', 14, '172.16.%.%', NULL);
INSERT INTO `mysql_user` VALUES (122, 'chunlv_read', NULL, 'GRANT USAGE ON *.* TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.* TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`contract_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`rebate_borrowandrepay_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`customer_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`examine_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`clearing_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`rights_loan_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`evaluation` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`bond_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`order_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`cx_compensatory` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`stc_video` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`transaction_flow` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`bondrecord_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`cx_repayment` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`sys_order_sp` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`evaluation_pic` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`stc_sp` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`cx_recovery` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`financialtransactions_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`collection_repayment_sign` TO \'chunlv_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.`settle_info` TO \'chunlv_read\'@\'192.168.1.%\' ;  ', 14, '192.168.1.%', NULL);
INSERT INTO `mysql_user` VALUES (123, 'zl_rbn_read', NULL, 'GRANT USAGE ON *.* TO \'zl_rbn_read\'@\'192.168.1.%\' ;  GRANT SELECT ON `zl_rbn`.* TO \'zl_rbn_read\'@\'192.168.1.%\' ;  ', 14, '192.168.1.%', NULL);
INSERT INTO `mysql_user` VALUES (124, 'chunlv_read', NULL, 'GRANT USAGE ON *.* TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.* TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`bond_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`customer_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`settle_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`rights_loan_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`contract_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`bondrecord_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`cx_repayment` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`stc_sp` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`evaluation_pic` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`order_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`transaction_flow` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`collection_repayment_sign` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`rebate_borrowandrepay_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`sys_order_sp` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`clearing_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`financialtransactions_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`stc_video` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`cx_recovery` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`examine_info` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`evaluation` TO \'chunlv_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.`cx_compensatory` TO \'chunlv_read\'@\'192.168.10.%\' ;  ', 14, '192.168.10.%', NULL);
INSERT INTO `mysql_user` VALUES (125, 'zl_rbn_read', NULL, 'GRANT USAGE ON *.* TO \'zl_rbn_read\'@\'192.168.10.%\' ;  GRANT SELECT ON `zl_rbn`.* TO \'zl_rbn_read\'@\'192.168.10.%\' ;  ', 14, '192.168.10.%', NULL);
INSERT INTO `mysql_user` VALUES (126, 'adminset', NULL, 'GRANT USAGE ON *.* TO \'adminset\'@\'%\' IDENTIFIED BY PASSWORD \'*47F524C63D9333B3500031048C720088C162207C\' ;  GRANT ALL PRIVILEGES ON `adminset`.* TO \'adminset\'@\'%\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (127, 'archer_rw', NULL, 'GRANT USAGE ON *.* TO \'archer_rw\'@\'%\' IDENTIFIED BY PASSWORD \'*58C728145503AF4192DFE9D67530DB68B204822A\' ;  GRANT ALL PRIVILEGES ON `archer`.* TO \'archer_rw\'@\'%\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (128, 'baseplat', NULL, 'GRANT USAGE ON *.* TO \'baseplat\'@\'%\' IDENTIFIED BY PASSWORD \'*6D405326CC20544B09AF026F42191964C5ECFB53\' ;  GRANT ALL PRIVILEGES ON `baseplat`.* TO \'baseplat\'@\'%\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (129, 'chang', NULL, 'GRANT USAGE ON *.* TO \'chang\'@\'%\' IDENTIFIED BY PASSWORD \'*F05D019BA3BEC01CA9FBD4141E4EA57A28EF3EDF\' ;  GRANT ALL PRIVILEGES ON `dbplat`.* TO \'chang\'@\'%\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (130, 'dbops', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'dbops\'@\'%\' IDENTIFIED BY PASSWORD \'*0FC9EBF267B451C08A5E374D3715FA50D89F536E\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (131, 'ewp_oms', NULL, 'GRANT USAGE ON *.* TO \'ewp_oms\'@\'%\' IDENTIFIED BY PASSWORD \'*060D88AC99171F9E8DFD31573C8CDE03CD861328\' ;  GRANT ALL PRIVILEGES ON `ewp_oms`.* TO \'ewp_oms\'@\'%\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (132, 'glpi', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'glpi\'@\'%\' IDENTIFIED BY PASSWORD \'*64B4BB8F2A8C2F41C639DBC894D2759330199470\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (133, 'imoocc', NULL, 'GRANT USAGE ON *.* TO \'imoocc\'@\'%\' IDENTIFIED BY PASSWORD \'*31B64B9B4212B75C5AAD66B3F3C8842806B3E17C\' ;  GRANT ALL PRIVILEGES ON `imoocc`.* TO \'imoocc\'@\'%\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (134, 'itop', NULL, 'GRANT USAGE ON *.* TO \'itop\'@\'%\' IDENTIFIED BY PASSWORD \'*BAB3E9B8484FDF54D9B14E7465D2CB095FF35654\' ;  GRANT ALL PRIVILEGES ON `itop`.* TO \'itop\'@\'%\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (135, 'sqlupline', NULL, 'GRANT USAGE ON *.* TO \'sqlupline\'@\'%\' IDENTIFIED BY PASSWORD \'*E7C637325E5B0671CB6E0F1C4E339EBAC4F6885A\' ;  GRANT ALL PRIVILEGES ON `sqlupline`.* TO \'sqlupline\'@\'%\' ;  ', 15, '%', NULL);
INSERT INTO `mysql_user` VALUES (136, 'imoocc', NULL, 'GRANT USAGE ON *.* TO \'imoocc\'@\'%.%.%.%\' IDENTIFIED BY PASSWORD \'*31B64B9B4212B75C5AAD66B3F3C8842806B3E17C\' ;  GRANT ALL PRIVILEGES ON `imoocc`.* TO \'imoocc\'@\'%.%.%.%\' ;  ', 15, '%.%.%.%', NULL);
INSERT INTO `mysql_user` VALUES (137, 'db_admin', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'db_admin\'@\'10.%\' IDENTIFIED BY PASSWORD \'*B1FCC000ED41AB071A4CF57513932C8F04FF5A4B\' ;  GRANT ALL PRIVILEGES ON `db_admin`.* TO \'db_admin\'@\'10.%\' ;  ', 15, '10.%', NULL);
INSERT INTO `mysql_user` VALUES (138, 'myadmin', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'myadmin\'@\'10.100.54.%\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' WITH GRANT OPTION ;  ', 15, '10.100.54.%', NULL);
INSERT INTO `mysql_user` VALUES (139, 'db_monitor', NULL, 'GRANT SELECT, PROCESS, SUPER, REPLICATION CLIENT ON *.* TO \'db_monitor\'@\'10.100.54.118\' IDENTIFIED BY PASSWORD \'*77A98177177C512EE0A987B765A56D199108DB99\' ;  ', 15, '10.100.54.118', NULL);
INSERT INTO `mysql_user` VALUES (140, 'myadmin', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'myadmin\'@\'10.110.91.217\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' WITH GRANT OPTION ;  ', 15, '10.110.91.217', NULL);
INSERT INTO `mysql_user` VALUES (141, 'myrepl', NULL, 'GRANT SUPER, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO \'myrepl\'@\'10.116.%\' IDENTIFIED BY PASSWORD \'*56DA56B84274ABF5D5AF89618DA24349C44E472D\' ;  ', 15, '10.116.%', NULL);
INSERT INTO `mysql_user` VALUES (142, 'myadmin', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'myadmin\'@\'10.116.95.21\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' WITH GRANT OPTION ;  ', 15, '10.116.95.21', NULL);
INSERT INTO `mysql_user` VALUES (143, 'db_monitor', NULL, 'GRANT SELECT, PROCESS, REPLICATION CLIENT ON *.* TO \'db_monitor\'@\'10.118.%\' IDENTIFIED BY PASSWORD \'*77A98177177C512EE0A987B765A56D199108DB99\' ;  ', 15, '10.118.%', NULL);
INSERT INTO `mysql_user` VALUES (144, 'myrepl', NULL, 'GRANT SUPER, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO \'myrepl\'@\'10.118.%\' IDENTIFIED BY PASSWORD \'*56DA56B84274ABF5D5AF89618DA24349C44E472D\' ;  ', 15, '10.118.%', NULL);
INSERT INTO `mysql_user` VALUES (145, 'myadmin', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'myadmin\'@\'10.118.29.210\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' WITH GRANT OPTION ;  ', 15, '10.118.29.210', NULL);
INSERT INTO `mysql_user` VALUES (146, 'myrepl', NULL, 'GRANT SUPER, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO \'myrepl\'@\'10.148.%\' IDENTIFIED BY PASSWORD \'*56DA56B84274ABF5D5AF89618DA24349C44E472D\' ;  ', 15, '10.148.%', NULL);
INSERT INTO `mysql_user` VALUES (147, 'myadmin', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'myadmin\'@\'10.58.%\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' WITH GRANT OPTION ;  ', 15, '10.58.%', NULL);
INSERT INTO `mysql_user` VALUES (148, 'myadmin', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'myadmin\'@\'10.58.1.%\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' WITH GRANT OPTION ;  ', 15, '10.58.1.%', NULL);
INSERT INTO `mysql_user` VALUES (149, 'myadmin', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'myadmin\'@\'10.75.137.%\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' WITH GRANT OPTION ;  ', 15, '10.75.137.%', NULL);
INSERT INTO `mysql_user` VALUES (150, 'db_monitor', NULL, 'GRANT SELECT, PROCESS, SUPER, REPLICATION CLIENT ON *.* TO \'db_monitor\'@\'117.121.54.118\' IDENTIFIED BY PASSWORD \'*77A98177177C512EE0A987B765A56D199108DB99\' ;  ', 15, '117.121.54.118', NULL);
INSERT INTO `mysql_user` VALUES (151, 'db_monitor', NULL, 'GRANT SELECT, PROCESS, REPLICATION CLIENT ON *.* TO \'db_monitor\'@\'127.0.0.1\' IDENTIFIED BY PASSWORD \'*77A98177177C512EE0A987B765A56D199108DB99\' ;  ', 15, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (152, 'myadmin', NULL, 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, RELOAD, SHUTDOWN, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON *.* TO \'myadmin\'@\'127.0.0.1\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' ;  ', 15, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (153, 'qw_cmdb', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'qw_cmdb\'@\'127.0.0.1\' IDENTIFIED BY PASSWORD \'*B6153F2F6C465E3C224AC3AEED4355F3C5C11C4F\' ;  ', 15, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (154, 'sql_upline', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'sql_upline\'@\'172.16.50.222\' IDENTIFIED BY PASSWORD \'*80419CBAC9B7B9669A27B9948F068DB6B9F18C3D\' ;  ', 15, '172.16.50.222', NULL);
INSERT INTO `mysql_user` VALUES (155, 'myadmin', NULL, 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, RELOAD, SHUTDOWN, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON *.* TO \'myadmin\'@\'localhost\' IDENTIFIED BY PASSWORD \'*454076351631F3275BFEE85122664113BB4D11EB\' ;  ', 15, 'localhost', NULL);
INSERT INTO `mysql_user` VALUES (156, 'rangeradmin', NULL, 'GRANT USAGE ON *.* TO \'rangeradmin\'@\'%\' ;  GRANT ALL PRIVILEGES ON `ranger`.* TO \'rangeradmin\'@\'%\' WITH GRANT OPTION ;  ', 16, '%', NULL);
INSERT INTO `mysql_user` VALUES (157, 'ambari', NULL, 'GRANT USAGE ON *.* TO \'ambari\'@\'127.0.0.1\' ;  GRANT ALL PRIVILEGES ON `ambari`.* TO \'ambari\'@\'127.0.0.1\' ;  ', 16, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (158, 'hive', NULL, 'GRANT USAGE ON *.* TO \'hive\'@\'127.0.0.1\' ;  GRANT ALL PRIVILEGES ON `hive`.* TO \'hive\'@\'127.0.0.1\' ;  ', 16, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (159, 'ranger', NULL, 'GRANT USAGE ON *.* TO \'ranger\'@\'127.0.0.1\' ;  GRANT ALL PRIVILEGES ON `ranger`.* TO \'ranger\'@\'127.0.0.1\' ;  ', 16, '127.0.0.1', NULL);
INSERT INTO `mysql_user` VALUES (160, 'ambari', NULL, 'GRANT USAGE ON *.* TO \'ambari\'@\'172.16.50.%\' ;  GRANT ALL PRIVILEGES ON `ambari`.* TO \'ambari\'@\'172.16.50.%\' ;  ', 16, '172.16.50.%', NULL);
INSERT INTO `mysql_user` VALUES (161, 'hive', NULL, 'GRANT USAGE ON *.* TO \'hive\'@\'172.16.50.%\' ;  GRANT ALL PRIVILEGES ON `hive`.* TO \'hive\'@\'172.16.50.%\' ;  ', 16, '172.16.50.%', NULL);
INSERT INTO `mysql_user` VALUES (162, 'ranger', NULL, 'GRANT ALL PRIVILEGES ON *.* TO \'ranger\'@\'172.16.50.%\' WITH GRANT OPTION ;  GRANT ALL PRIVILEGES ON `ranger`.* TO \'ranger\'@\'172.16.50.%\' ;  ', 16, '172.16.50.%', NULL);
INSERT INTO `mysql_user` VALUES (163, 'rangeradmin', NULL, 'GRANT USAGE ON *.* TO \'rangeradmin\'@\'172.16.50.56\' ;  GRANT ALL PRIVILEGES ON `ranger`.* TO \'rangeradmin\'@\'172.16.50.56\' WITH GRANT OPTION ;  ', 16, '172.16.50.56', NULL);
INSERT INTO `mysql_user` VALUES (164, 'rangeradmin', NULL, 'GRANT USAGE ON *.* TO \'rangeradmin\'@\'localhost\' ;  GRANT ALL PRIVILEGES ON `ranger`.* TO \'rangeradmin\'@\'localhost\' WITH GRANT OPTION ;  ', 16, 'localhost', NULL);

-- ----------------------------
-- Table structure for mysqlops_mysql_sql_log
-- ----------------------------
DROP TABLE IF EXISTS `mysqlops_mysql_sql_log`;
CREATE TABLE `mysqlops_mysql_sql_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipaddr` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dbcluster` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dbname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sqltext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sqltype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exe_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `login_time` datetime(6) NOT NULL,
  `affect_row` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `MysqlOps_mysql_sql_log_dbcluster_sqltype_create__a35c2016_idx`(`dbcluster`, `sqltype`, `create_time`) USING BTREE,
  INDEX `MysqlOps_mysql_sql_log_create_time_758fbc25`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mysqlops_mysql_sql_log
-- ----------------------------
INSERT INTO `mysqlops_mysql_sql_log` VALUES (1, 'admin', '172.16.24.42', '测试db', '', '--please insert your sql\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', '--please', '', '2019-01-16 08:10:27.387346', '2019-01-15 09:15:08.839313', NULL);
INSERT INTO `mysqlops_mysql_sql_log` VALUES (2, 'admin', '172.16.24.42', '测试db', '', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', '', '2019-01-16 08:10:29.765593', '2019-01-15 09:15:08.839313', NULL);
INSERT INTO `mysqlops_mysql_sql_log` VALUES (3, 'admin', '172.16.24.42', '测试db', '', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', '', '2019-01-16 08:10:29.865624', '2019-01-15 09:15:08.839313', NULL);
INSERT INTO `mysqlops_mysql_sql_log` VALUES (4, 'admin', '172.16.24.42', '测试db', '', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', '', '2019-01-16 08:10:29.956622', '2019-01-15 09:15:08.839313', NULL);
INSERT INTO `mysqlops_mysql_sql_log` VALUES (5, 'admin', '172.16.24.42', '测试db', '', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', '', '2019-01-16 08:10:30.055304', '2019-01-15 09:15:08.839313', NULL);
INSERT INTO `mysqlops_mysql_sql_log` VALUES (6, 'admin', '172.16.24.42', '测试db', '', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', '', '2019-01-16 08:10:30.141583', '2019-01-15 09:15:08.839313', NULL);
INSERT INTO `mysqlops_mysql_sql_log` VALUES (7, 'admin', '172.16.24.42', '测试db', '', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', '', '2019-01-16 08:10:30.262818', '2019-01-15 09:15:08.839313', NULL);
INSERT INTO `mysqlops_mysql_sql_log` VALUES (8, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', '', '2019-01-16 09:20:43.456317', '2019-01-15 09:15:08.839313', NULL);
INSERT INTO `mysqlops_mysql_sql_log` VALUES (9, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:10:59.116765', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (10, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:10:59.116765', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (11, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:10:59.116765', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (12, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:10:59.116765', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (13, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:10:59.116765', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (14, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:10:59.116765', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (15, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:10:59.116765', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (16, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.134668', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (17, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.096475', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (18, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.134668', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (19, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.096475', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (20, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.134668', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (21, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.096475', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (22, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.134668', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (23, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.096475', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (24, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.134668', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (25, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.096475', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (26, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.134668', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (27, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.096475', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (28, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.134668', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (29, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:15:29.096475', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (30, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:11.622718', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (31, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:11.622718', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (32, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:11.622718', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (33, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:11.622718', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (34, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:11.622718', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (35, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:11.622718', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (36, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:11.622718', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (37, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:36.651107', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (38, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:36.651107', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (39, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:36.651107', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (40, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:36.651107', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (41, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:36.651107', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (42, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:36.651107', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (43, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:18:36.651107', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (58, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:58:50.696947', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (59, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:58:50.696947', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (60, 'admin', '172.16.24.42', '测试db', 'dbplat', 'insert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:58:50.696947', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (61, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:58:50.696947', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (62, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:58:50.696947', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (63, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:58:50.696947', '2019-01-15 09:15:08.839313', '影响行数1');
INSERT INTO `mysqlops_mysql_sql_log` VALUES (64, 'admin', '172.16.24.42', '测试db', 'dbplat', '\ninsert into myapp_upload(username,filename) values(\'asdf\',\'sdfasdfsadfsad\');', 'insert', 'success', '2019-01-16 10:58:50.696947', '2019-01-15 09:15:08.839313', '影响行数1');

-- ----------------------------
-- Table structure for mysqlops_mysqlfastsql
-- ----------------------------
DROP TABLE IF EXISTS `mysqlops_mysqlfastsql`;
CREATE TABLE `mysqlops_mysqlfastsql`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exec_posi` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mysqlops_mysqlfastsql
-- ----------------------------
INSERT INTO `mysqlops_mysqlfastsql` VALUES (15, '进程状态', 'show processlist', 'select * from information_schema.processlist where COMMAND!=\'Sleep\' ORDER BY TIME DESC', '主库');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (16, '从库状态', 'show slave status', 'show slave status', '从库');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (17, '集群组复制', '组成员表', 'select * from performance_schema.replication_group_members;', '集群');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (18, 'sdf', 'adsfads', 'asdfsadfdsaasdd', '主库');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (19, '查看表的列', '', 'SELECT ORDINAL_POSITION AS POS,COLUMN_NAME,COLUMN_TYPE,COLUMN_DEFAULT,IS_NULLABLE,CHARACTER_SET_NAME,COLLATION_NAME,COLUMN_KEY,EXTRA,COLUMN_COMMENT FROM information_schema.COLUMNS  where TABLE_SCHEMA=\'这里要是数据库名\'  and TABLE_NAME=\'这是要是表名\' ORDER BY POS', '主库');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (20, '查看表索引信息', '', 'SELECT INDEX_NAME,NON_UNIQUE,SEQ_IN_INDEX,COLUMN_NAME,COLLATION,CARDINALITY,SUB_PART,PACKED,NULLABLE,INDEX_TYPE,COMMENT,INDEX_COMMENT FROM information_schema.statistics  where TABLE_SCHEMA=\'这是数据库名\' and TABLE_NAME=\'这是表名\'', '主库');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (21, '查看表详情', '', 'select * from information_schema.tables where TABLE_SCHEMA=\'这是数据库名\' and TABLE_NAME=\'这是表名\'', '主库');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (22, '表大小排序', '', 'SELECT\n        TABLE_SCHEMA,\n        TABLE_NAME,\n        COLUMNS.COLUMN_NAME,\n        COLUMNS.DATA_TYPE,\n        COLUMNS.COLUMN_TYPE,\n        IF(LOCATE(\'unsigned\', COLUMN_TYPE) > 0,1,0) AS IS_UNSIGNED,\n        IF(LOCATE(\'int\', DATA_TYPE) > 0,  1,  0  ) AS IS_INT,\n        (CASE DATA_TYPE\n        WHEN \'tinyint\' THEN 255\n	    WHEN \'smallint\' THEN 65535\n	    WHEN \'mediumint\' THEN 16777215\n	    WHEN \'int\' THEN 4294967295\n	    WHEN \'bigint\' THEN 18446744073709551615\n	    END >> IF(LOCATE(\'unsigned\', COLUMN_TYPE) > 0, 0, 1)\n	    ) AS MAX_VALUE,\n	    AUTO_INCREMENT,\n	    INDEX_NAME,\n	    SEQ_IN_INDEX\n	    FROM INFORMATION_SCHEMA.COLUMNS INNER JOIN INFORMATION_SCHEMA.TABLES USING (TABLE_SCHEMA, TABLE_NAME) INNER JOIN INFORMATION_SCHEMA.STATISTICS USING (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME)\n		WHERE TABLE_SCHEMA not IN (\'INFORMATION_SCHEMA\',\'mysql\',\'performance_schema\') \n		AND SEQ_IN_INDEX=1 AND EXTRA=\'auto_increment\' \n		GROUP BY TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME order by AUTO_INCREMENT/MAX_VALUE desc limit 100;', '主库');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (23, '查看当前等待', '8.0 可能为空值', 'select \n    thread_id,  \n    event_name, \n    object_name, \n    operation, \n    timer_start,\n    timer_end,  \n    timer_wait,  \n    (case timer_wait when null then \'doing\' else \'done\' end) as statu \nfrom performance_schema.events_waits_current ;', '集群');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (24, '查看内存使用', '8.0 专用', 'select \n    substring_index(event_name,\'/\',2) as code_area,       -- 代码域\n    sys.format_bytes(sum(current_alloc)) as current_alloc -- 使用的内存的大小\nfrom sys.x$memory_global_by_current_bytes \ngroup by substring_index(event_name,\'/\',2) \norder by sum(current_alloc) desc\nlimit 5;', '主库');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (25, '等待次数', '8.0专用', 'select \n    event_name, -- 事件名\n    count_star  -- 等待次数\nfrom performance_schema.events_waits_summary_global_by_event_name\norder by count_star desc limit 7;', '集群');
INSERT INTO `mysqlops_mysqlfastsql` VALUES (26, '等待时间', '8.0专用', 'select timer_frequency into @frequency  \n    from performance_schema.performance_timers \nwhere timer_name=\'CYCLE\';\n\nselect \n    event_name,     -- 事件名\n    sum_timer_wait /@frequency as sum_timer_wait_by_second   -- 总等待时间\nfrom performance_schema.events_waits_summary_global_by_event_name\norder by sum_timer_wait desc limit 7;', '集群');

-- ----------------------------
-- Table structure for netdevices
-- ----------------------------
DROP TABLE IF EXISTS `netdevices`;
CREATE TABLE `netdevices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_band_ip` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_band_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_net_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_model` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sn` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cabinet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useuser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `soft_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `onlinedate` date DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `group_id` int(11) DEFAULT NULL,
  `idc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `devicename`(`devicename`) USING BTREE,
  INDEX `NetDevices_group_id_47e2a5b6_fk_CMDB_netgroup_id`(`group_id`) USING BTREE,
  INDEX `NetDevices_idc_id_700d5c5c_fk_CMDB_idc_id`(`idc_id`) USING BTREE,
  CONSTRAINT `NetDevices_group_id_47e2a5b6_fk_CMDB_netgroup_id` FOREIGN KEY (`group_id`) REFERENCES `cmdb_netgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `NetDevices_idc_id_700d5c5c_fk_CMDB_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `idc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for networkcard_assets
-- ----------------------------
DROP TABLE IF EXISTS `networkcard_assets`;
CREATE TABLE `networkcard_assets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `macaddress` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mtu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `networkcard_assets_host_id_macaddress_ip_59b37866_uniq`(`host_id`, `macaddress`, `ip`) USING BTREE,
  INDEX `networkcard_assets_host_id_f06db700`(`host_id`) USING BTREE,
  CONSTRAINT `networkcard_assets_host_id_f06db700_fk_ALLHOSTS_id` FOREIGN KEY (`host_id`) REFERENCES `allhosts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of networkcard_assets
-- ----------------------------
INSERT INTO `networkcard_assets` VALUES (33, NULL, NULL, 'unkown', NULL, NULL, 0, 217);
INSERT INTO `networkcard_assets` VALUES (34, NULL, NULL, '10.0.40.138', NULL, NULL, 0, 217);
INSERT INTO `networkcard_assets` VALUES (35, NULL, NULL, '169.254.208.3', NULL, NULL, 0, 217);
INSERT INTO `networkcard_assets` VALUES (36, 'eth3', '08:94:ef:54:b2:4a', 'unkown', 'tg3', '1500', 1, 217);
INSERT INTO `networkcard_assets` VALUES (37, 'bond1', '08:94:ef:54:b2:4a', '192.168.40.38', NULL, '1500', 1, 217);
INSERT INTO `networkcard_assets` VALUES (38, 'bond0', '08:94:ef:54:b2:48', '10.0.40.38', NULL, '1500', 1, 217);
INSERT INTO `networkcard_assets` VALUES (39, 'bond0', '08:94:ef:54:b2:48', '10.0.40.138', NULL, '1500', 1, 217);
INSERT INTO `networkcard_assets` VALUES (40, 'eth0', '08:94:ef:54:b2:48', 'unkown', 'tg3', '1500', 1, 217);
INSERT INTO `networkcard_assets` VALUES (45, 'eth0', '2e:ab:68:68:ee:90', '172.16.50.191', 'xen_netfront', '1500', 1, 272);
INSERT INTO `networkcard_assets` VALUES (46, 'eth0', '2e:ab:68:68:ee:90', '172.16.50.187', 'xen_netfront', '1500', 1, 272);
INSERT INTO `networkcard_assets` VALUES (47, 'ens192', '00:0c:29:63:3f:35', '172.16.50.213', 'vmxnet3', '1500', 1, 322);
INSERT INTO `networkcard_assets` VALUES (48, 'ens224', '00:0c:29:63:3f:3f', '172.16.60.203', 'vmxnet3', '1500', 1, 322);

-- ----------------------------
-- Table structure for opscontrol_ansible_callback_model_result
-- ----------------------------
DROP TABLE IF EXISTS `opscontrol_ansible_callback_model_result`;
CREATE TABLE `opscontrol_ansible_callback_model_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `OpsControl_ansible_c_logId_id_3b060764_fk_opsmanage`(`logId_id`) USING BTREE,
  CONSTRAINT `OpsControl_ansible_c_logId_id_3b060764_fk_opsmanage` FOREIGN KEY (`logId_id`) REFERENCES `log_ansible_model` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opscontrol_ansible_callback_model_result
-- ----------------------------
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (1, '<font color=\'#DC143C\'>172.16.50.222 | FAILED! => {\n    \"msg\": \"Unexpected failure during module execution.\", \n    \"failed\": true, \n    \"exception\": \"Traceback (most recent call last):\\n  File \\\"/data/python-env/roeops/lib/python2.7/site-packages/ansible/executor/task_executor.py\\\", line 125, in run\\n    res = self._execute()\\n  File \\\"/data/python-env/roeops/lib/python2.7/site-packages/ansible/executor/task_executor.py\\\", line 522, in _execute\\n    result = self._handler.run(task_vars=variables)\\n  File \\\"/data/python-env/roeops/lib/python2.7/site-packages/ansible/plugins/action/script.py\\\", line 63, in run\\n    source = parts[0]\\nIndexError: list index out of range\\n\", \n    \"stdout\": \"\"\n}</font>', 1);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (2, '<font color=\'#DC143C\'>172.16.50.222 | FAILED! => {\n    \"msg\": \"Unexpected failure during module execution.\", \n    \"failed\": true, \n    \"exception\": \"Traceback (most recent call last):\\n  File \\\"/data/python-env/roeops/lib/python2.7/site-packages/ansible/executor/task_executor.py\\\", line 125, in run\\n    res = self._execute()\\n  File \\\"/data/python-env/roeops/lib/python2.7/site-packages/ansible/executor/task_executor.py\\\", line 522, in _execute\\n    result = self._handler.run(task_vars=variables)\\n  File \\\"/data/python-env/roeops/lib/python2.7/site-packages/ansible/plugins/action/script.py\\\", line 63, in run\\n    source = parts[0]\\nIndexError: list index out of range\\n\", \n    \"stdout\": \"\"\n}</font>', 2);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (3, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \nfangliancaho\r\n', 3);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (4, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 4);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (5, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 5);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (6, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 5);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (7, '<font color=\'green\'>172.16.50.230 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 5);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (8, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \nfangliancaho\r\n', 6);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (9, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \nfangliancaho\r\n', 6);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (10, '<font color=\'green\'>172.16.50.230 | SUCCESS | rc=0 >> \nfangliancaho\r\n', 6);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (11, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 7);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (12, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 7);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (13, '<font color=\'green\'>172.16.50.220 | SUCCESS | rc=0 >> \nincepiton	      pycharm-2018.1.2			    redis_data\r\nmongo_27017	      pycharm-2018.1_bak		    soft\r\nmysql_3306	      pycharm-2018.tar.gz		    test.text\r\nmysql_3306.tar.gz     pycharm-professional-2018.1.2.tar.gz  tm\r\nmysql_3307_inceptbak  PycharmProject			    virtualenv\r\npycharm-2017.3.1      qw_cmdb				    webssh\r\n', 8);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (14, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \ncachecloud			       pycharm-2018.tar.gz\r\nmongo_27017.tar.gz		       pycharm-professional-2018.1.2.tar.gz\r\nmongodb-linux-x86_64-rhel70-3.6.2.tgz  PycharmProject\r\nmysql_3306			       Python-3.6.5\r\nmysql_3306.tar.gz		       Python-3.6.5.tgz\r\nmysql_3306.tgz			       redisbin.tar.gz\r\nnohup.out			       redis_data_single.tgz\r\nproject.zip			       redist_cluster_manager\r\npycharm-2018.1.2		       virtualenv\r\n', 8);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (15, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \n总用量 1756080\r\ndrwxr-xr-x   7 root  root        315 10月 15 12:12 cachecloud\r\n-rw-r--r--.  1 root  root   24574277 4月  13 2018 mongo_27017.tar.gz\r\n-rw-r--r--.  1 root  root   99179293 4月  13 2018 mongodb-linux-x86_64-rhel70-3.6.2.tgz\r\ndrwxr-xr-x.  8 mysql mysql       183 1月  18 2018 mysql_3306\r\n-rw-r--r--.  1 root  root  465973515 4月  13 2018 mysql_3306.tar.gz\r\n-rw-r--r--   1 root  root  466084416 10月 15 10:58 mysql_3306.tgz\r\n-rw-------.  1 root  root         16 6月   6 11:50 nohup.out\r\n-rw-r--r--.  1 root  root   22686771 5月  20 2018 project.zip\r\ndrwxr-xr-x. 11 root  root        175 5月  22 2018 pycharm-2018.1.2\r\n-rw-r--r--.  1 root  root  343884190 4月  13 2018 pycharm-2018.tar.gz\r\n-rw-r--r--.  1 root  root  344700413 5月   9 2018 pycharm-professional-2018.1.2.tar.gz\r\ndrwxr-xr-x.  5 root  root         95 6月  21 19:33 PycharmProject\r\ndrwxr-xr-x. 17   501   501      4096 5月  21 2018 Python-3.6.5\r\n-rw-r--r--.  1 root  root   22994617 5月  15 2018 Python-3.6.5.tgz\r\n-rw-r--r--.  1 root  root    8115073 4月  13 2018 redisbin.tar.gz\r\n-rw-r--r--.  1 root  root       2651 4月  13 2018 redis_data_single.tgz\r\ndrwxr-xr-x   4 root  root        115 10月 14 14:43 redist_cluster_manager\r\ndrwxr-xr-x.  5 root  root         69 6月  21 19:16 virtualenv\r\n', 9);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (16, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \n总用量 1756080\r\ndrwxr-xr-x   7 root  root        315 10月 15 12:12 cachecloud\r\n-rw-r--r--.  1 root  root   24574277 4月  13 2018 mongo_27017.tar.gz\r\n-rw-r--r--.  1 root  root   99179293 4月  13 2018 mongodb-linux-x86_64-rhel70-3.6.2.tgz\r\ndrwxr-xr-x.  8 mysql mysql       183 1月  18 2018 mysql_3306\r\n-rw-r--r--.  1 root  root  465973515 4月  13 2018 mysql_3306.tar.gz\r\n-rw-r--r--   1 root  root  466084416 10月 15 10:58 mysql_3306.tgz\r\n-rw-------.  1 root  root         16 6月   6 11:50 nohup.out\r\n-rw-r--r--.  1 root  root   22686771 5月  20 2018 project.zip\r\ndrwxr-xr-x. 11 root  root        175 5月  22 2018 pycharm-2018.1.2\r\n-rw-r--r--.  1 root  root  343884190 4月  13 2018 pycharm-2018.tar.gz\r\n-rw-r--r--.  1 root  root  344700413 5月   9 2018 pycharm-professional-2018.1.2.tar.gz\r\ndrwxr-xr-x.  5 root  root         95 6月  21 19:33 PycharmProject\r\ndrwxr-xr-x. 17   501   501      4096 5月  21 2018 Python-3.6.5\r\n-rw-r--r--.  1 root  root   22994617 5月  15 2018 Python-3.6.5.tgz\r\n-rw-r--r--.  1 root  root    8115073 4月  13 2018 redisbin.tar.gz\r\n-rw-r--r--.  1 root  root       2651 4月  13 2018 redis_data_single.tgz\r\ndrwxr-xr-x   4 root  root        115 10月 14 14:43 redist_cluster_manager\r\ndrwxr-xr-x.  5 root  root         69 6月  21 19:16 virtualenv\r\n', 10);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (17, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 11);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (18, '<font color=\'green\'>172.16.50.215 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 11);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (19, '<font color=\'green\'>172.16.50.222 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 12);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (20, '<font color=\'green\'>172.16.50.223 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 12);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (21, '<font color=\'green\'>172.16.50.222 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 13);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (22, '<font color=\'green\'>172.16.50.223 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 13);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (23, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \n‘fangliancaho’\r\n', 14);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (24, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \n‘fangliancaho’\r\n', 14);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (25, '<font color=\'green\'>172.16.50.223 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 15);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (26, '<font color=\'green\'>172.16.50.222 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 15);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (27, '<font color=\'green\'>172.16.50.59 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 16);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (28, '<font color=\'green\'>172.16.50.59 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 17);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (29, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \nqiangwei\r\n', 18);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (30, '<font color=\'green\'>172.16.50.223 | SUCCESS | rc=0 >> \nqiangwei\r\n', 19);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (31, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \nqiangwei\r\n', 19);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (32, '<font color=\'green\'>172.16.50.222 | SUCCESS | rc=0 >> \nqiangwei\r\n', 20);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (33, '<font color=\'green\'>172.16.50.220 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 21);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (34, '<font color=\'green\'>172.16.50.223 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 22);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (35, '<font color=\'green\'>172.16.50.222 | SUCCESS >> {\n    \"ping\": \"pong\"\n}</font>', 22);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (36, '<font color=\'green\'>172.16.50.180 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 23);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (37, '<font color=\'green\'>172.16.50.189 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 23);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (38, '<font color=\'green\'>172.16.50.189 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 24);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (39, '<font color=\'green\'>172.16.50.180 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 25);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (40, '<font color=\'green\'>172.16.50.182 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 25);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (41, '<font color=\'green\'>172.16.50.183 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 25);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (42, '<font color=\'green\'>172.16.50.182 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 26);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (43, '<font color=\'green\'>172.16.50.74 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 26);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (44, '<font color=\'green\'>172.16.50.182 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 27);
INSERT INTO `opscontrol_ansible_callback_model_result` VALUES (45, '<font color=\'green\'>172.16.50.183 | SUCCESS | rc=0 >> \nfanglianchao\r\n', 27);

-- ----------------------------
-- Table structure for opscontrol_ansible_callback_playbook_result
-- ----------------------------
DROP TABLE IF EXISTS `opscontrol_ansible_callback_playbook_result`;
CREATE TABLE `opscontrol_ansible_callback_playbook_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `OpsControl_ansible_c_logId_id_cc1c638c_fk_opsmanage`(`logId_id`) USING BTREE,
  CONSTRAINT `OpsControl_ansible_c_logId_id_cc1c638c_fk_opsmanage` FOREIGN KEY (`logId_id`) REFERENCES `log_ansible_playbook` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 759 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opscontrol_ansible_callback_playbook_result
-- ----------------------------
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (1, '<font color=\'#FFFFFF\'>PLAY [172.16.50.223]*************************************</font>', 2);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (2, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 2);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (3, '<font color=\'#DC143C\'>fatal: [172.16.50.223]: FAILED! => {\"msg\": \"Unexpected failure during module execution.\", \"failed\": true, \"stdout\": \"\"}</font>', 2);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (4, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 2);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (5, '<font color=\'#DC143C\'>172.16.50.223</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 2);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (6, '<font color=\'#FFFFFF\'>PLAY [172.16.50.223]*************************************</font>', 3);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (7, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 3);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (8, '<font color=\'#DC143C\'>fatal: [172.16.50.223]: FAILED! => {\"msg\": \"Unexpected failure during module execution.\", \"failed\": true, \"stdout\": \"\"}</font>', 3);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (9, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 3);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (10, '<font color=\'#DC143C\'>172.16.50.223</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 3);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (11, '<font color=\'#FFFFFF\'>PLAY [172.16.50.223]*************************************</font>', 4);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (12, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 4);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (13, '<font color=\'#DC143C\'>fatal: [172.16.50.223]: FAILED! => {\"msg\": \"Unexpected failure during module execution.\", \"failed\": true, \"stdout\": \"\"}</font>', 4);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (14, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 4);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (15, '<font color=\'#DC143C\'>172.16.50.223</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 4);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (16, '<font color=\'#FFFFFF\'>PLAY [172.16.50.223]*************************************</font>', 5);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (17, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 5);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (18, '<font color=\'#DC143C\'>fatal: [172.16.50.223]: FAILED! => {\"msg\": \"Unexpected failure during module execution.\", \"failed\": true, \"stdout\": \"\"}</font>', 5);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (19, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 5);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (20, '<font color=\'#DC143C\'>172.16.50.223</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 5);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (21, '<font color=\'#FFFFFF\'>PLAY [172.16.50.223]*************************************</font>', 6);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (22, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 6);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (23, '<font color=\'#DC143C\'>fatal: [172.16.50.223]: FAILED! => {\"msg\": \"Unexpected failure during module execution.\", \"failed\": true, \"stdout\": \"\"}</font>', 6);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (24, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 6);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (25, '<font color=\'#DC143C\'>172.16.50.223</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 6);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (26, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 8);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (27, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 8);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (28, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 9);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (29, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 9);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (30, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 10);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (31, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 10);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (32, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 11);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (33, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 11);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (34, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 12);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (35, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 12);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (36, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 13);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (37, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 13);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (38, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 14);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (39, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 14);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (40, '<font color=\'#FFFFFF\'>PLAY [172.16.50.220]*************************************</font>', 15);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (41, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 15);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (42, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 16);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (43, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 16);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (44, '<font color=\'#FFFFFF\'>PLAY [172.16.50.230,172.16.50.215]***********************</font>', 17);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (45, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 17);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (46, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 18);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (47, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 18);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (48, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222,172.16.50.215]***********************</font>', 19);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (49, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 19);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (50, '<font color=\'green\'>ok: [172.16.50.222 -> 172.16.50.222]</font>', 19);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (51, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 21);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (52, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 22);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (53, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 20);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (54, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 22);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (55, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 20);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (56, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 23);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (57, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 23);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (58, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 24);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (59, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 24);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (60, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 25);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (61, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 25);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (62, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 26);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (63, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 26);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (64, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 27);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (65, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 27);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (66, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 28);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (67, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 28);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (68, '<font color=\'#FFFFFF\'>PLAY [172.16.50.215]*************************************</font>', 29);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (69, '<font color=\'#FFFFFF\'>\nTASK [transfer file from d to host]**********************</font>', 29);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (70, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 30);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (71, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.215\']]********************************</font>', 30);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (72, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 30);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (73, '<font color=\'green\'>ok: [172.16.50.215]</font>', 30);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (74, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 30);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (75, '<font color=\'#DC143C\'>fatal: [172.16.50.215 -> 172.16.50.222]: FAILED! => {\"_ansible_parsed\": true, \"changed\": false, \"_ansible_no_log\": false, \"_ansible_delegated_vars\": {\"ansible_delegated_host\": \"172.16.50.222\", \"ansible_host\": \"172.16.50.222\"}, \"cmd\": \"/usr/bin/rsync --delay-updates -F --compress --archive --rsh=/usr/bin/ssh -S none -o Port=22 -o StrictHostKeyChecking=no --rsync-path=sudo rsync --out-format=<<CHANGED>>%i %n%L /data/python_env.tgz 172.16.50.215:/tmp/soft/python_env.tgz\", \"failed\": true, \"rc\": 12, \"invocation\": {\"module_args\": {\"partial\": false, \"links\": null, \"copy_links\": false, \"perms\": null, \"owner\": null, \"archive\": true, \"dest_port\": 22, \"_local_rsync_path\": \"rsync\", \"group\": null, \"recursive\": null, \"rsync_path\": \"sudo rsync\", \"_substitute_controller\": false, \"verify_host\": false, \"dirs\": false, \"private_key\": null, \"dest\": \"172.16.50.215:/tmp/soft/python_env.tgz\", \"compress\": true, \"rsync_timeout\": 0, \"rsync_opts\": null, \"set_remote_user\": true, \"existing_only\": false, \"src\": \"/data/python_env.tgz\", \"checksum\": false, \"times\": null, \"mode\": \"push\", \"ssh_args\": null, \"delete\": false}}, \"msg\": \"rsync: connection unexpectedly closed (9 bytes received so far) [sender]\\nrsync error: error in rsync protocol data stream (code 12) at io.c(605) [sender=3.0.9]\\n\"}</font>', 30);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (76, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 30);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (77, '<font color=\'#DC143C\'>172.16.50.215</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 30);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (78, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 31);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (79, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.215\']]********************************</font>', 31);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (80, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 31);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (81, '<font color=\'green\'>ok: [172.16.50.215]</font>', 31);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (82, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 31);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (83, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 31);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (84, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 31);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (85, '<font color=\'yellow\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=1</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 31);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (86, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (87, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.230\', u\'172.16.50.215\']]**************</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (88, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (89, '<font color=\'green\'>ok: [172.16.50.230] => {\n    \"msg\": \"line added\", \n    \"diff\": [\n        {\n            \"after\": \"\", \n            \"before_header\": \"/root/.ssh/authorized_keys (content)\", \n            \"after_header\": \"/root/.ssh/authorized_keys (content)\", \n            \"before\": \"\"\n        }, \n        {\n            \"before_header\": \"/root/.ssh/authorized_keys (file attributes)\", \n            \"after_header\": \"/root/.ssh/authorized_keys (file attributes)\"\n        }\n    ], \n    \"backup\": \"\"\n}</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (90, '<font color=\'green\'>ok: [172.16.50.215]</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (91, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (92, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (93, '<font color=\'green\'>ok: [172.16.50.230 -> 172.16.50.222]</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (94, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (95, '<font color=\'yellow\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=1</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (96, '<font color=\'yellow\'>172.16.50.230</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 32);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (97, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (98, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.230\', u\'172.16.50.215\']]**************</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (99, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (100, '<font color=\'green\'>ok: [172.16.50.230]</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (101, '<font color=\'green\'>ok: [172.16.50.215]</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (102, '<font color=\'#FFFFFF\'>\nTASK [transfile_waiting]*********************************</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (103, '<font color=\'green\'>ok: [172.16.50.230 -> 172.16.50.222]</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (104, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (105, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (106, '<font color=\'green\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (107, '<font color=\'green\'>172.16.50.230</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 33);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (108, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (109, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.230\', u\'172.16.50.215\']]**************</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (110, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (111, '<font color=\'green\'>ok: [172.16.50.230]</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (112, '<font color=\'green\'>ok: [172.16.50.215]</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (113, '<font color=\'#FFFFFF\'>\nTASK [transfile_waiting]*********************************</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (114, '<font color=\'green\'>ok: [172.16.50.230 -> 172.16.50.222]</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (115, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (116, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (117, '<font color=\'yellow\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=1</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (118, '<font color=\'yellow\'>172.16.50.230</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=1</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 34);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (119, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (120, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.230\', u\'172.16.50.215\']]**************</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (121, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (122, '<font color=\'green\'>ok: [172.16.50.230]</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (123, '<font color=\'green\'>ok: [172.16.50.215]</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (124, '<font color=\'#FFFFFF\'>\nTASK [transfileing]**************************************</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (125, '<font color=\'green\'>ok: [172.16.50.230 -> 172.16.50.222]</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (126, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (127, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (128, '<font color=\'green\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (129, '<font color=\'green\'>172.16.50.230</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 35);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (130, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (131, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.230\', u\'172.16.50.215\']]**************</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (132, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (133, '<font color=\'green\'>ok: [172.16.50.230]</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (134, '<font color=\'green\'>ok: [172.16.50.215]</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (135, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (136, '<font color=\'green\'>ok: [172.16.50.230 -> 172.16.50.222]</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (137, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (138, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (139, '<font color=\'green\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (140, '<font color=\'green\'>172.16.50.230</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 36);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (141, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (142, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.230\', u\'172.16.50.215\']]**************</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (143, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (144, '<font color=\'green\'>ok: [172.16.50.230]</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (145, '<font color=\'green\'>ok: [172.16.50.215]</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (146, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (147, '<font color=\'green\'>ok: [172.16.50.230 -> 172.16.50.222]</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (148, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (149, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (150, '<font color=\'green\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (151, '<font color=\'green\'>172.16.50.230</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 37);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (152, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (153, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.230\', u\'172.16.50.215\']]**************</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (154, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (155, '<font color=\'green\'>ok: [172.16.50.230]</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (156, '<font color=\'green\'>ok: [172.16.50.215]</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (157, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (158, '<font color=\'green\'>ok: [172.16.50.230 -> 172.16.50.222]</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (159, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (160, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (161, '<font color=\'green\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (162, '<font color=\'green\'>172.16.50.230</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 38);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (163, '<font color=\'#FFFFFF\'>PLAY [172.16.50.222]*************************************</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (164, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.230\', u\'172.16.50.215\']]**************</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (165, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (166, '<font color=\'green\'>ok: [172.16.50.230]</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (167, '<font color=\'green\'>ok: [172.16.50.215]</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (168, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (169, '<font color=\'green\'>ok: [172.16.50.230 -> 172.16.50.222]</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (170, '<font color=\'green\'>ok: [172.16.50.215 -> 172.16.50.222]</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (171, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (172, '<font color=\'green\'>172.16.50.215</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (173, '<font color=\'green\'>172.16.50.230</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 39);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (174, '<font color=\'#FFFFFF\'>PLAY [172.16.50.223]*************************************</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (175, '<font color=\'#FFFFFF\'>\nTASK [test-source-host-sshkey]***************************</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (176, '<font color=\'green\'>ok: [172.16.50.223]</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (177, '<font color=\'#FFFFFF\'>\nTASK [if-not-exist-sshkey-exit]**************************</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (178, '<font color=\'yellow\'>skipped: [172.16.50.223]</font>\n', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (179, '<font color=\'#FFFFFF\'>\nTASK [get-pub-key]***************************************</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (180, '<font color=\'green\'>ok: [172.16.50.223]</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (181, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.223\', u\'172.16.50.222\']]**************</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (182, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (183, '<font color=\'green\'>ok: [172.16.50.223] => {\n    \"msg\": \"line added\", \n    \"diff\": [\n        {\n            \"after\": \"\", \n            \"before_header\": \"/root/.ssh/authorized_keys (content)\", \n            \"after_header\": \"/root/.ssh/authorized_keys (content)\", \n            \"before\": \"\"\n        }, \n        {\n            \"before_header\": \"/root/.ssh/authorized_keys (file attributes)\", \n            \"after_header\": \"/root/.ssh/authorized_keys (file attributes)\"\n        }\n    ], \n    \"backup\": \"\"\n}</font>', 40);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (184, '<font color=\'#FFFFFF\'>PLAY [172.16.50.223]*************************************</font>', 41);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (185, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.222\']]********************************</font>', 41);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (186, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 41);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (187, '<font color=\'green\'>ok: [172.16.50.222] => {\n    \"msg\": \"line added\", \n    \"diff\": [\n        {\n            \"after\": \"\", \n            \"before_header\": \"/root/.ssh/authorized_keys (content)\", \n            \"after_header\": \"/root/.ssh/authorized_keys (content)\", \n            \"before\": \"\"\n        }, \n        {\n            \"before_header\": \"/root/.ssh/authorized_keys (file attributes)\", \n            \"after_header\": \"/root/.ssh/authorized_keys (file attributes)\"\n        }\n    ], \n    \"backup\": \"\"\n}</font>', 41);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (188, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 41);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (189, '<font color=\'green\'>ok: [172.16.50.222 -> 172.16.50.223]</font>', 41);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (190, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 41);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (191, '<font color=\'yellow\'>172.16.50.222</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 41);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (192, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 42);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (193, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 42);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (194, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 42);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (195, '<font color=\'green\'>ok: [10.0.8.77] => {\n    \"msg\": \"line added\", \n    \"diff\": [\n        {\n            \"after\": \"\", \n            \"before_header\": \"/root/.ssh/authorized_keys (content)\", \n            \"after_header\": \"/root/.ssh/authorized_keys (content)\", \n            \"before\": \"\"\n        }, \n        {\n            \"before_header\": \"/root/.ssh/authorized_keys (file attributes)\", \n            \"after_header\": \"/root/.ssh/authorized_keys (file attributes)\"\n        }\n    ], \n    \"backup\": \"\"\n}</font>', 42);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (196, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 42);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (197, '<font color=\'#DC143C\'>fatal: [10.0.8.77]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: ssh: connect to host 10.0.8.72 port 22: Connection refused\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 42);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (198, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 42);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (199, '<font color=\'#DC143C\'>10.0.8.77</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=1</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 42);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (200, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 43);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (201, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 43);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (202, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 43);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (203, '<font color=\'green\'>ok: [10.0.8.77]</font>', 43);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (204, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 43);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (205, '<font color=\'#DC143C\'>fatal: [10.0.8.77]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: ssh: connect to host 10.0.8.72 port 22: Connection refused\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 43);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (206, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 43);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (207, '<font color=\'#DC143C\'>10.0.8.77</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 43);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (208, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 44);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (209, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 44);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (210, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 44);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (211, '<font color=\'green\'>ok: [10.0.8.77]</font>', 44);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (212, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 44);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (213, '<font color=\'#DC143C\'>fatal: [10.0.8.77]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: ssh: connect to host 10.0.8.72 port 22: Connection refused\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 44);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (214, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 44);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (215, '<font color=\'#DC143C\'>10.0.8.77</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 44);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (216, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 45);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (217, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 45);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (218, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 45);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (219, '<font color=\'green\'>ok: [10.0.8.77]</font>', 45);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (220, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 45);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (221, '<font color=\'#DC143C\'>fatal: [10.0.8.77]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: ssh: connect to host 10.0.8.72 port 22: Connection refused\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 45);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (222, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 45);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (223, '<font color=\'#DC143C\'>10.0.8.77</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 45);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (224, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 46);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (225, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 46);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (226, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 46);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (227, '<font color=\'green\'>ok: [10.0.8.77]</font>', 46);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (228, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 46);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (229, '<font color=\'#DC143C\'>fatal: [10.0.8.77]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: ssh: connect to host 10.0.8.72 port 22: Connection refused\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 46);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (230, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 46);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (231, '<font color=\'#DC143C\'>10.0.8.77</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 46);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (232, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 47);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (233, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 47);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (234, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 47);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (235, '<font color=\'green\'>ok: [10.0.8.77]</font>', 47);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (236, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 47);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (237, '<font color=\'#DC143C\'>fatal: [10.0.8.77]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: ssh: connect to host 10.0.8.72 port 22: Connection refused\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 47);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (238, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 47);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (239, '<font color=\'#DC143C\'>10.0.8.77</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 47);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (240, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 48);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (241, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 48);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (242, '<font color=\'#FFFFFF\'>\nTASK [auth]**********************************************</font>', 48);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (243, '<font color=\'green\'>ok: [10.0.8.77]</font>', 48);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (244, '<font color=\'#FFFFFF\'>\nTASK [transfile]*****************************************</font>', 48);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (245, '<font color=\'#DC143C\'>fatal: [10.0.8.77]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: ssh: connect to host 10.0.8.72 port 22: Connection refused\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 48);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (246, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 48);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (247, '<font color=\'#DC143C\'>10.0.8.77</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 48);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (248, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (249, '<font color=\'#FFFFFF\'>\nTASK [test-source-host-sshkey]***************************</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (250, '<font color=\'green\'>ok: [10.0.8.77]</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (251, '<font color=\'#FFFFFF\'>\nTASK [if-not-exist-sshkey-exit]**************************</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (252, '<font color=\'yellow\'>skipped: [10.0.8.77]</font>\n', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (253, '<font color=\'#FFFFFF\'>\nTASK [get-pub-key]***************************************</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (254, '<font color=\'green\'>ok: [10.0.8.77]</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (255, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (256, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (257, '<font color=\'yellow\'>10.0.8.77</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=1</font>	<font color=\'#FFFFFF\'>failed=0</font>', 49);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (258, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (259, '<font color=\'#FFFFFF\'>\nTASK [test-source-host-sshkey]***************************</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (260, '<font color=\'green\'>ok: [10.0.8.77]</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (261, '<font color=\'#FFFFFF\'>\nTASK [if-not-exist-sshkey-exit]**************************</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (262, '<font color=\'yellow\'>skipped: [10.0.8.77]</font>\n', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (263, '<font color=\'#FFFFFF\'>\nTASK [get-pub-key]***************************************</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (264, '<font color=\'green\'>ok: [10.0.8.77]</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (265, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (266, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (267, '<font color=\'yellow\'>10.0.8.77</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=1</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=1</font>	<font color=\'#FFFFFF\'>failed=0</font>', 50);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (268, '<font color=\'#FFFFFF\'>PLAY [[u\'10.0.8.77\']]************************************</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (269, '<font color=\'#FFFFFF\'>\nTASK [test-source-host-sshkey]***************************</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (270, '<font color=\'green\'>ok: [10.0.8.77]</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (271, '<font color=\'#FFFFFF\'>\nTASK [if-not-exist-sshkey-exit]**************************</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (272, '<font color=\'yellow\'>skipped: [10.0.8.77]</font>\n', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (273, '<font color=\'#FFFFFF\'>\nTASK [get-pub-key]***************************************</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (274, '<font color=\'green\'>ok: [10.0.8.77]</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (275, '<font color=\'#FFFFFF\'>PLAY [10.0.8.72]*****************************************</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (276, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (277, '<font color=\'yellow\'>10.0.8.77</font>		: <font color=\'green\'>ok=2</font>	<font color=\'yellow\'>changed=1</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=1</font>	<font color=\'#FFFFFF\'>failed=0</font>', 51);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (278, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 61);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (279, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 61);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (280, '<font color=\'green\'>ok: [172.16.50.213]</font>', 61);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (281, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 61);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (282, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"dest \'/usr/local/mysql\' must be an existing dir\", \"failed\": true, \"changed\": false, \"_ansible_no_log\": false}</font>', 61);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (283, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 61);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (284, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=1</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 61);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (285, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 62);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (286, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 62);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (287, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"_ansible_parsed\": true, \"src\": \"/root/.ansible/tmp/ansible-tmp-1548150850.79-242391395220786/source\", \"changed\": false, \"group\": \"root\", \"uid\": 0, \"failed\": true, \"dest\": \"/usr/local/\", \"_ansible_no_log\": false, \"msg\": \"Unexpected error when accessing exploded file: [Errno 2] \\u6ca1\\u6709\\u90a3\\u4e2a\\u6587\\u4ef6\\u6216\\u76ee\\u5f55: \'/usr/local/./mysql8_0_soft_install/\'\", \"state\": \"directory\", \"handler\": \"TgzArchive\", \"mode\": \"0755\", \"invocation\": {\"module_args\": {\"exclude\": [], \"directory_mode\": null, \"force\": null, \"remote_src\": false, \"follow\": false, \"owner\": \"mysql\", \"extra_opts\": [], \"group\": \"mysql\", \"unsafe_writes\": null, \"keep_newer\": false, \"setype\": null, \"content\": null, \"serole\": null, \"dest\": \"/usr/local/\", \"selevel\": null, \"original_basename\": \"mysql8_0_soft_install.tar.gz\", \"regexp\": null, \"copy\": true, \"src\": \"/root/.ansible/tmp/ansible-tmp-1548150850.79-242391395220786/source\", \"validate_certs\": true, \"list_files\": false, \"seuser\": null, \"creates\": null, \"delimiter\": null, \"mode\": null, \"attributes\": null, \"backup\": null}}, \"owner\": \"root\", \"gid\": 0, \"size\": 131}</font>', 62);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (288, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 62);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (289, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 62);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (290, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 63);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (291, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 63);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (292, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"_ansible_parsed\": true, \"src\": \"/root/.ansible/tmp/ansible-tmp-1548151097.6-153697759272003/source\", \"changed\": false, \"group\": \"root\", \"uid\": 0, \"failed\": true, \"dest\": \"/usr/local\", \"_ansible_no_log\": false, \"msg\": \"Unexpected error when accessing exploded file: [Errno 2] \\u6ca1\\u6709\\u90a3\\u4e2a\\u6587\\u4ef6\\u6216\\u76ee\\u5f55: \'/usr/local/./mysql8_0_soft_install/\'\", \"state\": \"directory\", \"handler\": \"TgzArchive\", \"mode\": \"0755\", \"invocation\": {\"module_args\": {\"exclude\": [], \"directory_mode\": null, \"force\": null, \"remote_src\": false, \"follow\": false, \"owner\": \"mysql\", \"extra_opts\": [], \"group\": \"mysql\", \"unsafe_writes\": null, \"keep_newer\": false, \"setype\": null, \"content\": null, \"serole\": null, \"dest\": \"/usr/local\", \"selevel\": null, \"original_basename\": \"mysql8_0_soft_install.tar.gz\", \"regexp\": null, \"copy\": true, \"src\": \"/root/.ansible/tmp/ansible-tmp-1548151097.6-153697759272003/source\", \"validate_certs\": true, \"list_files\": false, \"seuser\": null, \"creates\": null, \"delimiter\": null, \"mode\": null, \"attributes\": null, \"backup\": null}}, \"owner\": \"root\", \"gid\": 0, \"size\": 131}</font>', 63);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (293, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 63);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (294, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 63);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (295, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (296, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (297, '<font color=\'green\'>ok: [172.16.50.213]</font>', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (298, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (299, '<font color=\'green\'>ok: [172.16.50.213]</font>', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (300, '<font color=\'#FFFFFF\'>\nTASK [change owner to mysql user]************************</font>', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (301, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The conditional check \'mysql_package.find(\'tar\') != -1\' failed. The error was: error while evaluating conditional (mysql_package.find(\'tar\') != -1): \'mysql_package\' is undefined\\n\\nThe error appears to have been in \'/data/PycharmProject/roeops/upload/selfuse/mysql8_0_soft_install.yaml\': line 15, column 8, but may\\nbe elsewhere in the file depending on the exact syntax problem.\\n\\nThe offending line appears to be:\\n\\n\\n     - name: change owner to mysql user\\n       ^ here\\n\", \"failed\": true}</font>', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (302, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (303, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=2</font>	<font color=\'#FFFFFF\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 64);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (304, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 65);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (305, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 65);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (306, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"_ansible_parsed\": true, \"stderr_lines\": [\"useradd\\uff1a\\u7528\\u6237\\u201cmysql\\u201d\\u5df2\\u5b58\\u5728\"], \"cmd\": \"useradd mysql\", \"end\": \"2019-01-22 18:13:23.161377\", \"_ansible_no_log\": false, \"stdout\": \"\", \"changed\": true, \"rc\": 9, \"start\": \"2019-01-22 18:13:23.145085\", \"stderr\": \"useradd\\uff1a\\u7528\\u6237\\u201cmysql\\u201d\\u5df2\\u5b58\\u5728\", \"delta\": \"0:00:00.016292\", \"invocation\": {\"module_args\": {\"warn\": true, \"executable\": null, \"_uses_shell\": true, \"_raw_params\": \"useradd mysql\", \"removes\": null, \"creates\": null, \"chdir\": null}}, \"stdout_lines\": [], \"failed\": true}</font>', 65);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (307, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 65);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (308, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 65);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (309, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (310, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (311, '<font color=\'green\'>ok: [172.16.50.213]</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (312, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (313, '<font color=\'green\'>ok: [172.16.50.213]</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (314, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (315, '<font color=\'green\'>ok: [172.16.50.213]</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (316, '<font color=\'#FFFFFF\'>\nTASK [change owner to mysql user]************************</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (317, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The conditional check \'mysql_package.find(\'tar.gz\') != -1\' failed. The error was: error while evaluating conditional (mysql_package.find(\'tar.gz\') != -1): \'mysql_package\' is undefined\\n\\nThe error appears to have been in \'/data/PycharmProject/roeops/upload/selfuse/mysql8_0_soft_install.yaml\': line 25, column 8, but may\\nbe elsewhere in the file depending on the exact syntax problem.\\n\\nThe offending line appears to be:\\n\\n\\n     - name: change owner to mysql user\\n       ^ here\\n\", \"failed\": true}</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (318, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (319, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=3</font>	<font color=\'#FFFFFF\'>changed=1</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 67);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (320, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (321, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (322, '<font color=\'green\'>ok: [172.16.50.213]</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (323, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (324, '<font color=\'green\'>ok: [172.16.50.213]</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (325, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (326, '<font color=\'green\'>ok: [172.16.50.213]</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (327, '<font color=\'#FFFFFF\'>\nTASK [change owner to mysql user]************************</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (328, '<font color=\'green\'>ok: [172.16.50.213]</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (329, '<font color=\'#FFFFFF\'>\nTASK [stop firewalld]************************************</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (330, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The conditional check \'ansible_distribution_major_version == \\\"7\\\"\' failed. The error was: error while evaluating conditional (ansible_distribution_major_version == \\\"7\\\"): \'ansible_distribution_major_version\' is undefined\\n\\nThe error appears to have been in \'/data/PycharmProject/roeops/upload/selfuse/mysql8_0_soft_install.yaml\': line 32, column 8, but may\\nbe elsewhere in the file depending on the exact syntax problem.\\n\\nThe offending line appears to be:\\n\\n\\n     - name: stop firewalld\\n       ^ here\\n\", \"failed\": true}</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (331, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (332, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=4</font>	<font color=\'#FFFFFF\'>changed=1</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 68);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (333, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (334, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (335, '<font color=\'green\'>ok: [172.16.50.213]</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (336, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (337, '<font color=\'green\'>ok: [172.16.50.213]</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (338, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (339, '<font color=\'green\'>ok: [172.16.50.213]</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (340, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (341, '<font color=\'green\'>ok: [172.16.50.213]</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (342, '<font color=\'#FFFFFF\'>\nTASK [change owner to mysql user]************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (343, '<font color=\'green\'>ok: [172.16.50.213]</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (344, '<font color=\'#FFFFFF\'>\nTASK [stop firewalld]************************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (345, '<font color=\'green\'>ok: [172.16.50.213]</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (346, '<font color=\'#FFFFFF\'>\nTASK [stop iptables]*************************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (347, '<font color=\'yellow\'>skipped: [172.16.50.213]</font>\n', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (348, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (349, '<font color=\'green\'>ok: [172.16.50.213]</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (350, '<font color=\'#FFFFFF\'>\nTASK [config /etc/hosts]*********************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (351, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"Unable to find \'../template/hosts\' in expected paths.\", \"failed\": true, \"changed\": false, \"_ansible_no_log\": false}</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (352, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (353, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=7</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=1</font>	<font color=\'#DC143C\'>failed=1</font>', 69);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (354, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (355, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (356, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (357, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (358, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (359, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (360, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (361, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (362, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (363, '<font color=\'#FFFFFF\'>\nTASK [change owner to mysql user]************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (364, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (365, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (366, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (367, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (368, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (369, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (370, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (371, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (372, '<font color=\'green\'>ok: [172.16.50.213]</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (373, '<font color=\'#FFFFFF\'>\nTASK [Set sysctl file limiits]***************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (374, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The task includes an option with an undefined variable. The error was: \'item\' is undefined\\n\\nThe error appears to have been in \'/data/PycharmProject/roeops/upload/selfuse/mysql8_0_soft_install.yaml\': line 51, column 8, but may\\nbe elsewhere in the file depending on the exact syntax problem.\\n\\nThe offending line appears to be:\\n\\n\\n     - name: Set sysctl file limiits\\n       ^ here\\n\", \"failed\": true}</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (375, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (376, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=9</font>	<font color=\'#FFFFFF\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 70);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (377, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (378, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (379, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (380, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (381, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (382, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (383, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (384, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (385, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (386, '<font color=\'#FFFFFF\'>\nTASK [change owner to mysql user]************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (387, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (388, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (389, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (390, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (391, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (392, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (393, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (394, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (395, '<font color=\'green\'>ok: [172.16.50.213]</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (396, '<font color=\'#FFFFFF\'>\nTASK [Set sysctl file limits]****************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (397, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The task includes an option with an undefined variable. The error was: \'limit_item\' is undefined\\n\\nThe error appears to have been in \'/data/PycharmProject/roeops/upload/selfuse/mysql8_0_soft_install.yaml\': line 51, column 8, but may\\nbe elsewhere in the file depending on the exact syntax problem.\\n\\nThe offending line appears to be:\\n\\n\\n     - name: Set sysctl file limits\\n       ^ here\\n\", \"failed\": true}</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (398, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (399, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=9</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 71);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (400, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (401, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (402, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (403, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (404, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (405, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (406, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (407, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (408, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (409, '<font color=\'#FFFFFF\'>\nTASK [change owner to mysql user]************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (410, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (411, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (412, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (413, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (414, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (415, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (416, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (417, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (418, '<font color=\'green\'>ok: [172.16.50.213]</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (419, '<font color=\'#FFFFFF\'>\nTASK [add or modify nofile soft limit for the user mysql]', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (420, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\tsoft\\tnofile\\t65535\\n\"\n}</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (421, '<font color=\'#FFFFFF\'>\nTASK [add or modify hard nofile limit for user mysql]****</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (422, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"*\\thard\\tnofile\\t39693561\\n\"\n}</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (423, '<font color=\'#FFFFFF\'>\nTASK [Add or modify nproc, both soft and hard, limit for the user mysql with a comment.]', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (424, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\t-\\tnproc\\tunlimited\\t#\\t#unlimited memory lock for james\\n\"\n}</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (425, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (426, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=12</font>	<font color=\'yellow\'>changed=3</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 72);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (427, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 73);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (428, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 73);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (429, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: ssh: connect to host 172.16.50.213 port 22: No route to host\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 73);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (430, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 73);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (431, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 73);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (432, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 74);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (433, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 74);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (434, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: UNREACHABLE! => {\"msg\": \"Failed to connect to the host via ssh: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\\r\\n@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @\\r\\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\\r\\nIT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!\\r\\nSomeone could be eavesdropping on you right now (man-in-the-middle attack)!\\r\\nIt is also possible that a host key has just been changed.\\r\\nThe fingerprint for the ECDSA key sent by the remote host is\\nSHA256:jZR5iZqLhbWBTH4gAPKgdedRV+kSpc0xigHRgAhxo/4.\\r\\nPlease contact your system administrator.\\r\\nAdd correct host key in /root/.ssh/known_hosts to get rid of this message.\\r\\nOffending ECDSA key in /root/.ssh/known_hosts:44\\r\\nPassword authentication is disabled to avoid man-in-the-middle attacks.\\r\\nKeyboard-interactive authentication is disabled to avoid man-in-the-middle attacks.\\r\\nPermission denied (publickey,gssapi-keyex,gssapi-with-mic,password).\\r\\n\", \"unreachable\": true, \"changed\": false}</font>\n', 74);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (435, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 74);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (436, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#DC143C\'>unreachable=1</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 74);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (437, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (438, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (439, '<font color=\'green\'>ok: [172.16.50.213]</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (440, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (441, '<font color=\'green\'>ok: [172.16.50.213]</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (442, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (443, '<font color=\'green\'>ok: [172.16.50.213]</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (444, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (445, '<font color=\'green\'>ok: [172.16.50.213]</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (446, '<font color=\'#FFFFFF\'>\nTASK [change owner to mysql user]************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (447, '<font color=\'green\'>ok: [172.16.50.213]</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (448, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (449, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"state\": \"disabled\", \n    \"configfile\": \"/etc/selinux/config\", \n    \"policy\": \"targeted\", \n    \"msg\": \"runtime state temporarily changed from \'enforcing\' to \'permissive\', state change will take effect next reboot, config state changed from \'enforcing\' to \'disabled\'\"\n}</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (450, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (451, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"results\": [\n        \"Loaded plugins: fastestmirror, langpacks\\nLoading mirror speeds from cached hostfile\\n * base: mirrors.huaweicloud.com\\n * extras: mirrors.huaweicloud.com\\n * updates: mirrors.huaweicloud.com\\nResolving Dependencies\\n--> Running transaction check\\n---> Package libaio-devel.x86_64 0:0.3.109-13.el7 will be installed\\n--> Finished Dependency Resolution\\n\\nDependencies Resolved\\n\\n================================================================================\\n Package              Arch           Version                 Repository    Size\\n================================================================================\\nInstalling:\\n libaio-devel         x86_64         0.3.109-13.el7          base          13 k\\n\\nTransaction Summary\\n================================================================================\\nInstall  1 Package\\n\\nTotal download size: 13 k\\nInstalled size: 7.8 k\\nDownloading packages:\\nPublic key for libaio-devel-0.3.109-13.el7.x86_64.rpm is not installed\\nRetrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\\nRunning transaction check\\nRunning transaction test\\nTransaction test succeeded\\nRunning transaction\\n  Installing : libaio-devel-0.3.109-13.el7.x86_64                           1/1 \\n  Verifying  : libaio-devel-0.3.109-13.el7.x86_64                           1/1 \\n\\nInstalled:\\n  libaio-devel.x86_64 0:0.3.109-13.el7                                          \\n\\nComplete!\\n\"\n    ], \n    \"msg\": \"warning: /var/cache/yum/x86_64/7/base/packages/libaio-devel-0.3.109-13.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY\\nImporting GPG key 0xF4A80EB5:\\n Userid     : \\\"CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>\\\"\\n Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5\\n Package    : centos-release-7-5.1804.el7.centos.x86_64 (@anaconda)\\n From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\\n\", \n    \"rc\": 0\n}</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (452, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (453, '<font color=\'green\'>ok: [172.16.50.213]</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (454, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (455, '<font color=\'green\'>ok: [172.16.50.213]</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (456, '<font color=\'#FFFFFF\'>\nTASK [add or modify nofile soft limit for the user mysql]', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (457, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\tsoft\\tnofile\\t65535\\n\"\n}</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (458, '<font color=\'#FFFFFF\'>\nTASK [add or modify hard nofile limit for user mysql]****</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (459, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\thard\\tnofile\\t65535\\n\"\n}</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (460, '<font color=\'#FFFFFF\'>\nTASK [Add or modify nproc, both soft and hard, limit for the user mysql with a comment.]', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (461, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\t-\\tnproc\\tunlimited\\t#\\t#unlimited memory lock for james\\n\"\n}</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (462, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (463, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=12</font>	<font color=\'yellow\'>changed=11</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 75);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (464, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (465, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (466, '<font color=\'green\'>ok: [172.16.50.213]</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (467, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (468, '<font color=\'green\'>ok: [172.16.50.213]</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (469, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (470, '<font color=\'green\'>ok: [172.16.50.213]</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (471, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (472, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"Unable to find \'/data/soft/mysql/mysql8_0_14.tar.gz\' in expected paths.\", \"failed\": true, \"changed\": false, \"_ansible_no_log\": false}</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (473, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (474, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=3</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 76);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (475, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (476, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (477, '<font color=\'green\'>ok: [172.16.50.213]</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (478, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (479, '<font color=\'green\'>ok: [172.16.50.213]</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (480, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (481, '<font color=\'green\'>ok: [172.16.50.213]</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (482, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (483, '<font color=\'green\'>ok: [172.16.50.213]</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (484, '<font color=\'#FFFFFF\'>\nTASK [make link /usr/local/mysql-xx.yy.zz to /usr/local/mysql]', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (485, '<font color=\'green\'>ok: [172.16.50.213]</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (486, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (487, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"state\": \"disabled\", \n    \"configfile\": \"/etc/selinux/config\", \n    \"policy\": \"targeted\", \n    \"msg\": \"state change will take effect next reboot\"\n}</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (488, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (489, '<font color=\'green\'>ok: [172.16.50.213]</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (490, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (491, '<font color=\'green\'>ok: [172.16.50.213]</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (492, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (493, '<font color=\'green\'>ok: [172.16.50.213]</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (494, '<font color=\'#FFFFFF\'>\nTASK [add or modify nofile soft limit for the user mysql]', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (495, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\tsoft\\tnofile\\t65535\\n\"\n}</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (496, '<font color=\'#FFFFFF\'>\nTASK [add or modify hard nofile limit for user mysql]****</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (497, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\thard\\tnofile\\t65535\\n\"\n}</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (498, '<font color=\'#FFFFFF\'>\nTASK [Add or modify nproc, both soft and hard, limit for the user mysql with a comment.]', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (499, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\t-\\tnproc\\tunlimited\\t#\\t#unlimited memory lock for james\\n\"\n}</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (500, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (501, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=12</font>	<font color=\'yellow\'>changed=3</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 77);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (502, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (503, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (504, '<font color=\'green\'>ok: [172.16.50.213]</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (505, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (506, '<font color=\'green\'>ok: [172.16.50.213]</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (507, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (508, '<font color=\'green\'>ok: [172.16.50.213]</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (509, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (510, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"line added\", \n    \"diff\": [\n        {\n            \"after\": \"\", \n            \"before_header\": \"/etc/profile (content)\", \n            \"after_header\": \"/etc/profile (content)\", \n            \"before\": \"\"\n        }, \n        {\n            \"before_header\": \"/etc/profile (file attributes)\", \n            \"after_header\": \"/etc/profile (file attributes)\"\n        }\n    ], \n    \"backup\": \"\"\n}</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (511, '<font color=\'#FFFFFF\'>\nTASK [export path env to /root/.bashrc]******************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (512, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"line added\", \n    \"diff\": [\n        {\n            \"after\": \"\", \n            \"before_header\": \"/home/mysql/.bash_profile (content)\", \n            \"after_header\": \"/home/mysql/.bash_profile (content)\", \n            \"before\": \"\"\n        }, \n        {\n            \"before_header\": \"/home/mysql/.bash_profile (file attributes)\", \n            \"after_header\": \"/home/mysql/.bash_profile (file attributes)\"\n        }\n    ], \n    \"backup\": \"\"\n}</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (513, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (514, '<font color=\'green\'>ok: [172.16.50.213]</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (515, '<font color=\'#FFFFFF\'>\nTASK [make link /usr/local/mysql_8_0_14 to /usr/local/mysql]', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (516, '<font color=\'green\'>ok: [172.16.50.213]</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (517, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (518, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"state\": \"disabled\", \n    \"configfile\": \"/etc/selinux/config\", \n    \"policy\": \"targeted\", \n    \"msg\": \"state change will take effect next reboot\"\n}</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (519, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (520, '<font color=\'green\'>ok: [172.16.50.213]</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (521, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (522, '<font color=\'green\'>ok: [172.16.50.213]</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (523, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (524, '<font color=\'green\'>ok: [172.16.50.213]</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (525, '<font color=\'#FFFFFF\'>\nTASK [add or modify nofile soft limit for the user mysql]', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (526, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\tsoft\\tnofile\\t65535\\n\"\n}</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (527, '<font color=\'#FFFFFF\'>\nTASK [add or modify hard nofile limit for user mysql]****</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (528, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\thard\\tnofile\\t65535\\n\"\n}</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (529, '<font color=\'#FFFFFF\'>\nTASK [Add or modify nproc, both soft and hard, limit for the user mysql with a comment.]', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (530, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\t-\\tnproc\\tunlimited\\t#\\t#unlimited memory lock for james\\n\"\n}</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (531, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (532, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=14</font>	<font color=\'yellow\'>changed=3</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 78);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (533, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.214\']]********************************</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (534, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (535, '<font color=\'green\'>ok: [172.16.50.214]</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (536, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (537, '<font color=\'green\'>ok: [172.16.50.214]</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (538, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (539, '<font color=\'green\'>ok: [172.16.50.214]</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (540, '<font color=\'#FFFFFF\'>\nTASK [export path env to /home/mysql/.bash_profile]******</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (541, '<font color=\'green\'>ok: [172.16.50.214] => {\n    \"msg\": \"line added\", \n    \"diff\": [\n        {\n            \"after\": \"\", \n            \"before_header\": \"/home/mysql/.bash_profile (content)\", \n            \"after_header\": \"/home/mysql/.bash_profile (content)\", \n            \"before\": \"\"\n        }, \n        {\n            \"before_header\": \"/home/mysql/.bash_profile (file attributes)\", \n            \"after_header\": \"/home/mysql/.bash_profile (file attributes)\"\n        }\n    ], \n    \"backup\": \"\"\n}</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (542, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (543, '<font color=\'green\'>ok: [172.16.50.214]</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (544, '<font color=\'#FFFFFF\'>\nTASK [make link /usr/local/mysql_5_7_25 to /usr/local/mysql]', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (545, '<font color=\'#DC143C\'>fatal: [172.16.50.214]: FAILED! => {\"_ansible_parsed\": true, \"src\": \"/usr/local/mysql_8_0_25\", \"_ansible_no_log\": false, \"changed\": false, \"failed\": true, \"state\": \"absent\", \"invocation\": {\"module_args\": {\"directory_mode\": null, \"force\": false, \"remote_src\": null, \"path\": \"/usr/local/mysql\", \"owner\": \"mysql\", \"follow\": false, \"group\": \"mysql\", \"unsafe_writes\": null, \"state\": \"link\", \"content\": null, \"serole\": null, \"diff_peek\": null, \"setype\": null, \"dest\": \"/usr/local/mysql\", \"selevel\": null, \"original_basename\": null, \"regexp\": null, \"validate\": null, \"src\": \"/usr/local/mysql_8_0_25\", \"seuser\": null, \"recurse\": false, \"delimiter\": null, \"mode\": null, \"attributes\": null, \"backup\": null}}, \"path\": \"/usr/local/mysql\", \"msg\": \"src file does not exist, use \\\"force=yes\\\" if you really want to create the link: /usr/local/mysql_8_0_25\"}</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (546, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (547, '<font color=\'#DC143C\'>172.16.50.214</font>		: <font color=\'green\'>ok=5</font>	<font color=\'#FFFFFF\'>changed=4</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 79);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (548, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (549, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (550, '<font color=\'green\'>ok: [172.16.50.213]</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (551, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (552, '<font color=\'green\'>ok: [172.16.50.213]</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (553, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (554, '<font color=\'green\'>ok: [172.16.50.213]</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (555, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (556, '<font color=\'green\'>ok: [172.16.50.213]</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (557, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (558, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The conditional check \'mysql.find(\\\"\\\") !=-1\' failed. The error was: error while evaluating conditional (mysql.find(\\\"\\\") !=-1): \'mysql\' is undefined\\n\\nThe error appears to have been in \'/data/PycharmProject/roeops/upload/selfuse/mysql8_0_soft_install.yaml\': line 22, column 8, but may\\nbe elsewhere in the file depending on the exact syntax problem.\\n\\nThe offending line appears to be:\\n\\n         insertafter: EOF\\n     - name: check soft has been installed\\n       ^ here\\n\", \"failed\": true}</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (559, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (560, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=4</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 80);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (561, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (562, '<font color=\'#FFFFFF\'>\nTASK [Gathering Facts]***********************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (563, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (564, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (565, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (566, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (567, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (568, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (569, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (570, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (571, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (572, '<font color=\'#FFFFFF\'>\nTASK [export path env to /root/.bashrc]******************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (573, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (574, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (575, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (576, '<font color=\'#FFFFFF\'>\nTASK [make link /usr/local/mysql_8_0_14 to /usr/local/mysql]', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (577, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (578, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (579, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"state\": \"disabled\", \n    \"configfile\": \"/etc/selinux/config\", \n    \"policy\": \"targeted\", \n    \"msg\": \"state change will take effect next reboot\"\n}</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (580, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (581, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (582, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (583, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (584, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (585, '<font color=\'green\'>ok: [172.16.50.213]</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (586, '<font color=\'#FFFFFF\'>\nTASK [add or modify nofile soft limit for the user mysql]', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (587, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\tsoft\\tnofile\\t65535\\n\"\n}</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (588, '<font color=\'#FFFFFF\'>\nTASK [add or modify hard nofile limit for user mysql]****</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (589, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\thard\\tnofile\\t65535\\n\"\n}</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (590, '<font color=\'#FFFFFF\'>\nTASK [Add or modify nproc, both soft and hard, limit for the user mysql with a comment.]', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (591, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\t-\\tnproc\\tunlimited\\t#\\t#unlimited memory lock for james\\n\"\n}</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (592, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (593, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=15</font>	<font color=\'yellow\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 81);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (594, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (595, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (596, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (597, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (598, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (599, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (600, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (601, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (602, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (603, '<font color=\'#FFFFFF\'>\nTASK [export path env to /root/.bashrc]******************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (604, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (605, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (606, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (607, '<font color=\'#FFFFFF\'>\nTASK [make link /usr/local/mysql_8_0_14 to /usr/local/mysql]', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (608, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (609, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (610, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"state\": \"disabled\", \n    \"configfile\": \"/etc/selinux/config\", \n    \"policy\": \"targeted\", \n    \"msg\": \"state change will take effect next reboot\"\n}</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (611, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (612, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (613, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (614, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (615, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (616, '<font color=\'green\'>ok: [172.16.50.213]</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (617, '<font color=\'#FFFFFF\'>\nTASK [add or modify nofile soft limit for the user mysql]', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (618, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\tsoft\\tnofile\\t65535\\n\"\n}</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (619, '<font color=\'#FFFFFF\'>\nTASK [add or modify hard nofile limit for user mysql]****</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (620, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\thard\\tnofile\\t65535\\n\"\n}</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (621, '<font color=\'#FFFFFF\'>\nTASK [Add or modify nproc, both soft and hard, limit for the user mysql with a comment.]', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (622, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\t-\\tnproc\\tunlimited\\t#\\t#unlimited memory lock for james\\n\"\n}</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (623, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (624, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=14</font>	<font color=\'yellow\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 82);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (625, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (626, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (627, '<font color=\'green\'>ok: [172.16.50.213]</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (628, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (629, '<font color=\'green\'>ok: [172.16.50.213]</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (630, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (631, '<font color=\'green\'>ok: [172.16.50.213]</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (632, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (633, '<font color=\'green\'>ok: [172.16.50.213]</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (634, '<font color=\'#FFFFFF\'>\nTASK [export path env to /root/.bashrc]******************</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (635, '<font color=\'green\'>ok: [172.16.50.213]</font>', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (636, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 83);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (637, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.214\']]********************************</font>', 84);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (638, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 84);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (639, '<font color=\'green\'>ok: [172.16.50.214]</font>', 84);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (640, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 84);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (641, '<font color=\'green\'>ok: [172.16.50.214]</font>', 84);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (642, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 84);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (643, '<font color=\'green\'>ok: [172.16.50.214] => {\n    \"msg\": \"line added\", \n    \"diff\": [\n        {\n            \"after\": \"\", \n            \"before_header\": \"/etc/profile (content)\", \n            \"after_header\": \"/etc/profile (content)\", \n            \"before\": \"\"\n        }, \n        {\n            \"before_header\": \"/etc/profile (file attributes)\", \n            \"after_header\": \"/etc/profile (file attributes)\"\n        }\n    ], \n    \"backup\": \"\"\n}</font>', 84);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (644, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 84);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (645, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (646, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (647, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (648, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (649, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (650, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (651, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (652, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (653, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (654, '<font color=\'#FFFFFF\'>\nTASK [export path env to /root/.bashrc]******************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (655, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (656, '<font color=\'#FFFFFF\'>\nTASK [transfer mysql install package to remote host and unarchive]', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (657, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (658, '<font color=\'#FFFFFF\'>\nTASK [make link /usr/local/mysql_8_0_14 to /usr/local/mysql]', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (659, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (660, '<font color=\'#FFFFFF\'>\nTASK [disable selinux]***********************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (661, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"state\": \"disabled\", \n    \"configfile\": \"/etc/selinux/config\", \n    \"policy\": \"targeted\", \n    \"msg\": \"state change will take effect next reboot\"\n}</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (662, '<font color=\'#FFFFFF\'>\nTASK [install libaio-devel]******************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (663, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (664, '<font color=\'#FFFFFF\'>\nTASK [install numactl-devel]*****************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (665, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (666, '<font color=\'#FFFFFF\'>\nTASK [install perl-Data-Dumper]**************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (667, '<font color=\'green\'>ok: [172.16.50.213]</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (668, '<font color=\'#FFFFFF\'>\nTASK [add or modify nofile soft limit for the user mysql]', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (669, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\tsoft\\tnofile\\t65535\\n\"\n}</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (670, '<font color=\'#FFFFFF\'>\nTASK [add or modify hard nofile limit for user mysql]****</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (671, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\thard\\tnofile\\t65535\\n\"\n}</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (672, '<font color=\'#FFFFFF\'>\nTASK [Add or modify nproc, both soft and hard, limit for the user mysql with a comment.]', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (673, '<font color=\'green\'>ok: [172.16.50.213] => {\n    \"msg\": \"mysql\\t-\\tnproc\\tunlimited\\t#\\t#unlimited memory lock for james\\n\"\n}</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (674, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (675, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=14</font>	<font color=\'yellow\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 85);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (676, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (677, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (678, '<font color=\'green\'>ok: [172.16.50.213]</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (679, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (680, '<font color=\'green\'>ok: [172.16.50.213]</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (681, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (682, '<font color=\'green\'>ok: [172.16.50.213]</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (683, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (684, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 87);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (685, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 87);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (686, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 88);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (687, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 88);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (688, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The conditional check \'command_result.rc=\'/usr/local/mysql\'\' failed. The error was: template error while templating string: expected token \'end of statement block\', got \'=\'. String: {% if command_result.rc=\'/usr/local/mysql\' %} True {% else %} False {% endif %}\", \"failed\": true}</font>', 87);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (689, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The conditional check \'command_result=\'/usr/local/mysql\'\' failed. The error was: template error while templating string: expected token \'end of statement block\', got \'=\'. String: {% if command_result=\'/usr/local/mysql\' %} True {% else %} False {% endif %}\", \"failed\": true}</font>', 86);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (690, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 89);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (691, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 89);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (692, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 90);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (693, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 90);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (694, '<font color=\'green\'>ok: [172.16.50.213]</font>', 90);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (695, '<font color=\'#FFFFFF\'>\nTASK [stop exec when mysql exist]************************</font>', 90);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (696, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 91);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (697, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 91);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (698, '<font color=\'green\'>ok: [172.16.50.213]</font>', 91);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (699, '<font color=\'#FFFFFF\'>\nTASK [Append excu_result to tmp.txt]*********************</font>', 91);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (700, '<font color=\'green\'>ok: [172.16.50.213]</font>', 91);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (701, '<font color=\'#FFFFFF\'>\nTASK [stop exec when mysql exist]************************</font>', 91);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (702, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 92);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (703, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 92);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (704, '<font color=\'green\'>ok: [172.16.50.213]</font>', 92);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (705, '<font color=\'#FFFFFF\'>\nTASK [Append excu_result to tmp.txt]*********************</font>', 92);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (706, '<font color=\'green\'>ok: [172.16.50.213]</font>', 92);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (707, '<font color=\'#FFFFFF\'>\nTASK [stop exec when mysql exist]************************</font>', 92);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (708, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"msg\": \"The conditional check \'result|sucess\' failed. The error was: template error while templating string: no filter named \'sucess\'. String: {% if result|sucess %} True {% else %} False {% endif %}\\n\\nThe error appears to have been in \'/data/PycharmProject/roeops/upload/selfuse/mysql8_0_soft_install.yaml\': line 14, column 8, but may\\nbe elsewhere in the file depending on the exact syntax problem.\\n\\nThe offending line appears to be:\\n\\n\\n    # - name: stop exec when mysql exist\\n       ^ here\\n\", \"failed\": true}</font>', 92);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (711, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (712, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (713, '<font color=\'green\'>ok: [172.16.50.213]</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (714, '<font color=\'#FFFFFF\'>\nTASK [Append excu_result to tmp.txt]*********************</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (715, '<font color=\'green\'>ok: [172.16.50.213]</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (716, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (717, '<font color=\'green\'>ok: [172.16.50.213]</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (718, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (719, '<font color=\'green\'>ok: [172.16.50.213]</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (720, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (721, '<font color=\'green\'>ok: [172.16.50.213]</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (722, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (723, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=5</font>	<font color=\'yellow\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 93);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (724, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 94);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (725, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 94);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (726, '<font color=\'green\'>ok: [172.16.50.213]</font>', 94);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (727, '<font color=\'#FFFFFF\'>\nTASK [Append excu_result to tmp.txt]*********************</font>', 94);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (728, '<font color=\'green\'>ok: [172.16.50.213]</font>', 94);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (729, '<font color=\'#FFFFFF\'>\nTASK [stop exec when mysql exist]************************</font>', 94);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (730, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 95);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (731, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 95);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (732, '<font color=\'green\'>ok: [172.16.50.213]</font>', 95);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (733, '<font color=\'#FFFFFF\'>\nTASK [Append excu_result to tmp.txt]*********************</font>', 95);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (734, '<font color=\'green\'>ok: [172.16.50.213]</font>', 95);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (735, '<font color=\'#FFFFFF\'>\nTASK [stop exec when mysql exist]************************</font>', 95);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (736, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (737, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (738, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"_ansible_parsed\": true, \"stderr_lines\": [], \"cmd\": \"find /usr/local/mysql\", \"end\": \"2019-01-23 19:30:19.122980\", \"_ansible_no_log\": false, \"stdout\": \"/usr/local/mysql\", \"changed\": true, \"rc\": 0, \"start\": \"2019-01-23 19:30:19.110903\", \"stderr\": \"\", \"delta\": \"0:00:00.012077\", \"invocation\": {\"module_args\": {\"warn\": true, \"executable\": null, \"_uses_shell\": true, \"_raw_params\": \"find /usr/local/mysql\", \"removes\": null, \"creates\": null, \"chdir\": null}}, \"stdout_lines\": [\"/usr/local/mysql\"], \"failed_when_result\": true, \"failed\": true}</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (739, '<font color=\'#FFFFFF\'>\nTASK [Append excu_result to tmp.txt]*********************</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (740, '<font color=\'green\'>ok: [172.16.50.213]</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (741, '<font color=\'#FFFFFF\'>\nTASK [groupadd mysql]************************************</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (742, '<font color=\'green\'>ok: [172.16.50.213]</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (743, '<font color=\'#FFFFFF\'>\nTASK [useradd mysql]*************************************</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (744, '<font color=\'green\'>ok: [172.16.50.213]</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (745, '<font color=\'#FFFFFF\'>\nTASK [export path env variable]**************************</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (746, '<font color=\'green\'>ok: [172.16.50.213]</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (747, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (748, '<font color=\'yellow\'>172.16.50.213</font>		: <font color=\'green\'>ok=5</font>	<font color=\'yellow\'>changed=2</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#FFFFFF\'>failed=0</font>', 96);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (749, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 97);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (750, '<font color=\'#FFFFFF\'>\nTASK [check soft has been installed]*********************</font>', 97);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (751, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"_ansible_parsed\": true, \"stderr_lines\": [], \"cmd\": \"find /usr/local/mysql\", \"end\": \"2019-01-23 19:35:55.335182\", \"_ansible_no_log\": false, \"stdout\": \"/usr/local/mysql\", \"changed\": true, \"rc\": 0, \"start\": \"2019-01-23 19:35:55.325016\", \"stderr\": \"\", \"delta\": \"0:00:00.010166\", \"invocation\": {\"module_args\": {\"warn\": true, \"executable\": null, \"_uses_shell\": true, \"_raw_params\": \"find /usr/local/mysql\", \"removes\": null, \"creates\": null, \"chdir\": null}}, \"stdout_lines\": [\"/usr/local/mysql\"], \"failed_when_result\": true, \"failed\": true}</font>', 97);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (752, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 97);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (753, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 97);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (754, '<font color=\'#FFFFFF\'>PLAY [[u\'172.16.50.213\']]********************************</font>', 99);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (755, '<font color=\'#FFFFFF\'>\nTASK [if soft has been installed , throw faild and stop]*</font>', 99);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (756, '<font color=\'#DC143C\'>fatal: [172.16.50.213]: FAILED! => {\"_ansible_parsed\": true, \"stderr_lines\": [], \"cmd\": \"find /usr/local/mysql\", \"end\": \"2019-01-23 19:41:33.478163\", \"_ansible_no_log\": false, \"stdout\": \"/usr/local/mysql\", \"changed\": true, \"rc\": 0, \"start\": \"2019-01-23 19:41:32.465666\", \"stderr\": \"\", \"delta\": \"0:00:01.012497\", \"invocation\": {\"module_args\": {\"warn\": true, \"executable\": null, \"_uses_shell\": true, \"_raw_params\": \"find /usr/local/mysql\", \"removes\": null, \"creates\": null, \"chdir\": null}}, \"stdout_lines\": [\"/usr/local/mysql\"], \"failed_when_result\": true, \"failed\": true}</font>', 99);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (757, '<font color=\'#FFFFFF\'>\nPLAY RECAP *********************************************************************</font>', 99);
INSERT INTO `opscontrol_ansible_callback_playbook_result` VALUES (758, '<font color=\'#DC143C\'>172.16.50.213</font>		: <font color=\'green\'>ok=0</font>	<font color=\'#FFFFFF\'>changed=0</font>	<font color=\'#FFFFFF\'>unreachable=0</font>	<font color=\'#FFFFFF\'>skipped=0</font>	<font color=\'#DC143C\'>failed=1</font>', 99);

-- ----------------------------
-- Table structure for oracle_cluster
-- ----------------------------
DROP TABLE IF EXISTS `oracle_cluster`;
CREATE TABLE `oracle_cluster`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arch` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_version` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultdb` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tree_id_id` int(11) DEFAULT NULL,
  `operator_id` int(11) NOT NULL,
  `is_pooled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Oracle_Cluster_operator_id_18bf18b5_fk_auth_user_id`(`operator_id`) USING BTREE,
  INDEX `Oracle_Cluster_tree_id_id_10c449f5_fk_yewuTreeMptt_id`(`tree_id_id`) USING BTREE,
  CONSTRAINT `Oracle_Cluster_operator_id_18bf18b5_fk_auth_user_id` FOREIGN KEY (`operator_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Oracle_Cluster_tree_id_id_10c449f5_fk_yewuTreeMptt_id` FOREIGN KEY (`tree_id_id`) REFERENCES `yewutreemptt` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oracle_cluster
-- ----------------------------
INSERT INTO `oracle_cluster` VALUES (1, 'asdfa', '单机', '11.204', 'sdfads', 'sdfas', NULL, 3, 1);

-- ----------------------------
-- Table structure for oracle_instance
-- ----------------------------
DROP TABLE IF EXISTS `oracle_instance`;
CREATE TABLE `oracle_instance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbtag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vist_ip` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_ip` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_ip` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL,
  `sid` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idc` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memory` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dbcluster_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Oracle_Instance_dbcluster_id_e9d07bae_fk_Oracle_Cluster_id`(`dbcluster_id`) USING BTREE,
  CONSTRAINT `Oracle_Instance_dbcluster_id_e9d07bae_fk_Oracle_Cluster_id` FOREIGN KEY (`dbcluster_id`) REFERENCES `oracle_cluster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oracle_tablespace
-- ----------------------------
DROP TABLE IF EXISTS `oracle_tablespace`;
CREATE TABLE `oracle_tablespace`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablespace_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tablespace_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dbcluster_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Oracle_Tablespace_dbcluster_id_ee4a9f60_fk_Oracle_Cluster_id`(`dbcluster_id`) USING BTREE,
  CONSTRAINT `Oracle_Tablespace_dbcluster_id_ee4a9f60_fk_Oracle_Cluster_id` FOREIGN KEY (`dbcluster_id`) REFERENCES `oracle_cluster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oracle_user
-- ----------------------------
DROP TABLE IF EXISTS `oracle_user`;
CREATE TABLE `oracle_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privlige` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dbcluster_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Oracle_User_dbcluster_id_ccec03f1_fk_Oracle_Cluster_id`(`dbcluster_id`) USING BTREE,
  CONSTRAINT `Oracle_User_dbcluster_id_ccec03f1_fk_Oracle_Cluster_id` FOREIGN KEY (`dbcluster_id`) REFERENCES `oracle_cluster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_system
-- ----------------------------
DROP TABLE IF EXISTS `order_system`;
CREATE TABLE `order_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_user` smallint(6) NOT NULL,
  `order_subject` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_executor` smallint(6) NOT NULL,
  `order_status` int(11) NOT NULL,
  `order_level` int(11) DEFAULT NULL,
  `order_type` int(11) NOT NULL,
  `order_cancel` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` datetime(6) DEFAULT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opsmanage_order_system_order_subject_order_user_43930f38_uniq`(`order_subject`, `order_user`, `order_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project_assets
-- ----------------------------
DROP TABLE IF EXISTS `project_assets`;
CREATE TABLE `project_assets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_name`(`project_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_assets
-- ----------------------------
INSERT INTO `project_assets` VALUES (1, 'afsFD');
INSERT INTO `project_assets` VALUES (3, '运维开发系统');

-- ----------------------------
-- Table structure for project_config
-- ----------------------------
DROP TABLE IF EXISTS `project_config`;
CREATE TABLE `project_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_env` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_service` smallint(6) NOT NULL,
  `project_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_local_command` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_repo_dir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_dir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_exclude` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_repo_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_repo_passwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_repertory` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_status` smallint(6) DEFAULT NULL,
  `project_remote_command` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_model` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_audit_group` smallint(6) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opsmanage_project_config_project_env_project_id_p_920b7244_uniq`(`project_env`, `project_id`, `project_name`) USING BTREE,
  INDEX `opsmanage_project_co_project_id_3707c941_fk_opsmanage`(`project_id`) USING BTREE,
  CONSTRAINT `opsmanage_project_co_project_id_3707c941_fk_opsmanage` FOREIGN KEY (`project_id`) REFERENCES `project_assets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project_number
-- ----------------------------
DROP TABLE IF EXISTS `project_number`;
CREATE TABLE `project_number`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opsmanage_project_number_project_id_server_ed38fcb3_uniq`(`project_id`, `server`) USING BTREE,
  CONSTRAINT `opsmanage_project_nu_project_id_b1597eb7_fk_opsmanage` FOREIGN KEY (`project_id`) REFERENCES `project_config` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project_order
-- ----------------------------
DROP TABLE IF EXISTS `project_order`;
CREATE TABLE `project_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_branch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_comid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `order_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `opsmanage_project_or_order_project_id_9649620c_fk_opsmanage`(`order_project_id`) USING BTREE,
  CONSTRAINT `opsmanage_project_or_order_id_3b321f72_fk_opsmanage` FOREIGN KEY (`order_id`) REFERENCES `order_system` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `opsmanage_project_or_order_project_id_9649620c_fk_opsmanage` FOREIGN KEY (`order_project_id`) REFERENCES `project_config` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scan_conf_cmd
-- ----------------------------
DROP TABLE IF EXISTS `scan_conf_cmd`;
CREATE TABLE `scan_conf_cmd`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `syscmd` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scan_conf_ip
-- ----------------------------
DROP TABLE IF EXISTS `scan_conf_ip`;
CREATE TABLE `scan_conf_ip`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nets` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nets_pass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssh_pass` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `scan_conf_ip_nets_a636ce69_uniq`(`nets`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_conf_ip
-- ----------------------------
INSERT INTO `scan_conf_ip` VALUES (1, '172.16.50', '1,2,3,4,5,6,7,8,100,254', NULL, NULL, NULL);
INSERT INTO `scan_conf_ip` VALUES (2, '172.16.60', '1,2,3,4,5,6,10,254', NULL, NULL, NULL);
INSERT INTO `scan_conf_ip` VALUES (3, '10.0.40', '1,2,3,4,5,6,7,8,9,253,254', NULL, NULL, NULL);
INSERT INTO `scan_conf_ip` VALUES (13, '10.0.50', '1,2,3,4,5,6,7,8,9,253,254', NULL, NULL, NULL);
INSERT INTO `scan_conf_ip` VALUES (15, '10.0.60', '1,2,3,4,5,6,7,8,9,253,254', NULL, NULL, NULL);
INSERT INTO `scan_conf_ip` VALUES (17, '10.0.41', '1,2,3,4,5,6,7,8,9,253,254', NULL, NULL, NULL);
INSERT INTO `scan_conf_ip` VALUES (19, '10.0.52', '1,2,3,4,5,6,7,8,9,253,254', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for scan_conf_keyfile
-- ----------------------------
DROP TABLE IF EXISTS `scan_conf_keyfile`;
CREATE TABLE `scan_conf_keyfile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keys` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scan_conf_port
-- ----------------------------
DROP TABLE IF EXISTS `scan_conf_port`;
CREATE TABLE `scan_conf_port`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `port` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_conf_port
-- ----------------------------
INSERT INTO `scan_conf_port` VALUES (1, '6666,22');

-- ----------------------------
-- Table structure for scan_conf_sshpass
-- ----------------------------
DROP TABLE IF EXISTS `scan_conf_sshpass`;
CREATE TABLE `scan_conf_sshpass`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssh_pass` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_conf_sshpass
-- ----------------------------
INSERT INTO `scan_conf_sshpass` VALUES (1, '4GF2a5mr!GkU$njS,9oGlYkgDzhp5k6JZ,flc?!502');

-- ----------------------------
-- Table structure for scan_host_conf
-- ----------------------------
DROP TABLE IF EXISTS `scan_host_conf`;
CREATE TABLE `scan_host_conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nets` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nets_pass` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssh_pass` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keys` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beizhu` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nets`(`nets`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_host_conf
-- ----------------------------
INSERT INTO `scan_host_conf` VALUES (3, '10.0.40', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666,', '33333333333', '', '');
INSERT INTO `scan_host_conf` VALUES (5, '10.0.8', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666,', '433333333333333', '', '');
INSERT INTO `scan_host_conf` VALUES (7, '10.0.11', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '4999999999999', '', '');
INSERT INTO `scan_host_conf` VALUES (9, '10.0.32', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '4444444444444', '', '');
INSERT INTO `scan_host_conf` VALUES (11, '10.0.36', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '4G5555555555', '', '');
INSERT INTO `scan_host_conf` VALUES (13, '10.0.52', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '8888888888', '', '');
INSERT INTO `scan_host_conf` VALUES (15, '10.0.53', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '466666666666', '', '');
INSERT INTO `scan_host_conf` VALUES (17, '10.0.55', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '88888888', '', '');
INSERT INTO `scan_host_conf` VALUES (19, '10.0.56', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '77777777777', '', '');
INSERT INTO `scan_host_conf` VALUES (21, '10.0.57', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '7777777777S', '', '');
INSERT INTO `scan_host_conf` VALUES (23, '10.0.58', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '888888888', '', '');
INSERT INTO `scan_host_conf` VALUES (25, '10.0.59', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '4888888888888', '', '');
INSERT INTO `scan_host_conf` VALUES (27, '10.0.60', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,253,254', '6666', '1111111111', '', '');

-- ----------------------------
-- Table structure for server_command_record
-- ----------------------------
DROP TABLE IF EXISTS `server_command_record`;
CREATE TABLE `server_command_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `server` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `command` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `etime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `etime`(`etime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for service_assets
-- ----------------------------
DROP TABLE IF EXISTS `service_assets`;
CREATE TABLE `service_assets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opsmanage_service_assets_project_id_service_name_a2168d95_uniq`(`project_id`, `service_name`) USING BTREE,
  CONSTRAINT `opsmanage_service_as_project_id_285e5490_fk_opsmanage` FOREIGN KEY (`project_id`) REFERENCES `project_assets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_assets
-- ----------------------------
INSERT INTO `service_assets` VALUES (3, 'mysql代码审核', 3);
INSERT INTO `service_assets` VALUES (1, 'python', 3);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menus`;
CREATE TABLE `system_role_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `larrymenus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_role_menus_role_id_menus_id_d608e153_uniq`(`role_id`, `larrymenus_id`) USING BTREE,
  INDEX `system_role_menus_larrymenus_id_4251c4f0_fk_larryMenus_id`(`larrymenus_id`) USING BTREE,
  CONSTRAINT `system_role_menus_larrymenus_id_4251c4f0_fk_larryMenus_id` FOREIGN KEY (`larrymenus_id`) REFERENCES `larrymenus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `system_role_menus_role_id_037b2b49_fk_system_role_id` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `system_userprofile`;
CREATE TABLE `system_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `system_userprofile_user_id_bd3248f7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_userprofile_roles
-- ----------------------------
DROP TABLE IF EXISTS `system_userprofile_roles`;
CREATE TABLE `system_userprofile_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_userprofile_roles_userprofile_id_role_id_459e3bc3_uniq`(`userprofile_id`, `role_id`) USING BTREE,
  INDEX `system_userprofile_roles_role_id_cc2781b0_fk_system_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `system_userprofile_r_userprofile_id_0247f4f3_fk_system_us` FOREIGN KEY (`userprofile_id`) REFERENCES `system_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `system_userprofile_roles_role_id_cc2781b0_fk_system_role_id` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_auth
-- ----------------------------
DROP TABLE IF EXISTS `test_auth`;
CREATE TABLE `test_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_auth_book
-- ----------------------------
DROP TABLE IF EXISTS `test_auth_book`;
CREATE TABLE `test_auth_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `test_auth_book_auth_id_book_id_17ddc8a1_uniq`(`auth_id`, `book_id`) USING BTREE,
  INDEX `test_auth_book_book_id_aef96161_fk_test_book_id`(`book_id`) USING BTREE,
  CONSTRAINT `test_auth_book_auth_id_b56dc4c2_fk_test_auth_id` FOREIGN KEY (`auth_id`) REFERENCES `test_auth` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `test_auth_book_book_id_aef96161_fk_test_book_id` FOREIGN KEY (`book_id`) REFERENCES `test_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_book
-- ----------------------------
DROP TABLE IF EXISTS `test_book`;
CREATE TABLE `test_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `test_book_publisher_id_3bb0bade_fk_test_publisher_id`(`publisher_id`) USING BTREE,
  CONSTRAINT `test_book_publisher_id_3bb0bade_fk_test_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `test_publisher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_publisher
-- ----------------------------
DROP TABLE IF EXISTS `test_publisher`;
CREATE TABLE `test_publisher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `test_publisher_operator_id_be44a14a_fk_auth_user_id`(`operator_id`) USING BTREE,
  CONSTRAINT `test_publisher_operator_id_be44a14a_fk_auth_user_id` FOREIGN KEY (`operator_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_publisher
-- ----------------------------
INSERT INTO `test_publisher` VALUES (19, '撒旦法', '撒旦法', 3);
INSERT INTO `test_publisher` VALUES (39, 'bb1', 'b1', 1);
INSERT INTO `test_publisher` VALUES (47, 'dfad111111', 'sdfasdf', 5);
INSERT INTO `test_publisher` VALUES (71, '发送到发', '的神色发送', NULL);
INSERT INTO `test_publisher` VALUES (77, 'wqer', 'asdf', NULL);
INSERT INTO `test_publisher` VALUES (81, 'sdfasd111', 'asdfsad', NULL);
INSERT INTO `test_publisher` VALUES (83, 'aaaa', 'aaaa', 3);
INSERT INTO `test_publisher` VALUES (85, 'sadfasd', 'adsfasdf', 3);

-- ----------------------------
-- Table structure for uploadfiles
-- ----------------------------
DROP TABLE IF EXISTS `uploadfiles`;
CREATE TABLE `uploadfiles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `opsmanage_uploadfile_file_order_id_a89b038e_fk_opsmanage`(`file_order_id`) USING BTREE,
  CONSTRAINT `opsmanage_uploadfile_file_order_id_a89b038e_fk_opsmanage` FOREIGN KEY (`file_order_id`) REFERENCES `fileupload_audit_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_host
-- ----------------------------
DROP TABLE IF EXISTS `user_host`;
CREATE TABLE `user_host`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` smallint(6) NOT NULL,
  `user_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_host_host_id_user_id_71306e77_uniq`(`host_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userops_menus
-- ----------------------------
DROP TABLE IF EXISTS `userops_menus`;
CREATE TABLE `userops_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show` tinyint(1) NOT NULL,
  `spread` tinyint(1) NOT NULL,
  `href` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `target` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_copy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UserOps_menus_parent_id_71084a0b_fk_UserOps_menus_id`(`parent_id`) USING BTREE,
  CONSTRAINT `UserOps_menus_parent_id_71084a0b_fk_UserOps_menus_id` FOREIGN KEY (`parent_id`) REFERENCES `userops_menus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userops_menus
-- ----------------------------
INSERT INTO `userops_menus` VALUES (1, '资产管理', 1, 0, NULL, 1, '', NULL, NULL, -1);
INSERT INTO `userops_menus` VALUES (2, '主机资产', 1, 0, NULL, 80, NULL, NULL, 1, 1);
INSERT INTO `userops_menus` VALUES (3, 'DB资产', 1, 0, NULL, 80, NULL, NULL, 1, 1);
INSERT INTO `userops_menus` VALUES (5, 'oralce', 1, 0, NULL, 80, NULL, NULL, 3, 3);
INSERT INTO `userops_menus` VALUES (7, 'mongo', 1, 0, NULL, 70, NULL, NULL, 3, 3);
INSERT INTO `userops_menus` VALUES (9, 'mysql', 1, 0, NULL, 60, NULL, NULL, 3, 3);
INSERT INTO `userops_menus` VALUES (11, 'MySQL', 1, 0, NULL, 5, NULL, NULL, 63, 63);
INSERT INTO `userops_menus` VALUES (13, '部署', 1, 0, NULL, 80, NULL, NULL, 11, 11);
INSERT INTO `userops_menus` VALUES (15, '管理', 1, 0, NULL, 80, NULL, NULL, 11, 11);
INSERT INTO `userops_menus` VALUES (17, '执行', 1, 0, NULL, 80, NULL, NULL, 11, 11);
INSERT INTO `userops_menus` VALUES (19, 'Oracle', 1, 0, NULL, 6, NULL, NULL, 63, 63);
INSERT INTO `userops_menus` VALUES (21, '部署', 1, 0, NULL, 80, NULL, NULL, 19, 19);
INSERT INTO `userops_menus` VALUES (23, '管理', 1, 0, NULL, 80, NULL, NULL, 19, 19);
INSERT INTO `userops_menus` VALUES (25, '执行', 1, 0, NULL, 80, NULL, NULL, 19, 19);
INSERT INTO `userops_menus` VALUES (27, '工单', 1, 0, NULL, 9, NULL, NULL, NULL, -1);
INSERT INTO `userops_menus` VALUES (29, '代码上线', 1, 0, NULL, 90, NULL, NULL, 27, 27);
INSERT INTO `userops_menus` VALUES (31, 'mysql上线', 1, 0, NULL, 90, NULL, NULL, 27, 27);
INSERT INTO `userops_menus` VALUES (32, 'oracle上线', 1, 0, NULL, 80, NULL, NULL, 27, 27);
INSERT INTO `userops_menus` VALUES (33, '我的工单', 1, 0, NULL, 80, NULL, NULL, 27, 27);
INSERT INTO `userops_menus` VALUES (35, 'DDL', 1, 0, '/codinghard', 70, NULL, NULL, 31, 31);
INSERT INTO `userops_menus` VALUES (37, 'DML', 1, 0, '/codinghard', 70, NULL, NULL, 31, 31);
INSERT INTO `userops_menus` VALUES (39, 'DDL', 1, 0, '/codinghard', 70, NULL, NULL, 32, 32);
INSERT INTO `userops_menus` VALUES (41, 'DML', 1, 0, '/codinghard', 70, NULL, NULL, 32, 32);
INSERT INTO `userops_menus` VALUES (45, '系统配置', 1, 0, NULL, 20, NULL, NULL, NULL, -1);
INSERT INTO `userops_menus` VALUES (47, '用户中心', 1, 0, NULL, 80, NULL, NULL, 45, 45);
INSERT INTO `userops_menus` VALUES (49, '全局配置', 1, 0, NULL, 80, NULL, NULL, 45, 45);
INSERT INTO `userops_menus` VALUES (51, '环境部署', 1, 0, NULL, 2, NULL, NULL, NULL, -1);
INSERT INTO `userops_menus` VALUES (53, '中间件管理', 1, 0, NULL, 3, NULL, NULL, NULL, -1);
INSERT INTO `userops_menus` VALUES (55, '代码管理', 1, 0, NULL, 4, NULL, NULL, NULL, -1);
INSERT INTO `userops_menus` VALUES (57, 'Mongo', 1, 0, NULL, 7, NULL, NULL, 63, 63);
INSERT INTO `userops_menus` VALUES (59, 'redis', 1, 0, NULL, 8, NULL, NULL, 63, 63);
INSERT INTO `userops_menus` VALUES (61, 'wiki', 1, 0, NULL, 10, NULL, NULL, NULL, -1);
INSERT INTO `userops_menus` VALUES (63, 'DB管理', 1, 0, NULL, 6, NULL, NULL, NULL, -1);
INSERT INTO `userops_menus` VALUES (65, '业务树', 1, 0, '/cmdb/yewutree', 80, NULL, NULL, 1, 1);
INSERT INTO `userops_menus` VALUES (67, '菜单管理', 1, 0, '/system/menuops', 80, NULL, NULL, 45, 45);
INSERT INTO `userops_menus` VALUES (69, '网络资产', 1, 0, NULL, 81, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for userops_role
-- ----------------------------
DROP TABLE IF EXISTS `userops_role`;
CREATE TABLE `userops_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userops_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `userops_role_menus`;
CREATE TABLE `userops_role_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UserOps_role_menus_role_id_menus_id_411963d9_uniq`(`role_id`, `menus_id`) USING BTREE,
  INDEX `UserOps_role_menus_menus_id_06cd4461_fk_UserOps_menus_id`(`menus_id`) USING BTREE,
  CONSTRAINT `UserOps_role_menus_menus_id_06cd4461_fk_UserOps_menus_id` FOREIGN KEY (`menus_id`) REFERENCES `userops_menus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UserOps_role_menus_role_id_1db117eb_fk_UserOps_role_id` FOREIGN KEY (`role_id`) REFERENCES `userops_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userops_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `userops_userprofile`;
CREATE TABLE `userops_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `UserOps_userprofile_user_id_c0553c24_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userops_userprofile_roles
-- ----------------------------
DROP TABLE IF EXISTS `userops_userprofile_roles`;
CREATE TABLE `userops_userprofile_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UserOps_userprofile_roles_userprofile_id_role_id_4a7a0b18_uniq`(`userprofile_id`, `role_id`) USING BTREE,
  INDEX `UserOps_userprofile_roles_role_id_83b5bef1_fk_UserOps_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `UserOps_userprofile__userprofile_id_59484132_fk_UserOps_u` FOREIGN KEY (`userprofile_id`) REFERENCES `userops_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UserOps_userprofile_roles_role_id_83b5bef1_fk_UserOps_role_id` FOREIGN KEY (`role_id`) REFERENCES `userops_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wiki_category
-- ----------------------------
DROP TABLE IF EXISTS `wiki_category`;
CREATE TABLE `wiki_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wiki_category
-- ----------------------------
INSERT INTO `wiki_category` VALUES (1, 'mongo');
INSERT INTO `wiki_category` VALUES (3, '使用方法');

-- ----------------------------
-- Table structure for wiki_comment
-- ----------------------------
DROP TABLE IF EXISTS `wiki_comment`;
CREATE TABLE `wiki_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `opsmanage_wiki_comme_post_id_1989e45e_fk_opsmanage`(`post_id`) USING BTREE,
  CONSTRAINT `opsmanage_wiki_comme_post_id_1989e45e_fk_opsmanage` FOREIGN KEY (`post_id`) REFERENCES `wiki_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wiki_post
-- ----------------------------
DROP TABLE IF EXISTS `wiki_post`;
CREATE TABLE `wiki_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `opsmanage_wiki_post_author_id_d38d8ae4_fk_auth_user_id`(`author_id`) USING BTREE,
  INDEX `opsmanage_wiki_post_category_id_c60956a6_fk_opsmanage`(`category_id`) USING BTREE,
  CONSTRAINT `opsmanage_wiki_post_author_id_d38d8ae4_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `opsmanage_wiki_post_category_id_c60956a6_fk_opsmanage` FOREIGN KEY (`category_id`) REFERENCES `wiki_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wiki_post
-- ----------------------------
INSERT INTO `wiki_post` VALUES (1, '文档1', '<p>啥都没有的内容</p>\n', '2018-09-12 02:48:06.136986', '2018-09-12 02:48:06.137153', 1, 1);
INSERT INTO `wiki_post` VALUES (3, 'Celery任务调度使用方法', '<p><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAx8AAAMFCAIAAACai9wPAAAgAElEQVR4nO3d329j5334eV/032mRlFhgEyTAtNjCxjRpgm2FogmC9AeSKxa7bVCnVfb7HaD7XfSGNwvvTXnT70XT7V4YBtgChW7TBZw2dIrQJxrXcRJNpGNb4Yxl2QlNThTxe8Ff55CHpKR5pA9FvV4wUOnw4eHRzER693keHj335//b//4nf/hH/9d/+28/+MEPfvbh6RAAgAv72c9+9tZbb/3N3/zNV77ylb/4i7/4q7/6q+f+1//pk//9//5/zs/Po68NAOC2Oj8//8d//MevfOUrX//615/7yz//evT1AADceufn53/9139dr9efa7fb0RcDALAN2u32H//xHz/3/slJ9JUAAGyD995774tf/OJz0ZcBALA9fv/3f19dAQAk83u/93vqCgAgmd/93d9VVwAAyXz+859XVwAAyXzuc59TVwAAyXz2s59VVwAAyXzmM59RVwAAyagrAICUfvu3f1tdAQAkc//+fXUFAJCMugIASOmKddVt1Wu1Rmf+cKdRdRQA4O64Wl11W/VavdVdONxtNWqr+mrJ8y72glfptk6jdrUXBADujl/+8pc///nP5w6enp7+8pe/vMLZrlRXhSmqbqteW6nUNp1G8fNO40JPGq6Kq9I55p/WaVQcBAAoGAwGb7311ve+97333ntvevDx48ff/e53f/jDHz59+vSyJ7xCXZUmoFbORs0/OLdwWL2OWHHG6aHFHlveTmu7b+UsGwBwRzx58uS11177zne+873vfe/09HQ4SavvfOc7nU5ndORSLl9X0/mnTqNWa7QuVFdVs1SNzkXnrpYV3Kplv9m5qwpqVF5mtQCA4fn5+fHx8SiwOp3Oo0eP/uM//uM73/nOd7/73SdPnlzhhJetq+l803ix7hIrgwtTVRecu1q6VX5ZXRXbqduqzw0aX7FpKwBg5t133x0F1shrr712tbQaXrquSjFVb3UvsTI4iqTyzqsLv+Il6mrxikbzWPVWdzyhZc4KAJhzfn6e5/m0ro6Pj8/Pz692qqu/Z3A2hXWhWhnPQE3rat2k1/ik4yC61NxV1bjSkuTlvlgAYPt98MEHnU5nWlcPHz7s9XpXO9WV3zM4zppuq16rNxorSmkUM5PlveLcVXWZFRcCO41ardG47Mpg4eHFnipUncwCAIbD4fBnP/vZ97///VFXTRvr4cOHH3300RXOdsX3DE7LZFpXjc5wOOw0pv93upt9cqD8yPS5K+pq/PjkwEXeBFhr/Ot01Lp4mtWXpUIAuLs++uij/f39UVG9/fbbv/jFLw4ODkaf/ud//me/37/sCS9dV3O3nuq26qM3Dq6sq4owqre6y3NpsuhYLrN5F75VaHdyfQAAc05OTkbzVXmej24fenZ2NgqsTqdTvAnWBV22rspFVG+1JrdlWD13NXW5lcHqA8UHKuvqQrNc1gYBgJEPP/zw6OioeGf2X/ziFz/5yU8Wb+B+Ec/4W5xHgdRZVTMBdbXujAtXAgCQyrPVVeGmVxebuyq8fW/VvbJS1tWSUVf+lYcAAKtcqa5KWdToDNfV1Wx8o3Gjc1crbpZlLxYAcC2udDfRwt0YppvWN2nf1eTBFTurLrwjHgDgUp5hZXAWKFeoq+W/Y3BhdbD8y3fWP2l6a/aK6y3QVgDAdbh6XRVmoSpW2aYps3h8TdZcfO4KAGDz/NZv/dazvGcQAICSZ7wjAwAAJeoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkNL9+/efywEASOTevXvmrgAAknn++efVFQBAMuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXbITBYJDneZZlbeBmZVmW5/lgMIj+NgDbQ10RbzAY7O/vHxwcPH78+EPgZj1+/Pjg4GB/f19gQSrqinh5nh8cHPR6vX6/PwBuVr/f7/V6jx49yvM8+psBbAl1Rbwsy05OTs7Ozs7Pz6OvBe6c8/Pzs7Ozk5OTLMuirwW2hLoiXrvd7vf70VcBd1q/32+329FXAVtCXRGv3W4PbPiAUIPBQF1BKuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNTVLdBp1Gq1eqtb9Vi31eosDq7VGp2q0XNPrdeWn/gmqSsIp64gIXW1+Sa91BrV0IJCHo2HVitlVHfJyebSrNuqXyTUnlGCujre293Z2dnZ2WnOboeYNUufDodZc2d377ji2VmzPHB8vvLg473d0aCsuVMyferx3u78eeC2UFeQkLradOMMKibOqKHmo6dQVoWOmlbU4rGFahqfYTyy26rXavV6vd5qNa55guvidTUfNlMV1VTRUsd7u5V9NV9Xo3F78ycY51rpxKOnjg6pK24xdQUJqasNV7XQV1FX02GVs1cLaTaKpW6rPs2mSYWVk2t09Nonr64ydzWarFreMtPSmc5qVSbZXK41s2FxzitrznVb1pxW1/gF1BVbQl1BQupqo01nntbV1cKjy1YEK85dGWHjE9Vb3WGncd2Bdbm6GuXS3BTUfGwtTlytSJ/iEuJ8UGXN8Xln81uZumILqStISF1tsEL/XKSuSrnU6AyXLRZWPeX691atcom6utjS4LStpq1UqK3jvd2FDVU7s3mu3d25ua5mNqqv6bKiumIbqStISF1tslkdNTqrtqE3/rVUSaOhVZvdp8dWbmq/8bcRXnVXe9as3nFVWAycRlOxesqfZ81xUFXveJ97wdFqorpi66grSEhdbbJuq9HqLG59qpi7Wl1LhWZanOCae8W5MLsRl62ryQRWaSFw8V1/e1lp9JLZrqy5u7fXHM1NTftq1kkVe+OnKbW7d6yu2BbqChJSV5uuYmP5RfZdlQJp8dCyU2x6Xa3Yol4KrsK4aUTNLRGOsmh0m4XpnqriXvj5FcXpw8UZLHXFtlBXkJC62nSXq6vqO4QuPuG21tW8+Zmlcd/MdlIVR07eEFjatL43bqjCrvZCVlXF1XTcwiZ6dcUtpq4gIXW16S5eV5NFv4U2WjqbdUv3XRXCptBCVV0zvSdo1UpfOammzx4PON7b3Wk2S/fBKsRT1tzZaTbn79egrrjF1BUkpK423bSulgZRvdWtCKu5nVgVd1u4jXNXK268MNpeVV4ZHD1WmsmaPmNuIqqqirLKuCrexr18e1J1xS2mriAhdUW8C9ZV8VZU063qVXdTn/7OmsLtqkpDypu0phm1fFfXdIfV4t3eJzcYnd9oD7eLuoKE1BXx/BZnCKeuICF1RTx1BeHUFSR07949dUUwdQXh1BUkdP/+fXVFMHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiJelmWnp6fRVwF32unpaZa5owikoa6Il+f54eFh9FXAnXZ4eJjnefRVwJZQV8QbDAYPHz48Ojrq9XrR1wJ3Tq/XOzo62t/ft0APqagrNsJgMMjzPMuyNnCzsizL81xaQULqCgAgJXUFAJCSugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUbYTAYHB0dvf76623gZr3++utHR0eDwSD62wBsD3VFvMFg8P3vf/+NN9740Y9+9BPgZv3oRz964403vv/97wssSEVdEe/o6OiNN97I8/ydd955F7hZ77zzTp7nb7zxxuHhYfQ3A9gS6op4r7/++sHBQbfbffLkyXvAzXry5Em32z04OHj99dejvxnAllBXxGu32++88070jxi409555512ux39zQC2hLoiXrvdfvfdd6N/uMCd9u6776orSEVdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6ugU6jVqtVm91qx7rtlqdxcG1WqNTNXruqfXa8hPfJHUF4dQVJKSuNt+kl1qjGlpQyKPx0GqljOouOdlcmnVb9YuE2jO6ZF29+cqLOzMvvXrFHyZvvvJi5bOXHY/w5isvXuVS3nzlxZ0XX3nzGi5onVdfGv/ZLbuE6YBLnvRZvp7Zay559Qtd1KsvFf7VXe5q1p7/1ZeC/r6K1BUkpK423TiDiokzaqj56CmUVaGjphW1eGyhmsZnGI/stuq1Wr1er7dajWue4LpEXY3KqvCT6tWXrlpYb77y4s6LL74491Nt/DNUXT2jdHX15isv7rz00hWirMKV62puxNX/1S09vbqCraKuNlzVQl9FXU2HVc5eLaTZKJa6rfo0myYVVk6u0dFrn7y6cF1V/8gu/OR79aWdF195dTK3VRhamHiY/FAcneyVl0onfPWl8k/y0jzZZOSrL+28+MorL82fcNnw4suPnjd9RsVlvVdxstGZlpx86Zf25uzh0ScrX23+XNMxb77y4s5Lr8xdy9wXOz1Ynrt66aUX51/v1eo/3OVtMQ7M+QBa9new8qJGH7300vIBSy5qMb8qn1J6wuTP7MVX3pwOrvz3+ercV7H+r+l6qCtISF1ttOnM07q6Wnh02YpgxbkrI2x8onqrO+w0rjuwLlpXy+ZDZjM8ox9Ms9QaDS8+b/bx+KNXXypVUPFnYWmN8M1XXixVyvhZhTHLhhePFy9w/gd0xZc2+8qWnHzll1b4I1g2sqgwuDg7U5ounI0pXn3F0tvoWYt/SNVLh8snj4phstCrC6dfc1FL/n2sv6jC3+byK1xo2sWkXPL6hbmr9X9N10ZdQULqaoMV+ucidVXKpUZnuGyxsOop17+3apWL1tXSn8HTH07lEZOfTtU/pSZHC3k1+nDJy8zOUhqwKvmmAVS+pp2XXl1c9KtcBFy2Mlg6+bIv7dXSBrLL/qhesoOqFAqLl7Zs39XC0+bXwpasjc0VzpLZpFJNrrioJf8+LnRRVdN6i6esPrrkD630L6qirm6YuoKE1NUmm9VRo7NqG3rjX0uVNBpatdl9emzlpvYbfxth0roq/miamzMor0AVfrZOZxAqf0QXfq5epK7mhy+5ptJP62ULQQt1tXAtS7+0xTNWjVxUXH9cVVfVL1Kqq7kl0+IfbvmdCcsuq/zSpem7JX8Hqy9q1d/FRS9q7hWW1NDyulr273Mx4246stQVJKSuNlm31Wh1Frc+Vcxdra6lQjMtTnDNveJcmN2IpCuDlT+9ZuOqfi6++tL4Z+x8PI1/0M0tty2tq+rhq3+ir/+KS2uKC9ey9Eur2qy0OLLqkVVLeIunnMRAxRrbmrpaWw9VtVP841hfuBV/oWvq6qJJs3pe9Fnqau5rv7mtV+oKElJXm65iY/lF9l2VAmnx0LJTbHZdXWhXe+XKS9Xwcha99GphCqvyZ97auloyfMXK4IX6oqoL1vxML7125c/niu6a66GL1lX5ei6zMrguHOZ2WpUPXWB1tmK9cP3K4EX/tNY858org+tf+NqoK0hIXW26y9VV9R1CF59wS+tq7R0ZXi3sdV7yk375JuSF5xV/to1mQ9bVVeXwVbvap5e1PBAWu6Bw8rVfWnXNLZvUKu6nXrMyWDxFxZ/Bkr3wcwNKf3FzF1RZFtMzrd93VfUXU/x7XrbVvuqiFna1z81YzkZVZn55hXrh39nSfVc3GlfqClJSV5vu4nU1WfRbaKOls1m3bd/VWHnBaGGZquId96WnVL4ja37jS3k5bmf6vvoVP9mXDi8+8OIrr7xUTqqFDT6l6ypkzpKTr/3SSn218GrzPTL9U10yyVb5h1OxHerNV0r3cajMqKoTrFlxq170XFydrb6o0V/zKwv/PtZd1MID5YcqNnutmruq+Pc5H8wLf003QV1BQupq003ramkQ1VvdirCa24lVcbeFWzl3tcbN/j/7V7JsEYg7YKP/faorSEhdEW+762phIklc3Vmb+O9zSl1BQuqKeNtdV4FrPWyYzfz3OaauICF1Rbx0dQVckbqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0R7/XXXz88PIz+4QJ32uHh4euvvx79zQC2hLoi3uHh4ZtvulEBRPrBD35weHgY/c0AtoS6It5gMMiy7K233rI+CDfv3Xfffeutt7IsGwwG0d8MYEuoKzbCYDAYLUy0gZs1WpqXVpCQugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUAQErqCgAgJXXFRnj69Onbb7+dZVkbuFlZlr399ttPnz6N/jYA20NdEe/p06f7+/sHBwdPnjz5ELhZT548OTg42N/fF1iQyr1799QVwd5+++2Dg4Ner9fv9wfAzer3+71e7yc/+Ume59HfDGBLqCviZVn2/vvvn52dnZ+fR18L3Dnn5+dnZ2fvv/9+lmXR1wJbwsog8drtdr/fj74KuNP6/X673Y6+CtgS6op47XZ7MBhEXwXcaYPBQF1BKuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNTVZug0arV6q1s81G3Va7VardEpjxwdrre6ow/KD3catcJ5uq369JPyI53G7ImdRq1Co9Wqj57QaVRcRVrqCsKpK0hIXW2CcUiVI2ZJXU06qdPptErFVHhsUledRr1WKzRSvdWdvVjxidOC6k6aavbRptbV8d5uMyt8stPMhsNh1tzZ3TuuGjw6nDV3qlQ957JXs7PTrLoVY9ZcckGVw0cXmjWrLmnhORVf7OzrKz+SNZdcHoypK0hIXW2KTqNWb7U6s4pZWVelaabONJ06C701iaQVQ4a3s66KcTHrjnV1dbFGuazjvd2d3d0lfXW8t7v4AqvravzReEDWHA2de874vOVerPxKliRlkqxka6grSEhdbayKuiqFVaGQKtKper1vYf2vs2xgvdHY+Lqadsfx3m51OzSz+bSYTHDtzMrlmQtjerqlE0STPppZUVc7zb3C1zPqp4q6qjhDVSce7+3uVJZf1twxnXWXPHjwoPi/hAcPHswNUFeQkLqKN+2beqs7WySsCJ5RThX2W3Vb9VqjU1lXU9UnLNXS3BlvzdzVRDEq1s9dTccVcusZlPOscp6qymIbFROx/EhVXVWuRC5+8YUjo8wqLI8qq7sly7JiXS3+SkF1BQmpq82wPIsWu6bcUsuW/UrNVn6BuW1eo5Gjj2d1VX65jaurSR2tD4zhcDhXV9PnNpvPtjg2Fyyjayl1zyyZmtmqBbpSHk6/pvHHFXVV3Ufr1jhLV8PdM52+Wpy4GqorSEpdbYZL11Wt0WgsplPlpqplLzB5nW5r9g7CYngVZr2uN66uPHeVNXea2dJlwWJGlAdVTho1//+VJ5ovoaxZCrPyouDcqlvFIt6ylcFCB05bab6ujvd2d3abzcUTzNfV/B/NYmCKrTtlOn21OHE1VFeQlLraDJepq1n1TB5brKsVC4wVi42Ll3LdPVX2THW18MlcY0xCYmFWZ3Ez1GVeeHH1riLaFjbdlx6tfvXRZRXPN19XWbOZTT5Z1ZZVX7Fd7HfcgwcPKieuhuoKklJXm6HQR5PiWVpXsxXBimdXJlNx53pFUK1PsU2euxp/XPG2wULBTGeEltVIsp3tVS5VV+MrLFxQ5a72qhNU1dOq5cgEXze3TJZllRNXQ3UFSamrzTDrn2nIVNdVIZSmm89nQ6rqatJOs/cHrm6l2zh3VdgAVV5RK2zpTjl3VXkpaepqFFfFfVvVQXXRulr1kkn/BLjt1BUkpK42QqGA5o8t3JGhcEvQRmfuhu1zdTWdlFo8tLyebk9djYtm4dYCFXfUHNfVpdbRrnIt1Qr3Ol16163JwZ2dZjarpFIvPVNdVb2bUV1RoK4gIXW1GcpTUNNDqzKn6k2BtXJ9LX36ZPDk/YYXULkjPpGr1NUoZy56C/L4uau57eOVE0mluyeMa7Bw2Vetq/J02Nrh3FHqChJSV8S70h0ZSvdxWmr2nsKFurixuqq6N9XyfVfFJxXfnzj3Rcy2uK/42ivu3FD64zJzxYy6goTUFfH8FmcIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeFmWffDBB9FXAXfaBx98sOyX5ACXpa6I9/bbbx8eHkZfBdxpR0dHeZ5HXwVsCXVFvKdPnz58+DDP848++ij6WuDO+eijj/I839/ff/r0afS1wJZQV2yEp0+f5nmeZVkbuFlZluV5Lq0gIXUFAJCSugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUAQErqCgAgpXv37qkrAIBkzF0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldcVGGAwGeZ5nWdYGblaWZXmeDwaD6G8DsD3UFfEGg8H+/v7BwcHjx48/BG7W48ePDw4O9vf3BRakoq6Il+f5wcFBr9fr9/sD4Gb1+/1er/fo0aM8z6O/GcCWUFfEy7Ls5OTk7Ozs/Pw8+lrgzjk/Pz87Ozs5OcmyLPpaYEuoK+K12+1+vx99FXCn9fv9drsdfRWwJdQV8drt9sCGDwg1GAzUFaSiroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXW2Mbqteq9Vb3eGw06hVaHTGY6YHGpXjRiMnZ6y3usPhcHzOySfDTmM6aNmrtSaX02kUTnk91BWEU1eQkLraFJNwquiYUf9M66rRmYXY6lN2GvVardBI9VZ39kLF508Lanbm7i2oq+O93Z2R3b3j2eGsuTNVemAjZM2dnaZ7NrJx1BUkpK42wKSeOo1arV5vLYTMQl1Ngqc0lTVRrq5JJE3rqjyJVXyFW1ZXx3u700wpFkvx4+O93Y3rK3XFZlJXkJC62gCzelr3+Kiupot283NYhXKqXu+rWENcMrDeaGx2XZXDaZYsWbPYU8d7u1UpU5jdKj5afXg6Q1bqtNm82Wxs1tzZ3dtrrjrHTrPZLEVhxWXANXjw4MFOwYMHD+YGqCtISF1tgGk9VcxFNTqLddVozC3yrZi7qh5TrqXRkEZneKvmropmcTU/W1UxU1QcUvh4yZzX9PD80yaDCx9nzVmDFQ7Pz7KNPllyGXA9siwr1tXirxRUV5CQutoAc3U1KZlp1ixdGVx/0vJc1ji8psE1OkVx6qxiR9dm19VkUqjYRcWaqpi8qkyZZc+rXMebOzg9Yen49Ojc600GKSpu2nT6anHiaqiuICl1tQEuO3c1Xs5b+57Bhdeo3Ajf7bZm7yAshlfhaq43rhK8Z7CUMmvqqrAiV15anNfMlpfY/Db6FXVV0WKFqa7N3HrPVppOXy1OXA3VFSSlrjbApeeuxlNM9XqtVm91WvXpodGWrGX73RdV5da6XWDXIMEdGSYtc4GVweJTpvNeS8Zda11VXAZcrwcPHlROXA3VFSSlrjbA5eeuSvuvRm81HK3oTQZUvcDSoFqfYhs4d7VidW6urlbPDI3Ps2yd7vpWBi/wOpBalmWVE1dDdQVJqasNsGTuavHxQlVN7+DQaBTSaPRZ+QSFG2mNK2t1K92WuavSHFDhk7V3ZCgdLL3ZcHZ4Nqa8YX5xJ/v8rvbFuiodr97VLq6Ip64gIXW1AS50R4bZG/lKd1mfO1weMJ2Umk1Yrbhp6QWv5hpcdWVwzR0Ulm5pKo6Yu33DysOVC3rlOzJU1lXprg57pVxbeZ1wg9QVJKSuNsCSnqlYz1tZV61COM29LbD6FWe3Gb2A9beGvzq/CQfCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinhZlp2enkZfBdxpp6eny35JDnBZ6op4eZ4fHh5GXwXcaYeHh3meR18FbAl1RbzBYPDw4cOjo6Nerxd9LXDn9Hq9o6Oj/f19C/SQirpiIwwGgzzPsyxrAzcry7I8z6UVJKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXbERBoNBnudZlrWBm5VlWZ7ng8Eg+tsAbA91RbzBYLC/v39wcPD48eMPgZv1+PHjg4OD/f19gQWpqCvi5Xl+cHDQ6/X6/f4AuFn9fr/X6z169CjP8+hvBrAl1BXxsiw7OTk5Ozs7Pz+Pvha4c87Pz8/Ozk5OTrIsi74W2BLqinjtdrvf70dfBdxp/X6/3W5HXwVsCXVFvHa7PbDhA0INBgN1BamoK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSVxum06iN1FutRq1Wq7e6cw/XW93RqEZn2G3Va43O5GnFsdPzFM0GdFv10RmWXUHlQ9dFXUE4dQUJqauNMe2hUdh0W416fdpF49iZRNG4rqYhtBBXw9Lw8oF6q1t8ZPThGovnTumidXW8t7uzs7Ozs7t3nDV3dnZ2dnaa7n4ISagrSEhdbYR1hVOvt8aJ1GnUGq1uq1Gr1RqtTqNeb3UXJ6rGLTQ6azGMqupq3gbPXR3v7e7s7h1PPs2a6gpSUVeQkLraNKvipjLCxkuIs3moSU4tLA42OtV1VbmKeHMzV+oKNoC6goTUVbwLLc3NEmc6vLRaWJtNYk1WFuvzz1lWV2XmruAuUleQkLraGJNqKnTNKHQWN6s3GhWzTeNN7uPhhc4q7L+qqKu1E1ez018bdQXh1BUkpK42wnQ+qt7qljurODM17DSme9lLb/+r12lnYn8AACAASURBVEfR1GkURk7fW1ir1+vFsy2duxqH1uRss9Nf88KguoJ46goSUlfxFmeP5ueJSm8VrFowHFVTqYqGw+Gw2+1OnjI6vqKuKhcYJ513zX2lriCcuoKE1NUmKu7EKodNsYqKG6QqlhWLTyjtv6qoq9kLjkeWOu7a92CpKwinriAhdbUhSjmzdKqosILYKd9uYe5uWaWzVpxu8X5XxbuXFi7mRna3qysIp64gIXW1sZZNYBU7rHhLhUlwTYNoaVoNi/d2H+3lGi68dXG2bcvcFdwB6goSUlebYMl9rAp3Ae2W1usWlu9mY4u/I6eii4ppNtddpf3zi0/xnkHYauoKElJXxFNXEE5dQULqinh+zyCEU1eQkLoi3kXrCrg26goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUW8LMtOT0+jrwLutNPT0yzzHlxIQ10RL8/zw8PD6KuAO+3w8DDP8+irgC2hrog3GAwePnx4dHTU6/WirwXunF6vd3R0tL+/b4EeUlFXbITBYJDneZZlbeBmZVmW57m0goTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSs2wmAwyPM8y7I2cLOyLMvzfDAYRH8bgO2hrog3GAz29/cPDg4eP378IXCzHj9+fHBwsL+/L7AgFXVFvDzPDw4Oer1ev98fADer3+/3er1Hjx7leR79zQC2hLoiXpZlJycnZ2dn5+fn0dcCd875+fnZ2dnJyUmWZdHXAltCXRGv3W73+/3oq4A7rd/vt9vt6KuALaGuiNdutwc2fECowWCgriAVdUU8dQXh1BUkpK6Ip64gnLqChO7du6euCKauIJy6goSef/55dUUwdQXh1BUkpK6Ip64gnLqChNTVhuk0aiP1VqtRq9Xqre7cw/VWdzSq0Rl2W/VaozN52tzYitM2OitfvNuqjwetO19a6grCqStISF1tjGlXjRKo22rU67Va6dg0f8Z1NXpKo7M+hkZPXNdLt6KusubOzs7O7t7xtV4S3DXqChJSVxthHD9L1eut8axTp1FrtLqtRq1Wa7Q6jXq91S2E2XTeqzt/qNoo2taPXTPn9awuUVfHe7vKCq6BuoKE1NWmmc5HVaiMsPESYqMzGTALrhWTT7NpqsLYirmr4rhrc4m6ypo7O02/rQOSU1eQkLqKt27iajYhVR5eWi0sNNWFNmKpK6BIXUFC6mpjTKqpUDKjeaxiI41nthoVa3njTe7lpFpSbuXsuk0rg+oKroe6goTU1UaYRlC91S13Vmk7eqcx3cs+66Nuq16v16ebrZbNV61YcbxFc1fiCq6JuoKE1FW8xamj+ZgpvVWwahpqNGlVn5+5WnyVW11XWdOGdrgu6goSUlebqLieV86lhe1S0/s3lJcVL/aWwWXFVuU6b89g7grCqStISF1tiFLkLC2Zwgpip1Uvjpy7W9ayF1g5CTXbEz+8mTmrCfuuIJy6goTU1cZaNoFV7LBx/YzX8UbBtSSJVtbV+Jz1VnfY7S681LXfVVRdQTh1BQmpq02w5D5Ws6YZJ88krMYPzTprNrY4/zQsD6qOq/WTVNc/jXXJu4mqK0hPXUFC6op46grCqStISF0Rz+8ZhHDqChJSV8S7VF0B10FdQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64goXv37qkrgqkrCKeuIKEXXnhBXRFMXUE4dQUJqSviqSsIp64gofv376srgj1jXU3uMPqsvyXneG939X20rnor0+oLm71c1tzZ3Tte//rFE7rhF4mpK0hIXRFvQ+rqwi+U7mxXqSu3U+VaqCtISF0RL1FdHe/tjptjFCA7Ozul3JoenR473tvd3dtrjg9O62Z0wrnhx3u7489HLzL7fG3pFLNvetbdZnOuroZZczRsaSaOw2r2TEhGXUFC6op4z7rvKmtOomgcWdP2mH1cmimatMvx3m6hjUp1NT1+vLdbDKzxM+eDaeWU1nRA1iyfdnZt44fXNFO2N/e1QDLqChJSV8RLu6u9sj2qg6R8tFRXhcHTOFpSV2tNBpefdPVGUldcA3UFCakr4qV+z+Bs9W2aIOs2lpc+m9tfVXl8tjC4PrLGLz4fRVfem66uuAbqChJSV8S7njsyTPtn+Y73Z6irsUnIrYwddcUtoK4gIXVFvOu839WSshm5+srgitMsvQYrg2wydQUJqSviXeO+q1IZzd5RWNhavqSuSjvfC8Mr9l2tjZ2qiyjtnH+WrxDSUFeQkLoiXuq5q8LNEubnoMrHVs1dNZuLG6vGJ56+/6/itg9VKu/I0Nxb2kjrtswvm1uDZ6CuICF1RbxN+004t25uKGuqK56VuoKE1BXx1NUzmdwuC56FuoKE1BXxtqKuisuRJcqHW0FdQULqinibVldwB6krSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8R7xrqa/Pq/yW+ESXkz0PlzX/gJcMuoK0hIXRFva+qq+HsI4XZRV5CQuiJeoro63tud/RLmSV3NftlyKbgKv9F5bxZOhd/MPD4yf+6lmTUJq6ZfqcztpK4gIXVFvGfdd5U1J1XVzIbFusqas6gqfHy8tzsXVPNTXsVTlM691PHeXjY5n7riFlJXkJC6Il7iXe2TNJpfISyuHM4CaJpaaRYU1RW3lLqChNQV8a6pruZDp7CHqiq6SsuFV44sdcUtpa4gIXVFvE2pq9mwnStvTldX3FLqChJSV8TbjJXBsqtWkrrillJXkJC6It411dUz7Gq/eiSpK24pdQUJqSviXVtdDS94R4Zida3ZerWuntQVt5S6goTUFfFifxPO3DYsuJvUFSSkroh3w3VVmttKeWN3uMXUFSSkroh343NXF1kChLtFXUFC6op4sSuDwFBdQVLqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiLexepqfJMqv2YGroO6goTUFfEuMXfl19bA9VBXkJC6It7l6srsFVwDdQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiHeZ9wzKK7gW6goSUlfEu+QdGY73dgUWJKauICF1RTxzVxBOXUFC6op49l1BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroh38bo63tt1r3a4DuoKElJXxPN7BiGcuoKE1BXxLnlHBiA9dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSR07949dUUwdQXh1BUk9Pzzz6srgqkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQndu3dPXRFMXUE4dQUJ3b9/X10RTF1BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUFsb761a+qK0hIXRFPXUGgr371q0NzV5CUuiKeuoIoo7QaqitISl0RT11BiGlaDdUVJKWuiKeu4OYV08q+K0hLXRFPXcENm0urobkrSEpdES/LstPT0+irgLtiMa2Gw+Hp6WmWZUFXBNtGXREvz/PDw8Poq4A7oTKthsPh4eFhnucRVwRbSF0RbzAYPHz48OjoqNfrRV8L3Dm9Xu/o6Gh/f98CPaSirtgIg8Egz/Msy9rAzcqyLM9zaQUJqSsAgJTUFQBASvfu3VNXAADJmLsCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKzbCYDDI8zzLsjZws7Isy/N8MBhEfxuA7aGuiDcYDPb39w8ODh4/fvwhcLMeP358cHCwv78vsCAVdUW8PM8PDg56vV6/3x8AN6vf7/d6vUePHuV5Hv3NALaEuiJelmUnJydnZ2fn5+fR1wJ3zvn5+dnZ2cnJSZZl0dcCW0JdEa/dbvf7/eirgDut3++32+3oq4Atoa6I1263BzZ8QKjBYKCuIBV1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqakt1W/VaUaMzO1pvdQsjO43aotmQ0VNGT78u6grCqStISF1tqW6rPmqkUlBV1dVseLGh5p6/PXV1vLe7s7t3XPpoyQC4S9QVJKSuttS0jjqNQk8tq6vF41tbVzPqCgrUFSSkrrbUpI5KcbWsrhYWBxudTa2r473dnalJBB3v7e4096aPzNooa07HNrPZCQpzV83m7tIB1SeA7aSuICF1taXGddQqxdUko8qtNA2p6SebWlfHe7vlCip00vSBrDk+XMykqvXA0bPGI2anng3ImkuaC7aQuoKE1NWWmtRRKY4mW91Lk1edRqGepsM3sq7Klu2gmkRRdRAt3Xc1/7Tjvd3SfNX857Bd1BUkpK621GxCqrA2OF0BLMRSpzHbnlWr1ycptcl1VViuW1VXhYGFiCrXVSGXilW1u3dcfBWrg9wB6goSUldbalZXszwaHWs06ou11O12J+k1CrHNrKtx8VSt8VXV1ch0q9bcwt8F6kpNcXeoK0hIXW2p8v2uGp3hbAmwtM9q/hml/VebVldZc/ks1PK6Kh+91MqgnVbcHeoKElJXW2o+oUqRVNpqNZwdutCdsK7BJepq2k2jaawL77uaPnV+V/v8Xvi5Xe3TE4gttpy6goTU1ZaqeCPgwu2sps20NK2Gw/L9sq7JxfddzTZD7e4dV747sNhgxds3VL97sHAfh6p3B1adALaTuoKE1NWWKtTVkj4qLRQuTk4V74F1zXHlN+FAPHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXREvy7LT09Poq4A77fT0NMv8Zk1IQ10RL8/zw8PD6KuAO+3w8DDP8+irgC2hrog3GAwePnx4dHTU6/WirwXunF6vd3R0tL+/b4EeUvmVX/kVdUW8wWCQ53mWZW3gZmVZlue5tIKE7t27p64AAJJ54YUX1BUAQDLqCgAgJXUFAJCSugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAQCkpK4AAFJSV2yEwWCQ53mWZW3gZmVZluf5YDCI/jYA20NdEW8wGOzv7x8cHDx+/PhD4GY9fvz44OBgf39fYEEq6op4eZ4fHBz0er1+vz8Abla/3+/1eo8ePcrzPPqbAWwJdUW8LMtOTk7Ozs7Oz8+jrwXunPPz87Ozs5OTkyzLoq8FtoS6Il673e73+9FXAXdav99vt9vRVwFbQl0Rr91uD2z4gFCDwUBdQSrqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTU1UboNGr1Vrf6gVqt1uiUD4w+7zRqtVq91R0Pmqo+0+rTDrut+viZc2cbK45NTl1BOHUFCamrDdBt1ZcVTDmDKsOn3mpNi2vWSJNzVufRQl1d+BKuxWXq6o3W30603qg8/Lff/NZ8Xr7RKhwsDl36jEuec5nut75Zusw151w1pPutb86Ol845XDfk6i+67MtgC6krSEhdbYhOq9XtdFrzTbTQR0vnrirranaw1mhUp1l3Uk+dRq1Wr7cWKmqT6uqN1uxnf/db35x+/EZrVhPF49MHl1ZF91vfXNIqVz9n6dwLmbP0nCuHlEYXx5RfrmrI1V902ZfBVlJXkJC62mzVK4Nzy4BVK4OLdbVs7mpdPW1QXc1VxXT2qDyNVJhoGUdQq1XZFKva6urnnJ34b/+21Spd8dJzrn3ZubHTUXP9dZk/nHJ/VV9X9ZfBdlJXkJC6ijeNo9GGqdIerIvvu1o7d9XptuqTE1fW1cJi4mjEBtVV2bQs5mdbZt3wxrfmG6Skeg6ofPLLnnPy9G/NJ8yqc6592bmhVS++ZMgzvOiSL4Mtpa4gIXW1EUZhU5yHGtfMxeeu1u67Gq0MTgtuWV2V9nhtcl3NpljmJ4EWJoWqS2hlH13xnPMW6mrlOZcPmd/kVbHpa8mQZ3jRJV8GW0pdQULqaiPM6mrWRYU38KWZuxqfbNZwt3nuan6n0OVLaN3kk7pa8mWwpdQVJKSuNkKxrobDYadROXdVkT+1Wq3eaJQPL993NT7BaAf7LZ67miubtYtfVSW0bPP2+P12lzxn4S13C7vfb/HK4IonsXXUFSSkrjbCXF2tOt5t1afRVFjmK8x7rdrV3mnU6q1Ot3V756663/rmwpv15qZtFiZ2KmJk7dTTFc5ZfZalu9or7+mwZMjcdFLVhvhlQ67+osu+DLaTuoKE1NVGmKuocucs3PSzcCOFwh0Vpg9f9T2DFePmx16TS92RoerH/JqbDlQcWt8Llz/nmpOsP+eKIYF3ZFj6gmwXdQUJqasNMNupvuY269OVvbmnlQ+tv5toKeYudEeGC9z//RlcsK5KN8ss3zOz9NAFtlhdpI0ue84q81my+pwrh5RuglqdQpVDlp1xYdFyxXWpq7tAXUFC6ire9BYM1fuq5pfpSlvcZ8emTy6ea27uqvSGw/IN4JdMWV0o+p6Z34QD4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUW8LMtOT0+jrwLutNPT0yzLoq8CtoS6Il6e54eHh9FXAXfa4eFhnufRVwFbQl0RbzAYPHz48OjoqNfrRV8L3Dm9Xu/o6Gh/f98CPaSirtgIg8Egz/Msy9rAzcqyLM9zaQUJqSsAgJTUFQBASvfu3VNXAADJqCsAgJTu37+vrgAAklFXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFRthMBjkeZ5lWRu4WVmW5Xk+GAyivw3A9lBXxBsMBvv7+wcHB48fP/4QuFmPHz8+ODjY398XWJCKuiJenucHBwe9Xq/f7w+Am9Xv93u93qNHj/I8j/5mAFtCXREvy7KTk5Ozs7Pz8/Poa4E75/z8/Ozs7OTkJMuy6GuBLaGuiNdut/v9fvRVwJ3W7/fb7Xb0VcCWUFfEa7fbAxs+INRgMFBXkIq6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1tRm6rXpthXqrOxwOh8NOY9WoiUZnfMLy0xqd8Yt1GsXPhp1G8bPqq6p+PBV1BeHUFSSkrjbDqGOqGqbTKNRV1ZOqH+x2u1UpVm9151+q2+1Mjsw/o/pl07tKXR3v7e7uHU8+y5o7hc/Kjx3v7e7sNKvvkpg1d8aWDIC7Ql1BQupqM1xw7qp6fKO1tM1GdTZ6+uijTumVJifutuqlE4zOv8l1NYqm3b1sb3enYHfveDjMmoW4GsmaOzvN7Lg8WFPBlLqChNTVZrj43NV0fqne6k6W/Frd7vSB0Tm6rfr4o/J8VL1eLzy13uoOu6365PQr1x2vc23wqiuDWXNnt9ncnTbSeM5qNiG1s7OQWRPHe7vaijvkwYMHxf/H4sGDB3MD1BUkpK42w8Xmrub2T1UcmOyp6nYahdW+2dzVLJWmddVtLZzkFsxdZc1xGx0vzF1N1gXHQ7JmZWOpK+6WLMuK/0tZ/JWC6goSUlfba9RPrbm5q0ajUZ8sEC7b534L6mo0QdXMSpV0vLe7u7fXnK4PFh/Y2d07Lk5qLVg6ywVbYjp9tThxNVRXkJS6inexNwJWzEBdeAWv9AbC0XsEG411u7nWnjWdK64MZs3FrVS7zWaz2dwdZdeqYDJ3xZ0znb5anLgaqitISl1tisL00fJNWMNV7yGce1rV1FXhTYPFk0z2tFe98MqLSeTZ78hQmKcaf7ZXqqfFllJX3EUPHjyonLgaqitISl1tiNGU1Ch4qqaQyot4F6ir6XzV/NsBF5f9xq/X6NyuusqaO7u7u/MLfDuzfe3l3trdO17YpWVZkDsmy7LKiauhuoKk1NVGmC73NTrDNHNXs09KS4mNTuHVSkOnIXZb6mo6+VQ1C1W+/9Xs08oZq7nBcCepK0hIXW2Ayb0UJretWl9X6/ddTd47OLvh6HgOazynNb2DaHEm61btu5ouBpb2qjez2ZFpRs3ySV3BEuoKElJX8Tqd1vTuVKvqqXD/qrVzV+NRndGNGUZ3uZp+UAiwyQ3ai0uSt2PuapJEk/cODie3u5rcgWEWUoV6sjIIS6grSEhdEe9q97sa3dpqlFaTatrd3S2U0mxQ8dYM5q6ggrqChNQV8fwWZwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op4WZadnp5GXwXcaaenp8t+SQ5wWeqKeHmeHx4eRl8F3GmHh4d5nkdfBWwJdUW8wWDw8OHDo6OjXq8XfS1w5/R6vaOjo/39fQv0kIq6YiMMBoM8z7MsawM3K8uyPM+lFSSkrgAAUlJXAAApqSsAgJTUFQBASuoKACCle/fuqSsAgGTUFQBASi+88IK6AgBIRl0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACClF1544bkcAIBEzF0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AoAtMRgM8jzPsqy9MbIsy/N8MBisvfjj93/+f/5///6b33j51/707zfkv9/8xst//Y//fvz+zy/7F6GuAGAbDAaDhw8f5nne6/Wir2Wm1+vlef7w4cPVgXX8/s9/67++8rGvvfzrX/+n2u6/bMh/v/71f/rY117+X/7rK5cNLHUFANsgz/M8z6Ovotraa/vrf/z3j33t5fCcqvzvY197+f/45rcv9fWqKwDYBlmWbdSsVVGv18uybMWA3/jGZs1azc1g/cY3Xr7U16uuAGAbtNvt6EtYZfXl/dqf/n14Ra3479f+9O8v9cWqKwDYBupKXQEAKakrdQUApKSu1BUAkJK6UlcAQErqSl0BACmpq82pq3v37qkrALj1LldXnUat0Vl/sNOojQ91GrVKi2e5yuVdqq5aPx1+8MP9xg+fVp3pafuf58bvt3vDH7+mrgCAS7rk3FW3Va/V6q3u7EinUf68MLDq+PgpN19XRz8ePm3/8780fvj0gx/uVz50gYPXW1f3799XVwBw611+ZXA2MVXdUN1WfTGrSkEVUVevfTjsPWnsrq6rox9f7KouOKelrgDgLrpwXXVb9epFvvnlvk2sq9ky38XmrhIsC6orALijrryrfWkijetq2Y6reqt743X12ofDjOZ4DQAAA5RJREFU4ayuqs5UrqvXPhz2nrSqR16iutQVANxF11ZX5SOljew3XFdHPx4+/WBx7mqyVrgwd7Vkx9VrHw6Hw+FPj8xdAQCrXLCuls1EVawNztdVp1Grt1pxK4P//OTHP9xv/XRhzmlWV6X/Wj8dDocfthYWFisHqysAYN4V567mp6PKD03rarrrPXpX+6iuWj9d9Vo/fu1fGj98Ouw9/WD4YXvJsuB0pLoCAKpdqa66rXqt0Rl2W/WKSprUVenmDZtRV8WJqw96T4e9px8UV/r++ckHvSeNf37yQdXc1RU2uasrALiLrnZHhunkVPH2DGOjupq7DdZG1dVrHw5/ejReGRx9XF5JVFcAwNVdpq5Gy4EV97cqLRKW9l3N7uNQPhZWV62fTnZQTfddvfZhaaOVugIAnsXF6qq6q4pG297rrW71/a5mQy71i3DS1tV+uzec3eyqtKv96MfT3VTFuhq9T3A4XNjnrq4AgCX8Fufr+09dAcBdpK7UFQCQkrpSVwBASupKXQEAKakrdQUApKSu1BUAkJK6UlcAQEpZlvV6veirqNbr9bIsWzHgN77x8q9//Z/CK6ryv1//+j/9xjdevtTXq64AYBvkeZ7nefRVVFt7bQ/+4d8+9rWXw0Oq8r+Pfe3l//IP377U16uuAGAbDAaDhw8f5nm+UTNYvV4vz/OHDx8OBoMVw47f//mn/vLlj31ts2awfv3r//Sxr738qb98+fj9n1/qq1ZXALAlBoNBnudZlrU3RpZleZ6vTquR4/d//uD//bff/MbLv/anf78h//3mN17+L//w7cum1VBdAQCkpa4AAFJSVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAQCkpK4AAFK6f//+c++99170ZQAAbIP33nvvM5/5zHP/9m//Fn0lAADb4Nvf/vbnP//55/78z//8/Pw8+mIAAG638/PzP/uzP/uDP/iD5z772c/+3d/9XfT1AADcbs1m83d+53f+8A//8LkvfOELzz///Je+9KVWq/Xuu+9GXxgAwG3yzjvvtFqtL33pS88///wXv/jFP/qjP3ruy1/+8he+8IXPfe5zzz///L179z796U9/6lOf+uQnP/mJT3zif342H//4xz/+8Y8/40kA7qzY76K/+qu/uvWvOOKnFVfwiU984pOf/OSnPvWpT3/60/fu3Xv++ec/97nPfeELX/jyl7/8J3/yJ/8D47cq6/CEB1gAAAAASUVORK5CYII=\" /></p>\n\n<p>上图参数说明：<br />\n1.OpsManage.tasks.ansible.AnsibleScripts表示执行ansible scripts类型的任务<br />\n2.OpsManage.tasks.ansible.AnsiblePlayBook表示执行ansible playbook类型的任务<br />\n3.传入脚本id，hosts表示目标主机（如果你的脚本或者剧本有绑定主机可以不填），logs表示将执行结果写入数据库。<br />\n4.队列表示这个task放到ansible这个celery队列里面执行，必填项。</p>\n\n<p><img src=\"data:image/png;base64,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\" /></p>\n\n<p>上图参数说明：<br />\n1.OpsManage.tasks.sched.expireAssets表示执行资产过期检测类型的任务<br />\n2.expire表示过期通知阀值天数，比如一个资产在2018-01-10号过期，expire设置为三，那么2018-01-07号就会触发提醒。<br />\n3.user表示发送资产过期提醒邮件给谁</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAx8AAAMECAIAAABR1w+qAAAgAElEQVR4nO3dX2xk2X3YeT7kdeB9X9kwjAQWsrChdWkBY2Ev2oYdddojW05Er7XeyHYCKcFueeNY8SihNmnAm0Ve6mUx+yK+ZB88We/DYICygYCvkwBjRzU2XHPF7owliyPytoaq7unpGammqk2z9qH+3Vt1b/FPH/JXXfx80ICat27dOmSPya/POXW59U9/96Uv//PffelL//y3/pf/9Qv/8B/9+vbP/cILP/gLP/X3/ufP/U+/9rnP/drnPvdrvzr589mf+tu3X/j4i780P/K5X53/vfTn9idv/1d/886Pf/LFT3zyxR/54dsv/K1f+MQnX/zRv3X7hY/d+dFPvviJT/7CD/7Q7Rd+6M5PfvpX667wq5/7tV+98+ILH7v943fqT/jlT//Ix26/8N/+0me3f2X5z8//5Is/+Xd++Zc/W/HQZ7d/5bOffvGHf+j2D37yM5+tH8DtT95+4WO3/+u/fedHf6zqz8f/7gsfu/3Cj9Q8+mN3fuRv3n7hY7df+KE7P/WZlZ9m+VP+0Z/8zC+XDm7/D//N7Rc+dvuFH/ulFUOt+fMPAIAr8/nPf/7zn//8r//6r//mb/7mP/kn/+S3f/u3/+W//Jc7Oztb/9uX/vnv/NPf/ke/8Zv/57/5N3/xF3/xvQ+fjAAAOLfvfe973/jGN/7tv/23X/jCF373d39364u/8ot/77/77/+f/+v/Pj09jR4bAMDz6vT09A/+4A++8IUvbP3Df/yb/+J3vhw9HgCA597p6env/d7vbf3qP/h8p9OJHgwAwCbodDpbf+9X/sf3Hz+OHgkAwCZ47733trb//mejhwEAsDm2/v5nfjl6DAAAm2PrM7/0megxAABsjq1fevHT0WMAANgcW59+8cXoMQAAbI6tF+/ciR4DAMDm2Lpz++9GjwEAYHNs3bl9O3oMAACbY+vvqisAgHS2bn9KXQEAJKOuAABS2rr9dz4VPQYAgM1xybrqtZuNRqu7eLjbqjoKAHBzXK6ueu1mo9nuLR3utVuNVX1V87zzveBluq3balzuBQGAm+Ov//qvv//97y8cfPLkyV//9V9f4mqXqqvCFFWv3WysVGqbbqv4cbd1rieNVsVV6RqLT+u2Kg4CABQMh8NvfOMbf/7nf/7ee+/NDj58+PBP//RPv/nNbz59+vSiF9z6qY/9zQs+pTQBtXI2avHBhYXD6nXEiivODi33WH07ndl9K2fZAIAb4tGjR2+++ebXvva1P//zP3/y5MlomlZf+9rXut3u+MiFXHzuajb/1G01Gq32ueqqapaq1T3v3FVdwa1a9ptfu6qgxuVlVgsAGJ2enh4fH48Dq9vtvvPOO3/2Z3/2ta997U//9E8fPXp0iQtetK5m802TxboLrAwuTVWdc+6qdqt8XV0V26nXbi6cNBmxaSsAYO7dd98dB9bYm2++ebm0Gl24rkox1Wz3LrAyOI6k8s6rc7/iBepqeUTjeaxmuzeZ0DJnBQAsOD09zfN8VlfHx8enp6eXu9Tl3zM4n8I6V61MZqBmdXXWpNfkopMgutDcVdV5pSXJi32yAMDm++CDD7rd7qyu7t271+/3L3epS79ncJI1vXaz0Wy1VpTSOGamy3vFuavqMisuBHZbjUarddGVwcLDyz1VqDqZBQCMRqPR9773va9//evjrpo11r179z766KNLXO0SdVW6PcKsrlrd0WjUbc3+d7abfXqg/MjsuSvqavL49MB53gTYaP3H2VlnxdO8viwVAsDN9dFHH+3v74+L6sGDB3/1V391cHAw/vC//Jf/MhgMLnrBC9fVwq2neu3m+I2DK+uqIoya7V59Lk0XHctltujctwrtTccHALDg8ePH4/mqPM/Htw89OTkZB1a32y3eBOuctu7cuXOR88tF1Gy3p7dlWD13NXOxlcHqA8UHKuvqXLNc1gYBgLEPP/zw6OioeGf2v/qrv/r2t7+9fAP387hoXS0YB1J3Vc0E1NVZV1waCQBAKs9WV4WbXp1v7qrw9r1V98pKWVc1Z136Vx4CAKxyqboqZVGrOzqrrubnt1rXOne14mZZ9mIBAFfignVV+hUysw3u55+7ur6VwVU3yjrruQAAl/YMK4PzQLlEXdX/jsGl1cHyL985+0mzW7NXjLdAWwEAV2Hr53/+5y/3zMIsVMUq2yxllo+fkTXnn7sCAFg/z/ieQQAAStQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQ0tatW7dyAAAS2frUpz4VXXgAAJtDXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1xVoYDod5nmdZ1gGuV5ZleZ4Ph8PobwOwOdQV8YbD4f7+/sHBwcOHDz8ErtfDhw8PDg729/cFFqSiroiX5/nBwUG/3x8MBkPgeg0Gg36//8477+R5Hv3NADaEuiJelmWPHz8+OTk5PT2NHgvcOKenpycnJ48fP86yLHossCHUFfE6nc5gMIgeBdxog8Gg0+lEjwI2hLoiXqfTGdrwAaGGw6G6glTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpq+dAt9VoNJrtXtVjvXa7u3xyo9HqVp298NRmo/7C10ldQTh1BQmpq/U37aX2uIaWFPJocmq1Ukb1ai62kGa9dvM8ofaMzltX2e72OexmpSfsVt4fMdudnnm8tzN76s7ecfHDqkuuvGrdSHezykNL1zre2znrypc4Fc5DXUFC6mrdTTKomDjjhlqMnkJZFTpqVlHLx5aqaXKFyZm9drPRaDabzXa7dcUTXJefu8p2qxOjosN2s2I4VRRNtjutq9Ilj/d2dvaOV1250GaFs6YfTS9YcWg+gPEjlWW3FHdLA4cU1BUkpK7WXNVCX0VdzU6rnL1aSrNxLPXazVk2TSusnFzjo1c+eXWBuqoLkKUQKXbXJGyqc+Ssulqoou2dnZ2l3pnPhBUPnGfuqmogxdFPD571eZ9RYnAmdQUJqau1Npt5Oquulh6tWxGsuHZlhE0u1Gz3Rt3WVQfWxepqYSapdl1t8uH8aH1dFWafKnJmvohXzqy949E0mhYvWzd3tbdbmXnji8w+sfmHhesUh7s4uaapeHbqChJSV2us0D/nqatSLrW6o7rFwqqnXP3eqlVSz11Vn7S7t3S4lDo1c1dnDuQcZ8+bcL4MWLzO/Egh1pYmxGYq5uXgWakrSEhdrbN5HbW6q7aht/5jqZLGp1Ztdp8dW7mp/drfRng1c1eTx+enzx4vnVhRV1XNtnh8MYiK555v9/32blbY0z65fsUk2OzoOS4rtLg0dQUJqat11mu32t3lrU8Vc1era6nQTMsTXAuvuBBm1+LSdbW8PXy+BrjcMrPnnlVXu7uFKFvouanzzhllu+PoqZ+JWjkdV5uSkJi6goTU1bqr2Fh+nn1XpUBaPlR3ieehrs6YDyqdvjh3VVNXhZYZPzZPquIVzpg8mp5XOq1if9XCQ/VrkQsFp664SuoKElJX6+5idVV9h9DlJzy3dVW+QVQ5PxbedDeZMdrZ3d2ZbUCv2N4+C6nyvqvxR3UzVMtFVE6fi7xnsHo0qz89SE5dQULqat2dv66mi35LbVQ7m/Uc7rsajaazTaVdS8snFItp3Cx7u5WzRbOEWdzVPl3TW3X9uaW6utD9ripvJLFQV/avc6XUFSSkrtbdrK5qg6jZ7lWE1cJOrIq7LTyfc1djhYmglcUxL5KsvJWqNMk1q6l5XY1vfLC7FFjTsqt/ocXxnTl3Vbpy7Tlmrrhi6goSUlfEO2ddFfqkfhFue+GuDPO4qpwtGq/ETa9ReG9gaQZpvi99qXhqN1ida+6qOPjlTJw8OrnxlbbiSqkrSEhdEc9vcYZw6goS2rp161b0GLjp1BWEU1eQ0NadO3eix8BNp64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op4WZY9efIkehRwoz158iTL3PYD0lBXxMvz/PDwMHoUcKMdHh7meR49CtgQ6op4w+Hw3r17R0dH/X4/eixw4/T7/aOjo/39fQv0kIq6Yi0Mh8M8z7Ms6wDXK8uyPM+lFSSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV2xFobD4dHR0VtvvdUBrtdbb711dHQ0HA6jvw3A5lBXxBsOh1//+tfv37//l3/5l98Grtdf/uVf3r9//+tf/7rAglTUFfGOjo7u37+f5/l3vvOdd4Hr9Z3vfCfP8/v37x8eHkZ/M4ANoa6I99Zbbx0cHPR6vUePHr0HXK9Hjx71er2Dg4O33nor+psBbAh1RbxOp/Od73wn+kcM3Gjf+c53Op1O9DcD2BDqinidTufdd9+N/uECN9q7776rriAVdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6uo50G01Go1mu1f1WK/d7i6f3Gi0ulVnLzy12ai/8HVSVxBOXUFC6mr9TXupPa6hJYU8mpxarZRRvZqLLaRZr908T6g9owvW1duvvbQ99/Ibl/xh8vZrL1U+u+54hLdfe+kyQ3n7tZe2X3rt7SsY0LNfP/3Y3nj5jH+vC3wVx/9tpf7Xv+Q/4zVTV5CQulp3kwwqJs64oRajp1BWhY6aVdTysaVqmlxhcmav3Ww0ms1ms91uXfEE1wXqaumn3xsvX/an4duvvbT90ksvLfykf+PlZ2u2tNTVOSSsqzde3n7p5ZeTf/HUFdw46mrNVS30VdTV7LTK2aulNBvHUq/dnGXTtMLKyTU+euWTV+euq+qfzIWfrm+8vP3Sa29M57YKp06iqRhO44u99nLpgm+8vP3yyy+XT5qZnvnGy9svvfbayxWzZ5WnF19+/LzZMyqG9V7FxcZXqrl47af29vzh8QcrX61+OLOjs2Nvv/bSuEKWPtG615h/AarjpVRI8+GPs2R5AMUvxhn/XotfxdI5y2n90mtvL/9XVvmMmsssHV4cwJn/ClHUFSSkrtbabObprLpaerRuRbDi2pURNrlQs90bdVtXHVjnrau6aY/51MD4J9c8teY/YIs/Wuc/9V567e03Xi5V0EuvvT37SV9aI3z7tZdKPx8nzyqcU3d68XhxgG+8XN1DlZ9ZzcVXfmqFL0HdmTVf3YpLFYdbmkEsvEbNZ7QwiqWoeW9lXVV8qWu+oqv+ASq/0OVZr9lDC2vDxbNmf688WHf18j/jyn+FQOoKElJXa6zQP+epq1IutbqjusXCqqdc/d6qVc5bV7VLQOM5h6Uzpj++qn+MTY8W8mr815qXqeyM1ck3+1ldHtP2y28srxZVrh7VLSmVLl73qb1RioQzf5afmVx1R6dfjrrPqKZhSlbU1cIU4Mtv1Byt/3wKA5v9lzJ/blXslC5Zef26g5VXr66rdaOuICF1tc7mddTqrtqG3vqPpUoan1q12X12bOWm9mt/G2HSulpcpprNNCyu4RQmeGZzLLMJn8pVre1z1dXi6TVjKpxWv1K0VFdLY6n91FatztX8eK84ofpLXl1XNZ/R4hdoMUGWX6eyiwoPLAxq8Yu09DVamAFcUDHvVppuq/lyVhysvXpxhGf+K4RRV5CQulpnvXar3V3e+lQxd7W6lgrNtDzBtfCKC2F2LZKuDFbW1fy8+c/D0lzUuA4W42nyk3DFGtnSCtjy6Svq6sx9N+VZl6qx1H5q2y+/Ufka5TNrXnN2wkXrauUc0uz0q6qrmq/ReaaOqtJweVfW8uHiwdqrL09BnvmvEEBdQULqat1VbCw/z76rUiAtH6q7xHrX1bl2tZ97EaqcRS+/UZjCms94Vc111aVAzekrVgbPnL6o68aaJy99ags7iCq/ZtWqF+EqX77iC7rita5wZbDua7TQqDUFWNU/Z4XlwsG6r2rdAu+5CvvaqCtISF2tu4vVVfUdQpef8JzW1cJ+6vfeW7wjQ3G/+fxnV/Ve48V9NsvPW9y5fMbKYN3pNXuwl1efqjNmeQt84eJnfmrVNVc3qbXyUvN4qa6r2s9ocTg1n2jpa1Tc1V7YS7+8jFf4iq76Byhtdl/cUlWbTEtzcsUZyYqd8pVXr508W6+4UleQkrpad+evq+mi31Ib1c5mPW/7ribK21uWtiW9/PLyzpbiU6p2MZemPZZ+dE+eNWuH2n1X1acXH3jptddeLgfI0jJUaVyTM8rbmkoXP/NTK/XV0qstVkLFqtjyTqG6uqq9xPwaL79WMzFV3Mc0+9d4+7XSrR+qVnlL97hY/TVaOqmiyopK/+BL/71VHqw5XBhA3VconrqChNTVupvVVW0QNdu9irBa2IlVcbeF53Lu6gxrNhtQpXLbEdXW+S12G0ddQULqinibXVdLE0ly4dx8ua6RuoKE1BXxNruu1nkxaN2pq2ukriAhdUW8dHUFXJK6goTUFfHUFYRTV5DQ1sd/Wl0RTF1BOHUFCW19/OMfjx4DN526gnDqChIyd0U8dQXh1BUktPXxn/656DFw07311luHh4fRP1zgRjs8PHzrrbeivxnAhrAySLzDw8O33/a2e4j0F3/xF4eHh9HfDGBDWBkk3nA4zLLsG9/4hvVBuH7vvvvuN77xjSzLhsNh9DcD2BDqirUwHA7HCxMd4HqNl+alFSSkrgAAUlJXAAApqSsAgJTUFQBASn7PIABASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6Yi08ffr0wYMHWZZ1gOuVZdmDBw+ePn0a/W0ANsfWrVu3osfATff06dP9/f2Dg4NHjx59CFyvR48eHRwc7O/vCyxIRV0R78GDBwcHB/1+fzAYDIHrNRgM+v3+t7/97TzPo78ZwIawMki8LMvef//9k5OT09PT6LHAjXN6enpycvL+++9nWRY9FtgQ6op4nU5nMBhEjwJutMFg0Ol0okcBG0JdEa/T6QyHw+hRwI02HA7VFaSiroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXa2HbqvRaLZ7xUO9drPRaDRa3fKZ48PNdm/8l/LD3VajcJ1euzn7oPxItzV/YrfVqNBqt5vjJ3RbFaNIS11BOHUFCamrdTAJqXLE1NTVtJO63W67VEyFx6Z11W01G41CIzXbvfmLFZ84K6jetKnmf1vnusp2t3ezVUeO93YWz1j59PM9dry3s7N3fPHnwRpTV5CQuloX3Vaj2W535xWzsq5K00zdWTp1l3prGkkrThk9l3WV7W5v7+7u7uzu7mzPe6bUNsd7O9vb29WxU/30sx873tvZ3tnd3dnd3d3eXkisVc+DdaeuICF1tbYq6qoUVoVCqkin6vW+pfW/bt2JzVZrvetqNBrnTCljZnE1Davd3RWds/T0cz52vLezVFbneR4Eunv37nbB3bt3F05QV5CQuoo365tmuzdfJKwInnFOFfZb9drNRqtbWVcz1Rcs1dLCFZ+PuatRtru9s3c8/Z/poUnYHO/tZZMjNa1T8fRzPTZZa6xcclz1PIiVZVmxrpZ/paC6goTU1Xqoz6Llrim3VN2yX6nZyi+wsM1rfOb47/O6Kr/cGtbVsortUPV1BTfObPpqeeJqpK4gqa0f/uTPRY+BS9RVo9VqLadT5aaquheYvk6vPX8HYTG8CrNeVxtXieqqaq+5uoKZ2fTV8sTVSF1BUls/8PGfjh4DF6urefVMH1uuqxULjBWLjctDueqeKktSV5Vv5FNXUHT37t3KiauRuoKkzF2th0IfTYuntq7mK4IVz65MpuLO9YqgOjvFnoO5q+q7JKgrKMqyrHLiaqSuICn7rtbDvH9mIVNdV4VQmm0+n59SVVfTdpq/P3B1Kz2nc1fV95lSV3BO6goSsjK4FgoFtHhs6Y4MhVuCtroLN2xfqKvZpNTyofp6ej7rquYmnuoKzkldQUJbP/wDPxw9BhanoGaHVmVO1ZsCG+X6qn369OTp+w3PoXJHfCJ+Ew6EU1eQkLoinrqCcOoKErIySDx1BeHUFSS09XN2tRNNXUE4dQUJec8g8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RL8uyDz74IHoUcKN98MEHdb8kB7godUW8Bw8eHB4eRo8CbrSjo6M8z6NHARtCXRHv6dOn9+7dy/P8o48+ih4L3DgfffRRnuf7+/tPnz6NHgtsCHXFWnj69Gme51mWdYDrlWVZnufSChJSVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAQCktHXr1q3oMQAAbA5zVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAQCkpK5YC0+fPn3w4EGWZR3gemVZ9uDBg6dPn0Z/G4DNoa6I9/Tp0/39/YODg0ePHn0IXK9Hjx4dHBzs7+8LLEhFXRHvwYMHBwcH/X5/MBgMges1GAz6/f63v/3tPM+jvxnAhlBXxMuy7P333z85OTk9PY0eC9w4p6enJycn77//fpZl0WOBDaGuiNfpdAaDQfQo4EYbDAadTid6FLAh1BXxOp3OcDiMHgXcaMPhUF1BKuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNTV2ui1m41Gs90bjbqtRoVWd3LO7ECr8rzxmdMrNtu90Wg0ueb0g1G3NTup7tXa0+F0W4VLXg11BeHUFSSkrtbFNJwqOmbcP7O6anXnIbb6kt1Ws9EoNFKz3Zu/UPH5s4KaX7m37nV1vLezmxU+2N7NRqNRtru9s3dcdfL4cLa7XaXqORcdzfb2bvWtGI/3dqYvsOrlj/d2Zgd29woflE1epPTpZ7vF1852559O5QvuZrOv0+wLw42nriAhdbUGpvXUbTUazWZ7KWSW6moaPKWprKlydU0jaVZX5Ums4is8Z3VVLKlZXJ1ZV8Vzly5zacd7O9s7O/V9tfJFpmObDuxcwXOc7e7MW2teV+NEKz9/dsHCp66uWKSuICF1tQbm9XTW4+O6mi3aLc5hFcqper2vYg2x5sRmq7X2dTWriuO6iZ7dbHH2ZjrBVaiMZ26r2eUK110aY72FupqdXzHttDjS6bnF5yx/NuqK0Wh09+7d4n9Ld+/eXThBXUFC6moNzOqpYi6q1V2uq1ZrYZFvxdxV9TnlWhqf0uqOnrO5q6liUpw9dzU7r7TQ9iwvXnjFwiJg4YTxayw34Ox4oa7mMbb4qZQi6RzGpVZpZ29PXd00WZYV/xtY/pWC6goSUldrYKGupiUzy5ralcGzL1qey5qE1yy4xpcoTp1V7Ohaz7qadsNiHJ2nrmbP3d2tmhA6v+O9nenT59NWizuwinVVfKml48d7O9u7u/Pxn2PuanqZbHe8MFnZivMZK3NXN9xs+mp54mqkriApdbUGLjp3NVnOO/M9g0uvUbkRvtdrz99BWAyvwmiuNq4uPXeV7W7vZqtnckrbkRYOTkwe2/1P55sSmjROtluqnfKiYLa7XVx7vMjc1Xl7Z3q1wl7+Qo4VrlDozaUtZ+rqZplNXy1PXI3UFSSlrtbAheeuJlNMzWaj0Wx3283ZofGWrLr97suqcuusXWBX4JnqaumDhemraXMsRcSZG6JWvvDCc5ePTBcJLzZ3lVWk0mKRLYRdxacyO6PcU8WP5q33rGujPE/u3r1bOXE1UleQlLpaAxefuyrtvxq/1XC8ojc9oeoFaoPq7BRb57mryd8r3jZYiIkz9ywl29leP8gL19VuNr/twvHezs5eNpvdOs8UW+VwzFXdcFmWVU5cjdQVJKWu1kDN3NXy44Wqmt3BodUqpNH4o/IFCjfSmlTW6lZ6HueuChugCnVVXhNLOXdVOZRz1NWZK4Pz1Cu9HXDymVSs7E0/4Z3KR6YjW0VsMaauICF1tQbOdUeG+Rv5SndZXzhcPmE2KTWfsFpx09JzjuYKXP5+V7OFsmJazHtiVg6Tglk16/NslXHxuauZxbmr+dN2y2G0s7u73FCz9yxWvF2xgrkr6qgrSEhdrYGanqlYz1tZV+1COC28LbD6Fee3GT2Hs28Nf3mXqatxztRHTdk6zF2teGpNXS3emaF0Rmlbe2EUdWuCs2epKyqpK0hIXRHvUndkKL4RbtXmo6oKmVwitK6W3uG3sq725nvzp59QbSXNP+OzVgWtDjKnriAhdUU8v8UZwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Il6WZR988EH0KOBG++CDD+p+SQ5wUVu3bt2KHgM33YMHDw4PD6NHATfa0dFRnufRo4ANYe6KeE+fPr13716e5x999FH0WODG+eijj/I839/ff/r0afRYYEOoK9bC06dP8zzPsqwDXK8sy/I8l1aQkLoCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1xVoYDod5nmdZ1gGuV5ZleZ4Ph8PobwOwOdQV8YbD4f7+/sHBwcOHDz8ErtfDhw8PDg729/cFFqSiroiX5/nBwUG/3x8MBkPgeg0Gg36//8477+R5Hv3NADaEuiJelmWPHz8+OTk5PT2NHgvcOKenpycnJ48fP86yLHossCHUFfE6nc5gMIgeBdxog8Gg0+lEjwI2hLoiXuHg79IAACAASURBVKfTGdrwAaGGw6G6glTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpqzXTbTXGmu12q9FoNNu9hYeb7d74rFZ31Gs3G63u9GnFc2fXKZqf0Gs3x1eoG0HlQ1dFXUE4dQUJqau1Meuhcdj02q1mc9ZFk9iZRtGkrmYhtBRXo9Lp5QPNdq/4yPivZ1i+dkrnravjvZ3t7e3t7Z2942x3e3t7e3t7190PIQl1BQmpq7VwVuE0m+1JInVbjVa71241Go1Wu9tqNtu95YmqSQuNr1oMo6q6WrTGc1fHezvbO3vH0w+zXXUFqagrSEhdrZtVcVMZYZMlxPk81DSnlhYHW93quqpcRby+mSt1BWtAXUFC6ireuZbm5okzO720WtiYT2JNVxabi8+pq6syc1dwE6krSEhdrY1pNRW6Zhw6y5vVW62K2abJJvfJ6YXOKuy/qqirMyeu5pe/MuoKwqkrSEhdrYXZfFSz3St3VnFmatRtzfayl97+12yOo6nbKpw5e29ho9lsFq9WO3c1Ca3p1eaXv+KFQXUF8dQVJKSu4i3PHi3OE5XeKli1YDiuplIVjUajUa/Xmz5lfHxFXVUuME4774r7Sl1BOHUFCamrdVTciVUOm2IVFTdIVSwrFp9Q2n9VUVfzF5ycWeq4K9+Dpa4gnLqChNTVmijlTO1UUWEFsVu+3cLC3bJKV6243PL9rop3Ly0M5lp2t6srCKeuIKGtW7duRY+BSnUTWMUOK95SYRpcsyCqTatR8d7u471co6W3Ls63bZm7ghtAXUFC5q7WQc19rAp3Ae2V1uuWlu/m5xZ/R05FFxXTbKG7Svvnl5/iPYOw0dQVJKSuiKeuIJy6goTUFfH8nkEIp64gIXVFvPPWFXBl1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op4WZY9efIkehRwoz158iTLvAcX0lBXxMvz/PDwMHoUcKMdHh7meR49CtgQ6op4w+Hw3r17R0dH/X4/eixw4/T7/aOjo/39fQv0kIq6Yi0Mh8M8z7Ms6wDXK8uyPM+lFSSkrgAAUtr6aXUFAJCOugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUAQEpbP/ADPxw9BgCAzWHuCgAgJXUFAJCS34QDAJCSugIASEldAQCkpK4AAFJSV6yF4XCY53mWZR3gemVZluf5cDiM/jYAm0NdEW84HO7v7x8cHDx8+PBD4Ho9fPjw4OBgf39fYEEq6op4eZ4fHBz0+/3BYDAErtdgMOj3+++8806e59HfDGBDqCviZVn2+PHjk5OT09PT6LHAjXN6enpycvL48eMsy6LHAhtCXRGv0+kMBoPoUcCNNhgMOp1O9ChgQ6gr4nU6naENHxBqOByqK0hFXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuloz3VZjrNlutxqNRrPdW3i42e6Nz2p1R712s9HqTp+2cG7FZVvdlS/eazcnJ511vbTUFYRTV5CQulobs64aJ1Cv3Wo2G43SsVn+TOpq/JRW9+wYGj/xrF56Luoq293e3t7e2ftPk/89vtKhwU2hriAhdbUWJvFTq9lsT2aduq1Gq91rtxqNRqvdbTWb7V4hzGbzXr3FQ9XG0Xb2uWfMeT2rC9TV8d5OoaiO93a2d91dGhJQV5CQulo3s/moCpURNllCbHWnJ8yDa8Xk03yaqnBuxdxV8bwrc4G6yna3Cz1Vbi3g8tQVJKSu4p01cTWfkCqfXlotLDTVuTZiqSugSF1BQupqbUyrqVAy43msYiNNZrZaFWt5k03u5aSqKbdydj1PK4PqCq6GuoKE1NVamEVQs90rd1ZpO3q3NdvLPu+jXrvZbDZnm63q5qtWrDg+R3NX5biSV5CMuoKE1FW85amjxZgpvVWwahpqPGnVXJy5Wn6V57qust3Kkqo5DFyEuoKE1NU6Kq7nlXNpabvU7P4N5WXF871lsK7Yqlzl7RnMXUE4dQUJqas1UYqc2pIprCB2283imQt3y6p7gZWTUPM98aPrmbOasu8KwqkrSEhdra26Caxih03qZ7KONw6umiRaWVeTazbbvVGvt/RSV35XUXUF4dQVJKSu1kHNfazmTTNJnmlYTR6ad9b83OL806h8UnVcnT1JdfXTWBe8m6i6gvTUFSSkroh36bpa3IYFXJa6goTUFfH8nkEIp64gIXVFvAvVFXAV1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKEtq6detW9Bi46dQVhFNXkNDWpz71qegxcNOpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5DQ1q1bt6LHwE2nriCcuoKEtm7fvh09Bm46dQXh1BUkpK6Ip64gnLqChLbu3LkTPQZuOnUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKEtm7duhU9Bm46dQXh1BUktPWpT30qegzcdOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQUJbt27dih4DN526gnDqChLaunPnTvQYuOnUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46gpiffGLX1RXkJC6Ip66gkBf/OIXR+auICl1RTx1BVHGaTVSV5CUuiKeuoIQs7QaqStISl0RT13B9SumlX1XkJa6Ip66gmu2kFYjc1eQlLoiXpZlT548iR4F3BTLaTUajZ48eZJlWdCIYNOoK+LleX54eBg9CrgRKtNqNBodHh7meR4xIthA6op4w+Hw3r17R0dH/X4/eixw4/T7/aOjo/39fQv0kIq6Yi0Mh8M8z7Ms6wDXK8uyPM+lFSSkrgAAUtq6detW9BgAADaHuSsAgJTUFQBASuoKACAldQUAkJK6AgBISV0BAKSkrgAAUlJXAAApqSsAgJTUFQBASuoKACAldQUAkJK6AgBISV2xFobDYZ7nWZZ1gOuVZVme58PhMPrbAGwOdUW84XC4v79/cHDw8OHDD4Hr9fDhw4ODg/39fYEFqagr4uV5fnBw0O/3B4PBELheg8Gg3++/8847eZ5HfzOADaGuiJdl2ePHj09OTk5PT6PHAjfO6enpycnJ48ePsyyLHgtsCHVFvE6nMxgMokcBN9pgMOh0OtGjgA2hrojX6XSGNnxAqOFwqK4gFXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuiKeuoJw6goSUlfEU1cQTl1BQupqQ/XazUZRqzs/2mz3Cmd2W41l81PGTxk//aqoKwinriAhdbWheu3muJFKQVVVV/PTiw218Py1qqve6698da59/wpHtnoMr7xe+kLeb0eNBp6duoKE1NWGmtVRt1Xoqbq6Wj6+rnW1WDXj0rr+ppkUXqmv1BXPM3UFCamrDTWto1Jc1dXV0uJgq7ueddV7/ZXFCaPywVLglM++316a7lo+ofTciaUXnD7ebrdLjxYvUJpfm57Te/2Vr7bvzwbSvl84rZBlFSOFK6euICF1taEmddQuxdU0o8qtNAup2QfrWlfjOlk+Ps+aurpaDJ/x4bq6Kh2vnpGaDOV+sa9mZ/Zef2Whs+avV3yNr1a8YPVI4cqpK0hIXW2oaR2V4mi61b00edVtFeppdvpa1tX9dv1E0viB6rparLLpxzV1tfgyVS87u2Shr2pWBmtqbumD6YiqRgpXTl1BQupqQ80npAprg7MVwEIsdVvz7VmNZnOaUhtVV4WlttKaW3VdlTfN16wOFrJn1leLdVV42Zq6Kg21fb9+pHDl1BUkpK421Lyu5nk0PtZqNZdrqdfrTdNrHGJrWVeXXRms225eX1dnrseVhjLpq/IwKprqfHWlpgihriAhdbWhyve7anVH8yXA0j6rxWeU9l+tW10t59Bsca4wj1S9MljVS/Urg2cmzkLo3W9/9auvvPJK5dLiRerKTivCqCtISF1tqMWEKkVSaavVaH7oXHfCugKXviPDdCGt/Fa/QmkVt0RV7HgqHF7acV6amVqKraVptMlQlvJsfPy8dVU7Urhq6goSUlcbquKNgEu3s5o1U21ajUbl+2VdkWe6m2jFXRamR4pzSMUnLdxFYXLs/uJi36qNTxWLlPfbXy2X3fS1ZsF0nrqqHSlcLXUFCamrDVWoq5o+Ki0ULk9OFe+BdcVxleI34dx/XYfAs1BXkJC6Ip7fMwjh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Ip66gnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4mVZ9uTJk+hRwI325MmTLMuiRwEbQl0RL8/zw8PD6FHAjXZ4eJjnefQoYENs/Y2/8Teix8BNNxwO7927d3R01O/3o8cCN06/3z86Otrf37dAD6ls3bp1K3oMMBoOh3meZ1nWAa5XlmV5nksrSGjr9u3b0WMAANgc6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpK9bCcDjM8zzLsg5wvbIsy/N8OBxGfxuAzaGuiDccDvf39w8ODh4+fPghcL0ePnx4cHCwv78vsCAVdUW8PM8PDg76/f5gMBgC12swGPT7/XfeeSfP8+hvBrAh1BXxsix7/PjxycnJ6elp9Fjgxjk9PT05OXn8+HGWZdFjgQ2hrojX6XQGg0H0KOBGGwwGnU4nehSwIdQV8TqdztCGDwg1HA7VFaSiroinriCcuoKE1BXx1BWEU1eQkLoinrqCcOoKElJXxFNXEE5dQULqinjqCsKpK0hIXa2FbqvRbPeqH2g0Gq1u+cD4426r0Wg0273JSTPVV1p92VGv3Zw8c+FqE8Vzk1NXEE5dQULqag302s26gilnUGX4NNvtWXHNG2l6zeo8Wqqrcw/hSlykru63vzrVvl95+KuvvL6Yl/fbhYPFU2ufccFr1um9/kppmGdcc9UpvddfmR8vXXN01imXf9G6T4MNpK4gIXW1Jrrtdq/bbS820VIf1c5dVdbV/GCj1apOs960nrqtRqPZbC9V1DrV1f32/Gd/7/VXZn+/357XRPH47MHaqui9/kpNq1z+mqVrL2VO7TVXnlI6u3hO+eWqTrn8i9Z9GmwkdQUJqav1Vr0yuLAMWLUyuFxXdXNXZ9XTGtXVQlXMZo/K00iFiZZJBLXblU2xqq0uf835hb/61Xa7NOLaa575sgvnzs5a6K+LfHHK/VU9rupPg82kriAhdRVvFkfjDVOlPVjn33d15txVt9duTi9cWVdLi4njM9aorspmZbE42zLvhvuvLzZISfUcUPniF73m9OmvLybMqmue+bILp1a9eM0pz/CiNZ8GG0pdQULqai2Mw6Y4DzWpmfPPXZ2572q8MjgruLq6Ku3xWue6mk+xLE4CLU0KVZfQyj665DUXLdXVymvWn7K4yati01fNKc/wojWfBhtKXUFC6motzOtq3kWFN/ClmbuaXGzecM/z3NXiTqGLl9BZk0/qqubTYEOpK0hIXa2FYl2NRqNuq3LuqiJ/Go1Gs9UqH67fdzW5wHgH+3M8d7VQNmcuflWVUN3m7cn77S54zcJb7pZ2vz/HK4MrnsTGUVeQkLpaCwt1tep4r92cRVNhma8w77VqV3u31Wi2u7328zt31Xv9laU36y1M2yxN7FTEyJlTT5e4ZvVVane1V97ToeaUhemkqg3xdadc/kXrPg02k7qChNTVWlioqHLnLN30s3AjhcIdFWYPX/Y9gxXnLZ57RS50R4aqH/Nn3HSg4tDZvXDxa55xkbOvueKUwDsy1L4gm0VdQULqag3Md6qfcZv12crewtPKh86+m2gp5s51R4Zz3P/9GZyzrko3yyzfM7P00Dm2WJ2njS56zSqLWbL6mitPKd0EtTqFKk+pu+LSouWKcamrm0BdQULqKt7sFgzV+6oWl+lKW9znx2ZPLl5rYe6q9IbD8g3ga6aszhV9z8xvwoFw6goSUlfEU1cQTl1BQuqKeOoKwqkrSEhdEU9dQTh1BQmpK+KpKwinriAhdUU8dQXh1BUkpK6Ip64gnLqChNQV8dQVhFNXkJC6Il6WZU+ePIkeBdxoT548ybIsehSwIdQV8fI8Pzw8jB4F3GiHh4d5nkePAjaEuiLecDi8d+/e0dFRv9+PHgvcOP1+/+joaH9/3wI9pKKuWAvD4TDP8yzLOsD1yrIsz3NpBQmpKwCAlLZu3boVPQYAgM2hrgAAUtq6c+dO9BgAADaHugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAQCkpK4AAFJSV6yF4XCY53mWZR3gemVZluf5cDiM/jYAm0NdEW84HO7v7x8cHDx8+PBD4Ho9fPjw4OBgf39fYEEq6op4eZ4fHBz0+/3BYDAErtdgMOj3+++8806e59HfDGBDqCviZVn2+PHjk5OT09PT6LHAjXN6enpycvL48eMsy6LHAhtCXRGv0+kMBoPoUcCNNhgMOp1O9ChgQ6gr4nU6naENHxBqOByqK0hFXRFPXUE4dQUJqSviqSsIp64gIXVFPHUF4dQVJKSuiKeuIJy6goTUFfHUFYRTV5CQuloPvXazsUKz3RuNRqNRt7XqrKlWd3LB8tNa3cmLdVvFj0bdVvGj6lFVP56KuoJw6goSUlfrYdwxVQ3TbRXqqupJ1Q/2er2qFGu2e4sv1et1p0cWn1H9suldpq6O93Z29o6nH2W724WPyo8d7+1sb+9W3yUx292eqDkBbgp1BQmpq/Vwzrmr6vNb7do2G9fZ+Onjv3VLrzS9cK/dLF1gfP11rqtxNO3sZXs72wU7e8ejUbZbiKuxbHd7ezc7Lp+sqWBGXUFC6mo9nH/uaja/1Gz3pkt+7V5v9sD4Gr12c/K38nxUs9ksPLXZ7o167eb08ivXHa9ybfCyK4PZ7vbO7u7OrJEmc1bzCant7aXMmjre29FW3CB3794t/j8Wd+/eXThBXUFC6mo9nG/uamH/VMWB6Z6qXrdVWO2bz13NU2lWV7320kWeg7mrbHfSRsdLc1fTdcHJKdluZWOpK26WLMuK/5ey/CsF1RUkpK4217if2gtzV61WqzldIKzb5/4c1NV4gmo3K1XS8d7Ozt7e7mx9sPjA9s7ecXFSa0ntLBdsiNn01fLE1UhdQVLqKt753ghYMQN17hW80hsIx+8RbLXO2s115lXTueTKYLa7vJVqZ3d3d3d3Z5xdq4LJ3BU3zmz6anniaqSuICl1tS4K00f1m7BGq95DuPC0qqmrwpsGixeZ7mmveuGVg0nk2e/IUJinmny0V6qn5ZZSV9xEd+/erZy4GqkrSEpdrYnxlNQ4eKqmkMqLeOeoq9l81eLbAZeX/Sav1+o+X3WV7W7v7OwsLvBtz/e1l3trZ+94aZeWZUFumCzLKieuRuoKklJXa2G23NfqjtLMXc0/KC0ltrqFVyudOgux56WuZpNPVbNQ5ftfzT+snLFaOBluJHUFCamrNTC9l8L0tlVn19XZ+66m7x2c33B0Moc1mdOa3UG0OJP1XO27mi0Glvaq72bzI7OMmueTuoIa6goSUlfxut327O5Uq+qpcP+qM+euJmd1xzdmGN/lavaXQoBNb9BeXJJ8Puaupkk0fe/gaHq7q+kdGOYhVagnK4NQQ11BQuqKeJe739X41lbjtJpW087OTqGU5icVb81g7goqqCtISF0Rz29xhnDqChJSV8RTVxBOXUFC6op46grCqStISF0RT11BOHUFCakr4qkrCKeuICF1RTx1BeHUFSSkroiXZdmTJ0+iRwE32pMnT+p+SQ5wUeqKeHmeHx4eRo8CbrTDw8M8z6NHARtCXRFvOBzeu3fv6Oio3+9HjwVunH6/f3R0tL+/b4EeUlFXrIXhcJjneZZlHeB6ZVmW57m0goTUFQBASuoKACAldQUAkJK6AgBIaevWrVvRYwAA2BzqCgAgpa3bt29HjwEAYHOoKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAICV1BQCQkroCAEhJXQEApKSuAABS2rp9+3YOAEAi5q4AAFJSVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAQCkpK4AAFJSVwAAKakrAICU1BUAQErqCgAgJXUFAJCSugIASEldAcCGGA6HeZ5nWdZZG1mW5Xk+HA7PHPzx+9//P/6///yzX3n1x3/r99fkz89+5dXf+4P/fPz+9y/6D6GuAGATDIfDe/fu5Xne7/ejxzLX7/fzPL93797qwDp+//s//69f+8SXXv2JL/9hY+c/rMmfn/jyH37iS6/+3L9+7aKBpa4AYBPkeZ7nefQoqp05tt/7g//8iS+9Gp5TlX8+8aVX//dX/vhCn6+6AoBNkGXZWs1aFfX7/SzLVpzwM19Zr1mrhRmsn/nKqxf6fNUVAGyCTqcTPYRVVg/vx3/r98MrasWfH/+t37/QJ6uuAGATqCt1BQCkpK7UFQCQkrpSVwBASupKXQEAKamrNaqrW7duPduXCwCIp67UFQCQ0sXqqttqtLpnH+y2GpND3Vaj0vJVLjO8C9VV+7ujD7653/rm06orPe380cL5+53+6FtvXm9d3blz50JPAADW0AXnrnrtZqPRbPfmR7qt8seFE6uOT55y/XV19K3R084f/YfWN59+8M39yofOcVBdAQBnufjK4Hxiqrqheu3mclaVgiqirt78cNR/1NpZXVdH3zrfqM45p6WuAOAmOndd9drN6kW+xeW+dayr+TLf+eauEiwLqisAuKEuwIYzjgAAAwVJREFUvau9NpEmdVW346rZ7l17Xb354Wg0r6uqK5Xr6s0PR/1H7eozL1Bd6goAbqIrq6vykdJG9muuq6NvjZ5+sDx3NV0rXJq7qtlx9eaHo9Fo9N0jc1cAwCrnrKu6maiKtcHFuuq2Gs12O25l8I8efeub++3vLs05zeuq9Kf93dFo9GF7aWGx8mR1BQAsuuTc1eJ0VPmhWV3Ndr1H72of11X7u6te61tv/ofWN5+O+k8/GH3YqVkWnJ2prgCAapeqq1672Wh1R712s6KSpnVVunnDetRVceLqg/7TUf/pB8WVvj969EH/UeuPHn1QNXd1iU3u6goAbqLL3ZFhNjlVvD3DxLiuFm6DtVZ19eaHo+8eTVYGx38vrySqKwDg8i5SV+PlwIr7W5UWCUv7rub3cSgfC6ur9nenO6hm+67e/LC00UpdAQDP4nx1Vd1VReNt7812r/p+V/NTLvSLcNLW1X6nP5rf7Kq0q/3oW7PdVMW6Gr9PcDRa2ueurgCAGn6L89X9UVcAcBOpK3UFAKSkrtQVAJCSulJXAEBK6kpdAQApqSt1BQCkpK7UFQCQUpZl/X4/ehTV+v1+lmUrTviZr7z6E1/+w/CKqvzzE1/+w5/5yqsX+nzVFQBsgjzP8zyPHkW1M8d299//ySe+9Gp4SFX++cSXXv1X//6PL/T5qisA2ATD4fDevXt5nq/VDFa/38/z/N69e8PhcMVpx+9//6f+xauf+NJ6zWD9xJf/8BNfevWn/sWrx+9//0KftboCgA0xHA7zPM+yrLM2sizL83x1Wo0dv//9u//vn/zsV1798d/6/TX587NfefVf/fs/vmhajdQVAEBa6goAICV1BQCQkroCAEhJXQEApKSuAABSUlcAACmpKwCAlNQVAEBK6goAIKWtF1988b333oseBgDAJnjvvfe2PvOZz/zJn/xJ9EgAADbBH//xH2997nOf+53f+Z3T09PowQAAPN9OT0//2T/7Z1u/8Ru/8elPf/rf/bt/Fz0eAIDn2+7u7i/+4i/+/2r6q97G2esGAAAAAElFTkSuQmCC\" /></p>\n\n<p>上图参数说明：<br />\n1.OpsManage.tasks.sched.updateAssets表示定期更新服务器或者虚拟机资产信息，不需要参数。</p>\n', '2018-09-12 10:25:13.262805', '2018-09-12 10:25:13.262948', 1, 3);
INSERT INTO `wiki_post` VALUES (5, 'OpsManage如何收集物理服务器的内存与硬盘信息 ', '<p>OpsManage服务器上执行以下操作：</p>\n\n<pre>\n<code>1、编辑ansible配置文件，修改配置，没有这个目录则新建。\n[defaults] \nlibrary        = /usr/share/ansible/my_modules/\n\n2、新建modules文件\n# cd /usr/share/ansible/my_modules/\n[root@localhost my_modules]# cat crawHw \n#!/usr/bin/env python\n# -*- coding: utf-8 -*-\nimport subprocess\nimport os\nimport sys\nimport json\n\ndef Mem():\n    memData = []\n    result = subprocess.Popen(&quot;dmidecode -t 17|awk &#39;/(Manufacturer|Size|Serial Number)/&#39;&quot;, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)\n    count = 0\n    dList = []\n    for line in result.stdout.readlines():\n        ds = line.replace(&#39;\\n&#39;,&#39;&#39;).lstrip()\n        dList.append(ds)\n    new_count = 0\n    for ds in dList:\n        data = {}\n        if count &gt; len(dList)-1:break\n        try:\n            size = dList[count].split(&quot;:&quot;)[1].lstrip()\n            manufacturer = dList[count+1].split(&quot;:&quot;)[1].lstrip()\n            serial = dList[count+2].split(&quot;:&quot;)[1].lstrip()\n        except:\n            return False\n        if not size.startswith(&quot;No&quot;):\n            data[&#39;slot&#39;] = new_count\n            data[&#39;size&#39;] = size\n            data[&#39;manufacturer&#39;] = manufacturer\n            data[&#39;serial&#39;] = serial \n            memData.append(data)\n        count = count + 3\n        new_count = new_count + 1\n    return memData\n\ndef Disk():\n    diskData = []\n    result = subprocess.Popen(&quot;/opt/MegaRAID/MegaCli/MegaCli64 -PDlist -aALL|awk &#39;/(Slot Number|Raw Size|Firmware state|Inquiry Data)/&#39;&quot;, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)\n    count = 0\n    dList = []\n    for line in result.stdout.readlines():\n        ds = line.replace(&#39;\\n&#39;,&#39;&#39;).lstrip()\n        dList.append(ds)\n    for ds in dList:\n        data = {}\n        if count &gt; len(dList)-1:break\n        try:\n            slot = dList[count].split(&quot;:&quot;)[1].lstrip()\n            sizeList = dList[count+1].split(&quot;:&quot;)[1].split(&quot; &quot;)\n            while &#39;&#39; in sizeList:\n                sizeList.remove(&#39;&#39;)\n            statusList = dList[count+2].split(&quot;:&quot;)[1].split(&quot; &quot;)\n            while &#39;&#39; in statusList:\n                statusList.remove(&#39;&#39;)\n        except:\n            return False \n        try:       \n            inquiry = dList[count+3].split(&quot;:&quot;)[1].split(&quot; &quot;)\n            while &#39;&#39; in inquiry:\n                inquiry.remove(&#39;&#39;)\n            serial = inquiry[-1]\n            model =   inquiry[-2]\n            manufacturer = inquiry[-3]\n        except:\n            manufacturer = &#39;unknown&#39; \n        data[&#39;slot&#39;] = slot\n        data[&#39;size&#39;] = sizeList[0] + &#39;GB&#39;\n        data[&#39;status&#39;] = statusList[0].replace(&#39;,&#39;,&#39;&#39;)\n        data[&#39;manufacturer&#39;] = manufacturer\n        data[&#39;serial&#39;] = serial\n        data[&#39;model&#39;] = model\n        diskData.append(data)\n        count = count + 4\n    return diskData\n\nprint json.dumps({\n         &quot;changed&quot; : False,\n         &quot;ansible_facts&quot; : {\n         &quot;ansible_mem_detailed_info&quot; : Mem(),\n         &quot;ansible_disk_detailed_info&quot; : Disk()\n         }\n      })\nsys.exit(0)\n\nif __name__ == &#39;__main__&#39;:\n    #main()\n    Disk()\n</code></pre>\n\n<p>目标服务器安装：（dmidecode，MegaCli64）</p>\n', '2018-09-12 10:30:46.742328', '2018-09-12 10:30:46.742516', 1, 3);
INSERT INTO `wiki_post` VALUES (7, 'OpsManage出现http 503的可能性原因以及解决办法 ', '<p>1.palybook执行时间超过Django默认300秒响应时间<br />\n2.项目体积很大，初始化出现503<br />\n3.获取代码版本信息出现503，要解决执行git log或者svn checkout命令要输入密码的问题<br />\n4.部署代码出现503，请把服务器认证默认模式改成证书模式。</p>\n\n<p>1-2两点解决办法，启动django使用http_timeout参数：<br />\n<code>python manage.py runserver 0.0.0.0:8000 --http_timeout 1200</code></p>\n', '2018-09-12 10:33:07.335142', '2018-09-12 10:33:07.335310', 1, 3);

-- ----------------------------
-- Table structure for wiki_post_tags
-- ----------------------------
DROP TABLE IF EXISTS `wiki_post_tags`;
CREATE TABLE `wiki_post_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opsmanage_wiki_post_tags_post_id_tag_id_8d373a33_uniq`(`post_id`, `tag_id`) USING BTREE,
  INDEX `opsmanage_wiki_post__tag_id_6e68f598_fk_opsmanage`(`tag_id`) USING BTREE,
  CONSTRAINT `opsmanage_wiki_post__post_id_5663ab70_fk_opsmanage` FOREIGN KEY (`post_id`) REFERENCES `wiki_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `opsmanage_wiki_post__tag_id_6e68f598_fk_opsmanage` FOREIGN KEY (`tag_id`) REFERENCES `wiki_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wiki_post_tags
-- ----------------------------
INSERT INTO `wiki_post_tags` VALUES (1, 1, 1);
INSERT INTO `wiki_post_tags` VALUES (3, 3, 3);
INSERT INTO `wiki_post_tags` VALUES (5, 5, 5);
INSERT INTO `wiki_post_tags` VALUES (7, 7, 7);

-- ----------------------------
-- Table structure for wiki_tag
-- ----------------------------
DROP TABLE IF EXISTS `wiki_tag`;
CREATE TABLE `wiki_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wiki_tag
-- ----------------------------
INSERT INTO `wiki_tag` VALUES (1, 'mongo基本操作');
INSERT INTO `wiki_tag` VALUES (3, '任务调度');
INSERT INTO `wiki_tag` VALUES (7, '报错');
INSERT INTO `wiki_tag` VALUES (5, '磁盘信息收集');

-- ----------------------------
-- Table structure for yewuoraclecall
-- ----------------------------
DROP TABLE IF EXISTS `yewuoraclecall`;
CREATE TABLE `yewuoraclecall`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chanpin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `yewuoraclecall_chanpin_id_4b7fde17_fk_yewuTreeMptt_id`(`chanpin_id`) USING BTREE,
  CONSTRAINT `yewuoraclecall_chanpin_id_4b7fde17_fk_yewuTreeMptt_id` FOREIGN KEY (`chanpin_id`) REFERENCES `yewutreemptt` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yewuoraclecall_oraclenotowner
-- ----------------------------
DROP TABLE IF EXISTS `yewuoraclecall_oraclenotowner`;
CREATE TABLE `yewuoraclecall_oraclenotowner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yewuoraclecall_id` int(11) NOT NULL,
  `oraclecluster_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yewuoraclecall_OracleNot_yewuoraclecall_id_oracle_27861a75_uniq`(`yewuoraclecall_id`, `oraclecluster_id`) USING BTREE,
  INDEX `yewuoraclecall_Oracl_oraclecluster_id_580ecb7c_fk_Oracle_Cl`(`oraclecluster_id`) USING BTREE,
  CONSTRAINT `yewuoraclecall_Oracl_oraclecluster_id_580ecb7c_fk_Oracle_Cl` FOREIGN KEY (`oraclecluster_id`) REFERENCES `oracle_cluster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `yewuoraclecall_Oracl_yewuoraclecall_id_e5e6fd58_fk_yewuoracl` FOREIGN KEY (`yewuoraclecall_id`) REFERENCES `yewuoraclecall` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yewutreemptt
-- ----------------------------
DROP TABLE IF EXISTS `yewutreemptt`;
CREATE TABLE `yewutreemptt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `href` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED NOT NULL,
  `rght` int(10) UNSIGNED NOT NULL,
  `tree_id` int(10) UNSIGNED NOT NULL,
  `mptt_level` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `isLast` tinyint(1) NOT NULL,
  `yewuxian_id` int(11) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `yewuTreeMptt_lft_453688da`(`lft`) USING BTREE,
  INDEX `yewuTreeMptt_rght_64a509e9`(`rght`) USING BTREE,
  INDEX `yewuTreeMptt_tree_id_cd36c0be`(`tree_id`) USING BTREE,
  INDEX `yewuTreeMptt_mptt_level_6181f7dd`(`mptt_level`) USING BTREE,
  INDEX `yewuTreeMptt_parent_id_3a6ce66d`(`parent_id`) USING BTREE,
  INDEX `yewuTreeMptt_yewuxian_id_2c56acbf_fk_yewuTreeMptt_id`(`yewuxian_id`) USING BTREE,
  CONSTRAINT `yewuTreeMptt_parent_id_3a6ce66d_fk_yewuTreeMptt_id` FOREIGN KEY (`parent_id`) REFERENCES `yewutreemptt` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `yewuTreeMptt_yewuxian_id_2c56acbf_fk_yewuTreeMptt_id` FOREIGN KEY (`yewuxian_id`) REFERENCES `yewutreemptt` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yewutreemptt
-- ----------------------------
INSERT INTO `yewutreemptt` VALUES (39, '根', NULL, 1, 48, 1, 0, NULL, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (42, 'ddd科技', NULL, 8, 33, 1, 1, 39, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (43, '测试节点', NULL, 18, 29, 1, 3, 44, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (44, 'tttt金融', NULL, 17, 30, 1, 2, 42, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (45, 'redis', '/cmdb/yewu_redis', 27, 28, 1, 4, 43, 1, 44, NULL);
INSERT INTO `yewutreemptt` VALUES (46, 'mongo', '/cmdb/yewu_mongo', 21, 22, 1, 4, 43, 1, 44, NULL);
INSERT INTO `yewutreemptt` VALUES (48, 'mysql', '/cmdb/yewu_mysql', 23, 24, 1, 4, 43, 1, 44, NULL);
INSERT INTO `yewutreemptt` VALUES (49, 'oracle', '/cmdb/yewu_oracle', 25, 26, 1, 4, 43, 1, 44, NULL);
INSERT INTO `yewutreemptt` VALUES (50, '运维自用', NULL, 34, 47, 1, 1, 39, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (51, 'rrrr控股', NULL, 2, 7, 1, 1, 39, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (52, '风控', NULL, 31, 32, 1, 2, 42, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (53, 'DB', NULL, 3, 4, 1, 2, 51, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (54, 'host', '/cmdb/yewu_host', 5, 6, 1, 2, 51, 1, 51, NULL);
INSERT INTO `yewutreemptt` VALUES (55, '体验', NULL, 35, 42, 1, 2, 50, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (56, '监控', NULL, 45, 46, 1, 2, 50, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (57, '备份', NULL, 43, 44, 1, 2, 50, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (58, 'host', '/cmdb/yewu_host', 36, 37, 1, 3, 55, 1, 55, NULL);
INSERT INTO `yewutreemptt` VALUES (59, 'mysql', '/cmdb/yewu_mysql', 38, 39, 1, 3, 55, 1, 55, NULL);
INSERT INTO `yewutreemptt` VALUES (60, 'oracle', '/cmdb/yewu_oracle', 40, 41, 1, 3, 55, 1, 55, NULL);
INSERT INTO `yewutreemptt` VALUES (61, '大数据', NULL, 9, 16, 1, 2, 42, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (62, '生产', NULL, 12, 15, 1, 3, 61, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (66, '测试', NULL, 10, 11, 1, 3, 61, 0, NULL, NULL);
INSERT INTO `yewutreemptt` VALUES (67, 'host', '/cmdb/yewu_host', 19, 20, 1, 4, 43, 1, 42, NULL);
INSERT INTO `yewutreemptt` VALUES (68, 'mysql', '/cmdb/yewu_mysql', 13, 14, 1, 4, 62, 1, 42, NULL);

SET FOREIGN_KEY_CHECKS = 1;
