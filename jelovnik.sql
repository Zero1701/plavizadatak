-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2018 at 05:27 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jelovnik`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_engleski`
--

CREATE TABLE `category_engleski` (
  `id` int(11) NOT NULL,
  `opis` varchar(50) NOT NULL,
  `slug_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_engleski`
--

INSERT INTO `category_engleski` (`id`, `opis`, `slug_cat_id`) VALUES
(1, 'Soups', 1),
(2, 'BBQ\'S', 2);

-- --------------------------------------------------------

--
-- Table structure for table `category_hrvatski`
--

CREATE TABLE `category_hrvatski` (
  `id` int(11) NOT NULL,
  `opis` varchar(50) NOT NULL,
  `slug_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_hrvatski`
--

INSERT INTO `category_hrvatski` (`id`, `opis`, `slug_cat_id`) VALUES
(1, 'Juhe', 1),
(2, 'Roštilji', 2);

-- --------------------------------------------------------

--
-- Table structure for table `engleski`
--

CREATE TABLE `engleski` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `jelo_id` int(11) NOT NULL,
  `opis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `engleski`
--

INSERT INTO `engleski` (`id`, `naziv`, `jelo_id`, `opis`) VALUES
(1, 'Mushroom soup', 1, 'Delicous Mushroom soup'),
(2, 'Barbecue', 2, 'Delicious BBQ'),
(3, 'Chicken soup', 3, 'A soup with chicken and pasta');

-- --------------------------------------------------------

--
-- Table structure for table `hrvatski`
--

CREATE TABLE `hrvatski` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `jelo_id` int(11) NOT NULL,
  `opis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hrvatski`
--

INSERT INTO `hrvatski` (`id`, `naziv`, `jelo_id`, `opis`) VALUES
(1, 'Juha od gljiva', 1, 'Fina juha od gljiva'),
(2, 'Roštilj', 2, 'Fini roštilj'),
(3, 'Kokošija juha', 3, 'Juha od kokoši s rezancima');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_engleski`
--

CREATE TABLE `ingredients_engleski` (
  `id` int(11) NOT NULL,
  `opis` varchar(50) NOT NULL,
  `slug_ing_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredients_engleski`
--

INSERT INTO `ingredients_engleski` (`id`, `opis`, `slug_ing_id`) VALUES
(1, 'water, mushrooms, cream', 1),
(2, 'burgers, meat, hot dogs', 2),
(3, 'chicken, water, pasta', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_hrvatski`
--

CREATE TABLE `ingredients_hrvatski` (
  `id` int(11) NOT NULL,
  `opis` varchar(50) NOT NULL,
  `slug_ing_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredients_hrvatski`
--

INSERT INTO `ingredients_hrvatski` (`id`, `opis`, `slug_ing_id`) VALUES
(1, 'voda, gljive, vrhnje', 1),
(2, 'čevapi, pljeskavice, ražnjići', 2),
(3, 'kokoš, voda, tijesto', 3);

-- --------------------------------------------------------

--
-- Table structure for table `jelo`
--

CREATE TABLE `jelo` (
  `id` int(11) NOT NULL,
  `delete_food` tinyint(1) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `ingredients_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jelo`
--

INSERT INTO `jelo` (`id`, `delete_food`, `date_deleted`, `status`, `tag_id`, `category_id`, `ingredients_id`) VALUES
(1, 0, '2018-06-02 12:56:57', 'created', 1, NULL, 1),
(2, 0, '2018-06-02 12:56:57', 'created', 2, 2, 2),
(3, 0, '2018-06-11 08:27:24', 'created', 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jezik`
--

CREATE TABLE `jezik` (
  `id` int(11) NOT NULL,
  `lang` varchar(50) NOT NULL,
  `jelo` varchar(50) NOT NULL,
  `opis` varchar(50) NOT NULL,
  `sastojci` varchar(50) NOT NULL,
  `kategorija` varchar(50) NOT NULL,
  `datum` varchar(50) NOT NULL,
  `rezultat_txt` varchar(50) NOT NULL,
  `filter_txt` varchar(50) NOT NULL,
  `first_page` varchar(50) NOT NULL,
  `last_page` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jezik`
--

INSERT INTO `jezik` (`id`, `lang`, `jelo`, `opis`, `sastojci`, `kategorija`, `datum`, `rezultat_txt`, `filter_txt`, `first_page`, `last_page`) VALUES
(1, 'hrvatski', 'jelo', 'opis', 'sastojci', 'kategorija', 'datum', 'Rezultati po stranici', 'odabir filtera', 'prva', 'zadnja'),
(2, 'engleski', 'food', 'description', 'ingredients', 'category', 'date', 'results per page', 'select filters', 'first', 'last');

-- --------------------------------------------------------

--
-- Table structure for table `slug_category`
--

CREATE TABLE `slug_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slug_category`
--

INSERT INTO `slug_category` (`id`, `slug`) VALUES
(1, 'category-1'),
(2, 'category-2');

-- --------------------------------------------------------

--
-- Table structure for table `slug_ingredients`
--

CREATE TABLE `slug_ingredients` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slug_ingredients`
--

INSERT INTO `slug_ingredients` (`id`, `slug`) VALUES
(1, 'sastojak-1'),
(2, 'sastojak-2'),
(3, 'sastojak-3');

-- --------------------------------------------------------

--
-- Table structure for table `slug_tags`
--

CREATE TABLE `slug_tags` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slug_tags`
--

INSERT INTO `slug_tags` (`id`, `slug`) VALUES
(1, 'tag-1'),
(2, 'tag-2'),
(3, 'tag-3');

-- --------------------------------------------------------

--
-- Table structure for table `tag_engleski`
--

CREATE TABLE `tag_engleski` (
  `id` int(11) NOT NULL,
  `opis` varchar(50) NOT NULL,
  `slug_tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_engleski`
--

INSERT INTO `tag_engleski` (`id`, `opis`, `slug_tag_id`) VALUES
(1, 'English Tag1', 1),
(2, 'English Tag2', 2),
(3, 'English Tag3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tag_hrvatski`
--

CREATE TABLE `tag_hrvatski` (
  `id` int(11) NOT NULL,
  `opis` varchar(50) NOT NULL,
  `slug_tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_hrvatski`
--

INSERT INTO `tag_hrvatski` (`id`, `opis`, `slug_tag_id`) VALUES
(1, 'Hrvatski Tag1', 1),
(2, 'Hrvatski Tag2', 2),
(3, 'Hrvatski Tag3', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_engleski`
--
ALTER TABLE `category_engleski`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug_cat_id` (`slug_cat_id`);

--
-- Indexes for table `category_hrvatski`
--
ALTER TABLE `category_hrvatski`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug_cat_id` (`slug_cat_id`);

--
-- Indexes for table `engleski`
--
ALTER TABLE `engleski`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jelo_id` (`jelo_id`);

--
-- Indexes for table `hrvatski`
--
ALTER TABLE `hrvatski`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jelo_id` (`jelo_id`);

--
-- Indexes for table `ingredients_engleski`
--
ALTER TABLE `ingredients_engleski`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug_ing_id` (`slug_ing_id`);

--
-- Indexes for table `ingredients_hrvatski`
--
ALTER TABLE `ingredients_hrvatski`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug_ing_id` (`slug_ing_id`);

--
-- Indexes for table `jelo`
--
ALTER TABLE `jelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredients_id` (`ingredients_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `jezik`
--
ALTER TABLE `jezik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slug_category`
--
ALTER TABLE `slug_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slug_ingredients`
--
ALTER TABLE `slug_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slug_tags`
--
ALTER TABLE `slug_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_engleski`
--
ALTER TABLE `tag_engleski`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug_tag_id` (`slug_tag_id`);

--
-- Indexes for table `tag_hrvatski`
--
ALTER TABLE `tag_hrvatski`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug_tag_id` (`slug_tag_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_engleski`
--
ALTER TABLE `category_engleski`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_hrvatski`
--
ALTER TABLE `category_hrvatski`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `engleski`
--
ALTER TABLE `engleski`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hrvatski`
--
ALTER TABLE `hrvatski`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ingredients_engleski`
--
ALTER TABLE `ingredients_engleski`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ingredients_hrvatski`
--
ALTER TABLE `ingredients_hrvatski`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jelo`
--
ALTER TABLE `jelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jezik`
--
ALTER TABLE `jezik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slug_category`
--
ALTER TABLE `slug_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slug_ingredients`
--
ALTER TABLE `slug_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slug_tags`
--
ALTER TABLE `slug_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tag_engleski`
--
ALTER TABLE `tag_engleski`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tag_hrvatski`
--
ALTER TABLE `tag_hrvatski`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_engleski`
--
ALTER TABLE `category_engleski`
  ADD CONSTRAINT `category_engleski_ibfk_1` FOREIGN KEY (`slug_cat_id`) REFERENCES `slug_category` (`id`);

--
-- Constraints for table `category_hrvatski`
--
ALTER TABLE `category_hrvatski`
  ADD CONSTRAINT `category_hrvatski_ibfk_1` FOREIGN KEY (`slug_cat_id`) REFERENCES `slug_category` (`id`);

--
-- Constraints for table `engleski`
--
ALTER TABLE `engleski`
  ADD CONSTRAINT `engleski_ibfk_1` FOREIGN KEY (`jelo_id`) REFERENCES `jelo` (`id`);

--
-- Constraints for table `hrvatski`
--
ALTER TABLE `hrvatski`
  ADD CONSTRAINT `hrvatski_ibfk_1` FOREIGN KEY (`jelo_id`) REFERENCES `jelo` (`id`);

--
-- Constraints for table `ingredients_engleski`
--
ALTER TABLE `ingredients_engleski`
  ADD CONSTRAINT `ingredients_engleski_ibfk_1` FOREIGN KEY (`slug_ing_id`) REFERENCES `slug_ingredients` (`id`);

--
-- Constraints for table `ingredients_hrvatski`
--
ALTER TABLE `ingredients_hrvatski`
  ADD CONSTRAINT `ingredients_hrvatski_ibfk_1` FOREIGN KEY (`slug_ing_id`) REFERENCES `slug_ingredients` (`id`);

--
-- Constraints for table `jelo`
--
ALTER TABLE `jelo`
  ADD CONSTRAINT `jelo_ibfk_1` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients_hrvatski` (`id`),
  ADD CONSTRAINT `jelo_ibfk_2` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients_engleski` (`id`),
  ADD CONSTRAINT `jelo_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `tag_hrvatski` (`id`),
  ADD CONSTRAINT `jelo_ibfk_4` FOREIGN KEY (`tag_id`) REFERENCES `tag_engleski` (`id`);

--
-- Constraints for table `tag_engleski`
--
ALTER TABLE `tag_engleski`
  ADD CONSTRAINT `tag_engleski_ibfk_1` FOREIGN KEY (`slug_tag_id`) REFERENCES `slug_tags` (`id`);

--
-- Constraints for table `tag_hrvatski`
--
ALTER TABLE `tag_hrvatski`
  ADD CONSTRAINT `tag_hrvatski_ibfk_1` FOREIGN KEY (`slug_tag_id`) REFERENCES `slug_tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
