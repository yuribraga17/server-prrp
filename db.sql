-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17-Maio-2023 às 15:53
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `ID` int(11) NOT NULL,
  `Username` varchar(24) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT '0',
  `Gender` int(11) NOT NULL DEFAULT '1',
  `Age` int(11) NOT NULL DEFAULT '0',
  `Admin` int(11) NOT NULL DEFAULT '0',
  `Skin` int(11) NOT NULL DEFAULT '7',
  `pLutaStyle` int(11) NOT NULL DEFAULT '4',
  `PosX` float NOT NULL DEFAULT '1742.22',
  `PosY` float NOT NULL DEFAULT '-1858.88',
  `PosZ` float NOT NULL DEFAULT '13.414',
  `PosA` float NOT NULL DEFAULT '0',
  `registrado` int(11) NOT NULL DEFAULT '0',
  `Health` float NOT NULL DEFAULT '100',
  `Armour` float NOT NULL DEFAULT '0',
  `Interior` int(11) NOT NULL DEFAULT '0',
  `World` int(11) NOT NULL DEFAULT '0',
  `Tutorial` int(11) NOT NULL DEFAULT '1',
  `EntrouCasa` int(11) NOT NULL DEFAULT '-1',
  `Grana` int(11) NOT NULL DEFAULT '2500',
  `Morto` int(11) NOT NULL DEFAULT '0',
  `pAlgemado` int(11) NOT NULL DEFAULT '0',
  `UltimoLogin` varchar(32) NOT NULL DEFAULT '1',
  `EntrouComplexo` int(11) NOT NULL DEFAULT '-1',
  `EntrouEmpresa` int(11) NOT NULL DEFAULT '-1',
  `Celular` int(11) NOT NULL DEFAULT '0',
  `ChaveEmprestada` int(11) NOT NULL DEFAULT '9999',
  `Job` int(11) NOT NULL DEFAULT '0',
  `PecasMecanicas0` int(11) NOT NULL DEFAULT '0',
  `PecasMecanicas1` int(11) NOT NULL DEFAULT '0',
  `PecasMecanicas2` int(11) NOT NULL DEFAULT '0',
  `PecasMecanicas3` int(11) NOT NULL DEFAULT '0',
  `PecasMecanicas4` int(11) NOT NULL DEFAULT '0',
  `PecasMecanicas5` int(11) NOT NULL DEFAULT '0',
  `PecasMecanicas6` int(11) NOT NULL DEFAULT '0',
  `Fac` int(11) NOT NULL DEFAULT '0',
  `TempoPLD` int(11) NOT NULL DEFAULT '0',
  `ToolKit` int(11) NOT NULL DEFAULT '0',
  `ArrombarDNV` int(11) DEFAULT NULL,
  `Galao` int(11) DEFAULT NULL,
  `ArmaMao` int(11) DEFAULT NULL,
  `Mun9mm` int(11) DEFAULT NULL,
  `Mun556` int(11) DEFAULT NULL,
  `MunCart` int(11) DEFAULT NULL,
  `Mun127` int(11) DEFAULT NULL,
  `pSlot1` int(11) DEFAULT NULL,
  `pSlot2` int(11) DEFAULT NULL,
  `pSlot3` int(11) DEFAULT NULL,
  `pSlot4` int(11) DEFAULT NULL,
  `pSlot5` int(11) DEFAULT NULL,
  `pSlot1a` int(11) DEFAULT NULL,
  `pSlot2a` int(11) DEFAULT NULL,
  `pSlot3a` int(11) DEFAULT NULL,
  `pSlot4a` int(11) DEFAULT NULL,
  `pSlot5a` int(11) DEFAULT NULL,
  `FacCargo` int(11) DEFAULT NULL,
  `pEmServico` int(11) DEFAULT NULL,
  `pPayDay` int(11) NOT NULL DEFAULT '60',
  `pDutySkin` int(11) DEFAULT NULL,
  `pColde` int(11) DEFAULT NULL,
  `pColdreA` int(11) DEFAULT NULL,
  `pArmario1` int(11) DEFAULT NULL,
  `pArmario2` int(11) DEFAULT NULL,
  `pArmario3` int(11) DEFAULT NULL,
  `pArmario4` int(11) DEFAULT NULL,
  `pArmario5` int(11) DEFAULT NULL,
  `pArm9mm` int(11) DEFAULT NULL,
  `pArm556` int(11) DEFAULT NULL,
  `pArmCart` int(11) DEFAULT NULL,
  `pArm127` int(11) DEFAULT NULL,
  `pPrisao` int(11) DEFAULT NULL,
  `pTemPreso` int(11) DEFAULT NULL,
  `CelularL` int(11) DEFAULT NULL,
  `pTester` int(11) DEFAULT NULL,
  `pAceitoSos` int(11) DEFAULT NULL,
  `pNomeOOC` varchar(60) DEFAULT NULL,
  `pDamage0` varchar(64) DEFAULT NULL,
  `pDamage1` varchar(64) DEFAULT NULL,
  `pDamage2` varchar(64) DEFAULT NULL,
  `pDamage3` varchar(64) DEFAULT NULL,
  `pDamage4` varchar(64) DEFAULT NULL,
  `pDamage5` varchar(64) DEFAULT NULL,
  `pDamage6` varchar(64) DEFAULT NULL,
  `pDamage7` varchar(64) DEFAULT NULL,
  `pDamage8` varchar(64) DEFAULT NULL,
  `pDamage9` varchar(64) DEFAULT NULL,
  `pDamage10` varchar(64) DEFAULT NULL,
  `pDamage11` varchar(64) DEFAULT NULL,
  `pDamage12` varchar(64) DEFAULT NULL,
  `pDamage13` varchar(64) DEFAULT NULL,
  `pDamage14` varchar(64) DEFAULT NULL,
  `pDamage15` varchar(64) DEFAULT NULL,
  `pDamage16` varchar(64) DEFAULT NULL,
  `pDamage17` varchar(64) DEFAULT NULL,
  `pDamage18` varchar(64) DEFAULT NULL,
  `pDamage19` varchar(64) DEFAULT NULL,
  `pBanco` int(11) DEFAULT NULL,
  `pMancando` int(11) DEFAULT NULL,
  `pHealthMax` float DEFAULT NULL,
  `pChatStyle` int(11) DEFAULT NULL,
  `pPontos` int(11) DEFAULT NULL,
  `pKickAll` int(11) DEFAULT NULL,
  `pBanAll` int(11) DEFAULT NULL,
  `pBanido` int(11) DEFAULT NULL,
  `pWalkStyle` int(11) DEFAULT NULL,
  `pDoador` int(11) DEFAULT NULL,
  `pChangeNames` int(11) DEFAULT NULL,
  `pDoadorTempo` int(11) DEFAULT NULL,
  `pForca` int(11) DEFAULT NULL,
  `pRadio` int(11) DEFAULT NULL,
  `pRadioChan` int(11) DEFAULT NULL,
  `pMascara` int(11) DEFAULT NULL,
  `pMascaraU` int(11) DEFAULT NULL,
  `pMascID` int(11) DEFAULT NULL,
  `pNomeP` varchar(24) DEFAULT NULL,
  `pAvisos` int(11) DEFAULT NULL,
  `pAviso1` varchar(126) DEFAULT NULL,
  `pAviso2` varchar(126) DEFAULT NULL,
  `pAviso3` varchar(126) DEFAULT NULL,
  `pMenosDanoTiro` float DEFAULT NULL,
  `pDrogaTime` int(11) DEFAULT NULL,
  `pFome` int(11) DEFAULT NULL,
  `pTremorAtirar` int(11) DEFAULT NULL,
  `pUsouDroga` int(11) DEFAULT NULL,
  `pSkillTiro` int(11) DEFAULT NULL,
  `pSavings` int(11) DEFAULT NULL,
  `pColdreX` float DEFAULT NULL,
  `pColdreY` float DEFAULT NULL,
  `pColdreZ` float DEFAULT NULL,
  `pColdreRX` float DEFAULT NULL,
  `pColdreRY` float DEFAULT NULL,
  `pColdreRZ` float DEFAULT NULL,
  `pColdreBone` int(11) DEFAULT NULL,
  `pDriveLic` int(11) DEFAULT NULL,
  `pWepLic` int(11) DEFAULT NULL,
  `pFlyLic` int(11) DEFAULT NULL,
  `pTruckLic` int(11) DEFAULT NULL,
  `pSavingsGerando` int(11) DEFAULT NULL,
  `pBoombox` int(11) DEFAULT NULL,
  `pCigarros` int(11) DEFAULT NULL,
  `pLogado` int(11) DEFAULT NULL,
  `pCasasDeletadas` int(11) DEFAULT NULL,
  `pJobTempo` int(11) DEFAULT NULL,
  `pPlacas` int(11) DEFAULT NULL,
  `pArrombarDNV_C` int(11) DEFAULT NULL,
  `pRaspador` int(11) DEFAULT NULL,
  `pJobInPd` int(11) DEFAULT NULL,
  `pHabDrug` int(11) DEFAULT NULL,
  `pCelularModel` int(11) DEFAULT NULL,
  `pArmasResetadas` int(11) DEFAULT NULL,
  `pEntrouGaragem` int(11) DEFAULT NULL,
  `CelularRing` int(11) DEFAULT NULL,
  `CelularPlano` int(11) DEFAULT NULL,
  `CelularTPlano` int(11) DEFAULT NULL,
  `CelMinutos` int(11) DEFAULT NULL,
  `CelSMSs` int(11) DEFAULT NULL,
  `CelTotalPD` int(11) DEFAULT NULL,
  `AjudaInicial` int(11) DEFAULT NULL,
  `pTomouAlgumTiro` int(11) DEFAULT NULL,
  `pTomouTiroPesado` int(11) DEFAULT NULL,
  `pTomouTiroBrancas` int(11) DEFAULT NULL,
  `pConvenio` int(11) DEFAULT NULL,
  `pTempoMorto` int(11) DEFAULT NULL,
  `desmanx` float DEFAULT NULL,
  `desmany` float DEFAULT NULL,
  `desmanz` float DEFAULT NULL,
  `desmanr` float DEFAULT NULL,
  `tempodesman` int(11) DEFAULT NULL,
  `pAjudaInicialDim` int(11) DEFAULT NULL,
  `pSalarios` int(11) DEFAULT NULL,
  `Birthdate` varchar(255) DEFAULT NULL,
  `Origin` varchar(24) DEFAULT NULL,
  `CreateDate` int(11) DEFAULT NULL,
  `pExecComando` int(11) DEFAULT NULL,
  `pRadioChan2` int(11) DEFAULT NULL,
  `Etnia` int(11) DEFAULT NULL,
  `Peso` int(11) DEFAULT NULL,
  `Altura` int(11) DEFAULT NULL,
  `Olhos` int(11) DEFAULT NULL,
  `Cabelo` int(11) DEFAULT NULL,
  `Fome` int(11) DEFAULT NULL,
  `Sede` int(11) DEFAULT NULL,
  `FactionTeam` int(11) DEFAULT NULL,
  `BanTeam` int(11) DEFAULT NULL,
  `RefundTeam` int(11) DEFAULT NULL,
  `PropertyTeam` int(11) DEFAULT NULL,
  `ucpOwn` int(11) DEFAULT NULL,
  `Bomba` int(11) DEFAULT NULL,
  `TNT` int(11) DEFAULT NULL,
  `C4` int(11) DEFAULT NULL,
  `trafico` int(11) DEFAULT NULL,
  `FabricouDroga` int(11) DEFAULT NULL,
  `CortaRem` int(11) DEFAULT NULL,
  `GranaSuja` int(11) DEFAULT NULL,
  `lavar` float DEFAULT NULL,
  `lavax` float DEFAULT NULL,
  `lavay` float DEFAULT NULL,
  `lavaz` float DEFAULT NULL,
  `pArmario6` int(11) DEFAULT NULL,
  `pArmario7` int(11) DEFAULT NULL,
  `pArmario8` int(11) DEFAULT NULL,
  `pArmario9` int(11) DEFAULT NULL,
  `pArmario10` int(11) DEFAULT NULL,
  `baterias` int(11) NOT NULL,
  `bateria` int(11) DEFAULT NULL,
  `Ouro` int(11) DEFAULT NULL,
  `Prata` int(11) DEFAULT NULL,
  `Bronze` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`ID`, `Username`, `Password`, `Level`, `Gender`, `Age`, `Admin`, `Skin`, `pLutaStyle`, `PosX`, `PosY`, `PosZ`, `PosA`, `registrado`, `Health`, `Armour`, `Interior`, `World`, `Tutorial`, `EntrouCasa`, `Grana`, `Morto`, `pAlgemado`, `UltimoLogin`, `EntrouComplexo`, `EntrouEmpresa`, `Celular`, `ChaveEmprestada`, `Job`, `PecasMecanicas0`, `PecasMecanicas1`, `PecasMecanicas2`, `PecasMecanicas3`, `PecasMecanicas4`, `PecasMecanicas5`, `PecasMecanicas6`, `Fac`, `TempoPLD`, `ToolKit`, `ArrombarDNV`, `Galao`, `ArmaMao`, `Mun9mm`, `Mun556`, `MunCart`, `Mun127`, `pSlot1`, `pSlot2`, `pSlot3`, `pSlot4`, `pSlot5`, `pSlot1a`, `pSlot2a`, `pSlot3a`, `pSlot4a`, `pSlot5a`, `FacCargo`, `pEmServico`, `pPayDay`, `pDutySkin`, `pColde`, `pColdreA`, `pArmario1`, `pArmario2`, `pArmario3`, `pArmario4`, `pArmario5`, `pArm9mm`, `pArm556`, `pArmCart`, `pArm127`, `pPrisao`, `pTemPreso`, `CelularL`, `pTester`, `pAceitoSos`, `pNomeOOC`, `pDamage0`, `pDamage1`, `pDamage2`, `pDamage3`, `pDamage4`, `pDamage5`, `pDamage6`, `pDamage7`, `pDamage8`, `pDamage9`, `pDamage10`, `pDamage11`, `pDamage12`, `pDamage13`, `pDamage14`, `pDamage15`, `pDamage16`, `pDamage17`, `pDamage18`, `pDamage19`, `pBanco`, `pMancando`, `pHealthMax`, `pChatStyle`, `pPontos`, `pKickAll`, `pBanAll`, `pBanido`, `pWalkStyle`, `pDoador`, `pChangeNames`, `pDoadorTempo`, `pForca`, `pRadio`, `pRadioChan`, `pMascara`, `pMascaraU`, `pMascID`, `pNomeP`, `pAvisos`, `pAviso1`, `pAviso2`, `pAviso3`, `pMenosDanoTiro`, `pDrogaTime`, `pFome`, `pTremorAtirar`, `pUsouDroga`, `pSkillTiro`, `pSavings`, `pColdreX`, `pColdreY`, `pColdreZ`, `pColdreRX`, `pColdreRY`, `pColdreRZ`, `pColdreBone`, `pDriveLic`, `pWepLic`, `pFlyLic`, `pTruckLic`, `pSavingsGerando`, `pBoombox`, `pCigarros`, `pLogado`, `pCasasDeletadas`, `pJobTempo`, `pPlacas`, `pArrombarDNV_C`, `pRaspador`, `pJobInPd`, `pHabDrug`, `pCelularModel`, `pArmasResetadas`, `pEntrouGaragem`, `CelularRing`, `CelularPlano`, `CelularTPlano`, `CelMinutos`, `CelSMSs`, `CelTotalPD`, `AjudaInicial`, `pTomouAlgumTiro`, `pTomouTiroPesado`, `pTomouTiroBrancas`, `pConvenio`, `pTempoMorto`, `desmanx`, `desmany`, `desmanz`, `desmanr`, `tempodesman`, `pAjudaInicialDim`, `pSalarios`, `Birthdate`, `Origin`, `CreateDate`, `pExecComando`, `pRadioChan2`, `Etnia`, `Peso`, `Altura`, `Olhos`, `Cabelo`, `Fome`, `Sede`, `FactionTeam`, `BanTeam`, `RefundTeam`, `PropertyTeam`, `ucpOwn`, `Bomba`, `TNT`, `C4`, `trafico`, `FabricouDroga`, `CortaRem`, `GranaSuja`, `lavar`, `lavax`, `lavay`, `lavaz`, `pArmario6`, `pArmario7`, `pArmario8`, `pArmario9`, `pArmario10`, `baterias`, `bateria`, `Ouro`, `Prata`, `Bronze`) VALUES
(1, 'Hubert_Alves', 'B14B6F031956CA8E71271A4872185B4A2FC030E9D5AABF709F62EB32C5F4991A1272A99B63CEDB6C895FD41D350501E562A248FF6DDD4698669674558B3109DE', 50002, 1, 0, 3002, 124, 4, 1745.48, -1570.3, 13.537, 166.616, 1, 100, 0, 0, 115, 1, -1, 9759950, 0, 0, '12-5-2023 - 18:29:14', -1, 15, 756948, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5, 0, 1, 0, 0, 0, 0, 6270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'Hubert Alves', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', 8082, NULL, 100, 3, 1, 0, 0, 0, 0, 3, 10, 1715033334, 0, 1, 0, 0, 0, 0, 'Hubert_Alves', 0, '', 'NULL', NULL, 0, 0, NULL, 0, 0, 6000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 330, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, 0, '\Z', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 90, 90, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `armarios`
--

CREATE TABLE `armarios` (
  `ID` int(11) NOT NULL,
  `posX` float DEFAULT NULL,
  `posY` float DEFAULT NULL,
  `posZ` float DEFAULT NULL,
  `faccaoID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `a_ajailrecord`
--

CREATE TABLE `a_ajailrecord` (
  `ajailrec` int(11) NOT NULL,
  `PlayerNome` varchar(24) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `Data` varchar(36) NOT NULL,
  `Motivo` varchar(255) NOT NULL,
  `Admin` varchar(24) NOT NULL,
  `IP` varchar(36) NOT NULL,
  `Tempo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `a_ajailrecord`
--

INSERT INTO `a_ajailrecord` (`ajailrec`, `PlayerNome`, `PlayerID`, `Data`, `Motivo`, `Admin`, `IP`, `Tempo`) VALUES
(3, 'James_Limma', 32, '15-1-2023 - 21:03:50', 'James_Limma', 'Mikael Afonso', '00', 1),
(4, 'Genildo Ferreira', 86, '17-1-2023 - 18:00:46', 'dm', 'Mikael Afonso', 'IP: 138.94.164.9', 1800),
(5, 'Genildo Ferreira', 86, '17-1-2023 - 18:00:55', 'reajuste', 'Mikael Afonso', 'IP: 138.94.164.9', 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `a_banrecord`
--

CREATE TABLE `a_banrecord` (
  `banrec` int(11) NOT NULL,
  `PlayerNome` varchar(24) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `Data` varchar(36) NOT NULL,
  `Motivo` varchar(255) NOT NULL,
  `Admin` varchar(24) NOT NULL,
  `IP` varchar(36) NOT NULL,
  `Banido` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `a_banrecord`
--

INSERT INTO `a_banrecord` (`banrec`, `PlayerNome`, `PlayerID`, `Data`, `Motivo`, `Admin`, `IP`, `Banido`) VALUES
(3, 'Lucas_Cassio', 0, '17/01/2023, 20:24', 'godmod, unfreeze e etc.', 'YurS', 'Adwards', 0),
(4, 'Caleb_Frentosa', 66, '17/01/2023, 20:24', 'unfreeze', 'YurS', 'IP: 186.203.25.219', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `a_email`
--

CREATE TABLE `a_email` (
  `userid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `a_kickrec`
--

CREATE TABLE `a_kickrec` (
  `kickrec` int(11) NOT NULL,
  `PlayerNome` varchar(24) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `Data` varchar(36) NOT NULL,
  `Motivo` varchar(255) NOT NULL,
  `Admin` varchar(24) NOT NULL,
  `IP` varchar(36) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `a_kickrec`
--

INSERT INTO `a_kickrec` (`kickrec`, `PlayerNome`, `PlayerID`, `Data`, `Motivo`, `Admin`, `IP`) VALUES
(1, 'Mateus Silva', 37, '14-1-2023 - 17:05:44', 'bugado', 'Mikael Afonso', 'IP: 177.208.184.204'),
(2, 'Mateus Silva', 37, '14-1-2023 - 17:09:22', 'gmx', 'Mikael Afonso', 'IP: 177.208.184.204'),
(3, 'Alexa Gotti', 26, '14-1-2023 - 17:09:25', 'gmx', 'Mikael Afonso', 'IP: 168.197.221.236'),
(4, 'Fernando Martins', 3, '15-1-2023 - 17:22:08', 'setado', 'Mikael Afonso', 'IP: 170.78.166.105'),
(5, 'Alexa Gotti', 26, '15-1-2023 - 18:11:44', 'deslogar pra testar o ping ', 'Mikael Silva', 'IP: 168.197.221.236'),
(6, 'Armando Peixoto', 10, '16-1-2023 - 19:28:11', 'Erro de posiÃ§Ã£o.', 'Alexa Gotti', 'IP: 45.238.78.148'),
(7, 'Armando Peixoto', 10, '20-1-2023 - 18:16:39', 'EPP', 'Mateus Silva', 'IP: 45.238.78.148');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartuxo`
--

CREATE TABLE `cartuxo` (
  `CartuxoID` int(11) NOT NULL,
  `CartuxoTipo` int(11) NOT NULL,
  `cartuxoX` float NOT NULL,
  `cartuxoY` float NOT NULL,
  `cartuxoZ` float NOT NULL,
  `cartuxoRX` float NOT NULL,
  `cartuxoRY` float NOT NULL,
  `cartuxoRZ` float NOT NULL,
  `cartuxoInt` int(11) NOT NULL,
  `cartuxoWorld` int(11) NOT NULL,
  `cartuxoQnt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cartuxo`
--

INSERT INTO `cartuxo` (`CartuxoID`, `CartuxoTipo`, `cartuxoX`, `cartuxoY`, `cartuxoZ`, `cartuxoRX`, `cartuxoRY`, `cartuxoRZ`, `cartuxoInt`, `cartuxoWorld`, `cartuxoQnt`) VALUES
(1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, 2994.56, -1683.78, -147.226, 0, 0, 0, 0, 0, 934),
(7, 2, 2997.59, -1689.16, -35.6166, 0, 0, 0, 0, 0, 2000),
(8, 2, 2997.59, -1697, -214.283, 0, 0, 0, 0, 0, 2000),
(9, 2, 2996.3, -1700.21, -239.523, 0, 0, 0, 0, 0, 597),
(10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 1, 2314.62, -1211.91, 1048.42, 0, 0, 0, 6, 504, 85);

-- --------------------------------------------------------

--
-- Estrutura da tabela `casas`
--

CREATE TABLE `casas` (
  `hID` int(11) NOT NULL,
  `Criada` int(11) DEFAULT NULL,
  `Dono` int(11) DEFAULT NULL,
  `ExX` float DEFAULT NULL,
  `ExY` float DEFAULT NULL,
  `ExZ` float DEFAULT NULL,
  `InX` float DEFAULT NULL,
  `InY` float DEFAULT NULL,
  `InZ` float DEFAULT NULL,
  `ExWorld` int(11) DEFAULT NULL,
  `ExInt` int(11) DEFAULT NULL,
  `Int` int(11) DEFAULT NULL,
  `Preco` int(11) DEFAULT NULL,
  `Trancada` int(11) DEFAULT NULL,
  `PlacaX` float DEFAULT NULL,
  `PlacaY` float DEFAULT NULL,
  `PlacaZ` float DEFAULT NULL,
  `PlacaR` float DEFAULT NULL,
  `AVenda` int(11) DEFAULT NULL,
  `TelCont` int(11) DEFAULT NULL,
  `Perm1` varchar(24) DEFAULT NULL,
  `Perm2` varchar(24) DEFAULT NULL,
  `Perm3` varchar(24) DEFAULT NULL,
  `hBank` int(11) DEFAULT NULL,
  `hXMR` varchar(256) DEFAULT NULL,
  `hDia` int(11) DEFAULT NULL,
  `hMes` int(11) DEFAULT NULL,
  `hAno` int(11) DEFAULT NULL,
  `hTipo` int(11) DEFAULT NULL,
  `hAlarme` int(11) DEFAULT NULL,
  `hInterruptor` int(11) DEFAULT NULL,
  `hGasto` int(11) DEFAULT NULL,
  `hEndereco` varchar(32) DEFAULT NULL,
  `ExX2` float DEFAULT NULL,
  `ExY2` float DEFAULT NULL,
  `ExZ2` float DEFAULT NULL,
  `InX2` float DEFAULT NULL,
  `InY2` float DEFAULT NULL,
  `InZ2` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `casas`
--

INSERT INTO `casas` (`hID`, `Criada`, `Dono`, `ExX`, `ExY`, `ExZ`, `InX`, `InY`, `InZ`, `ExWorld`, `ExInt`, `Int`, `Preco`, `Trancada`, `PlacaX`, `PlacaY`, `PlacaZ`, `PlacaR`, `AVenda`, `TelCont`, `Perm1`, `Perm2`, `Perm3`, `hBank`, `hXMR`, `hDia`, `hMes`, `hAno`, `hTipo`, `hAlarme`, `hInterruptor`, `hGasto`, `hEndereco`, `ExX2`, `ExY2`, `ExZ2`, `InX2`, `InY2`, `InZ2`) VALUES
(1, 1, 0, 2451.79, -960.439, 80.1082, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 0, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 1674931132, 0, 0, 0, 0, 0, 0, 'R. Pedro Laranja, 1', 0, 0, 0, 0, 0, 0),
(2, 1, 0, 2462.13, -945.706, 81.6554, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 0, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Pedro Laranja, 2', 0, 0, 0, 0, 0, 0),
(3, 1, 0, 2466.73, -946.39, 80.0988, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Pedro Laranja, 3', 0, 0, 0, 0, 0, 0),
(4, 1, 0, 2471.62, -955.6, 81.4625, 2308.97, -1212.62, 1048.2, 0, 0, 6, 11000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Pedro Laranja, 4', 0, 0, 0, 0, 0, 0),
(5, 1, 0, 2478.1, -950.616, 80.1847, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Pedro Laranja, 5', 0, 0, 0, 0, 0, 0),
(6, 1, 0, 2479.69, -954.997, 82.7088, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Pedro Laranja, 6', 0, 0, 0, 0, 0, 0),
(7, 1, 0, 2481.94, -967.061, 81.4325, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Pedro Laranja, 7', 0, 0, 0, 0, 0, 0),
(8, 1, 0, 2513.88, -952.69, 85.9699, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 1', 0, 0, 0, 0, 0, 0),
(9, 1, 0, 2512.99, -953.915, 85.9866, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 2', 0, 0, 0, 0, 0, 0),
(10, 1, 0, 2519.49, -953.866, 82.33, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 3', 0, 0, 0, 0, 0, 0),
(11, 1, 0, 2523.35, -965.922, 82.3423, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 4', 0, 0, 0, 0, 0, 0),
(12, 1, 0, 2530.62, -976.296, 81.8843, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 5', 0, 0, 0, 0, 0, 0),
(13, 1, 0, 2534, -977.326, 81.8843, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 6', 0, 0, 0, 0, 0, 0),
(14, 1, 0, 2539.14, -977.321, 81.8843, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 6', 0, 0, 0, 0, 0, 0),
(15, 1, 0, 2544.91, -978.846, 81.8843, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 7', 0, 0, 0, 0, 0, 0),
(16, 1, 0, 2549.35, -978.752, 81.8843, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 8', 0, 0, 0, 0, 0, 0),
(17, 1, 0, 2535.77, -964.543, 85.1259, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 9', 0, 0, 0, 0, 0, 0),
(18, 1, 0, 2550.42, -962.967, 82.4039, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 10', 0, 0, 0, 0, 0, 0),
(19, 1, 0, 2555.65, -962.399, 82.6501, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 11', 0, 0, 0, 0, 0, 0),
(20, 1, 0, 2554.26, -980.157, 81.6292, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 12', 0, 0, 0, 0, 0, 0),
(21, 1, 0, 2569.09, -974.583, 81.9011, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 13', 0, 0, 0, 0, 0, 0),
(22, 1, 0, 2563.3, -986.261, 81.4748, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 14', 0, 0, 0, 0, 0, 0),
(23, 1, 0, 2575.27, -974.964, 81.3591, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 15', 0, 0, 0, 0, 0, 0),
(24, 1, 0, 2567.89, -991.702, 80.8218, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 16', 0, 0, 0, 0, 0, 0),
(25, 1, 0, 2578.13, -994.76, 79.996, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 17', 0, 0, 0, 0, 0, 0),
(26, 1, 0, 2566.79, -997.581, 82.3375, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 18', 0, 0, 0, 0, 0, 0),
(27, 1, 0, 2584.42, -1002.53, 80.4804, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 19', 0, 0, 0, 0, 0, 0),
(28, 1, 0, 2585.99, -1002.7, 80.3731, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 20', 0, 0, 0, 0, 0, 0),
(29, 1, 0, 2588.03, -974.994, 81.3889, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 21', 0, 0, 0, 0, 0, 0),
(30, 1, 0, 2610.42, -985.019, 81.6927, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 22', 0, 0, 0, 0, 0, 0),
(31, 1, 0, 2619.76, -981.6, 80.985, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 23', 0, 0, 0, 0, 0, 0),
(32, 1, 0, 2618.91, -994.436, 82.2574, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 24', 0, 0, 0, 0, 0, 0),
(33, 1, 0, 2608.69, -994.681, 82.4719, 2308.97, -1212.62, 1048.2, 0, 0, 6, 11000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Santo Cristo, 25', 0, 0, 0, 0, 0, 0),
(34, 1, 0, 2585.88, -936.545, 84.2498, 2308.97, -1212.62, 1048.2, 0, 0, 6, 11000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Marina Louveira, 1', 0, 0, 0, 0, 0, 0),
(35, 1, 0, 2584.59, -935.544, 84.2787, 2308.97, -1212.62, 1048.2, 0, 0, 6, 11000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Marina Louveira, 2', 0, 0, 0, 0, 0, 0),
(36, 1, 0, 2572.85, -935.845, 82.0102, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Marina Louveira, 3', 0, 0, 0, 0, 0, 0),
(37, 1, 0, 2555.71, -942.297, 83.0541, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Marina Louveira, 4', 0, 0, 0, 0, 0, 0),
(38, 1, 0, 2597.33, -991.678, 80.2052, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 1', 0, 0, 0, 0, 0, 0),
(39, 1, 0, 2598.57, -998.394, 78.9921, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 2', 0, 0, 0, 0, 0, 0),
(40, 1, 0, 2561.6, -1005.3, 76.7117, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 3', 0, 0, 0, 0, 0, 0),
(41, 1, 0, 2540.21, -1010.77, 75.5746, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 4', 0, 0, 0, 0, 0, 0),
(42, 1, 0, 2545.2, -1011.53, 75.5746, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 5', 0, 0, 0, 0, 0, 0),
(43, 1, 0, 2548.74, -1011.01, 75.5746, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 6', 0, 0, 0, 0, 0, 0),
(44, 1, 0, 2554.46, -1011.92, 75.5746, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 7', 0, 0, 0, 0, 0, 0),
(45, 1, 0, 2558.82, -1011.44, 75.5746, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 8', 0, 0, 0, 0, 0, 0),
(46, 1, 0, 2540.62, -1001.34, 78.0522, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 9', 0, 0, 0, 0, 0, 0),
(47, 1, 0, 2531.71, -1005.06, 73.3299, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 10', 0, 0, 0, 0, 0, 0),
(48, 1, 0, 2565.38, -1014.32, 73.888, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 11', 0, 0, 0, 0, 0, 0),
(49, 1, 0, 2571, -1011.41, 75.7154, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 12', 0, 0, 0, 0, 0, 0),
(50, 1, 0, 2579.75, -1013.46, 75.6277, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 13', 0, 0, 0, 0, 0, 0),
(51, 1, 0, 2572.3, -1016.93, 73.4412, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 14', 0, 0, 0, 0, 0, 0),
(52, 1, 0, 2594.43, -1026.47, 71.3792, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 15', 0, 0, 0, 0, 0, 0),
(53, 1, 0, 2611.76, -1030.99, 73.6573, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 16', 0, 0, 0, 0, 0, 0),
(54, 1, 0, 2605.15, -1021.83, 75.3429, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 17', 0, 0, 0, 0, 0, 0),
(55, 1, 0, 2612.39, -1015.41, 78.7751, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 18', 0, 0, 0, 0, 0, 0),
(56, 1, 0, 2614.91, -1008.93, 80.7845, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 19', 0, 0, 0, 0, 0, 0),
(57, 1, 0, 2621.17, -1010.42, 82.1949, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 20', 0, 0, 0, 0, 0, 0),
(58, 1, 0, 2617.49, -1022.85, 77.1275, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 21', 0, 0, 0, 0, 0, 0),
(59, 1, 0, 2592.67, -1016.7, 74.7029, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 22', 0, 0, 0, 0, 0, 0),
(60, 1, 34, 2603.49, -1002.75, 78.9921, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 1675303586, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 23', 0, 0, 0, 0, 0, 0),
(61, 1, 0, 2590.56, -1007.15, 75.972, 2308.97, -1212.62, 1048.2, 0, 0, 6, 12000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Corcovado, 24', 0, 0, 0, 0, 0, 0),
(62, 1, 0, 2502.84, -1067, 70.1389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 1', 0, 0, 0, 0, 0, 0),
(63, 1, 0, 2491.45, -1012.09, 65.3983, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 2', 0, 0, 0, 0, 0, 0),
(64, 1, 0, 2520.62, -1062.22, 69.5639, 2308.97, -1212.62, 1048.2, 0, 0, 6, 16000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 3', 0, 0, 0, 0, 0, 0),
(65, 1, 0, 2527.09, -1027.16, 69.7108, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 4', 0, 0, 0, 0, 0, 0),
(66, 1, 0, 2532.87, -1033.87, 69.5848, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 5', 0, 0, 0, 0, 0, 0),
(67, 1, 0, 2539.98, -1028.62, 71.6949, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 6', 0, 0, 0, 0, 0, 0),
(68, 1, 0, 2550.41, -1034.81, 69.7097, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 7', 0, 0, 0, 0, 0, 0),
(69, 1, 0, 2557.28, -1035.42, 69.5727, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 8', 0, 0, 0, 0, 0, 0),
(70, 1, 0, 2563.92, -1033.07, 70.8983, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 9', 0, 0, 0, 0, 0, 0),
(71, 1, 0, 2567.26, -1032.7, 72.0798, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 10', 0, 0, 0, 0, 0, 0),
(72, 1, 0, 2567.85, -1025.61, 70.7077, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 11', 0, 0, 0, 0, 0, 0),
(73, 1, 0, 2576.47, -1027.34, 69.9449, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 12', 0, 0, 0, 0, 0, 0),
(74, 1, 0, 2575.1, -1028.3, 69.9531, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 13', 0, 0, 0, 0, 0, 0),
(75, 1, 0, 2582.4, -1030.15, 69.5735, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 14', 0, 0, 0, 0, 0, 0),
(76, 1, 0, 2587.08, -1030.7, 71.791, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 15', 0, 0, 0, 0, 0, 0),
(77, 1, 0, 2595.3, -1035.4, 69.8615, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 16', 0, 0, 0, 0, 0, 0),
(78, 1, 0, 2613.83, -1037.68, 70.1548, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 17', 0, 0, 0, 0, 0, 0),
(79, 1, 1, 2620.23, -1033.72, 72.3106, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 1676580430, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 18', 0, 0, 0, 0, 0, 0),
(80, 1, 0, 2621.78, -1027.89, 74.8983, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 19', 0, 0, 0, 0, 0, 0),
(81, 1, 0, 2628.56, -1004, 82.9318, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'R. Carlos Marinho, 20', 0, 0, 0, 0, 0, 0),
(82, 1, 0, 1298.48, -798.019, 84.1406, 2308.97, -1212.62, 1048.2, 0, 0, 6, 18000000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Vinewood Mansion', 0, 0, 0, 0, 0, 0),
(83, 1, 0, 797.259, -1729.04, 13.5466, 226.305, 1114.3, 1080.99, 0, 0, 5, 42000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panopticon Ave, 1', 0, 0, 0, 0, 0, 0),
(84, 1, 0, 793.978, -1707.41, 14.0382, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 2', 0, 0, 0, 0, 0, 0),
(85, 1, 0, 794.993, -1692.09, 14.4631, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 3', 0, 0, 0, 0, 0, 0),
(86, 1, 0, 1958.76, -1560.27, 13.5943, 2308.97, -1212.62, 1048.2, 0, 0, 6, 32000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 4', 0, 0, 0, 0, 0, 0),
(87, 1, 0, 1967.31, -1633.71, 18.5687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 17000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 5', 0, 0, 0, 0, 0, 0),
(88, 1, 0, 1972.05, -1633.71, 18.5687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 17000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 8', 0, 0, 0, 0, 0, 0),
(89, 1, 0, 1967.68, -1633.71, 15.9687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 17000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 7', 0, 0, 0, 0, 0, 0),
(90, 1, 0, 1972.47, -1633.71, 15.9687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 17000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 7', 0, 0, 0, 0, 0, 0),
(91, 1, 0, 1969.48, -1654.67, 15.9687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 16000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 9', 0, 0, 0, 0, 0, 0),
(92, 1, 0, 1970.11, -1671.19, 18.5454, 2308.97, -1212.62, 1048.2, 0, 0, 6, 16000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 10', 0, 0, 0, 0, 0, 0),
(93, 1, 0, 1970.11, -1671.19, 15.9687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 16000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 11', 0, 0, 0, 0, 0, 0),
(94, 1, 0, 1969.37, -1705.14, 15.9687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Panoptiicon Ave, 12', 0, 0, 0, 0, 0, 0),
(95, 1, 0, 1980.38, -1718.99, 17.0303, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 1', 0, 0, 0, 0, 0, 0),
(96, 1, 0, 1973.13, -1705.15, 15.9687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 2', 0, 0, 0, 0, 0, 0),
(97, 1, 0, 1981, -1682.66, 17.0534, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 3', 0, 0, 0, 0, 0, 0),
(98, 1, 0, 1974.85, -1671.19, 15.9687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 4', 0, 0, 0, 0, 0, 0),
(99, 1, 0, 1974.91, -1671.2, 18.5454, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 5', 0, 0, 0, 0, 0, 0),
(100, 1, 0, 1973.25, -1654.67, 15.9687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 6', 0, 0, 0, 0, 0, 0),
(101, 1, 0, 1986.71, -1604.95, 13.5319, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 9', 0, 0, 0, 0, 0, 0),
(102, 1, 0, 2002.38, -1594.05, 13.5774, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 10', 0, 0, 0, 0, 0, 0),
(103, 1, 0, 2011.58, -1594.18, 13.5839, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 11', 0, 0, 0, 0, 0, 0),
(104, 1, 0, 1973.02, -1559.8, 13.6398, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 12', 0, 0, 0, 0, 0, 0),
(105, 1, 0, 2018.04, -1629.68, 14.0424, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 13', 0, 0, 0, 0, 0, 0),
(106, 1, 0, 2016.54, -1641.45, 14.1127, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 14', 0, 0, 0, 0, 0, 0),
(107, 1, 0, 2013.57, -1656.42, 14.1363, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 15', 0, 0, 0, 0, 0, 0),
(108, 1, 0, 2018.23, -1703.28, 14.2341, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 16', 0, 0, 0, 0, 0, 0),
(109, 1, 0, 2016.2, -1717.01, 14.125, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 17', 0, 0, 0, 0, 0, 0),
(110, 1, 0, 2015.34, -1732.43, 14.2341, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mason St, 18', 0, 0, 0, 0, 0, 0),
(111, 1, 0, 2067.06, -1731.58, 14.2066, 2308.97, -1212.62, 1048.2, 0, 0, 6, 25000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 1', 0, 0, 0, 0, 0, 0),
(112, 1, 0, 2066.24, -1717.28, 14.1363, 2308.97, -1212.62, 1048.2, 0, 0, 6, 25000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 2', 0, 0, 0, 0, 0, 0),
(113, 1, 0, 2065.1, -1703.51, 14.1484, 2308.97, -1212.62, 1048.2, 0, 0, 6, 25000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 3', 0, 0, 0, 0, 0, 0),
(114, 1, 0, 2066.74, -1656.35, 14.1328, 2308.97, -1212.62, 1048.2, 0, 0, 6, 25000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 4', 0, 0, 0, 0, 0, 0),
(115, 1, 0, 2067.57, -1643.48, 14.1363, 2308.97, -1212.62, 1048.2, 0, 0, 6, 25000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 5', 0, 0, 0, 0, 0, 0),
(116, 1, 0, 2067.7, -1628.81, 14.2066, 2308.97, -1212.62, 1048.2, 0, 0, 6, 25000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 6', 0, 0, 0, 0, 0, 0),
(117, 1, 0, 2157.16, -1709.21, 15.0859, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 7', 0, 0, 0, 0, 0, 0),
(118, 1, 0, 2155.41, -1698.51, 15.0859, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 8', 0, 0, 0, 0, 0, 0),
(119, 1, 0, 2140.46, -1708.3, 15.0859, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 9', 0, 0, 0, 0, 0, 0),
(120, 1, 0, 2139.37, -1697.53, 15.0783, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 10', 0, 0, 0, 0, 0, 0),
(121, 1, 0, 2166.06, -1671.07, 15.0731, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 11', 0, 0, 0, 0, 0, 0),
(122, 1, 0, 2178.41, -1660.13, 14.9785, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 12', 0, 0, 0, 0, 0, 0),
(123, 1, 0, 2222.63, -1497.44, 23.9752, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 13', 0, 0, 0, 0, 0, 0),
(124, 1, 0, 2187.24, -1482.48, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 14', 0, 0, 0, 0, 0, 0),
(125, 1, 0, 2187.46, -1474.94, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 15', 0, 0, 0, 0, 0, 0),
(126, 1, 0, 2180.68, -1482.48, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 16', 0, 0, 0, 0, 0, 0),
(127, 1, 0, 2180.97, -1475.01, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 17', 0, 0, 0, 0, 0, 0),
(128, 1, 0, 2181.11, -1482.48, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 18', 0, 0, 0, 0, 0, 0),
(129, 1, 0, 2187.18, -1482.48, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 19', 0, 0, 0, 0, 0, 0),
(130, 1, 0, 2187.23, -1474.93, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 20', 0, 0, 0, 0, 0, 0),
(131, 1, 0, 2180.93, -1474.93, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 21', 0, 0, 0, 0, 0, 0),
(132, 1, 0, 2187.31, -1450.2, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 22', 0, 0, 0, 0, 0, 0),
(133, 1, 0, 2187.17, -1442.64, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 23', 0, 0, 0, 0, 0, 0),
(134, 1, 0, 2180.89, -1450.19, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 24', 0, 0, 0, 0, 0, 0),
(135, 1, 0, 2180.91, -1442.65, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 25', 0, 0, 0, 0, 0, 0),
(136, 1, 0, 2181.04, -1450.2, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 26', 0, 0, 0, 0, 0, 0),
(137, 1, 0, 2187.17, -1450.19, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 27', 0, 0, 0, 0, 0, 0),
(138, 1, 0, 2187.35, -1442.64, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 28', 0, 0, 0, 0, 0, 0),
(139, 1, 0, 2190.7, -1415.55, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 29', 0, 0, 0, 0, 0, 0),
(140, 1, 0, 2190.73, -1408.13, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 30', 0, 0, 0, 0, 0, 0),
(141, 1, 0, 2184.45, -1408.13, 25.5389, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 31', 0, 0, 0, 0, 0, 0),
(142, 1, 0, 2184.72, -1415.68, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 32', 0, 0, 0, 0, 0, 0),
(143, 1, 0, 2191.19, -1415.67, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 33', 0, 0, 0, 0, 0, 0),
(144, 1, 0, 2190.91, -1408.13, 29.2112, 2308.97, -1212.62, 1048.2, 0, 0, 6, 23000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 34', 0, 0, 0, 0, 0, 0),
(145, 1, 0, 2222.29, -1401.63, 23.9909, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 35', 0, 0, 0, 0, 0, 0),
(146, 1, 0, 2222.16, -1406.81, 23.9906, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 36', 0, 0, 0, 0, 0, 0),
(147, 1, 0, 2224.03, -1410.46, 24.0013, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 37', 0, 0, 0, 0, 0, 0),
(148, 1, 0, 2230.26, -1411.68, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 14000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 38', 0, 0, 0, 0, 0, 0),
(149, 1, 0, 2231.64, -1404.11, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 39', 0, 0, 0, 0, 0, 0),
(150, 1, 0, 2232.5, -1401.89, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 40', 0, 0, 0, 0, 0, 0),
(151, 1, 0, 2237.99, -1402.96, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 41', 0, 0, 0, 0, 0, 0),
(152, 1, 0, 2238.94, -1410.28, 24.0013, 2308.97, -1212.62, 1048.2, 0, 0, 6, 8000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 42', 0, 0, 0, 0, 0, 0),
(153, 1, 0, 2247.45, -1400.43, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 8000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 43', 0, 0, 0, 0, 0, 0),
(154, 1, 0, 2254.12, -1404.86, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 8000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 44', 0, 0, 0, 0, 0, 0),
(155, 1, 0, 2249.83, -1406.37, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 8000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 45', 0, 0, 0, 0, 0, 0),
(156, 1, 0, 2233.06, -1418.75, 23.8281, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 46', 0, 0, 0, 0, 0, 0),
(157, 1, 0, 2237.07, -1418.75, 23.8281, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 47', 0, 0, 0, 0, 0, 0),
(158, 1, 0, 2248.04, -1410.15, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 48', 0, 0, 0, 0, 0, 0),
(159, 1, 0, 2258.99, -1409.35, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 49', 0, 0, 0, 0, 0, 0),
(160, 1, 0, 2269.2, -1410.85, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 50', 0, 0, 0, 0, 0, 0),
(161, 1, 0, 2276.33, -1412.47, 23.9284, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 51', 0, 0, 0, 0, 0, 0),
(162, 1, 0, 2274.7, -1420.11, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 52', 0, 0, 0, 0, 0, 0),
(163, 1, 0, 2276.63, -1425.71, 23.9867, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 53', 0, 0, 0, 0, 0, 0),
(164, 1, 0, 2276.29, -1430.94, 23.9848, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 54', 0, 0, 0, 0, 0, 0),
(165, 1, 0, 2274.74, -1443.5, 23.9768, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 55', 0, 0, 0, 0, 0, 0),
(166, 1, 0, 2270.57, -1450.06, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 56', 0, 0, 0, 0, 0, 0),
(167, 1, 0, 2266.57, -1451.58, 23.8281, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 57', 0, 0, 0, 0, 0, 0),
(168, 1, 0, 2254.68, -1455.37, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 58', 0, 0, 0, 0, 0, 0),
(169, 1, 0, 2246.84, -1455.69, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 58', 0, 0, 0, 0, 0, 0),
(170, 1, 0, 2241.6, -1455.49, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 59', 0, 0, 0, 0, 0, 0),
(171, 1, 0, 2235.1, -1455.41, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 60', 0, 0, 0, 0, 0, 0),
(172, 1, 0, 2229.77, -1455.41, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'San Andreas Blvd, 61', 0, 0, 0, 0, 0, 0),
(173, 1, 0, 2223.22, -1472.98, 24.0055, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 1', 0, 0, 0, 0, 0, 0),
(174, 1, 0, 2231.52, -1475.24, 23.8171, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 2', 0, 0, 0, 0, 0, 0),
(175, 1, 0, 2235.47, -1474.18, 23.739, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 3', 0, 0, 0, 0, 0, 0),
(176, 1, 0, 2240.52, -1474.15, 23.607, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 4', 0, 0, 0, 0, 0, 0),
(177, 1, 0, 2244.42, -1474.09, 23.4869, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 4', 0, 0, 0, 0, 0, 0),
(178, 1, 0, 2249.63, -1474.18, 23.3264, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 5', 0, 0, 0, 0, 0, 0),
(179, 1, 0, 2258.06, -1472.65, 23.3428, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 6', 0, 0, 0, 0, 0, 0),
(180, 1, 0, 2263.13, -1472.99, 23.1375, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 7', 0, 0, 0, 0, 0, 0),
(181, 1, 0, 2266.82, -1474.16, 23.2243, 2308.97, -1212.62, 1048.2, 0, 0, 6, 6000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 8', 0, 0, 0, 0, 0, 0),
(182, 1, 0, 2327.16, -1493.23, 24.0296, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 9', 0, 0, 0, 0, 0, 0),
(183, 1, 0, 2324.11, -1493.63, 23.9759, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 10', 0, 0, 0, 0, 0, 0),
(184, 1, 0, 2319.03, -1494.23, 23.8868, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 11', 0, 0, 0, 0, 0, 0),
(185, 1, 0, 2314.88, -1493.67, 23.6975, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 12', 0, 0, 0, 0, 0, 0),
(186, 1, 0, 2311.56, -1493.68, 23.6396, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 13', 0, 0, 0, 0, 0, 0),
(187, 1, 0, 2306.91, -1493.67, 23.5585, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 14', 0, 0, 0, 0, 0, 0),
(188, 1, 0, 2290.06, -1493.68, 22.9643, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 15', 0, 0, 0, 0, 0, 0),
(189, 1, 0, 2286.47, -1493.68, 22.7761, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 16', 0, 0, 0, 0, 0, 0),
(190, 1, 0, 2281.83, -1493.68, 22.5328, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 17', 0, 0, 0, 0, 0, 0),
(191, 1, 0, 2258.94, -1494.2, 22.9612, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 18', 0, 0, 0, 0, 0, 0),
(192, 1, 0, 2255.26, -1494.24, 23.283, 2308.97, -1212.62, 1048.2, 0, 0, 6, 7000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 19', 0, 0, 0, 0, 0, 0),
(193, 1, 0, 2250.26, -1494.11, 23.3047, 2308.97, -1212.62, 1048.2, 0, 0, 6, 7000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 20', 0, 0, 0, 0, 0, 0),
(194, 1, 0, 2232.97, -1494.08, 23.7919, 2308.97, -1212.62, 1048.2, 0, 0, 6, 7000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 21', 0, 0, 0, 0, 0, 0),
(195, 1, 0, 2228.74, -1493.41, 23.8719, 2308.97, -1212.62, 1048.2, 0, 0, 6, 7000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Forest St, 22', 0, 0, 0, 0, 0, 0),
(196, 1, 0, 1853.89, -1914.29, 15.2566, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 1', 0, 0, 0, 0, 0, 0),
(197, 1, 0, 1872.26, -1911.8, 15.2566, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 2', 0, 0, 0, 0, 0, 0),
(198, 1, 0, 1891.78, -1914.41, 15.2566, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 3', 0, 0, 0, 0, 0, 0),
(199, 1, 0, 1913.26, -1911.91, 15.2566, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 4', 0, 0, 0, 0, 0, 0),
(200, 1, 0, 1928.71, -1915.91, 15.2566, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 5', 0, 0, 0, 0, 0, 0),
(201, 1, 0, 1938.53, -1911.31, 15.2566, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 6', 0, 0, 0, 0, 0, 0),
(202, 1, 0, 2151.17, -1400.93, 26.1284, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 7', 0, 0, 0, 0, 0, 0),
(203, 1, 0, 2150.92, -1419.13, 25.9218, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 8', 0, 0, 0, 0, 0, 0),
(204, 1, 0, 2149.84, -1433.69, 26.0701, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 9', 0, 0, 0, 0, 0, 0),
(205, 1, 0, 2152.21, -1446.01, 26.1049, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 10', 0, 0, 0, 0, 0, 0),
(206, 1, 0, 2146.79, -1470.23, 26.0424, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 11', 0, 0, 0, 0, 0, 0),
(207, 1, 0, 2148.94, -1484.97, 26.6238, 2308.97, -1212.62, 1048.2, 0, 0, 6, 15000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Washington St, 12', 0, 0, 0, 0, 0, 0),
(208, 1, 0, 2129.77, -1361.69, 26.1361, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 1', 0, 0, 0, 0, 0, 0),
(209, 1, 0, 2147.56, -1366.12, 25.9722, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 2', 0, 0, 0, 0, 0, 0),
(210, 1, 0, 2185.05, -1363.72, 26.1597, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 3', 0, 0, 0, 0, 0, 0),
(211, 1, 0, 2202.84, -1363.68, 26.1909, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 4', 0, 0, 0, 0, 0, 0),
(212, 1, 0, 2229.01, -1394.9, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 7000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 5', 0, 0, 0, 0, 0, 0),
(213, 1, 0, 2237.82, -1393.81, 24.0032, 2308.97, -1212.62, 1048.2, 0, 0, 6, 7000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 6', 0, 0, 0, 0, 0, 0),
(214, 1, 0, 2242.39, -1393.84, 24.0032, 2308.97, -1212.62, 1048.2, 0, 0, 6, 7000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 7', 0, 0, 0, 0, 0, 0),
(215, 1, 0, 2245.49, -1394.97, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 8', 0, 0, 0, 0, 0, 0),
(216, 1, 0, 2250.97, -1395.4, 24, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 9', 0, 0, 0, 0, 0, 0),
(217, 1, 0, 2259.66, -1393.73, 24.003, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 10', 0, 0, 0, 0, 0, 0),
(218, 1, 0, 2264.82, -1393.87, 24.0034, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 11', 0, 0, 0, 0, 0, 0),
(219, 1, 0, 2268.32, -1393.9, 24.0034, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 12', 0, 0, 0, 0, 0, 0),
(220, 1, 0, 2274.2, -1393.91, 24.0034, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 13', 0, 0, 0, 0, 0, 0),
(221, 1, 0, 2277.92, -1393.91, 24.045, 2308.97, -1212.62, 1048.2, 0, 0, 6, 5000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 14', 0, 0, 0, 0, 0, 0),
(222, 1, 0, 2398.34, -1368.38, 24.4913, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Carson St, 15', 0, 0, 0, 0, 0, 0),
(223, 1, 0, 769.226, -1745.84, 13.0768, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 1', 0, 0, 0, 0, 0, 0),
(224, 1, 0, 769.206, -1726.23, 13.432, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 2', 0, 0, 0, 0, 0, 0),
(225, 1, 0, 769.226, -1696.45, 5.1553, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 3', 0, 0, 0, 0, 0, 0),
(226, 1, 0, 768.079, -1655.99, 5.6093, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 4', 0, 0, 0, 0, 0, 0),
(227, 1, 0, 766.923, -1605.96, 13.8037, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 5', 0, 0, 0, 0, 0, 0),
(228, 1, 0, 1242.27, -1100.59, 27.9764, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mint St, 1', 0, 0, 0, 0, 0, 0),
(229, 1, 0, 1241.95, -1077.8, 31.5545, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mint St, 2', 0, 0, 0, 0, 0, 0),
(230, 1, 0, 1285.26, -1091.61, 28.2576, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mint St, 3', 0, 0, 0, 0, 0, 0),
(231, 1, 0, 1142.12, -1092.76, 28.1875, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Vice St, 1', 0, 0, 0, 0, 0, 0),
(232, 1, 0, 1285.25, -1065.94, 31.6788, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Mint St, 4', 0, 0, 0, 0, 0, 0),
(233, 1, 0, 1141.81, -1070.04, 31.7656, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Vice St, 2', 0, 0, 0, 0, 0, 0),
(234, 1, 0, 1183.47, -1076.18, 31.6788, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Vice St, 3', 0, 0, 0, 0, 0, 0),
(235, 1, 0, 1183.47, -1098.56, 28.2576, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Vice St, 4', 0, 0, 0, 0, 0, 0),
(236, 1, 0, 993.738, -1059.03, 33.6995, 2308.97, -1212.62, 1048.2, 0, 0, 6, 90000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Sunset Blvd, 1', 0, 0, 0, 0, 0, 0),
(237, 1, 0, 1050.89, -1059.29, 34.7966, 2308.97, -1212.62, 1048.2, 0, 0, 6, 90000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Sunset Blvd, 2', 0, 0, 0, 0, 0, 0),
(238, 1, 0, 1103.4, -1093.64, 28.4687, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Penn St, 1', 0, 0, 0, 0, 0, 0),
(239, 1, 0, 1103.4, -1068.67, 31.8896, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Penn St, 2', 0, 0, 0, 0, 0, 0),
(240, 1, 0, 1059.17, -1105.14, 28.045, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Penn St, 3', 0, 0, 0, 0, 0, 0),
(241, 1, 0, 1068.42, -1081.32, 27.5489, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Penn St, 4', 0, 0, 0, 0, 0, 0),
(242, 1, 0, 1117.92, -1021.17, 34.992, 2308.97, -1212.62, 1048.2, 0, 0, 6, 90000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Sunset Blvd, 3', 0, 0, 0, 0, 0, 0),
(243, 1, 0, 1128.14, -1021.17, 34.992, 2308.97, -1212.62, 1048.2, 0, 0, 6, 90000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Sunset Blvd, 4', 0, 0, 0, 0, 0, 0),
(244, 1, 0, 1196.48, -1017.03, 32.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 2', 0, 0, 0, 0, 0, 0),
(245, 1, 0, 1189.01, -1018.03, 32.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 1', 0, 0, 0, 0, 0, 0),
(246, 1, 0, 1195.68, -1010.88, 32.5531, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 4', 0, 0, 0, 0, 0, 0),
(247, 1, 0, 1188.19, -1011.89, 32.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 3', 0, 0, 0, 0, 0, 0),
(248, 1, 0, 1189.01, -1018.12, 36.2341, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 5', 0, 0, 0, 0, 0, 0),
(249, 1, 0, 1196.51, -1017.16, 36.2341, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 6', 0, 0, 0, 0, 0, 0),
(250, 1, 0, 1195.68, -1010.89, 36.2266, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1, 0, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 1676580430, 0, 0, 0, 0, 1, 2215, 'Cpx Sunset Blvd St, 8', 0, 0, 0, 0, 0, 0),
(251, 1, 74, 1188.19, -1011.9, 36.2266, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 0, 0, 'Caleb Frentosa', 'Vazio', 'Vazio', 0, '', 1675286254, 0, 0, 0, 0, 1, 1249, 'Cpx Sunset Blvd St, 7', 0, 0, 0, 0, 0, 0),
(252, 1, 0, 1234.73, -1016.11, 32.6066, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 10', 0, 0, 0, 0, 0, 0),
(253, 1, 0, 1227.25, -1017.17, 32.6015, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 9', 0, 0, 0, 0, 0, 0);
INSERT INTO `casas` (`hID`, `Criada`, `Dono`, `ExX`, `ExY`, `ExZ`, `InX`, `InY`, `InZ`, `ExWorld`, `ExInt`, `Int`, `Preco`, `Trancada`, `PlacaX`, `PlacaY`, `PlacaZ`, `PlacaR`, `AVenda`, `TelCont`, `Perm1`, `Perm2`, `Perm3`, `hBank`, `hXMR`, `hDia`, `hMes`, `hAno`, `hTipo`, `hAlarme`, `hInterruptor`, `hGasto`, `hEndereco`, `ExX2`, `ExY2`, `ExZ2`, `InX2`, `InY2`, `InZ2`) VALUES
(254, 1, 0, 1226.45, -1011.07, 32.6015, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 11', 0, 0, 0, 0, 0, 0),
(255, 1, 0, 1233.91, -1009.93, 32.6015, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 12', 0, 0, 0, 0, 0, 0),
(256, 1, 0, 1227.24, -1017.1, 36.3358, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 13', 0, 0, 0, 0, 0, 0),
(257, 1, 0, 1234.52, -1016.13, 36.3358, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 14', 0, 0, 0, 0, 0, 0),
(258, 1, 0, 1226.43, -1010.97, 36.3282, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 15', 0, 0, 0, 0, 0, 0),
(259, 1, 0, 1233.6, -1010.06, 36.3282, 2308.97, -1212.62, 1048.2, 0, 0, 6, 20000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx Sunset Blvd St, 16', 0, 0, 0, 0, 0, 0),
(260, 1, 0, 1382.7, -1343.39, 14.5797, 2308.97, -1212.62, 1048.2, 0, 0, 6, 50000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'St-Lawerence Blvd, 2', 0, 0, 0, 0, 0, 0),
(261, 1, 0, 227.917, -1405.41, 51.6091, 2308.97, -1212.62, 1048.2, 0, 0, 6, 190000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 3', 0, 0, 0, 0, 0, 0),
(263, 1, 0, 254.453, -1367.23, 53.1091, 2308.97, -1212.62, 1048.2, 0, 0, 6, 490000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 5', 0, 0, 0, 0, 0, 0),
(264, 1, 0, 298.873, -1338.48, 53.4415, 2308.97, -1212.62, 1048.2, 0, 0, 6, 450000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 6', 0, 0, 0, 0, 0, 0),
(265, 1, 0, 345.102, -1298.11, 50.7588, 2308.97, -1212.62, 1048.2, 0, 0, 6, 50000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr St, 4', 0, 0, 0, 0, 0, 0),
(266, 1, 0, 355.105, -1281.17, 53.7036, 2308.97, -1212.62, 1048.2, 0, 0, 6, 200000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 8', 0, 0, 0, 0, 0, 0),
(267, 1, 0, 398.2, -1271.35, 50.0195, 2308.97, -1212.62, 1048.2, 0, 0, 6, 290000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 9', 0, 0, 0, 0, 0, 0),
(268, 1, 0, 432.294, -1253.86, 51.5807, 2308.97, -1212.62, 1048.2, 0, 0, 6, 290000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 10', 0, 0, 0, 0, 0, 0),
(269, 1, 0, 552.945, -1200.28, 44.8315, 2308.97, -1212.62, 1048.2, 0, 0, 6, 300000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 11', 0, 0, 0, 0, 0, 0),
(270, 1, 0, 607.978, -1186.89, 41.7845, 2308.97, -1212.62, 1048.2, 0, 0, 6, 50000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr St, 9', 0, 0, 0, 0, 0, 0),
(272, 1, 0, 253.167, -1270.02, 74.4263, 2308.97, -1212.62, 1048.2, 0, 0, 6, 2900000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Belmont Dr, 2', 0, 0, 0, 0, 0, 0),
(273, 1, 0, 219.106, -1249.89, 78.3367, 2308.97, -1212.62, 1048.2, 0, 0, 6, 2700000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Belmont Dr, 1', 0, 0, 0, 0, 0, 0),
(274, 1, 0, 142.452, -1470.23, 25.2108, 2308.97, -1212.62, 1048.2, 0, 0, 6, 240000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 1', 0, 0, 0, 0, 0, 0),
(275, 1, 0, 153.291, -1449.48, 32.8446, 2308.97, -1212.62, 1048.2, 0, 0, 6, 290000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Providence Dr, 2', 0, 0, 0, 0, 0, 0),
(276, 1, 0, 559.269, -1076.33, 72.9216, 2308.97, -1212.62, 1048.2, 0, 0, 6, 250000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Belmont Dr, 7', 0, 0, 0, 0, 0, 0),
(277, 1, 0, 497.599, -1095.08, 82.3591, 2308.97, -1212.62, 1048.2, 0, 0, 6, 280000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Belmont Dr, 6', 0, 0, 0, 0, 0, 0),
(278, 1, 0, 416.555, -1153.99, 76.6875, 2308.97, -1212.62, 1048.2, 0, 0, 6, 280000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 1', 0, 0, 0, 0, 0, 0),
(279, 1, 0, 352.384, -1197.95, 76.5156, 2308.97, -1212.62, 1048.2, 0, 0, 6, 330000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 1674951708, 0, 0, 0, 0, 0, 0, 'Belmont Dr, 5', 0, 0, 0, 0, 0, 0),
(280, 1, 0, 251.497, -1220.17, 76.1023, 2308.97, -1212.62, 1048.2, 0, 0, 6, 3000000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Belmont Dr, 3', 0, 0, 0, 0, 0, 0),
(281, 1, 0, 300.125, -1154.34, 81.3877, 2308.97, -1212.62, 1048.2, 0, 0, 6, 3000000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Belmont Dr, 4', 0, 0, 0, 0, 0, 0),
(282, 1, 0, 470.835, -1163.54, 67.2179, 2308.97, -1212.62, 1048.2, 0, 0, 6, 200000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 2', 0, 0, 0, 0, 0, 0),
(283, 1, 0, 612.124, -1085.95, 58.8264, 2308.97, -1212.62, 1048.2, 0, 0, 6, 300000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 3', 0, 0, 0, 0, 0, 0),
(284, 1, 0, 648.692, -1058.26, 52.5797, 2308.97, -1212.62, 1048.2, 0, 0, 6, 190000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 4', 0, 0, 0, 0, 0, 0),
(285, 1, 0, 700.467, -1059.96, 49.4216, 2308.97, -1212.62, 1048.2, 0, 0, 6, 320000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 5', 0, 0, 0, 0, 0, 0),
(286, 1, 0, 725.084, -999.208, 52.7341, 2308.97, -1212.62, 1048.2, 0, 0, 6, 320000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 6', 0, 0, 0, 0, 0, 0),
(287, 1, 0, 827.917, -857.95, 70.3308, 2308.97, -1212.62, 1048.2, 0, 0, 6, 250000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 7', 0, 0, 0, 0, 0, 0),
(288, 1, 0, 874.476, -877.37, 77.8114, 2308.97, -1212.62, 1048.2, 0, 0, 6, 250000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 8', 0, 0, 0, 0, 0, 0),
(289, 1, 0, 924.016, -853.42, 93.4561, 2308.97, -1212.62, 1048.2, 0, 0, 6, 190000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 9', 0, 0, 0, 0, 0, 0),
(290, 1, 0, 938.088, -848.607, 93.5779, 2308.97, -1212.62, 1048.2, 0, 0, 6, 190000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 10', 0, 0, 0, 0, 0, 0),
(291, 1, 0, 989.795, -828.655, 95.4682, 2308.97, -1212.62, 1048.2, 0, 0, 6, 300000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 11', 0, 0, 0, 0, 0, 0),
(292, 1, 0, 1093.7, -807.164, 107.421, 2308.97, -1212.62, 1048.2, 0, 0, 6, 490000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 12', 0, 0, 0, 0, 0, 0),
(293, 1, 0, 1112.63, -741.871, 100.133, 2308.97, -1212.62, 1048.2, 0, 0, 6, 290000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 13', 0, 0, 0, 0, 0, 0),
(294, 1, 0, 1497.11, -687.91, 95.5633, 2308.97, -1212.62, 1048.2, 0, 0, 6, 3000000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 14', 0, 0, 0, 0, 0, 0),
(295, 1, 0, 1527.74, -772.508, 80.5781, 2308.97, -1212.62, 1048.2, 0, 0, 6, 150000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 15', 0, 0, 0, 0, 0, 0),
(296, 1, 0, 1535.01, -800.1, 72.8494, 2308.97, -1212.62, 1048.2, 0, 0, 6, 150000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 16', 0, 0, 0, 0, 0, 0),
(297, 1, 0, 1540.47, -850.969, 64.3358, 2308.97, -1212.62, 1048.2, 0, 0, 6, 190000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 17', 0, 0, 0, 0, 0, 0),
(298, 1, 0, 1535.71, -885.237, 57.6571, 2308.97, -1212.62, 1048.2, 0, 0, 6, 250000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 18', 0, 0, 0, 0, 0, 0),
(299, 1, 0, 1468.8, -906.163, 54.8358, 2308.97, -1212.62, 1048.2, 0, 0, 6, 250000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 19', 0, 0, 0, 0, 0, 0),
(300, 1, 0, 1421.76, -886.22, 50.6859, 2308.97, -1212.62, 1048.2, 0, 0, 6, 250000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Rich St, 20', 0, 0, 0, 0, 0, 0),
(301, 1, 0, 785.753, -828.618, 70.2891, 2308.97, -1212.62, 1048.2, 0, 0, 6, 300000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Handerson St, 1', 0, 0, 0, 0, 0, 0),
(302, 1, 0, 808.177, -759.078, 76.5313, 2308.97, -1212.62, 1048.2, 0, 0, 6, 300000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Handerson St, 2', 0, 0, 0, 0, 0, 0),
(303, 1, 0, 891.029, -783.219, 101.313, 2308.97, -1212.62, 1048.2, 0, 0, 6, 390000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Handerson St, 3', 0, 0, 0, 0, 0, 0),
(304, 1, 0, 977.488, -771.71, 112.203, 2308.97, -1212.62, 1048.2, 0, 0, 6, 390000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Handerson St, 4', 0, 0, 0, 0, 0, 0),
(305, 1, 0, 1016.79, -763.362, 112.563, 2308.97, -1212.62, 1048.2, 0, 0, 6, 300000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Handerson St, 5', 0, 0, 0, 0, 0, 0),
(306, 1, 0, 867.488, -717.573, 105.68, 2308.97, -1212.62, 1048.2, 0, 0, 6, 300000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Palin St, 1', 0, 0, 0, 0, 0, 0),
(307, 1, 0, 898.16, -677.138, 116.89, 2308.97, -1212.62, 1048.2, 0, 0, 6, 300000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Palin St, 2', 0, 0, 0, 0, 0, 0),
(308, 1, 0, 946.527, -710.569, 122.62, 2308.97, -1212.62, 1048.2, 0, 0, 6, 220000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Palin St, 3', 0, 0, 0, 0, 0, 0),
(309, 1, 0, 980.346, -677.339, 121.976, 2308.97, -1212.62, 1048.2, 0, 0, 6, 3000000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Palin St, 4', 0, 0, 0, 0, 0, 0),
(310, 1, 0, 1045.23, -642.927, 120.117, 2308.97, -1212.62, 1048.2, 0, 0, 6, 390000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Palin St, 5', 0, 0, 0, 0, 0, 0),
(311, 1, 0, 1095.03, -647.899, 113.648, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1000000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Palin St, 6', 0, 0, 0, 0, 0, 0),
(312, 1, 0, 1332.11, -633.492, 109.135, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1500000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Palin St, 7', 0, 0, 0, 0, 0, 0),
(313, 1, 0, 836.123, -894.967, 68.7686, 2308.97, -1212.62, 1048.2, 0, 0, 6, 390000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'State St, 1', 0, 0, 0, 0, 0, 0),
(314, 1, 0, 653.592, -1713.84, 14.7644, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Western Ave, 1', 0, 0, 0, 0, 0, 0),
(315, 1, 0, 652.66, -1694.1, 14.5509, 2308.97, -1212.62, 1048.2, 0, 0, 6, 40000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Western Ave, 2', 0, 0, 0, 0, 0, 0),
(316, 1, 0, 657.225, -1652.37, 15.4062, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Western Ave, 3', 0, 0, 0, 0, 0, 0),
(317, 1, 0, 656.302, -1635.87, 15.8617, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Western Ave, 4', 0, 0, 0, 0, 0, 0),
(318, 1, 0, 653.24, -1620.17, 15, 2308.97, -1212.62, 1048.2, 0, 0, 6, 40000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Western Ave, 5', 0, 0, 0, 0, 0, 0),
(319, 1, 0, 648.851, -1536.79, 14.9342, 2308.97, -1212.62, 1048.2, 0, 0, 6, 50000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Western Ave, 6', 0, 0, 0, 0, 0, 0),
(320, 1, 0, 648.852, -1489.74, 14.8416, 2308.97, -1212.62, 1048.2, 0, 0, 6, 50000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Western Ave, 7', 0, 0, 0, 0, 0, 0),
(321, 1, 0, 648.84, -1442.21, 14.7236, 2308.97, -1212.62, 1048.2, 0, 0, 6, 50000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Western Ave, 8', 0, 0, 0, 0, 0, 0),
(322, 1, 0, 660.752, -1599.85, 15, 2308.97, -1212.62, 1048.2, 0, 0, 6, 40000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Olympic St, 1', 0, 0, 0, 0, 0, 0),
(323, 1, 0, 692.792, -1602.77, 15.0466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 35000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Olympic St, 2', 0, 0, 0, 0, 0, 0),
(324, 1, 0, 761.078, -1564.02, 13.9287, 2308.97, -1212.62, 1048.2, 0, 0, 6, 70000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 6', 0, 0, 0, 0, 0, 0),
(325, 1, 0, 771.193, -1510.49, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 100000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 7', 0, 0, 0, 0, 0, 0),
(326, 1, 0, 782.79, -1464.65, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 120000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 8', 0, 0, 0, 0, 0, 0),
(327, 1, 0, 822.112, -1505.5, 14.3984, 2308.97, -1212.62, 1048.2, 0, 0, 6, 90000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 9', 0, 0, 0, 0, 0, 0),
(328, 1, 0, 841.074, -1471.36, 14.3069, 2308.97, -1212.62, 1048.2, 0, 0, 6, 90000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 10', 0, 0, 0, 0, 0, 0),
(329, 1, 0, 813.668, -1457.01, 14.236, 2308.97, -1212.62, 1048.2, 0, 0, 6, 100000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 11', 0, 0, 0, 0, 0, 0),
(330, 1, 0, 784.4, -1436.01, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 70000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Giggles St, 12', 0, 0, 0, 0, 0, 0),
(331, 1, 0, 903.776, -1513.41, 14.3626, 2308.97, -1212.62, 1048.2, 0, 0, 6, 95000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 1', 0, 0, 0, 0, 0, 0),
(332, 1, 0, 849.611, -1519.62, 14.3486, 2308.97, -1212.62, 1048.2, 0, 0, 6, 95000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 2', 0, 0, 0, 0, 0, 0),
(333, 1, 0, 900.512, -1471.22, 14.3464, 2308.97, -1212.62, 1048.2, 0, 0, 6, 95000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 3', 0, 0, 0, 0, 0, 0),
(334, 1, 0, 900.666, -1447.33, 14.3675, 2308.97, -1212.62, 1048.2, 0, 0, 6, 95000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 4', 0, 0, 0, 0, 0, 0),
(335, 1, 0, 936.357, -1612.72, 14.9376, 2308.97, -1212.62, 1048.2, 0, 0, 6, 100000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 5', 0, 0, 0, 0, 0, 0),
(336, 1, 0, 964.299, -1612.61, 14.9411, 2308.97, -1212.62, 1048.2, 0, 0, 6, 100000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 6', 0, 0, 0, 0, 0, 0),
(337, 1, 0, 987.487, -1623.82, 14.9294, 2308.97, -1212.62, 1048.2, 0, 0, 6, 100000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 7', 0, 0, 0, 0, 0, 0),
(338, 1, 0, 987.483, -1704.56, 14.9294, 2308.97, -1212.62, 1048.2, 0, 0, 6, 100000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 8', 0, 0, 0, 0, 0, 0),
(339, 1, 0, 893.685, -1635.7, 14.9294, 2308.97, -1212.62, 1048.2, 0, 0, 6, 95000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 9', 0, 0, 0, 0, 0, 0),
(340, 1, 0, 865.459, -1633.85, 14.9294, 2308.97, -1212.62, 1048.2, 0, 0, 6, 95000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 10', 0, 0, 0, 0, 0, 0),
(341, 1, 0, 850.667, -1686.12, 14.9378, 2308.97, -1212.62, 1048.2, 0, 0, 6, 95000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 11', 0, 0, 0, 0, 0, 0),
(342, 1, 0, 846.74, -1716.93, 14.9294, 2308.97, -1212.62, 1048.2, 0, 0, 6, 95000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Liberty Ave, 12', 0, 0, 0, 0, 0, 0),
(343, 1, 0, 866.862, -1798.95, 13.8156, 2308.97, -1212.62, 1048.2, 0, 0, 6, 82000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 1', 0, 0, 0, 0, 0, 0),
(344, 1, 0, 883.261, -1800.39, 13.8002, 2308.97, -1212.62, 1048.2, 0, 0, 6, 82000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 2', 0, 0, 0, 0, 0, 0),
(345, 1, 0, 910.268, -1802.68, 13.7995, 2308.97, -1212.62, 1048.2, 0, 0, 6, 78000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 3', 0, 0, 0, 0, 0, 0),
(346, 1, 0, 921.752, -1803.85, 13.8373, 2308.97, -1212.62, 1048.2, 0, 0, 6, 78000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 4', 0, 0, 0, 0, 0, 0),
(347, 1, 0, 934.003, -1805.23, 13.843, 2308.97, -1212.62, 1048.2, 0, 0, 6, 78000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 5', 0, 0, 0, 0, 0, 0),
(348, 1, 0, 957.914, -1809.13, 13.8809, 2308.97, -1212.62, 1048.2, 0, 0, 6, 78000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 6', 0, 0, 0, 0, 0, 0),
(349, 1, 0, 969.516, -1811.81, 13.9033, 2308.97, -1212.62, 1048.2, 0, 0, 6, 78000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 7', 0, 0, 0, 0, 0, 0),
(350, 1, 0, 981.03, -1814.64, 13.909, 2308.97, -1212.62, 1048.2, 0, 0, 6, 78000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 8', 0, 0, 0, 0, 0, 0),
(351, 1, 0, 992.418, -1817.23, 13.9252, 2308.97, -1212.62, 1048.2, 0, 0, 6, 78000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Los Santos Expwy, 9', 0, 0, 0, 0, 0, 0),
(352, 1, 0, 1252.87, -901.79, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 1', 0, 0, 0, 0, 0, 0),
(353, 1, 0, 1253.69, -907.958, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 2', 0, 0, 0, 0, 0, 0),
(354, 1, 0, 1246.2, -908.888, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 3', 0, 0, 0, 0, 0, 0),
(355, 1, 0, 1245.37, -902.601, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 4', 0, 0, 0, 0, 0, 0),
(356, 1, 0, 1252.8, -901.873, 46.5937, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 5', 0, 0, 0, 0, 0, 0),
(357, 1, 0, 1253.72, -908.174, 46.6015, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 6', 0, 0, 0, 0, 0, 0),
(358, 1, 0, 1246.21, -909.01, 46.6015, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 7', 0, 0, 0, 0, 0, 0),
(359, 1, 0, 1245.41, -902.824, 46.5937, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 8', 0, 0, 0, 0, 0, 0),
(360, 1, 0, 1242.14, -878.377, 42.8753, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 9', 0, 0, 0, 0, 0, 0),
(361, 1, 0, 1249.62, -877.374, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 10', 0, 0, 0, 0, 0, 0),
(362, 1, 0, 1248.77, -871.077, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 11', 0, 0, 0, 0, 0, 0),
(363, 1, 0, 1241.32, -872.172, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 12', 0, 0, 0, 0, 0, 0),
(364, 1, 0, 1248.8, -871.208, 46.6329, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 13', 0, 0, 0, 0, 0, 0),
(365, 1, 0, 1241.32, -872.136, 46.6329, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 14', 0, 0, 0, 0, 0, 0),
(366, 1, 0, 1242.11, -878.151, 46.6403, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 15', 0, 0, 0, 0, 0, 0),
(367, 1, 0, 1249.6, -877.262, 46.6403, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 16', 0, 0, 0, 0, 0, 0),
(368, 1, 0, 1290.94, -896.868, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 17', 0, 0, 0, 0, 0, 0),
(369, 1, 0, 1283.51, -897.611, 42.8753, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 18', 0, 0, 0, 0, 0, 0),
(370, 1, 0, 1291.58, -903.052, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 19', 0, 0, 0, 0, 0, 0),
(371, 1, 0, 1284.36, -904.125, 42.8828, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 20', 0, 0, 0, 0, 0, 0),
(372, 1, 0, 1291.01, -896.746, 46.625, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 21', 0, 0, 0, 0, 0, 0),
(373, 1, 0, 1283.55, -897.935, 46.625, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 22', 0, 0, 0, 0, 0, 0),
(374, 1, 0, 1291.82, -902.993, 46.6328, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 23', 0, 0, 0, 0, 0, 0),
(375, 1, 0, 1284.37, -904.167, 46.6328, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 24', 0, 0, 0, 0, 0, 0),
(376, 1, 0, 1280.88, -874.991, 42.9398, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 25', 0, 0, 0, 0, 0, 0),
(377, 1, 0, 1288.13, -874.146, 43.0591, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 26', 0, 0, 0, 0, 0, 0),
(378, 1, 0, 1280.04, -868.564, 42.9225, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 27', 0, 0, 0, 0, 0, 0),
(379, 1, 0, 1287.35, -867.515, 43.1431, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 28', 0, 0, 0, 0, 0, 0),
(380, 1, 0, 1287.16, -868.116, 46.8358, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 29', 0, 0, 0, 0, 0, 0),
(381, 1, 0, 1280.02, -868.488, 46.8358, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 30', 0, 0, 0, 0, 0, 0),
(382, 1, 0, 1288.35, -873.917, 46.8437, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 31', 0, 0, 0, 0, 0, 0),
(383, 1, 0, 1280.84, -874.713, 46.8437, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Cpx. W. Broadway, 32', 0, 0, 0, 0, 0, 0),
(384, 1, 0, 1411.17, -920.877, 38.4216, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'W. Broadway, 33', 0, 0, 0, 0, 0, 0),
(385, 1, 0, 1440.63, -926.135, 39.6473, 2308.97, -1212.62, 1048.2, 0, 0, 6, 85000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'W. Broadway, 34', 0, 0, 0, 0, 0, 0),
(386, 1, 0, 1377.5, -1328.29, 13.7538, 2308.97, -1212.62, 1048.2, 0, 0, 6, 50000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'St-Lawerence Blvd, 1', 0, 0, 0, 0, 0, 0),
(387, 1, 0, 2264.36, -1499.33, 21.9577, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 1', 0, 0, 0, 0, 0, 0),
(388, 1, 0, 2262.91, -1503.22, 21.7842, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 2', 0, 0, 0, 0, 0, 0),
(389, 1, 0, 2260.74, -1506.02, 21.6576, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 3', 0, 0, 0, 0, 0, 0),
(390, 1, 0, 2258.45, -1510.94, 21.4493, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 4', 0, 0, 0, 0, 0, 0),
(391, 1, 0, 2256.98, -1519.7, 20.8062, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 5', 0, 0, 0, 0, 0, 0),
(392, 1, 0, 2255.15, -1524.33, 20.4249, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 6', 0, 0, 0, 0, 0, 0),
(393, 1, 0, 2253.76, -1528.06, 20.1511, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 7', 0, 0, 0, 0, 0, 0),
(394, 1, 0, 2251.9, -1533.3, 19.9887, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 8', 0, 0, 0, 0, 0, 0),
(395, 1, 0, 2250.61, -1536.8, 19.9172, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 9', 0, 0, 0, 0, 0, 0),
(396, 1, 0, 2259.35, -1540.7, 19.8159, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 10', 0, 0, 0, 0, 0, 0),
(397, 1, 0, 2261.11, -1537.36, 19.9379, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 11', 0, 0, 0, 0, 0, 0),
(398, 1, 0, 2263.86, -1533.29, 21.3428, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 12', 0, 0, 0, 0, 0, 0),
(399, 1, 0, 2266.02, -1524.86, 20.6595, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 13', 0, 0, 0, 0, 0, 0),
(400, 1, 0, 2269.66, -1516.16, 21.1403, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 14', 0, 0, 0, 0, 0, 0),
(401, 1, 0, 2271.29, -1511.08, 21.374, 2308.97, -1212.62, 1048.2, 0, 0, 6, 13000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Howard Blvd Line, 15', 0, 0, 0, 0, 0, 0),
(402, 1, 0, 2540.66, -957.51, 82.1716, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1, 1, 0, 0, 0, 0, 1, 0, 'Virgulino Moraes', 'Gabriel Pacheco', 'Vazio', 0, '', 1675204589, 0, 0, 0, 0, 1, 963, 'R. Catiri 02', 0, 0, 0, 0, 0, 0),
(403, 1, 48, 1714.47, -2102.9, 15.8275, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1, 1, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 1675712139, 0, 0, 0, 0, 1, 3538, 'R. Corona, 23', 0, 0, 0, 0, 0, 0),
(404, 1, 0, 673.066, -1020.26, 55.7596, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1, 1, 0, 0, 0, 0, 1, 0, 'Rodrigo Severino', 'Vazio', 'Vazio', 0, '', 1675549317, 0, 0, 0, 0, 1, 3391, 'Richman, 157', 0, 0, 0, 0, 0, 0),
(405, 1, 0, 1851.8, -2070.45, 15.4812, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 1', 0, 0, 0, 0, 0, 0),
(406, 1, 55, 1159.57, -1948.31, 49.3288, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1, 1, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0),
(407, 1, 0, 1871.84, -2028.99, 13.5543, 2308.97, -1212.62, 1048.2, 0, 0, 6, 1, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 1675272305, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0),
(408, 1, 0, 1873.43, -2070.75, 15.4968, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 2', 0, 0, 0, 0, 0, 0),
(409, 1, 0, 1895.51, -2068.91, 15.6688, 2308.97, -1212.62, 1048.2, 0, 0, 6, 30000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 3', 0, 0, 0, 0, 0, 0),
(410, 1, 0, 1919.82, -2042.01, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 4', 0, 0, 0, 0, 0, 0),
(411, 1, 0, 1915.63, -2041.44, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 5', 0, 0, 0, 0, 0, 0),
(412, 1, 0, 1908.55, -2042.3, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 6', 0, 0, 0, 0, 0, 0),
(413, 1, 0, 1900.49, -2036.83, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 7', 0, 0, 0, 0, 0, 0),
(414, 1, 0, 1893.04, -2031, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 8', 0, 0, 0, 0, 0, 0),
(415, 1, 0, 1893.76, -2025.24, 13.6988, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 9', 0, 0, 0, 0, 0, 0),
(416, 1, 0, 1899.94, -2032.2, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 10', 0, 0, 0, 0, 0, 0),
(417, 1, 0, 1910.84, -2034.82, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 11', 0, 0, 0, 0, 0, 0),
(418, 1, 0, 1872.43, -2035.23, 13.6183, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 12', 0, 0, 0, 0, 0, 0),
(419, 1, 0, 1921.17, -2031.34, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 13', 0, 0, 0, 0, 0, 0),
(420, 1, 0, 1921.77, -2024.05, 13.6141, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 14', 0, 0, 0, 0, 0, 0),
(421, 1, 0, 1908.72, -2023.95, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 15', 0, 0, 0, 0, 0, 0),
(422, 1, 0, 1914.03, -2025.4, 14.0615, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 16', 0, 0, 0, 0, 0, 0),
(423, 1, 0, 1892.26, -2010.96, 13.6583, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 17', 0, 0, 0, 0, 0, 0),
(424, 1, 0, 1884.49, -2011.52, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 78', 0, 0, 0, 0, 0, 0),
(425, 1, 0, 1893.57, -2001.52, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 19', 0, 0, 0, 0, 0, 0),
(426, 1, 0, 1899.1, -2001.6, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 20', 0, 0, 0, 0, 0, 0),
(427, 1, 0, 1907.39, -2002.2, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 21', 0, 0, 0, 0, 0, 0),
(428, 1, 0, 1921.83, -1995.28, 13.5543, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 22', 0, 0, 0, 0, 0, 0),
(429, 1, 0, 1907.86, -1991.15, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 23', 0, 0, 0, 0, 0, 0),
(430, 1, 0, 1913.44, -1990.47, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 24', 0, 0, 0, 0, 0, 0),
(431, 1, 0, 1915.14, -1989.32, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 25', 0, 0, 0, 0, 0, 0),
(432, 1, 0, 1906.18, -1986.63, 13.6988, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 26', 0, 0, 0, 0, 0, 0),
(433, 1, 0, 1911.05, -1982.12, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 27', 0, 0, 0, 0, 0, 0),
(434, 1, 0, 1913.17, -1976.38, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 28', 0, 0, 0, 0, 0, 0),
(435, 1, 0, 1904.47, -1976.54, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 29', 0, 0, 0, 0, 0, 0),
(436, 1, 0, 1889.2, -1978.42, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 30', 0, 0, 0, 0, 0, 0),
(437, 1, 0, 1884.59, -1977.81, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 31', 0, 0, 0, 0, 0, 0),
(438, 1, 0, 1858.03, -1978.53, 13.7285, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 32', 0, 0, 0, 0, 0, 0),
(439, 1, 0, 1844.41, -1975.36, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 33', 0, 0, 0, 0, 0, 0),
(440, 1, 0, 1827.49, -1977.3, 14.5087, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 34', 0, 0, 0, 0, 0, 0),
(441, 1, 0, 1821.9, -1975.54, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 35', 0, 0, 0, 0, 0, 0),
(442, 1, 0, 1810.03, -1976.85, 13.5543, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 36', 0, 0, 0, 0, 0, 0),
(443, 1, 0, 1811.7, -1981.49, 13.6583, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 37', 0, 0, 0, 0, 0, 0),
(444, 1, 0, 1811.17, -1994.81, 13.8599, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 38', 0, 0, 0, 0, 0, 0),
(445, 1, 0, 1811.88, -2002.1, 13.5502, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 39', 0, 0, 0, 0, 0, 0),
(446, 1, 0, 1800.99, -2013.37, 13.5242, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 40', 0, 0, 0, 0, 0, 0),
(447, 1, 0, 1792.52, -2012.49, 13.4947, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 41', 0, 0, 0, 0, 0, 0),
(448, 1, 0, 1787.74, -1973.64, 13.5401, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 42', 0, 0, 0, 0, 0, 0),
(449, 1, 0, 1822.04, -1984.84, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 43', 0, 0, 0, 0, 0, 0),
(450, 1, 0, 1820.56, -1985.97, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 44', 0, 0, 0, 0, 0, 0),
(451, 1, 0, 1817.35, -1996.24, 13.5543, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 45', 0, 0, 0, 0, 0, 0),
(452, 1, 0, 1815.59, -2007.8, 13.5543, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 46', 0, 0, 0, 0, 0, 0),
(453, 1, 0, 1828.5, -2007.87, 13.5543, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 47', 0, 0, 0, 0, 0, 0),
(454, 1, 0, 1832.54, -2002.34, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 48', 0, 0, 0, 0, 0, 0),
(455, 1, 0, 1835.76, -1995.77, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 49', 0, 0, 0, 0, 0, 0),
(456, 1, 0, 1836.96, -1998.27, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 50', 0, 0, 0, 0, 0, 0),
(457, 1, 0, 1837.59, -2002.48, 13.6142, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 51', 0, 0, 0, 0, 0, 0),
(458, 1, 0, 1845.02, -2008.84, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 52', 0, 0, 0, 0, 0, 0),
(459, 1, 0, 1843.17, -2019.72, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 53', 0, 0, 0, 0, 0, 0),
(460, 1, 0, 1844.17, -2024.73, 14.5087, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 54', 0, 0, 0, 0, 0, 0),
(461, 1, 0, 1851.52, -2024.89, 14.7447, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 55', 0, 0, 0, 0, 0, 0),
(462, 1, 0, 1852.04, -2020.95, 13.8662, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 56', 0, 0, 0, 0, 0, 0),
(463, 1, 0, 1858.75, -2016.41, 14.1981, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 57', 0, 0, 0, 0, 0, 0),
(464, 1, 0, 1858.95, -2018.5, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 58', 0, 0, 0, 0, 0, 0),
(465, 1, 0, 1862.93, -2025.77, 13.7334, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 59', 0, 0, 0, 0, 0, 0),
(466, 1, 0, 1870.35, -2041.82, 13.711, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 60', 0, 0, 0, 0, 0, 0),
(467, 1, 0, 1858.12, -2041.9, 13.711, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 61', 0, 0, 0, 0, 0, 0),
(468, 1, 0, 1854.94, -2041.88, 14.0616, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 62', 0, 0, 0, 0, 0, 0),
(469, 1, 0, 1845.87, -2037.93, 16.9312, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 63', 0, 0, 0, 0, 0, 0),
(470, 1, 0, 1848.91, -2036.75, 16.9235, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 64', 0, 0, 0, 0, 0, 0),
(471, 1, 0, 1840.65, -2038.19, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 65', 0, 0, 0, 0, 0, 0),
(472, 1, 0, 1832.37, -2040.72, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 66', 0, 0, 0, 0, 0, 0),
(473, 1, 0, 1832.61, -2036.4, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 67', 0, 0, 0, 0, 0, 0),
(474, 1, 0, 1832.52, -2032.2, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 68', 0, 0, 0, 0, 0, 0),
(475, 1, 0, 1832.61, -2028.26, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 69', 0, 0, 0, 0, 0, 0),
(476, 1, 0, 1831.92, -2024.89, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 70', 0, 0, 0, 0, 0, 0),
(477, 1, 0, 1832.66, -2016.62, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 71', 0, 0, 0, 0, 0, 0),
(478, 1, 0, 1832.35, -2014.13, 13.5467, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 72', 0, 0, 0, 0, 0, 0),
(479, 1, 0, 1827.41, -2012.54, 13.7729, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 73', 0, 0, 0, 0, 0, 0),
(480, 1, 0, 1821.63, -2013.28, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 74', 0, 0, 0, 0, 0, 0),
(481, 1, 0, 1851.84, -2036.08, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 75', 0, 0, 0, 0, 0, 0),
(482, 1, 0, 1873.64, -2018.43, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 76', 0, 0, 0, 0, 0, 0),
(483, 1, 0, 1873.79, -2010.61, 13.6583, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 77', 0, 0, 0, 0, 0, 0),
(484, 1, 0, 1884.49, -2011.82, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0),
(485, 1, 0, 1880.03, -2008.44, 13.571, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 79', 0, 0, 0, 0, 0, 0),
(486, 1, 0, 1870.92, -2009.48, 15.3788, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 80', 0, 0, 0, 0, 0, 0),
(487, 1, 0, 1879.09, -2001.31, 16.4209, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 81', 0, 0, 0, 0, 0, 0),
(488, 1, 0, 1866.41, -2001.14, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 82', 0, 0, 0, 0, 0, 0),
(489, 1, 0, 1864.3, -1988.7, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 83', 0, 0, 0, 0, 0, 0),
(490, 1, 0, 1861.98, -1985.75, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 84', 0, 0, 0, 0, 0, 0),
(491, 1, 0, 1853.08, -1986.49, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 85', 0, 0, 0, 0, 0, 0),
(492, 1, 0, 1850.29, -1987.68, 13.5466, 2308.97, -1212.62, 1048.2, 0, 0, 6, 10000, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 0, 0, 0, 0, 'Aces St, 86', 0, 0, 0, 0, 0, 0),
(493, 1, 0, 2851.85, -1365.92, 14.1708, 2308.97, -1212.62, 1048.2, 0, 0, 6, 900000, 0, 2853.52, -1365.06, 13.1107, 0, 1, 23543, 'Vazio', 'Vazio', 'Vazio', 0, '', 1676580430, NULL, NULL, 0, 0, 0, 0, 'Teste, 134', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `casas_pc`
--

CREATE TABLE `casas_pc` (
  `hID` int(11) NOT NULL,
  `Criada` int(11) NOT NULL,
  `Dono` int(11) NOT NULL,
  `ExX` float NOT NULL,
  `ExY` float NOT NULL,
  `ExZ` float NOT NULL,
  `InX` float NOT NULL,
  `InY` float NOT NULL,
  `InZ` float NOT NULL,
  `ExWorld` int(11) NOT NULL,
  `ExInt` int(11) NOT NULL,
  `Int` int(11) NOT NULL,
  `Preco` int(11) NOT NULL,
  `Trancada` int(11) NOT NULL,
  `PlacaX` float NOT NULL,
  `PlacaY` float NOT NULL,
  `PlacaZ` float NOT NULL,
  `PlacaR` float NOT NULL,
  `AVenda` int(11) NOT NULL,
  `TelCont` int(11) NOT NULL,
  `Perm1` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `Perm2` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `Perm3` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `hBank` int(11) NOT NULL,
  `hXMR` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `hDia` int(11) NOT NULL,
  `hMes` int(11) NOT NULL,
  `hAno` int(11) NOT NULL,
  `hTipo` int(11) NOT NULL,
  `hAlarme` int(11) NOT NULL,
  `hInterruptor` int(11) NOT NULL,
  `hGasto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `complexos`
--

CREATE TABLE `complexos` (
  `cID` int(11) NOT NULL,
  `Criada` int(11) DEFAULT NULL,
  `Dono` int(11) DEFAULT NULL,
  `Nome` varchar(64) DEFAULT NULL,
  `ExX` float DEFAULT NULL,
  `ExY` float DEFAULT NULL,
  `ExZ` float DEFAULT NULL,
  `InX` float DEFAULT NULL,
  `InY` float DEFAULT NULL,
  `InZ` float DEFAULT NULL,
  `Int` int(11) DEFAULT NULL,
  `Preco` int(11) DEFAULT NULL,
  `Trancada` int(11) DEFAULT NULL,
  `PlacaX` float DEFAULT NULL,
  `PlacaY` float DEFAULT NULL,
  `PlacaZ` float DEFAULT NULL,
  `PlacaR` float DEFAULT NULL,
  `AVenda` int(11) DEFAULT NULL,
  `TelCont` int(11) DEFAULT NULL,
  `ExX2` float DEFAULT NULL,
  `ExY2` float DEFAULT NULL,
  `ExZ2` float DEFAULT NULL,
  `InX2` float DEFAULT NULL,
  `InY2` float DEFAULT NULL,
  `InZ2` float DEFAULT NULL,
  `cPerm1` varchar(24) DEFAULT NULL,
  `cPerm2` varchar(24) DEFAULT NULL,
  `cPerm3` varchar(24) DEFAULT NULL,
  `cXMR` varchar(256) DEFAULT NULL,
  `complexIcone` int(11) DEFAULT NULL,
  `complexTipo` int(11) DEFAULT NULL,
  `ExX3` float DEFAULT NULL,
  `ExY3` float DEFAULT NULL,
  `ExZ3` float DEFAULT NULL,
  `InX3` float DEFAULT NULL,
  `InY3` float DEFAULT NULL,
  `InZ3` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `complexos`
--

INSERT INTO `complexos` (`cID`, `Criada`, `Dono`, `Nome`, `ExX`, `ExY`, `ExZ`, `InX`, `InY`, `InZ`, `Int`, `Preco`, `Trancada`, `PlacaX`, `PlacaY`, `PlacaZ`, `PlacaR`, `AVenda`, `TelCont`, `ExX2`, `ExY2`, `ExZ2`, `InX2`, `InY2`, `InZ2`, `cPerm1`, `cPerm2`, `cPerm3`, `cXMR`, `complexIcone`, `complexTipo`, `ExX3`, `ExY3`, `ExZ3`, `InX3`, `InY3`, `InZ3`) VALUES
(1, 1, 1, '', 1480.53, -1772.16, 18.7957, -501.076, 286.104, 2001.09, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', '', 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 2, '', 1149.15, -1931.48, 43.5724, 2562.45, -1670.47, 1002.9, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', '', 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 1, '', -101.155, -270.51, 1.2874, 1795.26, -1578, 539.103, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', '', 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 37, '', 959.498, -1436.99, 13.5545, -616.997, 34.2565, -16.3115, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', '', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatoscel`
--

CREATE TABLE `contatoscel` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(24) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `dono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contatoscel`
--

INSERT INTO `contatoscel` (`id`, `nome`, `numero`, `dono`) VALUES
(0, '', 0, 1),
(1, '', 0, 1),
(2, '', 0, 1),
(3, '', 0, 1),
(4, '', 0, 1),
(5, '', 0, 1),
(6, '', 0, 1),
(7, '', 0, 1),
(8, '', 0, 1),
(9, '', 0, 1),
(10, '', 0, 1),
(11, '', 0, 1),
(12, '', 0, 1),
(13, '', 0, 1),
(14, '', 0, 1),
(15, '', 0, 1),
(16, '', 0, 1),
(17, '', 0, 1),
(18, '', 0, 1),
(19, '', 0, 1),
(20, '', 0, 1),
(21, '', 0, 1),
(22, '', 0, 1),
(23, '', 0, 1),
(24, '', 0, 1),
(25, 'Contato_26', NULL, 1),
(26, 'Contato_27', NULL, 1),
(27, 'Contato_28', NULL, 1),
(28, 'Contato_29', NULL, 1),
(29, 'Contato_30', NULL, 1),
(30, 'Contato_31', NULL, 1),
(31, 'Contato_32', NULL, 1),
(32, 'Contato_33', NULL, 1),
(33, 'Contato_34', NULL, 1),
(34, 'Contato_35', NULL, 1),
(35, 'Contato_36', NULL, 1),
(36, 'Contato_37', NULL, 1),
(37, 'Contato_38', NULL, 1),
(38, 'Contato_39', NULL, 1),
(39, 'Contato_40', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `crimes`
--

CREATE TABLE `crimes` (
  `CriID` int(11) NOT NULL,
  `CriOwn` int(11) DEFAULT NULL,
  `CriOwnN` varchar(24) DEFAULT NULL,
  `CriData` varchar(32) DEFAULT NULL,
  `CriCrime` varchar(64) DEFAULT NULL,
  `CriPena` varchar(64) DEFAULT NULL,
  `CrimeRelat` varchar(256) DEFAULT NULL,
  `CriOutrInfo` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `crimes`
--

INSERT INTO `crimes` (`CriID`, `CriOwn`, `CriOwnN`, `CriData`, `CriCrime`, `CriPena`, `CrimeRelat`, `CriOutrInfo`) VALUES
(1, 0, 'Hubert_Alves', '07/05/2023, 19:28', '157', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `drogas`
--

CREATE TABLE `drogas` (
  `Name` varchar(24) DEFAULT NULL,
  `MaconhaR` int(11) DEFAULT NULL,
  `MaconhaB` int(11) DEFAULT NULL,
  `MaconhaE` int(11) DEFAULT NULL,
  `CocaR` int(11) DEFAULT NULL,
  `CocaB` int(11) DEFAULT NULL,
  `CocaE` int(11) DEFAULT NULL,
  `CrackR` int(11) DEFAULT NULL,
  `CrackB` int(11) DEFAULT NULL,
  `CrackE` int(11) DEFAULT NULL,
  `LSDR` int(11) DEFAULT NULL,
  `LSDB` int(11) DEFAULT NULL,
  `LSDE` int(11) DEFAULT NULL,
  `MetR` int(11) DEFAULT NULL,
  `MetB` int(11) DEFAULT NULL,
  `MetE` int(11) DEFAULT NULL,
  `Sementes` int(11) DEFAULT NULL,
  `BDS` int(11) DEFAULT NULL,
  `PBC` int(11) DEFAULT NULL,
  `Pseudoefedrina` int(11) DEFAULT NULL,
  `Acloridrico` int(11) DEFAULT NULL,
  `Efedrina` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `IDp` int(11) DEFAULT NULL,
  `LancaPer` int(11) DEFAULT NULL,
  `lidococa` int(11) DEFAULT NULL,
  `benzococa` int(11) DEFAULT NULL,
  `hidroxina` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `drogas`
--

INSERT INTO `drogas` (`Name`, `MaconhaR`, `MaconhaB`, `MaconhaE`, `CocaR`, `CocaB`, `CocaE`, `CrackR`, `CrackB`, `CrackE`, `LSDR`, `LSDB`, `LSDE`, `MetR`, `MetB`, `MetE`, `Sementes`, `BDS`, `PBC`, `Pseudoefedrina`, `Acloridrico`, `Efedrina`, `id`, `IDp`, `LancaPer`, `lidococa`, `benzococa`, `hidroxina`) VALUES
('Hubert_Alves', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `droparmas`
--

CREATE TABLE `droparmas` (
  `ArmaID` int(11) NOT NULL,
  `Com` int(11) DEFAULT NULL,
  `CompradaPor` varchar(24) DEFAULT NULL,
  `CompradaData` varchar(32) DEFAULT NULL,
  `Numeracao` int(11) DEFAULT NULL,
  `Modelo` int(11) DEFAULT NULL,
  `Ammo` int(11) DEFAULT NULL,
  `Cor` int(11) DEFAULT NULL,
  `NoChao` int(11) DEFAULT NULL,
  `ArmaX` float DEFAULT NULL,
  `ArmaY` float DEFAULT NULL,
  `ArmaZ` float DEFAULT NULL,
  `ArmaRX` float DEFAULT NULL,
  `ArmaRY` float DEFAULT NULL,
  `ArmaRZ` float DEFAULT NULL,
  `Inte` int(11) DEFAULT NULL,
  `World` int(11) DEFAULT NULL,
  `ArmaExtra` int(11) DEFAULT NULL,
  `ArmaRGB` varchar(126) DEFAULT NULL,
  `ArmaRaspada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `droparmas`
--

INSERT INTO `droparmas` (`ArmaID`, `Com`, `CompradaPor`, `CompradaData`, `Numeracao`, `Modelo`, `Ammo`, `Cor`, `NoChao`, `ArmaX`, `ArmaY`, `ArmaZ`, `ArmaRX`, `ArmaRY`, `ArmaRZ`, `Inte`, `World`, `ArmaExtra`, `ArmaRGB`, `ArmaRaspada`) VALUES
(1, 1, 'Hubert Alves', '7-5-2023 - 18:53:55', 3966085, 31, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(2, 0, 'Hubert Alves', '7-5-2023 - 20:32:00', 94855758, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `drop_drug`
--

CREATE TABLE `drop_drug` (
  `dID` int(11) NOT NULL,
  `dType` int(11) NOT NULL,
  `dX` float NOT NULL,
  `dY` float NOT NULL,
  `dZ` float NOT NULL,
  `dRX` float NOT NULL,
  `dRY` float NOT NULL,
  `dRZ` float NOT NULL,
  `dAmmo` float NOT NULL,
  `dInt` float NOT NULL,
  `dWorld` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `eID` int(11) NOT NULL,
  `Criada` int(11) NOT NULL,
  `Dono` int(11) NOT NULL,
  `ExX` float NOT NULL,
  `ExY` float NOT NULL,
  `ExZ` float NOT NULL,
  `InX` float NOT NULL,
  `InY` float NOT NULL,
  `InZ` float NOT NULL,
  `ExWorld` int(11) NOT NULL,
  `ExInt` int(11) NOT NULL,
  `Int` int(11) NOT NULL,
  `Preco` int(11) NOT NULL,
  `Trancada` int(11) NOT NULL,
  `PlacaX` float NOT NULL,
  `PlacaY` float NOT NULL,
  `PlacaZ` float NOT NULL,
  `PlacaR` float NOT NULL,
  `AVenda` int(11) NOT NULL,
  `TelCont` int(11) NOT NULL,
  `Nome` varchar(64) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `Bank` int(11) NOT NULL,
  `eVX` float NOT NULL,
  `eVY` float NOT NULL,
  `eVZ` float NOT NULL,
  `eVR` float NOT NULL,
  `PagaProd` int(11) NOT NULL,
  `ReqProd` int(11) NOT NULL,
  `Produtos` int(11) NOT NULL,
  `FuelPrice` int(11) NOT NULL,
  `Perm1` varchar(24) NOT NULL,
  `Perm2` varchar(24) NOT NULL,
  `Perm3` varchar(24) NOT NULL,
  `eCelulares` int(11) NOT NULL,
  `eCelularPreco` int(11) NOT NULL,
  `eGalao` int(11) NOT NULL,
  `eGalaoPreco` int(11) NOT NULL,
  `eToolkitPreco` int(11) NOT NULL,
  `eCigarroPreco` int(11) NOT NULL,
  `eRadioPreco` int(11) NOT NULL,
  `eCameraPreco` int(11) NOT NULL,
  `eLanchePreco` int(11) NOT NULL,
  `eMascPreco` int(11) NOT NULL,
  `eBoomboxPreco` int(11) NOT NULL,
  `eXMR` varchar(256) NOT NULL,
  `complexTipo` int(11) NOT NULL,
  `complexIcone` int(11) NOT NULL,
  `eCervejaPreco` int(11) NOT NULL,
  `eCompraTipo` int(11) NOT NULL,
  `eLeasing` int(11) NOT NULL,
  `eReqFuel` int(11) NOT NULL,
  `eReqFuelPay` int(11) NOT NULL,
  `eEntradaPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresas`
--

INSERT INTO `empresas` (`eID`, `Criada`, `Dono`, `ExX`, `ExY`, `ExZ`, `InX`, `InY`, `InZ`, `ExWorld`, `ExInt`, `Int`, `Preco`, `Trancada`, `PlacaX`, `PlacaY`, `PlacaZ`, `PlacaR`, `AVenda`, `TelCont`, `Nome`, `Tipo`, `Bank`, `eVX`, `eVY`, `eVZ`, `eVR`, `PagaProd`, `ReqProd`, `Produtos`, `FuelPrice`, `Perm1`, `Perm2`, `Perm3`, `eCelulares`, `eCelularPreco`, `eGalao`, `eGalaoPreco`, `eToolkitPreco`, `eCigarroPreco`, `eRadioPreco`, `eCameraPreco`, `eLanchePreco`, `eMascPreco`, `eBoomboxPreco`, `eXMR`, `complexTipo`, `complexIcone`, `eCervejaPreco`, `eCompraTipo`, `eLeasing`, `eReqFuel`, `eReqFuelPay`, `eEntradaPrice`) VALUES
(1, 1, 26, 1654.04, -1654.76, 22.5156, 1650.17, -1631.81, 87.4888, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gotti Ties', 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 1, 0, 0, 0, 0),
(2, 1, 0, 928.266, -1353.06, 13.3437, 362.724, -75.0217, 1001.51, 0, 0, 10, 999999999, 0, 0, 0, 0, 0, 1, 0, '', 27, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 11, 0, 0, 0, 0),
(3, 1, 1, 1928.36, -1774.23, 13.5467, -25.9655, -187.749, 1003.55, 0, 0, 17, 11, 0, 0, 0, 0, 0, 0, 0, 'Petobras BR Gasolinas', 6, 0, 0, 0, 0, 0, 0, 0, 300, 10, 'Vazio', 'Vazio', 'Vazio', 0, 150, 0, 50, 300, 8, 260, 100, 30, 600, 600, '', 0, 0, 50, 11, 0, 0, 0, 0),
(4, 1, 1, 1702.57, -1469.45, 13.5467, 1494.37, 1303.58, 1093.29, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, '', 23, 0, 1706.56, -1497.07, 13.3828, 179.336, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 1, 1864.5, -1762.3, 13.5468, -2029.84, -119.625, 1035.17, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, '', 57, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, 1, 1862.14, -1762.15, 13.5468, 207.766, -111.267, 1005.13, 0, 0, 15, 1, 0, 0, 0, 0, 0, 0, 0, '', 7, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1, 1, 1884.58, -1775.16, 13.575, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(8, 1, 1, 1883.59, -1780.61, 13.5847, 372.237, -133.524, 1001.49, 0, 0, 5, 1, 0, 0, 0, 0, 0, 0, 0, '', 26, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 1, 0, 0, 0, 0),
(9, 1, 0, 1352.33, -1759.25, 13.5078, -25.3591, -187.304, 1003.55, 0, 0, 17, 9999999, 0, 0, 0, 0, 0, 1, 0, '', 6, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 11, 0, 0, 0, 0),
(10, 1, 1, 1310.18, -1366.8, 13.5065, 1494.54, 1303.58, 1093.29, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, '', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(11, 1, 1, 1378.34, -1369.18, 15.2925, 1251.44, -1278.93, 60008.1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 1, 1286.81, -1349.92, 13.5704, 1413.71, -1568.76, 20.0859, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, '', 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(13, 1, 1, 1857.43, -1762.3, 13.5468, 2304.67, -16.0273, 26.7421, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 21, 0, 0, 0, 0, 0, 0, 0, 20, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 11, 0, 0, 0, 0),
(14, 1, 26, 1841.15, -1762.3, 13.5467, 5.6468, -31.7661, 1003.55, 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, '', 6, 50, 0, 0, 0, 0, 0, 0, 299, 0, 'Vazio', 'Vazio', 'Vazio', 0, 900, 0, 50, 100, 20, 150, 200, 10, 400, 200, '', 0, 0, 50, 11, 0, 0, 0, 0),
(15, 1, 0, 1832.71, -1842.31, 13.5781, -25.7975, -186.977, 1003.55, 0, 0, 17, 999999, 0, 0, 0, 0, 0, 1, 0, '', 6, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 11, 0, 0, 0, 0),
(16, 1, 0, 2244.39, -1665.11, 15.4765, 161.38, -96.3012, 1001.8, 0, 0, 18, 99999999, 0, 0, 0, 0, 0, 1, 0, '', 7, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(17, 1, 1, 2400.52, -1981.64, 13.5467, 315.534, -142.661, 999.602, 0, 0, 7, 5000, 0, 0, 0, 0, 0, 0, 0, '', 8, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(18, 1, 26, 556.618, -1473.88, 14.7621, 438.975, -14.1714, 1000.73, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 'Gnocchi Restaurant', 26, 26, 0, 0, 0, 0, 0, 0, 298, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 1, 0, 0, 0, 0),
(19, 1, 26, 1038.2, -1340.71, 13.7447, 1034.16, -1347.79, 18.5141, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(20, 1, 1, 2068.66, -1773.79, 13.5604, 1494.46, 1303.58, 1093.29, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 'Sony Shop', 58, 0, 0, 0, 0, 0, 0, 0, 300, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0),
(21, 1, 96, 1011.75, -918.065, 42.3202, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vazio', 'Vazio', 'Vazio', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 11, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `faccoes`
--

CREATE TABLE `faccoes` (
  `fID` int(11) NOT NULL,
  `fCriada` int(11) NOT NULL,
  `fNome` varchar(34) NOT NULL,
  `fTipo` int(11) NOT NULL,
  `fRank1` varchar(24) NOT NULL,
  `fRank2` varchar(24) NOT NULL,
  `fRank3` varchar(24) NOT NULL,
  `fRank4` varchar(24) NOT NULL,
  `fRank5` varchar(24) NOT NULL,
  `fRank6` varchar(24) NOT NULL,
  `fRank7` varchar(24) NOT NULL,
  `fRank8` varchar(24) NOT NULL,
  `fRank9` varchar(24) NOT NULL,
  `fRank10` varchar(24) NOT NULL,
  `fRank11` varchar(24) NOT NULL,
  `fRank12` varchar(24) NOT NULL,
  `fEntX` float NOT NULL,
  `fEntY` float NOT NULL,
  `fEntZ` float NOT NULL,
  `fSaiX` float NOT NULL,
  `fSaiY` float NOT NULL,
  `fSaiZ` float NOT NULL,
  `fTrancada` int(11) NOT NULL,
  `fTrafNum` int(11) NOT NULL,
  `fMembros` int(11) NOT NULL,
  `fOrdem` int(11) NOT NULL,
  `fComando` int(11) NOT NULL,
  `fArmarioPosX` float NOT NULL,
  `fArmarioPosY` float NOT NULL,
  `fArmarioPosZ` float NOT NULL,
  `fArmarioVw` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `faccoes`
--

INSERT INTO `faccoes` (`fID`, `fCriada`, `fNome`, `fTipo`, `fRank1`, `fRank2`, `fRank3`, `fRank4`, `fRank5`, `fRank6`, `fRank7`, `fRank8`, `fRank9`, `fRank10`, `fRank11`, `fRank12`, `fEntX`, `fEntY`, `fEntZ`, `fSaiX`, `fSaiY`, `fSaiZ`, `fTrancada`, `fTrafNum`, `fMembros`, `fOrdem`, `fComando`, `fArmarioPosX`, `fArmarioPosY`, `fArmarioPosZ`, `fArmarioVw`) VALUES
(1, 1, 'PMERJ', 1, 'CFAP', 'Soldado 2ÂªCl PM', 'Soldado 1ÂªCl PM', 'Cabo PM', '3ÂºSargento PM', '2ÂºSargento PM', '1ÂºSargento PM', 'SubTenente PM', 'Aspirante a Oficial PM', '2ÂºTenente PM', '1ÂºTenente PM', 'CapitÃ£o PM', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1535.51, -1644.62, 777.502, 1),
(2, 1, 'PCERJ', 2, 'ACADEPOL', 'Inspetor', 'Investigador', 'Investigador Chefe', 'CORE', 'Coordenador Chefe', '', '', '', '', 'Delegado Adjunto', 'Delegado Titular', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1402.9, -15.6177, 1001.01, 9),
(3, 1, 'CBMERJ', 3, 'Aluno Soldado', 'Soldado', 'Cabo', '3Âº Sargento', '2Âº Sargento', '1Âº Sargento', 'Cadete', 'Aspirante a Oficial', '2Âº Tenente', '1Âº Tenente', 'CapitÃ£o', 'Major', 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 959.236, -1444.91, 13.525, 0),
(4, 1, 'GOV-RJ', 4, 'FuncionÃ¡rios Pub. Nv. 1', 'FuncionÃ¡rios Pub. Nv. 2', 'FuncionÃ¡rios Pub. Nv. 3', 'FuncionÃ¡rios Publicos N', 'FuncionÃ¡rios Publicos N', 'FuncionÃ¡rios Publicos N', 'Diretores Setoriais Mun', 'Vice-SecretÃ¡rio Municip', 'SecretÃ¡rio Municipal', 'Assessor', 'Vice-Prefeito', 'Prefeito', 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0),
(5, 1, 'PROTEGE', 6, 'Em FormaÃ§Ã£o', 'Vigilante', 'Vigilante LÃ­der', 'Chefe de Frota', 'Supervisor', 'Vigilante', 'Motorista', 'Chefe de SeguranÃ§a', 'Supervisor', 'Gerente', 'Coordenador', 'Diretor', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 1757.82, -1567.17, 13.7376, 0),
(6, 1, 'TJRJ', 16, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 15555, 0, 5, 0, 0, 0, 0, 0),
(7, 1, 'Gotti Ties', 15, 'Interno', 'FuncionÃ¡rio I', 'FuncionÃ¡rio II', 'FuncionÃ¡rio III', 'FuncionÃ¡rio IV', 'FuncionÃ¡rio V', 'Supervisor', 'LÃ­der Setorial', 'Gestor Empresarial', 'Chefe de OperaÃ§Ãµes', 'Chefe Executivo', 'Presidente', 0, 0, 0, 0, 0, 0, 0, 3456843, 0, 6, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `furniture`
--

CREATE TABLE `furniture` (
  `mID` int(11) NOT NULL,
  `mCriado` int(11) NOT NULL DEFAULT '1',
  `mModelo` int(11) NOT NULL,
  `mX` float NOT NULL,
  `mY` float NOT NULL,
  `mZ` float NOT NULL,
  `mRX` float NOT NULL,
  `mRY` float NOT NULL,
  `mRZ` float NOT NULL,
  `mWorld` int(11) NOT NULL,
  `mInt` int(11) NOT NULL,
  `mTextura` int(11) NOT NULL,
  `mCor` int(11) NOT NULL,
  `mNaCasa` int(11) NOT NULL,
  `mNaEmpresa` int(11) NOT NULL,
  `mFurniNome` varchar(24) NOT NULL,
  `mARZ` float NOT NULL,
  `mPAberta` int(11) NOT NULL,
  `mPTrancada` int(11) NOT NULL,
  `mNoComplexo` int(11) NOT NULL,
  `mNaGaragem` int(11) NOT NULL,
  `mIndex` int(11) NOT NULL,
  `mIndex2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `garagens`
--

CREATE TABLE `garagens` (
  `hIDa` int(11) NOT NULL,
  `Criada` int(11) NOT NULL,
  `Dono` int(11) NOT NULL,
  `ExX` float NOT NULL,
  `ExY` float NOT NULL,
  `ExZ` float NOT NULL,
  `InX` float NOT NULL,
  `InY` float NOT NULL,
  `InZ` float NOT NULL,
  `ExWorld` int(11) NOT NULL,
  `ExInt` int(11) NOT NULL,
  `Int` int(11) NOT NULL,
  `Preco` int(11) NOT NULL,
  `Trancada` int(11) NOT NULL,
  `PlacaX` float NOT NULL,
  `PlacaY` float NOT NULL,
  `PlacaZ` float NOT NULL,
  `PlacaR` float NOT NULL,
  `AVenda` int(11) NOT NULL,
  `TelCont` int(11) NOT NULL,
  `Perm1` varchar(24) NOT NULL,
  `Perm2` varchar(24) NOT NULL,
  `Perm3` varchar(24) NOT NULL,
  `hBank` int(11) NOT NULL,
  `hXMR` varchar(256) NOT NULL,
  `hDia` int(11) NOT NULL,
  `hMes` int(11) NOT NULL,
  `hAno` int(11) NOT NULL,
  `hTipo` int(11) NOT NULL,
  `hAlarme` int(11) NOT NULL,
  `hInterruptor` int(11) NOT NULL,
  `hGasto` int(11) NOT NULL,
  `hInR` float NOT NULL,
  `ExX2` float NOT NULL,
  `ExY2` float NOT NULL,
  `ExZ2` float NOT NULL,
  `ExR` float NOT NULL,
  `InR` float NOT NULL,
  `carros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `garagens`
--

INSERT INTO `garagens` (`hIDa`, `Criada`, `Dono`, `ExX`, `ExY`, `ExZ`, `InX`, `InY`, `InZ`, `ExWorld`, `ExInt`, `Int`, `Preco`, `Trancada`, `PlacaX`, `PlacaY`, `PlacaZ`, `PlacaR`, `AVenda`, `TelCont`, `Perm1`, `Perm2`, `Perm3`, `hBank`, `hXMR`, `hDia`, `hMes`, `hAno`, `hTipo`, `hAlarme`, `hInterruptor`, `hGasto`, `hInR`, `ExX2`, `ExY2`, `ExZ2`, `ExR`, `InR`, `carros`) VALUES
(1, 1, 0, 2852.86, -1355.39, 11.0625, 1643.59, -1517.11, 13.2196, 0, 0, 6, 0, 1, 0, 0, 0, 0, 1, 0, 'Vazio', 'Vazio', 'Vazio', 0, '', 0, 0, 0, 262, 3, 0, 0, 0, 2852.71, -1355.57, 11.0625, 180, 270, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `governo`
--

CREATE TABLE `governo` (
  `id` int(11) NOT NULL,
  `cofres` int(11) NOT NULL,
  `prefeito` varchar(24) NOT NULL,
  `taxa` int(11) NOT NULL,
  `taxaluz` int(11) NOT NULL,
  `salariosgov` varchar(255) NOT NULL,
  `salariospd` varchar(255) NOT NULL,
  `salariosfd` varchar(255) NOT NULL,
  `taxahp` int(11) NOT NULL,
  `convenio` int(11) NOT NULL,
  `salariomin` int(11) NOT NULL,
  `salarioseb` varchar(255) NOT NULL,
  `salariospc` varchar(255) NOT NULL,
  `salariosTJRP` varchar(255) NOT NULL,
  `salariosFacCivil` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `governo`
--

INSERT INTO `governo` (`id`, `cofres`, `prefeito`, `taxa`, `taxaluz`, `salariosgov`, `salariospd`, `salariosfd`, `taxahp`, `convenio`, `salariomin`, `salarioseb`, `salariospc`, `salariosTJRP`, `salariosFacCivil`) VALUES
(1, 24931273, 'Carlos_Marshal', 22, 23, '400|500|600|700|800|900|0|0|0|0|0|0', '900|1000|1100|1200|1300|1400|1500|1600|1700|1800|1900|2500', '900|1000|1100|1200|1300|1400|1500|1600|1700|1800|1900|2500', 300, 80, 102, '400|500|600|700|800|900|1000|1100|1200|1300|1400|1500', '400|500|600|700|800|900|1000|1100|1200|1300|1400|1500', '400|500|600|700|800|900|1000|1100|1200|1300|1400|1500', '400|500|600|700|800|900|1000|1100|1200|1300|1400|1500');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grafico`
--

CREATE TABLE `grafico` (
  `id` int(11) NOT NULL,
  `nome` varchar(126) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grafico`
--

INSERT INTO `grafico` (`id`, `nome`, `quantidade`) VALUES
(1, '12-janeiro-2023', 1),
(2, '13-janeiro-2023', 1),
(3, '14-janeiro-2023', 1),
(4, '15-janeiro-2023', 2),
(5, '16-janeiro-2023', 1),
(6, '17-janeiro-2023', 0),
(7, '18-janeiro-2023', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `iID` int(11) NOT NULL,
  `iCriado` int(11) NOT NULL,
  `iObj` int(11) NOT NULL,
  `iCom` int(11) NOT NULL,
  `iNome` varchar(24) NOT NULL,
  `iX` float NOT NULL,
  `iY` float NOT NULL,
  `iZ` float NOT NULL,
  `iRX` float NOT NULL,
  `iRY` float NOT NULL,
  `iRZ` float NOT NULL,
  `iSX` float NOT NULL,
  `iSY` float NOT NULL,
  `iSZ` float NOT NULL,
  `iDrop` int(11) NOT NULL,
  `iWorld` int(11) NOT NULL,
  `iInt` int(11) NOT NULL,
  `iUsando` int(11) NOT NULL,
  `iTipo` int(11) NOT NULL,
  `iBone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jockeyclub`
--

CREATE TABLE `jockeyclub` (
  `id` int(11) NOT NULL,
  `nome` varchar(124) NOT NULL,
  `vitorias` int(11) NOT NULL,
  `derrotas` int(11) NOT NULL,
  `corridas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jockeyclub`
--

INSERT INTO `jockeyclub` (`id`, `nome`, `vitorias`, `derrotas`, `corridas`) VALUES
(1, 'Hard Trick', 195, 752, 947),
(2, 'Ultra-RÃƒÂ¡pido', 118, 767, 885),
(3, 'PÃƒÂ© de Pano', 290, 607, 897),
(4, 'Holy Legal', 173, 735, 908),
(5, 'COWBOY', 169, 698, 867),
(6, 'Bala no Alvo', 324, 587, 911),
(7, 'Kiss me now', 162, 741, 903),
(8, 'Esfinge', 290, 587, 877),
(9, 'TupÃƒÂ£ Sky', 197, 729, 926),
(10, 'JosÃƒÂ© Cuervo', 177, 729, 906),
(11, 'X-Thunder', 128, 830, 958),
(12, 'Caribean Queen', 186, 654, 840),
(13, 'Hypnose', 173, 704, 877),
(14, 'Quarterback', 103, 771, 874),
(15, 'Alcohol', 153, 709, 862),
(16, 'Star Lady', 166, 727, 893),
(17, 'Black Smoke', 110, 821, 931),
(18, 'Donut', 119, 793, 912),
(19, 'Comodoro', 180, 715, 895),
(20, 'Big Cat', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jockeyclub_info`
--

CREATE TABLE `jockeyclub_info` (
  `id` int(11) NOT NULL,
  `corrida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jockeyclub_info`
--

INSERT INTO `jockeyclub_info` (`id`, `corrida`) VALUES
(1, 3405);

-- --------------------------------------------------------

--
-- Estrutura da tabela `last911`
--

CREATE TABLE `last911` (
  `nID` int(11) NOT NULL,
  `nNome` varchar(24) NOT NULL,
  `nLocalizacao` varchar(32) NOT NULL,
  `nSituacao` varchar(256) NOT NULL,
  `nRastreador` varchar(32) NOT NULL,
  `nTelefone` int(11) NOT NULL,
  `nTipo` int(11) NOT NULL,
  `nAtendido` int(11) NOT NULL,
  `nData` varchar(124) NOT NULL,
  `nUsando` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `last911`
--

INSERT INTO `last911` (`nID`, `nNome`, `nLocalizacao`, `nSituacao`, `nRastreador`, `nTelefone`, `nTipo`, `nAtendido`, `nData`, `nUsando`) VALUES
(1, 'Daniela', 'Prefeitura, socorro!', 'Acabei de ouvir um estrondo na loja de conviÃªncia ao lado da prefeitura e dois carros pretos saindo do local com diversos homen', 'Blueberry Acres', 649462, 1, 0, '17-1-2023 - 19:13:30', 1),
(2, 'Lexy Gotti.', 'Market.', 'perdi o meu diu', 'Market', 823615, 2, 0, '17-1-2023 - 20:10:19', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `multas`
--

CREATE TABLE `multas` (
  `mID` int(11) NOT NULL,
  `mDono` int(11) NOT NULL,
  `mCarro` int(11) NOT NULL,
  `mValor` int(11) NOT NULL,
  `mData` varchar(56) NOT NULL,
  `mMotivo` varchar(124) NOT NULL,
  `mIssuer` varchar(24) NOT NULL,
  `mPayHours` int(11) NOT NULL,
  `mPaga` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `multas`
--

INSERT INTO `multas` (`mID`, `mDono`, `mCarro`, `mValor`, `mData`, `mMotivo`, `mIssuer`, `mPayHours`, `mPaga`) VALUES
(1, 0, 235, 1500, '17-1-2023 - 15:54:20', 'Estacionado em outra vaga.', 'Mikael Afonso', 4320, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `phonebooths`
--

CREATE TABLE `phonebooths` (
  `ID` int(11) NOT NULL,
  `pbX` float NOT NULL,
  `pbY` float NOT NULL,
  `pbZ` float NOT NULL,
  `pbRX` float NOT NULL,
  `pbRY` float NOT NULL,
  `pbRZ` float NOT NULL,
  `pbInterior` int(11) NOT NULL,
  `pbVirtualWorld` int(11) NOT NULL,
  `Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pixes`
--

CREATE TABLE `pixes` (
  `id` int(11) NOT NULL,
  `texto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fonte` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tamanho` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `world` int(11) NOT NULL,
  `interior` int(11) NOT NULL,
  `por` varchar(24) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `pixes`
--

INSERT INTO `pixes` (`id`, `texto`, `cor`, `fonte`, `tamanho`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `world`, `interior`, `por`) VALUES
(2, '{FF0000}COMANDO VERMELHO', 'FF0000', 'Gangland Style', 20, 1971.61, -1779.63, 14.1268, 0, 0, -179.1, 0, 0, 'Mikael Afonso');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontoentrega`
--

CREATE TABLE `pontoentrega` (
  `emID` int(11) NOT NULL,
  `emExiste` int(11) NOT NULL,
  `emTipo` int(11) NOT NULL,
  `emStatus` int(11) NOT NULL,
  `emNome` varchar(64) NOT NULL,
  `emCompra` int(11) NOT NULL,
  `emFabrica` int(11) NOT NULL,
  `emX` float NOT NULL,
  `emY` float NOT NULL,
  `emZ` float NOT NULL,
  `emEmpresa` int(11) NOT NULL,
  `emStock` int(11) NOT NULL,
  `emCobraProd` int(11) NOT NULL,
  `emPagProd` int(11) NOT NULL,
  `emStockMax` int(11) NOT NULL,
  `emProdHora` int(11) NOT NULL,
  `emConsHora` int(11) NOT NULL,
  `emStockC` int(11) NOT NULL,
  `emStockMaxC` int(11) NOT NULL,
  `emIndustria` int(11) NOT NULL,
  `emIndustriaC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pontoentrega`
--

INSERT INTO `pontoentrega` (`emID`, `emExiste`, `emTipo`, `emStatus`, `emNome`, `emCompra`, `emFabrica`, `emX`, `emY`, `emZ`, `emEmpresa`, `emStock`, `emCobraProd`, `emPagProd`, `emStockMax`, `emProdHora`, `emConsHora`, `emStockC`, `emStockMaxC`, `emIndustria`, `emIndustriaC`) VALUES
(1, 1, 2, 1, 'Drinks S/A', 2, 10, 1324.13, 286.511, 20.045, 9999, 220, 42, 35, 220, 100, 50, 40, 200, 9999, 9999),
(2, 1, 1, 1, 'EasterBoard Farm', 0, 2, -59.9816, 83.6584, 3.1171, 9999, 220, 30, 0, 220, 130, 0, 0, 0, 9999, 9999),
(3, 1, 1, 1, 'The Beacon Hill Eggs', 0, 4, -382.728, -1426.49, 26.2566, 9999, 180, 25, 0, 180, 40, 0, 0, 0, 9999, 9999),
(4, 1, 1, 1, 'Whetstone Rock Farm', 0, 7, -1447.99, -1500.02, 101.758, 9999, 220, 40, 0, 220, 50, 0, 0, 0, 9999, 9999),
(5, 1, 1, 1, 'EasterBoard Farm', 0, 5, -38.6505, 56.1673, 3.1171, 9999, 160, 75, 0, 160, 40, 0, 40, 0, 1, 9999),
(6, 1, 2, 1, 'Whitewood Alimentos', 4, 0, 1082.77, 1911.72, 10.8203, 9999, 0, 0, 46, 0, 0, 20, 0, 200, 9999, 7),
(7, 1, 2, 1, 'Whitewood Alimentos', 5, 0, 1091.42, 1911.65, 10.8203, 9999, 0, 0, 88, 0, 0, 60, 0, 220, 7, 7),
(8, 1, 2, 1, 'Whitewood Alimentos', 0, 1, 1111.85, 1919.94, 10.8203, 9999, 300, 50, 0, 300, 100, 0, 0, 0, 9999, 9999),
(9, 1, 2, 1, 'Whitewood Alimentos', 2, 0, 1076.55, 1911.88, 10.8203, 9999, 0, 0, 40, 0, 0, 20, 0, 120, 9999, 7),
(10, 1, 1, 1, 'EasterBoard Farm', 0, 6, -67.5438, -35.2066, 3.1171, 9999, 1000, 1000, 0, 1000, 500, 0, 500, 1000, 1, 9999),
(11, 1, 2, 1, 'Whitewood Alimentos', 6, 0, 1053.12, 1911.77, 10.8203, 9999, 500, 0, 1080, 1000, 0, 500, 0, 1000, 9999, 7),
(12, 1, 1, 1, 'Engineering Gomery', 0, 20, 1351.9, 348.383, 20.4799, 9999, 180, 35, 0, 180, 40, 0, 0, 0, 9999, 9999),
(13, 1, 2, 1, 'Linden Clothes INC.', 0, 8, 2814.74, 973.04, 10.75, 9999, 50, 65, 0, 300, 60, 0, 0, 0, 9999, 9999),
(14, 1, 2, 1, 'Linden Clothes INC.', 20, 0, 2847.12, 957.152, 10.75, 9999, 0, 0, 48, 0, 0, 30, 0, 220, 9999, 12),
(15, 1, 2, 1, 'Linden Clothes INC.', 7, 0, 2846.88, 973.187, 10.75, 9999, 0, 0, 53, 0, 0, 80, 40, 180, 9999, 12),
(16, 1, 1, 1, 'Randolph IND.', 0, 12, 1709.71, 701.573, 10.8203, 9999, 300, 49, 0, 300, 50, 0, 0, 0, 9999, 9999),
(17, 1, 2, 1, 'Shafted Appliances ', 0, 11, -156.138, -288.968, 3.9052, 9999, 30, 35, 0, 350, 30, 0, 0, 0, 9999, 9999),
(18, 1, 2, 1, 'Shafted Appliances ', 12, 0, -161.242, -274.532, 3.9052, 9999, 0, 0, 60, 0, 0, 30, 0, 220, 9999, 16),
(19, 1, 1, 1, 'Shafted Appliances ', 0, 14, -158.789, -306.045, 1.4296, 9999, 15, 2000, 0, 15, 2, 0, 0, 0, 16, 16),
(20, 1, 1, 1, 'Engineering Gomery', 0, 21, 1343.81, 331.825, 20.3873, 9999, 120, 120, 0, 120, 40, 0, 0, 0, 11, 9999),
(21, 1, 2, 1, 'Federal Weapon Factory', 0, 13, -539.979, -505.542, 25.5233, 9999, 0, 0, 0, 300, 0, 0, 0, 0, 9999, 9999),
(22, 1, 1, 1, 'Federal Weapon Factory', 12, 0, -553.531, -505.5, 25.5233, 9999, 0, 0, 62, 0, 0, 0, 0, 200, 9999, 20),
(23, 1, 1, 1, 'Federal Weapon Factory', 21, 0, -575.706, -505.189, 25.5233, 9999, 0, 0, 135, 0, 0, 0, 0, 200, 9999, 20),
(24, 1, 1, 1, 'Leafy Fruits SA', 0, 2, -1113.43, -1621.54, 76.3739, 9999, 180, 22, 0, 180, 50, 0, 0, 0, 9999, 9999),
(25, 1, 1, 1, 'Green Palms Refinery', 0, 3, 264.054, 1408.57, 10.3067, 9999, 2000, 0, 0, 2000, 100, 0, 0, 0, 9999, 9999),
(26, 1, 3, 1, 'Porto de Los Santos', 1, 0, 2730.22, -2451.49, 17.5937, 9999, 0, 0, 62, 0, 0, 0, 30, 180, 9999, 9999),
(27, 1, 3, 1, 'Porto de Los Santos', 10, 0, 2735.36, -2465.53, 13.6484, 9999, 0, 0, 55, 0, 0, 0, 0, 180, 9999, 9999),
(28, 1, 3, 1, 'Ponto de Entrega', 8, 0, 2733.28, -2512.28, 13.6639, 9999, 0, 0, 79, 0, 0, 0, 40, 180, 9999, 9999),
(29, 1, 3, 1, 'Porto de Los Santos', 11, 0, 2756.61, -2531.74, 13.6357, 9999, 0, 0, 45, 0, 0, 0, 0, 180, 9999, 9999),
(30, 1, 2, 1, 'Sherman Dam Powerplant', 14, 0, -593.747, 2020.38, 60.3828, 9999, 0, 0, 230, 0, 0, 5, 2, 20, 9999, 9999),
(31, 1, 1, 1, 'Whetstone Rock Farm', 0, 5, -1448.43, -1522.97, 101.758, 9999, 160, 67, 0, 160, 45, 0, 0, 0, 3, 9999),
(32, 1, 1, 1, 'Ponto de Entrega', 0, 0, 2753.49, -2503.36, 13.4745, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 9999, 9999);

-- --------------------------------------------------------

--
-- Estrutura da tabela `portoes`
--

CREATE TABLE `portoes` (
  `ptID` int(11) NOT NULL,
  `ptCriado` int(11) NOT NULL,
  `ptX` float NOT NULL,
  `ptY` float NOT NULL,
  `ptZ` float NOT NULL,
  `ptAX` float NOT NULL,
  `ptAY` float NOT NULL,
  `ptAZ` float NOT NULL,
  `ptWorld` int(11) NOT NULL,
  `ptInt` int(11) NOT NULL,
  `ptFac` int(11) NOT NULL,
  `ptCasa` int(11) NOT NULL,
  `ptLock` int(11) NOT NULL,
  `ptAberto` int(11) NOT NULL,
  `ptModelo` int(11) NOT NULL,
  `ptRX` float NOT NULL,
  `ptRY` float NOT NULL,
  `ptRZ` float NOT NULL,
  `ptRAX` float NOT NULL,
  `ptRAY` float NOT NULL,
  `ptRAZ` float NOT NULL,
  `ptRange` float NOT NULL,
  `ptTempo` int(11) NOT NULL,
  `ptEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pumps`
--

CREATE TABLE `pumps` (
  `ID` int(11) DEFAULT '0',
  `pumpID` int(11) NOT NULL,
  `pumpPosX` float DEFAULT '0',
  `pumpPosY` float DEFAULT '0',
  `pumpPosZ` float DEFAULT '0',
  `pumpPosA` float DEFAULT '0',
  `pumpFuel` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pumps`
--

INSERT INTO `pumps` (`ID`, `pumpID`, `pumpPosX`, `pumpPosY`, `pumpPosZ`, `pumpPosA`, `pumpFuel`) VALUES
(3, 1, 1941.25, -1776.5, 12.6968, -177.422, 1000),
(3, 3, 1940.87, -1768.2, 12.6668, -179.738, 1000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `recuperacao`
--

CREATE TABLE `recuperacao` (
  `utilizador` varchar(255) NOT NULL,
  `confirmacao` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `refundo`
--

CREATE TABLE `refundo` (
  `rID` int(11) NOT NULL,
  `rUsado` int(11) DEFAULT NULL,
  `rDono` int(11) DEFAULT NULL,
  `rTipo` int(11) DEFAULT NULL,
  `rGrana` int(11) DEFAULT NULL,
  `rArmaModel` int(11) DEFAULT NULL,
  `rArmaAmmo` int(11) DEFAULT NULL,
  `rDrugQnt` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `refundoarma`
--

CREATE TABLE `refundoarma` (
  `chave` int(11) DEFAULT NULL,
  `arma` int(11) DEFAULT NULL,
  `jogador` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `refundograna`
--

CREATE TABLE `refundograna` (
  `chave` int(11) DEFAULT NULL,
  `arma` int(11) DEFAULT NULL,
  `admin` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jogador` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `refundoitens`
--

CREATE TABLE `refundoitens` (
  `chave` int(11) DEFAULT NULL,
  `arma` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `jogador` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_atms`
--

CREATE TABLE `rp_atms` (
  `id` int(11) NOT NULL,
  `setada` int(11) NOT NULL,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posr` float NOT NULL,
  `aGrana` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rp_atms`
--

INSERT INTO `rp_atms` (`id`, `setada`, `posx`, `posy`, `posz`, `posr`, `aGrana`) VALUES
(1, 1, 1928.64, -1769.74, 12.4969, 92.4, 5000),
(2, 1, 1748.12, -1863.46, 12.3789, -179.3, 5000),
(3, 1, 1134.9, -1524.76, 14.7989, -163.7, 5000),
(4, 1, 2398.42, -1981.85, 12.5469, -179.1, 5000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_cloja`
--

CREATE TABLE `rp_cloja` (
  `id` int(11) NOT NULL,
  `setada` int(11) NOT NULL,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posr` float NOT NULL,
  `aGrana` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rp_cloja`
--

INSERT INTO `rp_cloja` (`id`, `setada`, `posx`, `posy`, `posz`, `posr`, `aGrana`) VALUES
(1, 1, 0, 0, 0, 0, 0),
(2, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_cofre`
--

CREATE TABLE `rp_cofre` (
  `id` int(11) NOT NULL,
  `setada` int(11) NOT NULL,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posr` float NOT NULL,
  `aGrana` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rp_cofre`
--

INSERT INTO `rp_cofre` (`id`, `setada`, `posx`, `posy`, `posz`, `posr`, `aGrana`) VALUES
(1, 1, 1135.54, -1524.81, 14.7993, -160.9, 0),
(2, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_drogasplant`
--

CREATE TABLE `rp_drogasplant` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `r` float NOT NULL,
  `tempo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `setada` int(11) NOT NULL,
  `world` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_joias`
--

CREATE TABLE `rp_joias` (
  `id` int(11) NOT NULL,
  `setada` int(11) NOT NULL,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posr` float NOT NULL,
  `aGrana` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_laboratorio`
--

CREATE TABLE `rp_laboratorio` (
  `id` int(11) NOT NULL,
  `setada` int(11) NOT NULL,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posr` float NOT NULL,
  `aGrana` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_radio_stations`
--

CREATE TABLE `rp_radio_stations` (
  `radioID` int(11) NOT NULL,
  `Station` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_vehicles`
--

CREATE TABLE `rp_vehicles` (
  `id` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `owning_character` int(11) NOT NULL,
  `color1` int(11) NOT NULL,
  `color2` int(11) NOT NULL,
  `spawn_x` float NOT NULL,
  `spawn_y` float NOT NULL,
  `spawn_z` float NOT NULL,
  `spawn_r` float NOT NULL,
  `mileage` int(11) NOT NULL,
  `lock` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `times_destroyed` int(11) NOT NULL,
  `fuel` int(11) NOT NULL,
  `faction` int(11) NOT NULL,
  `death_time` int(11) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `insurance` int(11) NOT NULL,
  `mods` varchar(255) NOT NULL,
  `paintjob` int(11) NOT NULL,
  `weapons` varchar(255) NOT NULL,
  `imp` tinyint(1) NOT NULL,
  `gps` tinyint(1) NOT NULL,
  `comp` int(11) NOT NULL,
  `dmg1` int(11) NOT NULL,
  `dmg2` int(11) NOT NULL,
  `dmg3` int(11) NOT NULL,
  `dmg4` int(11) NOT NULL,
  `hp` float NOT NULL,
  `neon` int(11) NOT NULL,
  `truncated` tinyint(1) NOT NULL,
  `immob` smallint(6) NOT NULL,
  `sprice` int(11) NOT NULL,
  `sexpire` int(11) NOT NULL,
  `selling` int(11) NOT NULL DEFAULT '-1',
  `radio` int(11) NOT NULL DEFAULT '0',
  `world` int(11) NOT NULL,
  `interior` int(11) NOT NULL,
  `malotes` int(11) NOT NULL,
  `slottipo1` int(11) NOT NULL,
  `slottipo2` int(11) NOT NULL,
  `slottipo3` int(11) NOT NULL,
  `slottipo4` int(11) NOT NULL,
  `slottipo5` int(11) NOT NULL,
  `slottipo6` int(11) NOT NULL,
  `slottipo7` int(11) NOT NULL,
  `slottipo8` int(11) NOT NULL,
  `slottipo9` int(11) NOT NULL,
  `slottipo10` int(11) NOT NULL,
  `slot1` int(11) NOT NULL,
  `slot2` int(11) NOT NULL,
  `slot3` int(11) NOT NULL,
  `slot4` int(11) NOT NULL,
  `slot5` int(11) NOT NULL,
  `slot6` int(11) NOT NULL,
  `slot7` int(11) NOT NULL,
  `slot8` int(11) NOT NULL,
  `slot9` int(11) NOT NULL,
  `slot10` int(11) NOT NULL,
  `ammo1` int(11) NOT NULL,
  `ammo2` int(11) NOT NULL,
  `ammo3` int(11) NOT NULL,
  `ammo4` int(11) NOT NULL,
  `ammo5` int(11) NOT NULL,
  `ammo6` int(11) NOT NULL,
  `ammo7` int(11) NOT NULL,
  `ammo8` int(11) NOT NULL,
  `ammo9` int(11) NOT NULL,
  `ammo10` int(11) NOT NULL,
  `motor` float NOT NULL,
  `bateria` float NOT NULL,
  `pluva1` int(11) NOT NULL,
  `pluva2` int(11) NOT NULL,
  `pluva3` int(11) NOT NULL,
  `pluva4` int(11) NOT NULL,
  `pluva5` int(11) NOT NULL,
  `pluva1a` int(11) NOT NULL,
  `pluva2a` int(11) NOT NULL,
  `pluva3a` int(11) NOT NULL,
  `pluva4a` int(11) NOT NULL,
  `pluva5a` int(11) NOT NULL,
  `pluva1t` int(11) NOT NULL,
  `pluva2t` int(11) NOT NULL,
  `pluva3t` int(11) NOT NULL,
  `pluva4t` int(11) NOT NULL,
  `pluva5t` int(11) NOT NULL,
  `vCarSign` int(11) NOT NULL,
  `Slot1X` float NOT NULL,
  `Slot1Y` float NOT NULL,
  `Slot1Z` float NOT NULL,
  `Slot1RX` float NOT NULL,
  `Slot1RY` float NOT NULL,
  `Slot1RZ` float NOT NULL,
  `Slot2X` float NOT NULL,
  `Slot2Y` float NOT NULL,
  `Slot2Z` float NOT NULL,
  `Slot2RX` float NOT NULL,
  `Slot2RY` float NOT NULL,
  `Slot2RZ` float NOT NULL,
  `Slot3X` float NOT NULL,
  `Slot3Y` float NOT NULL,
  `Slot3Z` float NOT NULL,
  `Slot3RX` float NOT NULL,
  `Slot3RY` float NOT NULL,
  `Slot3RZ` float NOT NULL,
  `Slot4X` float NOT NULL,
  `Slot4Y` float NOT NULL,
  `Slot4Z` float NOT NULL,
  `Slot4RX` float NOT NULL,
  `Slot4RY` float NOT NULL,
  `Slot4RZ` float NOT NULL,
  `Slot5X` float NOT NULL,
  `Slot5Y` float NOT NULL,
  `Slot5Z` float NOT NULL,
  `Slot5RX` float NOT NULL,
  `Slot5RY` float NOT NULL,
  `Slot5RZ` float NOT NULL,
  `Slot6X` float NOT NULL,
  `Slot6Y` float NOT NULL,
  `Slot6Z` float NOT NULL,
  `Slot6RX` float NOT NULL,
  `Slot6RY` float NOT NULL,
  `Slot6RZ` float NOT NULL,
  `Slot7X` float NOT NULL,
  `Slot7Y` float NOT NULL,
  `Slot7Z` float NOT NULL,
  `Slot7RX` float NOT NULL,
  `Slot7RY` float NOT NULL,
  `Slot7RZ` float NOT NULL,
  `Slot8X` float NOT NULL,
  `Slot8Y` float NOT NULL,
  `Slot8Z` float NOT NULL,
  `Slot8RX` float NOT NULL,
  `Slot8RY` float NOT NULL,
  `Slot8RZ` float NOT NULL,
  `Slot9X` float NOT NULL,
  `Slot9Y` float NOT NULL,
  `Slot9Z` float NOT NULL,
  `Slot9RX` float NOT NULL,
  `Slot9RY` float NOT NULL,
  `Slot9RZ` float NOT NULL,
  `Slot10X` float NOT NULL,
  `Slot10Y` float NOT NULL,
  `Slot10Z` float NOT NULL,
  `Slot10RX` float NOT NULL,
  `Slot10RY` float NOT NULL,
  `Slot10RZ` float NOT NULL,
  `vCarSignS` int(11) NOT NULL,
  `vTuned` int(11) NOT NULL,
  `vSpoiler` int(11) NOT NULL,
  `vHood` int(11) NOT NULL,
  `vRoof` int(11) NOT NULL,
  `vSkirt` int(11) NOT NULL,
  `vLamps` int(11) NOT NULL,
  `vNitro` int(11) NOT NULL,
  `vExhaust` int(11) NOT NULL,
  `vWheels` int(11) NOT NULL,
  `vStereo` int(11) NOT NULL,
  `vHydraulics` int(11) NOT NULL,
  `vFrontBumper` int(11) NOT NULL,
  `vRearBumper` int(11) NOT NULL,
  `vRightVent` int(11) NOT NULL,
  `vLeftVent` int(11) NOT NULL,
  `vPaintJob` int(11) NOT NULL,
  `vPlacaProcurada` int(11) NOT NULL,
  `vGunHack` int(11) NOT NULL,
  `vGunHackA` int(11) NOT NULL,
  `vAjudaIni` int(11) NOT NULL,
  `vGaragem` int(11) NOT NULL,
  `vDesmanchado` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rp_vehicles`
--

INSERT INTO `rp_vehicles` (`id`, `model`, `owning_character`, `color1`, `color2`, `spawn_x`, `spawn_y`, `spawn_z`, `spawn_r`, `mileage`, `lock`, `locked`, `times_destroyed`, `fuel`, `faction`, `death_time`, `owner_name`, `plate`, `insurance`, `mods`, `paintjob`, `weapons`, `imp`, `gps`, `comp`, `dmg1`, `dmg2`, `dmg3`, `dmg4`, `hp`, `neon`, `truncated`, `immob`, `sprice`, `sexpire`, `selling`, `radio`, `world`, `interior`, `malotes`, `slottipo1`, `slottipo2`, `slottipo3`, `slottipo4`, `slottipo5`, `slottipo6`, `slottipo7`, `slottipo8`, `slottipo9`, `slottipo10`, `slot1`, `slot2`, `slot3`, `slot4`, `slot5`, `slot6`, `slot7`, `slot8`, `slot9`, `slot10`, `ammo1`, `ammo2`, `ammo3`, `ammo4`, `ammo5`, `ammo6`, `ammo7`, `ammo8`, `ammo9`, `ammo10`, `motor`, `bateria`, `pluva1`, `pluva2`, `pluva3`, `pluva4`, `pluva5`, `pluva1a`, `pluva2a`, `pluva3a`, `pluva4a`, `pluva5a`, `pluva1t`, `pluva2t`, `pluva3t`, `pluva4t`, `pluva5t`, `vCarSign`, `Slot1X`, `Slot1Y`, `Slot1Z`, `Slot1RX`, `Slot1RY`, `Slot1RZ`, `Slot2X`, `Slot2Y`, `Slot2Z`, `Slot2RX`, `Slot2RY`, `Slot2RZ`, `Slot3X`, `Slot3Y`, `Slot3Z`, `Slot3RX`, `Slot3RY`, `Slot3RZ`, `Slot4X`, `Slot4Y`, `Slot4Z`, `Slot4RX`, `Slot4RY`, `Slot4RZ`, `Slot5X`, `Slot5Y`, `Slot5Z`, `Slot5RX`, `Slot5RY`, `Slot5RZ`, `Slot6X`, `Slot6Y`, `Slot6Z`, `Slot6RX`, `Slot6RY`, `Slot6RZ`, `Slot7X`, `Slot7Y`, `Slot7Z`, `Slot7RX`, `Slot7RY`, `Slot7RZ`, `Slot8X`, `Slot8Y`, `Slot8Z`, `Slot8RX`, `Slot8RY`, `Slot8RZ`, `Slot9X`, `Slot9Y`, `Slot9Z`, `Slot9RX`, `Slot9RY`, `Slot9RZ`, `Slot10X`, `Slot10Y`, `Slot10Z`, `Slot10RX`, `Slot10RY`, `Slot10RZ`, `vCarSignS`, `vTuned`, `vSpoiler`, `vHood`, `vRoof`, `vSkirt`, `vLamps`, `vNitro`, `vExhaust`, `vWheels`, `vStereo`, `vHydraulics`, `vFrontBumper`, `vRearBumper`, `vRightVent`, `vLeftVent`, `vPaintJob`, `vPlacaProcurada`, `vGunHack`, `vGunHackA`, `vAjudaIni`, `vGaragem`, `vDesmanchado`) VALUES
(1, 597, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2.17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 597, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 597, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 523, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 523, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 523, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 523, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 523, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 523, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 427, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 427, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 490, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 490, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 490, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 490, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 598, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 1, 0, 'PMERJ', 'LA001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 596, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 2, 0, 'PCERJ', 'SF001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 596, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 2, 0, 'PCERJ', 'SF001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 596, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 2, 0, 'PCERJ', 'SF001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 596, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 99, 2, 0, 'PCERJ', 'SF001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 596, 0, 132, 154, 2314.18, 2496.11, 3.36036, 92.2034, 26, 0, 1, 0, 97, 2, 0, 'PCERJ', 'SF001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 968.533, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 596, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 31, 0, 1, 0, 97, 2, 0, 'PCERJ', 'SF001TU', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 883.58, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 407, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 3, 0, 'CBMERJ', 'CBMERJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 407, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 3, 0, 'CBMERJ', 'CBMERJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 544, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 3, 0, 'CBMERJ', 'CBMERJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 544, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 3, 0, 'CBMERJ', 'CBMERJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 416, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 3, 0, 'CBMERJ', 'CBMERJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 416, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 3, 0, 'CBMERJ', 'CBMERJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 416, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 3, 0, 'CBMERJ', 'CBMERJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 470, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 3, 0, 'CBMERJ', 'CBMERJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 428, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 5, 0, 'PROTEGE', 'PROTEGE', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 428, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 5, 0, 'PROTEGE', 'PROTEGE', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 579, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 5, 0, 'PROTEGE', 'PROTEGE', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 428, 0, 1, 1, 2314.18, 2496.11, 3.36036, 92.2034, 21, 0, 1, 0, 100, 5, 0, 'PROTEGE', 'PROTEGE', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 506, 1, 0, 0, 1217.7, -2531.57, 2.19322, 141.909, 72, 0, 0, 4, 81, 0, 0, 'Mikael Afonso', 'SU026XP', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 515, 1, 0, 0, 2866.91, -1370.47, 11.7704, 351.213, 21, 0, 0, 0, 90, 0, 0, 'Mikael Afonso', 'RO045JZ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 961.892, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, 255, 0, 0, 0, 0, 0, 1),
(46, 435, 1, 0, 0, 1623.93, -2174.79, 14.2085, 0.769584, 0, 0, 1, 0, 80, 0, 0, 'Hubert Alves', 'TR046UY', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 558, 1, 119, 119, 1739.7, -1595.65, 13.0109, 253.414, 0, 0, 0, 0, 99, 0, 0, 'Hubert Alves', 'UR047CV', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 558, 1, 0, 0, 1706.56, -1497.07, 13.3828, 179.336, 0, 0, 1, 0, 100, 0, 0, 'Hubert Alves', 'UR048EJ', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|', 0, '', 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rp_vehicle_models`
--

CREATE TABLE `rp_vehicle_models` (
  `id` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `emergency_vehicle` int(11) NOT NULL,
  `donator_vehicle` decimal(8,2) NOT NULL,
  `vehicle_type` int(11) NOT NULL,
  `insurance_price` int(11) NOT NULL,
  `news` tinyint(1) NOT NULL,
  `fuel_interval` smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server`
--

CREATE TABLE `server` (
  `id` int(11) NOT NULL,
  `totalonline` int(11) NOT NULL,
  `recorddia` int(11) NOT NULL,
  `fac_newid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sms`
--

CREATE TABLE `sms` (
  `id` int(11) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL,
  `lido` int(11) DEFAULT NULL,
  `mensagem` varchar(256) DEFAULT NULL,
  `mensageml` varchar(14) DEFAULT NULL,
  `por` int(11) DEFAULT NULL,
  `data` varchar(56) DEFAULT NULL,
  `dono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sms`
--

INSERT INTO `sms` (`id`, `ativo`, `lido`, `mensagem`, `mensageml`, `por`, `data`, `dono`) VALUES
(0, 0, 0, '', '', 0, '', 1),
(1, 0, 0, '', '', 0, '', 1),
(2, 0, 0, '', '', 0, '', 1),
(3, 0, 0, '', '', 0, '', 1),
(4, 0, 0, '', '', 0, '', 1),
(5, 0, 0, '', '', 0, '', 1),
(6, 0, 0, '', '', 0, '', 1),
(7, 0, 0, '', '', 0, '', 1),
(8, 0, 0, '', '', 0, '', 1),
(9, 0, 0, '', '', 0, '', 1),
(10, 0, 0, '', '', 0, '', 1),
(11, 0, 0, '', '', 0, '', 1),
(12, 0, 0, '', '', 0, '', 1),
(13, 0, 0, '', '', 0, '', 1),
(14, 0, 0, '', '', 0, '', 1),
(15, 0, 0, '', '', 0, '', 1),
(16, 0, 0, '', '', 0, '', 1),
(17, 0, 0, '', '', 0, '', 1),
(18, 0, 0, '', '', 0, '', 1),
(19, 0, 0, '', '', 0, '', 1),
(20, 0, 0, '', '', 0, '', 1),
(21, 0, 0, '', '', 0, '', 1),
(22, 0, 0, '', '', 0, '', 1),
(23, 0, 0, '', '', 0, '', 1),
(24, 0, 0, '', '', 0, '', 1),
(25, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(26, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(27, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(28, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(29, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(30, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(31, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(32, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(33, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(34, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(35, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(36, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(37, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(38, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(39, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telpubs`
--

CREATE TABLE `telpubs` (
  `orID` int(11) NOT NULL,
  `orX` float NOT NULL,
  `orY` int(11) NOT NULL,
  `orZ` float NOT NULL,
  `orR` float NOT NULL,
  `orPrefixo` varchar(15) NOT NULL,
  `orNumero` varchar(15) NOT NULL,
  `deletado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `torres`
--

CREATE TABLE `torres` (
  `torID` int(11) NOT NULL,
  `torX` float NOT NULL,
  `torY` float NOT NULL,
  `torZ` float NOT NULL,
  `torR` float NOT NULL,
  `torSinal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `torres`
--

INSERT INTO `torres` (`torID`, `torX`, `torY`, `torZ`, `torR`, `torSinal`) VALUES
(1, 2519.9, -1502.32, -16.3599, 0, 1000000),
(2, 2170.98, -1745.98, -31.4924, 0, 1000000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ucp_aplic`
--

CREATE TABLE `ucp_aplic` (
  `appID` int(11) NOT NULL,
  `avaliado` int(11) NOT NULL,
  `def_rol` text NOT NULL,
  `def_mg` text NOT NULL,
  `def_matar` text NOT NULL,
  `def_fear` text NOT NULL,
  `def_ioc` text NOT NULL,
  `histpers` text NOT NULL,
  `Charname` varchar(24) NOT NULL,
  `Skin` int(11) NOT NULL,
  `Gender` int(11) NOT NULL,
  `Birthdate` varchar(255) NOT NULL,
  `Origin` varchar(24) NOT NULL,
  `status` int(11) NOT NULL,
  `CreateDate` int(11) NOT NULL,
  `ucp_user_owner` int(11) NOT NULL,
  `novopers` int(11) NOT NULL,
  `avaliadopor` int(11) NOT NULL,
  `motivo_recusado` text NOT NULL,
  `def_pg` text NOT NULL,
  `char_id` int(11) NOT NULL,
  `enviado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ucp_faq`
--

CREATE TABLE `ucp_faq` (
  `id` int(11) NOT NULL,
  `pergunta` varchar(256) NOT NULL,
  `resposta` text NOT NULL,
  `por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ucp_notific`
--

CREATE TABLE `ucp_notific` (
  `id` int(11) NOT NULL,
  `OwnId` int(11) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `text` varchar(56) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `visto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ucp_tentativas`
--

CREATE TABLE `ucp_tentativas` (
  `id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `ip` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `erros` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ucp_users`
--

CREATE TABLE `ucp_users` (
  `uID` int(11) NOT NULL,
  `uNome` varchar(35) NOT NULL,
  `uSenha` varchar(128) NOT NULL,
  `uEmail` varchar(256) NOT NULL,
  `uAtivo` varchar(256) NOT NULL,
  `uIP` varchar(256) NOT NULL,
  `uRegisterDate` varchar(256) NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `armarios`
--
ALTER TABLE `armarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `a_ajailrecord`
--
ALTER TABLE `a_ajailrecord`
  ADD PRIMARY KEY (`ajailrec`);

--
-- Indexes for table `a_banrecord`
--
ALTER TABLE `a_banrecord`
  ADD PRIMARY KEY (`banrec`);

--
-- Indexes for table `a_kickrec`
--
ALTER TABLE `a_kickrec`
  ADD PRIMARY KEY (`kickrec`);

--
-- Indexes for table `cartuxo`
--
ALTER TABLE `cartuxo`
  ADD PRIMARY KEY (`CartuxoID`);

--
-- Indexes for table `casas`
--
ALTER TABLE `casas`
  ADD PRIMARY KEY (`hID`);

--
-- Indexes for table `casas_pc`
--
ALTER TABLE `casas_pc`
  ADD PRIMARY KEY (`hID`);

--
-- Indexes for table `complexos`
--
ALTER TABLE `complexos`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `crimes`
--
ALTER TABLE `crimes`
  ADD PRIMARY KEY (`CriID`);

--
-- Indexes for table `drogas`
--
ALTER TABLE `drogas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `droparmas`
--
ALTER TABLE `droparmas`
  ADD PRIMARY KEY (`ArmaID`);

--
-- Indexes for table `drop_drug`
--
ALTER TABLE `drop_drug`
  ADD PRIMARY KEY (`dID`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`eID`);

--
-- Indexes for table `faccoes`
--
ALTER TABLE `faccoes`
  ADD PRIMARY KEY (`fID`);

--
-- Indexes for table `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`mID`);

--
-- Indexes for table `garagens`
--
ALTER TABLE `garagens`
  ADD PRIMARY KEY (`hIDa`);

--
-- Indexes for table `governo`
--
ALTER TABLE `governo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grafico`
--
ALTER TABLE `grafico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`iID`);

--
-- Indexes for table `jockeyclub`
--
ALTER TABLE `jockeyclub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jockeyclub_info`
--
ALTER TABLE `jockeyclub_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `last911`
--
ALTER TABLE `last911`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `multas`
--
ALTER TABLE `multas`
  ADD PRIMARY KEY (`mID`);

--
-- Indexes for table `phonebooths`
--
ALTER TABLE `phonebooths`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pixes`
--
ALTER TABLE `pixes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portoes`
--
ALTER TABLE `portoes`
  ADD PRIMARY KEY (`ptID`);

--
-- Indexes for table `pumps`
--
ALTER TABLE `pumps`
  ADD PRIMARY KEY (`pumpID`);

--
-- Indexes for table `recuperacao`
--
ALTER TABLE `recuperacao`
  ADD KEY `utilizador` (`utilizador`,`confirmacao`);

--
-- Indexes for table `refundo`
--
ALTER TABLE `refundo`
  ADD PRIMARY KEY (`rID`);

--
-- Indexes for table `rp_atms`
--
ALTER TABLE `rp_atms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rp_cloja`
--
ALTER TABLE `rp_cloja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rp_cofre`
--
ALTER TABLE `rp_cofre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rp_drogasplant`
--
ALTER TABLE `rp_drogasplant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rp_joias`
--
ALTER TABLE `rp_joias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rp_laboratorio`
--
ALTER TABLE `rp_laboratorio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rp_radio_stations`
--
ALTER TABLE `rp_radio_stations`
  ADD PRIMARY KEY (`radioID`);

--
-- Indexes for table `rp_vehicles`
--
ALTER TABLE `rp_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rp_vehicle_models`
--
ALTER TABLE `rp_vehicle_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telpubs`
--
ALTER TABLE `telpubs`
  ADD PRIMARY KEY (`orID`);

--
-- Indexes for table `torres`
--
ALTER TABLE `torres`
  ADD PRIMARY KEY (`torID`);

--
-- Indexes for table `ucp_aplic`
--
ALTER TABLE `ucp_aplic`
  ADD PRIMARY KEY (`appID`);

--
-- Indexes for table `ucp_faq`
--
ALTER TABLE `ucp_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ucp_notific`
--
ALTER TABLE `ucp_notific`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ucp_tentativas`
--
ALTER TABLE `ucp_tentativas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ucp_users`
--
ALTER TABLE `ucp_users`
  ADD PRIMARY KEY (`uID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `armarios`
--
ALTER TABLE `armarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_ajailrecord`
--
ALTER TABLE `a_ajailrecord`
  MODIFY `ajailrec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `a_banrecord`
--
ALTER TABLE `a_banrecord`
  MODIFY `banrec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `a_kickrec`
--
ALTER TABLE `a_kickrec`
  MODIFY `kickrec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cartuxo`
--
ALTER TABLE `cartuxo`
  MODIFY `CartuxoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `casas`
--
ALTER TABLE `casas`
  MODIFY `hID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT for table `casas_pc`
--
ALTER TABLE `casas_pc`
  MODIFY `hID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complexos`
--
ALTER TABLE `complexos`
  MODIFY `cID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `crimes`
--
ALTER TABLE `crimes`
  MODIFY `CriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drogas`
--
ALTER TABLE `drogas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `droparmas`
--
ALTER TABLE `droparmas`
  MODIFY `ArmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drop_drug`
--
ALTER TABLE `drop_drug`
  MODIFY `dID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `eID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `faccoes`
--
ALTER TABLE `faccoes`
  MODIFY `fID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `furniture`
--
ALTER TABLE `furniture`
  MODIFY `mID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `garagens`
--
ALTER TABLE `garagens`
  MODIFY `hIDa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `governo`
--
ALTER TABLE `governo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grafico`
--
ALTER TABLE `grafico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `itens`
--
ALTER TABLE `itens`
  MODIFY `iID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jockeyclub`
--
ALTER TABLE `jockeyclub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jockeyclub_info`
--
ALTER TABLE `jockeyclub_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `last911`
--
ALTER TABLE `last911`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `multas`
--
ALTER TABLE `multas`
  MODIFY `mID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phonebooths`
--
ALTER TABLE `phonebooths`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pixes`
--
ALTER TABLE `pixes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `portoes`
--
ALTER TABLE `portoes`
  MODIFY `ptID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pumps`
--
ALTER TABLE `pumps`
  MODIFY `pumpID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `refundo`
--
ALTER TABLE `refundo`
  MODIFY `rID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rp_atms`
--
ALTER TABLE `rp_atms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rp_cloja`
--
ALTER TABLE `rp_cloja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rp_cofre`
--
ALTER TABLE `rp_cofre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rp_drogasplant`
--
ALTER TABLE `rp_drogasplant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rp_joias`
--
ALTER TABLE `rp_joias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rp_laboratorio`
--
ALTER TABLE `rp_laboratorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rp_radio_stations`
--
ALTER TABLE `rp_radio_stations`
  MODIFY `radioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rp_vehicles`
--
ALTER TABLE `rp_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `rp_vehicle_models`
--
ALTER TABLE `rp_vehicle_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server`
--
ALTER TABLE `server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telpubs`
--
ALTER TABLE `telpubs`
  MODIFY `orID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `torres`
--
ALTER TABLE `torres`
  MODIFY `torID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ucp_aplic`
--
ALTER TABLE `ucp_aplic`
  MODIFY `appID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ucp_faq`
--
ALTER TABLE `ucp_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ucp_notific`
--
ALTER TABLE `ucp_notific`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ucp_tentativas`
--
ALTER TABLE `ucp_tentativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ucp_users`
--
ALTER TABLE `ucp_users`
  MODIFY `uID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
