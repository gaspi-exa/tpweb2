-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2024 a las 18:58:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category`
--
INSERT INTO
  `category` (`_id`, `name`)
VALUES
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
  `category` int(11) DEFAULT NULL,
  `rarity` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon`
--
INSERT INTO
  `pokemon` (`_id`, `name`, `url`, `category`, `rarity`)
VALUES
  (1, 'bulbasaur', NULL, 3, 2),
  (2, 'ivysaur', NULL, 3, 2),
  (3, 'venusaur', NULL, 3, 3),
  (4, 'charmander', NULL, 2, 2),
  (5, 'charmeleon', NULL, 2, 2),
  (6, 'charizard', NULL, 2, 3),
  (7, 'squirtle', NULL, 1, 5),
  (8, 'wartortle', NULL, 1, 2),
  (9, 'blastoise', NULL, 1, 3),
  (10, 'caterpie', NULL, 10, 1),
  (11, 'metapod', NULL, 10, 1),
  (12, 'butterfree', NULL, 10, 2),
  (13, 'weedle', NULL, 10, 1),
  (14, 'kakuna', NULL, 10, 1),
  (15, 'beedrill', NULL, 10, 2),
  (16, 'pidgey', NULL, 7, 1),
  (17, 'pidgeotto', NULL, 7, 2),
  (18, 'pidgeot', NULL, 7, 3),
  (19, 'rattata', NULL, 18, 1),
  (20, 'raticate', NULL, 18, 1),
  (21, 'spearow', NULL, 7, 1),
  (22, 'fearow', NULL, 7, 2),
  (23, 'ekans', NULL, 11, 2),
  (24, 'arbok', NULL, 11, 2),
  (
    25,
    'pikachu',
    'https://wallpapers-clan.com/wp-content/uploads/2023/11/cute-pokemon-pikachu-rain-desktop-wallpaper-preview.jpg',
    4,
    4
  ),
  (26, 'raichu', NULL, 4, 4),
  (27, 'sandshrew', NULL, 6, 2),
  (28, 'sandslash', NULL, 6, 3),
  (29, 'nidoran-f', NULL, 11, 2),
  (30, 'nidorina', NULL, 11, 2),
  (31, 'nidoqueen', NULL, 11, 3),
  (32, 'nidoran-m', NULL, 11, 2),
  (33, 'nidorino', NULL, 11, 2),
  (34, 'nidoking', NULL, 11, 3),
  (35, 'clefairy', NULL, 17, 2),
  (36, 'clefable', NULL, 17, 3),
  (37, 'vulpix', NULL, 2, 1),
  (38, 'ninetales', NULL, 2, 5),
  (39, 'jigglypuff', NULL, 17, 1),
  (40, 'wigglytuff', NULL, 17, 2),
  (41, 'zubat', NULL, 11, 1),
  (42, 'golbat', NULL, 11, 2),
  (43, 'oddish', NULL, 3, 1),
  (44, 'gloom', NULL, 3, 1),
  (45, 'vileplume', NULL, 3, 4),
  (46, 'paras', NULL, 10, 1),
  (47, 'parasect', NULL, 10, 2),
  (48, 'venonat', NULL, 10, 1),
  (49, 'venomoth', NULL, 10, 2),
  (50, 'diglett', NULL, 6, 1),
  (51, 'dugtrio', NULL, 6, 2),
  (52, 'meowth', NULL, 18, 1),
  (53, 'persian', NULL, 18, 2),
  (54, 'psyduck', NULL, 1, 1),
  (55, 'golduck', NULL, 1, 2),
  (56, 'mankey', NULL, 8, 1),
  (57, 'primeape', NULL, 8, 2),
  (58, 'growlithe', NULL, 2, 2),
  (59, 'arcanine', NULL, 2, 3),
  (60, 'poliwag', NULL, 1, 1),
  (61, 'poliwhirl', NULL, 1, 2),
  (62, 'poliwrath', NULL, 1, 3),
  (63, 'abra', NULL, 13, 2),
  (64, 'kadabra', NULL, 13, 2),
  (65, 'alakazam', NULL, 13, 3),
  (66, 'machop', NULL, 8, 1),
  (67, 'machoke', NULL, 8, 2),
  (68, 'machamp', NULL, 8, 3),
  (69, 'bellsprout', NULL, 3, 1),
  (70, 'weepinbell', NULL, 3, 2),
  (71, 'victreebel', NULL, 3, 3),
  (72, 'tentacool', NULL, 11, 1),
  (73, 'tentacruel', NULL, 11, 2),
  (74, 'geodude', NULL, 5, 1),
  (75, 'graveler', NULL, 5, 2),
  (76, 'golem', NULL, 5, 3),
  (77, 'ponyta', NULL, 2, 2),
  (78, 'rapidash', NULL, 2, 3),
  (79, 'slowpoke', NULL, 1, 1),
  (80, 'slowbro', NULL, 1, 2),
  (81, 'magnemite', NULL, 4, 1),
  (82, 'magneton', NULL, 4, 2),
  (83, 'farfetchd', NULL, 7, 2),
  (84, 'doduo', NULL, 7, 1),
  (85, 'dodrio', NULL, 7, 2),
  (86, 'seel', NULL, 9, 1),
  (87, 'dewgong', NULL, 9, 2),
  (88, 'grimer', NULL, 11, 1),
  (89, 'muk', NULL, 11, 2),
  (90, 'shellder', NULL, 9, 1),
  (91, 'cloyster', NULL, 9, 2),
  (92, 'gastly', NULL, 12, 1),
  (93, 'haunter', NULL, 12, 2),
  (
    94,
    'gengar',
    'https://wallpapers-clan.com/wp-content/uploads/2024/04/pokemon-gengar-cool-red-desktop-wallpaper-preview.jpg',
    12,
    3
  ),
  (95, 'onix', NULL, 5, 2),
  (96, 'drowzee', NULL, 13, 1),
  (97, 'hypno', NULL, 13, 2),
  (98, 'krabby', NULL, 1, 1),
  (99, 'kingler', NULL, 1, 2),
  (100, 'voltorb', NULL, 4, 1),
  (101, 'electrode', NULL, 4, 3),
  (102, 'exeggcute', NULL, 3, 1),
  (103, 'exeggutor', NULL, 3, 2),
  (104, 'cubone', NULL, 6, 1),
  (105, 'marowak', NULL, 6, 2),
  (106, 'hitmonlee', NULL, 8, 2),
  (107, 'hitmonchan', NULL, 8, 2),
  (108, 'lickitung', NULL, 18, 2),
  (109, 'koffing', NULL, 11, 1),
  (110, 'weezing', NULL, 11, 2),
  (111, 'rhyhorn', NULL, 5, 1),
  (112, 'rhydon', NULL, 5, 2),
  (113, 'chansey', NULL, 18, 2),
  (114, 'tangela', NULL, 3, 1),
  (115, 'kangaskhan', NULL, 18, 2),
  (116, 'horsea', NULL, 1, 1),
  (117, 'seadra', NULL, 1, 2),
  (118, 'goldeen', NULL, 1, 1),
  (119, 'seaking', NULL, 1, 2),
  (120, 'staryu', NULL, 1, 1),
  (121, 'starmie', NULL, 1, 2),
  (122, 'mr-mime', NULL, 17, 2),
  (123, 'scyther', NULL, 10, 2),
  (124, 'jynx', NULL, 9, 2),
  (125, 'electabuzz', NULL, 4, 2),
  (126, 'magmar', NULL, 2, 3),
  (127, 'pinsir', NULL, 10, 2),
  (128, 'tauros', NULL, 18, 2),
  (129, 'magikarp', NULL, 1, 1),
  (130, 'gyarados', NULL, 1, 3),
  (131, 'lapras', NULL, 9, 3),
  (132, 'ditto', NULL, 18, 2),
  (133, 'eevee', NULL, 18, 2),
  (134, 'vaporeon', NULL, 1, 3),
  (135, 'jolteon', NULL, 4, 3),
  (136, 'flareon', NULL, 2, 3),
  (137, 'porygon', NULL, 18, 2),
  (138, 'omanyte', NULL, 5, 2),
  (139, 'omastar', NULL, 5, 3),
  (140, 'kabuto', NULL, 5, 2),
  (141, 'kabutops', NULL, 5, 3),
  (142, 'aerodactyl', NULL, 5, 3),
  (143, 'snorlax', NULL, 18, 3),
  (144, 'articuno', NULL, 9, 4),
  (145, 'zapdos', NULL, 4, 4),
  (146, 'moltres', NULL, 2, 4),
  (147, 'dratini', NULL, 14, 2),
  (148, 'dragonair', NULL, 14, 3),
  (149, 'dragonite', NULL, 14, 4),
  (
    150,
    'mewtwo',
    'https://wallpapers-clan.com/wp-content/uploads/2024/04/aesthetic-pokemon-mewtwo-desktop-wallpaper-preview.jpg',
    13,
    5
  ),
  (151, 'mew', NULL, 13, 5);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `rarity`
--
CREATE TABLE `rarity` (
  `_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rarity`
--
INSERT INTO
  `rarity` (`_id`, `description`)
VALUES
  (1, 'Common'),
  (2, 'Uncommon'),
  (3, 'Rare'),
  (4, 'Very rare'),
  (5, 'Legendary');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `user`
--
CREATE TABLE `user` (
  `_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `clearance` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--
INSERT INTO
  `user` (`_id`, `name`, `clearance`, `password`, `email`)
VALUES
  (
    1,
    'Ash Ketchum',
    '5',
    '$2y$10$Ap5w.v7wmRqcFZYPd7J54OCKvNHfHnHjdt2UpyOPeqYm/06Ffsefa',
    ''
  ),
  (
    2,
    'Misty',
    '4',
    '$2y$10$Ap5w.v7wmRqcFZYPd7J54OCKvNHfHnHjdt2UpyOPeqYm/06Ffsefa',
    ''
  ),
  (
    3,
    'Brock',
    '3',
    '$2y$10$PsE5t1kdTGB.Q9teL7gugO6mLc2NgUIt2LBl3IrimQX8f0PipxHme',
    ''
  ),
  (
    4,
    'Ash Ketchum',
    '5',
    '$2y$10$PsE5t1kdTGB.Q9teL7gugO6mLc2NgUIt2LBl3IrimQX8f0PipxHme',
    ''
  ),
  (
    5,
    'Misty',
    '4',
    '$2y$10$PsE5t1kdTGB.Q9teL7gugO6mLc2NgUIt2LBl3IrimQX8f0PipxHme',
    ''
  ),
  (
    6,
    'Brock',
    '3',
    '$2y$10$PsE5t1kdTGB.Q9teL7gugO6mLc2NgUIt2LBl3IrimQX8f0PipxHme',
    ''
  ),
  (
    10,
    'GASPI',
    'admin',
    '$2y$10$PsE5t1kdTGB.Q9teL7gugO6mLc2NgUIt2LBl3IrimQX8f0PipxHme',
    'g@g.com'
  ),
  (
    11,
    'LAUTA',
    'user',
    '$2y$10$Wip8x09nMZ47mGnSh5H4zOEyzu2/kt//SNNgg2Q.Afl3luTj/4Fj.',
    'lauta@lauta.com'
  ),
  (
    0,
    'WEBADMIN',
    'admin',
    '$2y$10$BhO3FxaImeLXH.FZMvuv7OPfflrWbO3NhyirVOoGO0f4eVkOvn/pq',
    'admin@pro.com'
  );

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `user_pokemon`
--
CREATE TABLE `user_pokemon` (
  `user_id` int(11) NOT NULL,
  `pokemon_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_pokemon`
--
INSERT INTO
  `user_pokemon` (`user_id`, `pokemon_id`)
VALUES
  (10, 38),
  (10, 48),
  (11, 28),
  (11, 62),
  (11, 78),
  (10, 0),
  (10, 0),
  (10, 0),
  (11, 70),
  (11, 103),
  (0, 65),
  (0, 73),
  (0, 52),
  (0, 105),
  (11, 110),
  (11, 94),
  (10, 7),
  (11, 87);

--
-- Índices para tablas volcadas
--
--
-- Indices de la tabla `category`
--
ALTER TABLE
  `category`
ADD
  PRIMARY KEY (`_id`);

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE
  `pokemon`
ADD
  PRIMARY KEY (`_id`),
ADD
  KEY `rarity` (`rarity`),
ADD
  KEY `fk_category` (`category`);

--
-- Indices de la tabla `rarity`
--
ALTER TABLE
  `rarity`
ADD
  PRIMARY KEY (`_id`);

--
-- Restricciones para tablas volcadas
--
--
-- Filtros para la tabla `pokemon`
--
ALTER TABLE
  `pokemon`
ADD
  CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`rarity`) REFERENCES `rarity` (`_id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;