-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2025 a las 20:23:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasio`
--
CREATE DATABASE IF NOT EXISTS `gimnasio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `gimnasio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `dificultad` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `titulo`, `descripcion`, `tipo`, `dificultad`) VALUES
(1, 'Caminata matutina', 'Caminar 30 minutos a paso ligero', 'Cardio', 'Baja'),
(2, 'Entrenamiento HIIT', 'Ejercicio de alta intensidad durante 20 minutos', 'Cardio', 'Alta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progreso`
--

CREATE TABLE `progreso` (
  `id` int(11) NOT NULL,
  `usuario_dni` varchar(9) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `pasos` int(11) DEFAULT NULL,
  `calorias` int(11) DEFAULT NULL,
  `distancia` decimal(10,2) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `progreso`
--

INSERT INTO `progreso` (`id`, `usuario_dni`, `fecha`, `pasos`, `calorias`, `distancia`, `peso`) VALUES
(1, '11111111A', '2025-06-08', 161, 1588, 0.11, 90.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios`
--

CREATE TABLE `recordatorios` (
  `id` int(11) NOT NULL,
  `usuario_dni` varchar(9) DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `recordatorios`
--

INSERT INTO `recordatorios` (`id`, `usuario_dni`, `mensaje`, `fecha_hora`) VALUES
(1, '12345678A', 'Recuerda hacer tu caminata diaria', '2025-04-16 08:00:00'),
(2, '87654321B', 'Sesión de HIIT programada', '2025-04-16 18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencias`
--

CREATE TABLE `sugerencias` (
  `id` int(11) NOT NULL,
  `usuario_dni` varchar(9) DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `sugerencias`
--

INSERT INTO `sugerencias` (`id`, `usuario_dni`, `actividad_id`, `fecha`) VALUES
(1, '12345678A', 1, '2025-04-16'),
(2, '87654321B', 2, '2025-04-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id`, `nombre`, `tipo`, `latitud`, `longitud`) VALUES
(1, 'Parque Central', 'Parque', 40.4168, -3.7038),
(2, 'Gimnasio FitZone', 'Gimnasio', 40.4172, -3.7045);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `objetivo_salud` varchar(50) DEFAULT NULL,
  `nivel_actividad` varchar(50) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`dni`, `nombre`, `apellido`, `edad`, `genero`, `objetivo_salud`, `nivel_actividad`, `contraseña`) VALUES
('11111111A', 'Pedro', 'Gomez', 25, 'Masculino', 'ganar musculo', 'Alta', 'Pedrito1234'),
('12345678A', 'Ana', 'Torres', 30, 'Femenino', 'Bajar de peso', 'Moderado', 'Prueba1234'),
('45236718C', 'gfsdfghdfg', 'dsfgsdfsdf', 23, 'Masculino', 'perder peso', 'Baja', 'Alfredo1234'),
('666777888', 'Xiang', 'Huang', 18, 'Masculino', 'Bajar peso', 'Moderada', 'Pitufina1234'),
('87654321B', 'Carlos', 'Ruiz', 45, 'Masculino', 'Mejorar resistencia', 'Alto', 'Prueba1234'),
('98765432B', 'Hola', 'Hello', 74, 'Binario', 'Bajar Peso', 'Alta', 'Hola'),
('X1234567S', 'asdg', 'dgsd', 23, 'Femenino', 'asfdsagd', 'Baja', 'asfh345'),
('X1234567Z', 'Alfredo', 'Perez', 15, 'Masculino', 'Tener mas resistencia', 'Baja', 'Alfredo1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_dni` (`usuario_dni`,`fecha`);

--
-- Indices de la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_dni` (`usuario_dni`);

--
-- Indices de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_dni` (`usuario_dni`),
  ADD KEY `actividad_id` (`actividad_id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `progreso`
--
ALTER TABLE `progreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD CONSTRAINT `progreso_ibfk_1` FOREIGN KEY (`usuario_dni`) REFERENCES `usuarios` (`dni`);

--
-- Filtros para la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD CONSTRAINT `recordatorios_ibfk_1` FOREIGN KEY (`usuario_dni`) REFERENCES `usuarios` (`dni`);

--
-- Filtros para la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD CONSTRAINT `sugerencias_ibfk_1` FOREIGN KEY (`usuario_dni`) REFERENCES `usuarios` (`dni`),
  ADD CONSTRAINT `sugerencias_ibfk_2` FOREIGN KEY (`actividad_id`) REFERENCES `actividades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
