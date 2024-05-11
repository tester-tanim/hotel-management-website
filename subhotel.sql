-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 06:42 PM
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
-- Database: `subhotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_cred`
--

CREATE TABLE `admin_cred` (
  `sr_no` int(11) NOT NULL,
  `admin_name` varchar(150) NOT NULL,
  `admin_pass` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_cred`
--

INSERT INTO `admin_cred` (`sr_no`, `admin_name`, `admin_pass`) VALUES
(1, 'admin', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `room_no` varchar(11) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`sr_no`, `booking_id`, `room_name`, `price`, `total_pay`, `room_no`, `user_name`, `phonenum`, `address`) VALUES
(64, 69, 'Simple Room', 2500, 5000, '1', 'Ishtiaque Ahmed', '01557272482', '147/o,Christian Golli,East Rajabazar'),
(65, 70, 'Deluxe Room', 5000, 10000, '2', 'Ishtiaque Ahmed', '01557272482', '147/o,Christian Golli,East Rajabazar'),
(66, 71, 'Double', 3000, 12000, '22', 'Ishtiaque Ahmed', '01557272482', '147/o,Christian Golli,East Rajabazar'),
(67, 72, 'normal', 1000, 9000, '44', 'Ishtiaque Ahmed', '01557272482', '147/o,Christian Golli,East Rajabazar'),
(68, 73, 'semi', 300, 600, '30', 'Ishtiaque Ahmed', '01557272482', '147/o,Christian Golli,East Rajabazar'),
(69, 74, 'poor', 222, 222, NULL, 'Ishtiaque Ahmed', '01557272482', '147/o,Christian Golli,East Rajabazar'),
(70, 75, 'poor', 222, 666, NULL, 'Ishtiaque Ahmed', '01557272482', '147/o,Christian Golli,East Rajabazar'),
(71, 76, 'Deluxe Room', 5000, 5000, NULL, 'Ishtiaque Ahmed', '01557272482', '147/o,Christian Golli,East Rajabazar'),
(72, 77, 'Cabana Room', 9000, 18000, 'A406', 'Esrat Jahan', '01793186906', 'MohammadPur'),
(73, 78, 'Lanai Room', 3500, 10500, 'A450', 'Esrat Jahan', '01793186906', 'MohammadPur'),
(74, 79, 'Standard room', 2000, 4000, '222', 'tttt', '016213351332', 'rajabazar'),
(75, 80, 'Double Room', 2000, 2000, '890', 'tttt', '016213351332', 'rajabazar'),
(76, 81, 'Double Deluxe Room', 6000, 6000, 'S-4002', 'tttt', '016213351332', 'rajabazar'),
(77, 82, 'Duplex Room', 6000, 12000, NULL, 'tttt', '016213351332', 'rajabazar'),
(78, 83, 'Standard room', 2000, 10000, NULL, 'ishtiaque', '016213351332', 'rajabazar'),
(79, 84, 'Twin Room', 1000, 2000, NULL, 'Joy Sarkar', '01724530105', 'Rajshahi');

-- --------------------------------------------------------

--
-- Table structure for table `booking_order`
--

CREATE TABLE `booking_order` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `arrival` int(11) NOT NULL DEFAULT 0,
  `refund` int(11) DEFAULT NULL,
  `booking_status` varchar(100) NOT NULL DEFAULT 'pending',
  `order_id` varchar(150) NOT NULL,
  `trans_id` varchar(200) DEFAULT NULL,
  `trans_amt` int(11) NOT NULL,
  `trans_status` varchar(100) NOT NULL DEFAULT 'pending',
  `trans_resp_msg` varchar(200) DEFAULT NULL,
  `rate_review` int(11) DEFAULT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_order`
--

INSERT INTO `booking_order` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `arrival`, `refund`, `booking_status`, `order_id`, `trans_id`, `trans_amt`, `trans_status`, `trans_resp_msg`, `rate_review`, `datentime`) VALUES
(69, 18, 3, '2023-11-09', '2023-11-11', 1, NULL, 'booked', 'ORD_182094569', '231109183651dJhtifb0d0qUttd', 5000, 'VALID', 'Payment successful', 1, '2023-11-09 18:36:46'),
(70, 18, 4, '2023-11-11', '2023-11-13', 1, NULL, 'booked', 'ORD_186483188', '231109183709g6k9zPx2TGPJ9eI', 10000, 'VALID', 'Payment successful', 1, '2023-11-09 18:37:06'),
(71, 18, 5, '2023-11-09', '2023-11-13', 1, NULL, 'booked', 'ORD_188828250', '231109183727nEo8R1vafhAqdKk', 12000, 'VALID', 'Payment successful', 1, '2023-11-09 18:37:23'),
(72, 18, 6, '2023-11-09', '2023-11-18', 1, NULL, 'booked', 'ORD_18592196', '2311091837490TrN1gbYviNlCKS', 9000, 'VALID', 'Payment successful', 1, '2023-11-09 18:37:45'),
(73, 18, 7, '2023-11-09', '2023-11-11', 1, NULL, 'booked', 'ORD_185881043', '2311091838081LASL6yPDyTGjCj', 600, 'VALID', 'Payment successful', 1, '2023-11-09 18:38:04'),
(74, 18, 8, '2023-11-10', '2023-11-11', 0, 1, 'cancelled', 'ORD_188011530', '231110101839CazdoCLnu3Udt9L', 222, 'VALID', 'Payment successful', NULL, '2023-11-10 10:18:35'),
(75, 18, 8, '2023-11-22', '2023-11-25', 0, 1, 'cancelled', 'ORD_186517666', '231110105414B1ArRpOyRMPQacF', 666, 'VALID', 'Payment successful', NULL, '2023-11-10 10:54:10'),
(76, 18, 4, '2023-11-13', '2023-11-14', 0, 1, 'cancelled', 'ORD_183359356', '231113194403YxjmO9fL71JHwCm', 5000, 'VALID', 'Payment successful', NULL, '2023-11-13 19:43:59'),
(77, 23, 14, '2023-11-22', '2023-11-24', 1, NULL, 'booked', 'ORD_236824219', '231121215435eTBOqQtN8cEDmZk', 18000, 'VALID', 'Payment successful', 1, '2023-11-21 21:54:20'),
(78, 23, 13, '2023-11-24', '2023-11-27', 1, NULL, 'booked', 'ORD_236836051', '231121220711ZSS9QqrQOAVUvhS', 10500, 'VALID', 'Payment successful', 1, '2023-11-21 22:07:07'),
(79, 19, 12, '2023-11-21', '2023-11-23', 1, NULL, 'booked', 'ORD_199620188', '2311212213130mCZ4enN8wlbfuB', 4000, 'VALID', 'Payment successful', 1, '2023-11-21 22:13:10'),
(80, 19, 5, '2023-11-21', '2023-11-22', 1, NULL, 'booked', 'ORD_195040691', '2311212229407te6nj4R3CqYbRO', 2000, 'VALID', 'Payment successful', 0, '2023-11-21 22:29:37'),
(81, 19, 9, '2023-11-23', '2023-11-24', 1, NULL, 'booked', 'ORD_19908635', '231121223001S99IpySO4pGtsdG', 6000, 'VALID', 'Payment successful', 0, '2023-11-21 22:29:58'),
(82, 19, 10, '2023-11-25', '2023-11-27', 0, 0, 'cancelled', 'ORD_191692816', '2311212231361FuoO6tvsEeA89z', 12000, 'VALID', 'Payment successful', NULL, '2023-11-21 22:31:32'),
(83, 19, 12, '2023-11-24', '2023-11-29', 0, NULL, 'booked', 'ORD_193206894', '231121223222nVb7Tq52efnd3Er', 10000, 'VALID', 'Payment successful', NULL, '2023-11-21 22:32:19'),
(84, 24, 6, '2023-12-11', '2023-12-13', 0, NULL, 'booked', 'ORD_241477361', '2312112315501sEadXtGf2zwvG5', 2000, 'VALID', 'Payment successful', NULL, '2023-12-11 23:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `sr_no` int(11) NOT NULL,
  `image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`sr_no`, `image`) VALUES
(13, 'IMG_72043.jpg'),
(14, 'IMG_55542.jpg'),
(15, 'IMG_92362.jpg'),
(16, 'IMG_31807.jpg'),
(17, 'IMG_53539.jpg'),
(18, 'IMG_81153.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `sr_no` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gmap` varchar(100) NOT NULL,
  `pn1` bigint(20) NOT NULL,
  `pn2` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `insta` varchar(100) NOT NULL,
  `tw` varchar(100) NOT NULL,
  `iframe` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`sr_no`, `address`, `gmap`, `pn1`, `pn2`, `email`, `fb`, `insta`, `tw`, `iframe`) VALUES
(1, 'Sangsad', 'https://goo.gl/maps/ci5K7w94hei2NB4k9', 8801621352222, 8801557272482, 'ishtiaqueahmed@gmail.com', 'https://www.facebook.com/ishtiaque.ahamed.92', 'https://www.instagram.com/ishtiaque1998/', 'https://twitter.com/Ishtiaque0155', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7303.774318689983!2d90.367539!3d23.751403!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755bf502e922537:0xab8a4ec73cf72870!2sState University of Bangladesh!5e0!3m2!1sen!2sbd!4v1689955632667!5m2!1sen!2sbd');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `username`, `password`, `role`) VALUES
(11, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Admin'),
(12, 'Tanim', '827ccb0eea8a706c4c34a16891f84e7b', 'Employee'),
(13, 'ovi', '827ccb0eea8a706c4c34a16891f84e7b', 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `icon`, `name`, `description`) VALUES
(13, 'IMG_17039.svg', 'TV', 'All channels are available'),
(15, 'IMG_37593.svg', 'Room Heater', 'Remote controllable'),
(17, 'IMG_79795.svg', 'Geyser', 'Hot and Cold shower'),
(18, 'IMG_75017.svg', 'Hair Dryer', 'Dry Hair'),
(19, 'IMG_36397.svg', 'Wifi', 'fasted Internet'),
(20, 'IMG_80054.svg', 'SPA', 'Relaxation'),
(21, 'IMG_69684.svg', 'AirCondioner', 'nothing'),
(24, 'IMG_40702.svg', 'Swimming Pool', 'We have plenty of space for a lot of people'),
(26, 'IMG_91861.svg', 'sauna', 'Sauna benefits may include easing pain, reducing stress, and improving cardiovascular health. Sweating has long been used as a therapy.'),
(27, 'IMG_46620.svg', 'luggage carrier', 'Don&#039;t have to worry about it. Our Staff carry it to your room.'),
(28, 'IMG_59616.svg', 'Parking', 'Plenty area for parking'),
(29, 'IMG_21025.svg', 'Laundry', 'We have a Laundry Service. You have to pay for it.'),
(30, 'IMG_79585.svg', 'Gym', 'Keep your fitness healthy');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`) VALUES
(11, 'Balcony'),
(12, 'Kitchen'),
(13, 'Roof'),
(14, 'Coffee-makers'),
(15, 'Mini-bars'),
(16, 'Refrigerators');

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(200) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating_review`
--

INSERT INTO `rating_review` (`sr_no`, `booking_id`, `room_id`, `user_id`, `rating`, `review`, `seen`, `datentime`) VALUES
(5, 73, 7, 18, 4, 'The room itself was well-appointed and thoughtfully designed. The decor was modern and inviting, and the amenities provided were more than adequate for a comfortable stay. The bed was exceptionally co', 1, '2023-11-09 18:40:09'),
(6, 72, 6, 18, 5, 'The room itself was well-appointed and thoughtfully designed. The decor was modern and inviting, and the amenities provided were more than adequate for a comfortable stay. The bed was exceptionally co', 1, '2023-11-09 18:40:15'),
(7, 71, 5, 18, 3, 'The room itself was well-appointed and thoughtfully designed. The decor was modern and inviting, and the amenities provided were more than adequate for a comfortable stay. The bed was exceptionally co', 1, '2023-11-09 18:40:20'),
(8, 70, 4, 18, 2, 'The room itself was well-appointed and thoughtfully designed. The decor was modern and inviting, and the amenities provided were more than adequate for a comfortable stay. The bed was exceptionally co', 1, '2023-11-09 18:40:27'),
(9, 69, 3, 18, 1, 'The room itself was well-appointed and thoughtfully designed. The decor was modern and inviting, and the amenities provided were more than adequate for a comfortable stay. The bed was exceptionally co', 1, '2023-11-09 18:40:36'),
(10, 77, 14, 23, 5, 'Excellent Service and staff behavior is really nice', 0, '2023-11-21 22:00:46'),
(11, 78, 13, 23, 5, 'Excellent Service and staff behavior is really nice', 0, '2023-11-21 22:08:08'),
(12, 79, 12, 19, 4, 'nice rooms', 0, '2023-11-21 22:14:03');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `area` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `description` varchar(350) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `removed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `area`, `price`, `quantity`, `adult`, `children`, `description`, `status`, `removed`) VALUES
(1, 'simple', 150, 580, 20, 15, 5, 'description', 1, 1),
(2, 'Double', 200, 4500, 5, 3, 2, '2nd', 1, 1),
(3, 'Simple Room', 150, 1500, 5, 1, 1, 'A room with the facility of single bed. It is meant for single occupancy. It has an attached bathroom, a small dressing table, a small bedside table, and a small writing table. Sometimes it has a single chair too.', 1, 0),
(4, 'Single Deluxe Room', 250, 5000, 3, 3, 2, 'The Deluxe room is well furnished. Some amenities are an attached bathroom, a dressing table, a bedside table, a small writing table, a TV, and a small fridge. The floor is covered with carpet and is most suitable for small families.', 1, 0),
(5, 'Double Room', 200, 2000, 5, 2, 2, 'A room with the facility of double bed. There are two variants in this type depending upon the size of the bed-\r\nKing Double Room (with king size double bed)\r\nQueen Double Room (with queen size double bed)\r\nIt is equipped with adequate furniture such as dressing table and a writing table, a TV, and a small fridge.', 1, 0),
(6, 'Twin Room', 200, 1000, 5, 2, 1, 'This room provides two single beds with separate headboards. It is meant for two independent people. It also has a single bedside table shared between the two beds', 1, 0),
(7, 'Queen Room', 400, 2500, 3, 4, 1, 'A queen room has a queen-size bed. The size of the bed is 5 feet by 6 feet. An extra bed may be added to this room at the request of a guest and charged accordingly.', 1, 0),
(8, 'DOUBLE DOUBLE', 200, 2000, 1, 4, 1, 'This room provides two double beds with separate headboards. It is ideal for a family with two children below 12 years.', 1, 0),
(9, 'Double Deluxe Room', 400, 6000, 1, 4, 4, 'Deluxe room is well furnished. Some amenities are attached bathroom, a dressing table, a bedside table, a small writing table, a TV, and a small fridge. The floor is covered with carpet and most suitable for small families.', 1, 0),
(10, 'Duplex Room', 350, 6000, 1, 4, 3, 'This type is composed of two rooms located on two different floors, connected with internal stairs.', 1, 0),
(11, 'Studio', 600, 10000, 1, 6, 4, 'A living room with sofa, coffee table and chairs, and a bedroom. It is also equipped with fan/air conditioner, a small kitchen corner, and a dining area. The furniture is often compact.', 1, 0),
(12, 'Standard room', 100, 2000, 6, 2, 2, 'Great for a solo traveler or a couple. Expect a double bed', 1, 0),
(13, 'Lanai Room', 300, 3500, 3, 5, 4, 'A Lanai has a veranda or roofed patio and is often furnished and used as a living room. It generally has a view of a garden or seashore', 1, 0),
(14, 'Cabana Room', 600, 9000, 1, 4, 2, 'A Cabana is situated away from the main hotel building, in the vicinity of a swimming pool or sea beach. It may or may not have beds and is generally used as a changing room and not as a bedroom.', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_facilities`
--

CREATE TABLE `room_facilities` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `facilities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_facilities`
--

INSERT INTO `room_facilities` (`sr_no`, `room_id`, `facilities_id`) VALUES
(64, 3, 13),
(65, 3, 19),
(66, 3, 21),
(67, 5, 13),
(68, 5, 15),
(69, 5, 17),
(70, 5, 18),
(71, 5, 19),
(72, 5, 27),
(73, 4, 13),
(74, 4, 15),
(75, 4, 17),
(76, 4, 18),
(77, 4, 19),
(78, 4, 21),
(79, 4, 27),
(80, 4, 29),
(81, 4, 30),
(82, 9, 13),
(83, 9, 15),
(84, 9, 17),
(85, 9, 18),
(86, 9, 19),
(87, 9, 21),
(88, 9, 24),
(89, 9, 27),
(90, 9, 28),
(91, 9, 29),
(92, 9, 30),
(93, 8, 13),
(94, 8, 15),
(95, 8, 18),
(96, 8, 19),
(97, 8, 21),
(98, 6, 13),
(99, 6, 15),
(100, 6, 17),
(101, 6, 18),
(102, 10, 13),
(103, 10, 15),
(104, 10, 17),
(105, 10, 18),
(106, 10, 19),
(107, 10, 21),
(108, 10, 24),
(109, 10, 26),
(110, 10, 27),
(111, 10, 28),
(112, 10, 29),
(113, 10, 30),
(114, 11, 13),
(115, 11, 15),
(116, 11, 17),
(117, 11, 18),
(118, 11, 19),
(119, 11, 20),
(120, 11, 21),
(121, 11, 24),
(122, 11, 26),
(123, 11, 27),
(124, 11, 28),
(125, 11, 29),
(126, 11, 30),
(127, 12, 13),
(128, 12, 17),
(129, 12, 18),
(130, 12, 21),
(131, 13, 13),
(132, 13, 18),
(133, 13, 19),
(134, 13, 21),
(135, 13, 28),
(136, 13, 30),
(137, 14, 13),
(138, 14, 17),
(139, 14, 18),
(140, 14, 19),
(141, 14, 24),
(142, 14, 28),
(143, 14, 30),
(144, 7, 13),
(145, 7, 15),
(146, 7, 17),
(147, 7, 18),
(148, 7, 19),
(149, 7, 20),
(150, 7, 21);

-- --------------------------------------------------------

--
-- Table structure for table `room_features`
--

CREATE TABLE `room_features` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `features_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_features`
--

INSERT INTO `room_features` (`sr_no`, `room_id`, `features_id`) VALUES
(21, 5, 14),
(22, 4, 11),
(23, 4, 12),
(24, 4, 14),
(25, 4, 15),
(26, 4, 16),
(27, 9, 11),
(28, 9, 12),
(29, 9, 14),
(30, 9, 15),
(31, 9, 16),
(32, 8, 11),
(33, 8, 14),
(34, 6, 11),
(35, 6, 14),
(36, 6, 16),
(37, 10, 11),
(38, 10, 12),
(39, 10, 13),
(40, 10, 14),
(41, 10, 15),
(42, 10, 16),
(43, 11, 11),
(44, 11, 12),
(45, 11, 13),
(46, 11, 14),
(47, 11, 15),
(48, 11, 16),
(49, 12, 14),
(50, 12, 16),
(51, 13, 11),
(52, 13, 13),
(53, 13, 14),
(54, 13, 16),
(55, 14, 11),
(56, 14, 12),
(57, 14, 14),
(58, 14, 16),
(59, 7, 11),
(60, 7, 12),
(61, 7, 13);

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `thumb` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`sr_no`, `room_id`, `image`, `thumb`) VALUES
(12, 5, 'IMG_60468.jpg', 0),
(14, 6, 'IMG_64251.jpg', 0),
(18, 5, 'IMG_55705.png', 0),
(19, 6, 'IMG_62727.png', 1),
(23, 8, 'IMG_16092.jpg', 0),
(24, 3, 'IMG_54978.jpg', 1),
(25, 3, 'IMG_75110.jpg', 0),
(26, 3, 'IMG_48413.jpg', 0),
(27, 5, 'IMG_42599.jpg', 1),
(28, 4, 'IMG_88187.jpg', 1),
(29, 4, 'IMG_28536.jpg', 0),
(30, 4, 'IMG_99551.jpg', 0),
(31, 6, 'IMG_79708.jpg', 0),
(32, 7, 'IMG_72585.jpg', 0),
(33, 7, 'IMG_36858.jpg', 1),
(34, 7, 'IMG_82251.jpg', 0),
(35, 8, 'IMG_24998.jpg', 1),
(36, 8, 'IMG_47784.jpg', 0),
(37, 9, 'IMG_84626.jpg', 1),
(38, 9, 'IMG_47503.jpg', 0),
(39, 9, 'IMG_20527.jpg', 0),
(40, 10, 'IMG_13332.jpg', 1),
(41, 10, 'IMG_97774.jpg', 0),
(42, 10, 'IMG_38833.jpg', 0),
(43, 11, 'IMG_19541.jpg', 1),
(44, 11, 'IMG_29418.jpg', 0),
(45, 12, 'IMG_55319.jpg', 1),
(46, 12, 'IMG_46219.jpg', 0),
(47, 13, 'IMG_87417.jpg', 1),
(48, 13, 'IMG_45308.jpg', 0),
(49, 14, 'IMG_18841.jpg', 0),
(50, 14, 'IMG_35949.jpg', 1),
(51, 14, 'IMG_51808.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `sr_no` int(11) NOT NULL,
  `site_title` varchar(50) NOT NULL,
  `site_about` varchar(250) NOT NULL,
  `shutdown` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`sr_no`, `site_title`, `site_about`, `shutdown`) VALUES
(1, 'SUBHOTEL', 'ABout US this an update', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_details`
--

CREATE TABLE `team_details` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `picture` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_details`
--

INSERT INTO `team_details` (`sr_no`, `name`, `picture`) VALUES
(5, 'Ishtiaque Ahmed Tanim', 'IMG_82365.jpg'),
(6, 'Polash', 'IMG_72594.jpg'),
(11, 'Arindom', 'IMG_39750.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tran_date` datetime DEFAULT NULL,
  `tran_id` varchar(255) DEFAULT NULL,
  `val_id` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `store_amount` decimal(10,2) DEFAULT NULL,
  `bank_tran_id` varchar(255) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_cred`
--

CREATE TABLE `user_cred` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(120) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `token` varchar(200) DEFAULT NULL,
  `t_expire` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_cred`
--

INSERT INTO `user_cred` (`id`, `name`, `email`, `address`, `phonenum`, `profile`, `password`, `is_verified`, `token`, `t_expire`, `status`, `datentime`) VALUES
(18, 'Ishtiaque Ahmed', 'ishtiaqueahmed1998@gmail.com', '147/o,Christian Golli,East Rajabazar', '01557272482', 'IMG_91184.jpeg', '$2y$10$SqX/b/CBaKT.AMF/VUfVveNzjPfmkvEnH0d0rCIguh8Eat5f.jwpK', 1, '983f308201cbfab808566502d17dc588', NULL, 1, '2023-10-23 23:35:28'),
(19, 'Sakib Mahmud', 'subhotel98@gmail.com', 'RajaBazar', '016213351332', 'IMG_38192.jpeg', '$2y$10$vdByj8n1cid7lY4wjKSl0e3s0QvNSKnw2PsqoEpxK.x8I/9/UeHr.', 1, '78df9513e62517423f72a64de9610e20', NULL, 1, '2023-11-01 12:16:50'),
(23, 'Mohammad Nafiz', 'searching581@gmail.com', 'MohammadPur', '01793186906', 'IMG_36843.jpeg', '$2y$10$nFINuXXnjCdsKk/3QbvQjOEZugOr2SiQ9SaR36yDWwLEd95t5NMmC', 1, 'a0427d2d41b902fa591d448310698c18', NULL, 1, '2023-11-21 21:52:34'),
(24, 'Joy Sarkar', 'ishtiaqueahmed7272482@gmail.com', 'Rajshahi', '01724530105', 'IMG_64257.jpeg', '$2y$10$howrkPLQgFS6pTr9/ijfbexJbevJcmTZxRqg51cqUHi66rEAutv0C', 1, '97d6b1ac81a5d91c16cd96cae4a9de50', NULL, 1, '2023-12-11 23:13:28'),
(25, 'Esrat Jahan', 'esrat8691@gmail.com', 'KhagraChari', '01793186900', 'IMG_47303.jpeg', '$2y$10$9oZuuedRY2Pc2AvC0btxNu9KqeVwtSHiqMv2PQe5/U1OZ8NBiGDrO', 1, '0bc5fd245630cc235954a57a36ecbd61', NULL, 1, '2023-12-11 23:19:59'),
(26, 'Khaled Saifullah Sadi', 'mda29861@gmail.com', 'Chittagong', '01557272800', 'IMG_50497.jpeg', '$2y$10$WErlEq0FBtKQHBTw7jzpIejf8gVRfuthzXOjwUjedPHcxDhGMM7h6', 1, '67ed6984f11bf285dec91cd809242d65', NULL, 1, '2023-12-11 23:27:33'),
(27, 'Miraz Hossain', 'ishtiaqueahmed1998@hotmail.com', 'ChandPur', '01770665277', 'IMG_80764.jpeg', '$2y$10$vEgdo36sqQJLnKxzBoueYOsxTCcn5Y.GtE4CHHDJYqxo.lm3DxF.G', 1, '19f0d3a2030f5465ee6c165da4809ac7', NULL, 1, '2023-12-11 23:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_queries`
--

CREATE TABLE `user_queries` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` varchar(500) NOT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp(),
  `seen` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_queries`
--

INSERT INTO `user_queries` (`sr_no`, `name`, `email`, `subject`, `message`, `datentime`, `seen`) VALUES
(35, 'Ishtiaque Ahmed', 'ishtiaqueahmed1998@gmail.com', 'testing', 'em ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit exercitationem quisquam praesentium,\r\ndolore voluptates eligendi delectus ex voluptate aliquam optio.', '2023-11-10 00:00:00', 1),
(36, 'Ishtiaque Ahmed', 'ishtiaqueahmed1998@gmail.com', 'wrhre', 'wherjheejtr', '2023-11-10 10:55:07', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_cred`
--
ALTER TABLE `admin_cred`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `facilities id` (`facilities_id`),
  ADD KEY `room id` (`room_id`);

--
-- Indexes for table `room_features`
--
ALTER TABLE `room_features`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `rm id` (`room_id`),
  ADD KEY `features id` (`features_id`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `team_details`
--
ALTER TABLE `team_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_cred`
--
ALTER TABLE `user_cred`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_queries`
--
ALTER TABLE `user_queries`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_cred`
--
ALTER TABLE `admin_cred`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `room_facilities`
--
ALTER TABLE `room_facilities`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `room_features`
--
ALTER TABLE `room_features`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_details`
--
ALTER TABLE `team_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_cred`
--
ALTER TABLE `user_cred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_queries`
--
ALTER TABLE `user_queries`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`);

--
-- Constraints for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD CONSTRAINT `booking_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`),
  ADD CONSTRAINT `booking_order_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD CONSTRAINT `rating_review_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`),
  ADD CONSTRAINT `rating_review_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `rating_review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`);

--
-- Constraints for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD CONSTRAINT `facilities id` FOREIGN KEY (`facilities_id`) REFERENCES `facilities` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `room id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `room_features`
--
ALTER TABLE `room_features`
  ADD CONSTRAINT `features id` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
