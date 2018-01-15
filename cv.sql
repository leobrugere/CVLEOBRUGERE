-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 15 Janvier 2018 à 15:34
-- Version du serveur :  5.7.20-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cv`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `texte` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8_unicode_ci NOT NULL,
  `auteur` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `description`, `date`, `texte`, `image`, `auteur`) VALUES
(1, 'Article1', 'Sujet de Alexandre Desage', '2017-12-21 00:00:00', 'PAW Patrol : La Pat\' Patrouille est une série d\'animation canadienne créée par Keith Chapman.', 'https://medias.lagranderecre.fr/imgs/1/1200x1200/702782V04_01.jpg', 'MOI'),
(2, 'Article2', 'Sujet de Maxence Vretman', '2017-12-21 00:00:00', 'Ezreal, dès sa naissance il avait la magie dans le sang.', 'https://vignette.wikia.nocookie.net/leagueoflegends/images/2/25/Ezreal_OriginalSkin.jpg/revision/latest?cb=20170621200845', 'MOI');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `commentaire` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id_article` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `commentaires`
--

INSERT INTO `commentaires` (`id`, `pseudo`, `date`, `commentaire`, `id_article`, `is_valid`) VALUES
(1, 'Kélian', '2018-01-15 10:33:10', 'J\'adore Pat\'Patrouille, c\'est vraiment le meilleur dessin animé du moment.', '1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `competences`
--

CREATE TABLE `competences` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `liste` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `competences`
--

INSERT INTO `competences` (`id`, `icon`, `title`, `liste`) VALUES
(2, 'code', 'Développement', '<li>Java</li> <li>Android</li>'),
(3, 'code', 'Développement Web', '<li>HTML</li> <li>CSS</li> <li>PHP</li> <li>JAVASCRIPT</li> <li>Framework: Laravel, Symfony</li>'),
(4, 'language', 'Langue', '<li>Anglais</li> <li>Espagnol</li>'),
(5, 'https', 'Sécurité Réseau', '<li>Sécurité Réseau</li> <li>CCNA</li> <li>Active Directory et Microsoft Serveur</li>'),
(6, 'layers', 'Base de Donnée', '<li>SQL</li> <li>PL/SQL</li> <li>PostGre SQL</li> <li>BI et BIG DATA</li>'),
(7, 'laptop', 'Système d\'exploitation', '<li>Windows</li> <li>Linux</li>');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 'admin@admin.com', 1, NULL, '$2y$13$hhZkZsUcCy5R9rDAYaDVbu.l0kW/16d42sLrG4VUD2S7LLEt1HTcK', '2018-01-15 09:41:47', NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}'),
(2, 'leo', 'leo', 'leo@leo.com', 'leo@leo.com', 1, NULL, '$2y$13$pQB7.dRvf4GA8iycToiPRO4oFqFKn6kc.E7x1.aR1Rd3dyGGG0W6y', NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}'),
(3, 'kelian', 'kelian', 'kelian@kelial.com', 'kelian@kelial.com', 1, NULL, '$2y$13$TNF35/GzBYWBD32dpSZDyOT9a4/Xy2MRVhc.ouHQBn0MxssiIWTCW', NULL, NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Structure de la table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `langage`
--

CREATE TABLE `langage` (
  `id` int(11) NOT NULL,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `scolarite`
--

CREATE TABLE `scolarite` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `annee` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filiere` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `scolarite`
--

INSERT INTO `scolarite` (`id`, `nom`, `annee`, `filiere`) VALUES
(1, 'Terminale', '2015', 'Terminale Scientifique au Lycée Arnaut Daniel de Ribérac (Option Anglais Européen)'),
(2, 'Post-Bac', '2016', 'Licence 1 à la Faculté des Sciences de Talence'),
(3, 'YNOV Ingesup', '2016-????', 'Cursus Informatique : Première et Deuxième année');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `competences`
--
ALTER TABLE `competences`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Index pour la table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `langage`
--
ALTER TABLE `langage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `scolarite`
--
ALTER TABLE `scolarite`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `competences`
--
ALTER TABLE `competences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `langage`
--
ALTER TABLE `langage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `scolarite`
--
ALTER TABLE `scolarite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
