-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 26 mrt 2026 om 11:46
-- Serverversie: 8.4.7
-- PHP-versie: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `werkapparatuur`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `apparatuur`
--

DROP TABLE IF EXISTS `apparatuur`;
CREATE TABLE IF NOT EXISTS `apparatuur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apparaat_naam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serienummer` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aanschafdatum` date NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `apparatuur`
--

INSERT INTO `apparatuur` (`id`, `apparaat_naam`, `serienummer`, `type`, `aanschafdatum`, `status`) VALUES
(1, 'Dell Latitude 5420', 'SN-992811', 'Laptop', '2025-01-15', 'In gebruik'),
(2, 'HP ProBook 450', 'SN-112233', 'Laptop', '2025-02-10', 'Beschikbaar'),
(3, 'Apple MacBook Air M2', 'AAPL-QWERTY', 'Laptop', '2025-03-05', 'In reparatie'),
(4, 'Logitech MX Master 3', 'MSE-8877', 'Muis', '2026-01-20', 'Beschikbaar'),
(5, 'Samsung Odyssey G5', 'MON-554433', 'Monitor', '2024-11-12', 'In gebruik'),
(6, 'iPhone 15 Pro', 'IPH-998877', 'Telefoon', '2025-06-01', 'Uitgeleend'),
(7, 'Lenovo ThinkPad X1', 'SN-445566', 'Laptop', '2025-08-20', 'Beschikbaar'),
(8, 'Dell UltraSharp 27', 'MON-1122', 'Monitor', '2024-09-30', 'Defect'),
(9, 'Jabra Evolve 75', 'HSET-5566', 'Headset', '2026-02-14', 'In gebruik'),
(10, 'iPad Pro 12.9', 'TAB-443322', 'Tablet', '2025-12-25', 'Beschikbaar');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
