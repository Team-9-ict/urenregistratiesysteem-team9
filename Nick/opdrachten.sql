-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 19 mrt 2026 om 10:47
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opdrachten`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `opdrachten`
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
-- Gegevens worden geëxporteerd voor tabel `opdrachten`
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

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `opdrachten`
--
ALTER TABLE `opdrachten`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `opdrachten`
--
ALTER TABLE `opdrachten`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
