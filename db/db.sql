-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.44-MariaDB-0ubuntu0.18.04.1 - Ubuntu 18.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for dev-tripper
CREATE DATABASE IF NOT EXISTS `dev-tripper` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `dev-tripper`;

-- Dumping structure for table dev-tripper.Equipment
CREATE TABLE IF NOT EXISTS `Equipment` (
  `ID` int(10) NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category` int(10) DEFAULT NULL,
  `Location` int(10) DEFAULT NULL,
  `Quantity On Hand` int(10) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `IsMaintenance` tinyint(1) DEFAULT NULL,
  `SerialNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(11) DEFAULT NULL,
  `UserModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Created By` (`UserCreated`),
  KEY `Category` (`Category`),
  KEY `Location` (`Location`),
  KEY `Updated By` (`UserModified`),
  CONSTRAINT `Category` FOREIGN KEY (`Category`) REFERENCES `Lookups` (`ID`),
  CONSTRAINT `Created By` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `Location` FOREIGN KEY (`Location`) REFERENCES `Lookups` (`ID`),
  CONSTRAINT `Updated By` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.Locations
CREATE TABLE IF NOT EXISTS `Locations` (
  `ID` int(10) NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(11) DEFAULT NULL,
  `UserModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `User Created` (`UserCreated`),
  KEY `Modified User` (`UserModified`),
  CONSTRAINT `Modified User` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `User Created` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.LocationsExtended
CREATE TABLE IF NOT EXISTS `LocationsExtended` (
  `ID` int(10) NOT NULL,
  `LocationId` int(10) DEFAULT NULL,
  `UserCreated` int(11) DEFAULT NULL,
  `UserModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Location Id` (`LocationId`),
  KEY `UserModified` (`UserModified`),
  KEY `UserCreated` (`UserCreated`),
  CONSTRAINT `Location Id` FOREIGN KEY (`LocationId`) REFERENCES `Locations` (`ID`),
  CONSTRAINT `UserCreated` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `UserModified` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.Log
CREATE TABLE IF NOT EXISTS `Log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Entity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(11) DEFAULT NULL,
  `UserModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Modified User Log` (`UserModified`),
  KEY `Created User Log` (`UserCreated`),
  CONSTRAINT `Created User Log` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `Modified User Log` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.Lookups
CREATE TABLE IF NOT EXISTS `Lookups` (
  `ID` int(10) NOT NULL,
  `Entity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(11) DEFAULT NULL,
  `UserModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Lookups_Users` (`UserCreated`),
  KEY `FK_Lookups_Users_2` (`UserModified`),
  CONSTRAINT `FK_Lookups_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_Lookups_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.Maintenance
CREATE TABLE IF NOT EXISTS `Maintenance` (
  `ID` int(10) NOT NULL,
  `EquipmentId` int(10) DEFAULT NULL,
  `Comment` longtext COLLATE utf8mb4_unicode_ci,
  `DateMaintained` datetime DEFAULT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `EquipmentMaintence` (`EquipmentId`),
  KEY `UserCreatedMaintence` (`UserCreated`),
  KEY `UserModifiedMaintence` (`UserModified`),
  CONSTRAINT `EquipmentMaintence` FOREIGN KEY (`EquipmentId`) REFERENCES `Equipment` (`ID`),
  CONSTRAINT `UserCreatedMaintence` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `UserModifiedMaintence` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.Meals
CREATE TABLE IF NOT EXISTS `Meals` (
  `ID` int(10) NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category` int(10) DEFAULT NULL,
  `Cuisine` int(10) DEFAULT NULL,
  `Receipe` longtext COLLATE utf8mb4_unicode_ci,
  `Ingredients` longtext COLLATE utf8mb4_unicode_ci,
  `Status` tinyint(1) NOT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LookupsMeals1` (`Cuisine`),
  KEY `LookupsMeals` (`Category`),
  KEY `FK_Meals_Users` (`UserCreated`),
  KEY `FK_Meals_Users_2` (`UserModified`),
  CONSTRAINT `FK_Meals_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_Meals_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `LookupsMeals` FOREIGN KEY (`Category`) REFERENCES `Lookups` (`ID`),
  CONSTRAINT `LookupsMeals1` FOREIGN KEY (`Cuisine`) REFERENCES `Lookups` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.People
CREATE TABLE IF NOT EXISTS `People` (
  `ID` int(10) NOT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FullName` varchar(243) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_People_Users` (`UserCreated`),
  KEY `FK_People_Users_2` (`UserModified`),
  CONSTRAINT `FK_People_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_People_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.Trip
CREATE TABLE IF NOT EXISTS `Trip` (
  `ID` int(10) NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category` int(10) DEFAULT NULL,
  `StartDate` int(10) DEFAULT NULL,
  `EndDate` int(10) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LookupsTrips` (`Category`),
  KEY `FK_Trip_Users` (`UserCreated`),
  KEY `FK_Trip_Users_2` (`UserModified`),
  CONSTRAINT `FK_Trip_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_Trip_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `LookupsTrips` FOREIGN KEY (`Category`) REFERENCES `Lookups` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.TripEquipment
CREATE TABLE IF NOT EXISTS `TripEquipment` (
  `ID` int(10) NOT NULL,
  `TripId` int(10) DEFAULT NULL,
  `EquipmentId` int(10) DEFAULT NULL,
  `QuantityPacked` int(10) DEFAULT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `EquipmentInventoryTripEquipment` (`EquipmentId`),
  KEY `TripTripEquipment` (`TripId`),
  KEY `FK_TripEquipment_Users` (`UserCreated`),
  KEY `FK_TripEquipment_Users_2` (`UserModified`),
  CONSTRAINT `EquipmentInventoryTripEquipment` FOREIGN KEY (`EquipmentId`) REFERENCES `Equipment` (`ID`),
  CONSTRAINT `FK_TripEquipment_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_TripEquipment_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `TripTripEquipment` FOREIGN KEY (`TripId`) REFERENCES `Trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.TripExtended
CREATE TABLE IF NOT EXISTS `TripExtended` (
  `ID` int(10) NOT NULL,
  `TripId` int(10) DEFAULT NULL,
  `Dog` tinyint(1) NOT NULL,
  `TravelTrailer` tinyint(1) NOT NULL,
  `Truck` tinyint(1) NOT NULL,
  `Skiing` tinyint(1) NOT NULL,
  `Fireworks` tinyint(1) NOT NULL,
  `RvPark` tinyint(1) NOT NULL,
  `Beach` tinyint(1) NOT NULL,
  `Desert` tinyint(1) NOT NULL,
  `Water/Beach` tinyint(1) NOT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TripsTripExtended` (`TripId`),
  KEY `FK_TripExtended_Users` (`UserCreated`),
  KEY `FK_TripExtended_Users_2` (`UserModified`),
  CONSTRAINT `FK_TripExtended_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_TripExtended_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `TripsTripExtended` FOREIGN KEY (`TripId`) REFERENCES `Trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.TripLocations
CREATE TABLE IF NOT EXISTS `TripLocations` (
  `ID` int(10) NOT NULL,
  `TripId` int(10) DEFAULT NULL,
  `LocationId` int(10) DEFAULT NULL,
  `Category` int(10) DEFAULT NULL,
  `ArrivalDate` int(10) DEFAULT NULL,
  `DepartureDate` int(10) DEFAULT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LookupsTripLocations` (`Category`),
  KEY `TripsTripLocations` (`TripId`),
  KEY `LocationsTripLocations` (`LocationId`),
  KEY `FK_TripLocations_Users` (`UserCreated`),
  KEY `FK_TripLocations_Users_2` (`UserModified`),
  CONSTRAINT `FK_TripLocations_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_TripLocations_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `LocationsTripLocations` FOREIGN KEY (`LocationId`) REFERENCES `Locations` (`ID`),
  CONSTRAINT `LookupsTripLocations` FOREIGN KEY (`Category`) REFERENCES `Lookups` (`ID`),
  CONSTRAINT `TripsTripLocations` FOREIGN KEY (`TripId`) REFERENCES `Trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.TripMeals
CREATE TABLE IF NOT EXISTS `TripMeals` (
  `ID` int(10) NOT NULL,
  `MealId` int(10) DEFAULT NULL,
  `TripId` int(10) DEFAULT NULL,
  `PeopleId` int(10) DEFAULT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TripTripMeals` (`TripId`),
  KEY `PeopleTripMeals` (`PeopleId`),
  KEY `MealsTripMeals` (`MealId`),
  KEY `FK_TripMeals_Users` (`UserCreated`),
  KEY `FK_TripMeals_Users_2` (`UserModified`),
  CONSTRAINT `FK_TripMeals_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_TripMeals_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `MealsTripMeals` FOREIGN KEY (`MealId`) REFERENCES `Meals` (`ID`),
  CONSTRAINT `PeopleTripMeals` FOREIGN KEY (`PeopleId`) REFERENCES `People` (`ID`),
  CONSTRAINT `TripTripMeals` FOREIGN KEY (`TripId`) REFERENCES `Trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.TripPeople
CREATE TABLE IF NOT EXISTS `TripPeople` (
  `ID` int(10) NOT NULL,
  `PeopleId` int(10) DEFAULT NULL,
  `TripId` int(10) DEFAULT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TripTripPeople` (`TripId`),
  KEY `PeopleTripPeople` (`PeopleId`),
  KEY `FK_TripPeople_Users` (`UserCreated`),
  KEY `FK_TripPeople_Users_2` (`UserModified`),
  CONSTRAINT `FK_TripPeople_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_TripPeople_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `PeopleTripPeople` FOREIGN KEY (`PeopleId`) REFERENCES `People` (`ID`),
  CONSTRAINT `TripTripPeople` FOREIGN KEY (`TripId`) REFERENCES `Trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.TripShopping
CREATE TABLE IF NOT EXISTS `TripShopping` (
  `ID` int(10) NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category` int(10) DEFAULT NULL,
  `Store` int(10) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `Note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LookupsShopping` (`Category`),
  KEY `LookupsShopping1` (`Store`),
  KEY `FK_TripShopping_Users` (`UserCreated`),
  KEY `FK_TripShopping_Users_2` (`UserModified`),
  CONSTRAINT `FK_TripShopping_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_TripShopping_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`),
  CONSTRAINT `LookupsShopping` FOREIGN KEY (`Category`) REFERENCES `Lookups` (`ID`),
  CONSTRAINT `LookupsShopping1` FOREIGN KEY (`Store`) REFERENCES `Lookups` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.Users
CREATE TABLE IF NOT EXISTS `Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `LastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `TimeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `TimeModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserCreated` int(10) DEFAULT NULL,
  `UserModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Users_Users` (`UserCreated`),
  KEY `FK_Users_Users_2` (`UserModified`),
  CONSTRAINT `FK_Users_Users` FOREIGN KEY (`UserCreated`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK_Users_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
