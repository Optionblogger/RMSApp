-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2018 at 10:09 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rmsfinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_dashboard_items`
--

CREATE TABLE `admin_dashboard_items` (
  `id` bigint(20) NOT NULL,
  `activeTenants` bit(1) NOT NULL,
  `agents` bit(1) NOT NULL,
  `properties` bit(1) NOT NULL,
  `units` bit(1) NOT NULL,
  `occupiedUnits` bit(1) NOT NULL,
  `vacantUnits` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin_dashboard_items`
--

INSERT INTO `admin_dashboard_items` (`id`, `activeTenants`, `agents`, `properties`, `units`, `occupiedUnits`, `vacantUnits`) VALUES
(1, b'1', b'1', b'1', b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `cmp_sequence`
--

CREATE TABLE `cmp_sequence` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `nextval` decimal(19,2) DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `timeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(26),
(26),
(26),
(26),
(26),
(26),
(26),
(26),
(26),
(26),
(26);

-- --------------------------------------------------------

--
-- Table structure for table `SmtpSetup`
--

CREATE TABLE `SmtpSetup` (
  `id` bigint(20) NOT NULL,
  `authenticatingEmail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `smtpHost` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `smtpPassword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `smtpPort` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `smtpUsername` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account_recovery`
--

CREATE TABLE `tbl_account_recovery` (
  `id` bigint(20) NOT NULL,
  `accountRecoveryActive` bit(1) NOT NULL,
  `accountRecoveryName` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_activity_logs`
--

CREATE TABLE `tbl_activity_logs` (
  `id` bigint(20) NOT NULL,
  `access_menu` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `userProfile` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_activity_logs`
--

INSERT INTO `tbl_activity_logs` (`id`, `access_menu`, `datetime`, `description`, `user_id`, `userProfile`) VALUES
(1, 'SIGN_IN', '2018-10-26 12:30:02', 'accesed home page', 0, NULL),
(2, 'SIGN_IN', '2018-10-26 12:30:04', 'accesed home page', 0, NULL),
(3, 'SIGN_IN', '2018-10-26 12:34:43', 'accesed home page', 0, NULL),
(4, 'SIGN_IN', '2018-10-26 12:34:53', 'accesed home page', 0, NULL),
(5, 'SIGN_IN', '2018-10-26 12:39:57', 'accesed home page', 0, NULL),
(6, 'SIGN_IN', '2018-10-26 12:40:05', 'accesed home page', 0, NULL),
(7, 'AGENT_LOGIN', '2018-10-26 12:42:39', 'login attempt', 0, NULL),
(8, 'AGENT_LOGIN', '2018-10-26 12:43:28', 'login attempt', 0, NULL),
(9, 'ADMIN_LOGIN', '2018-10-26 12:45:48', 'login attempt', 0, NULL),
(10, 'ADMIN_LOGIN', '2018-10-26 12:46:20', 'login attempt', 0, NULL),
(11, 'SIGN_IN', '2018-10-29 14:58:15', 'accesed home page', 0, NULL),
(12, 'SIGN_IN', '2018-10-29 14:58:17', 'accesed home page', 0, NULL),
(13, 'AGENT_LOGIN', '2018-10-29 14:58:48', 'login attempt', 0, NULL),
(14, 'AGENT_LOGIN', '2018-10-29 15:00:02', 'login attempt', 0, NULL),
(15, 'AGENT_LOGIN', '2018-10-29 15:00:24', 'login attempt', 0, NULL),
(16, 'ADMIN_LOGIN', '2018-10-29 15:01:00', 'login attempt', 0, NULL),
(17, 'SIGN_IN', '2018-10-29 15:04:44', 'accesed home page', 0, NULL),
(18, 'AGENT_LOGIN', '2018-10-29 15:04:52', 'successfully logged in', 0, 'AGENT'),
(19, 'SIGN_IN', '2018-10-29 15:16:09', 'accesed home page', 0, NULL),
(20, 'SIGN_IN', '2018-10-29 15:16:11', 'accesed home page', 0, NULL),
(21, 'AGENT_LOGIN', '2018-10-29 15:16:23', 'successfully logged in', 0, 'AGENT'),
(22, '', '2018-10-29 15:19:58', 'logged out', 0, 'AGENT'),
(23, 'SIGN_IN', '2018-10-29 15:19:58', 'accesed home page', 0, NULL),
(24, 'ADMIN_LOGIN', '2018-10-29 15:22:08', 'login attempt', 0, NULL),
(25, 'ADMIN_LOGIN', '2018-10-29 15:22:41', 'login attempt', 0, NULL),
(26, 'ADMIN_LOGIN', '2018-10-29 15:27:09', 'successfully logged in', 0, 'LANDLORD'),
(27, '', '2018-10-29 15:27:31', 'logged out', 0, 'LANDLORD'),
(28, 'SIGN_IN', '2018-10-29 15:27:33', 'accesed home page', 0, NULL),
(29, 'SIGN_IN', '2018-11-03 10:56:42', 'accesed home page', 0, NULL),
(30, 'SIGN_IN', '2018-11-03 10:56:44', 'accesed home page', 0, NULL),
(31, 'AGENT_LOGIN', '2018-11-03 10:56:47', 'login attempt', 0, NULL),
(32, 'AGENT_LOGIN', '2018-11-03 10:57:25', 'successfully logged in', 0, 'AGENT'),
(33, 'VRP', '2018-11-03 11:13:43', 'View Rent Paid', 0, NULL),
(34, 'VRP_GRID', '2018-11-03 11:14:08', 'View Rent Paid', 0, NULL),
(35, 'VRP_GRID', '2018-11-03 11:15:01', 'View Rent Paid', 0, NULL),
(36, 'VRP_GRID', '2018-11-03 11:24:48', 'View Rent Paid', 0, NULL),
(37, 'SIGN_IN', '2018-11-03 11:35:56', 'accesed home page', 0, NULL),
(38, 'AGENT_LOGIN', '2018-11-03 11:36:09', 'successfully logged in', 0, 'AGENT'),
(39, 'VRP_GRID', '2018-11-03 11:36:15', 'View Rent Paid', 0, NULL),
(40, 'PR', '2018-11-03 11:41:12', ' View Invoices', 0, NULL),
(41, 'SIGN_IN', '2018-11-03 11:52:31', 'accesed home page', 0, NULL),
(42, 'AGENT_LOGIN', '2018-11-03 11:52:38', 'successfully logged in', 0, 'AGENT'),
(43, 'VRP_GRID', '2018-11-03 11:52:51', 'View Rent Paid', 0, NULL),
(44, 'VRA_GRID', '2018-11-03 11:53:11', 'View Rent Arrears', 0, NULL),
(45, 'VRPP_GRID', '2018-11-03 11:53:38', 'View Rent Prepaid', 0, NULL),
(46, 'AT', '2018-11-03 11:58:42', 'View TenancyAgreement Form', 0, NULL),
(47, 'AT', '2018-11-03 12:23:13', 'View TenancyAgreement Form', 0, NULL),
(48, 'SIGN_IN', '2018-11-03 14:09:24', 'accesed home page', 0, NULL),
(49, 'SIGN_IN', '2018-11-03 14:09:26', 'accesed home page', 0, NULL),
(50, 'AGENT_LOGIN', '2018-11-03 14:09:35', 'successfully logged in', 0, 'AGENT'),
(51, 'SIGN_IN', '2018-11-03 14:18:32', 'accesed home page', 0, NULL),
(52, 'AGENT_LOGIN', '2018-11-03 14:18:39', 'successfully logged in', 0, 'AGENT'),
(53, 'AUL', '2018-11-03 14:18:45', 'Adding Unit Liabilities', 0, NULL),
(54, '', '2018-11-03 14:19:11', 'logged out', 0, 'AGENT'),
(55, 'SIGN_IN', '2018-11-03 14:19:11', 'accesed home page', 0, NULL),
(56, 'ADMIN_LOGIN', '2018-11-03 14:21:41', 'successfully logged in', 0, 'LANDLORD'),
(57, '', '2018-11-03 14:21:49', 'logged out', 0, 'LANDLORD'),
(58, 'ADMIN_LOGIN', '2018-11-03 14:23:47', 'successfully logged in', 0, 'LANDLORD'),
(59, 'SIGN_IN', '2018-11-03 14:31:00', 'accesed home page', 0, NULL),
(60, 'ADMIN_LOGIN', '2018-11-03 14:31:14', 'login attempt', 0, NULL),
(61, 'ADMIN_LOGIN', '2018-11-03 14:31:32', 'login attempt', 0, NULL),
(62, 'ADMIN_LOGIN', '2018-11-03 14:32:03', 'login attempt', 0, NULL),
(63, 'SIGN_IN', '2018-11-03 14:34:14', 'accesed home page', 0, NULL),
(64, 'ADMIN_LOGIN', '2018-11-03 14:35:41', 'successfully logged in', 0, 'LANDLORD'),
(65, '', '2018-11-03 14:35:53', 'logged out', 0, 'LANDLORD'),
(66, 'SIGN_IN', '2018-11-03 14:36:02', 'accesed home page', 0, NULL),
(67, 'AGENT_LOGIN', '2018-11-03 14:36:17', 'successfully logged in', 0, 'AGENT'),
(68, 'AUL', '2018-11-03 14:36:26', 'Adding Unit Liabilities', 0, NULL),
(69, '', '2018-11-03 14:36:46', 'logged out', 0, 'AGENT'),
(70, 'SIGN_IN', '2018-11-03 14:36:46', 'accesed home page', 0, NULL),
(71, 'ADMIN_LOGIN', '2018-11-03 14:37:18', 'login attempt', 0, NULL),
(72, 'ADMIN_LOGIN', '2018-11-03 14:37:25', 'login attempt', 0, NULL),
(73, 'SIGN_IN', '2018-11-03 14:38:11', 'accesed home page', 0, NULL),
(74, 'AGENT_LOGIN', '2018-11-03 14:38:21', 'successfully logged in', 0, 'AGENT'),
(75, '', '2018-11-03 14:38:30', 'logged out', 0, 'AGENT'),
(76, 'SIGN_IN', '2018-11-03 14:38:31', 'accesed home page', 0, NULL),
(77, 'ADMIN_LOGIN', '2018-11-03 14:38:44', 'successfully logged in', 0, 'LANDLORD'),
(78, '', '2018-11-03 14:40:25', 'logged out', 0, 'LANDLORD'),
(79, 'SIGN_IN', '2018-11-03 14:40:33', 'accesed home page', 0, NULL),
(80, 'AGENT_LOGIN', '2018-11-03 14:40:40', 'successfully logged in', 0, 'AGENT'),
(81, 'VIEW_UNIT_GRID', '2018-11-03 14:40:48', 'View Unit', 0, NULL),
(82, 'VIEW_UNIT', '2018-11-03 14:40:51', 'View Unit', 0, NULL),
(83, 'VIEW_UNIT_GRID', '2018-11-03 14:40:55', 'View Unit', 0, NULL),
(84, 'AUL', '2018-11-03 14:41:13', 'Adding Unit Liabilities', 0, NULL),
(85, 'SIGN_IN', '2018-11-03 14:49:45', 'accesed home page', 0, NULL),
(86, 'AGENT_LOGIN', '2018-11-03 14:50:15', 'successfully logged in', 0, 'AGENT'),
(87, 'AUL', '2018-11-03 14:50:27', 'Adding Unit Liabilities', 0, NULL),
(88, 'SIGN_IN', '2018-11-03 14:53:30', 'accesed home page', 0, NULL),
(89, 'AGENT_LOGIN', '2018-11-03 14:53:53', 'successfully logged in', 0, 'AGENT'),
(90, 'AUL', '2018-11-03 14:54:11', 'Adding Unit Liabilities', 0, NULL),
(91, 'SIGN_IN', '2018-11-03 14:56:37', 'accesed home page', 0, NULL),
(92, 'AGENT_LOGIN', '2018-11-03 14:56:44', 'successfully logged in', 0, 'AGENT'),
(93, 'AUL', '2018-11-03 14:56:54', 'Adding Unit Liabilities', 0, NULL),
(94, 'SIGN_IN', '2018-11-07 20:32:15', 'accesed home page', 0, NULL),
(95, 'SIGN_IN', '2018-11-07 20:32:25', 'accesed home page', 0, NULL),
(96, 'AGENT_LOGIN', '2018-11-07 20:33:24', 'successfully logged in', 0, 'AGENT'),
(97, 'AUL', '2018-11-07 20:33:33', 'Adding Unit Liabilities', 0, NULL),
(98, 'VIEW_UNIT_GRID', '2018-11-07 20:34:14', 'View Unit', 0, NULL),
(99, 'VIEW_UNIT', '2018-11-07 20:34:26', 'View Unit', 0, NULL),
(100, 'VIEW_UNIT_GRID', '2018-11-07 20:38:15', 'View Unit', 0, NULL),
(101, 'AUL', '2018-11-07 20:58:17', 'Adding Unit Liabilities', 0, NULL),
(102, 'SIGN_IN', '2018-11-07 21:34:53', 'accesed home page', 0, NULL),
(103, 'AGENT_LOGIN', '2018-11-07 21:35:02', 'successfully logged in', 0, 'AGENT'),
(104, 'VUL', '2018-11-07 21:35:09', 'View Unit Liabilities', 0, NULL),
(105, 'VUL', '2018-11-07 21:35:36', 'View Unit Liabilities', 0, NULL),
(106, 'SIGN_IN', '2018-11-08 18:19:52', 'accesed home page', 0, NULL),
(107, 'SIGN_IN', '2018-11-08 18:19:57', 'accesed home page', 0, NULL),
(108, 'AGENT_LOGIN', '2018-11-08 18:20:30', 'successfully logged in', 0, 'AGENT'),
(109, 'VUL', '2018-11-08 18:21:22', 'View Unit Liabilities', 0, NULL),
(110, 'VC', '2018-11-08 18:21:47', 'View Tenancy Agreement', 0, NULL),
(111, 'VUL', '2018-11-08 18:21:55', 'View Unit Liabilities', 0, NULL),
(112, 'VIEW_UNIT_GRID', '2018-11-08 18:22:29', 'View Unit', 0, NULL),
(113, 'AUL', '2018-11-08 18:22:36', 'Adding Unit Liabilities', 0, NULL),
(114, 'VIEW_UNIT_GRID', '2018-11-08 18:22:36', 'View Unit', 0, NULL),
(115, 'VUL', '2018-11-08 18:23:09', 'View Unit Liabilities', 0, NULL),
(116, 'SIGN_IN', '2018-11-08 18:55:06', 'accesed home page', 0, NULL),
(117, 'AGENT_LOGIN', '2018-11-08 18:55:21', 'successfully logged in', 0, 'AGENT'),
(118, 'VIEW_UNIT_GRID', '2018-11-08 18:55:51', 'View Unit', 0, NULL),
(119, 'VIEW_UNIT', '2018-11-08 18:55:53', 'View Unit', 0, NULL),
(120, 'VUL', '2018-11-08 18:58:17', 'View Unit Liabilities', 0, NULL),
(121, 'VIEW_UNIT', '2018-11-08 18:58:43', 'View Unit', 0, NULL),
(122, 'VIEW_UNIT_GRID', '2018-11-08 18:58:46', 'View Unit', 0, NULL),
(123, '', '2018-11-08 19:11:30', 'logged out', 0, 'AGENT'),
(124, 'SIGN_IN', '2018-11-08 19:11:30', 'accesed home page', 0, NULL),
(125, 'ADMIN_LOGIN', '2018-11-08 19:12:04', 'successfully logged in', 0, 'LANDLORD'),
(126, 'VRP_GRID', '2018-11-08 19:12:42', 'View Rent Paid', 0, NULL),
(127, 'VRA_GRID', '2018-11-08 19:12:45', 'View Rent Arrears', 0, NULL),
(128, 'VRPP_GRID', '2018-11-08 19:12:47', 'View Rent Prepaid', 0, NULL),
(129, '', '2018-11-08 19:19:30', 'logged out', 0, 'LANDLORD'),
(130, 'SIGN_IN', '2018-11-08 19:19:38', 'accesed home page', 0, NULL),
(131, 'AGENT_LOGIN', '2018-11-08 19:19:47', 'successfully logged in', 0, 'AGENT'),
(132, 'AUL', '2018-11-08 19:19:54', 'Adding Unit Liabilities', 0, NULL),
(133, 'VUL', '2018-11-08 19:19:54', 'View Unit Liabilities', 0, NULL),
(134, 'SIGN_IN', '2018-11-08 19:35:41', 'accesed home page', 0, NULL),
(135, 'AGENT_LOGIN', '2018-11-08 19:35:49', 'successfully logged in', 0, 'AGENT'),
(136, 'VIEW_UNIT_GRID', '2018-11-08 19:35:59', 'View Unit', 0, NULL),
(137, 'VIEW_UNIT', '2018-11-08 19:36:02', 'View Unit', 0, NULL),
(138, 'AUL', '2018-11-08 19:36:06', 'Adding Unit Liabilities', 0, NULL),
(139, 'VUL', '2018-11-08 19:36:06', 'View Unit Liabilities', 0, NULL),
(140, 'VUL', '2018-11-08 19:36:09', 'View Unit Liabilities', 0, NULL),
(141, 'VUL', '2018-11-08 19:36:56', 'View Unit Liabilities', 0, NULL),
(142, 'SIGN_IN', '2018-11-08 19:40:09', 'accesed home page', 0, NULL),
(143, 'AGENT_LOGIN', '2018-11-08 19:40:18', 'successfully logged in', 0, 'AGENT'),
(144, 'VIEW_UNIT', '2018-11-08 19:40:27', 'View Unit', 0, NULL),
(145, 'AUL', '2018-11-08 19:40:30', 'Adding Unit Liabilities', 0, NULL),
(146, 'VUL', '2018-11-08 19:40:30', 'View Unit Liabilities', 0, NULL),
(147, 'VUL', '2018-11-08 19:40:32', 'View Unit Liabilities', 0, NULL),
(148, 'SIGN_IN', '2018-11-08 19:42:27', 'accesed home page', 0, NULL),
(149, 'AGENT_LOGIN', '2018-11-08 19:42:34', 'successfully logged in', 0, 'AGENT'),
(150, 'VUL', '2018-11-08 19:42:44', 'View Unit Liabilities', 0, NULL),
(151, 'VUL', '2018-11-08 19:43:12', 'View Unit Liabilities', 0, NULL),
(152, 'SIGN_IN', '2018-11-08 19:46:11', 'accesed home page', 0, NULL),
(153, 'AGENT_LOGIN', '2018-11-08 19:46:19', 'successfully logged in', 0, 'AGENT'),
(154, 'VUL', '2018-11-08 19:46:26', 'View Unit Liabilities', 0, NULL),
(155, 'SIGN_IN', '2018-11-08 19:50:57', 'accesed home page', 0, NULL),
(156, 'AGENT_LOGIN', '2018-11-08 19:51:06', 'successfully logged in', 0, 'AGENT'),
(157, 'VUL', '2018-11-08 19:51:21', 'View Unit Liabilities', 0, NULL),
(158, 'VUL', '2018-11-08 19:52:06', 'View Unit Liabilities', 0, NULL),
(159, 'SIGN_IN', '2018-11-08 19:59:13', 'accesed home page', 0, NULL),
(160, 'AGENT_LOGIN', '2018-11-08 19:59:24', 'successfully logged in', 0, 'AGENT'),
(161, 'VUL', '2018-11-08 20:00:10', 'View Unit Liabilities', 0, NULL),
(162, 'VUL', '2018-11-08 20:00:37', 'View Unit Liabilities', 0, NULL),
(163, 'SIGN_IN', '2018-11-08 20:08:21', 'accesed home page', 0, NULL),
(164, 'AGENT_LOGIN', '2018-11-08 20:08:29', 'successfully logged in', 0, 'AGENT'),
(165, 'VUL', '2018-11-08 20:08:38', 'View Unit Liabilities', 0, NULL),
(166, 'SIGN_IN', '2018-11-08 20:10:57', 'accesed home page', 0, NULL),
(167, 'AGENT_LOGIN', '2018-11-08 20:11:09', 'successfully logged in', 0, 'AGENT'),
(168, 'VUL', '2018-11-08 20:11:21', 'View Unit Liabilities', 0, NULL),
(169, 'VIEW_UNIT', '2018-11-08 20:18:50', 'View Unit', 0, NULL),
(170, 'SIGN_IN', '2018-11-08 20:24:33', 'accesed home page', 0, NULL),
(171, 'AGENT_LOGIN', '2018-11-08 20:24:39', 'successfully logged in', 0, 'AGENT'),
(172, 'VUL', '2018-11-08 20:24:51', 'View Unit Liabilities', 0, NULL),
(173, 'VUL', '2018-11-08 20:24:51', 'View Unit Liabilities', 0, NULL),
(174, 'SIGN_IN', '2018-11-08 20:27:56', 'accesed home page', 0, NULL),
(175, 'SIGN_IN', '2018-11-08 20:28:00', 'accesed home page', 0, NULL),
(176, 'SIGN_IN', '2018-11-08 20:28:04', 'accesed home page', 0, NULL),
(177, 'AGENT_LOGIN', '2018-11-08 20:28:13', 'successfully logged in', 0, 'AGENT'),
(178, 'VUL', '2018-11-08 20:28:25', 'View Unit Liabilities', 0, NULL),
(179, 'VUL', '2018-11-08 20:28:26', 'View Unit Liabilities', 0, NULL),
(180, 'VUL', '2018-11-08 20:31:12', 'View Unit Liabilities', 0, NULL),
(181, 'VUL', '2018-11-08 20:31:12', 'View Unit Liabilities', 0, NULL),
(182, 'SIGN_IN', '2018-11-08 20:33:32', 'accesed home page', 0, NULL),
(183, 'SIGN_IN', '2018-11-08 20:33:33', 'accesed home page', 0, NULL),
(184, 'AGENT_LOGIN', '2018-11-08 20:33:44', 'successfully logged in', 0, 'AGENT'),
(185, 'VUL', '2018-11-08 20:34:06', 'View Unit Liabilities', 0, NULL),
(186, 'VUL', '2018-11-08 20:34:06', 'View Unit Liabilities', 0, NULL),
(187, 'SIGN_IN', '2018-11-08 20:37:05', 'accesed home page', 0, NULL),
(188, 'AGENT_LOGIN', '2018-11-08 20:37:15', 'successfully logged in', 0, 'AGENT'),
(189, 'SIGN_IN', '2018-11-08 20:40:02', 'accesed home page', 0, NULL),
(190, 'AGENT_LOGIN', '2018-11-08 20:40:12', 'successfully logged in', 0, 'AGENT'),
(191, 'VUL', '2018-11-08 20:40:37', 'View Unit Liabilities', 0, NULL),
(192, 'VUL', '2018-11-08 20:40:37', 'View Unit Liabilities', 0, NULL),
(193, 'SIGN_IN', '2018-11-08 20:43:13', 'accesed home page', 0, NULL),
(194, 'AGENT_LOGIN', '2018-11-08 20:43:16', 'login attempt', 0, NULL),
(195, 'AGENT_LOGIN', '2018-11-08 20:43:31', 'successfully logged in', 0, 'AGENT'),
(196, 'VUL', '2018-11-08 20:44:14', 'View Unit Liabilities', 0, NULL),
(197, 'VUL', '2018-11-08 20:44:14', 'View Unit Liabilities', 0, NULL),
(198, 'SIGN_IN', '2018-11-08 20:45:51', 'accesed home page', 0, NULL),
(199, 'AGENT_LOGIN', '2018-11-08 20:46:03', 'successfully logged in', 0, 'AGENT'),
(200, 'VUL', '2018-11-08 20:46:15', 'View Unit Liabilities', 0, NULL),
(201, 'VUL', '2018-11-08 20:46:15', 'View Unit Liabilities', 0, NULL),
(202, 'AUL', '2018-11-08 20:46:32', 'Adding Unit Liabilities', 0, NULL),
(203, 'VUL', '2018-11-08 20:46:32', 'View Unit Liabilities', 0, NULL),
(204, 'VUL', '2018-11-08 20:46:32', 'View Unit Liabilities', 0, NULL),
(205, 'VIEW_UNIT', '2018-11-08 20:46:36', 'View Unit', 0, NULL),
(206, 'SIGN_IN', '2018-11-08 20:49:08', 'accesed home page', 0, NULL),
(207, 'SIGN_IN', '2018-11-08 20:49:11', 'accesed home page', 0, NULL),
(208, 'AGENT_LOGIN', '2018-11-08 20:49:20', 'successfully logged in', 0, 'AGENT'),
(209, 'VUL', '2018-11-08 20:49:30', 'View Unit Liabilities', 0, NULL),
(210, 'VUL', '2018-11-08 20:49:30', 'View Unit Liabilities', 0, NULL),
(211, 'VUL', '2018-11-08 20:49:39', 'View Unit Liabilities', 0, NULL),
(212, 'VUL', '2018-11-08 20:49:39', 'View Unit Liabilities', 0, NULL),
(213, 'VUL', '2018-11-08 20:50:02', 'View Unit Liabilities', 0, NULL),
(214, 'VUL', '2018-11-08 20:50:02', 'View Unit Liabilities', 0, NULL),
(215, 'VUL', '2018-11-08 20:51:24', 'View Unit Liabilities', 0, NULL),
(216, 'VUL', '2018-11-08 20:51:24', 'View Unit Liabilities', 0, NULL),
(217, 'SIGN_IN', '2018-11-08 20:54:55', 'accesed home page', 0, NULL),
(218, 'SIGN_IN', '2018-11-08 20:54:59', 'accesed home page', 0, NULL),
(219, 'AGENT_LOGIN', '2018-11-08 20:55:10', 'successfully logged in', 0, 'AGENT'),
(220, 'VUL', '2018-11-08 20:55:34', 'View Unit Liabilities', 0, NULL),
(221, 'VUL', '2018-11-08 20:55:34', 'View Unit Liabilities', 0, NULL),
(222, 'SIGN_IN', '2018-11-09 12:53:51', 'accesed home page', 0, NULL),
(223, 'SIGN_IN', '2018-11-09 12:53:58', 'accesed home page', 0, NULL),
(224, 'AGENT_LOGIN', '2018-11-09 12:55:34', 'successfully logged in', 0, 'AGENT'),
(225, 'VUL', '2018-11-09 12:55:49', 'View Unit Liabilities', 0, NULL),
(226, 'VUL', '2018-11-09 12:56:26', 'View Unit Liabilities', 0, NULL),
(227, 'VUL', '2018-11-09 12:56:27', 'View Unit Liabilities', 0, NULL),
(228, 'VUL', '2018-11-09 12:57:22', 'View Unit Liabilities', 0, NULL),
(229, 'VUL', '2018-11-09 12:57:25', 'View Unit Liabilities', 0, NULL),
(230, 'VUL', '2018-11-09 12:57:25', 'View Unit Liabilities', 0, NULL),
(231, 'SIGN_IN', '2018-11-09 13:14:27', 'accesed home page', 0, NULL),
(232, 'AGENT_LOGIN', '2018-11-09 13:14:38', 'successfully logged in', 0, 'AGENT'),
(233, 'VUL', '2018-11-09 13:14:44', 'View Unit Liabilities', 0, NULL),
(234, 'VUL', '2018-11-09 13:14:44', 'View Unit Liabilities', 0, NULL),
(235, 'SIGN_IN', '2018-11-09 14:31:23', 'accesed home page', 0, NULL),
(236, 'AGENT_LOGIN', '2018-11-09 14:31:33', 'successfully logged in', 0, 'AGENT'),
(237, 'VUL', '2018-11-09 14:31:40', 'View Unit Liabilities', 0, NULL),
(238, 'VUL', '2018-11-09 14:31:40', 'View Unit Liabilities', 0, NULL),
(239, 'SIGN_IN', '2018-11-09 14:37:44', 'accesed home page', 0, NULL),
(240, 'AGENT_LOGIN', '2018-11-09 14:37:52', 'successfully logged in', 0, 'AGENT'),
(241, 'VUL', '2018-11-09 14:37:59', 'View Unit Liabilities', 0, NULL),
(242, 'VUL', '2018-11-09 14:37:59', 'View Unit Liabilities', 0, NULL),
(243, 'SIGN_IN', '2018-11-09 14:41:56', 'accesed home page', 0, NULL),
(244, 'AGENT_LOGIN', '2018-11-09 14:42:10', 'successfully logged in', 0, 'AGENT'),
(245, 'VUL', '2018-11-09 14:42:21', 'View Unit Liabilities', 0, NULL),
(246, 'VUL', '2018-11-09 14:42:22', 'View Unit Liabilities', 0, NULL),
(247, 'SIGN_IN', '2018-11-09 14:49:32', 'accesed home page', 0, NULL),
(248, 'AGENT_LOGIN', '2018-11-09 14:49:45', 'successfully logged in', 0, 'AGENT'),
(249, 'VUL', '2018-11-09 14:49:57', 'View Unit Liabilities', 0, NULL),
(250, 'VUL', '2018-11-09 14:49:57', 'View Unit Liabilities', 0, NULL),
(251, 'SIGN_IN', '2018-11-09 15:15:11', 'accesed home page', 0, NULL),
(252, 'AGENT_LOGIN', '2018-11-09 15:15:19', 'successfully logged in', 0, 'AGENT'),
(253, 'RU', '2018-11-09 15:15:32', 'release unit', 0, NULL),
(254, 'SIGN_IN', '2018-11-09 16:18:58', 'accesed home page', 0, NULL),
(255, 'SIGN_IN', '2018-11-09 16:19:01', 'accesed home page', 0, NULL),
(256, 'AGENT_LOGIN', '2018-11-09 16:20:01', 'successfully logged in', 0, 'AGENT'),
(257, 'RU', '2018-11-09 16:20:13', 'release unit', 0, NULL),
(258, 'SIGN_IN', '2018-11-09 16:23:07', 'accesed home page', 0, NULL),
(259, 'AGENT_LOGIN', '2018-11-09 16:23:16', 'successfully logged in', 0, 'AGENT'),
(260, 'RU', '2018-11-09 16:23:28', 'release unit', 0, NULL),
(261, 'SIGN_IN', '2018-11-09 16:56:51', 'accesed home page', 0, NULL),
(262, 'AGENT_LOGIN', '2018-11-09 16:57:02', 'successfully logged in', 0, 'AGENT'),
(263, 'RU', '2018-11-09 16:57:12', 'release unit', 0, NULL),
(264, 'SIGN_IN', '2018-11-09 17:06:42', 'accesed home page', 0, NULL),
(265, 'AGENT_LOGIN', '2018-11-09 17:06:55', 'successfully logged in', 0, 'AGENT'),
(266, 'RU', '2018-11-09 17:07:17', 'release unit', 0, NULL),
(267, 'SIGN_IN', '2018-11-09 17:18:32', 'accesed home page', 0, NULL),
(268, 'SIGN_IN', '2018-11-09 17:18:36', 'accesed home page', 0, NULL),
(269, 'AGENT_LOGIN', '2018-11-09 17:18:43', 'successfully logged in', 0, 'AGENT'),
(270, 'RU', '2018-11-09 17:18:49', 'release unit', 0, NULL),
(271, 'SIGN_IN', '2018-11-09 17:20:28', 'accesed home page', 0, NULL),
(272, 'AGENT_LOGIN', '2018-11-09 17:20:38', 'successfully logged in', 0, 'AGENT'),
(273, 'RU', '2018-11-09 17:20:51', 'release unit', 0, NULL),
(274, 'AT', '2018-11-09 17:21:42', 'View TenancyAgreement Form', 0, NULL),
(275, 'VC', '2018-11-09 17:22:05', 'View Tenancy Agreement', 0, NULL),
(276, 'VC', '2018-11-09 17:22:06', 'View Tenancy Agreement', 0, NULL),
(277, 'AT', '2018-11-09 17:22:14', 'View TenancyAgreement Batch Form', 0, NULL),
(278, 'AT', '2018-11-09 17:22:17', 'View TenancyAgreement Form', 0, NULL),
(279, 'VC', '2018-11-09 17:22:19', 'View Tenancy Agreement', 0, NULL),
(280, 'VC', '2018-11-09 17:22:19', 'View Tenancy Agreement', 0, NULL),
(281, 'RU', '2018-11-09 17:22:37', 'release unit', 0, NULL),
(282, 'SIGN_IN', '2018-11-09 17:26:55', 'accesed home page', 0, NULL),
(283, 'AGENT_LOGIN', '2018-11-09 17:27:12', 'successfully logged in', 0, 'AGENT'),
(284, 'RU', '2018-11-09 17:27:20', 'release unit', 0, NULL),
(285, 'SIGN_IN', '2018-11-09 17:59:11', 'accesed home page', 0, NULL),
(286, 'AGENT_LOGIN', '2018-11-09 17:59:18', 'successfully logged in', 0, 'AGENT'),
(287, 'RU', '2018-11-09 17:59:29', 'release unit', 0, NULL),
(288, 'SIGN_IN', '2018-11-09 18:05:23', 'accesed home page', 0, NULL),
(289, 'SIGN_IN', '2018-11-09 18:05:29', 'accesed home page', 0, NULL),
(290, 'AGENT_LOGIN', '2018-11-09 18:05:43', 'successfully logged in', 0, 'AGENT'),
(291, 'RU', '2018-11-09 18:07:13', 'release unit', 0, NULL),
(292, 'SIGN_IN', '2018-11-09 18:15:59', 'accesed home page', 0, NULL),
(293, 'AGENT_LOGIN', '2018-11-09 18:16:13', 'successfully logged in', 0, 'AGENT'),
(294, 'RU', '2018-11-09 18:16:20', 'release unit', 0, NULL),
(295, 'SIGN_IN', '2018-11-09 18:19:52', 'accesed home page', 0, NULL),
(296, 'AGENT_LOGIN', '2018-11-09 18:19:59', 'successfully logged in', 0, 'AGENT'),
(297, 'RU', '2018-11-09 18:20:47', 'release unit', 0, NULL),
(298, 'SIGN_IN', '2018-11-09 18:25:12', 'accesed home page', 0, NULL),
(299, 'AGENT_LOGIN', '2018-11-09 18:25:24', 'successfully logged in', 0, 'AGENT'),
(300, 'RU', '2018-11-09 18:25:32', 'release unit', 0, NULL),
(301, 'SIGN_IN', '2018-11-09 18:28:29', 'accesed home page', 0, NULL),
(302, 'AGENT_LOGIN', '2018-11-09 18:28:36', 'successfully logged in', 0, 'AGENT'),
(303, 'RU', '2018-11-09 18:29:29', 'release unit', 0, NULL),
(304, 'SIGN_IN', '2018-11-09 18:35:27', 'accesed home page', 0, NULL),
(305, 'AGENT_LOGIN', '2018-11-09 18:35:34', 'successfully logged in', 0, 'AGENT'),
(306, 'RU', '2018-11-09 18:35:44', 'release unit', 0, NULL),
(307, 'SIGN_IN', '2018-11-09 18:51:25', 'accesed home page', 0, NULL),
(308, 'AGENT_LOGIN', '2018-11-09 18:51:33', 'successfully logged in', 0, 'AGENT'),
(309, 'RU', '2018-11-09 18:51:44', 'release unit', 0, NULL),
(310, 'SIGN_IN', '2018-11-09 18:57:16', 'accesed home page', 0, NULL),
(311, 'AGENT_LOGIN', '2018-11-09 18:57:23', 'successfully logged in', 0, 'AGENT'),
(312, 'RU', '2018-11-09 18:57:32', 'release unit', 0, NULL),
(313, 'SIGN_IN', '2018-11-09 18:59:44', 'accesed home page', 0, NULL),
(314, 'AGENT_LOGIN', '2018-11-09 18:59:54', 'successfully logged in', 0, 'AGENT'),
(315, 'RU', '2018-11-09 19:00:16', 'release unit', 0, NULL),
(316, 'SIGN_IN', '2018-11-09 19:20:05', 'accesed home page', 0, NULL),
(317, 'AGENT_LOGIN', '2018-11-09 19:20:13', 'successfully logged in', 0, 'AGENT'),
(318, 'RU', '2018-11-09 19:20:32', 'release unit', 0, NULL),
(319, 'VRP_GRID', '2018-11-09 19:28:14', 'View Rent Paid', 0, NULL),
(320, 'PR', '2018-11-09 19:28:33', ' View Invoices', 0, NULL),
(321, 'AUL', '2018-11-09 19:28:33', 'Adding Unit Liabilities', 0, NULL),
(322, 'VUL', '2018-11-09 19:28:33', 'View Unit Liabilities', 0, NULL),
(323, 'VUL', '2018-11-09 19:28:33', 'View Unit Liabilities', 0, NULL),
(324, 'RU', '2018-11-09 19:28:33', 'release unit', 0, NULL),
(325, 'RR', '2018-11-09 19:28:43', 'Record Rent', 0, NULL),
(326, 'RR', '2018-11-09 19:28:43', 'Record Rent', 0, NULL),
(327, 'PR', '2018-11-09 19:28:43', ' View Invoices', 0, NULL),
(328, 'AUL', '2018-11-09 19:28:43', 'Adding Unit Liabilities', 0, NULL),
(329, 'VUL', '2018-11-09 19:28:43', 'View Unit Liabilities', 0, NULL),
(330, 'VUL', '2018-11-09 19:28:43', 'View Unit Liabilities', 0, NULL),
(331, 'RU', '2018-11-09 19:28:43', 'release unit', 0, NULL),
(332, 'RR', '2018-11-09 19:29:12', 'Record Rent', 0, NULL),
(333, 'RR', '2018-11-09 19:29:12', 'Record Rent', 0, NULL),
(334, 'PR', '2018-11-09 19:29:12', ' View Invoices', 0, NULL),
(335, 'AUL', '2018-11-09 19:29:12', 'Adding Unit Liabilities', 0, NULL),
(336, 'VUL', '2018-11-09 19:29:12', 'View Unit Liabilities', 0, NULL),
(337, 'VUL', '2018-11-09 19:29:12', 'View Unit Liabilities', 0, NULL),
(338, 'RU', '2018-11-09 19:29:12', 'release unit', 0, NULL),
(339, 'RR', '2018-11-09 19:30:09', 'Record Rent', 0, NULL),
(340, 'RR', '2018-11-09 19:30:09', 'Record Rent', 0, NULL),
(341, 'PR', '2018-11-09 19:30:09', ' View Invoices', 0, NULL),
(342, 'AUL', '2018-11-09 19:30:09', 'Adding Unit Liabilities', 0, NULL),
(343, 'VUL', '2018-11-09 19:30:09', 'View Unit Liabilities', 0, NULL),
(344, 'VUL', '2018-11-09 19:30:09', 'View Unit Liabilities', 0, NULL),
(345, 'RU', '2018-11-09 19:30:09', 'release unit', 0, NULL),
(346, 'VRA_GRID', '2018-11-09 19:30:36', 'View Rent Arrears', 0, NULL),
(347, 'VRP', '2018-11-09 19:30:38', 'View Rent Paid', 0, NULL),
(348, 'VRP_GRID', '2018-11-09 19:30:44', 'View Rent Paid', 0, NULL),
(349, 'VRP_GRID', '2018-11-09 19:31:02', 'View Rent Paid', 0, NULL),
(350, 'SIGN_IN', '2018-11-09 19:44:46', 'accesed home page', 0, NULL),
(351, 'AGENT_LOGIN', '2018-11-09 19:44:56', 'successfully logged in', 0, 'AGENT'),
(352, 'RU', '2018-11-09 19:45:04', 'release unit', 0, NULL),
(353, 'SIGN_IN', '2018-11-09 19:48:58', 'accesed home page', 0, NULL),
(354, 'AGENT_LOGIN', '2018-11-09 19:49:14', 'successfully logged in', 0, 'AGENT'),
(355, 'RU', '2018-11-09 19:49:33', 'release unit', 0, NULL),
(356, 'SIGN_IN', '2018-11-09 20:11:44', 'accesed home page', 0, NULL),
(357, 'SIGN_IN', '2018-11-09 20:11:49', 'accesed home page', 0, NULL),
(358, 'AGENT_LOGIN', '2018-11-09 20:11:58', 'successfully logged in', 0, 'AGENT'),
(359, 'RU', '2018-11-09 20:12:06', 'release unit', 0, NULL),
(360, 'SIGN_IN', '2018-11-09 20:16:29', 'accesed home page', 0, NULL),
(361, 'AGENT_LOGIN', '2018-11-09 20:16:34', 'login attempt', 0, NULL),
(362, 'AGENT_LOGIN', '2018-11-09 20:16:48', 'successfully logged in', 0, 'AGENT'),
(363, 'RU', '2018-11-09 20:17:37', 'release unit', 0, NULL),
(364, 'SIGN_IN', '2018-11-09 20:19:33', 'accesed home page', 0, NULL),
(365, 'AGENT_LOGIN', '2018-11-09 20:19:46', 'successfully logged in', 0, 'AGENT'),
(366, 'RU', '2018-11-09 20:19:55', 'release unit', 0, NULL),
(367, 'SIGN_IN', '2018-11-12 11:18:30', 'accesed home page', 0, NULL),
(368, 'SIGN_IN', '2018-11-12 11:18:39', 'accesed home page', 0, NULL),
(369, 'AGENT_LOGIN', '2018-11-12 11:18:53', 'successfully logged in', 0, 'AGENT'),
(370, 'RU', '2018-11-12 11:19:33', 'release unit', 0, NULL),
(371, 'SIGN_IN', '2018-11-12 11:32:10', 'accesed home page', 0, NULL),
(372, 'AGENT_LOGIN', '2018-11-12 11:32:25', 'successfully logged in', 0, 'AGENT'),
(373, 'RU', '2018-11-12 11:32:36', 'release unit', 0, NULL),
(374, 'VIEW_UNIT_GRID', '2018-11-12 11:33:02', 'View Unit', 0, NULL),
(375, 'AUL', '2018-11-12 11:33:07', 'Adding Unit Liabilities', 0, NULL),
(376, 'VUL', '2018-11-12 11:33:07', 'View Unit Liabilities', 0, NULL),
(377, 'VUL', '2018-11-12 11:33:08', 'View Unit Liabilities', 0, NULL),
(378, 'RU', '2018-11-12 11:33:08', 'release unit', 0, NULL),
(379, 'VUL', '2018-11-12 11:33:12', 'View Unit Liabilities', 0, NULL),
(380, 'VUL', '2018-11-12 11:33:12', 'View Unit Liabilities', 0, NULL),
(381, 'RU', '2018-11-12 11:33:12', 'release unit', 0, NULL),
(382, 'VUL', '2018-11-12 11:33:15', 'View Unit Liabilities', 0, NULL),
(383, 'RU', '2018-11-12 11:33:16', 'release unit', 0, NULL),
(384, 'VUL', '2018-11-12 11:33:20', 'View Unit Liabilities', 0, NULL),
(385, 'VUL', '2018-11-12 11:33:21', 'View Unit Liabilities', 0, NULL),
(386, 'RU', '2018-11-12 11:33:21', 'release unit', 0, NULL),
(387, 'SIGN_IN', '2018-11-12 11:43:27', 'accesed home page', 0, NULL),
(388, 'AGENT_LOGIN', '2018-11-12 11:43:40', 'successfully logged in', 0, 'AGENT'),
(389, 'RU', '2018-11-12 11:43:52', 'release unit', 0, NULL),
(390, 'VUL', '2018-11-12 11:43:56', 'View Unit Liabilities', 0, NULL),
(391, 'RU', '2018-11-12 11:43:56', 'release unit', 0, NULL),
(392, 'VUL', '2018-11-12 11:43:59', 'View Unit Liabilities', 0, NULL),
(393, 'VUL', '2018-11-12 11:43:59', 'View Unit Liabilities', 0, NULL),
(394, 'RU', '2018-11-12 11:44:00', 'release unit', 0, NULL),
(395, 'SIGN_IN', '2018-11-12 11:55:29', 'accesed home page', 0, NULL),
(396, 'AGENT_LOGIN', '2018-11-12 11:55:38', 'successfully logged in', 0, 'AGENT'),
(397, 'VUL', '2018-11-12 11:55:50', 'View Unit Liabilities', 0, NULL),
(398, 'VUL', '2018-11-12 11:55:51', 'View Unit Liabilities', 0, NULL),
(399, 'RU', '2018-11-12 11:55:51', 'release unit', 0, NULL),
(400, 'SIGN_IN', '2018-11-12 15:12:01', 'accesed home page', 0, NULL),
(401, 'AGENT_LOGIN', '2018-11-12 15:12:10', 'successfully logged in', 0, 'AGENT'),
(402, '', '2018-11-12 15:12:22', 'logged out', 0, 'AGENT'),
(403, 'SIGN_IN', '2018-11-12 15:12:22', 'accesed home page', 0, NULL),
(404, 'ADMIN_LOGIN', '2018-11-12 15:13:13', 'successfully logged in', 0, 'LANDLORD'),
(405, 'ADMIN_LOGIN', '2018-11-12 15:21:31', 'successfully logged in', 0, 'LANDLORD'),
(406, 'SIGN_IN', '2018-11-12 15:28:57', 'accesed home page', 0, NULL),
(407, 'SIGN_IN', '2018-11-12 15:29:04', 'accesed home page', 0, NULL),
(408, 'ADMIN_LOGIN', '2018-11-12 15:29:22', 'login attempt', 0, NULL),
(409, 'ADMIN_LOGIN', '2018-11-12 15:29:33', 'successfully logged in', 0, 'LANDLORD'),
(410, 'ADMIN_LOGIN', '2018-11-12 15:38:23', 'successfully logged in', 0, 'LANDLORD'),
(411, 'VRP_GRID', '2018-11-12 15:48:56', 'View Rent Paid', 0, NULL),
(412, 'ADMIN_LOGIN', '2018-11-12 16:16:29', 'login attempt', 0, NULL),
(413, 'ADMIN_LOGIN', '2018-11-12 16:16:40', 'successfully logged in', 0, 'LANDLORD'),
(414, '', '2018-11-12 16:23:06', 'logged out', 0, 'LANDLORD'),
(415, 'ADMIN_LOGIN', '2018-11-12 16:23:15', 'login attempt', 0, NULL),
(416, 'ADMIN_LOGIN', '2018-11-12 16:24:21', 'login attempt', 0, NULL),
(417, 'ADMIN_LOGIN', '2018-11-12 16:25:04', 'successfully logged in', 0, 'LANDLORD'),
(418, '', '2018-11-12 16:25:54', 'logged out', 0, 'LANDLORD'),
(419, 'ADMIN_LOGIN', '2018-11-12 16:26:05', 'successfully logged in', 0, 'ADMINISTRATOR'),
(420, '', '2018-11-12 16:28:39', 'logged out', 0, 'ADMINISTRATOR'),
(421, 'ADMIN_LOGIN', '2018-11-12 16:28:50', 'successfully logged in', 0, 'LANDLORD'),
(422, '', '2018-11-12 16:57:04', 'logged out', 0, 'LANDLORD'),
(423, 'ADMIN_LOGIN', '2018-11-12 16:57:13', 'login attempt', 0, NULL),
(424, 'SIGN_IN', '2018-11-12 16:57:21', 'accesed home page', 0, NULL),
(425, 'AGENT_LOGIN', '2018-11-12 16:57:29', 'successfully logged in', 0, 'AGENT'),
(426, 'VC', '2018-11-12 16:57:35', 'View Tenancy Agreement', 0, NULL),
(427, 'VC', '2018-11-12 16:57:35', 'View Tenancy Agreement', 0, NULL),
(428, 'VUL', '2018-11-12 16:58:01', 'View Unit Liabilities', 0, NULL),
(429, 'VUL', '2018-11-12 16:58:02', 'View Unit Liabilities', 0, NULL),
(430, 'RU', '2018-11-12 16:58:02', 'release unit', 0, NULL),
(431, 'VUL', '2018-11-12 16:58:05', 'View Unit Liabilities', 0, NULL),
(432, 'RU', '2018-11-12 16:58:05', 'release unit', 0, NULL),
(433, 'VUL', '2018-11-12 16:58:12', 'View Unit Liabilities', 0, NULL),
(434, 'VUL', '2018-11-12 16:58:12', 'View Unit Liabilities', 0, NULL),
(435, 'RU', '2018-11-12 16:58:12', 'release unit', 0, NULL),
(436, 'VIEW_UNIT', '2018-11-12 16:58:16', 'View Unit', 0, NULL),
(437, 'VC', '2018-11-12 16:59:26', 'View Tenancy Agreement', 0, NULL),
(438, 'VC', '2018-11-12 16:59:26', 'View Tenancy Agreement', 0, NULL),
(439, 'AT', '2018-11-12 16:59:43', 'View TenancyAgreement Form', 0, NULL),
(440, 'AT', '2018-11-12 17:01:38', 'View TenancyAgreement Batch Form', 0, NULL),
(441, 'VC', '2018-11-12 17:01:41', 'View Tenancy Agreement', 0, NULL),
(442, 'VC', '2018-11-12 17:01:41', 'View Tenancy Agreement', 0, NULL),
(443, 'SIGN_IN', '2018-11-12 17:07:18', 'accesed home page', 0, NULL),
(444, 'ADMIN_LOGIN', '2018-11-12 17:07:43', 'login attempt', 0, NULL),
(445, 'ADMIN_LOGIN', '2018-11-12 17:07:59', 'successfully logged in', 0, 'LANDLORD'),
(446, 'VC', '2018-11-12 17:08:07', 'View Tenancy Agreement', 0, NULL),
(447, 'VC', '2018-11-12 17:08:07', 'View Tenancy Agreement', 0, NULL),
(448, 'VC', '2018-11-12 17:08:24', 'View Tenancy Agreement', 0, NULL),
(449, 'VC', '2018-11-12 17:08:24', 'View Tenancy Agreement', 0, NULL),
(450, '', '2018-11-12 17:10:57', 'logged out', 0, 'LANDLORD'),
(451, 'SIGN_IN', '2018-11-12 17:11:12', 'accesed home page', 0, NULL),
(452, 'AGENT_LOGIN', '2018-11-12 17:11:26', 'successfully logged in', 0, 'AGENT'),
(453, 'AT', '2018-11-12 17:11:30', 'View TenancyAgreement Form', 0, NULL),
(454, 'VC', '2018-11-12 17:12:07', 'View Tenancy Agreement', 0, NULL),
(455, 'VC', '2018-11-12 17:12:07', 'View Tenancy Agreement', 0, NULL),
(456, '', '2018-11-12 17:12:22', 'logged out', 0, 'AGENT'),
(457, 'SIGN_IN', '2018-11-12 17:12:22', 'accesed home page', 0, NULL),
(458, 'ADMIN_LOGIN', '2018-11-12 17:12:50', 'successfully logged in', 0, 'LANDLORD'),
(459, 'VC', '2018-11-12 17:13:00', 'View Tenancy Agreement', 0, NULL),
(460, 'VC', '2018-11-12 17:13:00', 'View Tenancy Agreement', 0, NULL),
(461, 'SIGN_IN', '2018-11-12 17:14:54', 'accesed home page', 0, NULL),
(462, 'AGENT_LOGIN', '2018-11-12 17:15:09', 'login attempt', 0, NULL),
(463, 'ADMIN_LOGIN', '2018-11-12 17:15:30', 'successfully logged in', 0, 'LANDLORD'),
(464, 'ADMIN_LOGIN', '2018-11-12 17:39:10', 'successfully logged in', 0, 'LANDLORD'),
(465, 'ADMIN_LOGIN', '2018-11-12 17:42:24', 'successfully logged in', 0, 'LANDLORD'),
(466, 'ADMIN_LOGIN', '2018-11-12 17:44:30', 'successfully logged in', 0, 'LANDLORD'),
(467, 'VC', '2018-11-12 18:01:39', 'View Tenancy Agreement', 0, NULL),
(468, 'VC', '2018-11-12 18:01:39', 'View Tenancy Agreement', 0, NULL),
(469, 'ADMIN_LOGIN', '2018-11-12 18:10:31', 'successfully logged in', 0, 'LANDLORD'),
(470, 'VC', '2018-11-12 18:10:37', 'View Tenancy Agreement', 0, NULL),
(471, 'VC', '2018-11-12 18:10:37', 'View Tenancy Agreement', 0, NULL),
(472, 'ADMIN_LOGIN', '2018-11-12 18:17:17', 'successfully logged in', 0, 'LANDLORD'),
(473, 'ADMIN_LOGIN', '2018-11-12 18:22:25', 'successfully logged in', 0, 'LANDLORD'),
(474, 'ADMIN_LOGIN', '2018-11-12 18:28:34', 'successfully logged in', 0, 'LANDLORD'),
(475, 'VRP_GRID', '2018-11-12 18:29:11', 'View Rent Paid', 0, NULL),
(476, 'VRP_GRID', '2018-11-12 18:29:23', 'View Rent Paid', 0, NULL),
(477, 'VRA_GRID', '2018-11-12 18:29:40', 'View Rent Arrears', 0, NULL),
(478, 'VRPP_GRID', '2018-11-12 18:30:07', 'View Rent Prepaid', 0, NULL),
(479, 'ADMIN_LOGIN', '2018-11-12 18:48:35', 'successfully logged in', 0, 'LANDLORD'),
(480, 'ADMIN_LOGIN', '2018-11-12 18:52:59', 'successfully logged in', 0, 'LANDLORD'),
(481, 'ADMIN_LOGIN', '2018-11-12 18:58:46', 'successfully logged in', 0, 'LANDLORD'),
(482, 'ADMIN_LOGIN', '2018-11-12 19:04:51', 'successfully logged in', 0, 'LANDLORD'),
(483, 'SIGN_IN', '2018-11-12 20:05:08', 'accesed home page', 0, NULL),
(484, 'SIGN_IN', '2018-11-12 20:05:17', 'accesed home page', 0, NULL),
(485, 'ADMIN_LOGIN', '2018-11-12 20:05:40', 'successfully logged in', 0, 'LANDLORD'),
(486, '', '2018-11-12 20:08:35', 'logged out', 0, 'LANDLORD'),
(487, 'SIGN_IN', '2018-11-12 20:08:41', 'accesed home page', 0, NULL),
(488, 'AGENT_LOGIN', '2018-11-12 20:08:52', 'successfully logged in', 0, 'AGENT'),
(489, 'VUL', '2018-11-12 20:09:01', 'View Unit Liabilities', 0, NULL),
(490, 'VUL', '2018-11-12 20:09:02', 'View Unit Liabilities', 0, NULL),
(491, 'RU', '2018-11-12 20:09:02', 'release unit', 0, NULL),
(492, 'SIGN_IN', '2018-11-12 20:27:20', 'accesed home page', 0, NULL),
(493, 'AGENT_LOGIN', '2018-11-12 20:27:29', 'successfully logged in', 0, 'AGENT'),
(494, 'VUL', '2018-11-12 20:27:37', 'View Unit Liabilities', 0, NULL),
(495, 'RU', '2018-11-12 20:27:37', 'release unit', 0, NULL),
(496, 'VUL', '2018-11-12 20:27:41', 'View Unit Liabilities', 0, NULL),
(497, 'VUL', '2018-11-12 20:27:42', 'View Unit Liabilities', 0, NULL),
(498, 'RU', '2018-11-12 20:27:42', 'release unit', 0, NULL),
(499, 'SIGN_IN', '2018-11-13 09:08:02', 'accesed home page', 0, NULL),
(500, 'SIGN_IN', '2018-11-13 09:08:09', 'accesed home page', 0, NULL),
(501, 'ADMIN_LOGIN', '2018-11-13 09:09:13', 'successfully logged in', 0, 'LANDLORD'),
(502, 'SIGN_IN', '2018-11-13 09:14:47', 'accesed home page', 0, NULL),
(503, 'AGENT_LOGIN', '2018-11-13 09:14:56', 'successfully logged in', 0, 'AGENT'),
(504, 'RR', '2018-11-13 09:15:09', 'Record Rent', 0, NULL),
(505, 'RR', '2018-11-13 09:15:09', 'Record Rent', 0, NULL),
(506, 'PR', '2018-11-13 09:15:09', ' View Invoices', 0, NULL),
(507, 'AUL', '2018-11-13 09:15:10', 'Adding Unit Liabilities', 0, NULL),
(508, 'VUL', '2018-11-13 09:15:10', 'View Unit Liabilities', 0, NULL),
(509, 'VUL', '2018-11-13 09:15:10', 'View Unit Liabilities', 0, NULL),
(510, 'RU', '2018-11-13 09:15:10', 'release unit', 0, NULL),
(511, 'VRP_GRID', '2018-11-13 09:15:16', 'View Rent Paid', 0, NULL),
(512, 'RR', '2018-11-13 09:15:48', 'Record Rent', 0, NULL),
(513, 'RR', '2018-11-13 09:15:49', 'Record Rent', 0, NULL),
(514, 'PR', '2018-11-13 09:15:49', ' View Invoices', 0, NULL),
(515, 'AUL', '2018-11-13 09:15:49', 'Adding Unit Liabilities', 0, NULL),
(516, 'VUL', '2018-11-13 09:15:49', 'View Unit Liabilities', 0, NULL),
(517, 'VUL', '2018-11-13 09:15:49', 'View Unit Liabilities', 0, NULL),
(518, 'RU', '2018-11-13 09:15:49', 'release unit', 0, NULL),
(519, 'PR', '2018-11-13 09:16:04', ' View Invoices', 0, NULL),
(520, 'AUL', '2018-11-13 09:16:05', 'Adding Unit Liabilities', 0, NULL),
(521, 'VUL', '2018-11-13 09:16:05', 'View Unit Liabilities', 0, NULL),
(522, 'VUL', '2018-11-13 09:16:05', 'View Unit Liabilities', 0, NULL),
(523, 'RU', '2018-11-13 09:16:05', 'release unit', 0, NULL),
(524, 'PR', '2018-11-13 09:16:11', ' View Invoices', 0, NULL),
(525, 'AUL', '2018-11-13 09:16:11', 'Adding Unit Liabilities', 0, NULL),
(526, 'VUL', '2018-11-13 09:16:12', 'View Unit Liabilities', 0, NULL),
(527, 'VUL', '2018-11-13 09:16:12', 'View Unit Liabilities', 0, NULL),
(528, 'RU', '2018-11-13 09:16:12', 'release unit', 0, NULL),
(529, 'SIGN_IN', '2018-11-14 11:18:46', 'accesed home page', 0, NULL),
(530, 'SIGN_IN', '2018-11-14 11:19:02', 'accesed home page', 0, NULL),
(531, 'AGENT_LOGIN', '2018-11-14 11:19:13', 'successfully logged in', 0, 'AGENT'),
(532, 'RR', '2018-11-14 11:21:56', 'Record Rent', 0, NULL),
(533, 'RR', '2018-11-14 11:21:56', 'Record Rent', 0, NULL),
(534, 'PR', '2018-11-14 11:21:56', ' View Invoices', 0, NULL),
(535, 'AUL', '2018-11-14 11:21:56', 'Adding Unit Liabilities', 0, NULL),
(536, 'VUL', '2018-11-14 11:21:57', 'View Unit Liabilities', 0, NULL),
(537, 'VUL', '2018-11-14 11:21:57', 'View Unit Liabilities', 0, NULL),
(538, 'RU', '2018-11-14 11:21:57', 'release unit', 0, NULL),
(539, 'PR', '2018-11-14 11:22:10', ' View Invoices', 0, NULL),
(540, 'AUL', '2018-11-14 11:22:10', 'Adding Unit Liabilities', 0, NULL),
(541, 'VUL', '2018-11-14 11:22:10', 'View Unit Liabilities', 0, NULL),
(542, 'VUL', '2018-11-14 11:22:10', 'View Unit Liabilities', 0, NULL),
(543, 'RU', '2018-11-14 11:22:10', 'release unit', 0, NULL),
(544, 'RR', '2018-11-14 11:22:22', 'Record Rent', 0, NULL),
(545, 'RR', '2018-11-14 11:22:22', 'Record Rent', 0, NULL),
(546, 'PR', '2018-11-14 11:22:23', ' View Invoices', 0, NULL),
(547, 'AUL', '2018-11-14 11:22:23', 'Adding Unit Liabilities', 0, NULL),
(548, 'VUL', '2018-11-14 11:22:23', 'View Unit Liabilities', 0, NULL),
(549, 'VUL', '2018-11-14 11:22:23', 'View Unit Liabilities', 0, NULL),
(550, 'RU', '2018-11-14 11:22:23', 'release unit', 0, NULL),
(551, 'SIGN_IN', '2018-11-14 14:35:56', 'accesed home page', 0, NULL),
(552, 'SIGN_IN', '2018-11-14 14:36:05', 'accesed home page', 0, NULL),
(553, 'AGENT_LOGIN', '2018-11-14 14:37:05', 'successfully logged in', 0, 'AGENT'),
(554, 'PR', '2018-11-14 14:38:21', ' View Invoices', 0, NULL),
(555, 'AUL', '2018-11-14 14:38:21', 'Adding Unit Liabilities', 0, NULL),
(556, 'VUL', '2018-11-14 14:38:21', 'View Unit Liabilities', 0, NULL),
(557, 'VUL', '2018-11-14 14:38:21', 'View Unit Liabilities', 0, NULL),
(558, 'RU', '2018-11-14 14:38:21', 'release unit', 0, NULL),
(559, 'PR', '2018-11-14 14:39:44', ' View Invoices', 0, NULL),
(560, 'AUL', '2018-11-14 14:39:44', 'Adding Unit Liabilities', 0, NULL),
(561, 'VUL', '2018-11-14 14:39:44', 'View Unit Liabilities', 0, NULL),
(562, 'VUL', '2018-11-14 14:39:44', 'View Unit Liabilities', 0, NULL),
(563, 'RU', '2018-11-14 14:39:45', 'release unit', 0, NULL),
(564, 'RR', '2018-11-14 14:39:47', 'Record Rent', 0, NULL),
(565, 'RR', '2018-11-14 14:39:47', 'Record Rent', 0, NULL),
(566, 'PR', '2018-11-14 14:39:47', ' View Invoices', 0, NULL),
(567, 'AUL', '2018-11-14 14:39:47', 'Adding Unit Liabilities', 0, NULL),
(568, 'VUL', '2018-11-14 14:39:47', 'View Unit Liabilities', 0, NULL),
(569, 'VUL', '2018-11-14 14:39:47', 'View Unit Liabilities', 0, NULL),
(570, 'RU', '2018-11-14 14:39:47', 'release unit', 0, NULL),
(571, 'PR', '2018-11-14 14:39:49', ' View Invoices', 0, NULL),
(572, 'AUL', '2018-11-14 14:39:49', 'Adding Unit Liabilities', 0, NULL),
(573, 'VUL', '2018-11-14 14:39:49', 'View Unit Liabilities', 0, NULL),
(574, 'VUL', '2018-11-14 14:39:49', 'View Unit Liabilities', 0, NULL),
(575, 'RU', '2018-11-14 14:39:49', 'release unit', 0, NULL),
(576, 'PR', '2018-11-14 14:40:40', ' View Invoices', 0, NULL),
(577, 'AUL', '2018-11-14 14:40:40', 'Adding Unit Liabilities', 0, NULL),
(578, 'VUL', '2018-11-14 14:40:40', 'View Unit Liabilities', 0, NULL),
(579, 'VUL', '2018-11-14 14:40:40', 'View Unit Liabilities', 0, NULL),
(580, 'RU', '2018-11-14 14:40:40', 'release unit', 0, NULL),
(581, 'SIGN_IN', '2018-11-14 18:53:21', 'accesed home page', 0, NULL),
(582, 'SIGN_IN', '2018-11-14 18:53:32', 'accesed home page', 0, NULL),
(583, 'AGENT_LOGIN', '2018-11-14 18:56:22', 'successfully logged in', 0, 'AGENT'),
(584, 'SIGN_IN', '2018-11-14 19:26:26', 'accesed home page', 0, NULL),
(585, 'SIGN_IN', '2018-11-14 19:26:32', 'accesed home page', 0, NULL),
(586, 'AGENT_LOGIN', '2018-11-14 19:27:34', 'successfully logged in', 0, 'AGENT'),
(587, 'SIGN_IN', '2018-11-14 19:29:29', 'accesed home page', 0, NULL),
(588, 'AGENT_LOGIN', '2018-11-14 19:29:40', 'successfully logged in', 0, 'AGENT'),
(589, 'RU', '2018-11-14 19:29:49', 'release unit', 0, NULL),
(590, 'SIGN_IN', '2018-11-14 19:37:16', 'accesed home page', 0, NULL),
(591, 'AGENT_LOGIN', '2018-11-14 19:37:26', 'successfully logged in', 0, 'AGENT'),
(592, 'SIGN_IN', '2018-11-14 19:41:31', 'accesed home page', 0, NULL),
(593, 'AGENT_LOGIN', '2018-11-14 19:42:13', 'successfully logged in', 0, 'AGENT'),
(594, 'RR', '2018-11-14 19:42:31', 'Record Rent', 0, NULL),
(595, 'RR', '2018-11-14 19:42:31', 'Record Rent', 0, NULL),
(596, 'PR', '2018-11-14 19:42:31', ' View Invoices', 0, NULL),
(597, 'AUL', '2018-11-14 19:42:31', 'Adding Unit Liabilities', 0, NULL),
(598, 'VUL', '2018-11-14 19:42:31', 'View Unit Liabilities', 0, NULL),
(599, 'VUL', '2018-11-14 19:42:31', 'View Unit Liabilities', 0, NULL),
(600, 'RU', '2018-11-14 19:42:31', 'release unit', 0, NULL),
(601, 'RR', '2018-11-14 19:42:50', 'Record Rent', 0, NULL),
(602, 'RR', '2018-11-14 19:42:50', 'Record Rent', 0, NULL),
(603, 'PR', '2018-11-14 19:42:51', ' View Invoices', 0, NULL),
(604, 'AUL', '2018-11-14 19:42:51', 'Adding Unit Liabilities', 0, NULL),
(605, 'VUL', '2018-11-14 19:42:51', 'View Unit Liabilities', 0, NULL),
(606, 'VUL', '2018-11-14 19:42:51', 'View Unit Liabilities', 0, NULL),
(607, 'RU', '2018-11-14 19:42:51', 'release unit', 0, NULL),
(608, 'SIGN_IN', '2018-11-14 19:45:37', 'accesed home page', 0, NULL),
(609, 'SIGN_IN', '2018-11-14 19:45:39', 'accesed home page', 0, NULL),
(610, 'AGENT_LOGIN', '2018-11-14 19:46:29', 'successfully logged in', 0, 'AGENT'),
(611, 'SIGN_IN', '2018-11-14 19:51:34', 'accesed home page', 0, NULL),
(612, 'AGENT_LOGIN', '2018-11-14 19:52:03', 'successfully logged in', 0, 'AGENT'),
(613, 'PR', '2018-11-14 19:52:08', ' View Invoices', 0, NULL),
(614, 'AUL', '2018-11-14 19:52:09', 'Adding Unit Liabilities', 0, NULL),
(615, 'VUL', '2018-11-14 19:52:09', 'View Unit Liabilities', 0, NULL),
(616, 'VUL', '2018-11-14 19:52:09', 'View Unit Liabilities', 0, NULL),
(617, 'RU', '2018-11-14 19:52:09', 'release unit', 0, NULL),
(618, 'PR', '2018-11-14 19:52:13', ' View Invoices', 0, NULL),
(619, 'AUL', '2018-11-14 19:52:14', 'Adding Unit Liabilities', 0, NULL),
(620, 'VUL', '2018-11-14 19:52:14', 'View Unit Liabilities', 0, NULL),
(621, 'VUL', '2018-11-14 19:52:14', 'View Unit Liabilities', 0, NULL),
(622, 'RU', '2018-11-14 19:52:14', 'release unit', 0, NULL),
(623, 'PR', '2018-11-14 19:52:24', ' View Invoices', 0, NULL),
(624, 'AUL', '2018-11-14 19:52:24', 'Adding Unit Liabilities', 0, NULL),
(625, 'VUL', '2018-11-14 19:52:24', 'View Unit Liabilities', 0, NULL),
(626, 'VUL', '2018-11-14 19:52:24', 'View Unit Liabilities', 0, NULL),
(627, 'RU', '2018-11-14 19:52:25', 'release unit', 0, NULL),
(628, 'SIGN_IN', '2018-11-14 19:57:21', 'accesed home page', 0, NULL),
(629, 'AGENT_LOGIN', '2018-11-14 19:57:30', 'successfully logged in', 0, 'AGENT'),
(630, 'IR', '2018-11-14 19:57:41', 'Issue Receipts', 0, NULL),
(631, 'PR', '2018-11-14 19:57:41', ' View Invoices', 0, NULL),
(632, 'AUL', '2018-11-14 19:57:41', 'Adding Unit Liabilities', 0, NULL),
(633, 'VUL', '2018-11-14 19:57:41', 'View Unit Liabilities', 0, NULL),
(634, 'VUL', '2018-11-14 19:57:41', 'View Unit Liabilities', 0, NULL),
(635, 'RU', '2018-11-14 19:57:41', 'release unit', 0, NULL),
(636, 'SIGN_IN', '2018-11-14 20:10:24', 'accesed home page', 0, NULL),
(637, 'AGENT_LOGIN', '2018-11-14 20:10:31', 'successfully logged in', 0, 'AGENT'),
(638, 'IR', '2018-11-14 20:10:38', 'Issue Receipts', 0, NULL),
(639, 'PR', '2018-11-14 20:10:38', ' View Invoices', 0, NULL),
(640, 'AUL', '2018-11-14 20:10:38', 'Adding Unit Liabilities', 0, NULL),
(641, 'VUL', '2018-11-14 20:10:38', 'View Unit Liabilities', 0, NULL),
(642, 'VUL', '2018-11-14 20:10:38', 'View Unit Liabilities', 0, NULL),
(643, 'RU', '2018-11-14 20:10:38', 'release unit', 0, NULL),
(644, 'SIGN_IN', '2018-11-14 20:14:03', 'accesed home page', 0, NULL),
(645, 'AGENT_LOGIN', '2018-11-14 20:14:11', 'successfully logged in', 0, 'AGENT'),
(646, '', '2018-11-14 20:14:25', 'logged out', 0, 'AGENT'),
(647, 'SIGN_IN', '2018-11-14 20:14:27', 'accesed home page', 0, NULL),
(648, 'ADMIN_LOGIN', '2018-11-14 20:14:43', 'successfully logged in', 0, 'LANDLORD'),
(649, 'SIGN_IN', '2018-11-14 20:15:46', 'accesed home page', 0, NULL),
(650, 'SIGN_IN', '2018-11-14 20:15:50', 'accesed home page', 0, NULL),
(651, 'ADMIN_LOGIN', '2018-11-14 20:16:21', 'successfully logged in', 0, 'LANDLORD'),
(652, 'SIGN_IN', '2018-11-14 20:35:54', 'accesed home page', 0, NULL),
(653, 'SIGN_IN', '2018-11-14 20:35:57', 'accesed home page', 0, NULL),
(654, 'ADMIN_LOGIN', '2018-11-14 20:36:12', 'successfully logged in', 0, 'LANDLORD'),
(655, '', '2018-11-14 20:36:35', 'logged out', 0, 'LANDLORD'),
(656, 'SIGN_IN', '2018-11-14 20:36:40', 'accesed home page', 0, NULL),
(657, 'AGENT_LOGIN', '2018-11-14 20:37:00', 'successfully logged in', 0, 'AGENT'),
(658, 'SIGN_IN', '2018-11-19 13:33:01', 'accesed home page', 0, NULL),
(659, 'SIGN_IN', '2018-11-19 13:33:13', 'accesed home page', 0, NULL),
(660, 'AGENT_LOGIN', '2018-11-19 13:33:22', 'successfully logged in', 0, 'AGENT'),
(661, 'VC', '2018-11-19 13:34:05', 'View Tenancy Agreement', 0, NULL),
(662, 'VC', '2018-11-19 13:34:05', 'View Tenancy Agreement', 0, NULL),
(663, 'AT', '2018-11-19 13:34:09', 'View TenancyAgreement Batch Form', 0, NULL),
(664, 'AT', '2018-11-19 13:34:12', 'View TenancyAgreement Form', 0, NULL),
(665, 'AT', '2018-11-19 13:34:24', 'View TenancyAgreement Batch Form', 0, NULL),
(666, 'AT', '2018-11-19 13:34:26', 'View TenancyAgreement Batch Form', 0, NULL),
(667, 'ADMIN_LOGIN', '2018-11-19 13:35:09', 'successfully logged in', 0, 'LANDLORD'),
(668, 'SIGN_IN', '2018-11-20 09:02:26', 'accesed home page', 0, NULL),
(669, 'SIGN_IN', '2018-11-20 09:02:49', 'accesed home page', 0, NULL),
(670, 'AGENT_LOGIN', '2018-11-20 09:03:57', 'successfully logged in', 0, 'AGENT'),
(671, 'SIGN_IN', '2018-11-20 09:39:11', 'accesed home page', 0, NULL),
(672, 'AGENT_LOGIN', '2018-11-20 09:39:22', 'successfully logged in', 0, 'AGENT'),
(673, 'IR', '2018-11-20 09:40:44', 'Issue Receipts', 0, NULL),
(674, 'PR', '2018-11-20 09:40:44', ' View Invoices', 0, NULL),
(675, 'AUL', '2018-11-20 09:40:45', 'Adding Unit Liabilities', 0, NULL),
(676, 'VUL', '2018-11-20 09:40:45', 'View Unit Liabilities', 0, NULL),
(677, 'VUL', '2018-11-20 09:40:45', 'View Unit Liabilities', 0, NULL),
(678, 'RU', '2018-11-20 09:40:45', 'release unit', 0, NULL),
(679, 'RR', '2018-11-20 09:41:12', 'Record Rent', 0, NULL),
(680, 'RR', '2018-11-20 09:41:12', 'Record Rent', 0, NULL),
(681, 'IR', '2018-11-20 09:41:12', 'Issue Receipts', 0, NULL),
(682, 'PR', '2018-11-20 09:41:12', ' View Invoices', 0, NULL),
(683, 'AUL', '2018-11-20 09:41:12', 'Adding Unit Liabilities', 0, NULL),
(684, 'VUL', '2018-11-20 09:41:12', 'View Unit Liabilities', 0, NULL),
(685, 'VUL', '2018-11-20 09:41:12', 'View Unit Liabilities', 0, NULL),
(686, 'RU', '2018-11-20 09:41:12', 'release unit', 0, NULL),
(687, 'PR', '2018-11-20 09:41:18', ' View Invoices', 0, NULL),
(688, 'AUL', '2018-11-20 09:41:18', 'Adding Unit Liabilities', 0, NULL),
(689, 'VUL', '2018-11-20 09:41:18', 'View Unit Liabilities', 0, NULL),
(690, 'VUL', '2018-11-20 09:41:18', 'View Unit Liabilities', 0, NULL),
(691, 'RU', '2018-11-20 09:41:18', 'release unit', 0, NULL),
(692, 'RR', '2018-11-20 09:41:22', 'Record Rent', 0, NULL),
(693, 'RR', '2018-11-20 09:41:22', 'Record Rent', 0, NULL),
(694, 'IR', '2018-11-20 09:41:22', 'Issue Receipts', 0, NULL),
(695, 'PR', '2018-11-20 09:41:22', ' View Invoices', 0, NULL),
(696, 'AUL', '2018-11-20 09:41:22', 'Adding Unit Liabilities', 0, NULL),
(697, 'VUL', '2018-11-20 09:41:22', 'View Unit Liabilities', 0, NULL),
(698, 'VUL', '2018-11-20 09:41:23', 'View Unit Liabilities', 0, NULL),
(699, 'RU', '2018-11-20 09:41:23', 'release unit', 0, NULL),
(700, 'PR', '2018-11-20 09:50:36', ' View Invoices', 0, NULL),
(701, 'AUL', '2018-11-20 09:50:36', 'Adding Unit Liabilities', 0, NULL),
(702, 'VUL', '2018-11-20 09:50:36', 'View Unit Liabilities', 0, NULL),
(703, 'VUL', '2018-11-20 09:50:36', 'View Unit Liabilities', 0, NULL),
(704, 'RU', '2018-11-20 09:50:36', 'release unit', 0, NULL),
(705, 'SIGN_IN', '2018-11-20 09:57:39', 'accesed home page', 0, NULL),
(706, 'AGENT_LOGIN', '2018-11-20 09:57:50', 'successfully logged in', 0, 'AGENT'),
(707, 'RR', '2018-11-20 09:58:05', 'Record Rent', 0, NULL),
(708, 'RR', '2018-11-20 09:58:05', 'Record Rent', 0, NULL),
(709, 'IR', '2018-11-20 09:58:05', 'Issue Receipts', 0, NULL),
(710, 'PR', '2018-11-20 09:58:06', ' View Invoices', 0, NULL),
(711, 'AUL', '2018-11-20 09:58:06', 'Adding Unit Liabilities', 0, NULL),
(712, 'VUL', '2018-11-20 09:58:06', 'View Unit Liabilities', 0, NULL),
(713, 'VUL', '2018-11-20 09:58:06', 'View Unit Liabilities', 0, NULL),
(714, 'RU', '2018-11-20 09:58:06', 'release unit', 0, NULL),
(715, 'PR', '2018-11-20 09:58:12', ' View Invoices', 0, NULL),
(716, 'AUL', '2018-11-20 09:58:12', 'Adding Unit Liabilities', 0, NULL),
(717, 'VUL', '2018-11-20 09:58:12', 'View Unit Liabilities', 0, NULL),
(718, 'VUL', '2018-11-20 09:58:12', 'View Unit Liabilities', 0, NULL),
(719, 'RU', '2018-11-20 09:58:12', 'release unit', 0, NULL),
(720, 'IR', '2018-11-20 09:58:31', 'Issue Receipts', 0, NULL),
(721, 'PR', '2018-11-20 09:58:31', ' View Invoices', 0, NULL);
INSERT INTO `tbl_activity_logs` (`id`, `access_menu`, `datetime`, `description`, `user_id`, `userProfile`) VALUES
(722, 'AUL', '2018-11-20 09:58:32', 'Adding Unit Liabilities', 0, NULL),
(723, 'VUL', '2018-11-20 09:58:32', 'View Unit Liabilities', 0, NULL),
(724, 'VUL', '2018-11-20 09:58:32', 'View Unit Liabilities', 0, NULL),
(725, 'RU', '2018-11-20 09:58:32', 'release unit', 0, NULL),
(726, 'AT', '2018-11-20 09:59:38', 'View TenancyAgreement Batch Form', 0, NULL),
(727, 'VC', '2018-11-20 09:59:41', 'View Tenancy Agreement', 0, NULL),
(728, 'VC', '2018-11-20 09:59:41', 'View Tenancy Agreement', 0, NULL),
(729, 'IR', '2018-11-20 10:00:35', 'Issue Receipts', 0, NULL),
(730, 'PR', '2018-11-20 10:00:35', ' View Invoices', 0, NULL),
(731, 'AUL', '2018-11-20 10:00:35', 'Adding Unit Liabilities', 0, NULL),
(732, 'VUL', '2018-11-20 10:00:35', 'View Unit Liabilities', 0, NULL),
(733, 'VUL', '2018-11-20 10:00:35', 'View Unit Liabilities', 0, NULL),
(734, 'RU', '2018-11-20 10:00:35', 'release unit', 0, NULL),
(735, 'SIGN_IN', '2018-11-20 10:32:03', 'accesed home page', 0, NULL),
(736, 'SIGN_IN', '2018-11-20 10:32:04', 'accesed home page', 0, NULL),
(737, 'AGENT_LOGIN', '2018-11-20 10:32:13', 'successfully logged in', 0, 'AGENT'),
(738, 'RR', '2018-11-20 10:32:22', 'Record Rent', 0, NULL),
(739, 'RR', '2018-11-20 10:32:22', 'Record Rent', 0, NULL),
(740, 'IR', '2018-11-20 10:32:22', 'Issue Receipts', 0, NULL),
(741, 'PR', '2018-11-20 10:32:22', ' View Invoices', 0, NULL),
(742, 'AUL', '2018-11-20 10:32:22', 'Adding Unit Liabilities', 0, NULL),
(743, 'VUL', '2018-11-20 10:32:22', 'View Unit Liabilities', 0, NULL),
(744, 'VUL', '2018-11-20 10:32:22', 'View Unit Liabilities', 0, NULL),
(745, 'RU', '2018-11-20 10:32:22', 'release unit', 0, NULL),
(746, 'SIGN_IN', '2018-11-20 10:51:52', 'accesed home page', 0, NULL),
(747, 'AGENT_LOGIN', '2018-11-20 10:52:28', 'successfully logged in', 0, 'AGENT'),
(748, 'PR', '2018-11-20 10:52:37', ' View Invoices', 0, NULL),
(749, 'AUL', '2018-11-20 10:52:37', 'Adding Unit Liabilities', 0, NULL),
(750, 'VUL', '2018-11-20 10:52:37', 'View Unit Liabilities', 0, NULL),
(751, 'VUL', '2018-11-20 10:52:37', 'View Unit Liabilities', 0, NULL),
(752, 'RU', '2018-11-20 10:52:37', 'release unit', 0, NULL),
(753, 'RR', '2018-11-20 10:52:45', 'Record Rent', 0, NULL),
(754, 'RR', '2018-11-20 10:52:45', 'Record Rent', 0, NULL),
(755, 'IR', '2018-11-20 10:52:45', 'Issue Receipts', 0, NULL),
(756, 'PR', '2018-11-20 10:52:46', ' View Invoices', 0, NULL),
(757, 'AUL', '2018-11-20 10:52:46', 'Adding Unit Liabilities', 0, NULL),
(758, 'VUL', '2018-11-20 10:52:46', 'View Unit Liabilities', 0, NULL),
(759, 'VUL', '2018-11-20 10:52:46', 'View Unit Liabilities', 0, NULL),
(760, 'RU', '2018-11-20 10:52:46', 'release unit', 0, NULL),
(761, 'SIGN_IN', '2018-11-20 11:58:58', 'accesed home page', 0, NULL),
(762, 'AGENT_LOGIN', '2018-11-20 11:59:07', 'successfully logged in', 0, 'AGENT'),
(763, 'IR', '2018-11-20 11:59:18', 'Issue Receipts', 0, NULL),
(764, 'PR', '2018-11-20 11:59:18', ' View Invoices', 0, NULL),
(765, 'AUL', '2018-11-20 11:59:18', 'Adding Unit Liabilities', 0, NULL),
(766, 'VUL', '2018-11-20 11:59:18', 'View Unit Liabilities', 0, NULL),
(767, 'VUL', '2018-11-20 11:59:18', 'View Unit Liabilities', 0, NULL),
(768, 'RU', '2018-11-20 11:59:18', 'release unit', 0, NULL),
(769, 'SIGN_IN', '2018-11-20 12:08:27', 'accesed home page', 0, NULL),
(770, 'AGENT_LOGIN', '2018-11-20 12:09:03', 'successfully logged in', 0, 'AGENT'),
(771, 'IR', '2018-11-20 12:09:38', 'Issue Receipts', 0, NULL),
(772, 'PR', '2018-11-20 12:09:38', ' View Invoices', 0, NULL),
(773, 'AUL', '2018-11-20 12:09:38', 'Adding Unit Liabilities', 0, NULL),
(774, 'VUL', '2018-11-20 12:09:38', 'View Unit Liabilities', 0, NULL),
(775, 'VUL', '2018-11-20 12:09:38', 'View Unit Liabilities', 0, NULL),
(776, 'RU', '2018-11-20 12:09:38', 'release unit', 0, NULL),
(777, 'SIGN_IN', '2018-11-20 12:16:52', 'accesed home page', 0, NULL),
(778, 'AGENT_LOGIN', '2018-11-20 12:17:00', 'successfully logged in', 0, 'AGENT'),
(779, 'IR', '2018-11-20 12:17:39', 'Issue Receipts', 0, NULL),
(780, 'PR', '2018-11-20 12:17:39', ' View Invoices', 0, NULL),
(781, 'AUL', '2018-11-20 12:17:39', 'Adding Unit Liabilities', 0, NULL),
(782, 'VUL', '2018-11-20 12:17:39', 'View Unit Liabilities', 0, NULL),
(783, 'VUL', '2018-11-20 12:17:39', 'View Unit Liabilities', 0, NULL),
(784, 'RU', '2018-11-20 12:17:39', 'release unit', 0, NULL),
(785, 'SIGN_IN', '2018-11-20 12:26:28', 'accesed home page', 0, NULL),
(786, 'AGENT_LOGIN', '2018-11-20 12:26:34', 'successfully logged in', 0, 'AGENT'),
(787, 'VRP_GRID', '2018-11-20 12:26:49', 'View Rent Paid', 0, NULL),
(788, 'VRP', '2018-11-20 12:26:53', 'View Rent Paid', 0, NULL),
(789, 'VRA_GRID', '2018-11-20 12:27:00', 'View Rent Arrears', 0, NULL),
(790, 'VRP', '2018-11-20 12:27:08', 'View Rent Paid', 0, NULL),
(791, 'VRA_GRID', '2018-11-20 12:27:11', 'View Rent Arrears', 0, NULL),
(792, 'VRPP_GRID', '2018-11-20 12:27:15', 'View Rent Prepaid', 0, NULL),
(793, 'VRP', '2018-11-20 12:27:18', 'View Rent Paid', 0, NULL),
(794, 'VRA_GRID', '2018-11-20 12:27:30', 'View Rent Arrears', 0, NULL),
(795, 'VRP_GRID', '2018-11-20 12:27:37', 'View Rent Paid', 0, NULL),
(796, 'VRP', '2018-11-20 12:27:40', 'View Rent Paid', 0, NULL),
(797, 'VRP', '2018-11-20 12:28:10', 'View Rent Paid', 0, NULL),
(798, 'VRA_GRID', '2018-11-20 12:28:13', 'View Rent Arrears', 0, NULL),
(799, 'VRP_GRID', '2018-11-20 12:29:13', 'View Rent Paid', 0, NULL),
(800, 'VRP', '2018-11-20 12:29:18', 'View Rent Paid', 0, NULL),
(801, 'VRP_GRID', '2018-11-20 12:29:30', 'View Rent Paid', 0, NULL),
(802, 'VRP_GRID', '2018-11-20 12:29:44', 'View Rent Paid', 0, NULL),
(803, 'VRP', '2018-11-20 12:30:13', 'View Rent Paid', 0, NULL),
(804, 'IR', '2018-11-20 12:33:58', 'Issue Receipts', 0, NULL),
(805, 'PR', '2018-11-20 12:33:58', ' View Invoices', 0, NULL),
(806, 'AUL', '2018-11-20 12:33:58', 'Adding Unit Liabilities', 0, NULL),
(807, 'VUL', '2018-11-20 12:33:58', 'View Unit Liabilities', 0, NULL),
(808, 'VUL', '2018-11-20 12:33:58', 'View Unit Liabilities', 0, NULL),
(809, 'RU', '2018-11-20 12:33:58', 'release unit', 0, NULL),
(810, 'VRP', '2018-11-20 12:34:02', 'View Rent Paid', 0, NULL),
(811, 'VRP_GRID', '2018-11-20 12:34:09', 'View Rent Paid', 0, NULL),
(812, 'VRP_GRID', '2018-11-20 12:41:05', 'View Rent Paid', 0, NULL),
(813, 'VRA_GRID', '2018-11-20 12:41:09', 'View Rent Arrears', 0, NULL),
(814, 'VRA_GRID', '2018-11-20 12:41:20', 'View Rent Arrears', 0, NULL),
(815, 'VRP', '2018-11-20 12:43:37', 'View Rent Paid', 0, NULL),
(816, 'SIGN_IN', '2018-11-20 12:50:53', 'accesed home page', 0, NULL),
(817, 'AGENT_LOGIN', '2018-11-20 12:51:03', 'login attempt', 0, NULL),
(818, 'AGENT_LOGIN', '2018-11-20 12:51:17', 'successfully logged in', 0, 'AGENT'),
(819, 'VRP_GRID', '2018-11-20 12:51:31', 'View Rent Paid', 0, NULL),
(820, 'VRP', '2018-11-20 12:51:37', 'View Rent Paid', 0, NULL),
(821, 'VRA_GRID', '2018-11-20 12:51:47', 'View Rent Arrears', 0, NULL),
(822, 'VRA', '2018-11-20 12:51:54', 'View Rent Arrears', 0, NULL),
(823, 'SIGN_IN', '2018-11-20 13:08:02', 'accesed home page', 0, NULL),
(824, 'AGENT_LOGIN', '2018-11-20 13:08:09', 'successfully logged in', 0, 'AGENT'),
(825, 'VRA', '2018-11-20 13:08:25', 'View Rent Arrears', 0, NULL),
(826, 'VRP', '2018-11-20 13:08:34', 'View Rent Paid', 0, NULL),
(827, 'VRA_GRID', '2018-11-20 13:08:37', 'View Rent Arrears', 0, NULL),
(828, 'VRA', '2018-11-20 13:08:55', 'View Rent Arrears', 0, NULL),
(829, 'VRPP_GRID', '2018-11-20 13:08:58', 'View Rent Prepaid', 0, NULL),
(830, 'VRPP', '2018-11-20 13:09:07', 'View Rent Prepaid', 0, NULL),
(831, 'VRPP_GRID', '2018-11-20 13:09:21', 'View Rent Prepaid', 0, NULL),
(832, 'VIEW_UNIT_GRID', '2018-11-20 13:17:06', 'View Unit', 0, NULL),
(833, 'VIEW_UNIT', '2018-11-20 13:24:17', 'View Unit', 0, NULL),
(834, 'SIGN_IN', '2018-11-20 14:35:37', 'accesed home page', 0, NULL),
(835, 'AGENT_LOGIN', '2018-11-20 14:35:44', 'successfully logged in', 0, 'AGENT'),
(836, 'RU', '2018-11-20 14:36:02', 'release unit', 0, NULL),
(837, 'VUL', '2018-11-20 14:36:07', 'View Unit Liabilities', 0, NULL),
(838, 'RU', '2018-11-20 14:36:07', 'release unit', 0, NULL),
(839, 'VUL', '2018-11-20 14:36:12', 'View Unit Liabilities', 0, NULL),
(840, 'VUL', '2018-11-20 14:36:12', 'View Unit Liabilities', 0, NULL),
(841, 'RU', '2018-11-20 14:36:13', 'release unit', 0, NULL),
(842, 'AUL', '2018-11-20 14:36:15', 'Adding Unit Liabilities', 0, NULL),
(843, 'VUL', '2018-11-20 14:36:16', 'View Unit Liabilities', 0, NULL),
(844, 'VUL', '2018-11-20 14:36:16', 'View Unit Liabilities', 0, NULL),
(845, 'RU', '2018-11-20 14:36:16', 'release unit', 0, NULL),
(846, 'VIEW_UNIT', '2018-11-20 14:36:18', 'View Unit', 0, NULL),
(847, 'VIEW_UNIT_GRID', '2018-11-20 14:36:21', 'View Unit', 0, NULL),
(848, 'IR', '2018-11-20 14:36:54', 'Issue Receipts', 0, NULL),
(849, 'PR', '2018-11-20 14:36:54', ' View Invoices', 0, NULL),
(850, 'AUL', '2018-11-20 14:36:54', 'Adding Unit Liabilities', 0, NULL),
(851, 'VUL', '2018-11-20 14:36:54', 'View Unit Liabilities', 0, NULL),
(852, 'VUL', '2018-11-20 14:36:54', 'View Unit Liabilities', 0, NULL),
(853, 'RU', '2018-11-20 14:36:54', 'release unit', 0, NULL),
(854, 'IR', '2018-11-20 14:39:22', 'Issue Receipts', 0, NULL),
(855, 'PR', '2018-11-20 14:39:22', ' View Invoices', 0, NULL),
(856, 'AUL', '2018-11-20 14:39:22', 'Adding Unit Liabilities', 0, NULL),
(857, 'VUL', '2018-11-20 14:39:22', 'View Unit Liabilities', 0, NULL),
(858, 'VUL', '2018-11-20 14:39:22', 'View Unit Liabilities', 0, NULL),
(859, 'RU', '2018-11-20 14:39:22', 'release unit', 0, NULL),
(860, 'SIGN_IN', '2018-11-20 14:43:27', 'accesed home page', 0, NULL),
(861, 'AGENT_LOGIN', '2018-11-20 14:43:34', 'successfully logged in', 0, 'AGENT'),
(862, 'IR', '2018-11-20 14:44:37', 'Issue Receipts', 0, NULL),
(863, 'PR', '2018-11-20 14:44:38', ' View Invoices', 0, NULL),
(864, 'AUL', '2018-11-20 14:44:38', 'Adding Unit Liabilities', 0, NULL),
(865, 'VUL', '2018-11-20 14:44:38', 'View Unit Liabilities', 0, NULL),
(866, 'VUL', '2018-11-20 14:44:38', 'View Unit Liabilities', 0, NULL),
(867, 'RU', '2018-11-20 14:44:38', 'release unit', 0, NULL),
(868, 'SIGN_IN', '2018-11-20 15:11:39', 'accesed home page', 0, NULL),
(869, 'AGENT_LOGIN', '2018-11-20 15:11:47', 'successfully logged in', 0, 'AGENT'),
(870, 'VRP_GRID', '2018-11-20 15:12:05', 'View Rent Paid', 0, NULL),
(871, 'SIGN_IN', '2018-11-20 15:33:30', 'accesed home page', 0, NULL),
(872, 'SIGN_IN', '2018-11-20 15:33:36', 'accesed home page', 0, NULL),
(873, 'AGENT_LOGIN', '2018-11-20 15:34:08', 'successfully logged in', 0, 'AGENT'),
(874, 'VRP_GRID', '2018-11-20 15:35:01', 'View Rent Paid', 0, NULL),
(875, 'SIGN_IN', '2018-11-20 15:39:18', 'accesed home page', 0, NULL),
(876, 'SIGN_IN', '2018-11-20 15:39:20', 'accesed home page', 0, NULL),
(877, 'AGENT_LOGIN', '2018-11-20 15:39:36', 'successfully logged in', 0, 'AGENT'),
(878, 'VRP_GRID', '2018-11-20 15:40:04', 'View Rent Paid', 0, NULL),
(879, 'SIGN_IN', '2018-11-20 15:43:02', 'accesed home page', 0, NULL),
(880, 'AGENT_LOGIN', '2018-11-20 15:43:08', 'successfully logged in', 0, 'AGENT'),
(881, 'VRP_GRID', '2018-11-20 15:43:17', 'View Rent Paid', 0, NULL),
(882, 'SIGN_IN', '2018-11-20 15:46:43', 'accesed home page', 0, NULL),
(883, 'AGENT_LOGIN', '2018-11-20 15:46:49', 'successfully logged in', 0, 'AGENT'),
(884, 'VRP_GRID', '2018-11-20 15:47:10', 'View Rent Paid', 0, NULL),
(885, 'SIGN_IN', '2018-11-20 16:07:11', 'accesed home page', 0, NULL),
(886, 'SIGN_IN', '2018-11-20 16:07:14', 'accesed home page', 0, NULL),
(887, 'AGENT_LOGIN', '2018-11-20 16:08:44', 'successfully logged in', 0, 'AGENT'),
(888, 'VRP_GRID', '2018-11-20 16:08:52', 'View Rent Paid', 0, NULL),
(889, 'SIGN_IN', '2018-11-20 16:11:30', 'accesed home page', 0, NULL),
(890, 'SIGN_IN', '2018-11-20 16:11:31', 'accesed home page', 0, NULL),
(891, 'AGENT_LOGIN', '2018-11-20 16:11:43', 'successfully logged in', 0, 'AGENT'),
(892, 'PR', '2018-11-20 16:11:48', ' View Invoices', 0, NULL),
(893, 'AUL', '2018-11-20 16:11:48', 'Adding Unit Liabilities', 0, NULL),
(894, 'VUL', '2018-11-20 16:11:48', 'View Unit Liabilities', 0, NULL),
(895, 'VUL', '2018-11-20 16:11:48', 'View Unit Liabilities', 0, NULL),
(896, 'RU', '2018-11-20 16:11:48', 'release unit', 0, NULL),
(897, 'VRP_GRID', '2018-11-20 16:11:50', 'View Rent Paid', 0, NULL),
(898, 'SIGN_IN', '2018-11-20 16:14:02', 'accesed home page', 0, NULL),
(899, 'SIGN_IN', '2018-11-20 16:14:03', 'accesed home page', 0, NULL),
(900, 'AGENT_LOGIN', '2018-11-20 16:14:14', 'successfully logged in', 0, 'AGENT'),
(901, 'VRP_GRID', '2018-11-20 16:14:21', 'View Rent Paid', 0, NULL),
(902, 'SIGN_IN', '2018-11-20 16:18:37', 'accesed home page', 0, NULL),
(903, 'AGENT_LOGIN', '2018-11-20 16:18:53', 'successfully logged in', 0, 'AGENT'),
(904, 'VRP_GRID', '2018-11-20 16:19:04', 'View Rent Paid', 0, NULL),
(905, 'SIGN_IN', '2018-11-20 16:33:13', 'accesed home page', 0, NULL),
(906, 'AGENT_LOGIN', '2018-11-20 16:33:22', 'successfully logged in', 0, 'AGENT'),
(907, 'VRA_GRID', '2018-11-20 16:34:08', 'View Rent Arrears', 0, NULL),
(908, 'VRPP_GRID', '2018-11-20 16:34:51', 'View Rent Prepaid', 0, NULL),
(909, 'VIEW_UNIT_GRID', '2018-11-20 16:36:37', 'View Unit', 0, NULL),
(910, 'VIEW_UNIT', '2018-11-20 16:36:40', 'View Unit', 0, NULL),
(911, 'AUL', '2018-11-20 16:36:44', 'Adding Unit Liabilities', 0, NULL),
(912, 'VUL', '2018-11-20 16:36:44', 'View Unit Liabilities', 0, NULL),
(913, 'VUL', '2018-11-20 16:36:45', 'View Unit Liabilities', 0, NULL),
(914, 'RU', '2018-11-20 16:36:45', 'release unit', 0, NULL),
(915, 'VUL', '2018-11-20 16:36:50', 'View Unit Liabilities', 0, NULL),
(916, 'VUL', '2018-11-20 16:36:50', 'View Unit Liabilities', 0, NULL),
(917, 'RU', '2018-11-20 16:36:50', 'release unit', 0, NULL),
(918, 'IR', '2018-11-20 16:37:22', 'Issue Receipts', 0, NULL),
(919, 'PR', '2018-11-20 16:37:22', ' View Invoices', 0, NULL),
(920, 'AUL', '2018-11-20 16:37:22', 'Adding Unit Liabilities', 0, NULL),
(921, 'VUL', '2018-11-20 16:37:22', 'View Unit Liabilities', 0, NULL),
(922, 'VUL', '2018-11-20 16:37:22', 'View Unit Liabilities', 0, NULL),
(923, 'RU', '2018-11-20 16:37:22', 'release unit', 0, NULL),
(924, 'IR', '2018-11-20 16:37:38', 'Issue Receipts', 0, NULL),
(925, 'PR', '2018-11-20 16:37:38', ' View Invoices', 0, NULL),
(926, 'AUL', '2018-11-20 16:37:38', 'Adding Unit Liabilities', 0, NULL),
(927, 'VUL', '2018-11-20 16:37:38', 'View Unit Liabilities', 0, NULL),
(928, 'VUL', '2018-11-20 16:37:38', 'View Unit Liabilities', 0, NULL),
(929, 'RU', '2018-11-20 16:37:38', 'release unit', 0, NULL),
(930, 'SIGN_IN', '2018-11-20 16:44:12', 'accesed home page', 0, NULL),
(931, 'AGENT_LOGIN', '2018-11-20 16:44:19', 'successfully logged in', 0, 'AGENT'),
(932, 'IR', '2018-11-20 16:44:51', 'Issue Receipts', 0, NULL),
(933, 'PR', '2018-11-20 16:44:52', ' View Invoices', 0, NULL),
(934, 'AUL', '2018-11-20 16:44:52', 'Adding Unit Liabilities', 0, NULL),
(935, 'VUL', '2018-11-20 16:44:52', 'View Unit Liabilities', 0, NULL),
(936, 'VUL', '2018-11-20 16:44:52', 'View Unit Liabilities', 0, NULL),
(937, 'RU', '2018-11-20 16:44:52', 'release unit', 0, NULL),
(938, 'IR', '2018-11-20 16:46:58', 'Issue Receipts', 0, NULL),
(939, 'PR', '2018-11-20 16:46:58', ' View Invoices', 0, NULL),
(940, 'AUL', '2018-11-20 16:46:58', 'Adding Unit Liabilities', 0, NULL),
(941, 'VUL', '2018-11-20 16:46:58', 'View Unit Liabilities', 0, NULL),
(942, 'VUL', '2018-11-20 16:46:58', 'View Unit Liabilities', 0, NULL),
(943, 'RU', '2018-11-20 16:46:58', 'release unit', 0, NULL),
(944, 'SIGN_IN', '2018-11-20 16:48:40', 'accesed home page', 0, NULL),
(945, 'SIGN_IN', '2018-11-20 16:48:46', 'accesed home page', 0, NULL),
(946, 'AGENT_LOGIN', '2018-11-20 16:48:56', 'successfully logged in', 0, 'AGENT'),
(947, 'IR', '2018-11-20 16:49:07', 'Issue Receipts', 0, NULL),
(948, 'PR', '2018-11-20 16:49:07', ' View Invoices', 0, NULL),
(949, 'AUL', '2018-11-20 16:49:07', 'Adding Unit Liabilities', 0, NULL),
(950, 'VUL', '2018-11-20 16:49:08', 'View Unit Liabilities', 0, NULL),
(951, 'VUL', '2018-11-20 16:49:08', 'View Unit Liabilities', 0, NULL),
(952, 'RU', '2018-11-20 16:49:08', 'release unit', 0, NULL),
(953, 'SIGN_IN', '2018-11-20 16:50:05', 'accesed home page', 0, NULL),
(954, 'SIGN_IN', '2018-11-20 16:50:07', 'accesed home page', 0, NULL),
(955, 'AGENT_LOGIN', '2018-11-20 16:50:13', 'successfully logged in', 0, 'AGENT'),
(956, 'IR', '2018-11-20 16:50:39', 'Issue Receipts', 0, NULL),
(957, 'PR', '2018-11-20 16:50:39', ' View Invoices', 0, NULL),
(958, 'AUL', '2018-11-20 16:50:39', 'Adding Unit Liabilities', 0, NULL),
(959, 'VUL', '2018-11-20 16:50:39', 'View Unit Liabilities', 0, NULL),
(960, 'VUL', '2018-11-20 16:50:39', 'View Unit Liabilities', 0, NULL),
(961, 'RU', '2018-11-20 16:50:39', 'release unit', 0, NULL),
(962, 'SIGN_IN', '2018-11-20 16:52:19', 'accesed home page', 0, NULL),
(963, 'SIGN_IN', '2018-11-20 16:52:22', 'accesed home page', 0, NULL),
(964, 'AGENT_LOGIN', '2018-11-20 16:52:39', 'successfully logged in', 0, 'AGENT'),
(965, 'IR', '2018-11-20 16:52:46', 'Issue Receipts', 0, NULL),
(966, 'PR', '2018-11-20 16:52:46', ' View Invoices', 0, NULL),
(967, 'AUL', '2018-11-20 16:52:46', 'Adding Unit Liabilities', 0, NULL),
(968, 'VUL', '2018-11-20 16:52:46', 'View Unit Liabilities', 0, NULL),
(969, 'VUL', '2018-11-20 16:52:46', 'View Unit Liabilities', 0, NULL),
(970, 'RU', '2018-11-20 16:52:46', 'release unit', 0, NULL),
(971, 'SIGN_IN', '2018-11-20 17:06:48', 'accesed home page', 0, NULL),
(972, 'AGENT_LOGIN', '2018-11-20 17:06:57', 'successfully logged in', 0, 'AGENT'),
(973, 'IR', '2018-11-20 17:07:04', 'Issue Receipts', 0, NULL),
(974, 'PR', '2018-11-20 17:07:04', ' View Invoices', 0, NULL),
(975, 'AUL', '2018-11-20 17:07:05', 'Adding Unit Liabilities', 0, NULL),
(976, 'VUL', '2018-11-20 17:07:05', 'View Unit Liabilities', 0, NULL),
(977, 'VUL', '2018-11-20 17:07:05', 'View Unit Liabilities', 0, NULL),
(978, 'RU', '2018-11-20 17:07:05', 'release unit', 0, NULL),
(979, 'SIGN_IN', '2018-11-20 17:10:11', 'accesed home page', 0, NULL),
(980, 'AGENT_LOGIN', '2018-11-20 17:10:18', 'successfully logged in', 0, 'AGENT'),
(981, 'IR', '2018-11-20 17:10:23', 'Issue Receipts', 0, NULL),
(982, 'PR', '2018-11-20 17:10:23', ' View Invoices', 0, NULL),
(983, 'AUL', '2018-11-20 17:10:23', 'Adding Unit Liabilities', 0, NULL),
(984, 'VUL', '2018-11-20 17:10:23', 'View Unit Liabilities', 0, NULL),
(985, 'VUL', '2018-11-20 17:10:23', 'View Unit Liabilities', 0, NULL),
(986, 'RU', '2018-11-20 17:10:23', 'release unit', 0, NULL),
(987, 'IR', '2018-11-20 17:10:39', 'Issue Receipts', 0, NULL),
(988, 'PR', '2018-11-20 17:10:39', ' View Invoices', 0, NULL),
(989, 'AUL', '2018-11-20 17:10:39', 'Adding Unit Liabilities', 0, NULL),
(990, 'VUL', '2018-11-20 17:10:39', 'View Unit Liabilities', 0, NULL),
(991, 'VUL', '2018-11-20 17:10:39', 'View Unit Liabilities', 0, NULL),
(992, 'RU', '2018-11-20 17:10:39', 'release unit', 0, NULL),
(993, 'IR', '2018-11-20 17:10:56', 'Issue Receipts', 0, NULL),
(994, 'PR', '2018-11-20 17:10:56', ' View Invoices', 0, NULL),
(995, 'AUL', '2018-11-20 17:10:56', 'Adding Unit Liabilities', 0, NULL),
(996, 'VUL', '2018-11-20 17:10:56', 'View Unit Liabilities', 0, NULL),
(997, 'VUL', '2018-11-20 17:10:56', 'View Unit Liabilities', 0, NULL),
(998, 'RU', '2018-11-20 17:10:57', 'release unit', 0, NULL),
(999, 'SIGN_IN', '2018-11-20 17:12:20', 'accesed home page', 0, NULL),
(1000, 'SIGN_IN', '2018-11-20 17:12:22', 'accesed home page', 0, NULL),
(1001, 'AGENT_LOGIN', '2018-11-20 17:12:30', 'successfully logged in', 0, 'AGENT'),
(1002, 'IR', '2018-11-20 17:12:36', 'Issue Receipts', 0, NULL),
(1003, 'PR', '2018-11-20 17:12:36', ' View Invoices', 0, NULL),
(1004, 'AUL', '2018-11-20 17:12:36', 'Adding Unit Liabilities', 0, NULL),
(1005, 'VUL', '2018-11-20 17:12:36', 'View Unit Liabilities', 0, NULL),
(1006, 'VUL', '2018-11-20 17:12:36', 'View Unit Liabilities', 0, NULL),
(1007, 'RU', '2018-11-20 17:12:36', 'release unit', 0, NULL),
(1008, 'SIGN_IN', '2018-11-20 17:13:56', 'accesed home page', 0, NULL),
(1009, 'AGENT_LOGIN', '2018-11-20 17:14:08', 'successfully logged in', 0, 'AGENT'),
(1010, 'IR', '2018-11-20 17:14:22', 'Issue Receipts', 0, NULL),
(1011, 'PR', '2018-11-20 17:14:22', ' View Invoices', 0, NULL),
(1012, 'AUL', '2018-11-20 17:14:22', 'Adding Unit Liabilities', 0, NULL),
(1013, 'VUL', '2018-11-20 17:14:22', 'View Unit Liabilities', 0, NULL),
(1014, 'VUL', '2018-11-20 17:14:22', 'View Unit Liabilities', 0, NULL),
(1015, 'RU', '2018-11-20 17:14:22', 'release unit', 0, NULL),
(1016, 'SIGN_IN', '2018-11-20 17:15:29', 'accesed home page', 0, NULL),
(1017, 'SIGN_IN', '2018-11-20 17:15:30', 'accesed home page', 0, NULL),
(1018, 'AGENT_LOGIN', '2018-11-20 17:15:41', 'successfully logged in', 0, 'AGENT'),
(1019, 'IR', '2018-11-20 17:15:52', 'Issue Receipts', 0, NULL),
(1020, 'PR', '2018-11-20 17:15:53', ' View Invoices', 0, NULL),
(1021, 'AUL', '2018-11-20 17:15:53', 'Adding Unit Liabilities', 0, NULL),
(1022, 'VUL', '2018-11-20 17:15:53', 'View Unit Liabilities', 0, NULL),
(1023, 'VUL', '2018-11-20 17:15:53', 'View Unit Liabilities', 0, NULL),
(1024, 'RU', '2018-11-20 17:15:53', 'release unit', 0, NULL),
(1025, 'SIGN_IN', '2018-11-20 17:43:00', 'accesed home page', 0, NULL),
(1026, 'SIGN_IN', '2018-11-20 17:43:03', 'accesed home page', 0, NULL),
(1027, 'AGENT_LOGIN', '2018-11-20 17:43:08', 'login attempt', 0, NULL),
(1028, 'AGENT_LOGIN', '2018-11-20 17:43:24', 'successfully logged in', 0, 'AGENT'),
(1029, 'VC', '2018-11-20 17:46:00', 'View Tenancy Agreement', 0, NULL),
(1030, 'VC', '2018-11-20 17:46:00', 'View Tenancy Agreement', 0, NULL),
(1031, 'AT', '2018-11-20 17:46:04', 'View TenancyAgreement Batch Form', 0, NULL),
(1032, 'VC', '2018-11-20 17:47:18', 'View Tenancy Agreement', 0, NULL),
(1033, 'VC_GRID', '2018-11-20 17:47:18', 'View Tenancy Agreement', 0, NULL),
(1034, 'VC', '2018-11-20 17:47:26', 'View Tenancy Agreement', 0, NULL),
(1035, 'VC_GRID', '2018-11-20 17:47:26', 'View Tenancy Agreement', 0, NULL),
(1036, 'IR', '2018-11-20 17:48:28', 'Issue Receipts', 0, NULL),
(1037, 'PR', '2018-11-20 17:48:28', ' View Invoices', 0, NULL),
(1038, 'AUL', '2018-11-20 17:48:28', 'Adding Unit Liabilities', 0, NULL),
(1039, 'VUL', '2018-11-20 17:48:28', 'View Unit Liabilities', 0, NULL),
(1040, 'VUL', '2018-11-20 17:48:28', 'View Unit Liabilities', 0, NULL),
(1041, 'RU', '2018-11-20 17:48:28', 'release unit', 0, NULL),
(1042, 'SIGN_IN', '2018-11-20 18:00:40', 'accesed home page', 0, NULL),
(1043, 'AGENT_LOGIN', '2018-11-20 18:00:48', 'successfully logged in', 0, 'AGENT'),
(1044, 'IR', '2018-11-20 18:01:08', 'Issue Receipts', 0, NULL),
(1045, 'PR', '2018-11-20 18:01:08', ' View Invoices', 0, NULL),
(1046, 'AUL', '2018-11-20 18:01:08', 'Adding Unit Liabilities', 0, NULL),
(1047, 'VUL', '2018-11-20 18:01:08', 'View Unit Liabilities', 0, NULL),
(1048, 'VUL', '2018-11-20 18:01:08', 'View Unit Liabilities', 0, NULL),
(1049, 'RU', '2018-11-20 18:01:08', 'release unit', 0, NULL),
(1050, 'SIGN_IN', '2018-11-20 18:06:09', 'accesed home page', 0, NULL),
(1051, 'AGENT_LOGIN', '2018-11-20 18:06:23', 'successfully logged in', 0, 'AGENT'),
(1052, 'IR', '2018-11-20 18:06:31', 'Issue Receipts', 0, NULL),
(1053, 'PR', '2018-11-20 18:06:32', ' View Invoices', 0, NULL),
(1054, 'AUL', '2018-11-20 18:06:32', 'Adding Unit Liabilities', 0, NULL),
(1055, 'VUL', '2018-11-20 18:06:32', 'View Unit Liabilities', 0, NULL),
(1056, 'VUL', '2018-11-20 18:06:32', 'View Unit Liabilities', 0, NULL),
(1057, 'RU', '2018-11-20 18:06:32', 'release unit', 0, NULL),
(1058, 'IR', '2018-11-20 18:16:28', 'Issue Receipts', 0, NULL),
(1059, 'PR', '2018-11-20 18:16:28', ' View Invoices', 0, NULL),
(1060, 'AUL', '2018-11-20 18:16:28', 'Adding Unit Liabilities', 0, NULL),
(1061, 'VUL', '2018-11-20 18:16:28', 'View Unit Liabilities', 0, NULL),
(1062, 'VUL', '2018-11-20 18:16:28', 'View Unit Liabilities', 0, NULL),
(1063, 'RU', '2018-11-20 18:16:28', 'release unit', 0, NULL),
(1064, 'SIGN_IN', '2018-11-20 18:17:43', 'accesed home page', 0, NULL),
(1065, 'AGENT_LOGIN', '2018-11-20 18:17:54', 'successfully logged in', 0, 'AGENT'),
(1066, 'IR', '2018-11-20 18:18:15', 'Issue Receipts', 0, NULL),
(1067, 'PR', '2018-11-20 18:18:15', ' View Invoices', 0, NULL),
(1068, 'AUL', '2018-11-20 18:18:15', 'Adding Unit Liabilities', 0, NULL),
(1069, 'VUL', '2018-11-20 18:18:15', 'View Unit Liabilities', 0, NULL),
(1070, 'VUL', '2018-11-20 18:18:15', 'View Unit Liabilities', 0, NULL),
(1071, 'RU', '2018-11-20 18:18:15', 'release unit', 0, NULL),
(1072, 'SIGN_IN', '2018-11-20 18:22:19', 'accesed home page', 0, NULL),
(1073, 'SIGN_IN', '2018-11-20 18:22:21', 'accesed home page', 0, NULL),
(1074, 'AGENT_LOGIN', '2018-11-20 18:22:32', 'successfully logged in', 0, 'AGENT'),
(1075, 'IR', '2018-11-20 18:22:40', 'Issue Receipts', 0, NULL),
(1076, 'PR', '2018-11-20 18:22:40', ' View Invoices', 0, NULL),
(1077, 'AUL', '2018-11-20 18:22:40', 'Adding Unit Liabilities', 0, NULL),
(1078, 'VUL', '2018-11-20 18:22:41', 'View Unit Liabilities', 0, NULL),
(1079, 'VUL', '2018-11-20 18:22:41', 'View Unit Liabilities', 0, NULL),
(1080, 'RU', '2018-11-20 18:22:41', 'release unit', 0, NULL),
(1081, 'SIGN_IN', '2018-11-20 18:24:40', 'accesed home page', 0, NULL),
(1082, 'SIGN_IN', '2018-11-20 18:24:41', 'accesed home page', 0, NULL),
(1083, 'AGENT_LOGIN', '2018-11-20 18:24:48', 'successfully logged in', 0, 'AGENT'),
(1084, 'IR', '2018-11-20 18:24:54', 'Issue Receipts', 0, NULL),
(1085, 'PR', '2018-11-20 18:24:54', ' View Invoices', 0, NULL),
(1086, 'AUL', '2018-11-20 18:24:54', 'Adding Unit Liabilities', 0, NULL),
(1087, 'VUL', '2018-11-20 18:24:54', 'View Unit Liabilities', 0, NULL),
(1088, 'VUL', '2018-11-20 18:24:54', 'View Unit Liabilities', 0, NULL),
(1089, 'RU', '2018-11-20 18:24:54', 'release unit', 0, NULL),
(1090, 'SIGN_IN', '2018-11-20 18:26:57', 'accesed home page', 0, NULL),
(1091, 'SIGN_IN', '2018-11-20 18:26:59', 'accesed home page', 0, NULL),
(1092, 'AGENT_LOGIN', '2018-11-20 18:27:07', 'successfully logged in', 0, 'AGENT'),
(1093, 'IR', '2018-11-20 18:27:18', 'Issue Receipts', 0, NULL),
(1094, 'PR', '2018-11-20 18:27:18', ' View Invoices', 0, NULL),
(1095, 'AUL', '2018-11-20 18:27:18', 'Adding Unit Liabilities', 0, NULL),
(1096, 'VUL', '2018-11-20 18:27:18', 'View Unit Liabilities', 0, NULL),
(1097, 'VUL', '2018-11-20 18:27:18', 'View Unit Liabilities', 0, NULL),
(1098, 'RU', '2018-11-20 18:27:18', 'release unit', 0, NULL),
(1099, 'VRP', '2018-11-20 18:32:35', 'View Rent Paid', 0, NULL),
(1100, 'VRP_GRID', '2018-11-20 18:32:44', 'View Rent Paid', 0, NULL),
(1101, 'VRP_GRID', '2018-11-20 18:33:14', 'View Rent Paid', 0, NULL),
(1102, 'SIGN_IN', '2018-11-20 18:54:32', 'accesed home page', 0, NULL),
(1103, 'AGENT_LOGIN', '2018-11-20 18:54:41', 'successfully logged in', 0, 'AGENT'),
(1104, 'VRP_GRID', '2018-11-20 18:54:55', 'View Rent Paid', 0, NULL),
(1105, 'SIGN_IN', '2018-11-20 18:59:33', 'accesed home page', 0, NULL),
(1106, 'SIGN_IN', '2018-11-20 18:59:35', 'accesed home page', 0, NULL),
(1107, 'AGENT_LOGIN', '2018-11-20 18:59:44', 'successfully logged in', 0, 'AGENT'),
(1108, 'VRP_GRID', '2018-11-20 18:59:59', 'View Rent Paid', 0, NULL),
(1109, 'SIGN_IN', '2018-11-20 19:03:24', 'accesed home page', 0, NULL),
(1110, 'SIGN_IN', '2018-11-20 19:03:26', 'accesed home page', 0, NULL),
(1111, 'AGENT_LOGIN', '2018-11-20 19:03:43', 'successfully logged in', 0, 'AGENT'),
(1112, 'IR', '2018-11-20 19:03:53', 'Issue Receipts', 0, NULL),
(1113, 'PR', '2018-11-20 19:03:53', ' View Invoices', 0, NULL),
(1114, 'AUL', '2018-11-20 19:03:53', 'Adding Unit Liabilities', 0, NULL),
(1115, 'VUL', '2018-11-20 19:03:53', 'View Unit Liabilities', 0, NULL),
(1116, 'VUL', '2018-11-20 19:03:53', 'View Unit Liabilities', 0, NULL),
(1117, 'RU', '2018-11-20 19:03:53', 'release unit', 0, NULL),
(1118, 'VRP_GRID', '2018-11-20 19:03:55', 'View Rent Paid', 0, NULL),
(1119, 'SIGN_IN', '2018-11-20 19:05:38', 'accesed home page', 0, NULL),
(1120, 'SIGN_IN', '2018-11-20 19:05:40', 'accesed home page', 0, NULL),
(1121, 'AGENT_LOGIN', '2018-11-20 19:05:53', 'successfully logged in', 0, 'AGENT'),
(1122, 'VRP_GRID', '2018-11-20 19:05:59', 'View Rent Paid', 0, NULL),
(1123, 'SIGN_IN', '2018-11-20 19:10:19', 'accesed home page', 0, NULL),
(1124, 'SIGN_IN', '2018-11-20 19:10:22', 'accesed home page', 0, NULL),
(1125, 'AGENT_LOGIN', '2018-11-20 19:10:31', 'successfully logged in', 0, 'AGENT'),
(1126, 'VRP_GRID', '2018-11-20 19:10:41', 'View Rent Paid', 0, NULL),
(1127, 'SIGN_IN', '2018-11-20 19:15:52', 'accesed home page', 0, NULL),
(1128, 'AGENT_LOGIN', '2018-11-20 19:15:58', 'successfully logged in', 0, 'AGENT'),
(1129, 'VRP_GRID', '2018-11-20 19:16:06', 'View Rent Paid', 0, NULL),
(1130, 'VRP_GRID', '2018-11-20 19:21:19', 'View Rent Paid', 0, NULL),
(1131, 'VRP_GRID', '2018-11-20 19:22:27', 'View Rent Paid', 0, NULL),
(1132, 'VRA_GRID', '2018-11-20 19:23:29', 'View Rent Arrears', 0, NULL),
(1133, 'SIGN_IN', '2018-11-20 19:41:20', 'accesed home page', 0, NULL),
(1134, 'SIGN_IN', '2018-11-20 19:41:22', 'accesed home page', 0, NULL),
(1135, 'AGENT_LOGIN', '2018-11-20 19:41:33', 'successfully logged in', 0, 'AGENT'),
(1136, 'VRP_GRID', '2018-11-20 19:41:44', 'View Rent Paid', 0, NULL),
(1137, 'VRA_GRID', '2018-11-20 19:42:02', 'View Rent Arrears', 0, NULL),
(1138, 'VRA_GRID', '2018-11-20 19:42:20', 'View Rent Arrears', 0, NULL),
(1139, 'RR', '2018-11-20 19:42:56', 'Record Rent', 0, NULL),
(1140, 'RR', '2018-11-20 19:42:56', 'Record Rent', 0, NULL),
(1141, 'IR', '2018-11-20 19:42:57', 'Issue Receipts', 0, NULL),
(1142, 'PR', '2018-11-20 19:42:57', ' View Invoices', 0, NULL),
(1143, 'AUL', '2018-11-20 19:42:57', 'Adding Unit Liabilities', 0, NULL),
(1144, 'VUL', '2018-11-20 19:42:57', 'View Unit Liabilities', 0, NULL),
(1145, 'VUL', '2018-11-20 19:42:57', 'View Unit Liabilities', 0, NULL),
(1146, 'RU', '2018-11-20 19:42:57', 'release unit', 0, NULL),
(1147, 'RR', '2018-11-20 19:43:22', 'Record Rent', 0, NULL),
(1148, 'RR', '2018-11-20 19:43:22', 'Record Rent', 0, NULL),
(1149, 'IR', '2018-11-20 19:43:22', 'Issue Receipts', 0, NULL),
(1150, 'PR', '2018-11-20 19:43:22', ' View Invoices', 0, NULL),
(1151, 'AUL', '2018-11-20 19:43:22', 'Adding Unit Liabilities', 0, NULL),
(1152, 'VUL', '2018-11-20 19:43:22', 'View Unit Liabilities', 0, NULL),
(1153, 'VUL', '2018-11-20 19:43:22', 'View Unit Liabilities', 0, NULL),
(1154, 'RU', '2018-11-20 19:43:22', 'release unit', 0, NULL),
(1155, 'VRA_GRID', '2018-11-20 19:43:54', 'View Rent Arrears', 0, NULL),
(1156, 'VRA', '2018-11-20 19:46:09', 'View Rent Arrears', 0, NULL),
(1157, 'VRA', '2018-11-20 19:47:07', 'View Rent Arrears', 0, NULL),
(1158, 'VC', '2018-11-20 19:51:34', 'View Tenancy Agreement', 0, NULL),
(1159, 'VC_GRID', '2018-11-20 19:51:34', 'View Tenancy Agreement', 0, NULL),
(1160, 'AT', '2018-11-20 19:51:37', 'View TenancyAgreement Form', 0, NULL),
(1161, 'VC', '2018-11-20 19:52:30', 'View Tenancy Agreement', 0, NULL),
(1162, 'VC_GRID', '2018-11-20 19:52:30', 'View Tenancy Agreement', 0, NULL),
(1163, 'VC', '2018-11-20 19:52:33', 'View Tenancy Agreement', 0, NULL),
(1164, 'VC_GRID', '2018-11-20 19:52:33', 'View Tenancy Agreement', 0, NULL),
(1165, 'VC', '2018-11-20 19:52:49', 'View Tenancy Agreement', 0, NULL),
(1166, 'VC', '2018-11-20 19:52:49', 'View Tenancy Agreement', 0, NULL),
(1167, 'VC', '2018-11-20 19:52:53', 'View Tenancy Agreement', 0, NULL),
(1168, 'VC_GRID', '2018-11-20 19:52:53', 'View Tenancy Agreement', 0, NULL),
(1169, 'AT', '2018-11-20 19:52:57', 'View TenancyAgreement Batch Form', 0, NULL),
(1170, 'AT', '2018-11-20 19:52:59', 'View TenancyAgreement Form', 0, NULL),
(1171, 'SIGN_IN', '2018-11-20 19:56:19', 'accesed home page', 0, NULL),
(1172, 'AGENT_LOGIN', '2018-11-20 19:56:24', 'successfully logged in', 0, 'AGENT'),
(1173, 'AT', '2018-11-20 19:56:32', 'View TenancyAgreement Form', 0, NULL),
(1174, 'VC', '2018-11-20 19:56:53', 'View Tenancy Agreement', 0, NULL),
(1175, 'VC_GRID', '2018-11-20 19:56:53', 'View Tenancy Agreement', 0, NULL),
(1176, 'VRA_GRID', '2018-11-20 19:57:16', 'View Rent Arrears', 0, NULL),
(1177, 'SIGN_IN', '2018-11-20 20:16:38', 'accesed home page', 0, NULL),
(1178, 'AGENT_LOGIN', '2018-11-20 20:16:45', 'successfully logged in', 0, 'AGENT'),
(1179, 'VRP', '2018-11-20 20:16:53', 'View Rent Paid', 0, NULL),
(1180, 'VRA', '2018-11-20 20:17:02', 'View Rent Arrears', 0, NULL),
(1181, 'VRPP', '2018-11-20 20:17:07', 'View Rent Prepaid', 0, NULL),
(1182, 'VRA_GRID', '2018-11-20 20:17:11', 'View Rent Arrears', 0, NULL),
(1183, 'VRA_GRID', '2018-11-20 20:17:27', 'View Rent Arrears', 0, NULL),
(1184, 'VRPP_GRID', '2018-11-20 20:18:02', 'View Rent Prepaid', 0, NULL),
(1185, 'VRPP_GRID', '2018-11-20 20:18:17', 'View Rent Prepaid', 0, NULL),
(1186, 'VRP', '2018-11-20 20:18:42', 'View Rent Paid', 0, NULL),
(1187, 'VRP_GRID', '2018-11-20 20:18:50', 'View Rent Paid', 0, NULL),
(1188, 'RU', '2018-11-20 20:21:03', 'release unit', 0, NULL),
(1189, '', '2018-11-20 20:22:45', 'logged out', 0, 'AGENT'),
(1190, 'SIGN_IN', '2018-11-20 20:22:45', 'accesed home page', 0, NULL),
(1191, 'ADMIN_LOGIN', '2018-11-20 20:23:02', 'successfully logged in', 0, 'LANDLORD'),
(1192, 'SIGN_IN', '2018-11-23 09:12:41', 'accesed home page', 0, NULL),
(1193, 'SIGN_IN', '2018-11-23 09:12:50', 'accesed home page', 0, NULL),
(1194, 'AGENT_LOGIN', '2018-11-23 09:13:00', 'successfully logged in', 0, 'AGENT'),
(1195, '', '2018-11-23 10:16:10', 'logged out', 0, NULL),
(1196, 'SIGN_IN', '2018-11-23 10:16:17', 'accesed home page', 0, NULL),
(1197, 'AGENT_LOGIN', '2018-11-23 10:16:34', 'successfully logged in', 0, 'AGENT'),
(1198, 'SIGN_IN', '2018-11-23 11:28:59', 'accesed home page', 0, NULL),
(1199, 'AGENT_LOGIN', '2018-11-23 11:29:06', 'successfully logged in', 0, 'AGENT'),
(1200, 'AT', '2018-11-23 11:29:47', 'View TenancyAgreement Form', 0, NULL),
(1201, 'SIGN_IN', '2018-11-23 11:41:20', 'accesed home page', 0, NULL),
(1202, 'AGENT_LOGIN', '2018-11-23 11:41:33', 'successfully logged in', 0, 'AGENT'),
(1203, 'SIGN_IN', '2018-11-23 11:50:12', 'accesed home page', 0, NULL),
(1204, 'SIGN_IN', '2018-11-23 11:50:23', 'accesed home page', 0, NULL),
(1205, 'AGENT_LOGIN', '2018-11-23 11:50:35', 'successfully logged in', 0, 'AGENT'),
(1206, 'SIGN_IN', '2018-11-23 11:57:18', 'accesed home page', 0, NULL),
(1207, 'SIGN_IN', '2018-11-23 11:57:26', 'accesed home page', 0, NULL),
(1208, 'AGENT_LOGIN', '2018-11-23 11:57:50', 'successfully logged in', 0, 'AGENT'),
(1209, 'SIGN_IN', '2018-11-23 12:03:15', 'accesed home page', 0, NULL),
(1210, 'SIGN_IN', '2018-11-23 12:03:24', 'accesed home page', 0, NULL),
(1211, 'SIGN_IN', '2018-11-23 12:05:09', 'accesed home page', 0, NULL),
(1212, 'SIGN_IN', '2018-11-23 12:05:12', 'accesed home page', 0, NULL),
(1213, 'SIGN_IN', '2018-11-23 12:07:39', 'accesed home page', 0, NULL),
(1214, 'SIGN_IN', '2018-11-23 12:07:44', 'accesed home page', 0, NULL),
(1215, 'AGENT_LOGIN', '2018-11-23 12:07:54', 'successfully logged in', 0, 'AGENT');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agents`
--

CREATE TABLE `tbl_agents` (
  `id` bigint(20) NOT NULL,
  `building` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `postalAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `residentialAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `road` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `agentNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `emailAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_agents`
--

INSERT INTO `tbl_agents` (`id`, `building`, `postalAddress`, `residentialAddress`, `road`, `town`, `zipcode`, `agentNumber`, `emailAddress`, `name`, `phoneNumber`) VALUES
(1, 'Kasa', 'Kasa', 'Kasa', 'Kasa', 'Kasa', '516', '1', 'poze@gmail.com', 'poze', '0723787120'),
(21, 'KIMBO', '82', NULL, 'THIKA ROAD', 'Songhor', '40110', NULL, 'wilfredwilfred67@gmail.com', 'KIMBO PROPERTY MANAGERS', '+2540723787120');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agent_dashboard_items`
--

CREATE TABLE `tbl_agent_dashboard_items` (
  `id` bigint(20) NOT NULL,
  `agentNo` bit(1) NOT NULL,
  `email` bit(1) NOT NULL,
  `name` bit(1) NOT NULL,
  `phone_number` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_agent_dashboard_items`
--

INSERT INTO `tbl_agent_dashboard_items` (`id`, `agentNo`, `email`, `name`, `phone_number`) VALUES
(1, b'1', b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agent_menu`
--

CREATE TABLE `tbl_agent_menu` (
  `id` bigint(20) NOT NULL,
  `add_contract` bit(1) NOT NULL,
  `add_contract_batch` bit(1) NOT NULL,
  `add_service_charge` bit(1) NOT NULL,
  `add_tenant` bit(1) NOT NULL,
  `add_unit` bit(1) NOT NULL,
  `document` bit(1) NOT NULL,
  `issue_receipts` bit(1) NOT NULL,
  `issue_unit` bit(1) NOT NULL,
  `media` bit(1) NOT NULL,
  `personalInfo` bit(1) NOT NULL,
  `print_invoice` bit(1) NOT NULL,
  `record_rent` bit(1) NOT NULL,
  `release_unit` bit(1) NOT NULL,
  `send_notification` bit(1) NOT NULL,
  `upload_receipts` bit(1) NOT NULL,
  `uploadRent` bit(1) NOT NULL,
  `view_contract` bit(1) NOT NULL,
  `view_contract_grid` bit(1) NOT NULL,
  `view_rent_arrears` bit(1) NOT NULL,
  `view_rent_arrears_grid` bit(1) NOT NULL,
  `view_rent_paid` bit(1) NOT NULL,
  `view_rent_paid_grid` bit(1) NOT NULL,
  `view_service_charge` bit(1) NOT NULL,
  `view_service_charge_grid` bit(1) NOT NULL,
  `view_tenant` bit(1) NOT NULL,
  `view_tenant_grid` bit(1) NOT NULL,
  `view_unit` bit(1) NOT NULL,
  `view_unit_grid` bit(1) NOT NULL,
  `view_prepaid_rent` bit(1) NOT NULL,
  `view_prepaid_rent_grid` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_agent_menu`
--

INSERT INTO `tbl_agent_menu` (`id`, `add_contract`, `add_contract_batch`, `add_service_charge`, `add_tenant`, `add_unit`, `document`, `issue_receipts`, `issue_unit`, `media`, `personalInfo`, `print_invoice`, `record_rent`, `release_unit`, `send_notification`, `upload_receipts`, `uploadRent`, `view_contract`, `view_contract_grid`, `view_rent_arrears`, `view_rent_arrears_grid`, `view_rent_paid`, `view_rent_paid_grid`, `view_service_charge`, `view_service_charge_grid`, `view_tenant`, `view_tenant_grid`, `view_unit`, `view_unit_grid`, `view_prepaid_rent`, `view_prepaid_rent_grid`) VALUES
(1, b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agent_rights`
--

CREATE TABLE `tbl_agent_rights` (
  `id` bigint(20) NOT NULL,
  `agentNo` bit(1) DEFAULT NULL,
  `country` bit(1) DEFAULT NULL,
  `emailAddress` bit(1) DEFAULT NULL,
  `name` bit(1) DEFAULT NULL,
  `phoneNumber` bit(1) DEFAULT NULL,
  `postalAddress` bit(1) DEFAULT NULL,
  `town` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_agent_rights`
--

INSERT INTO `tbl_agent_rights` (`id`, `agentNo`, `country`, `emailAddress`, `name`, `phoneNumber`, `postalAddress`, `town`) VALUES
(1, b'1', b'1', b'1', b'1', b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_audit_trails`
--

CREATE TABLE `tbl_audit_trails` (
  `id` bigint(20) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_audit_trails`
--

INSERT INTO `tbl_audit_trails` (`id`, `datetime`, `description`, `profile`, `username`, `version`) VALUES
(1, '2018-10-29 15:19:58', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(2, '2018-10-29 15:27:31', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(3, '2018-11-03 14:19:11', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(4, '2018-11-03 14:21:49', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(5, '2018-11-03 14:35:53', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(6, '2018-11-03 14:36:46', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(7, '2018-11-03 14:38:31', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(8, '2018-11-03 14:39:15', 'UNIT ADDED', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(9, '2018-11-03 14:39:43', 'UNIT ADDED', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(10, '2018-11-03 14:40:25', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(11, '2018-11-03 14:57:23', 'Added Unit Liability ', 'AGENT', 'poze@gmail.com', 0),
(12, '2018-11-08 18:23:02', 'Added Unit Liability ', 'AGENT', 'poze@gmail.com', 0),
(13, '2018-11-08 19:11:30', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(14, '2018-11-08 19:19:31', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(15, '2018-11-09 17:21:59', 'Added TenancyAgreement ', 'AGENT', 'poze@gmail.com', 0),
(16, '2018-11-09 19:30:26', 'Added Rent ', 'AGENT', 'poze@gmail.com', 0),
(17, '2018-11-12 15:12:22', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(18, '2018-11-12 15:42:19', 'Deleted Agent ', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(19, '2018-11-12 16:17:50', 'Deleted Agent ', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(20, '2018-11-12 16:23:06', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(21, '2018-11-12 16:25:54', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(22, '2018-11-12 16:28:39', 'Logged out of the portal', 'ADMINISTRATOR', 'wilfredkim5@gmail.com', 0),
(23, '2018-11-12 16:32:09', 'Accessed User Access Control Panel', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(24, '2018-11-12 16:32:18', 'Accessed setup menu and details', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(25, '2018-11-12 16:32:55', 'Accessed User Access Control Panel', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(26, '2018-11-12 16:38:24', 'Accessed setup menu and details', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(27, '2018-11-12 16:38:32', 'Accessed User Access Control Panel', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(28, '2018-11-12 16:41:37', 'Deleted Agent ', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(29, '2018-11-12 16:57:04', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(30, '2018-11-12 17:10:57', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(31, '2018-11-12 17:11:50', 'Added TenancyAgreement ', 'AGENT', 'poze@gmail.com', 0),
(32, '2018-11-12 17:12:22', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(33, '2018-11-12 17:20:32', 'Added Property', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(34, '2018-11-12 17:23:12', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(35, '2018-11-12 17:45:02', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(36, '2018-11-12 17:47:00', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(37, '2018-11-12 17:50:51', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(38, '2018-11-12 17:51:37', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(39, '2018-11-12 17:51:42', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(40, '2018-11-12 17:52:45', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(41, '2018-11-12 17:58:27', 'UNIT ADDED', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(42, '2018-11-12 18:00:07', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(43, '2018-11-12 20:06:56', 'Edit landlord', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(44, '2018-11-12 20:07:15', 'Deleted Landlord ', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(45, '2018-11-12 20:08:35', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(46, '2018-11-13 09:09:22', 'Accessed User Access Control Panel', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(47, '2018-11-13 09:10:14', 'Accessed setup menu and details', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(48, '2018-11-14 20:14:27', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(49, '2018-11-14 20:14:51', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(50, '2018-11-14 20:14:56', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(51, '2018-11-14 20:14:58', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(52, '2018-11-14 20:15:03', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(53, '2018-11-14 20:15:05', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(54, '2018-11-14 20:15:08', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(55, '2018-11-14 20:16:25', 'Switched between property from property #0 to Property #', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(56, '2018-11-14 20:36:16', 'Switched between property from property #0 to Property #22', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(57, '2018-11-14 20:36:24', 'Switched between property from property #22 to Property #0', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(58, '2018-11-14 20:36:35', 'Logged out of the portal', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(59, '2018-11-20 10:32:52', 'Added Rent ', 'AGENT', 'poze@gmail.com', 0),
(60, '2018-11-20 10:53:08', 'Added Rent ', 'AGENT', 'poze@gmail.com', 0),
(61, '2018-11-20 19:43:17', 'Added Rent ', 'AGENT', 'poze@gmail.com', 0),
(62, '2018-11-20 19:43:40', 'Added Rent ', 'AGENT', 'poze@gmail.com', 0),
(63, '2018-11-20 19:56:47', 'Added TenancyAgreement ', 'AGENT', 'poze@gmail.com', 0),
(64, '2018-11-20 20:22:45', 'Logged out of the portal', 'AGENT', 'poze@gmail.com', 0),
(65, '2018-11-20 20:23:26', 'Accessed setup menu and details', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(66, '2018-11-20 20:23:38', 'Accessed User Access Control Panel', 'LANDLORD', 'kkm.dekut@gmail.com', 0),
(67, '2018-11-23 11:29:17', 'Viewed  editable  Agent personal information', 'AGENT', 'poze@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banners`
--

CREATE TABLE `tbl_banners` (
  `id` bigint(20) NOT NULL,
  `image` longblob,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_banners`
--

INSERT INTO `tbl_banners` (`id`, `image`, `name`, `path`) VALUES
(1, 0xffd8ffe000104a46494600010100000100010000ffdb0084000906071213121513121315161515171717181818181817181818171517171717181a1d1e2820181a251d171621312125292b2e2e2e181f3338332d37282d2e2b010a0a0a0e0d0e1b10101b2d261e252d302d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2dffc000110800ad012303012200021101031101ffc4001b00000105010100000000000000000000000500020304060107ffc4004d100001030104040a07030a0404070000000102031100041221310541517106132232618191a1b1c114234252d1e1f0078292151633436272c2d2e2f1242553a26373a3b2344464748393c3ffc400190100030101010000000000000000000000000103020405ffc400281100020201040201040203000000000000000102111203132151314122046171f0329181c1e1ffda000c03010002110311003f00d70b3af3ba6371a6141198ad42540d476a652a10aaed5f53cf28e37f4fc70ccd4528ab769b31418d5a8d4376ba5493568e77169d3228a51525da5769d888e29454b7695da2c288a29454b14a2958511453db14ebb5d8a4f9435c3240ed38380e750d2a9b82299b0b25a440c053ca79386aa1ecbf19d5d6ad02b9a5168e88c932246153f194f0a069e122b0d9b48a6ea01aa6e314516dd44a6eb519b466504c17e8e69e2c86885ca7258354df6636620d36650d4699768f3567204545e8e52669ad7ec4f457a04453d028a3ccde188aa89b12ab4b553465e934c6048a6b8e0d5561162db4e5e8f1b6b3b91be4d6dca81a6badaa2ac3f678caabd5632c8938e248540d354aa6c572b5466ce834944d28a5400c9a54e8a51408e52a7452a630b36f54e95cd0a2ec655225f5823090521520ed528411f76b81c5a3b54932dda48232aac8b2a54361a77a4ed06926d893848ad2725e04d45f92938c9069972aebae0db50122acb55917a4886ed722a656fa736cc9c7015b5a9d987a7d15e2945144d851ef4eea81cb3006051bd10d991462bb15654c5354d53dc42db64114a29f15dbb5bb314350d485e31750b50de949227a282d9b4e1bb79c694233b9eb00e98c151d55a06c721eff0092e7fdb592d16f42967181009891ae77567cd8fa0fd974cb4a3097537b3ba4c2bf098344936a3ae8068bb38bfca00dce613aa70f0f3a3094c6559708bf4696a497b2ea2d335c5bd155426a44d9d47554de9c57b2ab524fd0f0fd4a9b55266c822555c754ca4729494ef501e26a4d47d1b4e5ecb08b4d482d02842add671fae49dc6f78555b46966064a57e050f102928aecd64fa3405e1b699e902b32bd329d4951fc23f8aa356993a9bed511e0934631ec32974698bd8d714fd658e975ea4a076abcc5315a4ddda07dd8f19a5f11dcba34cebc2a9295408db5c3ed9ea29f80a617547352bacafc8c56a335133283907caa9aa7d0335246f20567a06b83bc83e23cea4408c87711e15bdf7d18d8fb867d35af7c1dd8f8526adada9770137ae95410460081388da682b8fa520a94704893af0eb15947adced9f49d95e77043c2ec641295aae107a532d1344759b7c8a5a292e0f4e8a514e8a515d0406c52a7c52a0069455919c7fc3478acf9d42a0693ab8511fb081fec9f3a86a725f4f8255b8200c71cb1d9515dc24c6df9d47ed46b824760e9df58de1e69f52529b23125e7b9240cc02600de7c2a7e0a3e7846a2c1a5ecaf6087913b15293d57a268a9b3619d799dbb830bb1b0d282ca8400e6382564e630e6eac75c6dc2b5974b3cde08715ba67b81fe1ac2d4be4d38570cf4e2a03554a97c6cac159b85eea79e94abb8f978515b370b193cf0a46fcbbe2a994598a923588b50a93d2074505b3e92697cd713b898f1abc94569422fc19736bc922d7b2a32a269d14aed514518736c8c0a5152452bb5bb274416c5ddb3da55b1873b48005642c0980a1aa2098c8e64ceac63b2b61a4d1fe16d1b38b8ed5a6b29a3192a90125467541204e2723445f91b5e035a055295039a4dd3d5314489a19c1804a15b671fbb03ce8b29ba1be4490e6dc8d555748e98e2c40e71cba3a4fc2a9695d221be4a7156bcc84fceb3ca7271273da7e22b9751abe0ea85d132d4544951249c71e567e14d040d83b8d453d7d5f0aedff00ac7cea4509af4ed3d8aae5efac4544573f49ae856feffed40125efac0d7663a3f10a84afe8fcc520afac3c8d004d7fea41f1ae857d41f2a86f9e9eff0081a695fd61f014013973e8fcc52bfd7f5d06a00e7d4ff5576f7d7d0340162f1e9eff00306b97f7777caa09fa8f90a6bd6ce2d37c4920809035a8e091cedbe74013a525d752d09b8885bbb09cdb4667f78f5557fb4bd17c65938c4f399505619dd3c957660afbb45f4258cb68e5195a8952d5aca95893e5d546c5912e36b42c4a5695208da14083dc6a6e5c9b51e0a5c1ad21e936565ed6a40bdfbe9e4aff00dc0d12bb588fb2f754d1b5589ce732e150e904dc54744a41fbf5bd09272aef8c935670ca34e88e29511468d247380a546e47b1edcba29a962aa3e65e2354367fe926a72cf5555b660b5ab520a2f748e251522b644ebc78c448891e235c7ce80707b41cdbad16c787eb568641d809495475103af6d176932bbc3aba86e1465b223ea2a3f50e9516d05cd9db43095a54858052a0411198398af2bd33a3976770b6a9838a09c6f26771123238788af52784ec0367d65437849a2d36968a6616394856c574f41c8ff6ae784e9969c6d1e64956a1ddf23e54a63a3bbf9698e050252b041492140e3046ac411df492ad9ddf23e55d0409018c72eefe5f1abb65d28f37cc7143bc7c3be874c74777f29a703f5f383e3401a6b270c5e1ce4a5636e47bb0efa33a3b85a871610b471608e713803b0e1037cd645b48007c719d7acd252e049c85694e465c227a39d26c7facdfe215d3a56cc9e73a93ba4f8579159b4b170a8a704830094c856e23e756d36cda91d460f62a2b4f51995a691e9b6ed32cbb66b421b5490d83cd5018b8848c48da4500d02e238b754a2420409c40244ef9cf58d942f4439798b5e63d5b4323adf6f2d5457461484c0c1b4265445f1249ba100a549bc4c9273caada4fe2ff0024b57f92fc0ed1ba5d3674a2f5e24a66044c1322648d400a9ad5c25be93c585249d6abbdd063afe866ed9692a7d730026131030ba4e041e93dd4976e40cdc40dea48fe2ac6b36a46b469c4b1787477791aede3d3dff3a1ead2ac0cde6ff1a7e7512b4e5987eb91d58f826a05c27f5abcc0ae8574f7fc15418f092ca3f584ee4afe151ab85367d4567eeabccd200e2c48893d44f8e34929811e38f7914015c2a67536e9fba9f334c3c291ecd9dd3bee8f2a2d0e99a5bdf5f4695ffafa26b32784ae9caccaeb51f214bf2ddace5661d65469648316697abbbfa6913bfbc7c2b3a2d5a4540916748023d851cf01aea4459f4a9c9b48dcdfc68c90f161d2bfa9feaa57b7777ce82b5a334a2c801424ea01029ff9b5a595edaba8a4527348145b0c27767f5eed36c038d742e096da3753990a5e4a5c6c1cdeda0d67e0a5b56c25f53ebbaa095001464a551aa7a6b61a2ac81b6d281ec803e749cd3f035077c85184e428bb6204551b0235d5f3583679f69eff0007a62cf69c9bb48e2d7fbc61067fe89ea35e8cd0e8ac67da768ee3ac4a239cd10e277006ff00626f1fba2b41c16d3a2d16565e244a902f742d3c958fc40d7469c9e34427159587d0f18a555c5b53b6953110a1f141749384baeb63da50070c806918f6d13520c6ba95f02fa846bdf8c551f1ca309df0c0f65b3942120e60003abccf9d5e5b884605490635903aeb81d1afbaa86974488e394c82a6c15052d048e2ed384a04eb9c6072775714a7b8d23ad476d597cbe9392d377a089a9137488d586daca69351f4ad21fe32ec591fe4faff0055ea2c9eb304c61255c924facc31bd05b832bf503d617796ef2f97febb9c9e58070e6f5618529c315638cedd01786da0b036868414fe90039a7dfc0e635f46eac55eece9fea1e75ec4b5edd991fac6bccb847a20d9dc91fa3709bb13c93ad1877746e35ad29fa33a91ae416956ceefe95795381fafee9f3a88ab6f791fc49a7b6a123e5e47caac4c2d386bdbb68169871c71618485241e728a48c0671b731dbd866c802940ae423a1333ba28d68f75a72d6ca10801290b9948c4dc241233c201a04665b61096c24488c00d51b77ce3541fd2086b92e2a36405191b70f857a7356cb3a6cc177f00f349519789254c13741280a00e0a8cb0c71af3cfb49295be829c52a6da50ccf39868ebc4933af1aca34dd8478396a4bd67b6a5ac42536726207243e16a8c01e6a15aaa771d5a84252b8190098037674beca6c0a6cba5422f3d60006eb428d1e61d02c96b2ab53e404b1ca281793fe2958a65ec67049c46035e5548ea4a2a9139422ddb0268ee0d7a571adb97da480856449592559e030c3beafd9feccacbed297dc2b45c1f5a48494a8afd566ae4a8916ab48c8294303867aa8dc639477d736b6a49cb967469422a3c23ce9be03b01f4321a52c1e26f2ef45d0f13ecc6311b71e8a1fa3f475954e5ad1e8e98b3336c701bc7946cab4a40386015327657a6d956be3c008444596491cac73c6318d5945653462ed5c6dbcfa3a529f47d205b29b2b62fa83a0378dcf597a15c932151883558a4d126dd94b81da26cb6a6dc52ece81754d81055edb2870ebdaa8eaad533c15b20cace981d1386faa5c0872d05a70da10526f3576594b320d9db2ac1284cf289dd961115a05c911788138dd81786b4990703ae20f4d427591787f12ab1a02cd20710882a4fb2351acae82d1f6be39ae35b0117cde90d0e48098c0639ce55bbb2a85e1d0a07a0566f43701430e36e1b42145b595c06c899481766f619675ad36a998d44ed0714da06a1d94e1070823a4453d446f34c4ab19833bfe1512c496348bc9189e5a338f785633813a2de46906d4e144072d5fae694a853602612165475e1186b8adbd8c7292755e49ec5565f823c0bb459ada8b438b62e25db4ac84ac9543c801385d0270c71edab697825a8b902f00346dcb5364bb675432f0ba87da714796a320214640d67556f09e8ebebdb598e097015db23e879c79950436ea2ea14a24f184919a46dad32d38e1b696abe47a6807a293fe5ecc413c5b59939f230f953d4c42a3b29ba20ff0097b3063d535a8e709a28a4e4758a51f6367596e040a92980d76f568c9cb434169525588502923682208aca7d9d68c7ece87d8790a0da5cbcd2951ca0a90a81981c94abef9ad6d6734e70916cba5b6d2821294c95051378c9230311053da6aba4e9d92d457c1a6e286ca558b1c2eb47b8d7e15fc6955f3891c18195c3cb48041283f7662371cabd1c5b9b5b8e80ae536b2850d731846daf07b895188031c4c74f4e75b07d7fe78b8c26d2a9e98918572a9b4997c536bf7a3d0ba808ae28a09f58ca9788221494804058f7a4e0b231a695ecf9efa72636d73a74ce96ad10bf64b22d6f38ab22ca9f429b74f187948525b4a8405f264368ca32e9a7d9994245c69b2d2012402abd8a94a5ab1249c4927ae9e1c02a3b55ad2d214e2d412948924f96d3aa29b94a5c09452e456ad22db225c584098055af0c6875addb2dad0a6438951395d2094ab5287488af24e14f09ddb5be4a6528008427546627a49026afe8cb6bac9439041227a14018913d22a8b4ebdf2633bfc135a985b4b536b042926335411a88e835cb31255b606ff206b4fa7d2ddaecbe94830e3299574a4660c7591f3ac859edad8995a474124f8d5a32b449aa65feaabfa1ed7c4ba97441299c1492a499041900a7513ae837e53675b88faeaaefe56633e353f5d54c46d4f0a3937059acb7642a388317922ea4c7199818567f4a943cf079400200094a537509ba94a44264e41223650bfcb567ff00553dff000ae0d3567d6e8eff0085006cb415a78bb3da1c4e6872caa180cd2b708ef152fe76ac02021a008130d3401832011771c71a11a3f4c31e816a5a562ea5db3051c73571b1aab3e74e59ff00d41df401e97c1bd24a7d6ea947108424404240179c564919ca95476f9e89e9c3cb0af3ce0f6932d05280490e04f3c2a604e4331335a14f09d11040e982a8ef1509c1b765a124951a645bdf0201480040d78760a5e9effbe9ecfeaacc9e1527ddc379f8530709c4e08111b5471a58cff58f289a653ceacf2d4081fb27cd47c29048d647503f1acc2f85070e4a7fddf1ae9e149d494f613fc54b6e419a344eb60c4c1edf0a8bd15b3ec27f083d7400f09cfba3b3b3daa8ff003957a923f08f8d1b4c7b88d5a52123924440c06aae873a6b27f9cae6cee156383fc212f3ea68c7250547019c81186fa4f4da560a69b344a3b091b8e74c2dfed2e7f7d5e469cb56bd749663323aab06c5c5e18a95d4b5fc6badace42766baeeace928e5272fadb4002344e3a3d8cff44d4993b138d15a0da1cff97b37a3f44d6a99109a2a57548fb26c929a554c2ba894bad087daed696d054ac8027ce074d79cbee95294a3895124e1b4c9d7956938616b1c5a5bccacc9dc9c7c63b0d64feb555224e44c0fd7d1a550dfe8f0a55b32534f06f949095a79c3020fbdd7465ed1eb1a68ba4724da1c5483aa5431c33c72a5645a4b8817a0df4891120927aa8a29dff1d989f4858dfca5635c4a72ae7f7c9daf4e392afbff00a3548db89e98fac2a82b4881c69503ea1a2eac8681000652e94a4970124a550240920d7576b24a149d4a295a72ea8ec8e83d340ad1a713c55a21a490e377312b17bfc2a52abf0b000ba17cd20e00c4d5214fc90d46d2e022ef09da4b6d390e10ea9d40869320b4a425455eb7225623aeac9b632fbb68b22d2561b2a4392809412952460438559a846032396bc6da2d8da6cf6774d9dbb85eb4245e5bf701bcd117007a64e24cce422b4ba0f4834f5b2d8a650d94971478c4170972569838aca71fd9032adb8a51b466326da4ff007c18fd35c100dda825b078b521e75264e172096ccc83122368241ca684db12dadd3674a16959738a0ab8c245e0e5c04dc1376738efc2bd7adec5e4294462942c03ac4a60d79486bfcc27ff0059b3fe3ce7e544394db09f0d24697ecd59badda5b295027120c9c25c45d2600241428618615358f827664d994e06d2a5a9951856201293881a8d59d37c27458dc4d9d367bc5c495cdf09482b5ae4924189549926395404708de002436d5d0d29b82f2712a29e565a82600cf1358c24dda46f28a469dcb3d899b3879cb334400d08436826561464cc08e477d0c5708b4624c1b2104ea2cb20f65ea1aff09556840b1a9abb290b0e05df1ea19755762e8c4efc2b3f355869aae494e7f2e3c1b0fcead1804fa298063f44cfc69ff9d9a3a48f453204c716d65db58c269d184d69c228ce723d0ecdc24b11b1bae86086c3cd208badf29452e5dc32c31cf6d0e76df67b5a4b167694cb8b0ab8e29b6eeca4151075949bb0628430e11a3dd1755cab435cac205d6d700e3326f6103d93961353415acb6e87009286de5004e06eb0e103ba87155686a4ef92b69ab1db582a1c7a57748061bbb8904eb13abbe85b169b5a9494dfc54a00618492009e8af4ed15c55b0ad4e0065a617991121609c3a411d5579be0dd982a43591041bca904191aea1b8cb608c6b9c0ed229e75a984e7179694cc120917a0c4838d456be09692437c67a436a4fec9070db2308ebad8f0cad1a450e37e84871482cbd78a5ae305f0a78a01374c19230d7569976d4bd1a14f2562d4597b92517557e5cb82e467826046354e6913ecf28798b6a737bb20f955072d96a19babeeaf43e0c582dafda5bf4d65c082cb856a537c5f2ef2c264848c60268cdb381f675a148baa4956b0a548efc694a4e3e4d4559e469b4da8feb5752172d033b49918667e15eb6ae0cd940580de495632ad9beb3da5b8228e395714400eaaf4c736558270ce633e9ade95cec9eb4969d1e7eeda6d008f5ab32626f1addfd9a5997c63ae1c25294ed3ce9f2aabc2ad0ad32d58ee0c54f1492732394776ad55bfd1162434d8b89bb201399c63a6a7a8fd15d3e5584d6f84a4a8c5d482a5294a090902049277d56b169265d55d696c2d574ae12ea09b833540f67a6a7b4b17d87539de6d431207b68cc9c2b1bc02d04fb56c0a5a4048b2ba89e31a5728a890212b272e88a508268252699a7b2e9cb3b8a4a5b7acca52d575012f0254ac304c271388ed1575c89ecaf2fe07f072d4dda6c4a5369011682a57ad64c248684c05927238093857a65b5abd29bc5331ca181075114a7148d41b609d0814347b3cefd1371cd195dc28950dd0c4fe4f68c824b4d9c547384d14bb447d832152a82bba5545f5b612a09426f2a402230c88da48315239a65b0540de17491948307a2a85aed295b56a2d281721045d50bd0201c33fa8a134c1c5af26534a70812fba54dca931c92793c94824e0461ed1ebaa48d34d8e7483ba7be2ac3b60f444c04a1e42d37813c9580049c24f240d58e314085854f152d22133a86538ddea04576bda5055e4e28ee66f2f018fcbed7bc7f09a54053634c738f60f8d2ac7c4af268b42db50a7dac4ca9e408255adc3d3d22a6b4e9408d20e2946426d0a2312327572057745e8c521d6d61a714a4b89501746242c1024139e54cd236005d52c8702dc5ad7738a528a615248d79a86a8c8ebae4f4cb373b5ff0007e98d344ab905408311385dc4c4889ebaab62d24f16d68428809292311289bc0dcbc49c89186aedaaefd9b19515260cf29a58edc2aa2594630e819ea5e3dd4bd7014df93776db0b76b6db429c8434645d6f3227130ae513794779c73ab9c19e2ecad965b74a92ebca58f52ae700061d1091db58fb29b3dde53aadc0013ab6e199ab2cb76401326f4de50f5ab1742946248501384c0342cbdbe0d63cf837568b7025690a93c5a89010a39811dc4d79cdb9d4b6fad502ff00a4ad6146fe012e9331967b41c8d5855a96820b0b484dc0830ace024442893181e9aa7694bae28a8c2966f6b19aa64c444f4d3524b8312be3824e1f693ff12cbada94029802524a4c71abd7bd355347d91f76ceeda52a70b4d49502e2d255c5a52494c2a0dd0a49824740315634d68e0e8649994357550723c638ac70d84554468d750da9b05f4b4ee252144257185e2325651fdaacb562912927c91685d225db52072a03768e738e2f1366771e5a951d5b6adda5294ad49190240c413db02a5d03a35a42e78b5df0876145780f50e822ee46647674d2b4beddf51209c4e329f81a7bb1f226560ac63e152ad50998d4462738d47b6a3e35bbd824c40d52671d613bbb3b13c5241ba351cc4e10632031e9a9ce6a5f80887da11a35ccf1b5b7dbc4b87aab396851ba606a24c90040131bf0c2b44d5dfc9ab84e1e989f67630ac7a73ce802994ad4906ea319950e49fd9c088eed74dce2a141572369f67b6d0b53eb4a0001b6501098c2ef19b4ce249aa2fe9cd20dda929700095389045d05176f4724c5eca7a76d0ed17a496c879d60245eba15048c05e8ba270032eb1446c1a652ebcd8750da8cf254a717ce91008023a644011515c9d3e7d973ed2745bcfda2ce596d6a02cf69413717014be3824131862451e5d892c68cf46415afd4be944a157957b8c201119f280a2be9cea4101488c700fbbf0aa6fbee7a85149bc2221c51c6e81aea99ae0ce0f9309f6716775ab7d9cb8cb894fa3ba92a285001456e9009881abb68bdabed11b4718459d678b5941e58c4837646196fad1daf4f3f78377941460c7aa384f48acce9bd0c84c04a9f497093ce49c4c1c2ee5ae9e707e43192f06b98b7b6b6ca811ca42b00671ba491d507b284db2d054f38024a805af111ef9033235576c42e3572660b99b4b39b6b39e1b683dbed81b5ba61065c5669bb1ca56304d53e9da59321f549cb1473879fa3b0ff00ee0f82ab6761078b4e51753e02bce56a36c4b0c85369532b75e5152880a426e08100e24acc01ee9adf68f24b69005e0120725c51cb03b35d4351dbb3a349546826fb256cba94824a9b5001324f3939566f81da21e16c53ae59dc6c258e2924a0a41038dd640c4c20f6517f4b750b4dc0b4ca55ee9f691b574ad9a7dd684b8b5a448c6e0204edbb35a8cd45722941b7679d706f8376969fd16a3667c7ad0b7496560225c6f1598e47252338cabd49d3cacb650c5f08ad04254daaf02159a1c8380d899a03a3b4fab8d70a9492544280c52988c422f286a83965599c93f06a11af217d047fcb998c2596a7039c268c38b8207fc073ff00d31eeac85834d21363b335812a6d904de3873338c3291d553e9dd3686dcbab44cb6507972314ac88119e2284e85200da0937ceb2a57fdc33aa761b596d4b384948bd19e0446270ce0f554b6b7f054030a2a898c01033dc48a18cda45e24024463190c64ce2011ae31d553894d49fa0edb5f6d4bb97411c5a862042444ebd6607caa22eb6d30e25300ba5a09172ec5d8519c713248eca10d3b78a9445e804241c202418cbafe8d3f4bf24372230c41e70d8b380e9f0d55a764e5fc42f620cad0954241231e48cc60695644da1b18607bbbb552aed8fd5524a8f31fd25bbbfdfec2160b606dd6dc89b8b4ae3113754151961953ed96b26e38094de53c70270928313d7dd5542c6c3dbf2ae2dc040107098cb5c4f8571ed4d7a3b23c13af48ac882e2a365e3f1a8d9b5a9b51285039e3c98cceddf51de4f4f581f1a742768ec3f0a584d7a33f22db7a5de8e6a1599c5283af7575cd206f83c536a25b4c8527010a5f3632aa6109e8f0f1a73889220a70484f386a24ce7d34aa46d49d3b2d7a524937aced907a5423002041cb0efa6a8307ff2e06e59f31507a31da7ab1ae9688f7bb2b2dc8ce522ebb65612112873969bdc950c394a4c658f369aef14569054f2521a4810ac79ebcf1138465b2a1b53b783604f21174c819de51f03515a558a083ec0075e214a3d59d37266d4dd30859ac8c951879f9295183aeea09126f1d95126cc89916a50dedff7aa8c3cb4994c6447e2041f1a6c2febfb51970677a4111a349c536a68fef248fe1ab09d16b69b7153675a961084c26f44ac031eee073a0f07a7b6ad595ce43b8910949cf62d3963429b46e1a993a61c5e88b60b373585278dfd18044a823f49378098e4eda16597db20aaca831d0a23c08aeb7c21792d0682884df2e5e378aa4a426ec991775c6da91be11bc3db49de91e514dca21babf522b2edbeb43be8ed85a45dc164023106f222eab3398f0156ecba6821417e88d923230831fbb3013d5532384648e5b6dafabe33519d24c2b9f664fdd377c00a32fb8f717dbfa093bc271c47186cf8974b785d802e5f2602b1cfbaa9fe7424dd960f272948e8ce15d1549d5b24a212b435795780378debb8113d5df532acb65393cb1bd13e02965d1a736ba2c3dc21b3a94959b3242d1910dac751856396b9ab0be13b0e5d2b48050653c97c474e0aa1e7453679b686fef029f3a67e475ea5b2afdd70798a2d8b725d041ce123461297ae8924e0a19a4a73503ef7754de9d6778dc36904ad4312a6c633338a2841d0b68d4dcee524f81ae3160750b4a94dac41cca4c0eba6a6d064df18852cad5910a90fc9bae2654a4110e14124081fe98ed356b47250857fe252a4dd50bbc5239ca9320ded471c66b2a6cf224a4c1c64a70c7a75d42584ec4f60a4e60f562b8a66c2c36169282d2ed4b529c4a80582a494e283c980a2301b6abe98d02a0c21b6de2f5d338accc1f645e88119675974d993390ea315206a0e1786e27e349cec5bb07c7217d1ba36dcd10704c2578a56ca8f2824118a8990075c6eaad64d11692f2572a0a0a18604e2ad80633b3a6aa24ac64e38372943c0d5cd1d6a521d42d4ebd09209e59380df4d4958f38fab2b3b64b436596dc4285d09c0a09ba4117861811abaea1d296d59e35b2d20a9c5c85c414caa45d27562441db356cdbddbc54879cc4989ba709319a4d717a4ad04471ebbb848213b64ea185574f563176d5999e0f8cabfc0fd3d625b2b872e728480850509989c3007e541026708c8e267248c49f1e9a34bd29689fd203b2529a62f4e3c0e25beb4e395613e8adc65ecad6264baa284c9375574618c1c201387d6fa5a6546e5d5826e28e2abb8294123548f6355586b4e3b8dd6d939cf233e8cea35692524254e59db5df0542f82a290165318cddc413033a1306a2d558216c34e12b2552a3260409d7aa9516b3f0bae24250c36948c85dcb5eca55bf97dc582ed06ff00345079af2bad20f84573f3297ecbe9eb491fc546548ae846fedaae4cc62800be055a064a68f5ac7f0d57778236b1ec20ee50ee98ad5256b1ed2bb4d3c5a5c1ed9f1f1a3362c11897383b6b1fa857514abc15559cd12fa7361cfc0a3e02bd105b5df7a778152a748b9ac27b29e6c303cb5c61439c850de923c6a3046d8af59fca8ad680777f6a897696959b43b01f1146e0607974fed98de6ba1c56d277c1f1af4772c365566c237dc00f70a817a0ec4acda1d4569f08a3242c59e7fc62ba3b13f0ae870ec1df5b95705ec67294fdf27c4d42ae063279aeafb8ff000d1f0e83166378f3ee8eff008d3c5ab6a77e3f2ad439c07c707fb53f31502f810f7b2e3677c8f234b1d362a66783e8f763b0fc2ba1f47ed760fe6a38e7022d83d841dca3e62a9bdc17b627364fe24f84d1b70157d8a3c620eb03783f0348ad3ef0ec23c454abd0d684e6c39d4827c26aab96458e736b4ef4a93e2296cc054ba27519484850e75e196c8db4f4b47a4ee20f85518035d76e8db4b610dd32ff0016ad8aecf95322aa84c654fe3143251ed359d8fb8b145a4950c8c6ea998b42e402b3138e263af1a1fc6abde9de67b8d2e3d5d1f847c296c3ec7154ecbf66d26fa520256a0000009c06e9a9ff002bbfad73bee9f114292fab603d51e11527a4119a47fbbe2696cc81df65e5e9270f3803f71a3e54e3a4b6b28eb6d1e5143b8ffd93dbf2a707c6c23ac1f18a5b5317cbb2fa6dc8d6cb7f8543c0d32d5686ca5403490483065781dc4c1dc6aa8793b55d83f9a971893afb411e134b6e7d0e39264f63b4321090a6e48107d611276c6aa914ed9ce4dabffb7fa6a9a0363589e90af314e52507dd3d6078d2719740f2b26b4968a7908583ff003011ff006e354ddb84f315b305272de467115325949caef514fc69ebb27ecabaa7ca972bd0ae4bd1005a7dd767f791fcb4f0b46c77f123f969ca623de1bfe74d07a7c2958b27d169219d8ff6b7f0ae540276f852a5616fa36c0d2bdd15085d382aba8e8250aae822a2bd4b8ca0096bb151cf45381a00eddaec74d29aedea00e75d76ba155d068039db4a053e2b976801206ceec29e0af6abb49a6c45726802ca6dce8c967b13f0a46dee6b5031b67c8d568ae9474d0058f4d56c9dc7e20d7536d3b3c0fc2a92d35c481fdb0a405d53cdab3476807ccd575d8ec8acd96a7f731edbb5c9a704d30a457774258559b291b9453e62a35704ec6ae6858fdd593e3356c8a45bddd945b162818e70258d4e3a37ddf80f1aaaef01c7b168ed4fce8d8c31186ec2a40e2bde57e23f1a7931628cb3bc0c78735c41de143c26a05f046d435b67728f9815b10fafdeed00f88a905a57d1d9f08a79b0c11827383b6b4e6d4ee5223c6a25688b4812595e1b05ef09af4036c2350ea91e66a4674a19e6f69f95198607983ac2d3ce6d49de923caa25bc36457b0b0e8572aee3967563d1db5739b49de01f2a798b0678aa5435c77d2915ec0f707ac8a38d9dadf7120f70aace7036c4afd481b94a1e069e6858b3c98eff002a75cdd5e98ef00ec872be318c147ce6abbdf676c6a75d13fba7ca8c90a99e7c1c50f6cf69ae26d2b1ed2bb4f8655b977ece9204a6d0aeb403e0a142ad7c0e28fd7cff00f1c7f153b4c5c99ef4b5f47e14fc295103a0bfe27fb7faa951510c8fffd9, 'slide', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bulk_tenants`
--

CREATE TABLE `tbl_bulk_tenants` (
  `id` bigint(20) NOT NULL,
  `dateJoined` datetime DEFAULT NULL,
  `emailAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tenantNo` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_commissions`
--

CREATE TABLE `tbl_commissions` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `arrears` decimal(19,2) DEFAULT NULL,
  `datePaid` datetime DEFAULT NULL,
  `deductions` decimal(19,2) DEFAULT NULL,
  `excessAmount` decimal(19,2) DEFAULT NULL,
  `receiptNo` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `id` bigint(20) NOT NULL,
  `city` varchar(255) COLLATE utf8_bin NOT NULL,
  `fax` varchar(255) COLLATE utf8_bin NOT NULL,
  `geolocation` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `streetAddress` varchar(255) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(255) COLLATE utf8_bin NOT NULL,
  `country_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_config`
--

CREATE TABLE `tbl_config` (
  `id` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8_bin NOT NULL,
  `companyName` varchar(255) COLLATE utf8_bin NOT NULL,
  `emailAddress` varchar(255) COLLATE utf8_bin NOT NULL,
  `fax` varchar(255) COLLATE utf8_bin NOT NULL,
  `streetAddress` varchar(255) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact_categories`
--

CREATE TABLE `tbl_contact_categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content`
--

CREATE TABLE `tbl_content` (
  `id` bigint(20) NOT NULL,
  `page` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `publish` bit(1) NOT NULL,
  `text` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_countries`
--

CREATE TABLE `tbl_countries` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currencies`
--

CREATE TABLE `tbl_currencies` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `countryName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_emails`
--

CREATE TABLE `tbl_emails` (
  `id` bigint(20) NOT NULL,
  `crmEmail` varchar(255) COLLATE utf8_bin NOT NULL,
  `crmEmailActive` bit(1) NOT NULL,
  `defaultEmail` varchar(255) COLLATE utf8_bin NOT NULL,
  `defaultEmailActive` bit(1) NOT NULL,
  `marketingEmail` varchar(255) COLLATE utf8_bin NOT NULL,
  `marketingEmailActive` bit(1) NOT NULL,
  `sendWhatifEmail` bit(1) NOT NULL,
  `supportEmail` varchar(255) COLLATE utf8_bin NOT NULL,
  `supportEmailActive` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_emails`
--

INSERT INTO `tbl_emails` (`id`, `crmEmail`, `crmEmailActive`, `defaultEmail`, `defaultEmailActive`, `marketingEmail`, `marketingEmailActive`, `sendWhatifEmail`, `supportEmail`, `supportEmailActive`) VALUES
(1, '', b'0', 'wilfredkim5@gmail.com', b'0', '', b'0', b'0', '', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq_content`
--

CREATE TABLE `tbl_faq_content` (
  `id` bigint(20) NOT NULL,
  `publish` bit(1) NOT NULL,
  `text` text COLLATE utf8_bin,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genders`
--

CREATE TABLE `tbl_genders` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_genders`
--

INSERT INTO `tbl_genders` (`id`, `name`) VALUES
(1, 'MALE'),
(2, 'FEMALE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_help`
--

CREATE TABLE `tbl_help` (
  `id` bigint(20) NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `page` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_landlords`
--

CREATE TABLE `tbl_landlords` (
  `id` bigint(20) NOT NULL,
  `building` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `postalAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `residentialAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `road` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `emailAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `othernames` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `agent_id` bigint(20) DEFAULT NULL,
  `gender_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_landlords`
--

INSERT INTO `tbl_landlords` (`id`, `building`, `postalAddress`, `residentialAddress`, `road`, `town`, `zipcode`, `emailAddress`, `firstname`, `idNumber`, `othernames`, `phoneNumber`, `surname`, `agent_id`, `gender_id`) VALUES
(24, 'Kenya', '82', NULL, 'thika', 'Songhor', '40110', 'willypoze5@gmail.com', 'MUNENE', '32288142', 'POZE', '+2540723787120', 'TIMBO', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_landlord_menu`
--

CREATE TABLE `tbl_landlord_menu` (
  `id` bigint(20) NOT NULL,
  `add_agent` bit(1) NOT NULL,
  `add_currency` bit(1) NOT NULL,
  `add_property` bit(1) NOT NULL,
  `add_rent` bit(1) NOT NULL,
  `add_units` bit(1) NOT NULL,
  `agent_access` bit(1) NOT NULL,
  `landlord_permission` bit(1) NOT NULL,
  `set_commission` bit(1) NOT NULL,
  `view_agent` bit(1) NOT NULL,
  `view_audit_trail` bit(1) NOT NULL,
  `view_commission` bit(1) NOT NULL,
  `view_deduction` bit(1) NOT NULL,
  `view_property` bit(1) NOT NULL,
  `view_receipts` bit(1) NOT NULL,
  `view_rent` bit(1) NOT NULL,
  `view_rent_arrears` bit(1) NOT NULL,
  `view_paid_rent` bit(1) NOT NULL,
  `view_tenants` bit(1) NOT NULL,
  `view_units` bit(1) NOT NULL,
  `view_users` bit(1) NOT NULL,
  `profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logo`
--

CREATE TABLE `tbl_logo` (
  `id` bigint(20) NOT NULL,
  `image` longblob,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_media`
--

CREATE TABLE `tbl_media` (
  `id` bigint(20) NOT NULL,
  `access` varchar(255) COLLATE utf8_bin NOT NULL,
  `administrator` bit(1) NOT NULL,
  `agent` bit(1) NOT NULL,
  `benefitId` bigint(20) DEFAULT NULL,
  `cre` bit(1) NOT NULL,
  `created` datetime DEFAULT NULL,
  `crm` bit(1) NOT NULL,
  `custodian` bit(1) NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `file` longblob,
  `fundManager` bit(1) NOT NULL,
  `member` bit(1) NOT NULL,
  `memberId` bigint(20) NOT NULL,
  `memberNo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pensioner` bit(1) NOT NULL,
  `scheme` varchar(255) COLLATE utf8_bin NOT NULL,
  `sponsor` bit(1) NOT NULL,
  `trustee` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_months`
--

CREATE TABLE `tbl_months` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_months`
--

INSERT INTO `tbl_months` (`id`, `name`) VALUES
(1, 'JAN'),
(2, 'FEB');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `id` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `details` varchar(255) COLLATE utf8_bin NOT NULL,
  `target` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_password_policy`
--

CREATE TABLE `tbl_password_policy` (
  `id` bigint(20) NOT NULL,
  `expiry_days` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `lock_after_count_of` int(11) NOT NULL,
  `lowercase` bit(1) NOT NULL,
  `numbers` bit(1) NOT NULL,
  `password_reuse` bit(1) NOT NULL,
  `uppercase` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_password_policy`
--

INSERT INTO `tbl_password_policy` (`id`, `expiry_days`, `length`, `lock_after_count_of`, `lowercase`, `numbers`, `password_reuse`, `uppercase`) VALUES
(1, 30, 6, 3, b'0', b'0', b'0', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permissions`
--

CREATE TABLE `tbl_permissions` (
  `id` bigint(20) NOT NULL,
  `add_property` bit(1) NOT NULL,
  `add_unit` bit(1) NOT NULL,
  `admin_dashboard_items` bit(1) NOT NULL,
  `agent_dashboard_items` bit(1) NOT NULL,
  `agent_edit_permissions` bit(1) NOT NULL,
  `agent_menu_config` bit(1) NOT NULL,
  `audit_trail` bit(1) NOT NULL,
  `client_names` bit(1) NOT NULL,
  `client_setup_config` bit(1) NOT NULL,
  `commissions` bit(1) NOT NULL,
  `content` bit(1) NOT NULL,
  `content_help` bit(1) NOT NULL,
  `content_page` bit(1) NOT NULL,
  `db_menu` bit(1) NOT NULL,
  `deductions` bit(1) NOT NULL,
  `document` bit(1) NOT NULL,
  `enable_acc_recovery` bit(1) NOT NULL,
  `faq_page` bit(1) NOT NULL,
  `invoices` bit(1) NOT NULL,
  `media` bit(1) NOT NULL,
  `media_remove` bit(1) NOT NULL,
  `media_upload` bit(1) NOT NULL,
  `member_edit` bit(1) NOT NULL,
  `member_view` bit(1) NOT NULL,
  `password_policy` bit(1) NOT NULL,
  `portal_agent_add` bit(1) NOT NULL,
  `portal_agent_delete` bit(1) NOT NULL,
  `portal_agent_view` bit(1) NOT NULL,
  `portal_agents` bit(1) NOT NULL,
  `portal_landlord_add` bit(1) NOT NULL,
  `portal_landlord_delete` bit(1) NOT NULL,
  `portal_landlord_view` bit(1) NOT NULL,
  `portal_landlords` bit(1) NOT NULL,
  `profile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `profile_login_username` bit(1) NOT NULL,
  `profile_names` bit(1) NOT NULL,
  `profile_privileges` bit(1) NOT NULL,
  `property` bit(1) NOT NULL,
  `receipts` bit(1) NOT NULL,
  `rent` bit(1) NOT NULL,
  `service_charge` bit(1) NOT NULL,
  `setup` bit(1) NOT NULL,
  `setup_banner` bit(1) NOT NULL,
  `setup_company` bit(1) NOT NULL,
  `setup_contact_reason` bit(1) NOT NULL,
  `setup_email` bit(1) NOT NULL,
  `setup_interest_rate` bit(1) NOT NULL,
  `setup_logo` bit(1) NOT NULL,
  `setup_menu` bit(1) NOT NULL,
  `setup_other` bit(1) NOT NULL,
  `setup_social` bit(1) NOT NULL,
  `setup_theme` bit(1) NOT NULL,
  `tenants` bit(1) NOT NULL,
  `uac` bit(1) NOT NULL,
  `unit` bit(1) NOT NULL,
  `user_enable_disable` bit(1) NOT NULL,
  `users` bit(1) NOT NULL,
  `view_commissions` bit(1) NOT NULL,
  `view_deductions` bit(1) NOT NULL,
  `view_invoices` bit(1) NOT NULL,
  `view_property` bit(1) NOT NULL,
  `view_receipts` bit(1) NOT NULL,
  `view_rent_arrears` bit(1) NOT NULL,
  `view_rent_paid` bit(1) NOT NULL,
  `view_rent_prepaid` bit(1) NOT NULL,
  `view_service_charge` bit(1) NOT NULL,
  `view_tenant` bit(1) NOT NULL,
  `view_unit` bit(1) NOT NULL,
  `view_unit_grid` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_permissions`
--

INSERT INTO `tbl_permissions` (`id`, `add_property`, `add_unit`, `admin_dashboard_items`, `agent_dashboard_items`, `agent_edit_permissions`, `agent_menu_config`, `audit_trail`, `client_names`, `client_setup_config`, `commissions`, `content`, `content_help`, `content_page`, `db_menu`, `deductions`, `document`, `enable_acc_recovery`, `faq_page`, `invoices`, `media`, `media_remove`, `media_upload`, `member_edit`, `member_view`, `password_policy`, `portal_agent_add`, `portal_agent_delete`, `portal_agent_view`, `portal_agents`, `portal_landlord_add`, `portal_landlord_delete`, `portal_landlord_view`, `portal_landlords`, `profile`, `profile_login_username`, `profile_names`, `profile_privileges`, `property`, `receipts`, `rent`, `service_charge`, `setup`, `setup_banner`, `setup_company`, `setup_contact_reason`, `setup_email`, `setup_interest_rate`, `setup_logo`, `setup_menu`, `setup_other`, `setup_social`, `setup_theme`, `tenants`, `uac`, `unit`, `user_enable_disable`, `users`, `view_commissions`, `view_deductions`, `view_invoices`, `view_property`, `view_receipts`, `view_rent_arrears`, `view_rent_paid`, `view_rent_prepaid`, `view_service_charge`, `view_tenant`, `view_unit`, `view_unit_grid`) VALUES
(1, b'1', b'1', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(1125, b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', 'LANDLORD', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1'),
(1126, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile_login_fields`
--

CREATE TABLE `tbl_profile_login_fields` (
  `id` bigint(20) NOT NULL,
  `ordinal` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `published` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_profile_login_fields`
--

INSERT INTO `tbl_profile_login_fields` (`id`, `ordinal`, `profile`, `published`) VALUES
(1, 'EMAIL', 'AGENT', b'1'),
(2, 'EMAIL', 'ADMINISTRATOR', b'1'),
(3, 'EMAIL', 'LANDLOARD', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile_names`
--

CREATE TABLE `tbl_profile_names` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_properties`
--

CREATE TABLE `tbl_properties` (
  `id` bigint(20) NOT NULL,
  `building` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `postalAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `residentialAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `road` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `landNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `numberOfUnits` int(11) NOT NULL,
  `propertyCategory` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `totalArea` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `agent_id` bigint(20) DEFAULT NULL,
  `totalAreaUnit_id` bigint(20) DEFAULT NULL,
  `companyName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `landRates` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lease` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `propertyNo` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_properties`
--

INSERT INTO `tbl_properties` (`id`, `building`, `postalAddress`, `residentialAddress`, `road`, `town`, `zipcode`, `landNumber`, `location`, `name`, `numberOfUnits`, `propertyCategory`, `totalArea`, `agent_id`, `totalAreaUnit_id`, `companyName`, `landRates`, `lease`, `propertyNo`) VALUES
(0, 'kasa', 'kasa', 'kasa', 'kasa', 'kasa', 'kasa', 'kasa', 'kasa', 'kasa', 1, 'COMMERCIAL', '12', 1, 1, 'kasa', 'kasa', 'YES', '1'),
(22, NULL, NULL, NULL, 'PARKLANDS', 'NAIROBI', NULL, '90035', 'EASTLEIGH', 'EASTLEIGH', 120, 'COMMERCIAL', '899', 21, NULL, NULL, '10', 'YES', 'EASTLEIGH');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rents`
--

CREATE TABLE `tbl_rents` (
  `id` bigint(20) NOT NULL,
  `amountPaid` decimal(19,2) DEFAULT NULL,
  `amountToLandlord` decimal(19,2) DEFAULT NULL,
  `amountToRgl` decimal(19,2) DEFAULT NULL,
  `arrears` decimal(19,2) DEFAULT NULL,
  `datePaid` datetime DEFAULT NULL,
  `excessAmount` decimal(19,2) DEFAULT NULL,
  `paid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `penalty` decimal(19,2) DEFAULT NULL,
  `prepaidAmount` decimal(19,2) DEFAULT NULL,
  `receiptNo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `year` int(11) NOT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `month_id` bigint(20) DEFAULT NULL,
  `tenancyAgreement_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_rents`
--

INSERT INTO `tbl_rents` (`id`, `amountPaid`, `amountToLandlord`, `amountToRgl`, `arrears`, `datePaid`, `excessAmount`, `paid`, `penalty`, `prepaidAmount`, `receiptNo`, `year`, `currency_id`, `month_id`, `tenancyAgreement_id`, `unit_id`) VALUES
(1, '7500.00', NULL, NULL, NULL, '2018-01-17 00:08:00', NULL, 'YES', NULL, NULL, NULL, 2018, NULL, 1, 1, 2),
(2, '7500.00', NULL, NULL, NULL, '2018-01-20 00:11:00', NULL, 'YES', NULL, NULL, NULL, 2018, NULL, 2, 2, 1),
(3, '7500.00', NULL, NULL, NULL, '2018-01-20 00:11:00', '500.00', 'YES', NULL, NULL, NULL, 2018, NULL, 1, NULL, 23),
(4, '90000.00', NULL, NULL, '82000.00', '2018-01-07 00:12:00', NULL, 'YES', NULL, NULL, NULL, 2018, NULL, 1, NULL, 23),
(5, '3000.00', NULL, NULL, NULL, '2018-01-08 00:12:00', NULL, 'YES', NULL, '4500.00', NULL, 2018, NULL, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rent_penalty_formula`
--

CREATE TABLE `tbl_rent_penalty_formula` (
  `id` bigint(20) NOT NULL,
  `dueDay` int(11) DEFAULT NULL,
  `effectiveDate` datetime DEFAULT NULL,
  `formula` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rate` decimal(19,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_charge`
--

CREATE TABLE `tbl_service_charge` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` bigint(20) NOT NULL,
  `encrypt` bit(1) NOT NULL,
  `loginField` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo` longblob,
  `logoFile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `memberOnboarding` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `portalBaseURL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `projectedROR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sponsorOnboarding` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `whatIfAnalysisFormula` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `xiPath` varchar(255) COLLATE utf8_bin NOT NULL,
  `xiReportPassword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `xiReportPath` varchar(255) COLLATE utf8_bin NOT NULL,
  `xiReportUsername` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social`
--

CREATE TABLE `tbl_social` (
  `id` bigint(20) NOT NULL,
  `facebook` varchar(255) COLLATE utf8_bin NOT NULL,
  `google` varchar(255) COLLATE utf8_bin NOT NULL,
  `linkedin` varchar(255) COLLATE utf8_bin NOT NULL,
  `pinterest` varchar(255) COLLATE utf8_bin NOT NULL,
  `twitter` varchar(255) COLLATE utf8_bin NOT NULL,
  `youtube` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tenants`
--

CREATE TABLE `tbl_tenants` (
  `id` bigint(20) NOT NULL,
  `building` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `postalAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `residentialAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `road` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateJoined` datetime DEFAULT NULL,
  `dateOfExit` datetime DEFAULT NULL,
  `emailAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastPenaltyDate` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `serviceCharge` decimal(19,2) DEFAULT NULL,
  `tenantStatus` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_tenants`
--

INSERT INTO `tbl_tenants` (`id`, `building`, `postalAddress`, `residentialAddress`, `road`, `town`, `zipcode`, `dateJoined`, `dateOfExit`, `emailAddress`, `lastPenaltyDate`, `name`, `phoneNumber`, `serviceCharge`, `tenantStatus`, `unit_id`) VALUES
(1, NULL, '82', NULL, NULL, 'Songhor', NULL, NULL, NULL, 'wilfredwilfred67@gmail.com', NULL, 'wilfred', '0723787120', '200.00', 'LEFT', 2),
(2, NULL, '82', NULL, NULL, 'Songhor', NULL, '2017-12-31 00:11:00', NULL, 'wilfredwilfred67@gmail.com', NULL, 'Ujasari Loan', '0723787120', '200.00', 'ACTIVE', 1),
(3, NULL, '82', NULL, NULL, 'Songhor', NULL, NULL, NULL, 'wilfredkim5@gmail.com', NULL, 'Kenneth karanja', '+254723787120', '0.00', 'ACTIVE', 23);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_theme`
--

CREATE TABLE `tbl_theme` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `font` varchar(255) COLLATE utf8_bin NOT NULL,
  `footer` varchar(255) COLLATE utf8_bin NOT NULL,
  `header` varchar(255) COLLATE utf8_bin NOT NULL,
  `major` varchar(255) COLLATE utf8_bin NOT NULL,
  `minor` varchar(255) COLLATE utf8_bin NOT NULL,
  `other` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_total_area_units`
--

CREATE TABLE `tbl_total_area_units` (
  `id` bigint(20) NOT NULL,
  `acre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hectare` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `squareFeet` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `squareMetre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `squareYard` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_total_area_units`
--

INSERT INTO `tbl_total_area_units` (`id`, `acre`, `hectare`, `squareFeet`, `squareMetre`, `squareYard`) VALUES
(1, '12', '12', '12', '12', '12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_units`
--

CREATE TABLE `tbl_units` (
  `id` bigint(20) NOT NULL,
  `blockNo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `booked` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deposit` decimal(19,2) DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `monthlyRent` decimal(19,2) DEFAULT NULL,
  `occupancy_status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unitNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unitType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `property_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_units`
--

INSERT INTO `tbl_units` (`id`, `blockNo`, `booked`, `deposit`, `description`, `monthlyRent`, `occupancy_status`, `unitNumber`, `unitType`, `property_id`) VALUES
(1, '1st Floor', 'NO', '7500.00', '                                    Bedsitter', '7500.00', 'VACANT', 'B001', 'RESIDENTIAL', 0),
(2, '1st Floor', 'NO', '7500.00', 'Bedsitter                                    ', '7500.00', 'VACANT', 'B002', 'RESIDENTIAL', 0),
(23, '6th', 'NO', '8000.00', '                                    cool bedsitter', '8000.00', 'VACANT', 'B004', 'RESIDENTIAL', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit_liabilities`
--

CREATE TABLE `tbl_unit_liabilities` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `electricityCost` decimal(19,2) DEFAULT NULL,
  `generalUnitMismanagement` decimal(19,2) DEFAULT NULL,
  `waterCost` decimal(19,2) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_unit_liabilities`
--

INSERT INTO `tbl_unit_liabilities` (`id`, `description`, `electricityCost`, `generalUnitMismanagement`, `waterCost`, `unit_id`) VALUES
(4, 'this is so good                                   ', '0.00', '1200.00', '0.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_used_passwords`
--

CREATE TABLE `tbl_used_passwords` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` bigint(20) NOT NULL,
  `attempt` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password_expiry` datetime DEFAULT NULL,
  `profileID` bigint(20) DEFAULT NULL,
  `securityCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `smsActivationCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `userProfile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `attempt`, `password`, `password_expiry`, `profileID`, `securityCode`, `smsActivationCode`, `status`, `userProfile`, `username`) VALUES
(1, 0, '7af2d10b73ab7cd8f603937f7697cb5fe432c7ff', '2018-10-25 20:40:00', 1, '94fa0bd5-f0e4-4200-a65d-93008261221e', NULL, b'1', 'AGENT', 'poze@gmail.com'),
(3, 0, '7af2d10b73ab7cd8f603937f7697cb5fe432c7ff', '2018-10-25 20:40:00', 1, '94fa0bd5-f0e4-4200-a65d-93008261221e', NULL, b'1', 'LANDLORD', 'kkm.dekut@gmail.com'),
(5, 0, '7af2d10b73ab7cd8f603937f7697cb5fe432c7ff', '2018-11-30 00:00:00', 1, '94fa0bd5-f0e4-4200-a65d-93008261221e', NULL, b'1', 'ADMINISTRATOR', 'wilfredkim5@gmail.com'),
(6, 0, '983a21edbec1e86f6cedd970fe08fc8ffecd76bd', '2018-12-12 16:49:26', 21, 'fbd270a9-49db-43eb-99a7-b22e25fb809a', NULL, b'1', 'AGENT', 'wilfredwilfred67@gmail.com'),
(7, 0, '7062e7d93737bcf2dcbe244bfe355b7b3d5444bd', '2018-12-12 19:00:38', 24, 'bb628cab-eaa6-4f58-aa3f-81176c0af59b', NULL, b'1', 'LANDLORD', 'willypoze5@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_dashboard_items`
--
ALTER TABLE `admin_dashboard_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmp_sequence`
--
ALTER TABLE `cmp_sequence`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_4onpmecni7xf3ah4afp8ixi51` (`name`),
  ADD KEY `cmpsqnmidx` (`name`),
  ADD KEY `cmpsts0idx` (`timeStamp`);

--
-- Indexes for table `SmtpSetup`
--
ALTER TABLE `SmtpSetup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_account_recovery`
--
ALTER TABLE `tbl_account_recovery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_activity_logs`
--
ALTER TABLE `tbl_activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_agents`
--
ALTER TABLE `tbl_agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_i6e9pww03u8lacwc4vpbwa3gk` (`emailAddress`);

--
-- Indexes for table `tbl_agent_dashboard_items`
--
ALTER TABLE `tbl_agent_dashboard_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_agent_menu`
--
ALTER TABLE `tbl_agent_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_agent_rights`
--
ALTER TABLE `tbl_agent_rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_audit_trails`
--
ALTER TABLE `tbl_audit_trails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_banners`
--
ALTER TABLE `tbl_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bulk_tenants`
--
ALTER TABLE `tbl_bulk_tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_commissions`
--
ALTER TABLE `tbl_commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqg8gssuo9n4xox94trd3bqkvq` (`country_id`);

--
-- Indexes for table `tbl_config`
--
ALTER TABLE `tbl_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact_categories`
--
ALTER TABLE `tbl_contact_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content`
--
ALTER TABLE `tbl_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_countries`
--
ALTER TABLE `tbl_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_currencies`
--
ALTER TABLE `tbl_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_emails`
--
ALTER TABLE `tbl_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_faq_content`
--
ALTER TABLE `tbl_faq_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_genders`
--
ALTER TABLE `tbl_genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_help`
--
ALTER TABLE `tbl_help`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_landlords`
--
ALTER TABLE `tbl_landlords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_bugw729ddy76v41pplh0nxb3s` (`idNumber`),
  ADD KEY `FKmmuajrf33fmiat1mp31jb92sn` (`agent_id`),
  ADD KEY `FKnrurvikebx37uw6xqjxiecv0a` (`gender_id`);

--
-- Indexes for table `tbl_landlord_menu`
--
ALTER TABLE `tbl_landlord_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3t439180hhnu4r1v9iqjbcqr9` (`profile_id`);

--
-- Indexes for table `tbl_logo`
--
ALTER TABLE `tbl_logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_media`
--
ALTER TABLE `tbl_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_months`
--
ALTER TABLE `tbl_months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_password_policy`
--
ALTER TABLE `tbl_password_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permissions`
--
ALTER TABLE `tbl_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_profile_login_fields`
--
ALTER TABLE `tbl_profile_login_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_profile_names`
--
ALTER TABLE `tbl_profile_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_properties`
--
ALTER TABLE `tbl_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4r79jgxy9be0e4lc8yuc4luup` (`agent_id`),
  ADD KEY `FKfj0oa9t3jnlwyokwsif2qwm9k` (`totalAreaUnit_id`);

--
-- Indexes for table `tbl_rents`
--
ALTER TABLE `tbl_rents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7u9nl211hmm8sgb580i30o0j1` (`currency_id`),
  ADD KEY `FKrfbv2362288hrcuh9d3yy0tqv` (`month_id`),
  ADD KEY `FKh3scnwbvsn60a9fblksc2xt42` (`tenancyAgreement_id`),
  ADD KEY `FK86neoedtjtg5sefan52annvcv` (`unit_id`);

--
-- Indexes for table `tbl_rent_penalty_formula`
--
ALTER TABLE `tbl_rent_penalty_formula`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_service_charge`
--
ALTER TABLE `tbl_service_charge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social`
--
ALTER TABLE `tbl_social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tenants`
--
ALTER TABLE `tbl_tenants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKodwnp18gr32gwjdjnemk5dlh8` (`unit_id`);

--
-- Indexes for table `tbl_theme`
--
ALTER TABLE `tbl_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_total_area_units`
--
ALTER TABLE `tbl_total_area_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_units`
--
ALTER TABLE `tbl_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9m5ya0xs20l8jxwqr32cd138v` (`property_id`);

--
-- Indexes for table `tbl_unit_liabilities`
--
ALTER TABLE `tbl_unit_liabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsui96kbpceqj4hh3u9t6lm9uq` (`unit_id`);

--
-- Indexes for table `tbl_used_passwords`
--
ALTER TABLE `tbl_used_passwords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_c190nfu2w5xwvexf9dv08grsq` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_dashboard_items`
--
ALTER TABLE `admin_dashboard_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_account_recovery`
--
ALTER TABLE `tbl_account_recovery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_activity_logs`
--
ALTER TABLE `tbl_activity_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1216;

--
-- AUTO_INCREMENT for table `tbl_agent_dashboard_items`
--
ALTER TABLE `tbl_agent_dashboard_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_agent_menu`
--
ALTER TABLE `tbl_agent_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_agent_rights`
--
ALTER TABLE `tbl_agent_rights`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_audit_trails`
--
ALTER TABLE `tbl_audit_trails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_banners`
--
ALTER TABLE `tbl_banners`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_bulk_tenants`
--
ALTER TABLE `tbl_bulk_tenants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_commissions`
--
ALTER TABLE `tbl_commissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_config`
--
ALTER TABLE `tbl_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_contact_categories`
--
ALTER TABLE `tbl_contact_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_content`
--
ALTER TABLE `tbl_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_countries`
--
ALTER TABLE `tbl_countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_emails`
--
ALTER TABLE `tbl_emails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_faq_content`
--
ALTER TABLE `tbl_faq_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_genders`
--
ALTER TABLE `tbl_genders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_help`
--
ALTER TABLE `tbl_help`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_landlord_menu`
--
ALTER TABLE `tbl_landlord_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_logo`
--
ALTER TABLE `tbl_logo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_media`
--
ALTER TABLE `tbl_media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_password_policy`
--
ALTER TABLE `tbl_password_policy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_permissions`
--
ALTER TABLE `tbl_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1127;

--
-- AUTO_INCREMENT for table `tbl_profile_login_fields`
--
ALTER TABLE `tbl_profile_login_fields`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_profile_names`
--
ALTER TABLE `tbl_profile_names`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rents`
--
ALTER TABLE `tbl_rents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_social`
--
ALTER TABLE `tbl_social`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tenants`
--
ALTER TABLE `tbl_tenants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_theme`
--
ALTER TABLE `tbl_theme`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_used_passwords`
--
ALTER TABLE `tbl_used_passwords`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD CONSTRAINT `FKqg8gssuo9n4xox94trd3bqkvq` FOREIGN KEY (`country_id`) REFERENCES `tbl_countries` (`id`);

--
-- Constraints for table `tbl_landlords`
--
ALTER TABLE `tbl_landlords`
  ADD CONSTRAINT `FKmmuajrf33fmiat1mp31jb92sn` FOREIGN KEY (`agent_id`) REFERENCES `tbl_agents` (`id`),
  ADD CONSTRAINT `FKnrurvikebx37uw6xqjxiecv0a` FOREIGN KEY (`gender_id`) REFERENCES `tbl_genders` (`id`);

--
-- Constraints for table `tbl_landlord_menu`
--
ALTER TABLE `tbl_landlord_menu`
  ADD CONSTRAINT `FK3t439180hhnu4r1v9iqjbcqr9` FOREIGN KEY (`profile_id`) REFERENCES `tbl_profile_names` (`id`);

--
-- Constraints for table `tbl_properties`
--
ALTER TABLE `tbl_properties`
  ADD CONSTRAINT `FK4r79jgxy9be0e4lc8yuc4luup` FOREIGN KEY (`agent_id`) REFERENCES `tbl_agents` (`id`),
  ADD CONSTRAINT `FKfj0oa9t3jnlwyokwsif2qwm9k` FOREIGN KEY (`totalAreaUnit_id`) REFERENCES `tbl_total_area_units` (`id`);

--
-- Constraints for table `tbl_rents`
--
ALTER TABLE `tbl_rents`
  ADD CONSTRAINT `FK7u9nl211hmm8sgb580i30o0j1` FOREIGN KEY (`currency_id`) REFERENCES `tbl_currencies` (`id`),
  ADD CONSTRAINT `FK86neoedtjtg5sefan52annvcv` FOREIGN KEY (`unit_id`) REFERENCES `tbl_units` (`id`),
  ADD CONSTRAINT `FKh3scnwbvsn60a9fblksc2xt42` FOREIGN KEY (`tenancyAgreement_id`) REFERENCES `tbl_tenants` (`id`),
  ADD CONSTRAINT `FKrfbv2362288hrcuh9d3yy0tqv` FOREIGN KEY (`month_id`) REFERENCES `tbl_months` (`id`);

--
-- Constraints for table `tbl_tenants`
--
ALTER TABLE `tbl_tenants`
  ADD CONSTRAINT `FKodwnp18gr32gwjdjnemk5dlh8` FOREIGN KEY (`unit_id`) REFERENCES `tbl_units` (`id`);

--
-- Constraints for table `tbl_units`
--
ALTER TABLE `tbl_units`
  ADD CONSTRAINT `FK9m5ya0xs20l8jxwqr32cd138v` FOREIGN KEY (`property_id`) REFERENCES `tbl_properties` (`id`);

--
-- Constraints for table `tbl_unit_liabilities`
--
ALTER TABLE `tbl_unit_liabilities`
  ADD CONSTRAINT `FKsui96kbpceqj4hh3u9t6lm9uq` FOREIGN KEY (`unit_id`) REFERENCES `tbl_units` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
