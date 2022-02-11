-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2022 at 01:47 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbims`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_ID` int(11) NOT NULL,
  `admin_Name` varchar(100) NOT NULL,
  `admin_PhoneNo` varchar(11) NOT NULL,
  `admin_Username` varchar(50) NOT NULL,
  `admin_Email` varchar(100) NOT NULL,
  `admin_Password` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_ID`, `admin_Name`, `admin_PhoneNo`, `admin_Username`, `admin_Email`, `admin_Password`) VALUES
(1, 'Master Admin', '074288133', 'admin', 'admin@clovabookstore.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_ID` int(11) NOT NULL,
  `category_ID` int(11) NOT NULL,
  `book_Title` varchar(100) NOT NULL,
  `book_ISBN` varchar(13) NOT NULL,
  `book_AuthorName` varchar(100) NOT NULL,
  `book_Description` text NOT NULL,
  `book_Price` decimal(11,2) NOT NULL,
  `book_NoOfStocks` int(11) NOT NULL,
  `supplier_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_ID`, `category_ID`, `book_Title`, `book_ISBN`, `book_AuthorName`, `book_Description`, `book_Price`, `book_NoOfStocks`, `supplier_ID`) VALUES
(1, 1, 'Advanced Malaysian Taxation: Principles and Practice', '9789672289043', 'Choong Kwai Fatt', 'A book that covers the wide spectrum and diversity of advanced aspect of tax law ranging from income tax and real property gains tax to tax incentives, stamp duty, Labuan and service tax.', '200.00', 50, 3),
(2, 3, 'Long Walk to Freedom : The Autobiography of Nelson Mandela', '9780316034784', 'Nelson Mandela', 'Autobiography of the president of the African National Congress, Nelson Mandela - an epic account of struggle, setback, renewed hope, and ultimate triumph.', '60.00', 100, 2),
(3, 2, 'Raspberry Pi For Dummies', '9781119796824', 'Sean McManus', 'Sean McManus make it easier than ever to get you up and running on your Raspberry Pi, from setting it up, downloading the OS, programming with Scratch? and everything in between.', '99.00', 40, 1),
(4, 2, 'NFTs For Dummies', '9781119843313', 'Tiana Laurence', 'You\'ll find straightforward answers to critical aspects of the NFT phenomenon and learn exactly what non-fungible tokens really are, how you can find them, and even how to create your own valuable NFTs.', '81.00', 120, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_ID` int(11) NOT NULL,
  `category_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_ID`, `category_Name`) VALUES
(1, 'Accounting and Finance'),
(2, 'Computing and Internet'),
(3, 'Humanities and Biographies');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `customer_Name` varchar(100) NOT NULL,
  `customer_PhoneNo` varchar(11) NOT NULL,
  `customer_Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderDetails_ID` int(11) NOT NULL,
  `book_ID` int(11) NOT NULL,
  `customer_Name` varchar(100) NOT NULL,
  `orderDetails_Price` varchar(200) NOT NULL,
  `orderDetails_Quantity` int(11) NOT NULL,
  `orderDetails_TotalPrice` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` int(11) NOT NULL,
  `customer_ID` int(11) NOT NULL,
  `order_DateTime` datetime NOT NULL,
  `order_TotalPrice` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_ID` int(11) NOT NULL,
  `supplier_Name` varchar(100) NOT NULL,
  `supplier_Address` varchar(100) NOT NULL,
  `supplier_Postcode` varchar(5) NOT NULL,
  `supplier_City` varchar(50) NOT NULL,
  `supplier_State` varchar(50) NOT NULL,
  `supplier_PhoneNo` varchar(11) NOT NULL,
  `supplier_Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_ID`, `supplier_Name`, `supplier_Address`, `supplier_Postcode`, `supplier_City`, `supplier_State`, `supplier_PhoneNo`, `supplier_Email`) VALUES
(1, 'For Dummies (M) Sdn Bhd', 'No. 45, Jalan Nilam 1/2, Subang Hi-tech Industrial Park', '40000', 'Shah Alam', 'Selangor', '03-56387708', 'info@fordummies.com'),
(2, 'Gerakbudaya', '2, Jalan Bukit 11/2, Seksyen 11 Petaling Jaya', '46200', 'Petaling Jaya', 'Selangor', '03-79578342', 'info@gerakbudaya.com'),
(3, 'Infoworld Publisher & Distributors', ' 25, Jalan DBP, Dolomite Business Park', '68100', 'Batu Caves', 'Selangor', '03-55198262', 'info@infoworld.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderDetails_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderDetails_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
