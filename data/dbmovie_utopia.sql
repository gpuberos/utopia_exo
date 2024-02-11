-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 11 fév. 2024 à 14:08
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbmovie_utopia`
--

-- --------------------------------------------------------

--
-- Structure de la table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(110) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `director`
--

INSERT INTO `director` (`id`, `name`) VALUES
(1, 'Abdellatif Kechiche'),
(2, 'Christopher Nolan'),
(3, 'Francis Ford Coppola'),
(4, 'Frank Darabont'),
(5, 'Jonathan Demme'),
(6, 'Olivier Nakache'),
(7, 'Peter Jackson'),
(8, 'Quentin Tarantino'),
(9, 'Robert Zemeckis'),
(10, 'Sergio Leone'),
(11, 'Sidney Lumet'),
(12, 'Steven Spielberg');

-- --------------------------------------------------------

--
-- Structure de la table `distribution_company`
--

DROP TABLE IF EXISTS `distribution_company`;
CREATE TABLE IF NOT EXISTS `distribution_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(110) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `distribution_company`
--

INSERT INTO `distribution_company` (`id`, `name`) VALUES
(1, 'Columbia Pictures'),
(2, 'Gaumont Film Company'),
(3, 'Miramax Films'),
(4, 'New Line Cinema'),
(5, 'Orion Pictures'),
(6, 'Paramount Pictures'),
(7, 'The Weinstein Company'),
(8, 'United Artists'),
(9, 'Universal Pictures'),
(10, 'Warner Bros'),
(11, 'Wild Bunch');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(110) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Crime'),
(4, 'Drama'),
(5, 'Fantasy'),
(6, 'Romance'),
(7, 'Thriller'),
(8, 'War'),
(9, 'Western');

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `language`
--

INSERT INTO `language` (`id`, `name`) VALUES
(1, 'English'),
(2, 'French'),
(3, 'German'),
(4, 'Italian'),
(5, 'Sicilian'),
(6, 'Spanish'),
(7, 'Yiddish');

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `rating` float NOT NULL,
  `year_released` int NOT NULL,
  `box_office` int NOT NULL,
  `budget` bigint NOT NULL,
  `duration` int NOT NULL,
  `companyID` int NOT NULL,
  `genreID` int NOT NULL,
  `directorID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genreID` (`genreID`),
  KEY `directorID` (`directorID`),
  KEY `companyID` (`companyID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id`, `title`, `rating`, `year_released`, `box_office`, `budget`, `duration`, `companyID`, `genreID`, `directorID`) VALUES
(1, 'The Shawshank Redemption', 9.2, 1994, 73300000, 25000000, 142, 1, 4, 4),
(2, 'The Godfather', 9.2, 1972, 291000000, 7200000, 175, 6, 3, 3),
(3, 'The Dark Knight', 9, 2008, 1006000000, 185000000, 152, 10, 1, 2),
(4, 'The Godfather Part II', 9, 1974, 93000000, 13000000, 202, 6, 3, 3),
(5, '12 Angry Men', 9, 1957, 2000000, 340000, 96, 5, 4, 11),
(6, 'Schindler\'s List', 8.9, 1993, 322200000, 22000000, 195, 9, 4, 12),
(7, 'The Lord of the Rings: The Return of the King', 8.9, 2003, 1146000000, 94000000, 201, 4, 5, 7),
(8, 'Pulp Fiction', 8.8, 1994, 213900000, 8500000, 154, 3, 3, 8),
(9, 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 2001, 898200000, 93000000, 178, 4, 5, 7),
(10, 'The Good, the Bad and the Ugly', 8.8, 1966, 38900000, 1200000, 161, 8, 9, 10),
(11, 'Forrest Gump', 8.7, 1994, 677400000, 55000000, 142, 9, 4, 9),
(12, 'Intouchables', 8.5, 2011, 426600000, 10800000, 112, 2, 2, 6),
(13, 'The Silence of the Lambs', 8.6, 1991, 272700000, 19000000, 118, 5, 7, 5),
(14, 'Inglourious Bastards', 8.4, 2009, 321500000, 70000000, 153, 7, 8, 8),
(15, 'La Vie d\'Adèle', 7.7, 2013, 19000000, 4000000, 180, 11, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `movie_language`
--

DROP TABLE IF EXISTS `movie_language`;
CREATE TABLE IF NOT EXISTS `movie_language` (
  `movieID` int NOT NULL,
  `languageID` int NOT NULL DEFAULT '1',
  KEY `movieID` (`movieID`),
  KEY `languageID` (`languageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `movie_language`
--

INSERT INTO `movie_language` (`movieID`, `languageID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(4, 5),
(5, 1),
(6, 1),
(6, 3),
(6, 7),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(10, 4),
(10, 6),
(11, 1),
(12, 2),
(13, 1),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(15, 2);

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pathImg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `movieId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movieId` (`movieId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `picture`
--

INSERT INTO `picture` (`id`, `pathImg`, `movieId`) VALUES
(1, '/assets/img/pictures/les_evades.jpg', 1),
(2, '/assets/img/pictures/godfather.png', 2),
(3, '/assets/img/pictures/darkknight.jpg', 3),
(4, '/assets/img/pictures/godfather2.webp', 4),
(5, '/assets/img/pictures/12angrymen.png', 5),
(6, '/assets/img/pictures/shindlerslist.webp', 6),
(7, '/assets/img/pictures/lordofringsking.jpg', 7),
(8, '/assets/img/pictures/pulp_fiction.jpg', 8),
(9, '/assets/img/pictures/lordofringsring.jpg', 9),
(10, '/assets/img/pictures/goodbadugly.jpg', 10),
(11, '/assets/img/pictures/runforrestrun.jpg', 11),
(12, '/assets/img/pictures/intouchables.jpg', 12),
(13, '/assets/img/pictures/silenceoflambs.png', 13),
(14, '/assets/img/pictures/inglorius.jpg', 14),
(15, '/assets/img/pictures/laviedadele.jpg', 15),
(16, '/assets/img/pictures/les_evades.jpg', 1),
(17, '/assets/img/pictures/godfather.png', 2),
(18, '/assets/img/pictures/darkknight.jpg', 3),
(19, '/assets/img/pictures/godfather2.webp', 4),
(20, '/assets/img/pictures/12angrymen.png', 5),
(21, '/assets/img/pictures/shindlerslist.webp', 6),
(22, '/assets/img/pictures/lordofringsking.jpg', 7),
(23, '/assets/img/pictures/pulp_fiction.jpg', 8),
(24, '/assets/img/pictures/lordofringsring.jpg', 9),
(25, '/assets/img/pictures/goodbadugly.jpg', 10),
(26, '/assets/img/pictures/runforrestrun.jpg', 11),
(27, '/assets/img/pictures/intouchables.jpg', 12),
(28, '/assets/img/pictures/silenceoflambs.png', 13),
(29, '/assets/img/pictures/inglorius.jpg', 14),
(30, '/assets/img/pictures/laviedadele.jpg', 15);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`genreID`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`directorID`) REFERENCES `director` (`id`),
  ADD CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`companyID`) REFERENCES `distribution_company` (`id`);

--
-- Contraintes pour la table `movie_language`
--
ALTER TABLE `movie_language`
  ADD CONSTRAINT `movie_language_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `movie_language_ibfk_2` FOREIGN KEY (`languageID`) REFERENCES `language` (`id`);

--
-- Contraintes pour la table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
