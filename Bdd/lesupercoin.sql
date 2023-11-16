-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 16 nov. 2023 à 14:07
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `lesupercoin`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

DROP TABLE IF EXISTS `annonces`;
CREATE TABLE IF NOT EXISTS `annonces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdat` date NOT NULL,
  `updatedat` date NOT NULL,
  `categories_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CB988C6FA21214B7` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annonces`
--

INSERT INTO `annonces` (`id`, `title`, `prix`, `content`, `createdat`, `updatedat`, `categories_id`) VALUES
(6, 'Téléviseur 8K', 799.99, 'Téléviseur 4K de dernière génération', '2023-11-15', '2023-11-16', 3),
(7, 'Smartphone haut de gamme', 699.99, 'Smartphone avec des fonctionnalités avancées', '2023-11-15', '2023-11-15', 1),
(8, 'Veste en cuir', 149.99, 'Veste en cuir véritable pour hommes', '2023-11-15', '2023-11-15', 2),
(10, 'Raquette de tennis professionnelle', 199.99, 'Raquette de tennis utilisée par les professionnels', '2023-11-15', '2023-11-15', 2),
(11, 'Casque audio sans fil', 129.99, 'Casque audio de qualité supérieure avec une excellente qualité sonore', '2023-11-15', '2023-11-15', 1),
(12, 'La meilleur figurine de tout les temps !!', 437.98, 'superbe figurine d\'Albedo', '2018-01-01', '2018-01-01', 1),
(13, 'Le pire tacos d\'Orléans !!!', 2, '6 viandes, 7fromages...', '2018-01-01', '2018-01-01', 2),
(14, 'vive la bouffe', 87, 'bah j\'ai super faim quoi', '2023-11-16', '2023-11-16', 1),
(15, 'juregj', 437.98, 'bebfzuebf', '2023-11-16', '2023-11-16', 4),
(16, 'rervr', 2, 'reverv', '2023-11-16', '2023-11-16', 4),
(17, 'jkerheruigk', 87, 'ergreg', '2023-11-16', '2023-11-16', 4),
(18, 'ergeb', 437.98, 'ergerg', '2023-11-16', '2023-11-16', 4),
(19, 'jshzef', 87, 'fezuigfyi', '2023-11-16', '2023-11-16', 4);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdat` date NOT NULL,
  `updatedat` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `libelle`, `createdat`, `updatedat`) VALUES
(1, 'Première catégorie', '2023-11-15', '2023-11-15'),
(2, 'Deuxième catégorie', '2023-11-15', '2023-11-15'),
(3, 'Électronique', '2023-11-15', '2023-11-15'),
(4, 'Vêtements', '2023-11-15', '2023-11-15');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231115083826', '2023-11-15 08:39:16', 187),
('DoctrineMigrations\\Version20231115084923', '2023-11-15 08:49:34', 39),
('DoctrineMigrations\\Version20231115094947', '2023-11-15 09:49:59', 147),
('DoctrineMigrations\\Version20231115142400', '2023-11-15 14:24:18', 175),
('DoctrineMigrations\\Version20231115151103', '2023-11-15 15:11:24', 68);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `password`, `email`, `roles`, `name`, `surname`) VALUES
(10, '$2y$13$ghW361T9Kcryxjg7YSwj0uc7vGyEAxvREavbSHf5p8UMBklplQ9zG', 'admin@admin.fr', '[\"ROLE_ADMIN\"]', 'admin', 'admin'),
(11, '$2y$13$pj/g1CM/WRQvf0Y2DiIZDeguqneFoO9MaVLSKc7TDm4qNlG3Nj/UG', 'user@user.fr', '[]', 'user', 'user');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `FK_CB988C6FA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
