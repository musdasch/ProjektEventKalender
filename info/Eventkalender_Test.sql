-- This Dump is for testing

-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 02. Dez 2015 um 08:36
-- Server Version: 5.6.27
-- PHP-Version: 5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `Eventkalender`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzer`
--

CREATE TABLE IF NOT EXISTS `benutzer` (
`ID` int(10) unsigned NOT NULL,
  `benutzername` varchar(45) NOT NULL,
  `passwort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'TestGenre');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `preisgruppe`
--

CREATE TABLE IF NOT EXISTS `preisgruppe` (
`ID` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `preis` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `preisgruppe`
--

INSERT INTO `preisgruppe` (`ID`, `name`, `preis`) VALUES
(1, 'TestPreisgruppe', '10.00 CHF');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `veranstaltung`
--

CREATE TABLE IF NOT EXISTS `veranstaltung` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `besetzung` varchar(255) DEFAULT NULL,
  `beschreibung` text NOT NULL,
  `termin` datetime NOT NULL,
  `dauer` smallint(5) unsigned NOT NULL,
  `bild` varchar(100) NOT NULL,
  `bildbeschreibung` varchar(255) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `linkbeschreibung` varchar(255) DEFAULT NULL,
  `fk_genre_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `veranstaltung`
--

INSERT INTO `veranstaltung` (`id`, `name`, `besetzung`, `beschreibung`, `termin`, `dauer`, `bild`, `bildbeschreibung`, `link`, `linkbeschreibung`, `fk_genre_id`) VALUES
(1, 'TestVeranstaltung', 'Die Test Besetung', 'Die Test Beschrigung', '2016-01-01 00:00:00', 1, 'assets/img/test_bild.jpg', 'Das Test Bildbeschribung', 'https://www.google.ch/', 'Die Test Linkbeschrigung', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `veranstaltung_hat_preisgruppe`
--

CREATE TABLE IF NOT EXISTS `veranstaltung_hat_preisgruppe` (
  `fk_preisgruppe_id` int(10) unsigned NOT NULL,
  `fk_veranstaltung_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `veranstaltung_hat_preisgruppe`
--

INSERT INTO `veranstaltung_hat_preisgruppe` (`fk_preisgruppe_id`, `fk_veranstaltung_id`) VALUES
(1, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `benutzer`
--
ALTER TABLE `benutzer`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `benutzername_UNIQUE` (`benutzername`);

--
-- Indizes für die Tabelle `genre`
--
ALTER TABLE `genre`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `preisgruppe`
--
ALTER TABLE `preisgruppe`
 ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_Veranstaltung_Genre1_idx` (`fk_genre_id`);

--
-- Indizes für die Tabelle `veranstaltung_hat_preisgruppe`
--
ALTER TABLE `veranstaltung_hat_preisgruppe`
 ADD KEY `fk_Veranstaltung_hat_Presigruppen_Preisgruppe_idx` (`fk_preisgruppe_id`), ADD KEY `fk_Veranstaltung_hat_Presigruppen_Veranstaltung1_idx` (`fk_veranstaltung_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `benutzer`
--
ALTER TABLE `benutzer`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `genre`
--
ALTER TABLE `genre`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `preisgruppe`
--
ALTER TABLE `preisgruppe`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
ADD CONSTRAINT `fk_Veranstaltung_Genre1` FOREIGN KEY (`fk_genre_id`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `veranstaltung_hat_preisgruppe`
--
ALTER TABLE `veranstaltung_hat_preisgruppe`
ADD CONSTRAINT `fk_Veranstaltung_hat_Presigruppen_Preisgruppe` FOREIGN KEY (`fk_preisgruppe_id`) REFERENCES `preisgruppe` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Veranstaltung_hat_Presigruppen_Veranstaltung1` FOREIGN KEY (`fk_veranstaltung_id`) REFERENCES `veranstaltung` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- -----------------------------------------------------
-- DBUser vor `Eventkalender`
-- -----------------------------------------------------
GRANT USAGE ON *.* TO 'EKUser'@'localhost' IDENTIFIED BY PASSWORD '*DDA7B4594264195DA8BB303516D7EC5509B7B942';
GRANT SELECT, INSERT, UPDATE ON `Eventkalender`.* TO 'EKUser'@'localhost';