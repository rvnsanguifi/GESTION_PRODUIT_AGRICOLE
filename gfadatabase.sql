-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  sam. 18 nov. 2017 à 03:08
-- Version du serveur :  10.1.25-MariaDB
-- Version de PHP :  7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gfadatabase`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `CODEACH` decimal(8,0) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `SOCAGENT` varchar(100) DEFAULT NULL,
  `ADRESSE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `TELAGENT` varchar(20) DEFAULT NULL,
  `INFOAGENT` longtext,
  `COMPTE` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`CODEACH`, `NOM`, `SOCAGENT`, `ADRESSE`, `EMAIL`, `FAX`, `TELAGENT`, `INFOAGENT`, `COMPTE`) VALUES
('2', 'Mr Vinh', 'IFI', 'Ktx xa My Dinh', 'vinh@gmail.com', '', '00212667999955', 'pas grande informations sur dû à la confidentialité', 'courant');

-- --------------------------------------------------------

--
-- Structure de la table `aune`
--

CREATE TABLE `aune` (
  `ID_IMG` varchar(100) NOT NULL,
  `CODEPRODUIT` decimal(8,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `batre`
--

CREATE TABLE `batre` (
  `CODEENNEMIE` decimal(8,0) NOT NULL,
  `CODEPRODUIT` decimal(8,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commissionnaire`
--

CREATE TABLE `commissionnaire` (
  `CODECOM` decimal(8,0) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `SOCAGENT` varchar(100) DEFAULT NULL,
  `ADRESSE` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `TELAGENT` varchar(20) DEFAULT NULL,
  `INFOAGENT` longtext,
  `PATTENTE` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cueillette`
--

CREATE TABLE `cueillette` (
  `CODECUEIL` decimal(8,0) NOT NULL,
  `CODESER` decimal(8,0) NOT NULL,
  `DATECUEIL` varchar(100) DEFAULT NULL,
  `QUANCEUIL` varchar(20) DEFAULT NULL,
  `POIT` float DEFAULT NULL,
  `NBEMP` int(11) DEFAULT NULL,
  `PCAL1` float DEFAULT NULL,
  `PCAL2` float DEFAULT NULL,
  `PCAL3` float DEFAULT NULL,
  `PCAL4` float DEFAULT NULL,
  `OBSERM` text,
  `OBSERCEUIL` text,
  `X1` float NOT NULL,
  `X2` float NOT NULL,
  `Y1` float NOT NULL,
  `Y2` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `culture`
--

CREATE TABLE `culture` (
  `CODECULTURE` decimal(8,0) NOT NULL,
  `NOMCULTURE` varchar(100) DEFAULT NULL,
  `VARITE` varchar(100) DEFAULT NULL,
  `MARQUECUL` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ennemie`
--

CREATE TABLE `ennemie` (
  `CODEENNEMIE` decimal(8,0) NOT NULL,
  `NOMENNEMIE` varchar(100) DEFAULT NULL,
  `IMAGEENNEMIE` mediumblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ennemie`
--

INSERT INTO `ennemie` (`CODEENNEMIE`, `NOMENNEMIE`, `IMAGEENNEMIE`) VALUES
('2', 'ravageurs potage', 0x6c65735f696e7365637465735f7261766167657572735f64755f706f74616765725f7175656c717565735f74727563735f3637302e6a7067);

-- --------------------------------------------------------

--
-- Structure de la table `ferme`
--

CREATE TABLE `ferme` (
  `CODEFERME` decimal(8,0) NOT NULL,
  `NOMFERME` longtext,
  `ADRESSEFERME` longtext,
  `TELFERME` varchar(20) DEFAULT NULL,
  `DESCRIPTIONFERME` text,
  `NBPARCELLE` int(11) DEFAULT NULL,
  `NBSECTEUR` bigint(20) DEFAULT NULL,
  `RESPONSABLE` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ferme`
--

INSERT INTO `ferme` (`CODEFERME`, `NOMFERME`, `ADRESSEFERME`, `TELFERME`, `DESCRIPTIONFERME`, `NBPARCELLE`, `NBSECTEUR`, `RESPONSABLE`) VALUES
('10', 'Tambaroua', 'bamako', '00212667999955', 'cette ferme a comme ressource des données urgente', 2, 3, 'Vinh');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `CODEFOUR` int(11) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `SOCAGENT` varchar(50) DEFAULT NULL,
  `ADRESSE` varchar(100) DEFAULT NULL,
  `EMAILAGENT` varchar(50) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `TELAGENT` varchar(20) DEFAULT NULL,
  `INFOAGENT` longtext,
  `PATTENTE` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`CODEFOUR`, `NOM`, `SOCAGENT`, `ADRESSE`, `EMAILAGENT`, `FAX`, `TELAGENT`, `INFOAGENT`, `PATTENTE`) VALUES
(8, 'Hervé', 'MarketStore', 'Ki Ma', 'herve@gmail.com', '', '00212667999955', 'un grand nombre de nos produits sont fournis par MarketStore', 'null');

-- --------------------------------------------------------

--
-- Structure de la table `galerie`
--

CREATE TABLE `galerie` (
  `imgid` varchar(80) NOT NULL,
  `imgnom` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `galerie`
--

INSERT INTO `galerie` (`imgid`, `imgnom`) VALUES
('1', 'www.gfasoft.com/agent/galerie/1.jpeg'),
('2', 'www.gfasoft.com/agent/galerie/2.jpeg'),
('3', 'www.gfasoft.com/agent/galerie/3.jpeg'),
('4', 'www.gfasoft.com/agent/galerie/4.jpeg'),
('5', 'www.gfasoft.com/agent/galerie/5.jpeg'),
('6', 'www.gfasoft.com/agent/galerie/6.jpeg'),
('7', 'www.gfasoft.com/agent/galerie/7.jpeg'),
('8', '	www.gfasoft.com/agent/galerie/8.jpeg'),
('9', '	www.gfasoft.com/agent/galerie/9.jpeg'),
('10', '	www.gfasoft.com/agent/galerie/10.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `imageproduit`
--

CREATE TABLE `imageproduit` (
  `ID_IMG` varchar(45) NOT NULL,
  `IMGPROD` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `imageproduit`
--

INSERT INTO `imageproduit` (`ID_IMG`, `IMGPROD`) VALUES
('Corrosif', 'www.gfasoft.com/agent/images/imageproduit/1.jpg'),
('Explosif', 'www.gfasoft.com/agent/images/imageproduit/2.jpg'),
('Extremement inflammable', 'www.gfasoft.com/agent/images/imageproduit/3.jpg'),
('Facilement inflammable', 'www.gfasoft.com/agent/images/imageproduit/4.jpg'),
('Irritant', 'www.gfasoft.com/agent/images/imageproduit/5.jpg'),
('Dangereux pour l\'environnement', 'www.gfasoft.com/agent/images/imageproduit/6.jpg'),
('Comburant', 'www.gfasoft.com/agent/images/imageproduit/7.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `instocke`
--

CREATE TABLE `instocke` (
  `CODESTOCKE` decimal(8,0) NOT NULL,
  `QAUNTITE` float NOT NULL,
  `MAGASIN` varchar(45) NOT NULL,
  `AGENT` varchar(45) NOT NULL,
  `OBSERVATION` longtext,
  `DESIGNATION` varchar(500) DEFAULT NULL,
  `ETAT` varchar(100) DEFAULT NULL,
  `DATEIN` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `instocke`
--

INSERT INTO `instocke` (`CODESTOCKE`, `QAUNTITE`, `MAGASIN`, `AGENT`, `OBSERVATION`, `DESIGNATION`, `ETAT`, `DATEIN`) VALUES
('1', 2, 'StoreTract', 'Kafando', 'un nouveau tracteur pour faire plus de profit dans la prochaine campagne hivernale 2017', 'Tracteur', 'neuf', '9/11/2017');

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `NULIVRAISON` decimal(8,0) NOT NULL,
  `CODECULTURE` decimal(8,0) NOT NULL,
  `DATELIVRAISON` varchar(100) DEFAULT NULL,
  `POITNET` float DEFAULT NULL,
  `NBGAJETTE` int(11) DEFAULT NULL,
  `CODETRAN` decimal(8,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

CREATE TABLE `machine` (
  `CODEMACHINE` decimal(8,0) NOT NULL,
  `CODESTOCKE` decimal(8,0) DEFAULT NULL,
  `NOMMACHINE` varchar(50) DEFAULT NULL,
  `OBSERVATION` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine`
--

INSERT INTO `machine` (`CODEMACHINE`, `CODESTOCKE`, `NOMMACHINE`, `OBSERVATION`) VALUES
('10', '1', 'Tracteur', 'pas d\'autres observations materiel neuf');

-- --------------------------------------------------------

--
-- Structure de la table `outstocke`
--

CREATE TABLE `outstocke` (
  `CODESTOCKE` decimal(8,0) NOT NULL,
  `QAUNTITE` float NOT NULL,
  `MAGASIN` varchar(150) NOT NULL,
  `AGENT` varchar(150) NOT NULL,
  `OBSERVATION` text,
  `DESIGNATION` varchar(100) DEFAULT NULL,
  `TACHE` varchar(100) DEFAULT NULL,
  `DATEOUT` varchar(50) DEFAULT NULL,
  `PRODUITSORTIE` varchar(100) DEFAULT NULL,
  `MACHINESORTIE` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `outstocke`
--

INSERT INTO `outstocke` (`CODESTOCKE`, `QAUNTITE`, `MAGASIN`, `AGENT`, `OBSERVATION`, `DESIGNATION`, `TACHE`, `DATEOUT`, `PRODUITSORTIE`, `MACHINESORTIE`) VALUES
('4', 5, 'store', 'Herve', 'null', 'pesticides', 'destockage des pesticides', '9/11/2017', 'pesticides', 'Tracteur');

-- --------------------------------------------------------

--
-- Structure de la table `parcelle`
--

CREATE TABLE `parcelle` (
  `CODEPARCELLE` decimal(8,0) NOT NULL,
  `CODEFERME` decimal(8,0) NOT NULL,
  `SURFACE` float DEFAULT NULL,
  `SURFACECULTIVE` float DEFAULT NULL,
  `NBSERRE` int(11) DEFAULT NULL,
  `SURFACENCULTIVE` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `parcelle`
--

INSERT INTO `parcelle` (`CODEPARCELLE`, `CODEFERME`, `SURFACE`, `SURFACECULTIVE`, `NBSERRE`, `SURFACENCULTIVE`) VALUES
('10', '10', 50, 40, 3, 10);

-- --------------------------------------------------------

--
-- Structure de la table `plantation`
--

CREATE TABLE `plantation` (
  `NUPLENTATION` decimal(8,0) NOT NULL,
  `SURFACEPLENTATION` bigint(20) DEFAULT NULL,
  `DATEPENTATION` varchar(50) DEFAULT NULL,
  `NBPLENTE` int(11) DEFAULT NULL,
  `SURGREFF` varchar(10) DEFAULT NULL,
  `ANNEESURGREFF` decimal(8,0) DEFAULT NULL,
  `X1` float NOT NULL,
  `X2` float NOT NULL,
  `Y1` float NOT NULL,
  `Y2` float NOT NULL,
  `DESCPLENT` longtext,
  `PORTEGREF` varchar(100) DEFAULT NULL,
  `CODESER` decimal(8,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `CODEPRODUIT` decimal(8,0) NOT NULL,
  `CODESTOCKE` decimal(8,0) DEFAULT NULL,
  `NOMCOMMERCIAL` varchar(100) DEFAULT NULL,
  `MATIEREACTIVE` varchar(100) DEFAULT NULL,
  `MOLECULE` varchar(100) DEFAULT NULL,
  `CODEFOUR` decimal(8,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`CODEPRODUIT`, `CODESTOCKE`, `NOMCOMMERCIAL`, `MATIEREACTIVE`, `MOLECULE`, `CODEFOUR`) VALUES
('15', '1', 'pesticides', 'biocides', 'CBrClF2', '8');

-- --------------------------------------------------------

--
-- Structure de la table `serre`
--

CREATE TABLE `serre` (
  `CODESER` decimal(8,0) NOT NULL,
  `CODEPARCELLE` decimal(8,0) NOT NULL,
  `SURFACESERRE` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `serre`
--

INSERT INTO `serre` (`CODESER`, `CODEPARCELLE`, `SURFACESERRE`) VALUES
('10', '10', 50);

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE `societe` (
  `NOMSOC` varchar(100) NOT NULL,
  `ADRESSESOC` varchar(500) DEFAULT NULL,
  `TELSOC` varchar(20) DEFAULT NULL,
  `EMAILSOC` varchar(50) DEFAULT NULL,
  `DESCRIPTIONSOC` longtext,
  `PATTENTESOC` varchar(50) DEFAULT NULL,
  `FAXSOC` bigint(20) DEFAULT NULL,
  `LOGO` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `source_d_eau`
--

CREATE TABLE `source_d_eau` (
  `CODE_EAU` int(11) NOT NULL,
  `CODEFERME` decimal(8,0) NOT NULL,
  `TYPE_EAU` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `source_d_eau`
--

INSERT INTO `source_d_eau` (`CODE_EAU`, `CODEFERME`, `TYPE_EAU`) VALUES
(3, '10', 'Solaire');

-- --------------------------------------------------------

--
-- Structure de la table `source_energie`
--

CREATE TABLE `source_energie` (
  `CODE_ENERGIE` int(11) NOT NULL,
  `CODEFERME` decimal(8,0) NOT NULL,
  `TYPE_ENERGIE` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `source_energie`
--

INSERT INTO `source_energie` (`CODE_ENERGIE`, `CODEFERME`, `TYPE_ENERGIE`) VALUES
(3, '10', 'énergie solaire');

-- --------------------------------------------------------

--
-- Structure de la table `stocke`
--

CREATE TABLE `stocke` (
  `CODESTOCKE` decimal(8,0) NOT NULL,
  `QAUNTITE` float NOT NULL,
  `MAGASIN` varchar(100) NOT NULL,
  `AGENT` varchar(100) NOT NULL,
  `OBSERVATION` longtext,
  `DESIGNATION` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE `traitement` (
  `NUMTRAITEMENT` decimal(8,0) NOT NULL,
  `CODESER` decimal(8,0) NOT NULL,
  `DATETRAITEMENT` varchar(50) DEFAULT NULL,
  `DUREE_DE_TRAITEMENT` int(11) DEFAULT NULL,
  `OBSERVATION` text,
  `TYPETRAITEMENT` varchar(50) DEFAULT NULL,
  `TOTALQLITE` float DEFAULT NULL,
  `COUTPROD` float DEFAULT NULL,
  `AGENT_TRAIT` varchar(100) DEFAULT NULL,
  `SURTRAI` float DEFAULT NULL,
  `CODEPRODUIT` decimal(8,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `transporteur`
--

CREATE TABLE `transporteur` (
  `CODETRAN` decimal(8,0) NOT NULL,
  `NOM` varchar(100) DEFAULT NULL,
  `SOCAGENT` varchar(100) DEFAULT NULL,
  `ADRESS` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FAX` varchar(50) DEFAULT NULL,
  `TELAGENT` varchar(50) DEFAULT NULL,
  `INFOAGENT` longtext,
  `MARQUE` varchar(100) DEFAULT NULL,
  `MATRICULE` varchar(50) DEFAULT NULL,
  `TARIF` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `ID` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `EMAILUSER` varchar(100) NOT NULL,
  `ROLE` varchar(50) NOT NULL,
  `NOMUSER` varchar(50) DEFAULT NULL,
  `GRADEUSER` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`ID`, `PASSWORD`, `EMAILUSER`, `ROLE`, `NOMUSER`, `GRADEUSER`) VALUES
('admin', '123456', 'admin@h.fr', 'admin', 'Admin', 'Administrateur'),
('agent', 'agents', 'agent@gmail.com', 'Agent', 'agent', 'D10'),
('chefexploitation', 'exploitation', 'exploit@gmail.com', 'chef d\'exploitation', 'chef exploitation', 'B8'),
('Chefculture', 'cultures', 'cultur@gmail.com', 'chef de culture', 'chef culture', 'H1');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`CODEACH`);

--
-- Index pour la table `aune`
--
ALTER TABLE `aune`
  ADD PRIMARY KEY (`ID_IMG`,`CODEPRODUIT`),
  ADD KEY `FK_AUNE2` (`CODEPRODUIT`);

--
-- Index pour la table `batre`
--
ALTER TABLE `batre`
  ADD PRIMARY KEY (`CODEENNEMIE`,`CODEPRODUIT`),
  ADD KEY `FK_BATRE2` (`CODEPRODUIT`);

--
-- Index pour la table `commissionnaire`
--
ALTER TABLE `commissionnaire`
  ADD PRIMARY KEY (`CODECOM`);

--
-- Index pour la table `cueillette`
--
ALTER TABLE `cueillette`
  ADD PRIMARY KEY (`CODECUEIL`),
  ADD KEY `FK_FAIRE` (`CODESER`);

--
-- Index pour la table `culture`
--
ALTER TABLE `culture`
  ADD PRIMARY KEY (`CODECULTURE`);

--
-- Index pour la table `ennemie`
--
ALTER TABLE `ennemie`
  ADD PRIMARY KEY (`CODEENNEMIE`);

--
-- Index pour la table `ferme`
--
ALTER TABLE `ferme`
  ADD PRIMARY KEY (`CODEFERME`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`CODEFOUR`);

--
-- Index pour la table `imageproduit`
--
ALTER TABLE `imageproduit`
  ADD PRIMARY KEY (`ID_IMG`);

--
-- Index pour la table `instocke`
--
ALTER TABLE `instocke`
  ADD PRIMARY KEY (`CODESTOCKE`) USING BTREE;

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`NULIVRAISON`),
  ADD KEY `FK_REALISER` (`CODECULTURE`),
  ADD KEY `FK_FOURNER` (`CODETRAN`);

--
-- Index pour la table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`CODEMACHINE`),
  ADD KEY `FK_STOCKER` (`CODESTOCKE`);

--
-- Index pour la table `outstocke`
--
ALTER TABLE `outstocke`
  ADD PRIMARY KEY (`CODESTOCKE`);

--
-- Index pour la table `parcelle`
--
ALTER TABLE `parcelle`
  ADD PRIMARY KEY (`CODEPARCELLE`),
  ADD KEY `FK_AVOIR` (`CODEFERME`);

--
-- Index pour la table `plantation`
--
ALTER TABLE `plantation`
  ADD PRIMARY KEY (`NUPLENTATION`),
  ADD KEY `FK_EFFECTUER` (`CODESER`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`CODEPRODUIT`),
  ADD KEY `FK_METTRE` (`CODESTOCKE`);

--
-- Index pour la table `serre`
--
ALTER TABLE `serre`
  ADD PRIMARY KEY (`CODESER`),
  ADD KEY `FK_CONTENIR` (`CODEPARCELLE`);

--
-- Index pour la table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`NOMSOC`);

--
-- Index pour la table `source_d_eau`
--
ALTER TABLE `source_d_eau`
  ADD PRIMARY KEY (`CODE_EAU`),
  ADD KEY `FK_DISPOSER` (`CODEFERME`);

--
-- Index pour la table `source_energie`
--
ALTER TABLE `source_energie`
  ADD PRIMARY KEY (`CODE_ENERGIE`),
  ADD KEY `FK_AYANT` (`CODEFERME`);

--
-- Index pour la table `stocke`
--
ALTER TABLE `stocke`
  ADD PRIMARY KEY (`CODESTOCKE`);

--
-- Index pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`NUMTRAITEMENT`),
  ADD KEY `FK_EXECUTER` (`CODESER`),
  ADD KEY `FK_par` (`CODEPRODUIT`);

--
-- Index pour la table `transporteur`
--
ALTER TABLE `transporteur`
  ADD PRIMARY KEY (`CODETRAN`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `source_d_eau`
--
ALTER TABLE `source_d_eau`
  MODIFY `CODE_EAU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `source_energie`
--
ALTER TABLE `source_energie`
  MODIFY `CODE_ENERGIE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
