-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2026 at 09:13 AM
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
-- Database: `urenregistratie`
--

-- --------------------------------------------------------

--
-- Table structure for table `klanten`
--

CREATE TABLE `klanten` (
  `id` int(11) NOT NULL,
  `bedrijfsnaam` varchar(255) DEFAULT NULL,
  `voornaam` varchar(100) DEFAULT NULL,
  `tussenvoegsel` varchar(50) DEFAULT NULL,
  `achternaam` varchar(100) DEFAULT NULL,
  `functie` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefoonnummer` varchar(50) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klanten`
--

INSERT INTO `klanten` (`id`, `bedrijfsnaam`, `voornaam`, `tussenvoegsel`, `achternaam`, `functie`, `email`, `telefoonnummer`, `adres`) VALUES
(3, 'Gilde', 'Dillan', '', 'Sampers', 'IT-expert', 'Dillan.sampers@student.gildeopleidingen.nl', '-', 'Melick'),
(4, 'wd', 'dwfsf', 'fdv', 'dfs', 'df', 'test@test.com', 'dss', 'dsfdgs'),
(6, 'wdefw', 'efgr', 'efgrh', 'feg', 'wefwr', 'dillan@gamdkgb.com', 'ggsfdhgf', 'fdgsffd');

--
-- Triggers `klanten`
--
DELIMITER $$
CREATE TRIGGER `before_klanten_insert` BEFORE INSERT ON `klanten` FOR EACH ROW BEGIN
    -- Check if the new email matches the regular expression for a valid email
    IF NEW.email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
        -- If it doesn't match, throw an error and stop the insert
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Database Error: Invalid email address format.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_klanten_update` BEFORE UPDATE ON `klanten` FOR EACH ROW BEGIN
    -- Check if the updated email matches the regular expression
    IF NEW.email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
        -- If it doesn't match, throw an error and stop the update
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Database Error: Invalid email address format.';
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klanten`
--
ALTER TABLE `klanten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
