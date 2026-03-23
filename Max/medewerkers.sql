-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2026 at 01:24 PM
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
-- Database: `gop3`
--

-- --------------------------------------------------------

--
-- Table structure for table `medewerkers`
--

CREATE TABLE `medewerkers` (
  `ID` int(11) NOT NULL,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(15) DEFAULT NULL,
  `Achternaam` varchar(100) NOT NULL,
  `Geboortedatum` date NOT NULL,
  `Functie` varchar(100) DEFAULT NULL,
  `Werkmail` varchar(255) NOT NULL,
  `Kantoorruimte` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medewerkers`
--

INSERT INTO `medewerkers` (`ID`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Geboortedatum`, `Functie`, `Werkmail`, `Kantoorruimte`) VALUES
(1, 'Jan', 'van', 'Dijk', '1985-05-12', 'Manager', 'jan.vandijk@bedrijf.nl', 'A.1.01'),
(2, 'Anouk', NULL, 'Bakker', '1990-03-22', 'Developer', 'anouk.bakker@bedrijf.nl', 'B.2.05'),
(3, 'Pieter', 'de', 'Vries', '1978-11-02', 'Designer', 'pieter.devries@bedrijf.nl', 'A.1.02'),
(4, 'Sanne', NULL, 'Visser', '1995-07-15', 'HR Advisor', 'sanne.visser@bedrijf.nl', 'C.3.10'),
(5, 'Thomas', 'ter', 'Horst', '1982-01-30', 'Developer', 'thomas.terhorst@bedrijf.nl', 'B.2.05'),
(6, 'Lisa', NULL, 'Smit', '1988-09-12', 'Marketing', 'lisa.smit@bedrijf.nl', 'D.1.04'),
(7, 'Bram', 'van der', 'Meer', '1992-04-05', 'Sales', 'bram.vandermeer@bedrijf.nl', 'E.2.01'),
(8, 'Maaike', NULL, 'Hendriks', '1980-12-24', 'Finance', 'maaike.hendriks@bedrijf.nl', 'C.3.11'),
(9, 'Lars', NULL, 'Jansen', '1987-06-18', 'Developer', 'lars.jansen@bedrijf.nl', 'B.2.06'),
(10, 'Sophie', 'de', 'Jong', '1993-02-14', 'Support', 'sophie.dejong@bedrijf.nl', 'A.1.05'),
(11, 'Kevin', NULL, 'Willems', '1991-08-27', 'IT Support', 'kevin.willems@bedrijf.nl', 'B.2.08'),
(12, 'Eva', 'van', 'Leeuwen', '1984-10-10', 'Product Owner', 'eva.vanleeuwen@bedrijf.nl', 'D.1.02'),
(13, 'Daan', NULL, 'Peters', '1975-05-03', 'Director', 'daan.peters@bedrijf.nl', 'F.4.01'),
(14, 'Tess', 'van den', 'Berg', '1996-12-01', 'Junior Dev', 'tess.vandenberg@bedrijf.nl', 'B.2.06'),
(15, 'Milan', NULL, 'Bos', '1989-03-19', 'Accountant', 'milan.bos@bedrijf.nl', 'C.3.12'),
(16, 'Julia', NULL, 'Mulder', '1994-11-25', 'Recruiter', 'julia.mulder@bedrijf.nl', 'C.3.10'),
(17, 'Jesse', 'de', 'Groot', '1981-07-08', 'Legal', 'jesse.degroot@bedrijf.nl', 'E.2.04'),
(18, 'Emma', NULL, 'Dekker', '1992-01-12', 'Marketing', 'emma.dekker@bedrijf.nl', 'D.1.04'),
(19, 'Luuk', NULL, 'Hermans', '1986-09-30', 'Developer', 'luuk.hermans@bedrijf.nl', 'B.2.07'),
(20, 'Zoë', 'van', 'Vliet', '1997-04-21', 'Intern', 'zoe.vanvliet@bedrijf.nl', 'B.2.09'),
(21, 'Ruben', NULL, 'Prins', '1983-06-05', 'Sales', 'ruben.prins@bedrijf.nl', 'E.2.01'),
(22, 'Sara', 'te', 'Loo', '1990-10-15', 'Designer', 'sara.teloo@bedrijf.nl', 'A.1.03'),
(23, 'Thijs', NULL, 'Koning', '1979-02-28', 'Manager', 'thijs.koning@bedrijf.nl', 'A.1.01'),
(24, 'Nina', NULL, 'Baas', '1994-08-11', 'Copywriter', 'nina.baas@bedrijf.nl', 'D.1.05'),
(25, 'Finn', 'de', 'Wit', '1991-05-20', 'Security', 'finn.dewit@bedrijf.nl', 'B.2.10'),
(26, 'Nick', '', 'Willems', '2009-04-08', 'IT-Expert', 'Nick.Willems1@student.gildeopleidingen.nl', 'B.03'),
(27, 'Dillan', '', 'Sampers', '2005-11-18', 'IT-Expert', 'Dillan.Sampers@student.gildeopleidingen.nl', 'B.03'),
(28, 'Max', '', 'Nikoliszyn', '2006-03-16', 'Software-Dev', 'max.nikoliszyn@student.gildeopleidingen.nl', 'B.03'),
(29, 'Nino', '', 'Slaats', '2004-05-31', 'Software-Dev', 'Nino.Slaats@student.gildeopleidingen.nl', 'B.03'),
(30, 'Timur', '', 'Burek', '2008-09-29', 'Software-Dev', 'Timur.Burek@student.gildeopleidingen.nl', 'B.03'),
(31, 'Zaid', '', 'Oulad Hadj Baraka', '2004-06-21', 'IT-Expert', 'Zaid.Oulad.Hadj.Baraka@student.gildeopleidingen.nl', 'B.03'),
(32, 'Raymond', '', 'Marx', '1973-10-01', 'Software-Dev', 'r.marx@rocgilde.nl', 'B0.06'),
(33, 'Rosa', 'de', 'Bruin', '2007-09-03', 'Software-Dev', 'RosadeBruin@student.gildeopleidingen.nl', 'B.03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Werkmail` (`Werkmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medewerkers`
--
ALTER TABLE `medewerkers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
