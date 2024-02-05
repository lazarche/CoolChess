-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 11:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coolchess`
--

-- --------------------------------------------------------

--
-- Table structure for table `chessmatch`
--

CREATE TABLE `chessmatch` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chessmatch`
--

INSERT INTO `chessmatch` (`id`, `date`, `status`) VALUES
(1, '2024-02-02 22:32:14', 'finished'),
(2, '2024-02-02 22:32:51', 'finished'),
(3, '2024-02-02 22:33:41', 'started'),
(4, '2024-02-02 22:39:33', 'finished'),
(5, '2024-02-02 23:03:18', 'started'),
(6, '2024-02-02 23:10:06', 'started'),
(7, '2024-02-02 23:12:43', 'finished'),
(8, '2024-02-02 23:14:33', 'finished'),
(9, '2024-02-02 23:20:41', 'finished'),
(10, '2024-02-02 23:27:15', 'finished'),
(11, '2024-02-03 13:12:24', 'started'),
(12, '2024-02-03 13:14:39', 'finished'),
(13, '2024-02-04 13:04:01', 'started'),
(14, '2024-02-04 22:34:17', 'finished'),
(15, '2024-02-04 22:44:49', 'finished'),
(16, '2024-02-04 22:48:25', 'finished'),
(17, '2024-02-04 22:55:15', 'finished'),
(18, '2024-02-04 22:58:10', 'finished'),
(19, '2024-02-04 23:00:45', 'finished'),
(20, '2024-02-04 23:05:25', 'finished'),
(21, '2024-02-04 23:13:31', 'finished'),
(22, '2024-02-04 23:20:35', 'finished'),
(23, '2024-02-04 23:25:26', 'finished');

-- --------------------------------------------------------

--
-- Table structure for table `chessmove`
--

CREATE TABLE `chessmove` (
  `idMove` int(11) NOT NULL,
  `startRow` varchar(1) DEFAULT NULL,
  `startCol` varchar(1) DEFAULT NULL,
  `endRow` varchar(1) DEFAULT NULL,
  `endCol` varchar(1) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `piece` varchar(10) DEFAULT NULL,
  `idPlayer` int(11) NOT NULL,
  `idMatch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chessmove`
--

INSERT INTO `chessmove` (`idMove`, `startRow`, `startCol`, `endRow`, `endCol`, `color`, `piece`, `idPlayer`, `idMatch`) VALUES
(1, 'B', '3', 'D', '3', 'WHITE', 'Pawn', 1, 1),
(2, 'G', '4', 'E', '4', 'BLACK', 'Pawn', 2, 1),
(3, 'D', '3', 'E', '3', 'WHITE', 'Pawn', 1, 1),
(4, 'H', '4', 'G', '4', 'BLACK', 'King', 2, 1),
(5, 'E', '3', 'F', '3', 'WHITE', 'Pawn', 1, 1),
(6, 'E', '4', 'D', '4', 'BLACK', 'Pawn', 2, 1),
(7, 'F', '3', 'G', '4', 'WHITE', 'Pawn', 1, 1),
(8, 'B', '3', 'D', '3', 'WHITE', 'Pawn', 1, 2),
(9, 'G', '4', 'E', '4', 'BLACK', 'Pawn', 2, 2),
(10, 'A', '3', 'B', '3', 'WHITE', 'Queen', 1, 2),
(11, 'E', '4', 'D', '4', 'BLACK', 'Pawn', 2, 2),
(12, 'B', '3', 'C', '3', 'WHITE', 'Queen', 1, 2),
(13, 'G', '5', 'F', '5', 'BLACK', 'Pawn', 2, 2),
(14, 'D', '3', 'E', '3', 'WHITE', 'Pawn', 1, 2),
(15, 'D', '4', 'C', '3', 'BLACK', 'Pawn', 2, 2),
(16, 'E', '3', 'F', '3', 'WHITE', 'Pawn', 1, 2),
(17, 'C', '3', 'B', '3', 'BLACK', 'Pawn', 2, 2),
(18, 'F', '3', 'G', '2', 'WHITE', 'Pawn', 1, 2),
(19, 'B', '3', 'A', '4', 'BLACK', 'Pawn', 2, 2),
(20, 'B', '3', 'D', '3', 'WHITE', 'Pawn', 7, 4),
(21, 'G', '3', 'E', '3', 'BLACK', 'Pawn', 8, 4),
(22, 'B', '4', 'C', '4', 'WHITE', 'Pawn', 7, 4),
(23, 'H', '6', 'F', '7', 'BLACK', 'Knight', 8, 4),
(24, 'B', '0', 'D', '0', 'WHITE', 'Pawn', 7, 4),
(25, 'H', '2', 'D', '6', 'BLACK', 'Bishop', 8, 4),
(26, 'A', '6', 'B', '4', 'WHITE', 'Knight', 7, 4),
(27, 'G', '2', 'F', '2', 'BLACK', 'Pawn', 8, 4),
(28, 'A', '1', 'C', '2', 'WHITE', 'Knight', 7, 4),
(29, 'G', '5', 'F', '5', 'BLACK', 'Pawn', 8, 4),
(30, 'A', '0', 'C', '0', 'WHITE', 'Rook', 7, 4),
(31, 'G', '4', 'E', '4', 'BLACK', 'Pawn', 8, 4),
(32, 'C', '0', 'C', '1', 'WHITE', 'Rook', 7, 4),
(33, 'H', '3', 'E', '0', 'BLACK', 'Queen', 8, 4),
(34, 'C', '1', 'G', '1', 'WHITE', 'Rook', 7, 4),
(35, 'H', '5', 'D', '1', 'BLACK', 'Bishop', 8, 4),
(36, 'B', '5', 'C', '5', 'WHITE', 'Pawn', 7, 4),
(37, 'D', '1', 'C', '2', 'BLACK', 'Bishop', 8, 4),
(38, 'B', '4', 'C', '2', 'WHITE', 'Knight', 7, 4),
(39, 'E', '4', 'D', '3', 'BLACK', 'Pawn', 8, 4),
(40, 'B', '1', 'D', '1', 'WHITE', 'Pawn', 7, 4),
(41, 'D', '6', 'C', '5', 'BLACK', 'Bishop', 8, 4),
(42, 'A', '3', 'C', '5', 'WHITE', 'Queen', 7, 4),
(43, 'D', '3', 'C', '2', 'BLACK', 'Pawn', 8, 4),
(44, 'C', '4', 'D', '4', 'WHITE', 'Pawn', 7, 4),
(45, 'E', '0', 'D', '1', 'BLACK', 'Queen', 8, 4),
(46, 'C', '5', 'E', '7', 'WHITE', 'Queen', 7, 4),
(47, 'D', '1', 'G', '1', 'BLACK', 'Queen', 8, 4),
(48, 'E', '7', 'H', '4', 'WHITE', 'Queen', 7, 4),
(49, '4', 'B', '4', 'D', 'WHITE', 'Pawn', 8, 5),
(50, '4', 'G', '4', 'E', 'BLACK', 'Pawn', 7, 5),
(51, '2', 'A', '3', 'C', 'WHITE', 'Knight', 8, 5),
(52, '2', 'H', '3', 'F', 'BLACK', 'Knight', 7, 5),
(53, 'B', '5', 'D', '5', 'WHITE', 'Pawn', 8, 6),
(54, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 8, 7),
(55, '7', 'C', '5', 'C', 'BLACK', 'Pawn', 7, 7),
(56, '1', 'B', '3', 'C', 'WHITE', 'Knight', 8, 7),
(57, '7', 'D', '6', 'D', 'BLACK', 'Pawn', 7, 7),
(58, '4', 'D', '5', 'C', 'WHITE', 'Pawn', 8, 7),
(59, '8', 'C', '5', 'F', 'BLACK', 'Bishop', 7, 7),
(60, '1', 'D', '6', 'D', 'WHITE', 'Queen', 8, 7),
(61, '7', 'B', '5', 'B', 'BLACK', 'Pawn', 7, 7),
(62, '6', 'D', '7', 'E', 'WHITE', 'Queen', 8, 7),
(63, '8', 'G', '6', 'F', 'BLACK', 'Knight', 7, 7),
(64, '7', 'E', '8', 'E', 'WHITE', 'Queen', 8, 7),
(65, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 7, 8),
(66, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 8, 8),
(67, '2', 'E', '3', 'E', 'WHITE', 'Pawn', 7, 8),
(68, '8', 'D', '6', 'D', 'BLACK', 'Queen', 8, 8),
(69, '1', 'F', '5', 'B', 'WHITE', 'Bishop', 7, 8),
(70, '6', 'D', '4', 'B', 'BLACK', 'Queen', 8, 8),
(71, '5', 'B', '8', 'E', 'WHITE', 'Bishop', 7, 8),
(72, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 2, 9),
(73, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 8, 9),
(74, '2', 'C', '4', 'C', 'WHITE', 'Pawn', 2, 9),
(75, '8', 'D', '6', 'D', 'BLACK', 'Queen', 8, 9),
(76, '2', 'E', '3', 'E', 'WHITE', 'Pawn', 2, 9),
(77, '6', 'D', '4', 'B', 'BLACK', 'Queen', 8, 9),
(78, '2', 'F', '4', 'F', 'WHITE', 'Pawn', 2, 9),
(79, '4', 'B', '1', 'E', 'BLACK', 'Queen', 8, 9),
(80, '2', 'F', '4', 'F', 'WHITE', 'Pawn', 7, 10),
(81, '7', 'H', '5', 'H', 'BLACK', 'Pawn', 9, 10),
(82, '1', 'G', '3', 'F', 'WHITE', 'Knight', 7, 10),
(83, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 9, 10),
(84, '3', 'F', '5', 'G', 'WHITE', 'Knight', 7, 10),
(85, '7', 'F', '6', 'F', 'BLACK', 'Pawn', 9, 10),
(86, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 7, 10),
(87, '6', 'F', '5', 'G', 'BLACK', 'Pawn', 9, 10),
(88, '4', 'F', '5', 'G', 'WHITE', 'Pawn', 7, 10),
(89, '7', 'B', '5', 'B', 'BLACK', 'Pawn', 9, 10),
(90, '2', 'E', '4', 'E', 'WHITE', 'Pawn', 7, 10),
(91, '5', 'D', '4', 'E', 'BLACK', 'Pawn', 9, 10),
(92, '1', 'F', '5', 'B', 'WHITE', 'Bishop', 7, 10),
(93, '7', 'E', '6', 'E', 'BLACK', 'Pawn', 9, 10),
(94, '5', 'B', '8', 'E', 'WHITE', 'Bishop', 7, 10),
(95, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 7, 12),
(96, '7', 'F', '5', 'F', 'BLACK', 'Pawn', 6, 12),
(97, '1', 'D', '3', 'D', 'WHITE', 'Queen', 7, 12),
(98, '7', 'G', '6', 'G', 'BLACK', 'Pawn', 6, 12),
(99, '1', 'C', '2', 'D', 'WHITE', 'Bishop', 7, 12),
(100, '8', 'F', '6', 'H', 'BLACK', 'Bishop', 6, 12),
(101, '2', 'D', '6', 'H', 'WHITE', 'Bishop', 7, 12),
(102, '8', 'G', '6', 'H', 'BLACK', 'Knight', 6, 12),
(103, '1', 'B', '3', 'C', 'WHITE', 'Knight', 7, 12),
(104, '8', 'H', '8', 'F', 'BLACK', 'Rook', 6, 12),
(105, '2', 'F', '4', 'F', 'WHITE', 'Pawn', 7, 12),
(106, '7', 'A', '5', 'A', 'BLACK', 'Pawn', 6, 12),
(107, '2', 'G', '4', 'G', 'WHITE', 'Pawn', 7, 12),
(108, '5', 'F', '4', 'G', 'BLACK', 'Pawn', 6, 12),
(109, '3', 'C', '5', 'D', 'WHITE', 'Knight', 7, 12),
(110, '8', 'A', '6', 'A', 'BLACK', 'Rook', 6, 12),
(111, '2', 'H', '4', 'H', 'WHITE', 'Pawn', 7, 12),
(112, '6', 'H', '7', 'F', 'BLACK', 'Knight', 6, 12),
(113, '1', 'H', '2', 'H', 'WHITE', 'Rook', 7, 12),
(114, '6', 'A', '6', 'D', 'BLACK', 'Rook', 6, 12),
(115, '3', 'D', '3', 'B', 'WHITE', 'Queen', 7, 12),
(116, '6', 'D', '5', 'D', 'BLACK', 'Rook', 6, 12),
(117, '3', 'B', '5', 'D', 'WHITE', 'Queen', 7, 12),
(118, '7', 'C', '5', 'C', 'BLACK', 'Pawn', 6, 12),
(119, '4', 'D', '5', 'C', 'WHITE', 'Pawn', 7, 12),
(120, '4', 'G', '3', 'G', 'BLACK', 'Pawn', 6, 12),
(121, '2', 'H', '2', 'G', 'WHITE', 'Rook', 7, 12),
(122, '7', 'B', '5', 'B', 'BLACK', 'Pawn', 6, 12),
(123, '2', 'G', '3', 'G', 'WHITE', 'Rook', 7, 12),
(124, '8', 'C', '6', 'A', 'BLACK', 'Bishop', 6, 12),
(125, '1', 'G', '3', 'F', 'WHITE', 'Knight', 7, 12),
(126, '5', 'B', '4', 'B', 'BLACK', 'Pawn', 6, 12),
(127, '3', 'F', '5', 'E', 'WHITE', 'Knight', 7, 12),
(128, '7', 'F', '5', 'E', 'BLACK', 'Knight', 6, 12),
(129, '5', 'D', '5', 'E', 'WHITE', 'Queen', 7, 12),
(130, '8', 'B', '6', 'C', 'BLACK', 'Knight', 6, 12),
(131, '5', 'E', '7', 'G', 'WHITE', 'Queen', 7, 12),
(132, '6', 'C', '4', 'D', 'BLACK', 'Knight', 6, 12),
(133, '7', 'G', '7', 'H', 'WHITE', 'Queen', 7, 12),
(134, '4', 'D', '2', 'E', 'BLACK', 'Knight', 6, 12),
(135, '3', 'G', '6', 'G', 'WHITE', 'Rook', 7, 12),
(136, '6', 'A', '4', 'C', 'BLACK', 'Bishop', 6, 12),
(137, '6', 'G', '8', 'G', 'WHITE', 'Rook', 7, 12),
(138, '8', 'F', '8', 'G', 'BLACK', 'Rook', 6, 12),
(139, '7', 'H', '7', 'G', 'WHITE', 'Queen', 7, 12),
(140, '8', 'G', '7', 'G', 'BLACK', 'Rook', 6, 12),
(141, '1', 'F', '2', 'E', 'WHITE', 'Bishop', 7, 12),
(142, '4', 'C', '2', 'E', 'BLACK', 'Bishop', 6, 12),
(143, '1', 'E', '2', 'E', 'WHITE', 'King', 7, 12),
(144, '4', 'B', '5', 'C', 'BLACK', 'Pawn', 6, 12),
(145, '2', 'C', '3', 'C', 'WHITE', 'Pawn', 7, 12),
(146, '7', 'E', '6', 'E', 'BLACK', 'Pawn', 6, 12),
(147, '2', 'B', '4', 'B', 'WHITE', 'Pawn', 7, 12),
(148, '5', 'C', '4', 'B', 'BLACK', 'Pawn', 6, 12),
(149, '3', 'C', '4', 'C', 'WHITE', 'Pawn', 7, 12),
(150, '7', 'D', '6', 'D', 'BLACK', 'Pawn', 6, 12),
(151, '1', 'A', '1', 'F', 'WHITE', 'Rook', 7, 12),
(152, '7', 'G', '2', 'G', 'BLACK', 'Rook', 6, 12),
(153, '2', 'E', '3', 'F', 'WHITE', 'King', 7, 12),
(154, '6', 'D', '4', 'D', 'BLACK', 'Pawn', 6, 12),
(155, '3', 'F', '2', 'G', 'WHITE', 'King', 7, 12),
(156, '8', 'D', '6', 'D', 'BLACK', 'Queen', 6, 12),
(157, '2', 'G', '3', 'G', 'WHITE', 'King', 7, 12),
(158, '6', 'D', '7', 'C', 'BLACK', 'Queen', 6, 12),
(159, '1', 'F', '1', 'E', 'WHITE', 'Rook', 7, 12),
(160, '6', 'E', '4', 'E', 'BLACK', 'Pawn', 6, 12),
(161, '1', 'E', '4', 'E', 'WHITE', 'Rook', 7, 12),
(162, '8', 'E', '7', 'F', 'BLACK', 'King', 6, 12),
(163, '4', 'E', '5', 'E', 'WHITE', 'Rook', 7, 12),
(164, '7', 'C', '5', 'E', 'BLACK', 'Queen', 6, 12),
(165, '4', 'F', '5', 'E', 'WHITE', 'Pawn', 7, 12),
(166, '4', 'D', '5', 'E', 'BLACK', 'Pawn', 6, 12),
(167, '3', 'G', '4', 'G', 'WHITE', 'King', 7, 12),
(168, '7', 'F', '6', 'F', 'BLACK', 'King', 6, 12),
(169, '4', 'G', '5', 'G', 'WHITE', 'King', 7, 12),
(170, '6', 'F', '5', 'G', 'BLACK', 'King', 6, 12),
(171, '2', 'E', '4', 'E', 'WHITE', 'Pawn', 1, 13),
(172, '7', 'F', '5', 'F', 'BLACK', 'Pawn', 2, 13),
(173, '4', 'E', '5', 'E', 'WHITE', 'Pawn', 1, 13),
(174, '8', 'G', '6', 'F', 'BLACK', 'Knight', 2, 13),
(175, '1', 'E', '2', 'E', 'WHITE', 'King', 1, 13),
(176, '8', 'B', '6', 'C', 'BLACK', 'Knight', 2, 13),
(177, '2', 'E', '3', 'D', 'WHITE', 'King', 1, 13),
(178, '6', 'C', '5', 'E', 'BLACK', 'Knight', 2, 13),
(179, '2', 'E', '4', 'E', 'WHITE', 'Pawn', 1, 14),
(180, '7', 'F', '5', 'F', 'BLACK', 'Pawn', 2, 14),
(181, '1', 'G', '3', 'F', 'WHITE', 'Knight', 1, 14),
(182, '7', 'E', '6', 'E', 'BLACK', 'Pawn', 2, 14),
(183, '3', 'F', '5', 'E', 'WHITE', 'Knight', 1, 14),
(184, '8', 'F', '6', 'D', 'BLACK', 'Bishop', 2, 14),
(185, '5', 'E', '7', 'F', 'WHITE', 'Knight', 1, 14),
(186, '6', 'D', '3', 'G', 'BLACK', 'Bishop', 2, 14),
(187, '7', 'F', '8', 'D', 'WHITE', 'Knight', 1, 14),
(188, '8', 'G', '6', 'H', 'BLACK', 'Knight', 2, 14),
(189, '1', 'D', '5', 'H', 'WHITE', 'Queen', 1, 14),
(190, '6', 'H', '4', 'G', 'BLACK', 'Knight', 2, 14),
(191, '5', 'H', '8', 'E', 'WHITE', 'Queen', 1, 14),
(192, '2', 'E', '3', 'E', 'WHITE', 'Pawn', 10, 15),
(193, '8', 'G', '6', 'F', 'BLACK', 'Knight', 7, 15),
(194, '2', 'F', '3', 'F', 'WHITE', 'Pawn', 10, 15),
(195, '7', 'H', '5', 'H', 'BLACK', 'Pawn', 7, 15),
(196, '3', 'F', '4', 'F', 'WHITE', 'Pawn', 10, 15),
(197, '8', 'H', '6', 'H', 'BLACK', 'Rook', 7, 15),
(198, '3', 'E', '4', 'E', 'WHITE', 'Pawn', 10, 15),
(199, '6', 'H', '6', 'G', 'BLACK', 'Rook', 7, 15),
(200, '4', 'F', '5', 'F', 'WHITE', 'Pawn', 10, 15),
(201, '6', 'F', '4', 'E', 'BLACK', 'Knight', 7, 15),
(202, '2', 'D', '3', 'D', 'WHITE', 'Pawn', 10, 15),
(203, '4', 'E', '3', 'C', 'BLACK', 'Knight', 7, 15),
(204, '2', 'B', '3', 'C', 'WHITE', 'Pawn', 10, 15),
(205, '8', 'B', '6', 'C', 'BLACK', 'Knight', 7, 15),
(206, '5', 'F', '6', 'G', 'WHITE', 'Pawn', 10, 15),
(207, '6', 'C', '4', 'D', 'BLACK', 'Knight', 7, 15),
(208, '3', 'C', '4', 'D', 'WHITE', 'Pawn', 10, 15),
(209, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 7, 15),
(210, '2', 'H', '3', 'H', 'WHITE', 'Pawn', 10, 15),
(211, '8', 'C', '4', 'G', 'BLACK', 'Bishop', 7, 15),
(212, '1', 'G', '3', 'F', 'WHITE', 'Knight', 10, 15),
(213, '7', 'F', '6', 'G', 'BLACK', 'Pawn', 7, 15),
(214, '3', 'F', '5', 'E', 'WHITE', 'Knight', 10, 15),
(215, '4', 'G', '1', 'D', 'BLACK', 'Bishop', 7, 15),
(216, '3', 'H', '4', 'H', 'WHITE', 'Pawn', 10, 15),
(217, '8', 'D', '6', 'D', 'BLACK', 'Queen', 7, 15),
(218, '5', 'E', '6', 'G', 'WHITE', 'Knight', 10, 15),
(219, '6', 'D', '6', 'E', 'BLACK', 'Queen', 7, 15),
(220, '6', 'G', '7', 'E', 'WHITE', 'Knight', 10, 15),
(221, '6', 'E', '1', 'E', 'BLACK', 'Queen', 7, 15),
(222, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 7, 16),
(223, '7', 'E', '6', 'E', 'BLACK', 'Pawn', 11, 16),
(224, '1', 'G', '3', 'F', 'WHITE', 'Knight', 7, 16),
(225, '8', 'B', '6', 'C', 'BLACK', 'Knight', 11, 16),
(226, '2', 'H', '4', 'H', 'WHITE', 'Pawn', 7, 16),
(227, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 11, 16),
(228, '3', 'F', '5', 'G', 'WHITE', 'Knight', 7, 16),
(229, '7', 'H', '6', 'H', 'BLACK', 'Pawn', 11, 16),
(230, '5', 'G', '3', 'F', 'WHITE', 'Knight', 7, 16),
(231, '8', 'G', '6', 'F', 'BLACK', 'Knight', 11, 16),
(232, '1', 'D', '3', 'D', 'WHITE', 'Queen', 7, 16),
(233, '8', 'F', '4', 'B', 'BLACK', 'Bishop', 11, 16),
(234, '2', 'C', '3', 'C', 'WHITE', 'Pawn', 7, 16),
(235, '4', 'B', '6', 'D', 'BLACK', 'Bishop', 11, 16),
(236, '3', 'C', '4', 'C', 'WHITE', 'Pawn', 7, 16),
(237, '6', 'F', '4', 'E', 'BLACK', 'Knight', 11, 16),
(238, '3', 'D', '3', 'E', 'WHITE', 'Queen', 7, 16),
(239, '6', 'D', '4', 'B', 'BLACK', 'Bishop', 11, 16),
(240, '1', 'C', '2', 'D', 'WHITE', 'Bishop', 7, 16),
(241, '4', 'B', '2', 'D', 'BLACK', 'Bishop', 11, 16),
(242, '1', 'E', '2', 'D', 'WHITE', 'King', 7, 16),
(243, '4', 'E', '2', 'D', 'BLACK', 'Knight', 11, 16),
(244, '2', 'F', '3', 'F', 'WHITE', 'Pawn', 10, 17),
(245, '7', 'E', '5', 'E', 'BLACK', 'Pawn', 11, 17),
(246, '2', 'G', '3', 'G', 'WHITE', 'Pawn', 10, 17),
(247, '8', 'G', '6', 'F', 'BLACK', 'Knight', 11, 17),
(248, '2', 'A', '3', 'A', 'WHITE', 'Pawn', 10, 17),
(249, '8', 'F', '5', 'C', 'BLACK', 'Bishop', 11, 17),
(250, '3', 'A', '5', 'A', 'WHITE', 'Pawn', 10, 17),
(251, '5', 'E', '4', 'E', 'BLACK', 'Pawn', 11, 17),
(252, '2', 'B', '4', 'B', 'WHITE', 'Pawn', 10, 17),
(253, '5', 'C', '4', 'D', 'BLACK', 'Bishop', 11, 17),
(254, '4', 'B', '6', 'B', 'WHITE', 'Pawn', 10, 17),
(255, '7', 'A', '6', 'B', 'BLACK', 'Pawn', 11, 17),
(256, '2', 'C', '4', 'C', 'WHITE', 'Pawn', 10, 17),
(257, '4', 'E', '3', 'F', 'BLACK', 'Pawn', 11, 17),
(258, '1', 'C', '2', 'B', 'WHITE', 'Bishop', 10, 17),
(259, '3', 'F', '2', 'F', 'BLACK', 'Pawn', 11, 17),
(260, '2', 'B', '4', 'D', 'WHITE', 'Bishop', 10, 17),
(261, '2', 'F', '1', 'E', 'BLACK', 'Pawn', 11, 17),
(262, '1', 'G', '3', 'F', 'WHITE', 'Knight', 7, 18),
(263, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 12, 18),
(264, '3', 'F', '4', 'D', 'WHITE', 'Knight', 7, 18),
(265, '8', 'G', '6', 'F', 'BLACK', 'Knight', 12, 18),
(266, '2', 'E', '3', 'E', 'WHITE', 'Pawn', 7, 18),
(267, '7', 'E', '6', 'E', 'BLACK', 'Pawn', 12, 18),
(268, '1', 'F', '5', 'B', 'WHITE', 'Bishop', 7, 18),
(269, '8', 'C', '7', 'D', 'BLACK', 'Bishop', 12, 18),
(270, '2', 'A', '4', 'A', 'WHITE', 'Pawn', 7, 18),
(271, '7', 'D', '5', 'B', 'BLACK', 'Bishop', 12, 18),
(272, '4', 'A', '5', 'B', 'WHITE', 'Pawn', 7, 18),
(273, '7', 'C', '6', 'C', 'BLACK', 'Pawn', 12, 18),
(274, '2', 'C', '4', 'C', 'WHITE', 'Pawn', 7, 18),
(275, '5', 'D', '4', 'C', 'BLACK', 'Pawn', 12, 18),
(276, '1', 'B', '3', 'C', 'WHITE', 'Knight', 7, 18),
(277, '6', 'F', '5', 'D', 'BLACK', 'Knight', 12, 18),
(278, '2', 'H', '4', 'H', 'WHITE', 'Pawn', 7, 18),
(279, '8', 'F', '6', 'D', 'BLACK', 'Bishop', 12, 18),
(280, '1', 'H', '3', 'H', 'WHITE', 'Rook', 7, 18),
(281, '5', 'D', '3', 'C', 'BLACK', 'Knight', 12, 18),
(282, '2', 'D', '3', 'C', 'WHITE', 'Pawn', 7, 18),
(283, '6', 'E', '5', 'E', 'BLACK', 'Pawn', 12, 18),
(284, '2', 'E', '4', 'E', 'WHITE', 'Pawn', 14, 19),
(285, '7', 'B', '5', 'B', 'BLACK', 'Pawn', 15, 19),
(286, '4', 'D', '5', 'F', 'WHITE', 'Knight', 7, 18),
(287, '8', 'E', '8', 'F', 'BLACK', 'King', 12, 18),
(288, '3', 'E', '4', 'E', 'WHITE', 'Pawn', 7, 18),
(289, '1', 'G', '3', 'H', 'WHITE', 'Knight', 14, 19),
(290, '7', 'D', '6', 'D', 'BLACK', 'Pawn', 15, 19),
(291, '1', 'D', '3', 'F', 'WHITE', 'Queen', 14, 19),
(292, '6', 'C', '5', 'B', 'BLACK', 'Pawn', 12, 18),
(293, '3', 'H', '3', 'G', 'WHITE', 'Rook', 7, 18),
(294, '5', 'B', '4', 'B', 'BLACK', 'Pawn', 15, 19),
(295, '3', 'H', '5', 'G', 'WHITE', 'Knight', 14, 19),
(296, '8', 'B', '6', 'C', 'BLACK', 'Knight', 15, 19),
(297, '3', 'F', '7', 'F', 'WHITE', 'Queen', 14, 19),
(298, '8', 'E', '7', 'F', 'BLACK', 'King', 15, 19),
(299, '5', 'G', '7', 'F', 'WHITE', 'Knight', 14, 19),
(300, '7', 'G', '6', 'G', 'BLACK', 'Pawn', 12, 18),
(301, '5', 'F', '6', 'D', 'WHITE', 'Knight', 7, 18),
(302, '8', 'D', '4', 'H', 'BLACK', 'Queen', 12, 18),
(303, '6', 'D', '7', 'F', 'WHITE', 'Knight', 7, 18),
(304, '4', 'H', '1', 'H', 'BLACK', 'Queen', 12, 18),
(305, '3', 'G', '6', 'G', 'WHITE', 'Rook', 7, 18),
(306, '1', 'H', '1', 'E', 'BLACK', 'Queen', 12, 18),
(307, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 15, 20),
(308, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 14, 20),
(309, '2', 'B', '3', 'B', 'WHITE', 'Pawn', 15, 20),
(310, '8', 'G', '6', 'F', 'BLACK', 'Knight', 14, 20),
(311, '1', 'B', '3', 'A', 'WHITE', 'Knight', 15, 20),
(312, '7', 'C', '6', 'C', 'BLACK', 'Pawn', 14, 20),
(313, '1', 'D', '3', 'D', 'WHITE', 'Queen', 15, 20),
(314, '7', 'E', '6', 'E', 'BLACK', 'Pawn', 14, 20),
(315, '2', 'C', '4', 'C', 'WHITE', 'Pawn', 15, 20),
(316, '8', 'F', '3', 'A', 'BLACK', 'Bishop', 14, 20),
(317, '1', 'C', '5', 'G', 'WHITE', 'Bishop', 15, 20),
(318, '3', 'A', '7', 'E', 'BLACK', 'Bishop', 14, 20),
(319, '3', 'D', '3', 'F', 'WHITE', 'Queen', 15, 20),
(320, '6', 'F', '4', 'E', 'BLACK', 'Knight', 14, 20),
(321, '5', 'G', '7', 'E', 'WHITE', 'Bishop', 15, 20),
(322, '8', 'D', '7', 'E', 'BLACK', 'Queen', 14, 20),
(323, '2', 'E', '3', 'E', 'WHITE', 'Pawn', 15, 20),
(324, '5', 'D', '4', 'C', 'BLACK', 'Pawn', 14, 20),
(325, '3', 'F', '7', 'F', 'WHITE', 'Queen', 15, 20),
(326, '7', 'E', '7', 'F', 'BLACK', 'Queen', 14, 20),
(327, '1', 'A', '1', 'C', 'WHITE', 'Rook', 15, 20),
(328, '7', 'F', '2', 'F', 'BLACK', 'Queen', 14, 20),
(329, '1', 'C', '4', 'C', 'WHITE', 'Rook', 15, 20),
(330, '8', 'E', '7', 'D', 'BLACK', 'King', 14, 20),
(331, '1', 'E', '2', 'F', 'WHITE', 'King', 15, 20),
(332, '4', 'E', '2', 'F', 'BLACK', 'Knight', 14, 20),
(333, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 15, 21),
(334, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 7, 21),
(335, '1', 'D', '3', 'D', 'WHITE', 'Queen', 15, 21),
(336, '8', 'G', '6', 'F', 'BLACK', 'Knight', 7, 21),
(337, '1', 'B', '3', 'C', 'WHITE', 'Knight', 15, 21),
(338, '7', 'E', '6', 'E', 'BLACK', 'Pawn', 7, 21),
(339, '2', 'F', '3', 'F', 'WHITE', 'Pawn', 15, 21),
(340, '8', 'F', '4', 'B', 'BLACK', 'Bishop', 7, 21),
(341, '2', 'E', '4', 'E', 'WHITE', 'Pawn', 15, 21),
(342, '7', 'C', '6', 'C', 'BLACK', 'Pawn', 7, 21),
(343, '4', 'E', '5', 'D', 'WHITE', 'Pawn', 15, 21),
(344, '6', 'E', '5', 'D', 'BLACK', 'Pawn', 7, 21),
(345, '3', 'D', '3', 'E', 'WHITE', 'Queen', 15, 21),
(346, '8', 'E', '8', 'F', 'BLACK', 'King', 7, 21),
(347, '3', 'E', '2', 'E', 'WHITE', 'Queen', 15, 21),
(348, '7', 'H', '5', 'H', 'BLACK', 'Pawn', 7, 21),
(349, '2', 'E', '5', 'E', 'WHITE', 'Queen', 15, 21),
(350, '8', 'H', '6', 'H', 'BLACK', 'Rook', 7, 21),
(351, '1', 'C', '6', 'H', 'WHITE', 'Bishop', 15, 21),
(352, '7', 'G', '6', 'H', 'BLACK', 'Pawn', 7, 21),
(353, '5', 'E', '6', 'F', 'WHITE', 'Queen', 15, 21),
(354, '8', 'D', '6', 'F', 'BLACK', 'Queen', 7, 21),
(355, '2', 'H', '4', 'H', 'WHITE', 'Pawn', 15, 21),
(356, '6', 'F', '4', 'H', 'BLACK', 'Queen', 7, 21),
(357, '1', 'H', '4', 'H', 'WHITE', 'Rook', 15, 21),
(358, '7', 'F', '5', 'F', 'BLACK', 'Pawn', 7, 21),
(359, '4', 'H', '5', 'H', 'WHITE', 'Rook', 15, 21),
(360, '8', 'F', '7', 'G', 'BLACK', 'King', 7, 21),
(361, '1', 'G', '3', 'H', 'WHITE', 'Knight', 15, 21),
(362, '7', 'A', '5', 'A', 'BLACK', 'Pawn', 7, 21),
(363, '1', 'A', '1', 'D', 'WHITE', 'Rook', 15, 21),
(364, '7', 'G', '6', 'G', 'BLACK', 'King', 7, 21),
(365, '1', 'D', '3', 'D', 'WHITE', 'Rook', 15, 21),
(366, '6', 'G', '5', 'H', 'BLACK', 'King', 7, 21),
(367, '3', 'D', '3', 'E', 'WHITE', 'Rook', 15, 21),
(368, '5', 'H', '6', 'G', 'BLACK', 'King', 7, 21),
(369, '3', 'E', '6', 'E', 'WHITE', 'Rook', 15, 21),
(370, '8', 'C', '6', 'E', 'BLACK', 'Bishop', 7, 21),
(371, '3', 'H', '5', 'G', 'WHITE', 'Knight', 15, 21),
(372, '6', 'G', '5', 'G', 'BLACK', 'King', 7, 21),
(373, '3', 'C', '4', 'E', 'WHITE', 'Knight', 15, 21),
(374, '5', 'F', '4', 'E', 'BLACK', 'Pawn', 7, 21),
(375, '2', 'C', '3', 'C', 'WHITE', 'Pawn', 15, 21),
(376, '4', 'B', '3', 'C', 'BLACK', 'Bishop', 7, 21),
(377, '3', 'F', '4', 'F', 'WHITE', 'Pawn', 15, 21),
(378, '3', 'C', '1', 'E', 'BLACK', 'Bishop', 7, 21),
(379, '1', 'G', '3', 'F', 'WHITE', 'Knight', 7, 22),
(380, '7', 'D', '5', 'D', 'BLACK', 'Pawn', 14, 22),
(381, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 7, 22),
(382, '8', 'C', '4', 'G', 'BLACK', 'Bishop', 14, 22),
(383, '2', 'E', '3', 'E', 'WHITE', 'Pawn', 7, 22),
(384, '4', 'G', '3', 'F', 'BLACK', 'Bishop', 14, 22),
(385, '1', 'F', '5', 'B', 'WHITE', 'Bishop', 7, 22),
(386, '3', 'F', '1', 'D', 'BLACK', 'Bishop', 14, 22),
(387, '5', 'B', '8', 'E', 'WHITE', 'Bishop', 7, 22),
(388, '2', 'F', '4', 'F', 'WHITE', 'Pawn', 7, 23),
(389, '7', 'F', '5', 'F', 'BLACK', 'Pawn', 16, 23),
(390, '1', 'G', '3', 'F', 'WHITE', 'Knight', 7, 23),
(391, '7', 'G', '6', 'G', 'BLACK', 'Pawn', 16, 23),
(392, '3', 'F', '5', 'E', 'WHITE', 'Knight', 7, 23),
(393, '8', 'G', '6', 'H', 'BLACK', 'Knight', 16, 23),
(394, '2', 'D', '4', 'D', 'WHITE', 'Pawn', 7, 23),
(395, '8', 'F', '7', 'G', 'BLACK', 'Bishop', 16, 23),
(396, '2', 'B', '3', 'B', 'WHITE', 'Pawn', 7, 23),
(397, '7', 'G', '5', 'E', 'BLACK', 'Bishop', 16, 23),
(398, '1', 'C', '3', 'A', 'WHITE', 'Bishop', 7, 23),
(399, '5', 'E', '4', 'F', 'BLACK', 'Bishop', 16, 23),
(400, '2', 'E', '3', 'E', 'WHITE', 'Pawn', 7, 23),
(401, '4', 'F', '5', 'G', 'BLACK', 'Bishop', 16, 23),
(402, '1', 'F', '5', 'B', 'WHITE', 'Bishop', 7, 23),
(403, '6', 'H', '7', 'F', 'BLACK', 'Knight', 16, 23),
(404, '2', 'C', '4', 'C', 'WHITE', 'Pawn', 7, 23),
(405, '7', 'F', '6', 'D', 'BLACK', 'Knight', 16, 23),
(406, '5', 'B', '7', 'D', 'WHITE', 'Bishop', 7, 23),
(407, '8', 'C', '7', 'D', 'BLACK', 'Bishop', 16, 23),
(408, '2', 'H', '4', 'H', 'WHITE', 'Pawn', 7, 23),
(409, '6', 'D', '4', 'E', 'BLACK', 'Knight', 16, 23),
(410, '4', 'H', '5', 'G', 'WHITE', 'Pawn', 7, 23),
(411, '4', 'E', '3', 'C', 'BLACK', 'Knight', 16, 23),
(412, '1', 'B', '3', 'C', 'WHITE', 'Knight', 7, 23),
(413, '7', 'D', '6', 'C', 'BLACK', 'Bishop', 16, 23),
(414, '3', 'C', '5', 'D', 'WHITE', 'Knight', 7, 23),
(415, '7', 'H', '6', 'H', 'BLACK', 'Pawn', 16, 23),
(416, '5', 'G', '6', 'H', 'WHITE', 'Pawn', 7, 23),
(417, '8', 'H', '6', 'H', 'BLACK', 'Rook', 16, 23),
(418, '1', 'H', '6', 'H', 'WHITE', 'Rook', 7, 23),
(419, '6', 'G', '5', 'G', 'BLACK', 'Pawn', 16, 23),
(420, '6', 'H', '8', 'H', 'WHITE', 'Rook', 7, 23),
(421, '6', 'C', '5', 'D', 'BLACK', 'Bishop', 16, 23),
(422, '8', 'H', '8', 'E', 'WHITE', 'Rook', 7, 23);

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE `friendship` (
  `idFriendShip` int(11) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `friendship`
--

INSERT INTO `friendship` (`idFriendShip`, `date`) VALUES
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `idMessage` int(11) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `Player_id` int(11) NOT NULL,
  `PlayerHasFriend_idFriendShip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`idMessage`, `content`, `time`, `Player_id`, `PlayerHasFriend_idFriendShip`) VALUES
(1, 'sdasdadasdsadas', '2024-02-01 11:39:37', 2, 5),
(2, 'bok', '2024-02-02 12:10:26', 1, 5),
(3, 'i sta sada', '2024-02-02 12:11:51', 1, 5),
(4, 'i sta sada', '2024-02-02 12:13:05', 1, 5),
(5, 'wtf', '2024-02-02 12:13:10', 1, 5),
(6, 'hahahahah ovo radi', '2024-02-02 12:13:24', 2, 5),
(7, 'asdasdamfg[dkgpdfkgpdfmgpdfmgpdmgpdmgpdmgpdgmdpogmdpofgmdpomgdpogmdpogmfpogmdpfogmdpfogmdpomgdpgmdpfogpdogmpdmgfd', '2024-02-02 12:26:35', 1, 5),
(8, 'zz', '2024-02-02 12:42:03', 1, 5),
(9, 'Cao lazo', '2024-02-02 13:06:13', 6, 7),
(10, 'Bok mako', '2024-02-02 13:06:35', 7, 7),
(11, 'cao opet', '2024-02-02 13:17:58', 7, 7),
(12, 'de si lazicee', '2024-02-02 13:18:03', 6, 7),
(13, 'cao igore', '2024-02-02 23:13:48', 7, 8),
(14, 'cao', '2024-02-02 23:14:00', 8, 8),
(15, 'kako si', '2024-02-02 23:14:02', 7, 8),
(16, ':(', '2024-02-02 23:14:18', 8, 8),
(17, 'ee', '2024-02-02 23:19:22', 8, 8),
(18, 'awd', '2024-02-02 23:19:40', 8, 8),
(19, 'test', '2024-02-04 22:27:49', 1, 5),
(20, 'okej', '2024-02-04 22:28:41', 1, 5),
(21, 'Cao milose, kako si?', '2024-02-04 22:51:52', 7, 9),
(22, 'Cao lazo dobar sam', '2024-02-04 22:52:06', 10, 9),
(23, 'kako si ti', '2024-02-04 22:52:11', 10, 9),
(24, 'zena deca?', '2024-02-04 22:52:14', 10, 9),
(25, 'Dobro sam, hvala na pitanju.', '2024-02-04 22:52:21', 7, 9),
(26, 'Cao eror, nadam se da si dobro', '2024-02-04 22:52:30', 7, 12),
(27, 'zena deca?', '2024-02-04 22:52:32', 10, 9),
(28, 'Sve super', '2024-02-04 22:54:48', 7, 9),
(29, 'cao', '2024-02-04 23:04:26', 15, 13),
(30, 'kako si', '2024-02-04 23:04:33', 15, 13),
(31, 'eo dobro je', '2024-02-04 23:04:37', 14, 13),
(32, 'ocemo jednu partiju ', '2024-02-04 23:04:41', 15, 13),
(33, 'disem', '2024-02-04 23:04:42', 14, 13),
(34, 'hajde', '2024-02-04 23:04:46', 14, 13),
(35, 'da se igramo', '2024-02-04 23:04:47', 15, 13),
(36, 'aj posalji sliku', '2024-02-04 23:04:53', 15, 13),
(37, 'evo', '2024-02-04 23:22:31', 14, 13),
(38, 'evo prihvatio sam', '2024-02-04 23:22:33', 7, 15),
(39, 'desi lazarche', '2024-02-04 23:22:47', 14, 15),
(40, 'kako dobro igras', '2024-02-04 23:22:58', 14, 15);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `firstName`, `lastName`, `email`, `username`, `password`, `status`, `profileImage`) VALUES
(1, 'qq', 'qq', 'qq', 'qq', '$2a$10$t3WmXg7QHN5wbvgE0eoNPuAF.yQSSi0cQF2mfTa5dbY0GwX2DjNn2', 0, NULL),
(2, 'aa', 'aa', 'aa', 'aa', '$2a$10$9SGnkWF23oNztP3QUDCgLegoKcJEhho87O/IKvxjTkqEuTFZ8SX7K', 0, NULL),
(3, 'cc', 'cc', 'cc', 'cc', '$2a$10$qc02j8cxRrb3EM2YvhQ81eBB6jgI8S2heNSlBF67lhOWG97J9pJli', 0, NULL),
(4, 'cc', 'cc', 'cc', 'cc', '$2a$10$BXfkbaMKBoOOWWtYjCQcVOgT9f7V3E5zNbTRK/fsxeRg4u/EbpWrW', 0, NULL),
(5, 'ss', 'ss', 'ss', 'ss', '$2a$10$uoAZVjYwJx0zac0Alm8RouTCUooA/xrJUQxV0OgZ75JKKBogpv8j.', 0, NULL),
(6, 'Marija', 'Andric', 'maka', 'maka', '$2a$10$.K1yuvB1XvZbeouNJICDqOsS0hvmD2cGHr.Y5bVDr.AqI5tSCHzvC', 0, NULL),
(7, 'Lazar', 'Borovica', 'lazarborovica007@gmail.com', 'lazar', '$2a$10$VhqMwVyiOrYhuu793WDilurYBrW/nDpFM1OXsSpMVEikVc/EVSE0S', 0, NULL),
(8, 'igor', 'kandic', 'igor@matf.com', 'igor', '$2a$10$4CGGu2wUWiEyXvXNdFtGAeTVG8aIIzdDA0BJGd33HQjweGB9iis0a', 0, NULL),
(9, 'asd', 'asd', 'asd@asd,asd', 'asd', '$2a$10$Ieai1Reg6bLwiafEN3nfWOjOJUT1pGwThDVMEx/YROM7PusZG6SVq', 0, NULL),
(10, 'Milos', 'Lazarevic', 'miloslazarevic410@gmail.com', 's0l1m', '$2a$10$wDPmcBdbwkF6jCqc6gX8JurJTcgN3pp4Om6pvvS8O7Q907KBA3wYi', 0, NULL),
(11, 'igi', 'igi', 'igoreror9@gmail.com', 'igi9', '$2a$10$I7JRJfyGrK5WiDx/8w6uv.kGhW.sO2ihbXDSKwfLVoCGO/zyYb2mm', 0, NULL),
(12, 'Luka', 'Shiriyoski', 'sirijoskil@gmail.com', 'Kipro', '$2a$10$MefA/EnG.uZZ34ptmYPhce2U5sPmPWUbiWIstsGWh.c7SrvGFKEri', 0, NULL),
(13, 'filip', 'graic', 'graicfilip@gmail.com', 'filip', '$2a$10$DInO1Xy.wpPtR1d3bn.JruhcI14WtCbf2k8J342mfZRmJaG21zEtG', 0, NULL),
(14, 'Mihailo', 'Babic', 'mihailo@gmail.com', 'mihailo', '$2a$10$RDKbC9YWe9.xnUmb2KXi2uTuIUQgosVSpbKP9BjKKQnICuFJv6BeO', 0, NULL),
(15, 'Srdjan', 'Drazic', 'srdjandrazic251@gmail.com', 'draza', '$2a$10$tDOcdl37cMDlEfVOTHuzGuri8FwT6o1xREPwuzxdY1zzEcnRnb/U.', 0, NULL),
(16, 'Sergej', 'Hrvojevic', 'sergejhrvojevic@gmail.com', 'sergej', '$2a$10$hmWUHiBFk0e35gpMF9eKPe8PjPqBrsS6rUFfvLkJzGXpQH49avyDq', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `playerhaschessmatch`
--

CREATE TABLE `playerhaschessmatch` (
  `idtable1` int(11) NOT NULL,
  `Player_id` int(11) NOT NULL,
  `ChessMatch_id` int(11) NOT NULL,
  `won` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `playerhaschessmatch`
--

INSERT INTO `playerhaschessmatch` (`idtable1`, `Player_id`, `ChessMatch_id`, `won`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 0),
(3, 1, 2, 0),
(4, 2, 2, 1),
(5, 1, 3, -1),
(6, 2, 3, -1),
(7, 7, 4, 1),
(8, 8, 4, 0),
(9, 8, 5, -1),
(10, 7, 5, -1),
(11, 8, 6, -1),
(12, 7, 6, -1),
(13, 8, 7, 1),
(14, 7, 7, 0),
(15, 7, 8, 1),
(16, 8, 8, 0),
(17, 2, 9, 0),
(18, 8, 9, 1),
(19, 7, 10, 1),
(20, 9, 10, 0),
(21, 7, 11, -1),
(22, 6, 11, -1),
(23, 7, 12, 0),
(24, 6, 12, 1),
(25, 1, 13, -1),
(26, 2, 13, -1),
(27, 1, 14, 1),
(28, 2, 14, 0),
(29, 10, 15, 0),
(30, 7, 15, 1),
(31, 7, 16, 0),
(32, 11, 16, 1),
(33, 10, 17, 0),
(34, 11, 17, 1),
(35, 7, 18, 0),
(36, 12, 18, 1),
(37, 14, 19, 1),
(38, 15, 19, 0),
(39, 15, 20, 0),
(40, 14, 20, 1),
(41, 15, 21, 0),
(42, 7, 21, 1),
(43, 7, 22, 1),
(44, 14, 22, 0),
(45, 7, 23, 1),
(46, 16, 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `playerhasfriend`
--

CREATE TABLE `playerhasfriend` (
  `idtable1` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `Player_id` int(11) NOT NULL,
  `PlayerHasFriend_idFriendShip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `playerhasfriend`
--

INSERT INTO `playerhasfriend` (`idtable1`, `status`, `Player_id`, `PlayerHasFriend_idFriendShip`) VALUES
(9, 'friend', 1, 5),
(10, 'friend', 2, 5),
(11, 'inviter', 5, 6),
(12, 'waiting', 2, 6),
(13, 'friend', 7, 7),
(14, 'friend', 6, 7),
(15, 'friend', 7, 8),
(16, 'friend', 8, 8),
(17, 'friend', 10, 9),
(18, 'friend', 7, 9),
(19, 'inviter', 10, 10),
(20, 'waiting', 8, 10),
(21, 'inviter', 10, 11),
(22, 'waiting', 9, 11),
(23, 'friend', 7, 12),
(24, 'friend', 11, 12),
(25, 'friend', 14, 13),
(26, 'friend', 15, 13),
(27, 'inviter', 15, 14),
(28, 'waiting', 7, 14),
(29, 'friend', 14, 15),
(30, 'friend', 7, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chessmatch`
--
ALTER TABLE `chessmatch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chessmove`
--
ALTER TABLE `chessmove`
  ADD PRIMARY KEY (`idMove`),
  ADD KEY `fk_Move_Player1_idx` (`idPlayer`),
  ADD KEY `fk_Move_Match1_idx` (`idMatch`);

--
-- Indexes for table `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`idFriendShip`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`idMessage`),
  ADD KEY `fk_Message_Player1_idx` (`Player_id`),
  ADD KEY `fk_Message_PlayerHasFriend1_idx` (`PlayerHasFriend_idFriendShip`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playerhaschessmatch`
--
ALTER TABLE `playerhaschessmatch`
  ADD PRIMARY KEY (`idtable1`),
  ADD KEY `fk_table1_Player1_idx` (`Player_id`),
  ADD KEY `fk_table1_ChessMatch1_idx` (`ChessMatch_id`);

--
-- Indexes for table `playerhasfriend`
--
ALTER TABLE `playerhasfriend`
  ADD PRIMARY KEY (`idtable1`),
  ADD KEY `fk_table1_Player2_idx` (`Player_id`),
  ADD KEY `fk_table1_PlayerHasFriend1_idx` (`PlayerHasFriend_idFriendShip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chessmatch`
--
ALTER TABLE `chessmatch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `chessmove`
--
ALTER TABLE `chessmove`
  MODIFY `idMove` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `friendship`
--
ALTER TABLE `friendship`
  MODIFY `idFriendShip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `playerhaschessmatch`
--
ALTER TABLE `playerhaschessmatch`
  MODIFY `idtable1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `playerhasfriend`
--
ALTER TABLE `playerhasfriend`
  MODIFY `idtable1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chessmove`
--
ALTER TABLE `chessmove`
  ADD CONSTRAINT `fk_Move_Match1` FOREIGN KEY (`idMatch`) REFERENCES `chessmatch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Move_Player1` FOREIGN KEY (`idPlayer`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_Message_Player1` FOREIGN KEY (`Player_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Message_PlayerHasFriend1` FOREIGN KEY (`PlayerHasFriend_idFriendShip`) REFERENCES `friendship` (`idFriendShip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `playerhaschessmatch`
--
ALTER TABLE `playerhaschessmatch`
  ADD CONSTRAINT `fk_table1_ChessMatch1` FOREIGN KEY (`ChessMatch_id`) REFERENCES `chessmatch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_Player1` FOREIGN KEY (`Player_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `playerhasfriend`
--
ALTER TABLE `playerhasfriend`
  ADD CONSTRAINT `fk_table1_Player2` FOREIGN KEY (`Player_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_PlayerHasFriend1` FOREIGN KEY (`PlayerHasFriend_idFriendShip`) REFERENCES `friendship` (`idFriendShip`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
