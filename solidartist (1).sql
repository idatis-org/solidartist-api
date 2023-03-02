-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-03-2023 a las 04:10:59
-- Versión del servidor: 10.3.35-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbs7834446`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `art_piece`
--

CREATE TABLE `art_piece` (
  `id` int(11) NOT NULL,
  `content` varchar(150) NOT NULL,
  `title` varchar(100) NOT NULL,
  `piece_type` varchar(50) NOT NULL,
  `front_page` varchar(150) DEFAULT NULL,
  `description` text NOT NULL,
  `sell_price` double NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_collection` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `art_piece`
--

INSERT INTO `art_piece` (`id`, `content`, `title`, `piece_type`, `front_page`, `description`, `sell_price`, `creation_date`, `id_collection`) VALUES
(1, 'art piece 1 of test', 'El mono liso', 'photo', '', 'This is el Mono Liso,a painitng that represents modernity an luxury on these times', 20, '2022-07-05 22:00:00', NULL),
(2, 'Kaladin Stormblessed', 'Kaladin vs Szeth', 'Music', NULL, 'Soundtrack of the battle of Kaladin vs Szeth on the sky', 13.99, '2022-07-06 10:37:23', NULL),
(3, '1657729542970-book.png', 'aadddaad', '', NULL, 'sdadadad', 34.5, '2022-07-13 16:25:43', NULL),
(6, '1657730771532-crown.png', 'Corona', '', NULL, 'subida desde dashboard', 22.99, '2022-07-13 16:46:11', NULL),
(7, '1657792333072-pexels-scott-webb-1022921.jpg', 'aadddaad', '', NULL, 'aaa', 46.99, '2022-07-14 09:52:13', NULL),
(8, '1657811396479-free-music-128bpm-62830.mp3', 'rrtrtrt', 'audio', '1657811396483-mobile_png.png', 'trttrtrt', 43, '2022-07-14 15:09:56', NULL),
(9, '1657812068910-pexels-soulful-pizza-3780681.jpg', 'Pizza', 'image', NULL, 'Pizza Pizza Pizzaaaaaaa', 10.45, '2022-07-14 15:21:08', NULL),
(12, '1657813200655-kisspng-smartphone-feature-phone-iphone-mobile-phone-5a71a4008b04e6.0671463915173969925694.png', 'Prueba cat', 'image', NULL, 'Prueba catPrueba catPrueba cat', 0, '2022-07-14 15:40:00', NULL),
(16, '1657813921352-pexels-caio-46274.jpg', '', 'image', NULL, '', 0, '2022-07-14 15:52:01', NULL),
(17, '1657814114109-pexels-soulful-pizza-3780681 (1).jpg', 'a', 'image', NULL, 'a', 0, '2022-07-14 15:55:14', NULL),
(18, '1657814879846-pexels-mareefe-932577.jpg', '', 'image', NULL, '', 0, '2022-07-14 16:07:59', NULL),
(19, '1657819615692-free-music-128bpm-62830.mp3', 'asdasd', 'audio', '1657819615706-mobile_png.png', 'adasd', 45, '2022-07-14 17:26:55', NULL),
(20, '1657821561917-mobile_png.png', '', 'image', NULL, '', 0, '2022-07-14 17:59:21', NULL),
(21, '1657821616239-pexels-mareefe-932577.jpg', '', 'image', NULL, '', 0, '2022-07-14 18:00:16', NULL),
(22, '1657821735115-pexels-caio-46274.jpg', '', 'image', NULL, '', 0, '2022-07-14 18:02:15', NULL),
(23, '1657967712225-mobile_png.png', '', 'image', NULL, '', 0, '2022-07-16 10:35:12', NULL),
(27, '1657968334238-pexels-pixabay-39866.jpg', 'dd', 'image', NULL, 'dd', 3, '2022-07-16 10:45:34', 1),
(32, '1660414624295-right_triangle.png', 'fads', 'image', NULL, 'fasfa', 0, '2022-08-13 18:17:04', NULL),
(33, '1664640726523-bg_videogame_store.jpg', 'Titulo de prueba', 'image', NULL, '', 3.5, '2022-10-01 16:12:06', 1),
(34, '1664642301402-bg_videogame_store.jpg', 'Hola  ', 'image', NULL, '', 45, '2022-10-01 16:38:21', 1),
(35, '1664642842071-fire.png', 'Fuego', 'image', NULL, 'Fuego de locos', 30000, '2022-10-01 16:47:22', 1),
(36, '1664643453105-andromeda.jpg', 'Damn', 'image', NULL, '', 1, '2022-10-01 16:57:33', 2),
(37, '1677356256085-Design sem nome (8).png', 'avatar', 'image', NULL, 'avatar', 100, '2023-02-25 20:17:36', 6),
(38, '1677356973283-Design sem nome (8).png', 'avatar', 'image', NULL, 'avatar', 10, '2023-02-25 20:29:33', 6),
(39, '1677357288657-Design sem nome (8).png', 'avatar', 'image', NULL, '', 10, '2023-02-25 20:34:48', 6),
(40, '1677357309452-Design sem nome (8).png', 'avatar', 'image', NULL, '', 10, '2023-02-25 20:35:09', 6),
(41, '1677357314506-Design sem nome (8).png', 'avatar', 'image', NULL, '', 10, '2023-02-25 20:35:14', 6),
(42, '1677357359018-Design sem nome (8).png', 'avatar', 'image', NULL, '', 10, '2023-02-25 20:35:59', 6),
(43, '1677357386178-Design sem nome (8).png', 'avatar', 'image', NULL, '', 10, '2023-02-25 20:36:26', 6),
(44, '1677357400265-Design sem nome (8).png', 'avatar', 'image', NULL, '', 10, '2023-02-25 20:36:40', 6),
(45, '1677357401231-Design sem nome (8).png', 'avatar', 'image', NULL, '', 10, '2023-02-25 20:36:41', 6),
(46, '1677357424945-Design sem nome (8).png', 'avatar', 'image', NULL, 'avatar', 1, '2023-02-25 20:37:04', 6),
(47, '1677358963184-blob', 'avatar', 'image', NULL, 'avatar', 2, '2023-02-25 21:02:43', 6),
(48, '1677417026826-blob', 'space', 'image', NULL, 'desc\'space', 6, '2023-02-26 13:10:26', 1),
(49, '1677417232302-blob', 'underwater', 'image', NULL, 'und', 5, '2023-02-26 13:13:52', 5),
(50, '1677426086350-blob', 'island', 'image', NULL, 'island', 6, '2023-02-26 15:41:26', 1),
(51, '1677692453862-rinoceronte.jpg', 'sdfg', 'image', NULL, 'sdfg', 95, '2023-03-01 17:40:53', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`) VALUES
(1, 'Paintings', 'Paintings'),
(2, 'Music', 'Music');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories_pieces`
--

CREATE TABLE `categories_pieces` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_piece` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories_pieces`
--

INSERT INTO `categories_pieces` (`id`, `id_category`, `id_piece`) VALUES
(1, 1, 1),
(2, 2, 2),
(5, 1, 6),
(6, 1, 7),
(7, 2, 8),
(8, 1, 9),
(18, 1, 19),
(25, 1, 27),
(30, 1, 32),
(31, 1, 33),
(32, 1, 34),
(33, 1, 35),
(34, 1, 36),
(35, 1, 37),
(36, 1, 38),
(37, 1, 39),
(38, 1, 40),
(39, 1, 41),
(40, 1, 42),
(41, 1, 43),
(42, 1, 44),
(43, 1, 45),
(44, 1, 46),
(45, 1, 47),
(46, 1, 48),
(47, 1, 49),
(48, 1, 50),
(49, 1, 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `collections`
--

CREATE TABLE `collections` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `collections`
--

INSERT INTO `collections` (`id`, `name`, `description`, `id_user`) VALUES
(1, 'Coleccion 1', 'Colleccion 1 ', 11),
(2, 'Coleccion 2', 'Esta es la coleccion 2', 11),
(3, 'patatas fritas', 'Es ua coleccion de patats fritas, enjoy', 11),
(4, 'coleccion otra', 'otra coleccion', 11),
(5, 'Coleccion de prueba', 'Esta coleccion es para probar si valida el form y sale el toast', 11),
(6, 'Art', 'art', 21),
(7, 'sdfg', 'sdfg', 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `collections_pieces`
--

CREATE TABLE `collections_pieces` (
  `id` int(11) NOT NULL,
  `id_collection` int(11) NOT NULL,
  `id_piece` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `collections_pieces`
--

INSERT INTO `collections_pieces` (`id`, `id_collection`, `id_piece`) VALUES
(1, 1, 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `id_user_reported` int(11) DEFAULT NULL,
  `id_user_reporting` int(11) DEFAULT NULL,
  `motive` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `complaints`
--

INSERT INTO `complaints` (`id`, `id_user_reported`, `id_user_reporting`, `motive`) VALUES
(1, 15, 11, 'Ladron'),
(2, 15, NULL, ''),
(3, 11, NULL, ''),
(4, 11, 11, 'a'),
(5, 11, 11, 'Pruab final'),
(6, 15, 11, 'asdreyey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `profile_type` tinyint(1) NOT NULL,
  `role` int(11) NOT NULL,
  `user_img` varchar(150) DEFAULT NULL,
  `profile_img` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL COMMENT '0 = blocked, 1 =  active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `alias`, `profile_type`, `role`, `user_img`, `profile_img`, `description`, `creation_date`, `active`) VALUES
(1, 'test', 'test', 'test', 0, 1, NULL, NULL, 'asdad', '2022-07-02 22:00:00', 0),
(7, 'hola', '$2b$10$NNWVwxzqkzWsjFkIgTduMeFQnUdpqm9Sr4QOEnbpnRII0OfxdsVHa', 'hola', 1, 2, NULL, NULL, NULL, '2022-07-04 14:53:50', 0),
(8, 'holaa', '$2b$10$LfZ5LYeMjt6IW3IkLyCUnOTvZNCEetYqvtFv8xQkMgGR72p/EVFRW', 'holaa', 0, 1, NULL, NULL, NULL, '2022-07-04 15:27:18', 0),
(11, 'asdasd', '$2b$10$aeVSW0vnVTJLbZU9fIcx.OuJ/zMuGyQRD9iTgzYEpkE3N6xJgFHOm', 'asdasd', 0, 1, '1657731757759-pexels-pixabay-39866.jpg', '1657571092247-mobile_png.png', 'Test de descripcion', '2022-07-08 16:39:06', 0),
(12, 'UserPruebas11', '$2a$10$vjad4vLdpcfdHZsqHNL4tuSTvWbWWTrF26yg1vFH7juH3Ohx9Szry', 'User11', 0, 2, NULL, NULL, NULL, '2022-08-25 07:57:33', 0),
(13, 'Usuario22', '$2a$10$hBxwZzZr/BmrcEqQIhzgJO0OT5NXiuz3BYN5lwS6V07V5RnuCEZ/C', 'User22', 1, 2, NULL, NULL, NULL, '2022-08-25 09:50:13', 0),
(14, 'Artista11', '$2a$10$8jP/cQTxBEpFHegWVVDQ9uVRdGMElWIPBVF8PKqTbmNfpMTItbIn2', 'artist11', 0, 1, NULL, NULL, NULL, '2022-08-25 09:52:59', 0),
(15, 'Artista2', '$2a$10$QEux18WFjJTX3/njvTS7Ten9frtpiNaf/g.9SrI4K4Tj/WMhhBadS', 'artist2', 0, 1, '1661426277247-glau.jpg', NULL, 'null', '2022-08-25 10:23:19', 0),
(16, 'mitest', '$2a$10$6UOYKc4nfq8TePeaVywEyulr6Jm2pSmYmfb4oKKPvf6lzFqvloyee', 'mitest', 0, 1, '1674817191789-Galaxy.jpg', '1669721472172-AndromedaResized.jpg', '', '2022-11-29 10:28:12', 0),
(17, 'dsadsa', '$2a$10$bO9QsJkciGoWSj8yrFxZ0ONA48Z84vWcNG8s2EGJV8afzK6j6WbJi', 'dsadsa', 0, 2, NULL, NULL, 'null', '2022-12-09 16:40:51', 1),
(18, 'Pepito', '$2a$10$382K9n68IFK7djBKN5X/huWrauv/rymO179EKxypHnqsDttXXGtV.', 'pepito', 0, 2, NULL, NULL, NULL, '2022-12-17 11:44:22', 0),
(19, 'juanito', '$2a$10$f4QUxWPOXsc3PmpZEUGNceb5osGN2JyYiKK3zoaHnlS.CTFsbgNny', 'juanito', 1, 2, NULL, NULL, NULL, '2022-12-17 11:56:56', 0),
(20, 'qqqqqq', '$2a$10$EbciQp4f.5hJUcDEMDxdkeApuBU8tOkXgPgsBJinw0DJVXw3Ye0rC', 'qqqqqq', 0, 2, NULL, NULL, NULL, '2022-12-17 12:00:52', 0),
(21, 'Thiago', '$2a$10$MzMI2oo6tiTpgmEWXOiSCO7.gUJYoWzuq101WhPRNmnzgjOUwDALK', 'Thiago', 0, 1, NULL, NULL, 'null', '2023-02-25 08:19:01', 0),
(22, 'usuarioPrueba', '$2a$10$49HgipoeOWFIPRsm7Ry0gOnBVq4GZx898TPO7zG8BsfCybsqMq2FK', 'prueba', 0, 1, NULL, NULL, NULL, '2023-03-01 17:14:20', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_pieces`
--

CREATE TABLE `users_pieces` (
  `id` int(11) NOT NULL,
  `id_creator` int(11) DEFAULT NULL,
  `id_current_owner` int(11) DEFAULT NULL,
  `id_piece` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users_pieces`
--

INSERT INTO `users_pieces` (`id`, `id_creator`, `id_current_owner`, `id_piece`) VALUES
(1, 15, 15, 1),
(2, 15, 15, 2),
(5, 14, 14, 6),
(6, 14, 14, 7),
(7, 14, 14, 8),
(8, 15, 15, 9),
(11, 15, 15, 12),
(15, 14, 14, 16),
(16, 15, 15, 17),
(17, 17, 17, 18),
(18, 8, 8, 19),
(19, 12, 12, 20),
(20, 11, 11, 21),
(21, 11, 11, 22),
(25, 11, 11, 27),
(30, 11, 11, 32),
(31, 11, 11, 33),
(32, 11, 11, 34),
(33, 11, 11, 35),
(34, 11, 11, 36),
(35, 21, 21, 37),
(36, 21, 21, 38),
(37, 21, 21, 39),
(38, 21, 21, 40),
(39, 21, 21, 41),
(40, 21, 21, 42),
(41, 21, 21, 43),
(42, 21, 21, 44),
(43, 21, 11, 45),
(44, 21, 21, 46),
(45, 21, 21, 47),
(46, 11, 11, 48),
(47, 11, 11, 49),
(48, 11, 11, 50),
(49, 22, 22, 51);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `art_piece`
--
ALTER TABLE `art_piece`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_collection` (`id_collection`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories_pieces`
--
ALTER TABLE `categories_pieces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_catgories_pieces_Id_Category` (`id_category`),
  ADD KEY `fk_categoies_pieces_Id_Piece` (`id_piece`);

--
-- Indices de la tabla `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_user` (`id_user`);

--
-- Indices de la tabla `collections_pieces`
--
ALTER TABLE `collections_pieces`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_reported` (`id_user_reported`),
  ADD KEY `fk_user_reporting` (`id_user_reporting`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `users_pieces`
--
ALTER TABLE `users_pieces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_creator` (`id_creator`),
  ADD KEY `fk_id_current_owner` (`id_current_owner`),
  ADD KEY `fk_id_art_piece` (`id_piece`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `art_piece`
--
ALTER TABLE `art_piece`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categories_pieces`
--
ALTER TABLE `categories_pieces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `collections_pieces`
--
ALTER TABLE `collections_pieces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `users_pieces`
--
ALTER TABLE `users_pieces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `art_piece`
--
ALTER TABLE `art_piece`
  ADD CONSTRAINT `fk_id_collection` FOREIGN KEY (`id_collection`) REFERENCES `collections` (`id`);

--
-- Filtros para la tabla `categories_pieces`
--
ALTER TABLE `categories_pieces`
  ADD CONSTRAINT `fk_categoies_pieces_Id_Piece` FOREIGN KEY (`id_piece`) REFERENCES `art_piece` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_catgories_pieces_Id_Category` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `collections`
--
ALTER TABLE `collections`
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `fk_user_reported` FOREIGN KEY (`id_user_reported`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_reporting` FOREIGN KEY (`id_user_reporting`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_pieces`
--
ALTER TABLE `users_pieces`
  ADD CONSTRAINT `fk_id_art_piece` FOREIGN KEY (`id_piece`) REFERENCES `art_piece` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_creator` FOREIGN KEY (`id_creator`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_current_owner` FOREIGN KEY (`id_current_owner`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
