-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 26, 2026 at 11:47 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `medewerkers`
--

DROP TABLE IF EXISTS `medewerkers`;
CREATE TABLE IF NOT EXISTS `medewerkers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `functie` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefoon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medewerkers`
--

INSERT INTO `medewerkers` (`id`, `naam`, `functie`, `email`, `telefoon`) VALUES
(2, 'Jan Jansen', 'developer', 'jan@bedrijf.nl', '0612345678'),
(3, 'Lisa de Vries', 'Designer', 'lisa@bedrijf.nl', '0687654321');

-- --------------------------------------------------------

--
-- Table structure for table `opdrachten`
--

DROP TABLE IF EXISTS `opdrachten`;
CREATE TABLE IF NOT EXISTS `opdrachten` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `klant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startdatum` date DEFAULT NULL,
  `einddatum` date DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `omschrijving` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `opdrachten`
--

INSERT INTO `opdrachten` (`id`, `naam`, `klant`, `startdatum`, `einddatum`, `status`, `omschrijving`) VALUES
(1, 'website maken', 'bedrijf X', '2026-03-01', '2026-03-15', 'lopend', ''),
(2, 'website maken', 'bedrijf X', '2026-03-01', '2026-03-15', 'lopend', ''),
(3, 'app ontwikkelen', 'bedrijf Y', '2026-03-05', '2026-03-25', 'plan', ''),
(4, 'app ontwikkelen', 'bedrijf Y', '2026-03-05', '2026-03-25', 'plan', '');

-- --------------------------------------------------------

--
-- Table structure for table `urenregistratie`
--

DROP TABLE IF EXISTS `urenregistratie`;
CREATE TABLE IF NOT EXISTS `urenregistratie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medewerker_id` int NOT NULL,
  `opdracht_id` int NOT NULL,
  `datum` date NOT NULL,
  `uren` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `urenregistratie`
--

INSERT INTO `urenregistratie` (`id`, `medewerker_id`, `opdracht_id`, `datum`, `uren`) VALUES
(1, 1, 1, '2026-03-01', 8.00),
(2, 2, 2, '2026-03-02', 6.50),
(3, 3, 3, '2026-03-03', 7.00);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
