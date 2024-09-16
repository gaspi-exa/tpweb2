-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2024 a las 23:42:14
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
-- Base de datos: `tpweb2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`_id`, `name`) VALUES
(1, 'Water'),
(2, 'Fire'),
(3, 'Grass'),
(4, 'Electric'),
(5, 'Rock'),
(6, 'Ground'),
(7, 'Flying'),
(8, 'Fighting'),
(9, 'Ice'),
(10, 'Bug'),
(11, 'Poison'),
(12, 'Ghost'),
(13, 'Psychic'),
(14, 'Dragon'),
(15, 'Dark'),
(16, 'Steel'),
(17, 'Fairy'),
(18, 'Normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(300) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon`
--

INSERT INTO `pokemon` (`_id`, `name`, `url`, `category`) VALUES
(1, 'bulbasaur', NULL, 3),
(2, 'ivysaur', NULL, 3),
(3, 'venusaur', NULL, 3),
(4, 'charmander', NULL, 2),
(5, 'charmeleon', NULL, 2),
(6, 'charizard', NULL, 2),
(7, 'squirtle', NULL, 1),
(8, 'wartortle', NULL, 1),
(9, 'blastoise', NULL, 1),
(10, 'caterpie', NULL, 10),
(11, 'metapod', NULL, 10),
(12, 'butterfree', NULL, 10),
(13, 'weedle', NULL, 10),
(14, 'kakuna', NULL, 10),
(15, 'beedrill', NULL, 10),
(16, 'pidgey', NULL, 7),
(17, 'pidgeotto', NULL, 7),
(18, 'pidgeot', NULL, 7),
(19, 'rattata', NULL, 18),
(20, 'raticate', NULL, 18),
(21, 'spearow', NULL, 7),
(22, 'fearow', NULL, 7),
(23, 'ekans', NULL, 11),
(24, 'arbok', NULL, 11),
(25, 'pikachu', 'https://wallpapers-clan.com/wp-content/uploads/2023/11/cute-pokemon-pikachu-rain-desktop-wallpaper-preview.jpg', 4),
(26, 'raichu', NULL, 4),
(27, 'sandshrew', NULL, 6),
(28, 'sandslash', NULL, 6),
(29, 'nidoran-f', NULL, 11),
(30, 'nidorina', NULL, 11),
(31, 'nidoqueen', NULL, 11),
(32, 'nidoran-m', NULL, 11),
(33, 'nidorino', NULL, 11),
(34, 'nidoking', NULL, 11),
(35, 'clefairy', NULL, 17),
(36, 'clefable', NULL, 17),
(37, 'vulpix', NULL, 2),
(38, 'ninetales', NULL, 2),
(39, 'jigglypuff', NULL, 17),
(40, 'wigglytuff', NULL, 17),
(41, 'zubat', NULL, 11),
(42, 'golbat', NULL, 11),
(43, 'oddish', NULL, 3),
(44, 'gloom', NULL, 3),
(45, 'vileplume', NULL, 3),
(46, 'paras', NULL, 10),
(47, 'parasect', NULL, 10),
(48, 'venonat', NULL, 10),
(49, 'venomoth', NULL, 10),
(50, 'diglett', NULL, 6),
(51, 'dugtrio', NULL, 6),
(52, 'meowth', NULL, 18),
(53, 'persian', NULL, 18),
(54, 'psyduck', NULL, 1),
(55, 'golduck', NULL, 1),
(56, 'mankey', NULL, 8),
(57, 'primeape', NULL, 8),
(58, 'growlithe', NULL, 2),
(59, 'arcanine', NULL, 2),
(60, 'poliwag', NULL, 1),
(61, 'poliwhirl', NULL, 1),
(62, 'poliwrath', NULL, 1),
(63, 'abra', NULL, 13),
(64, 'kadabra', NULL, 13),
(65, 'alakazam', NULL, 13),
(66, 'machop', NULL, 8),
(67, 'machoke', NULL, 8),
(68, 'machamp', NULL, 8),
(69, 'bellsprout', NULL, 3),
(70, 'weepinbell', NULL, 3),
(71, 'victreebel', NULL, 3),
(72, 'tentacool', NULL, 11),
(73, 'tentacruel', NULL, 11),
(74, 'geodude', NULL, 5),
(75, 'graveler', NULL, 5),
(76, 'golem', NULL, 5),
(77, 'ponyta', NULL, 2),
(78, 'rapidash', NULL, 2),
(79, 'slowpoke', NULL, 1),
(80, 'slowbro', NULL, 1),
(81, 'magnemite', NULL, 4),
(82, 'magneton', NULL, 4),
(83, 'farfetchd', NULL, 7),
(84, 'doduo', NULL, 7),
(85, 'dodrio', NULL, 7),
(86, 'seel', NULL, 9),
(87, 'dewgong', NULL, 9),
(88, 'grimer', NULL, 11),
(89, 'muk', NULL, 11),
(90, 'shellder', NULL, 9),
(91, 'cloyster', NULL, 9),
(92, 'gastly', NULL, 12),
(93, 'haunter', NULL, 12),
(94, 'gengar', 'https://wallpapers-clan.com/wp-content/uploads/2024/04/pokemon-gengar-cool-red-desktop-wallpaper-preview.jpg', 12),
(95, 'onix', NULL, 5),
(96, 'drowzee', NULL, 13),
(97, 'hypno', NULL, 13),
(98, 'krabby', NULL, 1),
(99, 'kingler', NULL, 1),
(100, 'voltorb', NULL, 4),
(101, 'electrode', NULL, 4),
(102, 'exeggcute', NULL, 3),
(103, 'exeggutor', NULL, 3),
(104, 'cubone', NULL, 6),
(105, 'marowak', NULL, 6),
(106, 'hitmonlee', NULL, 8),
(107, 'hitmonchan', NULL, 8),
(108, 'lickitung', NULL, 18),
(109, 'koffing', NULL, 11),
(110, 'weezing', NULL, 11),
(111, 'rhyhorn', NULL, 5),
(112, 'rhydon', NULL, 5),
(113, 'chansey', NULL, 18),
(114, 'tangela', NULL, 3),
(115, 'kangaskhan', NULL, 18),
(116, 'horsea', NULL, 1),
(117, 'seadra', NULL, 1),
(118, 'goldeen', NULL, 1),
(119, 'seaking', NULL, 1),
(120, 'staryu', NULL, 1),
(121, 'starmie', NULL, 1),
(122, 'mr-mime', NULL, 17),
(123, 'scyther', NULL, 10),
(124, 'jynx', NULL, 9),
(125, 'electabuzz', NULL, 4),
(126, 'magmar', NULL, 2),
(127, 'pinsir', NULL, 10),
(128, 'tauros', NULL, 18),
(129, 'magikarp', NULL, 1),
(130, 'gyarados', NULL, 1),
(131, 'lapras', NULL, 9),
(132, 'ditto', NULL, 18),
(133, 'eevee', NULL, 18),
(134, 'vaporeon', NULL, 1),
(135, 'jolteon', NULL, 4),
(136, 'flareon', NULL, 2),
(137, 'porygon', NULL, 18),
(138, 'omanyte', NULL, 5),
(139, 'omastar', NULL, 5),
(140, 'kabuto', NULL, 5),
(141, 'kabutops', NULL, 5),
(142, 'aerodactyl', NULL, 5),
(143, 'snorlax', NULL, 18),
(144, 'articuno', NULL, 9),
(145, 'zapdos', NULL, 4),
(146, 'moltres', NULL, 2),
(147, 'dratini', NULL, 14),
(148, 'dragonair', NULL, 14),
(149, 'dragonite', NULL, 14),
(150, 'mewtwo', 'https://wallpapers-clan.com/wp-content/uploads/2024/04/aesthetic-pokemon-mewtwo-desktop-wallpaper-preview.jpg', 13),
(151, 'mew', NULL, 13);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`_id`);

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `fk_category` (`category`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `category` (`_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
