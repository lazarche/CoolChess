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
  `profileImage` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`ChessMatch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`ChessMatch` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`ChessMove`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`ChessMove` (
  `idMove` INT NOT NULL AUTO_INCREMENT,
  `startRow` VARCHAR(1) NULL,
  `startCol` VARCHAR(1) NULL,
  `endRow` VARCHAR(1) NULL,
  `endCol` VARCHAR(1) NULL,
  `color` VARCHAR(6) NULL,
  `piece` VARCHAR(10) NULL,
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
    REFERENCES `coolchess`.`ChessMatch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`FriendShip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`FriendShip` (
  `idFriendShip` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  PRIMARY KEY (`idFriendShip`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`Message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`Message` (
  `idMessage` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(1000) NULL,
  `time` DATETIME NULL,
  `Player_id` INT NOT NULL,
  `PlayerHasFriend_idFriendShip` INT NOT NULL,
  PRIMARY KEY (`idMessage`),
  INDEX `fk_Message_Player1_idx` (`Player_id` ASC) ,
  INDEX `fk_Message_PlayerHasFriend1_idx` (`PlayerHasFriend_idFriendShip` ASC) ,
  CONSTRAINT `fk_Message_Player1`
    FOREIGN KEY (`Player_id`)
    REFERENCES `coolchess`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Message_PlayerHasFriend1`
    FOREIGN KEY (`PlayerHasFriend_idFriendShip`)
    REFERENCES `coolchess`.`FriendShip` (`idFriendShip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`PlayerHasChessMatch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`PlayerHasChessMatch` (
  `idtable1` INT NOT NULL AUTO_INCREMENT,
  `Player_id` INT NOT NULL,
  `ChessMatch_id` INT NOT NULL,
  `won` INT NULL,
  PRIMARY KEY (`idtable1`),
  INDEX `fk_table1_Player1_idx` (`Player_id` ASC) ,
  INDEX `fk_table1_ChessMatch1_idx` (`ChessMatch_id` ASC) ,
  CONSTRAINT `fk_table1_Player1`
    FOREIGN KEY (`Player_id`)
    REFERENCES `coolchess`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_ChessMatch1`
    FOREIGN KEY (`ChessMatch_id`)
    REFERENCES `coolchess`.`ChessMatch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolchess`.`PlayerHasFriend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coolchess`.`PlayerHasFriend` (
  `idtable1` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NULL,
  `Player_id` INT NOT NULL,
  `PlayerHasFriend_idFriendShip` INT NOT NULL,
  PRIMARY KEY (`idtable1`),
  INDEX `fk_table1_Player2_idx` (`Player_id` ASC) ,
  INDEX `fk_table1_PlayerHasFriend1_idx` (`PlayerHasFriend_idFriendShip` ASC) ,
  CONSTRAINT `fk_table1_Player2`
    FOREIGN KEY (`Player_id`)
    REFERENCES `coolchess`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_PlayerHasFriend1`
    FOREIGN KEY (`PlayerHasFriend_idFriendShip`)
    REFERENCES `coolchess`.`FriendShip` (`idFriendShip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
