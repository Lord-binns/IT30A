-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 03:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olemberioddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Customer` varchar(100) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `EmployeeID`, `CustomerID`, `Customer`, `OrderDate`, `ShippedDate`, `ShipperID`) VALUES
(1, 1, 101, 'binns', '2024-10-10', '2024-10-12', 1),
(2, 2, 102, 'vince', '2024-10-11', '2024-10-13', 2),
(3, 3, 103, 'khailee', '2024-10-12', '2024-10-14', 3),
(4, 4, 104, 'kenneth', '2024-10-13', '2024-10-15', 1),
(5, 5, 105, 'kane', '2024-10-14', '2024-10-16', 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `ProductID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(5,2) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`ProductID`, `OrderID`, `Quantity`, `UnitPrice`, `Discount`, `StatusID`) VALUES
(1, 1, 2, 555.00, 2.00, 1),
(2, 2, 3, 100.00, 5.00, 2),
(3, 3, 5, 250.00, 5.00, 3),
(4, 4, 3, 60.00, 1.00, 1),
(5, 5, 4, 500.00, 25.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductCode` varchar(50) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `StandardCost` decimal(10,2) DEFAULT NULL,
  `ListPrice` decimal(10,2) DEFAULT NULL,
  `ReorderLevel` int(11) DEFAULT NULL,
  `TargetLevel` int(11) DEFAULT NULL,
  `QuantityPerUnit` int(11) DEFAULT NULL,
  `Discontinued` tinyint(1) DEFAULT NULL,
  `MinimumReorder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductCode`, `ProductName`, `Description`, `StandardCost`, `ListPrice`, `ReorderLevel`, `TargetLevel`, `QuantityPerUnit`, `Discontinued`, `MinimumReorder`) VALUES
(1, '001', 'Boots', 'Brown boots', 300.00, 555.00, 50, 100, 10, 0, 25),
(2, '002', 'Gloves', 'Black gloves', 80.00, 100.00, 40, 80, 18, 0, 20),
(3, '003', 'Hat', 'Red hat', 150.00, 250.00, 30, 60, 50, 0, 15),
(4, '004', 'Shirt', 'Yellow shirt', 40.00, 60.00, 20, 40, 20, 0, 10),
(5, '005', 'Shorts', 'White shorts', 500.00, 500.00, 10, 20, 12, 0, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`ProductID`,`OrderID`),
  ADD KEY `order_details_fk_1` (`OrderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_fk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_fk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
