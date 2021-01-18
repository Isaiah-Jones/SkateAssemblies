

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

drop database if exists CIT306ij;
create database CIT306ij;
use CIT306ij;

-- --------------------
-- Table Decks
-- --------------------
CREATE TABLE Decks(
  DeckID INT NOT NULL,
  Brand VARCHAR(45) NOT NULL,
  Title VARCHAR(80) NOT NULL,
  Size VARCHAR(45) NOT NULL,
  DType VARCHAR(45) NOT NULL,
  Description VARCHAR(450) NULL,
  PRIMARY KEY (DeckID),
  UNIQUE INDEX DeckID_UNIQUE (DeckID ASC))
ENGINE = InnoDB;


-- --------------------
-- Table Wheels
-- --------------------
CREATE TABLE Wheels (
  WheelID INT NOT NULL,
  Brand VARCHAR(45) NOT NULL,
  WType VARCHAR(45) NOT NULL,
  Composition VARCHAR(45) NULL,
  Color VARCHAR(45) NOT NULL,
  PRIMARY KEY (WheelID),
  UNIQUE INDEX WheelID_UNIQUE (WheelID ASC))
ENGINE = InnoDB;


-- --------------------
-- Table Trucks
-- --------------------
CREATE TABLE Trucks (
  TrucksID INT NOT NULL,
  Brand VARCHAR(45) NOT NULL,
  TruckType VARCHAR(45) NOT NULL,
  Color VARCHAR(45) NOT NULL,
  Width INT NOT NULL,
  PRIMARY KEY (TrucksID),
  UNIQUE INDEX TrucksID_UNIQUE (TrucksID ASC))
ENGINE = InnoDB;


-- --------------------
-- Table Bearings
-- --------------------
CREATE TABLE Bearings (
  BearingID INT NOT NULL,
  Brand VARCHAR(45) NOT NULL,
  Description VARCHAR(450) NOT NULL,
  PRIMARY KEY (BearingID),
  UNIQUE INDEX BearingID_UNIQUE (BearingID ASC))
ENGINE = InnoDB;


-- ---------------------
-- Table Griptape
-- ---------------------
CREATE TABLE Griptape (
  GriptapeID INT NOT NULL,
  Brand VARCHAR(45) NOT NULL,
  Grit VARCHAR(45) NOT NULL,
  Color VARCHAR(45) NOT NULL,
  PRIMARY KEY (GriptapeID),
  UNIQUE INDEX GriptapeID_UNIQUE (GriptapeID ASC))
ENGINE = InnoDB;


-- ---------------------
-- Table Customer
-- ---------------------
CREATE TABLE Customer (
  UserID INT NOT NULL,
  Fname VARCHAR(45) NOT NULL,
  LName VARCHAR(45) NOT NULL,
  PhoneNum VARCHAR(10) NOT NULL,
  PRIMARY KEY (UserID),
  UNIQUE INDEX UserID_UNIQUE (UserID ASC))
ENGINE = InnoDB;


-- ----------------------
-- Table Assembly
-- ----------------------
CREATE TABLE  Assembly (
  AssemblyID INT NOT NULL,
  User_UserID INT NOT NULL,
  Deck_DeckID INT NOT NULL,
  Bearings_BearingID INT NOT NULL,
  Griptape_GriptapeID INT NOT NULL,
  AssembleTime DATETIME NOT NULL,
  PRIMARY KEY (AssemblyID, User_UserID, Deck_DeckID, Bearings_BearingID, Griptape_GriptapeID),
  INDEX fk_Assembly_User_idx (User_UserID ASC),
  INDEX fk_Assembly_Deck1_idx (Deck_DeckID ASC),
  INDEX fk_Assembly_Bearings1_idx (Bearings_BearingID ASC),
  INDEX fk_Assembly_Griptape1_idx (Griptape_GriptapeID ASC),
  CONSTRAINT fk_Assembly_User
    FOREIGN KEY (User_UserID)
    REFERENCES Customer (UserID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Assembly_Deck1
    FOREIGN KEY (Deck_DeckID)
    REFERENCES Deck (DeckID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Assembly_Bearings1
    FOREIGN KEY (Bearings_BearingID)
    REFERENCES Bearings (BearingID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Assembly_Griptape1
    FOREIGN KEY (Griptape_GriptapeID)
    REFERENCES Griptape (GriptapeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------
-- Wheels_for_Assembly
-- ----------------------
CREATE TABLE Wheels_for_Assembly (
  Assembly_AssemblyID INT NOT NULL,
  Assembly_User_UserID INT NOT NULL,
  Wheels_WheelID INT NOT NULL,
  PRIMARY KEY (Assembly_AssemblyID, Assembly_User_UserID, Wheels_WheelID),
  INDEX fk_Wheels_for_Assembly_Wheels1_idx (Wheels_WheelID ASC),
  INDEX fk_Wheels_for_Assembly_Assembly1_idx (Assembly_AssemblyID ASC, Assembly_User_UserID ASC),
  CONSTRAINT fk_Wheels_for_Assembly_Assembly1
    FOREIGN KEY (Assembly_AssemblyID , Assembly_User_UserID)
    REFERENCES Assembly (AssemblyID , User_UserID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Wheels_for_Assembly_Wheels1
    FOREIGN KEY (Wheels_WheelID)
    REFERENCES Wheels (WheelID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ---------------------
-- Trucks_for_Assembly
-- ---------------------
CREATE TABLE Trucks_for_Assembly (
  Assembly_AssemblyID INT NOT NULL,
  Assembly_User_UserID INT NOT NULL,
  Trucks_TrucksID INT NOT NULL,
  PRIMARY KEY (Assembly_AssemblyID, Assembly_User_UserID,Trucks_TrucksID),
  INDEX fk_Trucks_for_Assembly_Assembly1_idx (Assembly_AssemblyID ASC, Assembly_User_UserID ASC),
  INDEX fk_Trucks_for_Assembly_Trucks1_idx (Trucks_TrucksID ASC),
  CONSTRAINT fk_Trucks_has_Assembly_Assembly1
    FOREIGN KEY (Assembly_AssemblyID , Assembly_User_UserID)
    REFERENCES Assembly (AssemblyID ,User_UserID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Trucks_for_Assembly_Trucks1
    FOREIGN KEY (Trucks_TrucksID)
    REFERENCES Trucks (TrucksID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




INSERT into Decks VALUES(8246482,"Plan B", "Black & Green Graffit Plan B", "8.25", "Skate", "");

INSERT into Decks VALUES(8154795,"Superior", "Superior Golden 8.1", "8.10", "Skate", "Simple desgin with the classic Superior logo in gold.");

INSERT into Decks VALUES(8246442,"Superior", "Superior Super Gem", "8.00", "Skate", "");

INSERT into Decks VALUES(8005142,"Kryptonics", "Kryptonics Blue Fish", "8.10", "Skate", "");

INSERT into Decks VALUES(8548421,"Element", "Element Nyjah Houston Diamond Board", "7.75", "Skate", "");

INSERT into Decks VALUES(8228822,"Baker", "Baker Red Classic", "8.10", "Skate", "");

INSERT into Decks VALUES(8080808,"Enjoi", "Enjoi Space Panda", "8.00", "Skate", "");

INSERT into Decks VALUES(8741524,"Landyatchs", "Landyachtz Battle Axe Chill Bird Drop Through Longboard Deck ", "40", "Longboard", "");

INSERT into Decks VALUES(8796841,"Mercer", "Mercer Samurai Luck Double Drop Longboard Deck ", "38", "Longboard", "");

INSERT into Decks VALUES(8225262,"Plan B", "Plan B Pudwill Nebula 8.0 Skateboard Deck ", "8.00", "Skate", "");

-- -----------------
-- Update Deck Table
-- -----------------
UPDATE Decks 
SET DType="Skateboard"
WHERE DType="Skate";


-- -----------------
-- Delete "Element" Board
-- -----------------
DELETE FROM Decks WHERE Brand = "Element";

-- -----------------
-- Display Deck Table
-- -----------------

Select * from Decks;
