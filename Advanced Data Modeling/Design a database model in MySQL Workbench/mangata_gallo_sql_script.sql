-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mangata_gallo_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mangata_gallo_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mangata_gallo_db` DEFAULT CHARACTER SET utf8 ;
USE `mangata_gallo_db` ;

-- -----------------------------------------------------
-- Table `mangata_gallo_db`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_db`.`Clients` (
  `ClientID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ClientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gallo_db`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_db`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(255) NULL,
  `BuyPrice` DECIMAL NULL,
  `SellPrice` DECIMAL NULL,
  `AmountInStock` INT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gallo_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_db`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `ClientID` INT NULL,
  `ProductID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Products_idx` (`ProductID` ASC) VISIBLE,
  INDEX `fk_Orders_Clients_idx` (`ClientID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Products`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mangata_gallo_db`.`Products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_Clients`
    FOREIGN KEY (`ClientID`)
    REFERENCES `mangata_gallo_db`.`Clients` (`ClientID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gallo_db`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_db`.`Address` (
  `AddressID` INT NOT NULL,
  `Street` VARCHAR(255) NOT NULL,
  `ZipCode` VARCHAR(255) NOT NULL,
  `State` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gallo_db`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_db`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(255) NOT NULL,
  `AddressID` INT NOT NULL,
  `Comment` VARCHAR(255) NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fk_Delivery_Address_idx` (`AddressID` ASC) VISIBLE,
  INDEX `fk_Delivery_Orders1_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_Delivery_Address`
    FOREIGN KEY (`AddressID`)
    REFERENCES `mangata_gallo_db`.`Address` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Delivery_Orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mangata_gallo_db`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
