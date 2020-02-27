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

-- Dumping structure for table dev-tripper.equipment
CREATE TABLE IF NOT EXISTS `equipment` (
  `id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `location` int(10) DEFAULT NULL,
  `quantityOnHand` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `isMaintenance` tinyint(1) DEFAULT NULL,
  `serialNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(11) DEFAULT NULL,
  `userModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Created By` (`userCreated`),
  KEY `Category` (`category`),
  KEY `Location` (`location`),
  KEY `Updated By` (`userModified`),
  CONSTRAINT `Category` FOREIGN KEY (`category`) REFERENCES `lookups` (`ID`),
  CONSTRAINT `Created By` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `Location` FOREIGN KEY (`Location`) REFERENCES `lookups` (`ID`),
  CONSTRAINT `Updated By` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(11) DEFAULT NULL,
  `userModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User Created` (`userCreated`),
  KEY `Modified User` (`userModified`),
  CONSTRAINT `Modified User` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `User Created` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.locationsExtended
CREATE TABLE IF NOT EXISTS `locationsExtended` (
  `id` int(10) NOT NULL,
  `locationId` int(10) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(11) DEFAULT NULL,
  `userModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Location Id` (`locationId`),
  KEY `UserCreated` (`userCreated`),
  KEY `UserModified` (`userModified`),
  CONSTRAINT `Location Id` FOREIGN KEY (`locationId`) REFERENCES `locations` (`ID`),
  CONSTRAINT `UserCreated` FOREIGN KEY (`userCreated`) REFERENCES `users` (`id`),
  CONSTRAINT `UserModified` FOREIGN KEY (`userModified`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.log
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(11) DEFAULT NULL,
  `userModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Modified User Log` (`userModified`),
  KEY `Created User Log` (`userCreated`),
  CONSTRAINT `Created User Log` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `Modified User Log` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.lookups
CREATE TABLE IF NOT EXISTS `lookups` (
  `id` int(10) NOT NULL,
  `table` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(11) DEFAULT NULL,
  `userModified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Lookups_Users` (`userCreated`),
  KEY `FK_Lookups_Users_2` (`userModified`),
  CONSTRAINT `FK_Lookups_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_Lookups_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.maintenance
CREATE TABLE IF NOT EXISTS `maintenance` (
  `id` int(10) NOT NULL,
  `equipmentId` int(10) DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `dateMaintained` datetime DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EquipmentMaintence` (`equipmentId`),
  KEY `UserCreatedMaintence` (`userCreated`),
  KEY `UserModifiedMaintence` (`userModified`),
  CONSTRAINT `EquipmentMaintence` FOREIGN KEY (`EquipmentId`) REFERENCES `equipment` (`ID`),
  CONSTRAINT `UserCreatedMaintence` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `UserModifiedMaintence` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.meals
CREATE TABLE IF NOT EXISTS `meals` (
  `id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `cuisine` int(10) DEFAULT NULL,
  `receipe` longtext COLLATE utf8mb4_unicode_ci,
  `ingredients` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LookupsMeals1` (`cuisine`),
  KEY `LookupsMeals` (`category`),
  KEY `FK_Meals_Users` (`userCreated`),
  KEY `FK_Meals_Users_2` (`userModified`),
  CONSTRAINT `FK_Meals_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_Meals_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `LookupsMeals` FOREIGN KEY (`Category`) REFERENCES `lookups` (`ID`),
  CONSTRAINT `LookupsMeals1` FOREIGN KEY (`Cuisine`) REFERENCES `lookups` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.people
CREATE TABLE IF NOT EXISTS `people` (
  `id` int(10) NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(243) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_People_Users` (`userCreated`),
  KEY `FK_People_Users_2` (`userModified`),
  CONSTRAINT `FK_People_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_People_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.trip
CREATE TABLE IF NOT EXISTS `trip` (
  `id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LookupsTrips` (`category`),
  KEY `FK_Trip_Users` (`userCreated`),
  KEY `FK_Trip_Users_2` (`userModified`),
  CONSTRAINT `FK_Trip_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_Trip_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `LookupsTrips` FOREIGN KEY (`Category`) REFERENCES `lookups` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.tripEquipment
CREATE TABLE IF NOT EXISTS `tripEquipment` (
  `id` int(10) NOT NULL,
  `tripId` int(10) DEFAULT NULL,
  `equipmentId` int(10) DEFAULT NULL,
  `quantityPacked` int(10) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EquipmentInventoryTripEquipment` (`equipmentId`),
  KEY `TripTripEquipment` (`tripId`),
  KEY `FK_TripEquipment_Users` (`userCreated`),
  KEY `FK_TripEquipment_Users_2` (`userModified`),
  CONSTRAINT `EquipmentInventoryTripEquipment` FOREIGN KEY (`EquipmentId`) REFERENCES `equipment` (`ID`),
  CONSTRAINT `FK_TripEquipment_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_TripEquipment_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `TripTripEquipment` FOREIGN KEY (`TripId`) REFERENCES `trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.tripExtended
CREATE TABLE IF NOT EXISTS `tripExtended` (
  `id` int(10) NOT NULL,
  `tripId` int(10) DEFAULT NULL,
  `dog` tinyint(1) NOT NULL,
  `travelTrailer` tinyint(1) NOT NULL,
  `truck` tinyint(1) NOT NULL,
  `skiing` tinyint(1) NOT NULL,
  `fireworks` tinyint(1) NOT NULL,
  `rvPark` tinyint(1) NOT NULL,
  `beach` tinyint(1) NOT NULL,
  `desert` tinyint(1) NOT NULL,
  `water` tinyint(1) NOT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TripsTripExtended` (`tripId`),
  KEY `FK_TripExtended_Users` (`userCreated`),
  KEY `FK_TripExtended_Users_2` (`userModified`),
  CONSTRAINT `FK_TripExtended_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_TripExtended_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `TripsTripExtended` FOREIGN KEY (`TripId`) REFERENCES `trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.tripLocations
CREATE TABLE IF NOT EXISTS `tripLocations` (
  `id` int(10) NOT NULL,
  `tripId` int(10) DEFAULT NULL,
  `locationId` int(10) DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `arrivalDate` int(10) DEFAULT NULL,
  `departureDate` int(10) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LookupsTripLocations` (`category`),
  KEY `TripsTripLocations` (`tripId`),
  KEY `LocationsTripLocations` (`locationId`),
  KEY `FK_TripLocations_Users_2` (`userModified`),
  KEY `FK_TripLocations_Users` (`userCreated`),
  CONSTRAINT `FK_TripLocations_Users` FOREIGN KEY (`userCreated`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_TripLocations_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `LocationsTripLocations` FOREIGN KEY (`LocationId`) REFERENCES `locations` (`ID`),
  CONSTRAINT `LookupsTripLocations` FOREIGN KEY (`Category`) REFERENCES `lookups` (`ID`),
  CONSTRAINT `TripsTripLocations` FOREIGN KEY (`TripId`) REFERENCES `trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.tripMeals
CREATE TABLE IF NOT EXISTS `tripMeals` (
  `id` int(10) NOT NULL,
  `mealId` int(10) DEFAULT NULL,
  `tripId` int(10) DEFAULT NULL,
  `peopleId` int(10) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TripTripMeals` (`tripId`),
  KEY `PeopleTripMeals` (`peopleId`),
  KEY `MealsTripMeals` (`mealId`),
  KEY `FK_TripMeals_Users` (`userCreated`),
  KEY `FK_TripMeals_Users_2` (`userModified`),
  CONSTRAINT `FK_TripMeals_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_TripMeals_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `MealsTripMeals` FOREIGN KEY (`MealId`) REFERENCES `meals` (`ID`),
  CONSTRAINT `PeopleTripMeals` FOREIGN KEY (`PeopleId`) REFERENCES `people` (`ID`),
  CONSTRAINT `TripTripMeals` FOREIGN KEY (`TripId`) REFERENCES `trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.tripPeople
CREATE TABLE IF NOT EXISTS `tripPeople` (
  `id` int(10) NOT NULL,
  `peopleId` int(10) DEFAULT NULL,
  `tripId` int(10) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TripTripPeople` (`tripId`),
  KEY `PeopleTripPeople` (`peopleId`),
  KEY `FK_TripPeople_Users` (`userCreated`),
  KEY `FK_TripPeople_Users_2` (`userModified`),
  CONSTRAINT `FK_TripPeople_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_TripPeople_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `PeopleTripPeople` FOREIGN KEY (`PeopleId`) REFERENCES `people` (`ID`),
  CONSTRAINT `TripTripPeople` FOREIGN KEY (`TripId`) REFERENCES `trip` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.tripShopping
CREATE TABLE IF NOT EXISTS `tripShopping` (
  `id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `store` int(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LookupsShopping` (`category`),
  KEY `LookupsShopping1` (`store`),
  KEY `FK_TripShopping_Users` (`userCreated`),
  KEY `FK_TripShopping_Users_2` (`userModified`),
  CONSTRAINT `FK_TripShopping_Users` FOREIGN KEY (`UserCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_TripShopping_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`),
  CONSTRAINT `LookupsShopping` FOREIGN KEY (`Category`) REFERENCES `lookups` (`ID`),
  CONSTRAINT `LookupsShopping1` FOREIGN KEY (`Store`) REFERENCES `lookups` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev-tripper.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `timeModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userCreated` int(10) DEFAULT NULL,
  `userModified` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Users_Users_2` (`userModified`),
  KEY `FK_Users_Users` (`userCreated`),
  CONSTRAINT `FK_Users_Users` FOREIGN KEY (`userCreated`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_Users_Users_2` FOREIGN KEY (`UserModified`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
