-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for jftoken
CREATE DATABASE IF NOT EXISTS `jftoken` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jftoken`;

-- Dumping structure for table jftoken.api_data
CREATE TABLE IF NOT EXISTS `api_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table jftoken.api_data: ~0 rows (approximately)

-- Dumping structure for table jftoken.blocked_numbers
CREATE TABLE IF NOT EXISTS `blocked_numbers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table jftoken.blocked_numbers: ~0 rows (approximately)
INSERT IGNORE INTO `blocked_numbers` (`id`, `phone_number`, `created_at`, `updated_at`) VALUES
	(6, '6281233792074', '2024-02-26 04:41:15', '2024-02-26 04:41:15');

-- Dumping structure for table jftoken.calls
CREATE TABLE IF NOT EXISTS `calls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` bigint unsigned NOT NULL,
  `service_id` varchar(19) COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `token_letter` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token_number` int NOT NULL,
  `called_date` date NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `waiting_time` time DEFAULT NULL,
  `served_time` time DEFAULT NULL,
  `turn_around_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `call_status_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `calls_queue_id_foreign` (`queue_id`) USING BTREE,
  KEY `calls_service_id_foreign` (`service_id`) USING BTREE,
  KEY `calls_counter_id_foreign` (`counter_id`) USING BTREE,
  KEY `calls_user_id_foreign` (`user_id`) USING BTREE,
  KEY `calls_call_status_id_foreign` (`call_status_id`) USING BTREE,
  CONSTRAINT `calls_call_status_id_foreign` FOREIGN KEY (`call_status_id`) REFERENCES `call_statuses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `calls_counter_id_foreign` FOREIGN KEY (`counter_id`) REFERENCES `counters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `calls_queue_id_foreign` FOREIGN KEY (`queue_id`) REFERENCES `queues` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `calls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.calls: ~97 rows (approximately)
INSERT IGNORE INTO `calls` (`id`, `queue_id`, `service_id`, `counter_id`, `user_id`, `token_letter`, `token_number`, `called_date`, `started_at`, `ended_at`, `waiting_time`, `served_time`, `turn_around_time`, `created_at`, `updated_at`, `call_status_id`) VALUES
	(61, 440, '1', 1, 1, 'KK', 4, '2024-01-30', '2024-01-30 14:39:54', '2024-01-30 16:23:17', '00:40:23', '01:43:23', '02:23:46', '2024-01-30 07:39:54', '2024-01-30 09:23:17', 1),
	(62, 441, '1', 1, 1, 'KK', 5, '2024-01-30', '2024-01-30 16:23:19', '2024-01-30 16:23:22', '01:31:32', NULL, NULL, '2024-01-30 09:23:19', '2024-01-30 09:23:22', 2),
	(63, 442, '1', 2, 1, 'KK', 6, '2024-01-30', '2024-01-30 20:40:12', '2024-01-30 20:40:45', '00:00:13', NULL, NULL, '2024-01-30 13:40:12', '2024-01-30 13:40:45', 2),
	(64, 443, '1', 2, 1, 'KK', 7, '2024-01-30', '2024-01-30 20:40:58', NULL, '00:00:09', NULL, NULL, '2024-01-30 13:40:58', '2024-01-30 13:40:58', NULL),
	(66, 476, '3', 1, 1, 'AK', 1, '2024-02-02', '2024-02-02 07:47:37', '2024-02-02 07:48:43', '00:20:10', '00:01:06', '00:21:16', '2024-02-02 00:48:07', '2024-02-02 00:48:43', 1),
	(67, 483, '3', 1, 1, 'AK', 2, '2024-02-02', '2024-02-02 07:48:51', NULL, '00:01:25', NULL, NULL, '2024-02-02 00:48:51', '2024-02-02 00:48:51', NULL),
	(70, 486, '2', 1, 1, 'KE', 1, '2024-02-05', '2024-02-05 15:08:50', '2024-02-05 15:09:10', '00:00:17', '00:00:20', '00:00:37', '2024-02-05 08:09:04', '2024-02-05 08:09:10', 1),
	(85, 487, '2', 1, 1, 'KE', 2, '2024-02-05', '2024-02-05 15:09:14', '2024-02-05 15:10:24', '00:00:34', '00:01:10', '00:01:44', '2024-02-05 08:10:14', '2024-02-05 08:10:24', 1),
	(92, 488, '2', 1, 1, 'KE', 3, '2024-02-05', '2024-02-05 15:10:27', '2024-02-05 15:15:05', '00:00:07', NULL, NULL, '2024-02-05 08:15:02', '2024-02-05 08:15:05', 2),
	(97, 489, '2', 1, 1, 'KE', 4, '2024-02-05', '2024-02-05 15:15:07', NULL, '00:00:17', NULL, NULL, '2024-02-05 08:15:32', '2024-02-05 08:15:32', NULL),
	(99, 490, '3', 1, 1, 'AK', 1, '2024-02-05', '2024-02-05 15:16:02', NULL, '00:00:14', NULL, NULL, '2024-02-05 08:18:55', '2024-02-05 08:18:55', NULL),
	(105, 492, '4', 1, 1, 'AM', 1, '2024-02-05', '2024-02-05 15:20:18', '2024-02-05 15:44:17', '00:00:48', '00:23:59', '00:24:47', '2024-02-05 08:44:14', '2024-02-05 08:44:17', 1),
	(107, 493, '4', 1, 1, 'AM', 2, '2024-02-05', '2024-02-05 15:44:19', NULL, '00:24:40', NULL, NULL, '2024-02-05 08:44:24', '2024-02-05 08:44:24', NULL),
	(108, 509, '6', 2, 1, 'K', 1, '2024-02-07', '2024-02-07 08:54:51', '2024-02-07 08:54:56', '00:00:45', NULL, NULL, '2024-02-07 01:54:51', '2024-02-07 01:54:56', 2),
	(109, 513, '6', 2, 1, 'K', 2, '2024-02-07', '2024-02-07 08:54:59', '2024-02-07 08:59:01', '00:00:32', '00:04:02', '00:04:34', '2024-02-07 01:54:59', '2024-02-07 01:59:01', 1),
	(117, 515, '6', 2, 1, 'K', 3, '2024-02-07', '2024-02-07 17:00:37', '2024-02-07 17:01:53', '08:00:18', '00:01:16', '08:01:34', '2024-02-07 10:01:47', '2024-02-07 10:01:53', 1),
	(135, 516, '6', 2, 1, 'K', 4, '2024-02-07', '2024-02-07 17:01:56', '2024-02-07 17:07:35', '08:01:34', '00:05:39', '08:07:13', '2024-02-07 10:07:31', '2024-02-07 10:07:35', 1),
	(150, 514, '2', 2, 1, 'KE', 1, '2024-02-07', '2024-02-07 17:07:42', '2024-02-07 17:09:13', '08:07:59', NULL, NULL, '2024-02-07 10:09:10', '2024-02-07 10:09:13', 2),
	(186, 512, '3', 2, 1, 'AK', 1, '2024-02-07', '2024-02-07 17:09:25', '2024-02-07 17:12:56', '08:15:03', NULL, NULL, '2024-02-07 10:12:52', '2024-02-07 10:12:56', 2),
	(327, 511, '4', 2, 1, 'AM', 1, '2024-02-07', '2024-02-07 17:13:07', '2024-02-07 17:39:05', '08:18:49', NULL, NULL, '2024-02-07 10:39:01', '2024-02-07 10:39:05', 2),
	(360, 517, '6', 2, 1, 'K', 5, '2024-02-07', '2024-02-07 17:39:31', NULL, '08:39:06', NULL, NULL, '2024-02-07 10:45:09', '2024-02-07 10:45:09', NULL),
	(361, 539, '2', 1, 1, 'KE', 1, '2024-02-08', '2024-02-08 21:01:54', '2024-02-08 21:02:52', '01:16:12', '00:00:58', '01:17:10', '2024-02-08 14:01:54', '2024-02-08 14:02:52', 1),
	(362, 540, '3', 1, 1, 'AK', 1, '2024-02-08', '2024-02-08 21:03:01', '2024-02-08 21:03:03', '01:16:12', '00:00:02', '01:16:14', '2024-02-08 14:03:01', '2024-02-08 14:03:03', 1),
	(363, 541, '3', 1, 1, 'AK', 2, '2024-02-08', '2024-02-08 21:03:05', NULL, '01:16:12', NULL, NULL, '2024-02-08 14:03:05', '2024-02-08 14:03:05', NULL),
	(364, 544, '5', 1, 1, 'PD', 1, '2024-02-09', '2024-02-09 06:27:15', '2024-02-09 06:27:24', '00:00:24', '00:00:09', '00:00:33', '2024-02-08 23:27:15', '2024-02-08 23:27:24', 1),
	(365, 545, '5', 1, 1, 'PD', 2, '2024-02-09', '2024-02-09 06:27:25', '2024-02-09 06:27:27', '00:00:31', NULL, NULL, '2024-02-08 23:27:25', '2024-02-08 23:27:27', 2),
	(366, 546, '5', 1, 1, 'PD', 3, '2024-02-09', '2024-02-09 06:52:03', NULL, '00:25:06', NULL, NULL, '2024-02-08 23:52:03', '2024-02-08 23:52:03', NULL),
	(367, 547, '5', 4, 1, 'PD', 4, '2024-02-09', '2024-02-09 06:52:22', '2024-02-09 06:52:29', '00:25:22', '00:00:07', '00:25:29', '2024-02-08 23:52:22', '2024-02-08 23:52:29', 1),
	(369, 548, '5', 4, 1, 'PD', 5, '2024-02-09', '2024-02-09 06:52:33', '2024-02-09 06:52:42', '00:25:30', NULL, NULL, '2024-02-08 23:52:36', '2024-02-08 23:52:42', 2),
	(371, 549, '5', 4, 1, 'PD', 6, '2024-02-09', '2024-02-09 07:02:30', '2024-02-09 07:02:39', '00:04:36', NULL, NULL, '2024-02-09 00:02:36', '2024-02-09 00:02:39', 2),
	(372, 550, '5', 4, 1, 'PD', 7, '2024-02-09', '2024-02-09 07:02:41', '2024-02-09 07:02:44', '00:04:43', NULL, NULL, '2024-02-09 00:02:41', '2024-02-09 00:02:44', 2),
	(373, 551, '5', 4, 1, 'PD', 8, '2024-02-09', '2024-02-09 07:06:39', '2024-02-09 07:34:35', '00:08:37', NULL, NULL, '2024-02-09 00:06:39', '2024-02-09 00:34:35', 2),
	(375, 552, '5', 4, 1, 'PD', 9, '2024-02-09', '2024-02-09 07:34:38', '2024-02-09 07:34:49', '00:36:32', NULL, NULL, '2024-02-09 00:34:47', '2024-02-09 00:34:49', 2),
	(377, 553, '5', 4, 1, 'PD', 10, '2024-02-09', '2024-02-09 07:34:53', '2024-02-09 07:35:44', '00:36:41', '00:00:51', '00:37:32', '2024-02-09 00:35:14', '2024-02-09 00:35:44', 1),
	(378, 563, '3', 5, 1, 'AK', 1, '2024-02-11', '2024-02-11 07:23:40', NULL, '01:52:34', NULL, NULL, '2024-02-11 00:23:40', '2024-02-11 00:23:40', NULL),
	(379, 565, '4', 4, 1, 'AM', 1, '2024-02-11', '2024-02-11 07:35:57', '2024-02-11 07:36:00', '01:57:10', NULL, NULL, '2024-02-11 00:35:57', '2024-02-11 00:36:00', 2),
	(380, 571, '4', 4, 1, 'AM', 2, '2024-02-11', '2024-02-11 07:36:01', '2024-02-11 07:36:03', '01:56:34', '00:00:02', '01:56:36', '2024-02-11 00:36:01', '2024-02-11 00:36:03', 1),
	(381, 567, '3', 4, 1, 'AK', 2, '2024-02-11', '2024-02-11 07:36:25', '2024-02-11 07:36:31', '01:57:22', '00:00:06', '01:57:28', '2024-02-11 00:36:25', '2024-02-11 00:36:31', 1),
	(382, 572, '3', 4, 1, 'AK', 3, '2024-02-11', '2024-02-11 07:36:32', '2024-02-11 07:36:34', '01:56:59', NULL, NULL, '2024-02-11 00:36:32', '2024-02-11 00:36:34', 2),
	(393, 566, '5', 4, 1, 'PD', 1, '2024-02-11', '2024-02-11 13:11:48', NULL, '07:32:52', NULL, NULL, '2024-02-11 06:13:14', '2024-02-11 06:13:14', NULL),
	(394, 578, '4', 5, 1, 'AM', 1, '2024-02-12', '2024-02-12 10:21:07', '2024-02-12 10:24:01', '00:01:06', NULL, NULL, '2024-02-12 03:21:07', '2024-02-12 03:24:01', 2),
	(395, 576, '5', 3, 1, 'PD', 1, '2024-02-12', '2024-02-12 14:34:42', '2024-02-12 14:34:55', '04:14:49', '00:00:13', '04:15:02', '2024-02-12 07:34:42', '2024-02-12 07:34:55', 1),
	(396, 574, '2', 3, 1, 'KE', 1, '2024-02-12', '2024-02-12 14:35:02', '2024-02-12 14:35:04', '04:15:18', NULL, NULL, '2024-02-12 07:35:02', '2024-02-12 07:35:04', 2),
	(398, 580, '2', 3, 1, 'KE', 2, '2024-02-12', '2024-02-12 14:35:06', '2024-02-12 14:35:11', '04:14:50', '00:00:05', '04:14:55', '2024-02-12 07:35:09', '2024-02-12 07:35:11', 1),
	(399, 579, '4', 3, 1, 'AM', 2, '2024-02-12', '2024-02-12 14:35:26', '2024-02-12 14:35:30', '04:15:21', '00:00:04', '04:15:25', '2024-02-12 07:35:26', '2024-02-12 07:35:30', 1),
	(400, 575, '6', 3, 1, 'K', 1, '2024-02-12', '2024-02-12 14:35:57', NULL, '04:16:07', NULL, NULL, '2024-02-12 07:35:57', '2024-02-12 07:35:57', NULL),
	(401, 581, '3', 4, 1, 'AK', 1, '2024-02-13', '2024-02-13 10:22:45', '2024-02-13 10:22:48', '00:00:23', '00:00:03', '00:00:26', '2024-02-13 03:22:45', '2024-02-13 03:22:48', 1),
	(402, 582, '3', 4, 1, 'AK', 2, '2024-02-13', '2024-02-13 10:22:51', '2024-02-13 10:22:53', '00:00:21', NULL, NULL, '2024-02-13 03:22:51', '2024-02-13 03:22:53', 2),
	(403, 586, '6', 2, 1, 'K', 1, '2024-02-15', '2024-02-15 10:00:52', '2024-02-15 10:01:06', '00:01:36', '00:00:14', '00:01:50', '2024-02-15 03:00:52', '2024-02-15 03:01:06', 1),
	(404, 587, '6', 2, 1, 'K', 2, '2024-02-15', '2024-02-15 10:01:08', '2024-02-15 10:01:11', '00:01:48', NULL, NULL, '2024-02-15 03:01:08', '2024-02-15 03:01:11', 2),
	(405, 588, '6', 2, 1, 'K', 3, '2024-02-15', '2024-02-15 10:01:39', '2024-02-15 10:01:41', '00:02:14', NULL, NULL, '2024-02-15 03:01:39', '2024-02-15 03:01:41', 2),
	(406, 589, '6', 2, 1, 'K', 4, '2024-02-15', '2024-02-15 10:01:43', '2024-02-15 10:01:45', '00:02:13', NULL, NULL, '2024-02-15 03:01:43', '2024-02-15 03:01:45', 2),
	(407, 590, '6', 2, 1, 'K', 5, '2024-02-15', '2024-02-15 10:01:48', '2024-02-15 10:01:50', '00:02:16', '00:00:02', '00:02:18', '2024-02-15 03:01:48', '2024-02-15 03:01:50', 1),
	(408, 591, '6', 2, 1, 'K', 6, '2024-02-15', '2024-02-15 10:02:31', '2024-02-15 10:02:40', '00:02:52', '00:00:09', '00:03:01', '2024-02-15 03:02:31', '2024-02-15 03:02:40', 1),
	(409, 592, '6', 2, 1, 'K', 7, '2024-02-15', '2024-02-15 10:02:46', '2024-02-15 10:03:22', '00:03:01', '00:00:36', '00:03:37', '2024-02-15 03:02:46', '2024-02-15 03:03:22', 1),
	(410, 593, '6', 2, 1, 'K', 8, '2024-02-15', '2024-02-15 10:03:50', '2024-02-15 10:03:58', '00:00:21', NULL, NULL, '2024-02-15 03:03:50', '2024-02-15 03:03:58', 2),
	(411, 594, '6', 2, 1, 'K', 9, '2024-02-15', '2024-02-15 10:04:03', '2024-02-15 11:03:18', '00:00:29', NULL, NULL, '2024-02-15 03:04:03', '2024-02-15 04:03:18', 2),
	(413, 595, '6', 2, 1, 'K', 10, '2024-02-15', '2024-02-15 11:03:25', '2024-02-15 11:03:34', '00:59:46', NULL, NULL, '2024-02-15 04:03:31', '2024-02-15 04:03:34', 2),
	(414, 596, '6', 2, 1, 'K', 11, '2024-02-15', '2024-02-15 11:03:37', '2024-02-15 11:03:39', '00:59:53', '00:00:02', '00:59:55', '2024-02-15 04:03:37', '2024-02-15 04:03:39', 1),
	(415, 597, '6', 5, 1, 'K', 12, '2024-02-15', '2024-02-15 16:17:52', NULL, '00:00:17', NULL, NULL, '2024-02-15 09:17:52', '2024-02-15 09:17:52', NULL),
	(416, 599, '6', 3, 1, 'K', 1, '2024-02-16', '2024-02-16 07:41:03', '2024-02-16 07:41:07', '00:00:27', NULL, NULL, '2024-02-16 00:41:03', '2024-02-16 00:41:07', 2),
	(417, 600, '6', 3, 1, 'K', 2, '2024-02-16', '2024-02-16 07:41:09', '2024-02-16 07:41:58', '00:00:27', '00:00:49', '00:01:16', '2024-02-16 00:41:09', '2024-02-16 00:41:58', 1),
	(418, 616, '3', 4, 1, 'AK', 1, '2024-02-18', '2024-02-18 10:31:12', NULL, '01:39:55', NULL, NULL, '2024-02-18 03:31:12', '2024-02-18 03:31:12', NULL),
	(419, 617, '3', 1, 1, 'AK', 2, '2024-02-18', '2024-02-18 10:40:49', NULL, '01:49:28', NULL, NULL, '2024-02-18 03:40:49', '2024-02-18 03:40:49', NULL),
	(420, 618, '1', 4, 1, 'KK', 1, '2024-02-19', '2024-02-19 09:55:50', '2024-02-19 09:56:33', '00:06:43', '00:00:43', '00:07:26', '2024-02-19 02:55:50', '2024-02-19 02:56:33', 1),
	(422, 619, '4', 4, 1, 'AM', 1, '2024-02-19', '2024-02-19 09:56:44', '2024-02-19 13:38:37', '00:00:26', '03:41:53', '03:42:19', '2024-02-19 02:56:46', '2024-02-19 06:38:37', 1),
	(424, 620, '4', 2, 1, 'AM', 2, '2024-02-19', '2024-02-19 15:16:48', NULL, '05:20:25', NULL, NULL, '2024-02-19 08:16:50', '2024-02-19 08:16:50', NULL),
	(425, 621, '4', 3, 1, 'AM', 3, '2024-02-19', '2024-02-19 15:40:59', '2024-02-19 15:41:10', '05:44:32', '00:00:11', '05:44:43', '2024-02-19 08:40:59', '2024-02-19 08:41:10', 1),
	(426, 623, '6', 4, 1, 'K', 1, '2024-02-19', '2024-02-19 19:09:24', '2024-02-19 19:09:26', '04:40:24', '00:00:02', '04:40:26', '2024-02-19 12:09:24', '2024-02-19 12:09:26', 1),
	(427, 625, '6', 4, 1, 'K', 2, '2024-02-19', '2024-02-19 19:09:29', '2024-02-19 19:09:31', '00:00:45', NULL, NULL, '2024-02-19 12:09:29', '2024-02-19 12:09:31', 2),
	(428, 626, '6', 4, 1, 'K', 3, '2024-02-19', '2024-02-19 19:09:41', '2024-02-19 19:09:43', '00:00:47', '00:00:02', '00:00:49', '2024-02-19 12:09:41', '2024-02-19 12:09:43', 1),
	(429, 627, '6', 4, 1, 'K', 4, '2024-02-19', '2024-02-19 19:09:45', '2024-02-19 19:09:48', '00:00:45', NULL, NULL, '2024-02-19 12:09:45', '2024-02-19 12:09:48', 2),
	(430, 628, '6', 4, 1, 'K', 5, '2024-02-19', '2024-02-19 19:35:46', '2024-02-19 19:35:49', '00:26:42', '00:00:03', '00:26:45', '2024-02-19 12:35:46', '2024-02-19 12:35:49', 1),
	(431, 629, '6', 4, 1, 'K', 6, '2024-02-19', '2024-02-19 19:49:39', '2024-02-19 19:49:41', '00:40:32', '00:00:02', '00:40:34', '2024-02-19 12:49:39', '2024-02-19 12:49:41', 1),
	(432, 630, '6', 4, 1, 'K', 7, '2024-02-19', '2024-02-19 19:49:43', '2024-02-19 19:49:45', '00:40:33', NULL, NULL, '2024-02-19 12:49:43', '2024-02-19 12:49:45', 2),
	(433, 631, '6', 3, 1, 'K', 1, '2024-02-20', '2024-02-20 17:43:22', '2024-02-20 17:43:24', '01:39:39', NULL, NULL, '2024-02-20 10:43:22', '2024-02-20 10:43:24', 2),
	(434, 632, '6', 3, 1, 'K', 2, '2024-02-20', '2024-02-20 17:43:26', '2024-02-20 17:43:28', '00:01:43', '00:00:02', '00:01:45', '2024-02-20 10:43:26', '2024-02-20 10:43:28', 1),
	(435, 633, '6', 3, 1, 'K', 3, '2024-02-20', '2024-02-20 17:43:30', '2024-02-20 17:43:32', '00:00:50', '00:00:02', '00:00:52', '2024-02-20 10:43:30', '2024-02-20 10:43:32', 1),
	(436, 634, '6', 3, 1, 'K', 4, '2024-02-20', '2024-02-20 20:40:19', '2024-02-20 20:40:22', '00:00:28', NULL, NULL, '2024-02-20 13:40:19', '2024-02-20 13:40:22', 2),
	(437, 635, '6', 3, 1, 'K', 5, '2024-02-20', '2024-02-20 20:40:24', '2024-02-20 20:40:26', '00:00:26', '00:00:02', '00:00:28', '2024-02-20 13:40:24', '2024-02-20 13:40:26', 1),
	(438, 636, '6', 3, 1, 'K', 6, '2024-02-20', '2024-02-20 20:40:28', '2024-02-20 20:40:31', '00:00:23', NULL, NULL, '2024-02-20 13:40:28', '2024-02-20 13:40:31', 2),
	(439, 640, '4', 4, 1, 'AM', 1, '2024-02-21', '2024-02-21 10:43:00', '2024-02-21 10:43:02', '00:01:01', NULL, NULL, '2024-02-21 03:43:00', '2024-02-21 03:43:02', 2),
	(440, 641, '4', 4, 1, 'AM', 2, '2024-02-21', '2024-02-21 10:43:04', '2024-02-21 10:43:08', '00:00:58', '00:00:04', '00:01:02', '2024-02-21 03:43:04', '2024-02-21 03:43:08', 1),
	(441, 637, '6', 4, 1, 'K', 1, '2024-02-21', '2024-02-21 10:43:19', '2024-02-21 10:43:23', '00:01:45', '00:00:04', '00:01:49', '2024-02-21 03:43:19', '2024-02-21 03:43:23', 1),
	(442, 638, '6', 4, 1, 'K', 2, '2024-02-21', '2024-02-21 10:44:03', '2024-02-21 10:44:06', '00:02:23', '00:00:03', '00:02:26', '2024-02-21 03:44:03', '2024-02-21 03:44:06', 1),
	(443, 639, '6', 4, 1, 'K', 3, '2024-02-21', '2024-02-21 10:44:07', '2024-02-21 10:44:09', '00:02:22', NULL, NULL, '2024-02-21 03:44:07', '2024-02-21 03:44:09', 2),
	(444, 642, '6', 4, 1, 'K', 4, '2024-02-21', '2024-02-21 10:44:49', '2024-02-21 10:44:51', '00:00:30', NULL, NULL, '2024-02-21 03:44:49', '2024-02-21 03:44:51', 2),
	(445, 643, '6', 4, 1, 'K', 5, '2024-02-21', '2024-02-21 10:44:53', '2024-02-21 10:44:55', '00:00:25', '00:00:02', '00:00:27', '2024-02-21 03:44:53', '2024-02-21 03:44:55', 1),
	(446, 644, '6', 4, 1, 'K', 6, '2024-02-21', '2024-02-21 10:44:57', '2024-02-21 10:44:59', '00:00:23', NULL, NULL, '2024-02-21 03:44:57', '2024-02-21 03:44:59', 2),
	(447, 645, '6', 4, 1, 'K', 7, '2024-02-21', '2024-02-21 10:45:00', '2024-02-21 10:45:03', '00:00:21', '00:00:03', '00:00:24', '2024-02-21 03:45:00', '2024-02-21 03:45:03', 1),
	(448, 646, '6', 4, 1, 'K', 8, '2024-02-21', '2024-02-21 10:45:05', '2024-02-21 10:45:08', '00:00:22', '00:00:03', '00:00:25', '2024-02-21 03:45:05', '2024-02-21 03:45:08', 1),
	(449, 661, '6', 3, 3, 'K', 1, '2024-02-22', '2024-02-22 11:03:37', '2024-02-22 11:03:39', '03:20:18', NULL, NULL, '2024-02-22 04:03:37', '2024-02-22 04:03:39', 2),
	(450, 662, '6', 3, 3, 'K', 2, '2024-02-22', '2024-02-22 11:03:46', '2024-02-22 11:03:48', '03:20:20', '00:00:02', '03:20:22', '2024-02-22 04:03:46', '2024-02-22 04:03:48', 1),
	(451, 663, '6', 3, 3, 'K', 3, '2024-02-22', '2024-02-22 11:03:50', '2024-02-22 11:03:54', '03:20:18', NULL, NULL, '2024-02-22 04:03:50', '2024-02-22 04:03:54', 2),
	(452, 664, '6', 3, 3, 'K', 4, '2024-02-22', '2024-02-22 11:03:56', '2024-02-22 11:03:59', '03:20:19', '00:00:03', '03:20:22', '2024-02-22 04:03:56', '2024-02-22 04:03:59', 1),
	(453, 665, '6', 3, 3, 'K', 5, '2024-02-22', '2024-02-22 11:04:02', '2024-02-22 11:04:05', '03:20:20', '00:00:03', '03:20:23', '2024-02-22 04:04:02', '2024-02-22 04:04:05', 1),
	(454, 669, '6', 3, 3, 'K', 6, '2024-02-22', '2024-02-22 11:04:08', '2024-02-22 11:04:09', '00:14:05', NULL, NULL, '2024-02-22 04:04:08', '2024-02-22 04:04:09', 2),
	(455, 670, '6', 3, 3, 'K', 7, '2024-02-22', '2024-02-22 11:04:12', '2024-02-22 11:04:14', '00:14:33', '00:00:02', '00:14:35', '2024-02-22 04:04:12', '2024-02-22 04:04:14', 1),
	(456, 666, '7', 3, 3, 'KO', 1, '2024-02-22', '2024-02-22 11:05:24', '2024-02-22 11:05:26', '00:19:05', '00:00:02', '00:19:07', '2024-02-22 04:05:24', '2024-02-22 04:05:26', 1),
	(457, 667, '7', 3, 3, 'KO', 2, '2024-02-22', '2024-02-22 11:05:28', '2024-02-22 11:05:30', '00:19:03', NULL, NULL, '2024-02-22 04:05:28', '2024-02-22 04:05:30', 2),
	(458, 668, '7', 3, 3, 'KO', 3, '2024-02-22', '2024-02-22 11:05:33', '2024-02-22 11:05:35', '00:18:43', '00:00:02', '00:18:45', '2024-02-22 04:05:33', '2024-02-22 04:05:35', 1),
	(459, 679, '7', 3, 3, 'KO', 4, '2024-02-22', '2024-02-22 11:05:43', '2024-02-22 11:05:46', '00:09:40', '00:00:03', '00:09:43', '2024-02-22 04:05:43', '2024-02-22 04:05:46', 1);

-- Dumping structure for table jftoken.call_statuses
CREATE TABLE IF NOT EXISTS `call_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.call_statuses: ~2 rows (approximately)
INSERT IGNORE INTO `call_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'served', '2023-06-13 19:55:36', '2023-06-13 19:55:36'),
	(2, 'noshow', '2023-06-13 19:55:36', '2023-06-13 19:55:36');

-- Dumping structure for table jftoken.counters
CREATE TABLE IF NOT EXISTS `counters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.counters: ~4 rows (approximately)
INSERT IGNORE INTO `counters` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Konter 1', 1, '2023-06-22 09:51:06', '2023-06-22 09:51:06'),
	(2, 'Konter 2', 1, '2023-06-22 09:51:15', '2023-06-22 09:51:15'),
	(3, 'Konter 3', 1, '2023-11-02 09:44:22', '2023-11-02 09:44:22'),
	(4, 'Konter 4', 1, '2023-11-02 09:44:32', '2023-11-02 09:44:32'),
	(5, 'Konter 5', 1, '2023-11-02 09:44:40', '2023-11-02 09:44:40');

-- Dumping structure for table jftoken.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table jftoken.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `jobs_queue_index` (`queue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.jobs: ~0 rows (approximately)

-- Dumping structure for table jftoken.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `display` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `token_translation` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `please_proceed_to_translation` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `languages_code_unique` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.languages: ~8 rows (approximately)
INSERT IGNORE INTO `languages` (`id`, `code`, `name`, `display`, `image`, `created_at`, `updated_at`, `token_translation`, `please_proceed_to_translation`) VALUES
	(1, 'gb', 'English', 'US English Female', NULL, '2023-06-13 19:55:36', '2023-06-13 19:55:36', 'Token', 'Please Proceed to'),
	(2, 'fr', 'French', 'French Female', NULL, '2023-06-13 19:55:36', '2023-06-13 19:55:36', 'Jeton', 'Veuillez passer à'),
	(3, 'in', 'Hindi', 'Hindi Female', NULL, '2023-06-13 19:55:36', '2023-06-13 19:55:36', ' टोकन', ' कृपया आगे बढ़ें'),
	(4, 'sa', 'Arabic', 'Arabic Male', NULL, '2023-06-13 19:55:36', '2023-06-13 19:55:36', ' رمز', 'يرجى المتابعة إلى'),
	(5, 'es', 'Spanish', 'Spanish Female', NULL, '2023-06-13 19:55:36', '2023-06-13 19:55:36', ' simbólico', 'por favor proceda a'),
	(6, 'pt', 'Portuguese', 'Portuguese Female', NULL, '2023-06-13 19:55:36', '2023-06-13 19:55:36', ' símbolo', 'Por favor, prossiga para'),
	(7, 'it', 'Italian', 'Italian Female', NULL, '2023-06-13 19:55:36', '2023-06-13 19:55:36', ' gettone', 'si prega di procedere a'),
	(8, 'id', 'Indonesian', 'Indonesian Female', NULL, '2023-06-13 19:55:36', '2023-06-22 09:41:03', 'No Antrian', 'silakan menuju');

-- Dumping structure for table jftoken.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.migrations: ~40 rows (approximately)
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_07_16_161740_create_services_table', 1),
	(4, '2016_07_16_180929_create_counters_table', 1),
	(5, '2016_07_16_190715_create_queues_table', 1),
	(6, '2016_07_19_170334_create_calls_table', 1),
	(7, '2016_08_24_231859_create_languages_table', 1),
	(8, '2016_09_28_123908_create_settings_table', 1),
	(9, '2019_08_19_000000_create_failed_jobs_table', 1),
	(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(11, '2022_01_25_093555_create_table_call_statuses', 1),
	(12, '2022_01_25_094223_add_column_call_status_id_to_calls', 1),
	(13, '2022_01_31_083907_alter_table_calls', 1),
	(14, '2022_02_05_075323_change_column_type_calls', 1),
	(15, '2022_02_11_053149_create_sessions_table', 1),
	(16, '2022_02_17_072255_create_permission_tables', 1),
	(17, '2022_02_18_095631_add_column_image_on_users', 1),
	(18, '2022_02_18_121934_add_columns__on_settings', 1),
	(19, '2022_03_04_061813_alter_table_languages', 1),
	(20, '2022_03_31_054417_alter_table_services', 1),
	(21, '2022_04_01_045644_alter_table_settings', 1),
	(22, '2022_04_01_085135_alter_table_queues', 1),
	(23, '2022_04_02_103600_create_jobs_table', 1),
	(24, '2022_07_02_052217_add_column_to_settings_table', 1),
	(25, '2023_12_28_061411_offline_queue_limit', 2),
	(26, '2023_12_28_062407_online_queue_limit', 2),
	(27, '2024_01_17_083745_offline_limit', 3),
	(28, '2024_01_17_083941_online_limit', 4),
	(29, '2024_01_17_090516_offline_limit', 5),
	(30, '2024_01_17_090546_online_limit', 5),
	(31, '2024_01_19_061257_role_id', 6),
	(32, '2024_01_19_061645_role_id', 7),
	(33, '2024_01_19_075558_create_api_data_table', 8),
	(34, '2024_01_23_034448_on_time', 8),
	(35, '2024_01_23_034743_off_time', 8),
	(36, '2024_01_23_053349_create_operational_time_table', 9),
	(37, '2024_01_23_223506_nik', 10),
	(38, '2024_01_24_053005_status_online', 11),
	(39, '2024_01_24_053347_status', 11),
	(40, '2024_01_25_002835_ask_nik', 12),
	(41, '2024_01_26_030153_status_queue', 13),
	(42, '2024_02_23_055534_combined_limit', 14),
	(43, '2024_02_23_061828_limit', 14),
	(44, '2024_02_25_120659_create_blocked_numbers_table', 15);

-- Dumping structure for table jftoken.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table jftoken.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.model_has_roles: ~4 rows (approximately)
INSERT IGNORE INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(2, 'App\\Models\\User', 3),
	(2, 'App\\Models\\User', 5),
	(2, 'App\\Models\\User', 6);

-- Dumping structure for table jftoken.operational_time
CREATE TABLE IF NOT EXISTS `operational_time` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `on_time` time NOT NULL,
  `off_time` time NOT NULL,
  `day` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table jftoken.operational_time: ~11 rows (approximately)
INSERT IGNORE INTO `operational_time` (`id`, `on_time`, `off_time`, `day`, `created_at`, `updated_at`, `status`) VALUES
	(4, '00:00:00', '23:21:00', 'Tuesday', '2024-01-23 07:57:12', '2024-01-23 07:57:12', 'Online'),
	(5, '00:00:00', '23:21:00', 'Wednesday', '2024-01-23 07:57:12', '2024-01-23 07:57:12', 'Online'),
	(7, '00:00:00', '23:21:00', 'Thursday', '2024-01-23 07:57:12', '2024-01-23 07:57:12', 'Online'),
	(8, '00:00:00', '23:21:00', 'Friday', '2024-01-23 07:57:12', '2024-01-23 07:57:12', 'Online'),
	(11, '00:00:00', '23:21:00', 'Monday', '2024-01-24 05:42:18', '2024-01-24 05:42:18', 'Online'),
	(12, '00:00:00', '23:21:00', 'Tuesday', '2024-01-23 07:57:12', '2024-01-23 07:57:12', 'Offline'),
	(13, '00:00:00', '23:21:00', 'Wednesday', '2024-01-23 07:57:12', '2024-01-23 07:57:12', 'Offline'),
	(15, '00:00:00', '23:21:00', 'Thursday', '2024-01-23 07:57:12', '2024-01-23 07:57:12', 'Offline'),
	(16, '00:00:00', '23:21:00', 'Friday', '2024-01-23 07:57:12', '2024-02-02 00:27:03', 'Offline'),
	(18, '00:00:00', '23:21:00', 'Monday', '2024-01-24 05:42:18', '2024-01-24 05:42:18', 'Offline'),
	(19, '00:00:00', '23:21:00', 'Saturday', '2024-01-24 05:42:18', '2024-01-24 05:42:18', 'Offline'),
	(20, '00:00:00', '23:59:00', 'Sunday', '2024-02-10 22:36:08', '2024-02-10 22:36:58', 'Offline'),
	(21, '00:00:00', '23:59:00', 'Sunday', '2024-02-10 22:36:27', '2024-02-10 22:37:09', 'Online'),
	(22, '00:00:00', '23:59:00', 'Saturday', '2024-02-16 23:56:32', '2024-02-16 23:56:32', 'Online');

-- Dumping structure for table jftoken.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.password_resets: ~0 rows (approximately)

-- Dumping structure for table jftoken.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.permissions: ~11 rows (approximately)
INSERT IGNORE INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'view dashboard', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(2, 'view counters', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(3, 'view services', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(4, 'view users', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(5, 'call token', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(6, 'view settings', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(7, 'view reports', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(8, 'view user_roles', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(9, 'issue token', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(10, 'view display', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(11, 'view profile', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35');

-- Dumping structure for table jftoken.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table jftoken.queues
CREATE TABLE IF NOT EXISTS `queues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned NOT NULL,
  `number` int NOT NULL,
  `called` tinyint(1) NOT NULL,
  `reference_no` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `letter` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nik` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status_queue` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `queues_service_id_foreign` (`service_id`) USING BTREE,
  CONSTRAINT `queues_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=704 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.queues: ~202 rows (approximately)
INSERT IGNORE INTO `queues` (`id`, `service_id`, `number`, `called`, `reference_no`, `letter`, `name`, `email`, `phone`, `position`, `created_at`, `updated_at`, `nik`, `status_queue`) VALUES
	(436, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2024-01-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(437, 1, 1, 1, 'LWjikBe4R', 'KK', 'Nurul Azizah', NULL, '0', 0, '2024-01-30 04:39:18', '2024-01-30 04:45:21', '3578161503790017', 'Offline'),
	(438, 1, 2, 1, 'ffOgnv7N6', 'KK', 'Nurul Azizah', NULL, '0', 0, '2024-01-30 04:39:32', '2024-01-30 04:52:34', '3578161503790017', 'Offline'),
	(439, 1, 3, 1, 'VWRAuKI9S', 'KK', 'Nurul Azizah', NULL, '0', 0, '2024-01-30 04:39:49', '2024-01-30 05:22:58', '3578161503790017', 'Offline'),
	(440, 1, 4, 1, 'hOvIbpvMe', 'KK', 'Nurul Azizah', NULL, '0', 0, '2024-01-30 06:59:31', '2024-01-30 07:39:54', '3578161503790017', 'Offline'),
	(441, 1, 5, 1, 'tS5c90x7q', 'KK', 'Nurul Azizah', NULL, '0', 0, '2024-01-30 07:51:47', '2024-01-30 09:23:19', '3578161503790017', 'Offline'),
	(442, 1, 6, 1, 'AIuScRhg9', 'KK', 'Nurul Azizah', NULL, '0', 0, '2024-01-30 13:39:59', '2024-01-30 13:40:12', NULL, 'Offline'),
	(443, 1, 7, 1, 'g4SZnl94q', 'KK', 'Nurul Azizah', NULL, '0', 0, '2024-01-30 13:40:49', '2024-01-30 13:40:58', '3213164507740001', 'Offline'),
	(444, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2023-12-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(445, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2023-12-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(446, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2023-12-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(447, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2023-12-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(448, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2023-12-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(449, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2023-12-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(450, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2023-12-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(451, 3, 1, 0, 'uoNXIuPw0', 'AK', 'Nurul Azizah', '15', '0', 1, '2023-12-29 17:00:00', '2024-01-29 17:00:00', '3578161503790017', 'Online'),
	(452, 1, 1, 0, '2EnNdVEg7', 'KK', NULL, NULL, NULL, 1, '2024-01-31 10:10:01', '2024-01-31 10:10:01', NULL, 'Offline'),
	(453, 7, 1, 0, 'oB7FNHvNc', 'KO', NULL, NULL, NULL, 1, '2024-01-31 10:12:21', '2024-01-31 10:12:21', NULL, 'Offline'),
	(454, 5, 1, 0, '0G52h9h6p', 'PD', NULL, NULL, NULL, 1, '2024-01-31 10:12:26', '2024-01-31 10:12:26', NULL, 'Offline'),
	(455, 3, 1, 0, 'YGct0XlEI', 'AK', NULL, NULL, NULL, 1, '2024-01-31 10:16:34', '2024-01-31 10:16:34', NULL, 'Offline'),
	(456, 1, 2, 0, 'SKprkNUpT', 'KK', NULL, NULL, NULL, 2, '2024-01-31 10:29:59', '2024-01-31 10:29:59', NULL, 'Offline'),
	(457, 2, 1, 0, 'GfuJomqzn', 'KE', NULL, NULL, NULL, 1, '2024-01-31 10:30:21', '2024-01-31 10:30:21', NULL, 'Offline'),
	(458, 2, 1, 0, 'nkc2QiiTf', 'KE', NULL, NULL, NULL, 1, '2024-02-01 14:30:44', '2024-02-01 14:30:44', NULL, 'Offline'),
	(459, 6, 1, 0, 'zIWbAG6c8', 'K', NULL, NULL, NULL, 1, '2024-02-01 14:32:08', '2024-02-01 14:32:08', NULL, 'Offline'),
	(460, 6, 2, 0, 'YJUy5ZS68', 'K', NULL, NULL, NULL, 2, '2024-02-01 14:32:13', '2024-02-01 14:32:13', NULL, 'Offline'),
	(461, 3, 1, 0, 'Cq0bQSzIp', 'AK', NULL, NULL, NULL, 1, '2024-02-01 14:33:02', '2024-02-01 14:33:02', NULL, 'Offline'),
	(462, 4, 1, 0, 'yFIHPTiCD', 'AM', NULL, NULL, NULL, 1, '2024-02-01 14:33:11', '2024-02-01 14:33:11', NULL, 'Offline'),
	(463, 5, 1, 0, 'BFyDv0B7p', 'PD', NULL, NULL, NULL, 1, '2024-02-01 14:33:17', '2024-02-01 14:33:17', NULL, 'Offline'),
	(464, 6, 3, 0, '30BsnqlW4', 'K', NULL, NULL, NULL, 3, '2024-02-01 14:33:29', '2024-02-01 14:33:29', NULL, 'Offline'),
	(474, 7, 1, 0, 'pzi9as6J9', 'KO', 'Hanae Walsh', '15', '0', 1, '2024-02-01 17:00:00', '2024-02-01 17:00:00', '3213164507740001', 'Online'),
	(475, 2, 1, 0, 'N755AoicB', 'KE', NULL, NULL, NULL, 1, '2024-02-02 00:27:10', '2024-02-02 00:27:10', NULL, 'Offline'),
	(476, 3, 1, 1, 'zJFUmFGTF', 'AK', NULL, NULL, NULL, 0, '2024-02-02 00:27:27', '2024-02-02 00:47:37', NULL, 'Offline'),
	(477, 5, 1, 0, 'b7bnK5ocX', 'PD', NULL, NULL, NULL, 1, '2024-02-02 00:27:32', '2024-02-02 00:27:32', NULL, 'Offline'),
	(478, 5, 2, 0, 'K1OvY1XSu', 'PD', NULL, NULL, NULL, 2, '2024-02-02 00:27:33', '2024-02-02 00:27:33', NULL, 'Offline'),
	(479, 6, 1, 0, 'qaj3Q0gyD', 'K', NULL, NULL, NULL, 1, '2024-02-02 00:27:37', '2024-02-02 00:27:37', NULL, 'Offline'),
	(480, 7, 2, 0, 'wtMYbyrcr', 'KO', NULL, NULL, NULL, 2, '2024-02-02 00:27:48', '2024-02-02 00:27:48', NULL, 'Offline'),
	(481, 1, 1, 0, 'bL4kJVXLz', 'KK', NULL, NULL, NULL, 1, '2024-02-02 00:44:30', '2024-02-02 00:44:30', '3213164507740001', 'Offline'),
	(482, 1, 2, 0, 'x7FY0e2A5', 'KK', NULL, NULL, NULL, 2, '2024-02-02 00:44:43', '2024-02-02 00:44:43', '3578161503790017', 'Offline'),
	(483, 3, 2, 1, 'xrUy3SO0P', 'AK', NULL, NULL, NULL, 0, '2024-02-02 00:47:26', '2024-02-02 00:48:51', NULL, 'Offline'),
	(484, 2, 2, 0, 'CwnkQZQTS', 'KE', NULL, NULL, NULL, 2, '2024-02-02 00:47:32', '2024-02-02 00:47:32', NULL, 'Offline'),
	(485, 7, 1, 0, 'nsy6bgY5I', 'KO', 'Hanae Walsh', '15', '0', 1, '2024-02-04 17:00:00', '2024-02-04 17:00:00', '3213164507740001', 'Online'),
	(486, 2, 1, 1, 'pby5xqjF7', 'KE', NULL, NULL, NULL, 0, '2024-02-05 08:08:33', '2024-02-05 08:08:50', NULL, 'Offline'),
	(487, 2, 2, 1, '0BVxn6QHr', 'KE', NULL, NULL, NULL, 0, '2024-02-05 08:08:40', '2024-02-05 08:09:14', NULL, 'Offline'),
	(488, 2, 3, 1, 'SvwO3D997', 'KE', NULL, NULL, NULL, 0, '2024-02-05 08:10:20', '2024-02-05 08:10:27', NULL, 'Offline'),
	(489, 2, 4, 1, '1fDQKkEUW', 'KE', NULL, NULL, NULL, 0, '2024-02-05 08:14:50', '2024-02-05 08:15:07', NULL, 'Offline'),
	(490, 3, 1, 1, 'MMT9DRwLB', 'AK', NULL, NULL, NULL, 0, '2024-02-05 08:15:48', '2024-02-05 08:16:02', NULL, 'Offline'),
	(491, 2, 5, 0, 'rrGdl3vOh', 'KE', NULL, NULL, NULL, 1, '2024-02-05 08:19:21', '2024-02-05 08:19:21', NULL, 'Offline'),
	(492, 4, 1, 1, 'ZYmtTaSSu', 'AM', NULL, NULL, NULL, 0, '2024-02-05 08:19:30', '2024-02-05 08:20:18', NULL, 'Offline'),
	(493, 4, 2, 1, 'jSH4oJm64', 'AM', NULL, NULL, NULL, 0, '2024-02-05 08:19:39', '2024-02-05 08:44:19', NULL, 'Offline'),
	(494, 4, 3, 0, 'RbyO0GNdG', 'AM', NULL, NULL, NULL, 1, '2024-02-05 08:19:44', '2024-02-05 08:44:19', NULL, 'Offline'),
	(495, 4, 4, 0, 'Fzkx7LFjp', 'AM', NULL, NULL, NULL, 2, '2024-02-05 08:19:50', '2024-02-05 08:44:19', NULL, 'Offline'),
	(503, 1, 1, 0, 'FkAnLjzEk', 'KK', NULL, NULL, '', 1, '2024-02-06 08:04:51', '2024-02-06 08:04:51', NULL, 'Offline'),
	(506, 7, 1, 0, 'rxwMNRaDl', 'KO', 'nururl', '15', '6281233792074', 1, '2024-02-05 17:00:00', '2024-02-05 17:00:00', '3213164507740001', 'Online'),
	(509, 6, 1, 1, 'de9xqvRv7', 'K', NULL, NULL, NULL, 0, '2024-02-07 01:54:06', '2024-02-07 01:54:51', NULL, 'Offline'),
	(510, 7, 1, 0, 'zwasIjIwu', 'KO', NULL, NULL, NULL, 1, '2024-02-07 01:54:13', '2024-02-07 01:54:13', NULL, 'Offline'),
	(511, 4, 1, 1, 'oGVAYXofw', 'AM', NULL, NULL, NULL, 0, '2024-02-07 01:54:18', '2024-02-07 10:13:07', NULL, 'Offline'),
	(512, 3, 1, 1, '27hetEona', 'AK', NULL, NULL, NULL, 0, '2024-02-07 01:54:22', '2024-02-07 10:09:25', NULL, 'Offline'),
	(513, 6, 2, 1, 'p2UOYuLUi', 'K', NULL, NULL, NULL, 0, '2024-02-07 01:54:27', '2024-02-07 01:54:59', NULL, 'Offline'),
	(514, 2, 1, 1, 'H7A9GaMHD', 'KE', NULL, NULL, NULL, 0, '2024-02-07 01:59:43', '2024-02-07 10:07:42', NULL, 'Offline'),
	(515, 6, 3, 1, 'IlaNdd8Yh', 'K', NULL, NULL, NULL, 0, '2024-02-07 02:00:19', '2024-02-07 10:00:37', NULL, 'Offline'),
	(516, 6, 4, 1, 'mUlaqDHDK', 'K', NULL, NULL, NULL, 0, '2024-02-07 02:00:22', '2024-02-07 10:01:56', NULL, 'Offline'),
	(517, 6, 5, 1, 'ByMErYn6Q', 'K', NULL, NULL, NULL, 0, '2024-02-07 02:00:25', '2024-02-07 10:39:31', NULL, 'Offline'),
	(537, 1, 1, 0, 'DRI2PLioc', 'KK', NULL, NULL, '6281233792074', 1, '2024-02-07 08:17:19', '2024-02-07 08:17:19', NULL, 'Offline'),
	(538, 1, 2, 0, 'YFpcXwKP3', 'KK', NULL, NULL, '6281233792074', 2, '2024-02-07 08:20:37', '2024-02-07 08:20:37', NULL, 'Offline'),
	(539, 2, 1, 1, 'oBE7SHYPE', 'KE', NULL, NULL, NULL, 0, '2024-02-08 12:45:42', '2024-02-08 14:01:54', NULL, 'Offline'),
	(540, 3, 1, 1, 'WttursCMm', 'AK', NULL, NULL, NULL, 0, '2024-02-08 12:46:49', '2024-02-08 14:03:01', NULL, 'Offline'),
	(541, 3, 2, 1, 'VsQRf1Tvq', 'AK', NULL, NULL, NULL, 0, '2024-02-08 12:46:53', '2024-02-08 14:03:05', NULL, 'Offline'),
	(542, 6, 1, 0, 'NaPWBZCab', 'K', NULL, NULL, NULL, 1, '2024-02-08 14:03:23', '2024-02-08 14:03:23', NULL, 'Offline'),
	(543, 6, 2, 0, 'ExydsL1qO', 'K', NULL, NULL, NULL, 2, '2024-02-08 14:15:56', '2024-02-08 14:15:56', NULL, 'Offline'),
	(544, 5, 1, 1, 'ewTU5TC4Z', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:26:51', '2024-02-08 23:27:15', NULL, 'Offline'),
	(545, 5, 2, 1, 'F6ssFZkFR', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:26:54', '2024-02-08 23:27:25', NULL, 'Offline'),
	(546, 5, 3, 1, 'KirzNdGVV', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:26:57', '2024-02-08 23:52:03', NULL, 'Offline'),
	(547, 5, 4, 1, 'GVCGc2eBN', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:27:00', '2024-02-08 23:52:22', NULL, 'Offline'),
	(548, 5, 5, 1, 'LfFtxqJcD', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:27:03', '2024-02-08 23:52:33', NULL, 'Offline'),
	(549, 5, 6, 1, 'wFwyP9rj0', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:57:54', '2024-02-09 00:02:30', NULL, 'Offline'),
	(550, 5, 7, 1, 'GKAGl3x5C', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:57:58', '2024-02-09 00:02:41', NULL, 'Offline'),
	(551, 5, 8, 1, 'OaMZ1stCL', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:58:02', '2024-02-09 00:06:39', NULL, 'Offline'),
	(552, 5, 9, 1, 'TqluJj6rr', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:58:06', '2024-02-09 00:34:38', NULL, 'Offline'),
	(553, 5, 10, 1, 'vfZcuQKxg', 'PD', NULL, NULL, NULL, 0, '2024-02-08 23:58:12', '2024-02-09 00:34:53', NULL, 'Offline'),
	(554, 5, 11, 0, 'lWppETsD9', 'PD', NULL, NULL, NULL, 1, '2024-02-09 00:38:18', '2024-02-09 00:38:18', NULL, 'Offline'),
	(555, 6, 1, 0, 'RLT6KjpMY', 'K', NULL, NULL, NULL, 1, '2024-02-09 00:38:23', '2024-02-09 00:38:23', NULL, 'Offline'),
	(556, 6, 2, 0, 'zZgYUkDYs', 'K', NULL, NULL, NULL, 2, '2024-02-09 00:38:31', '2024-02-09 00:38:31', NULL, 'Offline'),
	(557, 6, 3, 0, 'cWOhjQRDj', 'K', NULL, NULL, NULL, 3, '2024-02-09 00:38:33', '2024-02-09 00:38:33', NULL, 'Offline'),
	(558, 6, 4, 0, '5mruRwJrt', 'K', NULL, NULL, NULL, 4, '2024-02-09 00:38:36', '2024-02-09 00:38:36', NULL, 'Offline'),
	(559, 7, 1, 0, 'Zd5OCgrC4', 'KO', NULL, NULL, NULL, 1, '2024-02-09 00:38:54', '2024-02-09 00:38:54', NULL, 'Offline'),
	(560, 4, 1, 0, 'CRAc86DlJ', 'AM', NULL, NULL, NULL, 1, '2024-02-09 00:38:57', '2024-02-09 00:38:57', NULL, 'Offline'),
	(561, 3, 1, 0, 'KUfV9Tuma', 'AK', NULL, NULL, NULL, 1, '2024-02-09 00:39:01', '2024-02-09 00:39:01', NULL, 'Offline'),
	(562, 2, 1, 0, 'vlm2pBilH', 'KE', NULL, NULL, NULL, 1, '2024-02-09 14:57:42', '2024-02-09 14:57:42', NULL, 'Offline'),
	(563, 3, 1, 1, 'veAwM7FOQ', 'AK', NULL, NULL, NULL, 0, '2024-02-10 22:31:06', '2024-02-11 00:23:40', NULL, 'Offline'),
	(564, 6, 1, 0, 'HKN6qM0Sr', 'K', NULL, NULL, NULL, 1, '2024-02-10 22:31:09', '2024-02-10 22:31:09', NULL, 'Offline'),
	(565, 4, 1, 1, 'BL4DRHih3', 'AM', NULL, NULL, NULL, 0, '2024-02-10 22:38:47', '2024-02-11 00:35:57', NULL, 'Offline'),
	(566, 5, 1, 1, '1TyZA4DTM', 'PD', NULL, NULL, NULL, 0, '2024-02-10 22:38:56', '2024-02-11 06:11:48', NULL, 'Offline'),
	(567, 3, 2, 1, 'bwYA3iWpC', 'AK', NULL, NULL, NULL, 0, '2024-02-10 22:39:03', '2024-02-11 00:36:25', NULL, 'Offline'),
	(568, 6, 2, 0, 'i68vbrGu2', 'K', NULL, NULL, NULL, 2, '2024-02-10 22:39:11', '2024-02-10 22:39:11', NULL, 'Offline'),
	(569, 7, 1, 0, 'YJELCzyhU', 'KO', NULL, NULL, NULL, 1, '2024-02-10 22:39:18', '2024-02-10 22:39:18', NULL, 'Offline'),
	(570, 5, 2, 0, 'VLAZwmuWC', 'PD', NULL, NULL, NULL, 1, '2024-02-10 22:39:22', '2024-02-11 06:11:48', NULL, 'Offline'),
	(571, 4, 2, 1, 'LkimSsTO4', 'AM', NULL, NULL, NULL, 0, '2024-02-10 22:39:27', '2024-02-11 00:36:01', NULL, 'Offline'),
	(572, 3, 3, 1, 'h1wnClrBQ', 'AK', NULL, NULL, NULL, 0, '2024-02-10 22:39:33', '2024-02-11 00:36:32', NULL, 'Offline'),
	(573, 6, 3, 0, 'ev8fAFrjO', 'K', NULL, NULL, NULL, 3, '2024-02-10 22:39:38', '2024-02-10 22:39:38', NULL, 'Offline'),
	(574, 2, 1, 1, 'mBC7dfd3R', 'KE', NULL, NULL, NULL, 0, '2024-02-12 03:19:44', '2024-02-12 07:35:02', NULL, 'Offline'),
	(575, 6, 1, 1, 'V3li93fEH', 'K', NULL, NULL, NULL, 0, '2024-02-12 03:19:50', '2024-02-12 07:35:57', NULL, 'Offline'),
	(576, 5, 1, 1, 'RnB3Dk8ME', 'PD', NULL, NULL, NULL, 0, '2024-02-12 03:19:53', '2024-02-12 07:34:42', NULL, 'Offline'),
	(577, 7, 1, 0, 'wzVMuH3fC', 'KO', NULL, NULL, NULL, 1, '2024-02-12 03:19:57', '2024-02-12 03:19:57', NULL, 'Offline'),
	(578, 4, 1, 1, 'flVXvmC3c', 'AM', NULL, NULL, NULL, 0, '2024-02-12 03:20:01', '2024-02-12 03:21:07', NULL, 'Offline'),
	(579, 4, 2, 1, 'KCCt4Jndm', 'AM', NULL, NULL, NULL, 0, '2024-02-12 03:20:05', '2024-02-12 07:35:26', NULL, 'Offline'),
	(580, 2, 2, 1, '38KIlUJlV', 'KE', NULL, NULL, NULL, 0, '2024-02-12 03:20:16', '2024-02-12 07:35:06', NULL, 'Offline'),
	(581, 3, 1, 1, '5I6Tlcg45', 'AK', NULL, NULL, NULL, 0, '2024-02-13 03:22:22', '2024-02-13 03:22:45', NULL, 'Offline'),
	(582, 3, 2, 1, 'vINj5R0vy', 'AK', NULL, NULL, NULL, 0, '2024-02-13 03:22:30', '2024-02-13 03:22:51', NULL, 'Offline'),
	(583, 3, 3, 0, 'gubCSbp7c', 'AK', NULL, NULL, NULL, 1, '2024-02-13 03:22:33', '2024-02-13 03:22:51', NULL, 'Offline'),
	(584, 7, 1, 0, '7pAA23y1i', 'KO', 'nururl', '15', '6281233792074', 1, '2024-02-14 23:56:33', '2024-02-14 23:56:33', '3213164507740001', 'Online'),
	(585, 2, 1, 0, '7fybgg27x', 'KE', NULL, NULL, NULL, 1, '2024-02-15 02:59:04', '2024-02-15 02:59:04', NULL, 'Offline'),
	(586, 6, 1, 1, 'fM9e8FRmj', 'K', NULL, NULL, NULL, 0, '2024-02-15 02:59:16', '2024-02-15 03:00:52', NULL, 'Offline'),
	(587, 6, 2, 1, 'PsezkWim9', 'K', NULL, NULL, NULL, 0, '2024-02-15 02:59:20', '2024-02-15 03:01:08', NULL, 'Offline'),
	(588, 6, 3, 1, 'n2oCylXyB', 'K', NULL, NULL, NULL, 0, '2024-02-15 02:59:25', '2024-02-15 03:01:39', NULL, 'Offline'),
	(589, 6, 4, 1, '6cjrKG4V1', 'K', NULL, NULL, NULL, 0, '2024-02-15 02:59:30', '2024-02-15 03:01:43', NULL, 'Offline'),
	(590, 6, 5, 1, 'ao3kjTzxK', 'K', NULL, NULL, NULL, 0, '2024-02-15 02:59:32', '2024-02-15 03:01:48', NULL, 'Offline'),
	(591, 6, 6, 1, 'IXdNYfnDA', 'K', NULL, NULL, NULL, 0, '2024-02-15 02:59:39', '2024-02-15 03:02:31', NULL, 'Offline'),
	(592, 6, 7, 1, '2nCV3iiBJ', 'K', NULL, NULL, NULL, 0, '2024-02-15 02:59:45', '2024-02-15 03:02:46', NULL, 'Offline'),
	(593, 6, 8, 1, 'nuDzijaN0', 'K', NULL, NULL, NULL, 0, '2024-02-15 03:03:29', '2024-02-15 03:03:50', NULL, 'Offline'),
	(594, 6, 9, 1, '34M6yH5j8', 'K', NULL, NULL, NULL, 0, '2024-02-15 03:03:34', '2024-02-15 03:04:03', NULL, 'Offline'),
	(595, 6, 10, 1, 'gml3zYXF9', 'K', NULL, NULL, NULL, 0, '2024-02-15 03:03:39', '2024-02-15 04:03:25', NULL, 'Offline'),
	(596, 6, 11, 1, 'PHKNjz6HD', 'K', NULL, NULL, NULL, 0, '2024-02-15 03:03:44', '2024-02-15 04:03:37', NULL, 'Offline'),
	(597, 6, 12, 1, 'ZcHyR1sXH', 'K', NULL, NULL, NULL, 0, '2024-02-15 09:17:35', '2024-02-15 09:17:52', NULL, 'Offline'),
	(598, 6, 13, 0, 'MSpBmIRHU', 'K', NULL, NULL, NULL, 1, '2024-02-15 09:17:40', '2024-02-15 09:17:52', NULL, 'Offline'),
	(599, 6, 1, 1, 'eDPqZeyQe', 'K', NULL, NULL, NULL, 0, '2024-02-16 00:40:36', '2024-02-16 00:41:03', NULL, 'Offline'),
	(600, 6, 2, 1, 'ZEiaX22JF', 'K', NULL, NULL, NULL, 0, '2024-02-16 00:40:42', '2024-02-16 00:41:09', NULL, 'Offline'),
	(604, 7, 1, 0, '24xtbgRvt', 'KO', 'nururl', '15', '6281233792074', 1, '2024-02-16 01:33:03', '2024-02-16 01:33:03', '3213164507740001', 'Online'),
	(607, 7, 2, 0, 'ESDFI8ixi', 'KO', 'fafa', '277', '6281358500119', 2, '2024-02-16 01:47:22', '2024-02-16 01:47:22', '3213164507740001', 'Online'),
	(608, 6, 3, 0, 'MBa2BEMUC', 'K', NULL, NULL, NULL, 1, '2024-02-16 03:57:15', '2024-02-16 03:57:15', NULL, 'Offline'),
	(609, 1, 1, 0, '1b2zLVHYX', 'KK', NULL, NULL, '6281233792074', 1, '2024-02-16 04:05:06', '2024-02-16 04:05:06', NULL, 'Offline'),
	(610, 7, 1, 0, 'XTi9zac2r', 'KO', 'fafa', '277', '0980', 1, '2024-02-17 00:04:47', '2024-02-17 00:04:47', '3213164507740001', 'Online'),
	(611, 7, 1, 0, 'Y320KUiV1', 'KO', 'fafa', '277', '34', 2, '2024-02-17 00:04:57', '2024-02-17 00:04:57', '3213164507740001', 'Online'),
	(612, 7, 2, 0, 'PXPGhPvrU', 'KO', 'fafa', '277', '0', 3, '2024-02-17 00:42:14', '2024-02-17 00:42:14', '3213164507740001', 'Online'),
	(613, 7, 3, 0, 'ihWAYo5io', 'KO', 'fafa', '277', '0', 4, '2024-02-17 00:42:29', '2024-02-17 00:42:29', '3213164507740001', 'Online'),
	(614, 7, 4, 0, '9zpVxXN3j', 'KO', 'fafa', '277', '0', 5, '2024-02-17 00:42:50', '2024-02-17 00:42:50', '3213164507740001', 'Online'),
	(615, 7, 5, 0, 'h42am0g07', 'KO', 'fafa', '277', '0', 6, '2024-02-17 00:43:13', '2024-02-17 00:43:13', '3213164507740001', 'Online'),
	(616, 3, 1, 1, 'dED78BwpY', 'AK', NULL, NULL, NULL, 0, '2024-02-18 01:51:17', '2024-02-18 03:31:12', NULL, 'Offline'),
	(617, 3, 2, 1, 'ZbjebrMmN', 'AK', NULL, NULL, NULL, 0, '2024-02-18 01:51:21', '2024-02-18 03:40:49', NULL, 'Offline'),
	(618, 1, 1, 1, 'lHeHElVU6', 'KK', NULL, NULL, NULL, 0, '2024-02-19 02:49:07', '2024-02-19 02:55:50', NULL, 'Offline'),
	(619, 4, 1, 1, 'uPL98Xg5w', 'AM', NULL, NULL, NULL, 0, '2024-02-19 02:56:18', '2024-02-19 02:56:44', NULL, 'Offline'),
	(620, 4, 2, 1, 'sORKaRCHx', 'AM', NULL, NULL, NULL, 0, '2024-02-19 02:56:23', '2024-02-19 08:16:48', NULL, 'Offline'),
	(621, 4, 3, 1, 'mgCKWGGzK', 'AM', NULL, NULL, NULL, 0, '2024-02-19 02:56:27', '2024-02-19 08:40:59', NULL, 'Offline'),
	(622, 4, 4, 0, 'sUJKJ2rMt', 'AM', NULL, NULL, NULL, 1, '2024-02-19 05:45:12', '2024-02-19 08:40:59', NULL, 'Offline'),
	(623, 6, 1, 1, 'qvW5rWKRv', 'K', 'fafa', '277', '6281358500119', 0, '2024-02-19 07:29:00', '2024-02-19 12:09:24', '3213164507740001', 'Online'),
	(624, 7, 1, 0, 'lBUWgHbpZ', 'KO', 'fifi', '277', '6281358500119', 1, '2024-02-19 07:29:14', '2024-02-19 07:29:14', '3213164507740001', 'Online'),
	(625, 6, 2, 1, 'SgkrKrRMh', 'K', NULL, NULL, NULL, 0, '2024-02-19 12:08:44', '2024-02-19 12:09:29', NULL, 'Offline'),
	(626, 6, 3, 1, 'JiJRNwNJH', 'K', NULL, NULL, NULL, 0, '2024-02-19 12:08:54', '2024-02-19 12:09:41', NULL, 'Offline'),
	(627, 6, 4, 1, 'K8jRnfQhS', 'K', NULL, NULL, NULL, 0, '2024-02-19 12:09:00', '2024-02-19 12:09:45', NULL, 'Offline'),
	(628, 6, 5, 1, 'CEIeJSMiQ', 'K', NULL, NULL, NULL, 0, '2024-02-19 12:09:04', '2024-02-19 12:35:46', NULL, 'Offline'),
	(629, 6, 6, 1, 'HbffzacVC', 'K', NULL, NULL, NULL, 0, '2024-02-19 12:09:07', '2024-02-19 12:49:39', NULL, 'Offline'),
	(630, 6, 7, 1, 'SIZ3M18CD', 'K', NULL, NULL, NULL, 0, '2024-02-19 12:09:10', '2024-02-19 12:49:43', NULL, 'Offline'),
	(631, 6, 1, 1, 'nwUHaIBh2', 'K', NULL, NULL, NULL, 0, '2024-02-20 09:03:43', '2024-02-20 10:43:22', NULL, 'Offline'),
	(632, 6, 2, 1, 'PjaCNNQu7', 'K', NULL, NULL, NULL, 0, '2024-02-20 10:41:43', '2024-02-20 10:43:26', NULL, 'Offline'),
	(633, 6, 3, 1, '0FWZRo2fH', 'K', 'fifi', '277', '6281358500119', 0, '2024-02-20 10:42:40', '2024-02-20 10:43:30', '3213164507740001', 'Online'),
	(634, 6, 4, 1, 'PYiXIeWt2', 'K', NULL, NULL, NULL, 0, '2024-02-20 13:39:51', '2024-02-20 13:40:19', NULL, 'Offline'),
	(635, 6, 5, 1, 'QZjaMaTEs', 'K', NULL, NULL, NULL, 0, '2024-02-20 13:39:58', '2024-02-20 13:40:24', NULL, 'Offline'),
	(636, 6, 6, 1, 'IRFOuMdX6', 'K', NULL, NULL, NULL, 0, '2024-02-20 13:40:05', '2024-02-20 13:40:28', NULL, 'Offline'),
	(637, 6, 1, 1, 's2mhx5Nn1', 'K', NULL, NULL, NULL, 0, '2024-02-21 03:41:34', '2024-02-21 03:43:19', NULL, 'Offline'),
	(638, 6, 2, 1, 'KRmIeuohm', 'K', NULL, NULL, NULL, 0, '2024-02-21 03:41:40', '2024-02-21 03:44:03', NULL, 'Offline'),
	(639, 6, 3, 1, '9Xr2ovTJT', 'K', NULL, NULL, NULL, 0, '2024-02-21 03:41:45', '2024-02-21 03:44:07', NULL, 'Offline'),
	(640, 4, 1, 1, 'oUM15hEPx', 'AM', NULL, NULL, NULL, 0, '2024-02-21 03:41:59', '2024-02-21 03:43:00', NULL, 'Offline'),
	(641, 4, 2, 1, 'ujzy2IPIr', 'AM', NULL, NULL, NULL, 0, '2024-02-21 03:42:06', '2024-02-21 03:43:04', NULL, 'Offline'),
	(642, 6, 4, 1, 's3KtuYEL6', 'K', NULL, NULL, NULL, 0, '2024-02-21 03:44:19', '2024-02-21 03:44:49', NULL, 'Offline'),
	(643, 6, 5, 1, 'K1z0fBZlU', 'K', NULL, NULL, NULL, 0, '2024-02-21 03:44:28', '2024-02-21 03:44:53', NULL, 'Offline'),
	(644, 6, 6, 1, 'ubUb7qakP', 'K', NULL, NULL, NULL, 0, '2024-02-21 03:44:34', '2024-02-21 03:44:57', NULL, 'Offline'),
	(645, 6, 7, 1, 'flbMyWKpv', 'K', NULL, NULL, NULL, 0, '2024-02-21 03:44:39', '2024-02-21 03:45:00', NULL, 'Offline'),
	(646, 6, 8, 1, '7h0mxJhBW', 'K', NULL, NULL, NULL, 0, '2024-02-21 03:44:43', '2024-02-21 03:45:05', NULL, 'Offline'),
	(647, 6, 9, 0, 'K2hamuunN', 'K', NULL, NULL, NULL, 1, '2024-02-21 03:46:16', '2024-02-21 03:46:16', NULL, 'Offline'),
	(648, 6, 10, 0, '1OK8W9lxf', 'K', NULL, NULL, NULL, 2, '2024-02-21 03:46:20', '2024-02-21 03:46:20', NULL, 'Offline'),
	(649, 6, 11, 0, 'vKNrdkmeB', 'K', NULL, NULL, NULL, 3, '2024-02-21 03:46:22', '2024-02-21 03:46:22', NULL, 'Offline'),
	(650, 6, 12, 0, 'IU9elbHWE', 'K', NULL, NULL, NULL, 4, '2024-02-21 04:05:32', '2024-02-21 04:05:32', NULL, 'Offline'),
	(651, 1, 1, 0, 'ScukffRnE', 'KK', NULL, NULL, NULL, 1, '2024-02-21 10:33:03', '2024-02-21 10:33:03', NULL, 'Offline'),
	(652, 2, 1, 0, 'lW5BTsTy7', 'KE', NULL, NULL, NULL, 1, '2024-02-21 10:33:18', '2024-02-21 10:33:18', NULL, 'Offline'),
	(653, 3, 1, 0, 'xqlzttqMP', 'AK', NULL, NULL, NULL, 1, '2024-02-21 10:33:25', '2024-02-21 10:33:25', NULL, 'Offline'),
	(654, 4, 3, 0, '848QvZmif', 'AM', NULL, NULL, NULL, 1, '2024-02-21 10:33:31', '2024-02-21 10:33:31', NULL, 'Offline'),
	(655, 3, 2, 0, 'iMaIJG9pM', 'AK', NULL, NULL, NULL, 2, '2024-02-21 10:35:34', '2024-02-21 10:35:34', NULL, 'Offline'),
	(656, 5, 1, 0, 'KkBVnqCb8', 'PD', NULL, NULL, NULL, 1, '2024-02-21 10:35:44', '2024-02-21 10:35:44', NULL, 'Offline'),
	(657, 7, 1, 0, 'khZvLFh44', 'KO', NULL, NULL, NULL, 1, '2024-02-21 10:35:51', '2024-02-21 10:35:51', NULL, 'Offline'),
	(658, 7, 2, 0, 'rsv9Nfyx6', 'KO', NULL, NULL, NULL, 2, '2024-02-21 10:35:57', '2024-02-21 10:35:57', NULL, 'Offline'),
	(659, 6, 13, 0, 'bOhOAI2ff', 'K', NULL, NULL, NULL, 5, '2024-02-21 13:29:32', '2024-02-21 13:29:32', NULL, 'Offline'),
	(660, 6, 14, 0, 'IPmJ8ILf7', 'K', 'fifi', '277', '6281358500119', 6, '2024-02-21 13:30:24', '2024-02-21 13:30:24', '3213164507740001', 'Online'),
	(661, 6, 1, 1, 'OKFyzClRi', 'K', NULL, NULL, NULL, 0, '2024-02-22 00:43:19', '2024-02-22 04:03:37', NULL, 'Offline'),
	(662, 6, 2, 1, 'px6zBYSZL', 'K', NULL, NULL, NULL, 0, '2024-02-22 00:43:26', '2024-02-22 04:03:46', NULL, 'Offline'),
	(663, 6, 3, 1, 't6GqZZfCn', 'K', NULL, NULL, NULL, 0, '2024-02-22 00:43:32', '2024-02-22 04:03:50', NULL, 'Offline'),
	(664, 6, 4, 1, 'UWzlX7hgF', 'K', NULL, NULL, NULL, 0, '2024-02-22 00:43:37', '2024-02-22 04:03:56', NULL, 'Offline'),
	(665, 6, 5, 1, 'CF3hpFQTf', 'K', NULL, NULL, NULL, 0, '2024-02-22 00:43:42', '2024-02-22 04:04:02', NULL, 'Offline'),
	(666, 7, 1, 1, 'eJW4qcQ7H', 'KO', NULL, NULL, NULL, 0, '2024-02-22 03:46:19', '2024-02-22 04:05:24', NULL, 'Offline'),
	(667, 7, 2, 1, 'nSKHiuqa8', 'KO', NULL, NULL, NULL, 0, '2024-02-22 03:46:25', '2024-02-22 04:05:28', NULL, 'Offline'),
	(668, 7, 3, 1, 'R4OXXSFXf', 'KO', NULL, NULL, NULL, 0, '2024-02-22 03:46:50', '2024-02-22 04:05:33', NULL, 'Offline'),
	(669, 6, 6, 1, 'mdhgpgvWL', 'K', 'fifi', '15', '0', 0, '2024-02-22 03:50:03', '2024-02-22 04:04:08', '3213164507740001', 'Online'),
	(670, 6, 7, 1, 'aFtmyKpAN', 'K', '454', '277', '0', 0, '2024-02-22 03:49:39', '2024-02-22 04:04:12', '3578161503790017', 'Online'),
	(671, 6, 8, 0, 'ZHA8Do4Bs', 'K', NULL, NULL, NULL, 1, '2024-02-22 03:52:20', '2024-02-22 04:04:12', NULL, 'Offline'),
	(672, 6, 9, 0, 'p5YpPLZMp', 'K', NULL, NULL, NULL, 2, '2024-02-22 03:52:24', '2024-02-22 04:04:12', NULL, 'Offline'),
	(673, 6, 10, 0, '6WRMKpum6', 'K', NULL, NULL, NULL, 3, '2024-02-22 03:54:46', '2024-02-22 04:04:12', NULL, 'Offline'),
	(674, 6, 11, 0, '2q3iUot2n', 'K', NULL, NULL, NULL, 4, '2024-02-22 03:54:47', '2024-02-22 04:04:12', NULL, 'Offline'),
	(675, 6, 12, 0, 'cTJBQrVVg', 'K', '454', '15', '0', 5, '2024-02-22 03:55:13', '2024-02-22 04:04:12', '3578161503790017', 'Online'),
	(676, 6, 13, 0, 'ruglB8uvx', 'K', '454', '277', '0', 6, '2024-02-22 03:55:12', '2024-02-22 04:04:12', '3578161503790017', 'Online'),
	(677, 6, 14, 0, '4LzJfyYJf', 'K', '454', '15', '0', 7, '2024-02-22 03:55:23', '2024-02-22 04:04:12', '3578161503790017', 'Online'),
	(678, 6, 15, 0, 'zSVrgtaj3', 'K', '454', '277', '', 8, '2024-02-22 03:55:27', '2024-02-22 04:04:12', '3578161503790017', 'Online'),
	(679, 7, 4, 1, '1fS9FAfCs', 'KO', '454', '15', '', 0, '2024-02-22 03:56:03', '2024-02-22 04:05:43', '3578161503790017', 'Online'),
	(680, 7, 5, 0, 'ciy6w95Mh', 'KO', '454', '277', '', 1, '2024-02-22 03:56:08', '2024-02-22 04:05:43', '3578161503790017', 'Online'),
	(681, 6, 1, 0, 'DR7WAxEf6', 'K', '454', '277', '', 1, '2024-02-23 02:46:51', '2024-02-23 02:46:51', '3578161503790017', 'Online'),
	(682, 6, 2, 0, 'LR971sjR1', 'K', '454', '15', '', 2, '2024-02-23 02:48:30', '2024-02-23 02:48:30', '3578161503790017', 'Online'),
	(683, 7, 1, 0, 'OFMsuiWw9', 'KO', '454', '15', '', 1, '2024-02-23 02:48:57', '2024-02-23 02:48:57', '3578161503790017', 'Online'),
	(684, 6, 3, 0, 'S9S9B5hXe', 'K', NULL, NULL, NULL, 3, '2024-02-23 03:02:12', '2024-02-23 03:02:12', NULL, 'Offline'),
	(685, 1, 1, 0, 'mWoMzoQhq', 'KK', NULL, NULL, NULL, 1, '2024-02-23 03:02:41', '2024-02-23 03:02:41', NULL, 'Offline'),
	(686, 1, 2, 0, '01sH74Dyp', 'KK', NULL, NULL, NULL, 1, '2024-02-23 03:03:02', '2024-02-23 03:03:02', NULL, 'Offline'),
	(687, 1, 3, 0, 'XTUvITjOv', 'KK', NULL, NULL, NULL, 3, '2024-02-23 03:04:33', '2024-02-23 03:04:33', NULL, 'Offline'),
	(688, 4, 1, 0, 'oqfGJnjoi', 'AM', NULL, NULL, NULL, 1, '2024-02-23 03:06:21', '2024-02-23 03:06:21', NULL, 'Offline'),
	(689, 4, 2, 0, 'Zs2faaGAT', 'AM', NULL, NULL, NULL, 2, '2024-02-23 03:06:32', '2024-02-23 03:06:32', NULL, 'Offline'),
	(690, 4, 3, 0, 'fcYoUNpvn', 'AM', NULL, NULL, NULL, 3, '2024-02-23 03:07:56', '2024-02-23 03:07:56', NULL, 'Offline'),
	(691, 4, 4, 0, 'R3A7h0y1u', 'AM', NULL, NULL, NULL, 4, '2024-02-23 03:08:27', '2024-02-23 03:08:27', NULL, 'Offline'),
	(692, 4, 5, 0, '9nrBehBPB', 'AM', NULL, NULL, NULL, 5, '2024-02-23 03:09:24', '2024-02-23 03:09:24', NULL, 'Offline'),
	(695, 6, 4, 0, 'PR6w8oJnI', 'K', NULL, NULL, NULL, 4, '2024-02-23 03:18:40', '2024-02-23 03:18:40', NULL, 'Offline'),
	(696, 6, 5, 0, 'Wws8GcB2l', 'K', NULL, NULL, NULL, 5, '2024-02-23 03:20:58', '2024-02-23 03:20:58', NULL, 'Offline'),
	(697, 1, 4, 0, 'bc1Yc5mDQ', 'KK', NULL, NULL, NULL, 4, '2024-02-23 03:22:28', '2024-02-23 03:22:28', NULL, 'Offline'),
	(698, 1, 5, 0, 'u8hou5M9C', 'KK', NULL, NULL, NULL, 5, '2024-02-23 03:23:26', '2024-02-23 03:23:26', NULL, 'Offline'),
	(699, 6, 6, 0, 'SSCOuVSJU', 'K', '454', '15', '0', 6, '2024-02-23 03:26:28', '2024-02-23 03:26:28', '3578161503790017', 'Online'),
	(700, 7, 2, 0, 'r0skMEo4r', 'KO', '454', '15', '0', 2, '2024-02-23 03:26:33', '2024-02-23 03:26:33', '3578161503790017', 'Online'),
	(701, 26, 136, 0, 'wNuKitV0i', 'Sed', NULL, NULL, '0', 1, '2024-02-23 10:23:42', '2024-02-23 10:23:42', NULL, 'Offline'),
	(702, 6, 1, 0, 'J25qbugEL', 'K', 'rrrr', '15', '0', 1, '2024-02-26 04:30:38', '2024-02-26 04:30:38', '3578161503790017', 'Online'),
	(703, 6, 2, 0, 'zRfek4uVF', 'K', 'hfhdhd', '277', '0', 2, '2024-02-26 04:31:08', '2024-02-26 04:31:08', '3213164507740001', 'Online');

-- Dumping structure for table jftoken.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.roles: ~2 rows (approximately)
INSERT IGNORE INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Super-Admin', 'web', '2023-06-13 19:55:35', '2023-06-13 19:55:35'),
	(2, 'Operator', 'web', '2023-06-22 09:41:50', '2023-06-22 09:41:50'),
	(3, 'Testing', 'web', '2023-11-07 12:07:22', '2023-11-07 12:07:22');

-- Dumping structure for table jftoken.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.role_has_permissions: ~16 rows (approximately)
INSERT IGNORE INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 2),
	(3, 2),
	(5, 2),
	(9, 2),
	(11, 2),
	(1, 3),
	(2, 3),
	(3, 3),
	(4, 3),
	(5, 3),
	(6, 3),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 3),
	(11, 3);

-- Dumping structure for table jftoken.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `letter` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_number` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sms_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `optin_message_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `call_message_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `noshow_message_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `completed_message_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `status_message_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `optin_message_format` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `call_message_format` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `noshow_message_format` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `completed_message_format` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status_message_format` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status_message_positions` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ask_name` tinyint(1) NOT NULL DEFAULT '0',
  `name_required` tinyint(1) NOT NULL DEFAULT '0',
  `ask_email` tinyint(1) NOT NULL DEFAULT '0',
  `email_required` tinyint(1) NOT NULL DEFAULT '0',
  `ask_phone` tinyint(1) NOT NULL DEFAULT '0',
  `phone_required` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `offline_limit` int DEFAULT NULL,
  `online_limit` int DEFAULT NULL,
  `status_online` int DEFAULT NULL,
  `ask_nik` tinyint(1) NOT NULL DEFAULT '0',
  `combined_limit` tinyint(1) NOT NULL DEFAULT '0',
  `limit` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.services: ~8 rows (approximately)
INSERT IGNORE INTO `services` (`id`, `name`, `letter`, `start_number`, `status`, `sms_enabled`, `optin_message_enabled`, `call_message_enabled`, `noshow_message_enabled`, `completed_message_enabled`, `status_message_enabled`, `optin_message_format`, `call_message_format`, `noshow_message_format`, `completed_message_format`, `status_message_format`, `status_message_positions`, `ask_name`, `name_required`, `ask_email`, `email_required`, `ask_phone`, `phone_required`, `created_at`, `updated_at`, `offline_limit`, `online_limit`, `status_online`, `ask_nik`, `combined_limit`, `limit`) VALUES
	(1, 'KARTU KELUARGA', 'KK', 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, '2023-06-22 09:46:28', '2024-02-23 07:20:47', 50, 50, 0, 0, 1, 100),
	(2, 'KTP ELEKTRONIK', 'KE', 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2023-06-22 09:46:53', '2024-02-07 01:59:33', 50, 50, NULL, 1, 0, NULL),
	(3, 'AKTA KELAHIRAN', 'AK', 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2023-06-22 09:47:18', '2024-01-31 10:12:09', 50, 50, 0, 0, 0, NULL),
	(4, 'AKTA KEMATIAN', 'AM', 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2023-06-22 09:47:42', '2024-01-31 10:12:11', 50, 50, NULL, 0, 0, NULL),
	(5, 'PINDAH DOMISILI', 'PD', 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2023-06-22 09:48:16', '2024-01-31 10:12:12', 50, 50, 0, 0, 0, NULL),
	(6, 'KONSOLIDASI', 'K', 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2023-06-22 09:48:33', '2024-02-19 07:28:55', 50, 50, 1, 0, 0, NULL),
	(7, 'Kartu keluarga (online)', 'KO', 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2024-01-18 05:10:48', '2024-01-31 10:12:15', 50, 50, 1, 0, 0, NULL),
	(26, 'Aphrodite Montoya', 'Sed', 136, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2024-02-23 07:21:10', '2024-02-23 07:21:10', 82, 82, 1, 0, 1, 18);

-- Dumping structure for table jftoken.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `service_id` varchar(19) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `counter_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sessions_service_id_foreign` (`service_id`) USING BTREE,
  KEY `sessions_counter_id_foreign` (`counter_id`) USING BTREE,
  KEY `sessions_user_id_index` (`user_id`) USING BTREE,
  KEY `sessions_last_activity_index` (`last_activity`) USING BTREE,
  CONSTRAINT `sessions_counter_id_foreign` FOREIGN KEY (`counter_id`) REFERENCES `counters` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.sessions: ~6 rows (approximately)
INSERT IGNORE INTO `sessions` (`id`, `user_id`, `service_id`, `counter_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('bVnC48m6lTA7uqS3Ex9KTISBb3RgBmdFL5bmyTXf', 1, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0', 'ZXlKcGRpSTZJbFZDT1RnNWQxZ3dSSGxLYjB4Q1kzRXhjMGRHZDJjOVBTSXNJblpoYkhWbElqb2labXgyYVdwbWVUbGtjME56UlhGSlltbFVlVXhrTlVoV1lVWjNjSFF2SzFoSFpWSlJkbFJyVVhOU1ZtNUpOV2RrWkRVdlZGZ3lVVmRTV1dKTGExaENlU3M1U0cxQlozQlpXbU5hTDBabFRqTkZSMkZ1YUd4MldtWTRTMG8xU1VkaE5tRnFWVk5MV0V4Qk4zQkdhMDU1Wld4NFFYcEVZazlSTW5OcVNrMWlRMjFQTUVWb1pHNU9hRzFWU0ZSM1FXSlRaa0ZUWjJWTVUza3pRMUJvVW5aMWRXeEtNa2t5UmtwWmVWaDFUVTF5YVhKTFlWQjRhMnN6VVVnd01UWlZaV1pqY0ZSVGJIWlZkQ3R0Vm01Q1VFZDJRMWhwUlV0YWFEZFZXWE5XTm1oYVpuWjFSamhqWkc5RU5DdHlkbEIwY21OVmFIZzJkbEZ6WW1kUlkycHZUVkJhYlhabGExbHpkR0Z0YVRGWU1ucGhiWGhFUVRVNVZVSmtPR2x3Wm5aQldHbFhSMlp6VGtsTEwwZDBibXh1Y2t3NFZFdDVaRXd5ZGt4Rk9HUmxXbE5QY1dSMFVsZGFPVEV2V0VnMGFIVmxPRWs1YTFKc2JtODVWMHRvUzAxbmNYWmlUMUZUU2toUE5rdENhbXBJTUVaUlQxQk1abTFOU0UwcmJERjRlRFJJYWtVdlNXNVVhV2szY1hkbFNESmxjVGhJZUROcGQxaHpUa0ZhU0V4NmRYaDVRVTExTUUwcldHWmFSekJPZURGVWFVOXhiQ3RhYmxvMlpWaE9iVXNyTUdWT1pWaERZVGd5WkVad1FXTjRibFJzTTI5d2NGVk5abmt4VDBwR0swWm9jSEp5ZUZSTmNrSTFVMUJFU1hCRlIzTTRaV3RLYlZGRVMyaHdla3N4UW1GWGVqUTRjazVzZFhreFduZzJRbXhSVTI4M1UzWjZiVzl2ZDNGelpsUXJSR0ZPWjBWb1lTOURkVGhSY2toNVdsZHNSekpqWVRkUVJGZHlNREYyTDFNeFIyWlFWa1ZLWWpOaGJHRnVSV3h0TDNWWk1GcDZkMWcxTlhKb2RFRldTMjFqUms1MVpqbG1NMVpRVkRkNFZtVndPR1JvV2xKdlZHTndZbGcxZUU1UldYWnJNbFV3VEhGRk1qUjBaM0pVY1N0cFVYTXZXbWxMUWtWNldDczBOMDUzVGt4d2QybFlWMkZhYUVOQ1QyeEZNalowZUhoc01HTndlRmxrVDNNMWJFbGpTM2gyZEVneVJVaDBjVlZyZGtZcloyZzJOak52VDI5bVpFNVNLM2x5TW0wemFHNHhVa05tVnpSamVTOXBWVGQwT0RCVVkzazRVVEJLUVVJNVdISXpZMVJFTTB0U1VERjJlV2g1VGxKQ2FtdFJNWHAzUVZwcFNrbElabXd5Y0VKNVNVcHNObUY2Y0drMlUyVlZVVkJvZEhaaVJXdDNTbnBzYldFdlFUTXdOVGswWVRoSGRrSllZekpaV1hGeFEwdE1kVEZKTHpCRWNGRnpZMjFZU2toM2JVTlFkVFJ5TlVwclYwMUJhekpKTVZkSU5EWmpXRFJhTmpoWVYxSlhTM1ZyYkhCemFIbzViVnBhUVRCMWVqSm9aV2R2ZUdKQ2NtZzBjMnhLWTJkcmJFeFhlRlZNYVRKb1JUZzVPRlpWUzNvNWJVRklSM05TYTFSV1JrNTVkelJoTTA1dWNHSklkVzkxVm14eUwzZHNabUk0TTI5cUx5czNaMGxvVEZsRFdVcFVlVXgzVEhSQmJWbFZlWE5OYUdaTFUxVXZjVFY1VkdsdE1IZG9MMWx1WTJsWmFrTlJNRTlEZEhNMVFXdFNiMU4xV1ZGd05FMVpWVlFyVEhwbU0yUnlRa2xJU2tsVU56WXlXRmRhUW1kT1p6aDVZMlJEY2tKTGJISmFRV3RuYlZoS2VFdGhVV3BRYWxOeE9GTmFOMnMxT0hsSmRFWkRaWFIyYTA5SVlYVXZMMVJ1VFVwSlYzRXhVVVZzYWpCSmNGVlpUSGRGYVVoaVpVOHJlR0ZDVDFWMlFuRXZNMGxsVUVrM1lVaFVPR2xIWVVvNWVYRnhXblpWZG5seFFsbEpOekkxVWtjNVNpdG5OMk5NYzNoTVYwOXhlVVJ0VVRSU1JIVkRURWROWTFKdE9GTkZZVGswV1N0Q00zVTNOV1pTYXl0TlNUQnBZWE5QWVhGVWR6TkJTMVZITVU5eGRFNDRVbkZUYW1OT1ZGQkpkazByTUZCSmJVRjJSMjFuVWpOSmVESXJjQ3N2V1VJdlkzWnNUazgxYW1KaldYSkRkM2RGTVRsRWVVcFNkUzg1TmtWSVExa3ljV3c0YVhsRlRrWkxNRWRSTVhKUmExTlZWbFZpZG1ObVZHbGhjMnhZWmt4YVlURmhlazB3UzFOUlQwSk5LMDU1WmxvMVZYWnZTelZqVTJwbFZGaFhWMk5NUjFaeFRrcHBhbmR1YzNoNWRtVkdhSEZOZVU1MVdXSnBZMHd4Vm5aNE5HZFVlRlF3YWtjeWJWTnNNM0YyVUdWME9Ea3pMMkY1YTNsa1RTODBjSGd4U2xSaVdVOHhOamhxYkM5Sk9VWmFaV0ZMVW5WNFIzWk9XazkwVlRGMlNrUllOR3BTYWk4elFUTlNaRlptV20xVlkwaHZlR1U1VmtKd2QyVldZV2RNWVZWSU1DOVROazlUTUdsWWNrbFZiSFJTVFdSTlUydFVXRk5zTHpncmIxVXJjVU13WlRGalJtcFdXRWxVZDIxeU1XcE1WVGxNYW5WbFIzZExNMVZ6VVcxa1UzQnNSR2RwWlVJcmVXbGFRVXcyUzNwaUwwZGliRGxzVkdWd1NWVnJWV2t5UjNnclEwNTZWVWxIYlc5dFVVNWpjako1ZEhvNGNVazNUMGxGT0RaWFZ5OU5VMGh0ZVVwaVprVTBVMUZWWlhWMmNGTkhSRmwyWVhSSE9FUTRXbFZyTWxjMFRXdFRWR1ZvZEV3MmNYUTFVVWg0VWtJNFZYZE1UVVk0YWpWV2FFcHhRMU12YTB0dlVYVjBaVkZFYlZaMlNqRm5OemhoYnpWclkxRXhlRU16VG5CdGFFMXZaekJsVjJGcmQzcGlVSFJsWTJRdmJYRnhVVloyTVZGTGRsTXJZMHRqYkhkelkwTnpTbGhJVDJOV1NtMDVWbU5IVGxSbFptVnhjekIySzFaclYzVnRRa1ZCYldwaGVIVnpRbTlRYTNRMVltaEtkU3RNYUZaRVNVMHZkeloyY1RkQlRHUkxUVWhuV1RsTlNIQk1PVzR3UzFGc2NFUk5NVFZDZVhGdE5ra3lNVEJCVm1oU04yOTJWUzlxVTNKMGJFMTVVR3RIZEdSd1NUWk9XRGgzTjJsbVVVMHlabU5YUXpOaE9HMHdSMlV3TW5GUVkzSlVXSFJETDBWTWFtODBkR1V2VFV0NlVrNVFNbUk1VEZneVVWVjROMlpFTnpCNVFucGhUVVp5ZW14blNqUXZaVkJ1Wldkb1VrNUNiR0pRZEdsdGFqRkdiR3hzTWpaelRtNVdUazFsTTJSWkwxcE5PV2xTYldFM1QxRTBlSHBsTWxwbk1XaHJkVWRsT0dzNFYwTmpUWGhIZEU1Q1JYaG9RbVJ3UjNCWFlVUjJaRE5HUWxoMlpVNHljVWhuZGxsUVdVWTViVEpyUms1NGNFVndjVUprVTJSR2RUVkJUMHAzYkRoRlJYQjNlbVpEY0ZGcE4xZEJOemxoZW05bmRUbGlUR2QwV2t4SmEyUkRNVkJCZEdaTVFqbE9WbnBRTUZCMVJrNWtUa2wzYm1FM1dVNUxSakoxZEZsVmJVTkVabTR3UnpoYU9ESkNTSFJ6VEZOd1psRm5RMVp0ZWtZeUsxZHRUbXg0T1ZSTFJGTnlhWGxvTVN0UWFrcHlaR3QyYTJSeVFqQmhVRVJPWjIxek5YQndTbE5XWlM5UGNFOUNkVzV6V0dGdFQxUlNUSFpZY0ZGUUt6UklaV1JGWlhOTlMwZG1UbEJLTkZONlJVNTBiUzlMYnk5MlVWUmtXVmRSTW5OM1F6SndkemxFTkhocloweE1RVU5KWWtsd1pDODFUazFLTVVnNE5WZEpOekppVERoQlJqY3ZNa0p3WVZreWNEZ3llVmRCYldwRk0zSTRabFppVEhkNE1IWk5Rbk16ZUZkelJEa3pZMVpIUjNKTFoySnlVSFIwVVVkWU0yNHlaVGRNU2t4aWJUUmlkbU5CZWtkR1FVOXZMemRoVDFVd05FWmxjVTVFYTNWcldFazBVbEJ2ZFRZNWRFMVViVTVRTUd0UVdEbFNjRTUwZUVsTk5GZEVialJTVDFBMlZVNTBXWFZLYjB3dmRrWjBlV3RaYkhSWFkydERSblJCTDFKQk1IQTBkVEZoYTBoQ1lsSXdaRFYwWW1WeVVXcHJTM1oyYkRWVWVsTnZZMlJNWVRnMk5EaHRPREJRWmxobFVIcENMMEZJVUVkSlJXcG9LMkZKYTFOQ1VtOTNPSGxJTDFVeE5IbEhWbVJVYUZVelVESlFiVmMwTUhSSGVHWjZZVFZrUWpFM1oyMWlUbFFyYTIxTVNUTnFWRU55V2pObVYxUlFlalJwVjJWbWIyMDFWbEpDT0VaRVlYTllTVVZqVHpNNU5WSkVZa05FVG1GUlEzTjBPWFpRVURCVGNuQXpjMkl2U2toMU9GUkNXbFZqVERKd1RqaFhTMGRzWm5KRk5sTTJSVlF2ZFRKUFRtOWtkWGcyYWtZeFdrcEJjeko2V2poM2VuUXhiRmxFYXpWSFEzUnhjM2xqUVM5SU9HcGpRbnBJYW5seE1HTXdOM0F2TUVKSVdGRTJiVmhwYXpVd2NqbDVMeTloVEVaR1VVSnZlRTVtYVVNdlVrWm9SRXhMWjFVdlowVkpVSFJRUmswNFJVUXhRWFZRYzBSV01rbEZaVEJ3ZGtoSFFYSkxVRXh5YWtseVkxcEpORXBhWm0xblMwODFaVTB3VWpJNVYyNDRhMFpwVkVSVk4ySlhWM0V2WW0xbGVYZEVSazh2VUZWdVZESkZVazlpUVU1UlNsWXpNVzVQU0VSM2RXVldSRmN3V2pkdGIydDFRems0TVRCMFkxUkNSbXBIYzI5UGNEZHhWWHBNYVRjMGJIUjVjalo0TlZZcmFWSTNaRE15WkVveVpHOU1Zall5Vlc0NVZUaE5NbkJLTjNCTU0xQnFVbGRLU25JME0xcEVha1ZYVkhkWmQybExUMU41YzNoaFRuRlZMMGxQVmxScGJsVjRTMEppVkVJNU1rUk9UVVp0ZHpCMU1HNDFWbU5GWTJGdGRsQjJZMGhUUW5oYVpUaEJOa28yYkVoSUsxSk5jMGQzVkZCcGNFZEZiMkZRTkVSbVJYQjNPR1JTZWpVclVGRmFNeXNyWVdSMlQyMDJkVEo0VFZobFVtOVlSMWRIWkdRMVMyMXRSR2wwZVdsTU9IaHFVa292VVhSc05VSXpaMjlQSzFaaE9XUkRhRUZUYjFVM2QyMWxibGhxWWtwb1RrRm5UR041WXprMmRrUnVabFZDUld0aGFHZzVSbll3VkRBMlQwVkhhMlo2WW1GSU1EUmpUMEpPTlhobGVHMVZMelJNWVhKaGNtY3pjMmtyV2tSQlpGVlpkVm92VTFOWFNXNXNRWGgzVGtFMFZrVkNVWEZTU2tGSFJ6Vk1Rak5hYjFrdmMzRXhNbXg1UkZoVVJqUjNXRmhSYlZaRFpqQjFVV05RZHpsTmJVUmFkazF3VkRsRVdrcE9NVlZ2Y1VKSVJtNTZVVmx4ZW1GdFpFdHRhVWxWWTNFMlIybFlWRGxtZEZacVR6QmlaVTFrWWtvMGJqVTJZVVl2Tm1keFpWaHJkSGRUZDJsMmQwUlpjMEZvUm5ad1prcGliRFJEYVRadlNsQjNVVE0wTnpjeFZsWkhiRGx6VjI1VmVqRmhNWE5IY2paNk5rbEZTSGx2T0hWQlYyRkpLMjU0TUZKVk9HSkhaR1JPY1hoVWNtUllSekpqYkZaSWIyazBUWFY2WW5sQ01qVnRUME4wYXpkNFJVaEZTbGxQVDNoeVpIZENWMkpFTnpaNmMyUkRLMGh1TlZZdlRFMWxlV2h3WWxsUFRtZEJaVTlqUkdoRk1XZFZVMmR2VVZscllVeEtaSGRMVEhKUWVGTjVXV1pJZWxNM1VuRmxWbFIyYTJSTFkxaFRiR3hDWVVFemN6WlpSMmRPYzA5RVFrUlRjekV6VlVRdksyTmpaVlZET1hsTU5sZ3JNMGcyVWxOVVl6RjVRelJNTVUxUVpWVTFaRzFSTURKRlkxQjVhWEpzYkM5T2Iwd3ZiSGRCY1dOR1UwMVJRVXQ2VFcxa2RERjFTSEJGTlZkVFoybEZZMmhLZDBWSlFYaGhNMWN3U2k5S1REYzJWR295VldWcGJVeE5abWRoUzNCVlNWTlphVEJGV1c4elFrOUplbkJET1UwMVRXUlFVMUp5YzAxamNEWmhPRVphY3pSWWFtSktjRTh4U2t0bUszSjNkSFZyU0RaWE4xRnRTRmRvTmtWalpVRlNWamhEWVhGVlVEbFpjVzFUV1RNNFVqUm9aa1o2VmpOVU0yNVFlVFJpTkVGV1drbHFNVXRVTWxBelVVNXdha3QzU1VacUt6bHZWMXByWm1ack0yVkhORzFEVEhSWGRsbHBXRU12YkZwYVQyTkZZeTh2TkZsU1JtZEllbnA2T0dOVVlqSmpNak4yTDJoaWNFSlFURXRWVG5aTWVtbDZaRVoyYUVGR01FSkxhV3BZVFRCSE1qZFNSMEpETDNOUWJWSkVOa3RWVjFKMllVRkxSVFk1WnpoUFVGbG5Sa1YzS3k5V2JqSkRMMVUwZUZoYWRURlZWeThyTDBGc1pucGxTelZMVWpOQ01HWlhaQzlyTjJZck9XRldiMk01YUUxSFpWRmtlRTFrY0ZBMFZuWTBiVE54T1VseE1UazVUM0poY0d0c05EWmhhMGhyVG5KV1JXaEljR1ZvVEZweU4zWlJhVXhTYXlzellsQTFlRFEwTlU4clNsRlZhMU51TWs5aU4zYzNlVEp5U21WbVVtUlhWV1Z0VjJabWIwMDNkV3BsVGtWSFJXdHBhbGRETTBWVVJUVTBTUzlwZURkeWMzVlFibGR3TmxSa1RVUlBPVGczYlRsVWMxTlFlR0k1WkhKaFMwaFVMelJDUjJOUFJVOURiMlJXUTFkdksydFhiMGRZTlhoUGVXRnhLek50SzJ0aVNsTTVWM0JYVVVSaE5WUlJWR2NyVEhwTFkwMVplbFY1UW5RMVNHWkZiekZ2Y2tGUVZqbEtMM2h0TVZkU1JuTXlkMkUxTXpkRVdXeEJla05OY21kcmRWTnpVMFF6U1RNclprWjNOVk1yVFM5V05WUnZhQzgxWVhoVVNqUklSbTU1ZEhwaGNrOVFRMmRzUW5KVE5FRjBhMDAwZW5KcFUzTkRTbWxSZDFSUVNFVk5RMGR1V0hCb2MybHlaa3N6YVRoMVVIcElOMWRaU2tKQ1NYbFdjMDVqWXpoM09HcHZObGRhVmk5a1NEbEVkbXhXYUZZdmNVaFpSblpsYzNabVUxUTNjR05wVkhOUFNHdHZTVkZWTkZkcFQzQXJXRGRMYlhSbFNYTTJObXg1Y1dsYVJTOU1UM0ZtY1U5cFlUSnJWSGRxV21wRmNEZGlSek5OVjNOUFltNXhTRWRKV0hSRFVIcGFUa3cxYkVnNVVFdFVXRFp0YjNOa1JWZzNSbGxKWjNkT1ltaHBUVEpMWmpCdlRuVXhOa0pHYm1relVqVjNVR05zTkdKSE1saG5WVE40V25SdGQweHNiVEJtUTNkc1pEQXJUVVJwV0ZNMGQwODRZMGxFZUdNcmJ6VlRibXRNV2tOMlZscDBVMlI0YWxkTVJ6aHJjVkJwZUZGc1VXODFMM1p1ZDBkbGJtWlVNak4xZFVkaE5rSTJNRmxYZUhCMFkwNVRLMk5MZWtkR1JuQnJXa3R2Y1V0eFExSjJRMElyUlU0MmVFaFlkM0pMYTJNMFdFNTFiekV3Vm5WMVIyaENiM0kxT1d0RlIxUXlPRWhRWWxnMWNXUnlibkpKV0dKSWVXTnFPVGx3Y2tKc01HaHFWV00xVjNkRE9VZHVZWFJYVm1Vek5WSjZTMjVIUjBkTWNuQXdSRVpVYlRGV2NTOUhVRko2VUdaSmQyTXdaSHB5ZVVoaU5FOUhkbkJpZGpadGMzaFNVakp2YXpJM1Z6WkhRelkwZFZoSFp5OTFUMVJpZGtGdU1rUmhXaTkxZHpKb055OTFjbWRJTml0V2FUSnRXWGd4VkVsdVMyNTRhR1JxVDNKR1dYTkxPRkJ0Um10blozQllPRGd3UXpob1lqTmtXSGRrSzFOTFFXbEplbW8yZDBSM1MyWmhiWFp1YkVORkszUnROREJ0WjJaRlNHaFhaVmhxTjJoS1RFOUNhMHBLVEVKMWVtMVZlVmR5VWt4dVQwRk1iMFJ4WlVFd2QzVnVSWEoxU21ORGVFbFhlVFYxY2pGTE1uQkliRlI2TTI1UlZtbG5kU3RhZW1GT1REVnBhV0Z6SzAxTVkwazVkMk5DZEhOd0t6SjNOMFJ2ZWxGYWVERk5kVWxxVkROclJYZHlVVVE1YzFock0wVXlTMngyTDFJMmVVUkhVVXQ0VGxwaFdreGFiblV5TTB4eGF6RmxkSEV4ZG5sQ1lUQlNjblJGTkd0cFIyeHlUMlJKYVhwS1VESTBXa0ZLZEZkd1IzUTFORm81UjB4TFJERTFNVWR1V0haNmMyeFhkblYzTWxKWU0wVmxlVWhFTVhWdldYaG5NVlZQT1RGck4wc3llbEJ4T1dWU1JVSkZUa1ZIZUdNNEswZEpWMlZ2VGpBeU4ycDRjVU5LWkdKWGJrdDJRM2RrWkZsSVQwczRWbU5EUVZBclRVcHplVTFGV0dzcllUVjVhbEJ6UlVsbVFTdFVTVE5IWVRBd2JWUjJlakp2UkRRemRFcDJZWE5TVW5FME5uRmFNMk5vU1RCM1NFWk5kbWx4VkRKNFFtZFFWR2hFU0VKRFIyWlZTMkpUY2swM1VFNVVVa1ZJZFhadU1tUjNhRmhRYld4bldVZzVVMVZzWmtKRVRuVmtVRXR6UlVjemJVNVJXREJFZDBoUldsQk9TM00yYTNVM1YwZFhOMDl3V0doblFXTnFablZOVFhoM00zUTRaRmhqVDFka05UWnhkRmRZUkdGSlpqbHZhMjB3VEZReWQwNXJTa2xyUW1WcVExbENNWGhPSzNWTVlrNVhUbGcwYVROWWFXcFBjR3REYVZsb2FuZzRhR2h6ZURoRFkwSjRRVll4YW1adU9ITm5ZbVZpY25RMlpHOTJXRkppWVRGWlVsaHVSVlp6WlVaUWJtSndZMmRtVkd0TlZtbFVSazk0ZEZKSE56aFRaSEkzUjNwcGJEUlVUa2h3ZWxwNllYZHlTa3hMYmxCMmRVaGtjVWhuYTFCV01IQmhaWE0xYkhkdFEyMXBNR3BoWnl0SU9FeHBRa2RUWkVWMVIzRlRZVVF5YmtJdldEUlZOelpYUkRsTVJtVTBOR2hCYm1sSU5FWklXV2xqZHpoRWVqRklXbUpVWTJwRmFUaFlUVk5DYlhSRVUyOHhTSG9yYkZGSFVVOUZZMko2Umxsd2FFbFJPR1ZLTjBoRVMzZERMMVZxYXpaUGF6VjZSV3N5VjA1cVNHSnNZMDV3ZFhaME1EaGFkbkZWUTFKNGJpOWpSbGhDU1ZCc01ESk1TbWR3ZFhWVFR6WkxSMlpMZHpjeVRHTjBRMUZqVDJ4dlZtaFlVVzEwYkdoUmVFTXJjMmhuZUhWbmIxcFdTSEpLV21sVlNqQk5TVk55WVdjd1RpOXRTa2hQTmxoNFYwOUhSbGhIY1hGdlpFbzNaRnBuZDJGaUswMWFSa2RDU0dFMVRtNU5lVzAyTVV4c1NHVjBSR3RGYTI1WE5XRjFjblUzUkZaYWJFMTJPSE4xY2s5dmFYZHdWR3RpVTBWV2VqWlVjREV3YkRaWGRYRjJZMU5yWlZWRk5rZDBWRlF5TXpaaVVXSlNjMFI2U1ZOUVMyNUdSRmd5VnpsWU5GVmpiV1p4Y21jek5tdHVZVE4xT1VWWlVHMVdaMHBHZWs5Qk9GZFRNVEk1VFhKa1ExUnJUSEUzZVhCeE1ITTVTek52ZGxBdlpqQkpXSEpZY1dwTllXaFpRakpXYjNjNFdHTjVlVWxhYUVnclZqVkdPV0psT0VwVVoySlFOMVp1T1NzdlRFMW1jV3QwWkZwU1JqVTRiMlp4WVVONFdXbDNZV2xGWmtWMFZERjBjbEF6Wnl0b2RsSndNMnRYTWxoMVF6ZE5ia3RWT1ZGSlRWWnBSV2hCZVZGdVZIcGxNME5uVVhkQ1QzWXhVamxxVTAxSE5FaGlka0l3TDFocVRVVk5PVFpEV1RGVVYxaEpWVUpsYUhRMGNuWXdZbXMyUkhkTFZVUnVkVWhsVWt4Q2MzUk9WblJJY2twV1dFYzVTelpsZURoc1drODNlRUV6VmpOdVpsSkdiSGhFU21nNE5EZHBUbWRRVkZGVVZVcEplaTlrT1ZKVlZtd3ZWMDlJYjBGcGVpczJhbEpyVGtNMUswTjNiMGd5Y2tGSFNWVmhOMjlRYldKdFdsQlRLMG8wVFhNck1IUkRTRUZoTDJjelUwRmlURzVGUjNCWmRXTkRRMU5aS3pneFdFNUZkVWRQYmxaNGNsbHVXalJUZGxKM2F6WmtjVzFSYWl0bWJWZElXR2xHWWtwQk4ybElTMFY1WlRaeGN6Y3JMMUl2YVVraUxDSnRZV01pT2lJeE16azRPR1ZsWVRObVpERTBORGt6TjJVd05XUXhNak5sWm1Sak5XVXlOMk0zTVdSbU1URTNZalExT0RNeVltTmlOR014WmpjNE16RTVZVGxrTldFMklpd2lkR0ZuSWpvaUluMD0=', 1708922475);

-- Dumping structure for table jftoken.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `language_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timezone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `display_notification` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `display_font_size` int DEFAULT NULL,
  `display_font_color` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sms_url` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sms_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `installed` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `offline_queue_limit` int DEFAULT NULL,
  `online_queue_limit` int DEFAULT NULL,
  `on_time` time DEFAULT NULL,
  `off_time` time DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `settings_language_id_foreign` (`language_id`) USING BTREE,
  CONSTRAINT `settings_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.settings: ~1 rows (approximately)
INSERT IGNORE INTO `settings` (`id`, `language_id`, `name`, `address`, `email`, `phone`, `location`, `timezone`, `logo`, `display_notification`, `display_font_size`, `display_font_color`, `sms_url`, `sms_enabled`, `installed`, `created_at`, `updated_at`, `offline_queue_limit`, `online_queue_limit`, `on_time`, `off_time`) VALUES
	(1, 8, 'Dispendukcapil', 'Jl. Dermojoyo No.30, Payaman', 'dispendukcapil@nganjukkab.go.id', '0358321150', 'Kab. Nganjuk', 'Asia/Jakarta', NULL, 'Selamat datang di Dinas Kependudukan dan Pencatatan Sipil Kab. Nganjuk', 18, '#000000', NULL, 0, 2, '2023-06-22 02:15:45', '2024-01-30 23:28:59', 0, 3, '00:00:01', '15:00:00');

-- Dumping structure for table jftoken.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table jftoken.users: ~5 rows (approximately)
INSERT IGNORE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `image`, `role_id`) VALUES
	(1, 'Dinas Kependudukan dan Pencatatan Sipil Kab. Nganjuk', 'admin', NULL, '$2y$10$nBoCl0l.Yv5eidsv.n/4quyX25D60X.1.xMoGAYr6op9WFkKJJJbO', NULL, '2023-06-13 19:55:36', '2024-02-11 06:20:49', 'profile/7eIfpfJ5uzscADtVs6YqjU3ueccWj1NvpYuiqQry.png', 1),
	(2, 'Konter 1', 'konter1', NULL, '$2y$10$nBoCl0l.Yv5eidsv.n/4quyX25D60X.1.xMoGAYr6op9WFkKJJJbO', NULL, '2023-06-22 09:43:40', '2024-02-01 05:54:12', NULL, 2),
	(3, 'Konter 2', 'konter2', NULL, '$2y$10$nBoCl0l.Yv5eidsv.n/4quyX25D60X.1.xMoGAYr6op9WFkKJJJbO', NULL, '2023-06-22 09:44:06', '2023-06-22 09:44:06', NULL, 2),
	(5, 'Idola Nolan', 'syha@mailinator.com', NULL, '$2y$10$nBoCl0l.Yv5eidsv.n/4quyX25D60X.1.xMoGAYr6op9WFkKJJJbO', NULL, '2024-01-19 06:29:07', '2024-01-19 06:29:07', NULL, 2),
	(6, 'daad', 'dada', NULL, '$2y$10$nBoCl0l.Yv5eidsv.n/4quyX25D60X.1.xMoGAYr6op9WFkKJJJbO', NULL, '2024-02-01 05:55:38', '2024-02-01 05:55:38', NULL, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
