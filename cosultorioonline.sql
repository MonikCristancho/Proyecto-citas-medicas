-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2021 a las 22:32:45
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cosultorioonline`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `identificacionAdministradorPK` int(11) NOT NULL,
  `nombreAdministrador` varchar(50) NOT NULL,
  `apellidoAdministrador` varchar(50) NOT NULL,
  `celularAdministrador` bigint(20) NOT NULL,
  `contraseñaAdministrador` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `idMedicoPK` int(11) NOT NULL,
  `fechaCita` date NOT NULL,
  `horaCita` time NOT NULL,
  `epsCita` varchar(50) NOT NULL,
  `ipsMedico` varchar(50) NOT NULL,
  `nombremedico` varchar(50) NOT NULL,
  `apellidomedico` varchar(50) NOT NULL,
  `identificacionMedicoFK` int(11) DEFAULT NULL,
  `identificacionAdministradorFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendapersona`
--

CREATE TABLE `agendapersona` (
  `idMedicoFK` int(11) DEFAULT NULL,
  `DocumentoFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `identificacionMedicoPK` int(11) NOT NULL,
  `nombreMedico` varchar(50) NOT NULL,
  `apellidoMedico` varchar(50) NOT NULL,
  `celularMedico` bigint(20) NOT NULL,
  `ciudadMedico` varchar(50) NOT NULL,
  `ipsMedico` varchar(50) NOT NULL,
  `epsMedico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `DocumentoPK` int(11) NOT NULL,
  `nombrePersona` varchar(50) NOT NULL,
  `apellidoPersona` varchar(50) NOT NULL,
  `telefonoFijo` int(11) DEFAULT NULL,
  `celularPersona` bigint(20) NOT NULL,
  `edad` tinyint(4) NOT NULL,
  `contrasenaPersona` varchar(50) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `ciudadpersona` varchar(50) NOT NULL,
  `barrio` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `correoElectronico` varchar(50) NOT NULL,
  `espPersona` varchar(50) NOT NULL,
  `ipsPersona` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`identificacionAdministradorPK`),
  ADD UNIQUE KEY `celularAdministrador` (`celularAdministrador`),
  ADD UNIQUE KEY `contraseñaAdministrador` (`contraseñaAdministrador`);

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`idMedicoPK`),
  ADD KEY `identificacionAdministradorFK` (`identificacionAdministradorFK`),
  ADD KEY `identificacionMedicoFK` (`identificacionMedicoFK`);

--
-- Indices de la tabla `agendapersona`
--
ALTER TABLE `agendapersona`
  ADD KEY `idMedicoFK` (`idMedicoFK`),
  ADD KEY `DocumentoFK` (`DocumentoFK`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`identificacionMedicoPK`),
  ADD UNIQUE KEY `celularMedico` (`celularMedico`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`DocumentoPK`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`identificacionAdministradorFK`) REFERENCES `administrador` (`identificacionAdministradorPK`),
  ADD CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`identificacionMedicoFK`) REFERENCES `medico` (`identificacionMedicoPK`);

--
-- Filtros para la tabla `agendapersona`
--
ALTER TABLE `agendapersona`
  ADD CONSTRAINT `agendapersona_ibfk_1` FOREIGN KEY (`idMedicoFK`) REFERENCES `agenda` (`idMedicoPK`),
  ADD CONSTRAINT `agendapersona_ibfk_2` FOREIGN KEY (`DocumentoFK`) REFERENCES `persona` (`DocumentoPK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
