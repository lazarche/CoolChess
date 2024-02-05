-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coolchess
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS coolchess;
-- -----------------------------------------------------
-- Schema coolchess
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coolchess` DEFAULT CHARACTER SET utf8 ;
USE `coolchess` ;

-- -----------------------------------------------------
-- Table `coolchess`.`PlayerData`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`PlayerData` (
  `id` INT NOT NULL auto_increment,
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
  `PlayerData_id` INT NOT NULL,
  `Match_id` INT NOT NULL,
  `won` INT NULL,
  PRIMARY KEY (`PlayerData_id`, `Match_id`),
  INDEX `fk_PlayerData_has_Match_Match1_idx` (`Match_id` ASC),
  INDEX `fk_PlayerData_has_Match_PlayerData_idx` (`PlayerData_id` ASC),
  CONSTRAINT `fk_PlayerData_has_Match_PlayerData`
    FOREIGN KEY (`PlayerData_id`)
    REFERENCES `coolchess`.`PlayerData` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerData_has_Match_Match1`
    FOREIGN KEY (`Match_id`)
    REFERENCES `coolchess`.`Match` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `coolchess`.`Move`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`Move` (
  `id` INT NOT NULL,
  `row` VARCHAR(45) NULL,
  `col` VARCHAR(45) NULL,
  `Match_id` INT NOT NULL,
  `PlayerData_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Match_id`, `PlayerData_id`),
  INDEX `fk_Move_Match1_idx` (`Match_id` ASC) ,
  INDEX `fk_Move_PlayerData1_idx` (`PlayerData_id` ASC) ,
  CONSTRAINT `fk_Move_Match1`
    FOREIGN KEY (`Match_id`)
    REFERENCES `coolchess`.`Match` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Move_PlayerData1`
    FOREIGN KEY (`PlayerData_id`)
    REFERENCES `coolchess`.`PlayerData` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`Friend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`Friend` (
  `PlayerData_id` INT NOT NULL,
  `PlayerData_id1` INT NOT NULL,
  PRIMARY KEY (`PlayerData_id`, `PlayerData_id1`),
  INDEX `fk_PlayerData_has_PlayerData_PlayerData2_idx` (`PlayerData_id1` ASC) ,
  INDEX `fk_PlayerData_has_PlayerData_PlayerData1_idx` (`PlayerData_id` ASC) ,
  CONSTRAINT `fk_PlayerData_has_PlayerData_PlayerData1`
    FOREIGN KEY (`PlayerData_id`)
    REFERENCES `coolchess`.`PlayerData` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerData_has_PlayerData_PlayerData2`
    FOREIGN KEY (`PlayerData_id1`)
    REFERENCES `coolchess`.`PlayerData` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
