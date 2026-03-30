-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2026 at 10:23 AM
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
-- Table structure for table `apparatuur`
--

CREATE TABLE `apparatuur` (
  `id` int(11) NOT NULL,
  `apparaat_naam` varchar(100) NOT NULL,
  `serienummer` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `aanschafdatum` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apparatuur`
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

-- --------------------------------------------------------

--
-- Table structure for table `facturen`
--

CREATE TABLE `facturen` (
  `id` int(11) NOT NULL,
  `opdracht_id` int(11) NOT NULL,
  `factuurdatum` date NOT NULL,
  `totaalbedrag` decimal(10,2) NOT NULL,
  `btw_tarief` decimal(5,2) NOT NULL,
  `betaalstatus` varchar(50) NOT NULL,
  `vervaldatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
    IF NEW.email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}$' THEN
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
    IF NEW.email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}$' THEN
        -- If it doesn't match, throw an error and stop the update
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Database Error: Invalid email address format.';
    END IF;
END
$$
DELIMITER ;

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
(33, 'Rosa', 'de', 'Bruin', '2007-09-03', 'Software-Dev', 'RosadeBruin@student.gildeopleidingen.nl', 'B.03');

-- --------------------------------------------------------

--
-- Table structure for table `opdrachten`
--

CREATE TABLE `opdrachten` (
  `ID` int(11) NOT NULL,
  `Klantnaam` varchar(100) NOT NULL,
  `Titel` varchar(155) NOT NULL,
  `Omschrijving` text DEFAULT NULL,
  `Aanvraagdatum` date DEFAULT NULL,
  `Benodigde_kennis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opdrachten`
--

INSERT INTO `opdrachten` (`ID`, `Klantnaam`, `Titel`, `Omschrijving`, `Aanvraagdatum`, `Benodigde_kennis`) VALUES
(1, 'TechSolutions', 'Frontend Update', 'Nieuwe UI componenten bouwen.', '2026-01-01', 'React, CSS'),
(2, 'Bakker Janssen', 'Webshop Fix', 'Afrekenproces loopt vast.', '2026-01-02', 'PHP, MySQL'),
(3, 'Gemeente Utrecht', 'Open Data Portal', 'API koppelen aan burgerdata.', '2026-01-03', 'Python, REST'),
(4, 'Green Energy', 'Solar Dashboard', 'Visualisatie van opwekking.', '2026-01-04', 'D3.js, JS'),
(5, 'SnelLogistiek', 'Route Planner', 'Algoritme voor bezorging.', '2026-01-05', 'Java, OptaPlanner'),
(6, 'De Vries IT', 'Firewall Setup', 'Configuratie van Fortigate.', '2026-01-06', 'Networking'),
(7, 'Restaurant Gusto', 'Menu App', 'QR-code bestelsysteem.', '2026-01-07', 'Flutter, Firebase'),
(8, 'EduCloud', 'LMS Koppeling', 'Integratie met Canvas.', '2026-01-08', 'LTI, PHP'),
(9, 'Medisch Centrum', 'EPD Migratie', 'Data overzetten naar nieuw systeem.', '2026-01-09', 'SQL, HL7'),
(10, 'BouwGroep NL', 'BIM Viewer', '3D modellen in browser.', '2026-01-10', 'Three.js, C#'),
(11, 'Financieel Advies', 'Tax Tool', 'Belastingberekening module.', '2026-01-11', 'Python, Excel'),
(12, 'SportClub Fit', 'Leden App', 'Pushberichten voor lessen.', '2026-01-12', 'Swift, Kotlin'),
(13, 'Webshop 123', 'iDEAL Koppeling', 'Betaalprovider aansluiten.', '2026-01-13', 'API, Stripe'),
(14, 'AutoGarage', 'APK Scanner', 'Kentekenherkenning via camera.', '2026-01-14', 'OpenCV, Python'),
(15, 'HobbyWinkel', 'SEO Scan', 'Verbeteren organisch verkeer.', '2026-01-15', 'SEO, Marketing'),
(16, 'CloudNine', 'Azure Setup', 'Inrichten van landing zone.', '2026-01-16', 'Terraform, Azure'),
(17, 'DataInsights', 'Big Data Rapport', 'Analyse van koopgedrag.', '2026-01-17', 'Spark, Scala'),
(18, 'SafeHouse', 'Camera Systeem', 'IP-camera integratie.', '2026-01-18', 'C++, RTSP'),
(19, 'SmartHome Co', 'IoT Bridge', 'Zigbee naar WiFi bridge.', '2026-01-19', 'C, MQTT'),
(20, 'TravelAgency', 'Booking Engine', 'Vluchten vergelijker.', '2026-01-20', 'Node.js, GraphQL'),
(21, 'LegalDocs', 'Document AI', 'Automatisch scannen van contracten.', '2026-01-21', 'NLP, Python'),
(22, 'PixelArt', 'Logo Ontwerp', 'Nieuwe huisstijl voor startup.', '2026-01-22', 'Illustrator'),
(23, 'FastFood Inc', 'Kiosk Software', 'Bestelzuil interface.', '2026-01-23', 'Electron, JS'),
(24, 'BioLab', 'DNA Sequencer', 'Dataverwerking van genen.', '2026-01-24', 'R, Biostatistiek'),
(25, 'RealEstate', 'Virtual Tour', '360 graden foto viewer.', '2026-01-25', 'WebVR, JS'),
(26, 'MusicStream', 'Audio Codec', 'Compressie optimalisatie.', '2026-01-26', 'C++, DSP'),
(27, 'CryptoTrade', 'Wallet Integratie', 'BTC/ETH wallet support.', '2026-01-27', 'Solidity, Go'),
(28, 'FashionStore', 'Inventory Sync', 'Voorraad koppelen aan Instagram.', '2026-01-28', 'Python, API'),
(29, 'GymMaster', 'RFID Toegang', 'Poortjes koppelen aan database.', '2026-01-29', 'Arduino, SQL'),
(30, 'CityLibrary', 'E-book Portal', 'Uitleensysteem voor digitale boeken.', '2026-01-30', 'Ruby on Rails'),
(31, 'EcoFarm', 'Sensor Netwerk', 'Bodemvochtigheid meten.', '2026-01-31', 'LoRaWAN, C'),
(32, 'NewsUpdate', 'CMS Bouw', 'Maatwerk blog systeem.', '2026-02-01', 'Laravel, Vue'),
(33, 'SolarSystems', 'Inverter Sync', 'Omvormer uitlezen via RS485.', '2026-02-02', 'Modbus, Python'),
(34, 'EventPlanner', 'Ticket Check', 'Scanner app voor events.', '2026-02-03', 'React Native'),
(35, 'CoffeeShop', 'Loyalty Program', 'Sparen voor gratis koffie app.', '2026-02-04', 'Firebase, JS'),
(36, 'DroneFly', 'Flight Logger', 'Logboek voor dronevluchten.', '2026-02-05', 'SQLite, Python'),
(37, 'AquaPure', 'Water Filter Monitor', 'Status van filters bijhouden.', '2026-02-06', 'IoT, Dashboard'),
(38, 'PetShelter', 'Adopteer App', 'Matches vinden voor honden.', '2026-02-07', 'Flutter, Dart'),
(39, 'JobSearch', 'Vacature Scraper', 'Jobs ophalen van LinkedIn.', '2026-02-08', 'Selenium, Python'),
(40, 'PrintMaster', '3D Print Server', 'Wachtrijbeheer voor printers.', '2026-02-09', 'OctoPrint, API'),
(41, 'ShipIt', 'Container Tracking', 'Live locatie van vracht.', '2026-02-10', 'GPS, WebSockets'),
(42, 'WineCellar', 'Voorraad Beheer', 'Inventaris van dure wijnen.', '2026-02-11', 'Access, SQL'),
(43, 'GameStudio', 'Shader Dev', 'Water effecten in Unity.', '2026-02-12', 'HLSL, Unity'),
(44, 'SchoolBoard', 'Cijfer Portaal', 'Beveiligde omgeving voor leerlingen.', '2026-02-13', 'PHP, OAuth2'),
(45, 'TaxiDienst', 'Dispatch System', 'Ritten toewijzen aan chauffeurs.', '2026-02-14', 'Node.js, Redis'),
(46, 'HandyMan', 'Offerte Tool', 'Snel kosten berekenen voor klussen.', '2026-02-15', 'Excel, VBA'),
(47, 'YogaStudio', 'Stream Platform', 'Live yoga lessen volgen.', '2026-02-16', 'WebRTC, JS'),
(48, 'ToyFactory', 'Robot Arm Fix', 'PLC programmering herstellen.', '2026-02-17', 'Structured Text'),
(49, 'OilCorp', 'Pipeline Monitor', 'Lekdetectie algoritme.', '2026-02-18', 'MATLAB, Python'),
(50, 'SpaceAgency', 'Satellite Data', 'Verwerken van satellietbeelden.', '2026-02-19', 'Python, GDAL');

-- --------------------------------------------------------

--
-- Table structure for table `werkzaamheden`
--

CREATE TABLE `werkzaamheden` (
  `ID` int(11) NOT NULL,
  `Voornaam` varchar(60) NOT NULL,
  `Tussenvoegsel` varchar(60) NOT NULL,
  `Achternaam` varchar(60) NOT NULL,
  `Gewerkte uren` tinyint(4) NOT NULL,
  `Opdracht` varchar(200) NOT NULL,
  `Omschrijving` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `werkzaamheden`
--

INSERT INTO `werkzaamheden` (`ID`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Gewerkte uren`, `Opdracht`, `Omschrijving`) VALUES
(100001, 'Zaid', '', 'Oulad Hadj Baraka', 12, 'Project management', 'Database structuur opgezet'),
(100002, 'Max', '', 'Nikoliszyn', 8, 'Website onderhoud', 'PHP bugs opgelost'),
(100003, 'Nick', '', 'Willems', 4, 'Logo ontwerp', 'Eerste schetsen gemaakt'),
(100004, 'Dillan', '', 'Sampers', 12, 'Tuinaanleg', 'Stenen gelegd in de voortuin'),
(100005, 'Nino', '', 'Slaats', 6, 'Vertaling', 'Document naar het Engels vertaald'),
(100006, 'Timur', '', 'Burek', 10, 'Schilderwerk', 'Kozijnen benedenverdieping'),
(100007, 'Lotte', 'van der', 'Meer', 2, 'Consultancy', 'Adviesgesprek nieuwe strategie'),
(100008, 'Mo', '', 'Ahmadi', 15, 'App development', 'API koppeling gebouwd'),
(100009, 'Sophie', '', 'Hermans', 5, 'Copywriting', 'Blogpost over duurzaamheid geschreven'),
(100010, 'Bram', 'de', 'Jong', 3, 'Fotografie', 'Productfoto\'s voor webshop'),
(100011, 'Eline', 'ten', 'Have', 7, 'Boekhouding', 'Kwartaalaangifte voorbereid'),
(100012, 'Rick', '', 'Janssen', 9, 'Loodgieterswerk', 'Lekkage in badkamer verholpen'),
(100013, 'Sanne', 'van de', 'Berg', 6, 'Social Media', 'Contentkalender voor maart'),
(100014, 'Youssef', '', 'Bannani', 11, 'Netwerkbeheer', 'Serverkast opnieuw ingericht'),
(100015, 'Mila', '', 'Visser', 4, 'Data entry', 'Klantgegevens bijgewerkt'),
(100016, 'Daan', 'te', 'Wierik', 8, 'Meubelmontage', 'Bureau en kast in elkaar gezet'),
(100017, 'Tessa', '', 'Kramer', 5, 'Huisstijl', 'Kleurenpalet aangepast'),
(100018, 'Sam', 'van', 'Loon', 2, 'Koeriersdienst', 'Pakket afgeleverd in Utrecht'),
(100019, 'Lieke', '', 'Hendriks', 14, 'Video editing', 'Promotiefilm gemonteerd'),
(100020, 'Bas', 'de', 'Groot', 6, 'Schoonmaak', 'Kantoorruimte gereinigd'),
(100021, 'Emma', 'van der', 'Vliet', 3, 'Illustratie', 'Tekening voor kinderboek'),
(100022, 'Lars', '', 'Bos', 10, 'Stukadoorswerk', 'Wand in woonkamer gladgemaakt'),
(100023, 'Noa', '', 'Dekker', 7, 'SEO optimalisatie', 'Keywords geanalyseerd'),
(100024, 'Tim', 'van', 'Zanten', 5, 'Elektra', 'Nieuwe groepenkast geplaatst'),
(100025, 'Julia', '', 'Willems', 8, 'Interieuradvies', 'Moodboard voor kantoor'),
(100026, 'Kees', 'de', 'Wit', 4, 'Reparatie', 'Laptop scherm vervangen'),
(100027, 'Fleur', 'van der', 'Wal', 6, 'Event planning', 'Locatiebezoek voor congres'),
(100028, 'Omar', '', 'Kaddouri', 12, 'Backend dev', 'Database query\'s geoptimaliseerd'),
(100029, 'Lisa', '', 'Meijer', 5, 'Klantenservice', 'Tickets afgehandeld'),
(100030, 'Hugo', 'van', 'Eijk', 9, 'Timmerwerk', 'Maatwerk kast gebouwd'),
(100031, 'Sarah', '', 'Vos', 4, 'Brainstorm', 'Nieuwe marketing actie'),
(100032, 'Milan', '', 'Hoekstra', 3, 'Inkoop', 'Materialen besteld bij leverancier'),
(100033, 'Iris', 'de', 'Graaf', 7, 'Cursus geven', 'Uitleg over Excel'),
(100034, 'Jesse', 'van', 'Dongen', 10, 'Tuinonderhoud', 'Heg gesnoeid en bladeren weg'),
(100035, 'Lynn', '', 'Sanders', 6, 'UX Design', 'Wireframes voor dashboard'),
(100036, 'Boris', '', 'Postma', 8, 'Beveiliging', 'Camerabeveiliging geïnstalleerd'),
(100037, 'Roos', 'van der', 'Heijden', 4, 'PR', 'Persbericht geschreven'),
(100038, 'Thomas', '', 'Brouwer', 13, 'Lassen', 'Stalen frame gelast'),
(100039, 'Amber', '', 'Prins', 5, 'Administratie', 'Facturen verwerkt'),
(100040, 'Mats', 'van', 'Rijn', 6, 'Sloopwerk', 'Keuken gedemonteerd'),
(100041, 'Eva', '', 'Wolters', 2, 'Advies', 'Juridische check contract'),
(100042, 'Ruben', 'de', 'Konings', 9, 'Installatietechniek', 'Warmtepomp geplaatst'),
(100043, 'Isa', '', 'Verhoeven', 7, 'Recruitment', 'Sollicitatiegesprekken gevoerd'),
(100044, 'Sven', 'van', 'Leeuwen', 5, 'Auto wassen', 'Showroomklaar maken'),
(100045, 'Nina', '', 'Driessen', 4, 'Modeontwerp', 'Patroon getekend voor jurk'),
(100046, 'Jasper', 'de', 'Beer', 11, 'Metselwerk', 'Tuinmuur gemetseld'),
(100047, 'Luna', '', 'Evers', 6, 'Onderzoek', 'Concurrentieanalyse gedaan'),
(100048, 'Twan', 'van der', 'Horst', 8, 'Vloeren leggen', 'Laminaat op zolder'),
(100049, 'Amy', '', 'Gerritsen', 3, 'Styling', 'Fotoshoot kledingmerk'),
(100050, 'Sem', '', 'Kuipers', 10, 'Dakdekken', 'Dakgoot gerepareerd'),
(100051, 'Zara', 'van', 'Gils', 5, 'Coaching', 'Sessie timemanagement');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apparatuur`
--
ALTER TABLE `apparatuur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facturen`
--
ALTER TABLE `facturen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Werkmail` (`Werkmail`);

--
-- Indexes for table `opdrachten`
--
ALTER TABLE `opdrachten`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `werkzaamheden`
--
ALTER TABLE `werkzaamheden`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apparatuur`
--
ALTER TABLE `apparatuur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `facturen`
--
ALTER TABLE `facturen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `klanten`
--
ALTER TABLE `klanten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medewerkers`
--
ALTER TABLE `medewerkers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `opdrachten`
--
ALTER TABLE `opdrachten`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `werkzaamheden`
--
ALTER TABLE `werkzaamheden`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100052;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
