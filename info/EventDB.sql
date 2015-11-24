-- MySQL Script generated by MySQL Workbench
-- 11/24/15 11:09:52
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Eventkalender
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Eventkalender
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Eventkalender` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Eventkalender` ;

-- -----------------------------------------------------
-- Table `Eventkalender`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eventkalender`.`genre` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eventkalender`.`veranstaltung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eventkalender`.`veranstaltung` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(100) NOT NULL COMMENT '',
  `besetzung` VARCHAR(255) NULL COMMENT '',
  `beschreibung` TEXT NOT NULL COMMENT '',
  `termin` DATETIME NOT NULL COMMENT '',
  `dauer` SMALLINT UNSIGNED NOT NULL COMMENT '',
  `bild` VARCHAR(100) NOT NULL COMMENT '',
  `bildbeschreibung` VARCHAR(255) NOT NULL COMMENT '',
  `link` VARCHAR(100) NULL COMMENT '',
  `linkbeschreibung` VARCHAR(255) NULL COMMENT '',
  `fk_genre_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_Veranstaltung_Genre1_idx` (`fk_genre_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Veranstaltung_Genre1`
    FOREIGN KEY (`fk_genre_id`)
    REFERENCES `Eventkalender`.`genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eventkalender`.`preisgruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eventkalender`.`preisgruppe` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(20) NOT NULL COMMENT '',
  `preis` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eventkalender`.`veranstaltung_hat_preisgruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eventkalender`.`veranstaltung_hat_preisgruppe` (
  `fk_preisgruppe_id` INT UNSIGNED NOT NULL COMMENT '',
  `fk_veranstaltung_id` INT UNSIGNED NOT NULL COMMENT '',
  INDEX `fk_Veranstaltung_hat_Presigruppen_Preisgruppe_idx` (`fk_preisgruppe_id` ASC)  COMMENT '',
  INDEX `fk_Veranstaltung_hat_Presigruppen_Veranstaltung1_idx` (`fk_veranstaltung_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Veranstaltung_hat_Presigruppen_Preisgruppe`
    FOREIGN KEY (`fk_preisgruppe_id`)
    REFERENCES `Eventkalender`.`preisgruppe` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veranstaltung_hat_Presigruppen_Veranstaltung1`
    FOREIGN KEY (`fk_veranstaltung_id`)
    REFERENCES `Eventkalender`.`veranstaltung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eventkalender`.`benutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eventkalender`.`benutzer` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `benutzername` VARCHAR(45) NOT NULL COMMENT '',
  `passwort` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`ID`)  COMMENT '',
  UNIQUE INDEX `benutzername_UNIQUE` (`benutzername` ASC)  COMMENT '')
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
