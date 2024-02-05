-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coolchess
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `coolchess` ;

-- -----------------------------------------------------
-- Schema coolchess
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coolchess` DEFAULT CHARACTER SET utf8 ;
USE `coolchess` ;

-- -----------------------------------------------------
-- Table `coolchess`.`Player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`Player` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `status` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`Match` (
  `id` INT NOT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`PlayerPlayedMatch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`PlayerPlayedMatch` (
  `idPlayedMatch` INT NOT NULL AUTO_INCREMENT,
  `idPlayer` INT NOT NULL,
  `idMatch` INT NOT NULL,
  INDEX `fk_Player_has_Match_Match1_idx` (`idMatch` ASC) ,
  INDEX `fk_Player_has_Match_Player1_idx` (`idPlayer` ASC) ,
  PRIMARY KEY (`idPlayedMatch`),
  CONSTRAINT `fk_Player_has_Match_Player1`
    FOREIGN KEY (`idPlayer`)
    REFERENCES `coolchess`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_Match_Match1`
    FOREIGN KEY (`idMatch`)
    REFERENCES `coolchess`.`Match` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`Friend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`Friend` (
  `idFriend` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NULL,
  `idPlayer1` INT NOT NULL,
  `idPlayer2` INT NOT NULL,
  PRIMARY KEY (`idFriend`),
  INDEX `fk_Friend_Player1_idx` (`idPlayer1` ASC) ,
  INDEX `fk_Friend_Player2_idx` (`idPlayer2` ASC) ,
  CONSTRAINT `fk_Friend_Player1`
    FOREIGN KEY (`idPlayer1`)
    REFERENCES `coolchess`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Friend_Player2`
    FOREIGN KEY (`idPlayer2`)
    REFERENCES `coolchess`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`Move`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`Move` (
  `idMove` INT NOT NULL,
  `row` VARCHAR(1) NULL,
  `col` VARCHAR(1) NULL,
  `idPlayer` INT NOT NULL,
  `idMatch` INT NOT NULL,
  PRIMARY KEY (`idMove`),
  INDEX `fk_Move_Player1_idx` (`idPlayer` ASC) ,
  INDEX `fk_Move_Match1_idx` (`idMatch` ASC) ,
  CONSTRAINT `fk_Move_Player1`
    FOREIGN KEY (`idPlayer`)
    REFERENCES `coolchess`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Move_Match1`
    FOREIGN KEY (`idMatch`)
    REFERENCES `coolchess`.`Match` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
