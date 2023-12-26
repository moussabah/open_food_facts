-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 26 déc. 2023 à 22:28
-- Version du serveur :  8.0.25
-- Version de PHP : 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `base_mbah`
--

-- --------------------------------------------------------

--
-- Structure de la table `contributeur_dim_table`
--

CREATE TABLE `contributeur_dim_table` (
  `num_seq_contributeur` int NOT NULL,
  `pseudo` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `date_dim_table`
--

CREATE TABLE `date_dim_table` (
  `num_seq_date` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `nutriscore_dim_table`
--

CREATE TABLE `nutriscore_dim_table` (
  `num_seq_nutriscore` int NOT NULL,
  `nutriscore_lettre` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pnns_dim_table`
--

CREATE TABLE `pnns_dim_table` (
  `num_seq_pnns` int NOT NULL,
  `pnns2` varchar(256) NOT NULL,
  `pnns1` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_facts_table`
--

CREATE TABLE `product_facts_table` (
  `num_seq_produit` int NOT NULL,
  `num_seq_contributeur` int NOT NULL,
  `num_seq_date_creation` int NOT NULL,
  `nombre_produits` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_version_fact_table`
--

CREATE TABLE `product_version_fact_table` (
  `num_seq_pnns` int NOT NULL,
  `num_seq_nutriscore` int NOT NULL,
  `num_seq_date_modification` int NOT NULL,
  `num_seq_contributeur` int NOT NULL,
  `num_seq_produit` int NOT NULL,
  `nombre_versions` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit_dim_table`
--

CREATE TABLE `produit_dim_table` (
  `num_seq_produit` int NOT NULL,
  `barcode` varchar(256) NOT NULL,
  `product_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contributeur_dim_table`
--
ALTER TABLE `contributeur_dim_table`
  ADD PRIMARY KEY (`num_seq_contributeur`);

--
-- Index pour la table `date_dim_table`
--
ALTER TABLE `date_dim_table`
  ADD PRIMARY KEY (`num_seq_date`);

--
-- Index pour la table `nutriscore_dim_table`
--
ALTER TABLE `nutriscore_dim_table`
  ADD PRIMARY KEY (`num_seq_nutriscore`);

--
-- Index pour la table `pnns_dim_table`
--
ALTER TABLE `pnns_dim_table`
  ADD PRIMARY KEY (`num_seq_pnns`);

--
-- Index pour la table `product_facts_table`
--
ALTER TABLE `product_facts_table`
  ADD KEY `num_seq_contributeur` (`num_seq_contributeur`),
  ADD KEY `num_seq_date_creation` (`num_seq_date_creation`),
  ADD KEY `num_seq_produit` (`num_seq_produit`);

--
-- Index pour la table `product_version_fact_table`
--
ALTER TABLE `product_version_fact_table`
  ADD KEY `num_seq_contributeur` (`num_seq_contributeur`),
  ADD KEY `num_seq_date_modification` (`num_seq_date_modification`),
  ADD KEY `num_seq_nutriscore` (`num_seq_nutriscore`),
  ADD KEY `num_seq_pnns` (`num_seq_pnns`),
  ADD KEY `num_seq_produit` (`num_seq_produit`);

--
-- Index pour la table `produit_dim_table`
--
ALTER TABLE `produit_dim_table`
  ADD PRIMARY KEY (`num_seq_produit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contributeur_dim_table`
--
ALTER TABLE `contributeur_dim_table`
  MODIFY `num_seq_contributeur` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `date_dim_table`
--
ALTER TABLE `date_dim_table`
  MODIFY `num_seq_date` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nutriscore_dim_table`
--
ALTER TABLE `nutriscore_dim_table`
  MODIFY `num_seq_nutriscore` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pnns_dim_table`
--
ALTER TABLE `pnns_dim_table`
  MODIFY `num_seq_pnns` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_dim_table`
--
ALTER TABLE `produit_dim_table`
  MODIFY `num_seq_produit` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product_facts_table`
--
ALTER TABLE `product_facts_table`
  ADD CONSTRAINT `product_facts_table_ibfk_1` FOREIGN KEY (`num_seq_contributeur`) REFERENCES `contributeur_dim_table` (`num_seq_contributeur`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_facts_table_ibfk_2` FOREIGN KEY (`num_seq_date_creation`) REFERENCES `date_dim_table` (`num_seq_date`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_facts_table_ibfk_3` FOREIGN KEY (`num_seq_produit`) REFERENCES `produit_dim_table` (`num_seq_produit`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `product_version_fact_table`
--
ALTER TABLE `product_version_fact_table`
  ADD CONSTRAINT `product_version_fact_table_ibfk_1` FOREIGN KEY (`num_seq_contributeur`) REFERENCES `contributeur_dim_table` (`num_seq_contributeur`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_version_fact_table_ibfk_2` FOREIGN KEY (`num_seq_date_modification`) REFERENCES `date_dim_table` (`num_seq_date`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_version_fact_table_ibfk_3` FOREIGN KEY (`num_seq_nutriscore`) REFERENCES `nutriscore_dim_table` (`num_seq_nutriscore`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_version_fact_table_ibfk_4` FOREIGN KEY (`num_seq_pnns`) REFERENCES `pnns_dim_table` (`num_seq_pnns`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_version_fact_table_ibfk_5` FOREIGN KEY (`num_seq_produit`) REFERENCES `produit_dim_table` (`num_seq_produit`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
