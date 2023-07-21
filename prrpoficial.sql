-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10-Jun-2023 às 17:26
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
-- Database: `prrpoficial`
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
  `Bronze` int(11) DEFAULT NULL,
  `dog` int(11) NOT NULL,
  `minat` int(11) NOT NULL,
  `ColeteBomba` int(11) NOT NULL,
  `Morteiro` int(11) DEFAULT NULL,
  `KitMedico` int(11) DEFAULT NULL,
  `Peixes` int(11) DEFAULT NULL,
  `PetName` text NOT NULL,
  `MunBzk` int(11) DEFAULT NULL,
  `pArmBzk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`ID`, `Username`, `Password`, `Level`, `Gender`, `Age`, `Admin`, `Skin`, `pLutaStyle`, `PosX`, `PosY`, `PosZ`, `PosA`, `registrado`, `Health`, `Armour`, `Interior`, `World`, `Tutorial`, `EntrouCasa`, `Grana`, `Morto`, `pAlgemado`, `UltimoLogin`, `EntrouComplexo`, `EntrouEmpresa`, `Celular`, `ChaveEmprestada`, `Job`, `PecasMecanicas0`, `PecasMecanicas1`, `PecasMecanicas2`, `PecasMecanicas3`, `PecasMecanicas4`, `PecasMecanicas5`, `PecasMecanicas6`, `Fac`, `TempoPLD`, `ToolKit`, `ArrombarDNV`, `Galao`, `ArmaMao`, `Mun9mm`, `Mun556`, `MunCart`, `Mun127`, `pSlot1`, `pSlot2`, `pSlot3`, `pSlot4`, `pSlot5`, `pSlot1a`, `pSlot2a`, `pSlot3a`, `pSlot4a`, `pSlot5a`, `FacCargo`, `pEmServico`, `pPayDay`, `pDutySkin`, `pColde`, `pColdreA`, `pArmario1`, `pArmario2`, `pArmario3`, `pArmario4`, `pArmario5`, `pArm9mm`, `pArm556`, `pArmCart`, `pArm127`, `pPrisao`, `pTemPreso`, `CelularL`, `pTester`, `pAceitoSos`, `pNomeOOC`, `pDamage0`, `pDamage1`, `pDamage2`, `pDamage3`, `pDamage4`, `pDamage5`, `pDamage6`, `pDamage7`, `pDamage8`, `pDamage9`, `pDamage10`, `pDamage11`, `pDamage12`, `pDamage13`, `pDamage14`, `pDamage15`, `pDamage16`, `pDamage17`, `pDamage18`, `pDamage19`, `pBanco`, `pMancando`, `pHealthMax`, `pChatStyle`, `pPontos`, `pKickAll`, `pBanAll`, `pBanido`, `pWalkStyle`, `pDoador`, `pChangeNames`, `pDoadorTempo`, `pForca`, `pRadio`, `pRadioChan`, `pMascara`, `pMascaraU`, `pMascID`, `pNomeP`, `pAvisos`, `pAviso1`, `pAviso2`, `pAviso3`, `pMenosDanoTiro`, `pDrogaTime`, `pFome`, `pTremorAtirar`, `pUsouDroga`, `pSkillTiro`, `pSavings`, `pColdreX`, `pColdreY`, `pColdreZ`, `pColdreRX`, `pColdreRY`, `pColdreRZ`, `pColdreBone`, `pDriveLic`, `pWepLic`, `pFlyLic`, `pTruckLic`, `pSavingsGerando`, `pBoombox`, `pCigarros`, `pLogado`, `pCasasDeletadas`, `pJobTempo`, `pPlacas`, `pArrombarDNV_C`, `pRaspador`, `pJobInPd`, `pHabDrug`, `pCelularModel`, `pArmasResetadas`, `pEntrouGaragem`, `CelularRing`, `CelularPlano`, `CelularTPlano`, `CelMinutos`, `CelSMSs`, `CelTotalPD`, `AjudaInicial`, `pTomouAlgumTiro`, `pTomouTiroPesado`, `pTomouTiroBrancas`, `pConvenio`, `pTempoMorto`, `desmanx`, `desmany`, `desmanz`, `desmanr`, `tempodesman`, `pAjudaInicialDim`, `pSalarios`, `Birthdate`, `Origin`, `CreateDate`, `pExecComando`, `pRadioChan2`, `Etnia`, `Peso`, `Altura`, `Olhos`, `Cabelo`, `Fome`, `Sede`, `FactionTeam`, `BanTeam`, `RefundTeam`, `PropertyTeam`, `ucpOwn`, `Bomba`, `TNT`, `C4`, `trafico`, `FabricouDroga`, `CortaRem`, `GranaSuja`, `lavar`, `lavax`, `lavay`, `lavaz`, `pArmario6`, `pArmario7`, `pArmario8`, `pArmario9`, `pArmario10`, `baterias`, `bateria`, `Ouro`, `Prata`, `Bronze`, `dog`, `minat`, `ColeteBomba`, `Morteiro`, `KitMedico`, `Peixes`, `PetName`, `MunBzk`, `pArmBzk`) VALUES
(1, 'Yuri_Braga', 'BDA64281CB3260DC7F7C9F186DEBA2CDA136CA8840CD40830772158D1335D21548AD5CB80E26E59BF33BA62465A469F5A68D0B8F42B38462B2B2750D425F9117', 7, 1, 0, 3002, 20109, 4, 308.878, 2438.76, 16.5078, 83.5296, 1, 100, 57, 0, 0, 1, -1, 14665, 0, 0, '7-6-2023 - 17:31:46', -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 5, 0, 4860, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 1, 20, 20113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'YurS', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', 31899, NULL, 100, 0, 3, 0, 0, 0, 8, 0, 10, 0, 0, 0, 0, 0, 0, 0, 'Yuri_Braga', 0, '', 'NULL', NULL, 0, 0, NULL, 0, 0, 6000, 0, 0.098099, 0.280097, -0.146999, 177.2, 177, -4.2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 100, 100, 0, 0, 0, 0, NULL, 0, 5, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 20073, 100, 100, 86, 100, 0, '0', 0, 0),
(2, 'Chris_Kyle', '80ED4128F485D7A3A7C32D743EEA66B2B4FF043912A029FD9AB420586363BCDEF13FED3996DA502394437745994657E738759FE679DF08D609C0CE7930CBBE82', 3, 1, 0, 3002, 2, 4, -730.17, 1540.93, 39.5751, 340.437, 1, 100, 0, 0, 0, 1, -1, 1200, 0, 0, '23-5-2023 - 15:31:37', -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hoyo', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', 5171, NULL, 100, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chris_Kyle', 0, '', 'NULL', NULL, 0, 0, NULL, 0, 0, 6000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 625, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 100, 100, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 100, 99, 100, 100, NULL, '', NULL, 0),
(3, 'Gabriel_Monteiro', '80ED4128F485D7A3A7C32D743EEA66B2B4FF043912A029FD9AB420586363BCDEF13FED3996DA502394437745994657E738759FE679DF08D609C0CE7930CBBE82', 0, 1, 0, 3002, 287, 4, 266.562, 2458.74, 22.4877, 201.23, 1, 100, 0, 0, 0, 1, -1, 1200, 0, 0, '4-6-2023 - 23:56:49', -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 3415, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'meupau', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', 5000, NULL, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gabriel_Monteiro', 0, '', 'NULL', NULL, 0, 0, NULL, 0, 0, 6000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 100, 100, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 100, 100, 100, 100, 0, '0', 0, 0),
(4, 'Mac_Miller', '789D02D21A891291E01C9E6C8F72C51343ADCBA09EE4CBD5385E01D46A93FE51F9F461117877591A796974FD4CCBFD5CF3D35DA649080534FDF88EFB348CB060', 0, 1, 0, 3002, 14, 4, 324.496, 2400.67, 16.5156, 0, 1, 20, 0, 0, 0, 1, -1, 1200, 1, 1, '4-6-2023 - 23:56:11', -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 4747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 1, 19, 20115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Salseiro', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', 5000, NULL, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mac_Miller', 0, '', 'NULL', NULL, 0, 0, NULL, 0, 0, 6000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 100, 100, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0);

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
(0, 'Contato_1', 0, 1),
(1, 'Contato_2', 0, 1),
(2, 'Contato_3', 0, 1),
(3, 'Contato_4', 0, 1),
(4, 'Contato_5', 0, 1),
(5, 'Contato_6', 0, 1),
(6, 'Contato_7', 0, 1),
(7, 'Contato_8', 0, 1),
(8, 'Contato_9', 0, 1),
(9, 'Contato_10', 0, 1),
(10, 'Contato_11', 0, 1),
(11, 'Contato_12', 0, 1),
(12, 'Contato_13', 0, 1),
(13, 'Contato_14', 0, 1),
(14, 'Contato_15', 0, 1),
(15, 'Contato_16', 0, 1),
(16, 'Contato_17', 0, 1),
(17, 'Contato_18', 0, 1),
(18, 'Contato_19', 0, 1),
(19, 'Contato_20', 0, 1),
(20, 'Contato_21', 0, 1),
(21, 'Contato_22', 0, 1),
(22, 'Contato_23', 0, 1),
(23, 'Contato_24', 0, 1),
(24, 'Contato_25', 0, 1),
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
(39, 'Contato_40', NULL, 1),
(0, 'Contato_1', 0, 2),
(1, 'Contato_2', 0, 2),
(2, 'Contato_3', 0, 2),
(3, 'Contato_4', 0, 2),
(4, 'Contato_5', 0, 2),
(5, 'Contato_6', 0, 2),
(6, 'Contato_7', 0, 2),
(7, 'Contato_8', 0, 2),
(8, 'Contato_9', 0, 2),
(9, 'Contato_10', 0, 2),
(10, 'Contato_11', 0, 2),
(11, 'Contato_12', 0, 2),
(12, 'Contato_13', 0, 2),
(13, 'Contato_14', 0, 2),
(14, 'Contato_15', 0, 2),
(15, 'Contato_16', 0, 2),
(16, 'Contato_17', 0, 2),
(17, 'Contato_18', 0, 2),
(18, 'Contato_19', 0, 2),
(19, 'Contato_20', 0, 2),
(20, 'Contato_21', 0, 2),
(21, 'Contato_22', 0, 2),
(22, 'Contato_23', 0, 2),
(23, 'Contato_24', 0, 2),
(24, 'Contato_25', 0, 2),
(25, 'Contato_26', NULL, 2),
(26, 'Contato_27', NULL, 2),
(27, 'Contato_28', NULL, 2),
(28, 'Contato_29', NULL, 2),
(29, 'Contato_30', NULL, 2),
(30, 'Contato_31', NULL, 2),
(31, 'Contato_32', NULL, 2),
(32, 'Contato_33', NULL, 2),
(33, 'Contato_34', NULL, 2),
(34, 'Contato_35', NULL, 2),
(35, 'Contato_36', NULL, 2),
(36, 'Contato_37', NULL, 2),
(37, 'Contato_38', NULL, 2),
(38, 'Contato_39', NULL, 2),
(39, 'Contato_40', NULL, 2),
(0, 'Contato_1', 0, 3),
(1, 'Contato_2', 0, 3),
(2, 'Contato_3', 0, 3),
(3, 'Contato_4', 0, 3),
(4, 'Contato_5', 0, 3),
(5, 'Contato_6', 0, 3),
(6, 'Contato_7', 0, 3),
(7, 'Contato_8', 0, 3),
(8, 'Contato_9', 0, 3),
(9, 'Contato_10', 0, 3),
(10, 'Contato_11', 0, 3),
(11, 'Contato_12', 0, 3),
(12, 'Contato_13', 0, 3),
(13, 'Contato_14', 0, 3),
(14, 'Contato_15', 0, 3),
(15, 'Contato_16', 0, 3),
(16, 'Contato_17', 0, 3),
(17, 'Contato_18', 0, 3),
(18, 'Contato_19', 0, 3),
(19, 'Contato_20', 0, 3),
(20, 'Contato_21', 0, 3),
(21, 'Contato_22', 0, 3),
(22, 'Contato_23', 0, 3),
(23, 'Contato_24', 0, 3),
(24, 'Contato_25', 0, 3),
(25, 'Contato_26', NULL, 3),
(26, 'Contato_27', NULL, 3),
(27, 'Contato_28', NULL, 3),
(28, 'Contato_29', NULL, 3),
(29, 'Contato_30', NULL, 3),
(30, 'Contato_31', NULL, 3),
(31, 'Contato_32', NULL, 3),
(32, 'Contato_33', NULL, 3),
(33, 'Contato_34', NULL, 3),
(34, 'Contato_35', NULL, 3),
(35, 'Contato_36', NULL, 3),
(36, 'Contato_37', NULL, 3),
(37, 'Contato_38', NULL, 3),
(38, 'Contato_39', NULL, 3),
(39, 'Contato_40', NULL, 3),
(0, 'Contato_1', 0, 4),
(1, 'Contato_2', 0, 4),
(2, 'Contato_3', 0, 4),
(3, 'Contato_4', 0, 4),
(4, 'Contato_5', 0, 4),
(5, 'Contato_6', 0, 4),
(6, 'Contato_7', 0, 4),
(7, 'Contato_8', 0, 4),
(8, 'Contato_9', 0, 4),
(9, 'Contato_10', 0, 4),
(10, 'Contato_11', 0, 4),
(11, 'Contato_12', 0, 4),
(12, 'Contato_13', 0, 4),
(13, 'Contato_14', 0, 4),
(14, 'Contato_15', 0, 4),
(15, 'Contato_16', 0, 4),
(16, 'Contato_17', 0, 4),
(17, 'Contato_18', 0, 4),
(18, 'Contato_19', 0, 4),
(19, 'Contato_20', 0, 4),
(20, 'Contato_21', 0, 4),
(21, 'Contato_22', 0, 4),
(22, 'Contato_23', 0, 4),
(23, 'Contato_24', 0, 4),
(24, 'Contato_25', 0, 4),
(25, 'Contato_26', NULL, 4),
(26, 'Contato_27', NULL, 4),
(27, 'Contato_28', NULL, 4),
(28, 'Contato_29', NULL, 4),
(29, 'Contato_30', NULL, 4),
(30, 'Contato_31', NULL, 4),
(31, 'Contato_32', NULL, 4),
(32, 'Contato_33', NULL, 4),
(33, 'Contato_34', NULL, 4),
(34, 'Contato_35', NULL, 4),
(35, 'Contato_36', NULL, 4),
(36, 'Contato_37', NULL, 4),
(37, 'Contato_38', NULL, 4),
(38, 'Contato_39', NULL, 4),
(39, 'Contato_40', NULL, 4);

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
('Yuri_Braga', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, 1, 0, 0, 0, 0),
('Chris_Kyle', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2, 2, 0, 0, 0, 0),
('Mac_Miller', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 3, 4, 0, 0, 0, 0),
('Gabriel_Monteiro', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 4, 3, 0, 0, 0, 0);

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
(1, 1, 'Yuri Braga', '19-5-2023 - 16:47:53', 91394070, 31, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(2, 3, 'Yuri Braga', '4-6-2023 - 22:49:07', 18152030, 31, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(3, 4, 'Yuri Braga', '4-6-2023 - 23:32:39', 28569667, 31, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(4, 2, 'Chris Kyle', '23-5-2023 - 13:52:01', 39565154, 31, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(5, 1, 'Yuri Braga', '4-6-2023 - 23:00:09', 54169511, 31, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

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
(1, 1, 'USMC', 1, 'CFAP', 'Soldado 2Ã‚ÂªCl PM', 'Soldado 1Ã‚ÂªCl PM', 'Cabo PM', '3Ã‚ÂºSargento PM', '2Ã‚ÂºSargento PM', '1Ã‚ÂºSargento PM', 'SubTenente PM', 'Aspirante a Oficial PM', '2Ã‚ÂºTenente PM', '1Ã‚ÂºTenente PM', 'CapitÃƒÂ£o PM', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1535.51, -1644.62, 777.502, 0),
(2, 1, 'SEALS', 2, 'Green Team I', 'Green Team II', 'Green Team III', 'Petty Officer T.Class', 'Petty Officer S.Class', 'Master Chief P.Officer', 'Petty Officer S.Class', 'Senior Chief P.Officer', 'Master Chief P.Officer', 'Lieutenant', 'Lieutenant Commander', 'Commander', 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, -845.292, 1507.2, 19.6269, 0),
(3, 1, 'Medics', 3, 'Aluno Soldado', 'Soldado', 'Cabo', '3Ã‚Âº Sargento', '2Ã‚Âº Sargento', '1Ã‚Âº Sargento', 'Cadete', 'Aspirante a Oficial', '2Ã‚Âº Tenente', '1Ã‚Âº Tenente', 'CapitÃƒÂ£o', 'Major', 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 959.236, -1444.91, 13.525, 0),
(4, 1, 'US GOV', 4, 'FuncionÃƒÂ¡rios Pub. Nv.', 'FuncionÃƒÂ¡rios Pub. Nv.', 'FuncionÃƒÂ¡rios Pub. Nv.', 'FuncionÃƒÂ¡rios Publicos', 'FuncionÃƒÂ¡rios Publicos', 'FuncionÃƒÂ¡rios Publicos', 'Diretores Setoriais Mun', 'Vice-SecretÃƒÂ¡rio Munic', 'SecretÃƒÂ¡rio Municipal', 'Assessor', 'Vice-Prefeito', 'Prefeito', 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0);

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
(1, 24929818, 'Carlos_Marshal', 22, 23, '400|500|600|700|800|900|0|0|0|0|0|0', '900|1000|1100|1200|1300|1400|1500|1600|1700|1800|1900|2500', '900|1000|1100|1200|1300|1400|1500|1600|1700|1800|1900|2500', 300, 80, 102, '400|500|600|700|800|900|1000|1100|1200|1300|1400|1500', '400|500|600|700|800|900|1000|1100|1200|1300|1400|1500', '400|500|600|700|800|900|1000|1100|1200|1300|1400|1500', '400|500|600|700|800|900|1000|1100|1200|1300|1400|1500');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grafico`
--

CREATE TABLE `grafico` (
  `id` int(11) NOT NULL,
  `nome` varchar(126) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`iID`, `iCriado`, `iObj`, `iCom`, `iNome`, `iX`, `iY`, `iZ`, `iRX`, `iRY`, `iRZ`, `iSX`, `iSY`, `iSZ`, `iDrop`, `iWorld`, `iInt`, `iUsando`, `iTipo`, `iBone`) VALUES
(1, 1, -2302, 1, 'Oculos', 0.0599, 0.0259, 0.0019, 0, 98.9, 97.6999, 1, 1, 1, 0, 0, 0, 1, 1, 2),
(2, 1, -2304, 1, 'Mascara', 0.3139, -0.0159, 0, 0, 86, 87.9999, 1, 1, 1, 0, 0, 0, 1, 3, 1);

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
(2, 'Ultra-RÃƒÆ’Ã‚Â¡pido', 118, 767, 885),
(3, 'PÃƒÆ’Ã‚Â© de Pano', 290, 607, 897),
(4, 'Holy Legal', 173, 735, 908),
(5, 'COWBOY', 169, 698, 867),
(6, 'Bala no Alvo', 324, 587, 911),
(7, 'Kiss me now', 162, 741, 903),
(8, 'Esfinge', 290, 587, 877),
(9, 'TupÃƒÆ’Ã‚Â£ Sky', 197, 729, 926),
(10, 'JosÃƒÆ’Ã‚Â© Cuervo', 177, 729, 906),
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
(39, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(0, 0, 0, '', '', 0, '', 2),
(1, 0, 0, '', '', 0, '', 2),
(2, 0, 0, '', '', 0, '', 2),
(3, 0, 0, '', '', 0, '', 2),
(4, 0, 0, '', '', 0, '', 2),
(5, 0, 0, '', '', 0, '', 2),
(6, 0, 0, '', '', 0, '', 2),
(7, 0, 0, '', '', 0, '', 2),
(8, 0, 0, '', '', 0, '', 2),
(9, 0, 0, '', '', 0, '', 2),
(10, 0, 0, '', '', 0, '', 2),
(11, 0, 0, '', '', 0, '', 2),
(12, 0, 0, '', '', 0, '', 2),
(13, 0, 0, '', '', 0, '', 2),
(14, 0, 0, '', '', 0, '', 2),
(15, 0, 0, '', '', 0, '', 2),
(16, 0, 0, '', '', 0, '', 2),
(17, 0, 0, '', '', 0, '', 2),
(18, 0, 0, '', '', 0, '', 2),
(19, 0, 0, '', '', 0, '', 2),
(20, 0, 0, '', '', 0, '', 2),
(21, 0, 0, '', '', 0, '', 2),
(22, 0, 0, '', '', 0, '', 2),
(23, 0, 0, '', '', 0, '', 2),
(24, 0, 0, '', '', 0, '', 2),
(25, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(26, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(27, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(28, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(29, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(30, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(31, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(32, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(33, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(34, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(35, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(36, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(37, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(38, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(39, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(0, 0, 0, '', '', 0, '', 3),
(1, 0, 0, '', '', 0, '', 3),
(2, 0, 0, '', '', 0, '', 3),
(3, 0, 0, '', '', 0, '', 3),
(4, 0, 0, '', '', 0, '', 3),
(5, 0, 0, '', '', 0, '', 3),
(6, 0, 0, '', '', 0, '', 3),
(7, 0, 0, '', '', 0, '', 3),
(8, 0, 0, '', '', 0, '', 3),
(9, 0, 0, '', '', 0, '', 3),
(10, 0, 0, '', '', 0, '', 3),
(11, 0, 0, '', '', 0, '', 3),
(12, 0, 0, '', '', 0, '', 3),
(13, 0, 0, '', '', 0, '', 3),
(14, 0, 0, '', '', 0, '', 3),
(15, 0, 0, '', '', 0, '', 3),
(16, 0, 0, '', '', 0, '', 3),
(17, 0, 0, '', '', 0, '', 3),
(18, 0, 0, '', '', 0, '', 3),
(19, 0, 0, '', '', 0, '', 3),
(20, 0, 0, '', '', 0, '', 3),
(21, 0, 0, '', '', 0, '', 3),
(22, 0, 0, '', '', 0, '', 3),
(23, 0, 0, '', '', 0, '', 3),
(24, 0, 0, '', '', 0, '', 3),
(25, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(26, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(27, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(28, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(29, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(30, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(31, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(32, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(33, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(34, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(35, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(36, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(37, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(38, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(39, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(0, 0, 0, '', '', 0, '', 4),
(1, 0, 0, '', '', 0, '', 4),
(2, 0, 0, '', '', 0, '', 4),
(3, 0, 0, '', '', 0, '', 4),
(4, 0, 0, '', '', 0, '', 4),
(5, 0, 0, '', '', 0, '', 4),
(6, 0, 0, '', '', 0, '', 4),
(7, 0, 0, '', '', 0, '', 4),
(8, 0, 0, '', '', 0, '', 4),
(9, 0, 0, '', '', 0, '', 4),
(10, 0, 0, '', '', 0, '', 4),
(11, 0, 0, '', '', 0, '', 4),
(12, 0, 0, '', '', 0, '', 4),
(13, 0, 0, '', '', 0, '', 4),
(14, 0, 0, '', '', 0, '', 4),
(15, 0, 0, '', '', 0, '', 4),
(16, 0, 0, '', '', 0, '', 4),
(17, 0, 0, '', '', 0, '', 4),
(18, 0, 0, '', '', 0, '', 4),
(19, 0, 0, '', '', 0, '', 4),
(20, 0, 0, '', '', 0, '', 4),
(21, 0, 0, '', '', 0, '', 4),
(22, 0, 0, '', '', 0, '', 4),
(23, 0, 0, '', '', 0, '', 4),
(24, 0, 0, '', '', 0, '', 4),
(25, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(26, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(27, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(28, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(29, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(30, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(31, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(32, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(33, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(34, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(35, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(36, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(37, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(38, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(39, NULL, NULL, NULL, NULL, NULL, NULL, 4);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `armarios`
--
ALTER TABLE `armarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_ajailrecord`
--
ALTER TABLE `a_ajailrecord`
  MODIFY `ajailrec` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_banrecord`
--
ALTER TABLE `a_banrecord`
  MODIFY `banrec` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_kickrec`
--
ALTER TABLE `a_kickrec`
  MODIFY `kickrec` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cartuxo`
--
ALTER TABLE `cartuxo`
  MODIFY `CartuxoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casas`
--
ALTER TABLE `casas`
  MODIFY `hID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casas_pc`
--
ALTER TABLE `casas_pc`
  MODIFY `hID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complexos`
--
ALTER TABLE `complexos`
  MODIFY `cID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crimes`
--
ALTER TABLE `crimes`
  MODIFY `CriID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drogas`
--
ALTER TABLE `drogas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `droparmas`
--
ALTER TABLE `droparmas`
  MODIFY `ArmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `drop_drug`
--
ALTER TABLE `drop_drug`
  MODIFY `dID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `eID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faccoes`
--
ALTER TABLE `faccoes`
  MODIFY `fID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `furniture`
--
ALTER TABLE `furniture`
  MODIFY `mID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `garagens`
--
ALTER TABLE `garagens`
  MODIFY `hIDa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `governo`
--
ALTER TABLE `governo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grafico`
--
ALTER TABLE `grafico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itens`
--
ALTER TABLE `itens`
  MODIFY `iID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `multas`
--
ALTER TABLE `multas`
  MODIFY `mID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phonebooths`
--
ALTER TABLE `phonebooths`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pixes`
--
ALTER TABLE `pixes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portoes`
--
ALTER TABLE `portoes`
  MODIFY `ptID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pumps`
--
ALTER TABLE `pumps`
  MODIFY `pumpID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refundo`
--
ALTER TABLE `refundo`
  MODIFY `rID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rp_atms`
--
ALTER TABLE `rp_atms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rp_cloja`
--
ALTER TABLE `rp_cloja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rp_cofre`
--
ALTER TABLE `rp_cofre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `torID` int(11) NOT NULL AUTO_INCREMENT;

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
