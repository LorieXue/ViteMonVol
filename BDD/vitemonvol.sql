-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : sam. 23 oct. 2021 à 14:01
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vitemonvol`
--

-- --------------------------------------------------------

--
-- Structure de la table `circuit`
--

DROP TABLE IF EXISTS `circuit`;
CREATE TABLE IF NOT EXISTS `circuit` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `nbDePlaces` int(11) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `id_vitemonvol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_vitemonvol` (`id_vitemonvol`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `circuit`
--

INSERT INTO `circuit` (`id`, `nom`, `debut`, `fin`, `nbDePlaces`, `prix`, `id_vitemonvol`) VALUES
(1, 'Voyage sur l archipel nippo', '2022-04-15', '2022-04-22', 30, 2500, 1),
(2, 'Visite historique en Grèce', '2022-09-01', '2022-09-15', 20, 1000, 1),
(3, 'Voyage aux pays des Caribous', '2022-07-01', '2022-07-22', 25, 3000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `nom`) VALUES
(1, 'Femme'),
(2, 'Homme'),
(3, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int(11) NOT NULL,
  `id_VILLE` int(11) NOT NULL,
  `id_CIRCUIT` int(11) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_VILLE` (`id_VILLE`),
  KEY `id_CIRCUIT` (`id_CIRCUIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`id`, `id_VILLE`, `id_CIRCUIT`, `nom`) VALUES
(1, 1, 1, 'Red Planet Tokyo Asakusa'),
(2, 2, 1, 'Hakone Yutowa'),
(3, 3, 1, 'Shinmachi Bettei'),
(4, 4, 1, 'Nest Hotel Osaka Umeda');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'Japon'),
(2, 'Grece'),
(3, 'Canada');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `tel` int(10) DEFAULT NULL,
  `Naissance` date DEFAULT NULL,
  `nomUtilisateur` varchar(20) DEFAULT NULL,
  `mdp` varchar(30) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `circuit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_id` (`genre_id`),
  KEY `circuit_id` (`circuit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `mail`, `tel`, `Naissance`, `nomUtilisateur`, `mdp`, `genre_id`, `circuit_id`) VALUES
(1, 'nom', 'prenom', 'mail@mail.com', 0, '2021-10-23', 'username', 'MotDePasse', 3, 1),
(2, 'xue', 'lorie', 'xuelorie@su.com', 611111111, '2002-10-21', 'Mys', 'proprietaire', 1, 1),
(3, 'error', '404', 'error@404.com', 640404040, '4004-04-04', 'error404', 'errorPassword', 3, 3),
(4, 'abc', 'def', 'ghi@jkl.com', 600000000, '1004-10-04', 'mno', 'pqrstuvwxyz', 3, NULL),
(5, 'Chat', 'Chien', 'poulet@kfc.com', 604050070, '2049-01-30', 'Frie', 'faim', 2, 2),
(6, 'burger', 'boeuf', 'bigmac@mcdo.com', 604012350, '2010-10-10', 'M', 'menuEnfant', 2, NULL),
(7, 'jaune', 'etAttend', 'questcequiestjauneetquiattend@jonathan.com', 0, '2000-01-25', 'jauneattend', 'lol', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `PAYS_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PAYS_id` (`PAYS_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `nom`, `PAYS_id`) VALUES
(1, 'Tokyo', 1),
(2, 'Hakone', 1),
(3, 'Kyoto', 1),
(4, 'Osaka', 1),
(5, 'Athenes', 2),
(6, 'Le peloponnese', 2),
(7, 'Thessalonique', 2),
(8, 'Vancouver', 3),
(9, 'Kamloops', 3),
(10, 'Ile de Vancouver', 3);

-- --------------------------------------------------------

--
-- Structure de la table `vitemonvol`
--

DROP TABLE IF EXISTS `vitemonvol`;
CREATE TABLE IF NOT EXISTS `vitemonvol` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vitemonvol`
--

INSERT INTO `vitemonvol` (`id`, `id_user`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `id` int(11) NOT NULL,
  `depart` int(11) NOT NULL,
  `arrive` int(11) NOT NULL,
  `id_pays` int(11) NOT NULL,
  `id_Circuits` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `depart` (`depart`),
  KEY `arrive` (`arrive`),
  KEY `id_pays` (`id_pays`),
  KEY `id_Circuits` (`id_Circuits`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`id`, `depart`, `arrive`, `id_pays`, `id_Circuits`) VALUES
(1, 1, 2, 1, 1),
(2, 2, 3, 1, 1),
(3, 3, 4, 1, 1),
(4, 5, 6, 2, 2),
(5, 6, 7, 2, 2),
(6, 8, 9, 3, 3),
(7, 9, 10, 3, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
