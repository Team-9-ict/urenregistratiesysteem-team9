-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 25 mrt 2026 om 09:10
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
-- Database: `bedrijf`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `werkzaamheden`
--

DROP TABLE IF EXISTS `werkzaamheden`;
CREATE TABLE IF NOT EXISTS `werkzaamheden` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tussenvoegsel` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Achternaam` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gewerkte uren` tinyint NOT NULL,
  `Opdracht` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Omschrijving` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=100052 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `werkzaamheden`
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
