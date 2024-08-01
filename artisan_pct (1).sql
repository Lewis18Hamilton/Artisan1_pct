-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 01 août 2024 à 21:42
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `artisan_pct`
--

-- --------------------------------------------------------

--
-- Structure de la table `artisans`
--

CREATE TABLE `artisans` (
  `id` int(11) NOT NULL,
  `nomComplet` varchar(100) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL,
  `numero_what` varchar(20) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `commune` varchar(50) NOT NULL,
  `quartier` varchar(50) NOT NULL,
  `photo_profil` varchar(100) DEFAULT NULL,
  `typeUtilisateur` varchar(100) NOT NULL,
  `branche_activite` varchar(255) DEFAULT NULL,
  `specialite` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `artisans`
--

INSERT INTO `artisans` (`id`, `nomComplet`, `numero`, `mot_de_passe`, `numero_what`, `pays`, `ville`, `commune`, `quartier`, `photo_profil`, `typeUtilisateur`, `branche_activite`, `specialite`, `role`, `latitude`, `longitude`, `description`) VALUES
(8, 'Gerant Cyber', '2639490044', '1d28c120568c10e19b9d8abe8b66d0983fa3d2e11ee7751aca50f83c6f4a43aa', '', '', 'Abidjan', 'Yopougon', 'Banco', 'fc8f9486acb454ae523ac7c59c2543d3.jpg', 'artisan', NULL, '', NULL, 5.348916, -4.100227, NULL),
(9, 'Gerant PCT', '0526394900', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '', '', 'Abidjan', 'Abobo', 'PK18', 'e63c26b9e956c87e0f5c6f999f0f484a.webp', 'client', NULL, '', NULL, 0.000000, 0.000000, NULL),
(10, 'Gerant PCT26', '0115314918', '$2y$10$7NR/N/UzuX88J7cUMEiuZeqFr9L5qQdgCIU6vsPDAXeKsrcs5hGIa', '', '', 'Abidjan', 'Yopougon', 'Banco2', 'ac790a8130734b39ac3eef3b2fe23809.png', '', NULL, 'Homme', 'adjoint', 5.348916, -4.100227, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nomComplet` varchar(100) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `commune` varchar(50) NOT NULL,
  `quartier` varchar(50) NOT NULL,
  `photo_profil` text NOT NULL,
  `localisation` float NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nomComplet`, `numero`, `mot_de_passe`, `pays`, `ville`, `commune`, `quartier`, `photo_profil`, `localisation`, `id_service`) VALUES
(2, 'Gerant Cyber', '0526394900', '$2y$10$llHoa9Z7.BQvkmUqi6JAtOtyZhaj6gT38ZfHMwnJ6q7sDwnAUu0ie', '', 'Monaco', 'Mouel', 'Vaman', 'abdb29ef9700792a5c344ec0bc75098d.jpg', 0, 0),
(3, 'Gerant Cyber', '2639490011', '$2y$10$aYkE7pSSIbYWZnNTqYHeT.v1yvIGjAxxfNQpLprQbE.GFaGABHlB6', '', 'Abidjan', 'Yopougon', 'Vaman', '7e9800eef609c38ea6ac3630c8e5a3a1.jpg', 0, 0),
(6, 'Bara Morgo', '2639490010', '$2y$10$8wvh3PhI31.k.NvZWCblY.ZptyzSKN.tORpyCT8WSgRx0bW4pBpm2', '', 'Monaco', 'Moue', 'Vaman', '51682e16529d1c96ec842dbf757f44fd.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `packs_publicitaires`
--

CREATE TABLE `packs_publicitaires` (
  `id` int(11) NOT NULL,
  `pack_publicitaire` int(11) NOT NULL,
  `budget` int(20) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `id_artisan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `publicites`
--

CREATE TABLE `publicites` (
  `id` int(11) NOT NULL,
  `texte` text NOT NULL,
  `url_image` varchar(100) NOT NULL,
  `date_publication` date NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `description_besoin` text NOT NULL,
  `localisation` float NOT NULL,
  `date_demande` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_artisan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `artisans`
--
ALTER TABLE `artisans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service` (`id_service`);

--
-- Index pour la table `packs_publicitaires`
--
ALTER TABLE `packs_publicitaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artisan` (`id_artisan`);

--
-- Index pour la table `publicites`
--
ALTER TABLE `publicites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service` (`id_service`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artisan` (`id_artisan`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `artisans`
--
ALTER TABLE `artisans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `packs_publicitaires`
--
ALTER TABLE `packs_publicitaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `publicites`
--
ALTER TABLE `publicites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
