-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 19, 2026 at 10:43 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usp3`
--

-- --------------------------------------------------------

--
-- Table structure for table `facturen`
--

DROP TABLE IF EXISTS `facturen`;
CREATE TABLE IF NOT EXISTS `facturen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opdracht_id` int NOT NULL,
  `factuurdatum` date NOT NULL,
  `totaalbedrag` decimal(10,2) NOT NULL,
  `btw_tarief` decimal(5,2) NOT NULL,
  `betaalstatus` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vervaldatum` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facturen`
--

INSERT INTO `facturen` (`id`, `opdracht_id`, `factuurdatum`, `totaalbedrag`, `btw_tarief`, `betaalstatus`, `vervaldatum`) VALUES
(1, 123, '2026-03-19', 1500.00, 21.00, 'open', '2026-04-19'),
(2, 124, '2026-03-20', 750.50, 9.00, 'betaald', '2026-04-20'),
(3, 101, '2026-01-10', 1200.00, 21.00, 'betaald', '2026-02-10'),
(4, 102, '2026-01-15', 850.50, 9.00, 'open', '2026-02-15'),
(5, 103, '2026-01-20', 500.00, 21.00, 'betaald', '2026-02-20'),
(6, 104, '2026-02-01', 1500.75, 21.00, 'te laat', '2026-03-01'),
(7, 105, '2026-02-05', 300.00, 9.00, 'open', '2026-03-05'),
(45, 1, '2026-03-01', 1200.00, 21.00, 'Open', '2026-03-31'),
(46, 2, '2026-03-05', 850.50, 21.00, 'Betaald', '2026-04-05'),
(47, 3, '2026-03-10', 430.75, 21.00, 'Open', '2026-04-10'),
(48, 1, '2026-03-12', 2150.00, 21.00, 'Betaald', '2026-04-12'),
(49, 2, '2026-03-15', 999.99, 21.00, 'Open', '2026-04-15');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
