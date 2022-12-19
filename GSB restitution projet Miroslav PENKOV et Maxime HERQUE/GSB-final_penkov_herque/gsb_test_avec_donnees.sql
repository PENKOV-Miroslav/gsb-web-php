-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 03:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsb_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('MP', 'Mise en paiement'),
('RB', 'Remboursée'),
('VA', 'Validée');

-- --------------------------------------------------------

--
-- Table structure for table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbjustificatifs` int(11) DEFAULT NULL,
  `montantvalide` decimal(10,2) DEFAULT NULL,
  `datemodif` date DEFAULT NULL,
  `idetat` char(2) DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fichefrais`
--

INSERT INTO `fichefrais` (`idvisiteur`, `mois`, `nbjustificatifs`, `montantvalide`, `datemodif`, `idetat`) VALUES
('a171', '202207', 0, '2042.00', '2022-12-14', 'MP'),
('a171', '202208', 0, '5105.00', '2022-12-14', 'RB'),
('a171', '202209', 0, '0.00', '2022-09-09', 'CL'),
('a171', '202210', 0, '0.00', '2022-10-10', 'CL'),
('a171', '202211', 0, '0.00', '2022-11-14', 'CL'),
('a171', '202212', 0, '0.00', '2022-12-14', 'CR');

-- --------------------------------------------------------

--
-- Table structure for table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idfraisforfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idvisiteur`, `mois`, `idfraisforfait`, `quantite`) VALUES
('a171', '202207', 'ETP', 2),
('a171', '202207', 'KM', 2000),
('a171', '202207', 'NUI', 20),
('a171', '202207', 'REP', 20),
('a171', '202208', 'ETP', 5),
('a171', '202208', 'KM', 5000),
('a171', '202208', 'NUI', 50),
('a171', '202208', 'REP', 50),
('a171', '202209', 'ETP', 1),
('a171', '202209', 'KM', 1000),
('a171', '202209', 'NUI', 1000),
('a171', '202209', 'REP', 1000),
('a171', '202210', 'ETP', 3),
('a171', '202210', 'KM', 300),
('a171', '202210', 'NUI', 3),
('a171', '202210', 'REP', 3),
('a171', '202211', 'ETP', 3),
('a171', '202211', 'KM', 2000),
('a171', '202211', 'NUI', 20),
('a171', '202211', 'REP', 20),
('a171', '202212', 'ETP', 2),
('a171', '202212', 'KM', 1000),
('a171', '202212', 'NUI', 10),
('a171', '202212', 'REP', 10);

-- --------------------------------------------------------

--
-- Table structure for table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int(11) NOT NULL,
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `refuse` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idvisiteur`, `mois`, `libelle`, `date`, `montant`, `refuse`) VALUES
(1, 'a171', '202212', 'Train SNCF', '2022-12-10', '200.00', NULL),
(2, 'a171', '202212', 'Scotch double face', '2022-12-08', '20.00', NULL),
(3, 'a171', '202211', 'Train SNCF', '2022-11-11', '250.00', NULL),
(4, 'a171', '202211', 'Taxi', '2022-11-08', '100.00', NULL),
(5, 'a171', '202210', 'Taxi', '2022-10-05', '50.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`idRole`, `role`) VALUES
(0, 'visiteur'),
(1, 'comptable'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(130) DEFAULT NULL,
  `mdp` char(130) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateembauche` date DEFAULT NULL,
  `idRole` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateembauche`, `idRole`) VALUES
('a171', 'Andre', 'David', '16307af078572483d226829594bd905f0dc9bc6df64c57404cde1599030e5fdc18e29a9a1c96d6f587be519fae832cae414e5f91569ab7390528564b8ef04498', 'd760688da522b4dc3350e6fb68961b0934f911c7d0ff337438cabf4608789ba94ce70b6601d7e08a279ef088716c4b1913b984513fea4c557d404d0598d4f2f1', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 0),
('admi', 'SMITHZ', 'John', '5a38afb1a18d408e6cd367f9db91e2ab9bce834cdad3da24183cc174956c20ce35dd39c2bd36aae907111ae3d6ada353f7697a5f1a8fc567aae9e4ca41a9d19d', 'be2db9484b90a28ec64f5f412724a554d5f1d4c8ddbd745b7127fd2403909ec2404e2b703a09bdf9622cf2a479c46d9ce222b8b31ee2c76e7c1806a74785c704', '3 rue admin', '23200', 'aubusson', '2000-05-01', 2),
('ct01', 'Dupont', 'Pierre', 'dc9a3878c4b64f6943e39d6052a6aba26b3e1a82bf8940055408ebcf2631d66d27126d2c704f308727fc1c4b7e9101881d06800fc3310836240e448c461ff2fb', '9ece086e9bac491fac5c1d1046ca11d737b92a2b2ebd93f005d7b710110c0a678288166e7fbe796883a4f2e9b3ca9f484f521d0ce464345cc1aec96779149c14', '77 Rue du Trosy', '92140', 'clamart', '2011-09-01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idvisiteur`,`mois`),
  ADD KEY `idetat` (`idetat`);

--
-- Indexes for table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idvisiteur`,`mois`,`idfraisforfait`),
  ADD KEY `idfraisforfait` (`idfraisforfait`);

--
-- Indexes for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvisiteur` (`idvisiteur`,`mois`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Indexes for table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRole` (`idRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idetat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idvisiteur`) REFERENCES `visiteur` (`id`);

--
-- Constraints for table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idvisiteur`,`mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idfraisforfait`) REFERENCES `fraisforfait` (`id`);

--
-- Constraints for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idvisiteur`,`mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`);

--
-- Constraints for table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `visiteur_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
