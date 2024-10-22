-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2024 a las 04:19:01
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
-- Base de datos: `tiendazuzu`
--
CREATE DATABASE IF NOT EXISTS `tiendazuzu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tiendazuzu`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'Ropa para Caballero', 'assets/images/categorias/20220805093011.jpg', 1),
(2, 'Ropa para Dama', 'assets/images/categorias/20220805093028.jpg', 1),
(3, 'Ropa para Niño', '', 1),
(4, 'Ropa de Niña', '', 1),
(5, 'Accesorios', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(3, ' Azucena Castillo', 'castillozepeda0@gmail.com', '$2y$10$aFqMg0hAfmLz0vUQhPKcPuGQ57zO9bvYDEX83E2yIN5sdwEX/eH5q', 'default.png', '21a66551b83c814b108081b292dc65d2', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(1, 'Camisa Celeste Elegante', 200.00, 1, 1, 2),
(2, 'Camisa Elegante Manga Larga', 1500.00, 1, 1, 3),
(3, 'Camisa Elegante Manga Corta', 5.00, 1, 2, 6),
(4, 'Camisa Elegante Cuadriculada', 3.00, 1, 2, 8),
(5, 'Camisa Elegante Blanca Manga Larga', 8.00, 1, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`) VALUES
(1, '6PX22696F1040260E', 1700.00, 'COMPLETED', '2023-02-20 17:12:42', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 5, '2'),
(2, '1HJ95121A9582915R', 16.00, 'COMPLETED', '2023-07-10 22:37:24', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 3, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'Camisa Elegante Celeste', 'Camisa Elegante Celeste\r\n', 25.00, 90, 'assets/images/productos/20240621022251.jpg', 1, 1),
(2, 'Camisa Elegante  Manga Larga', 'Camisa Elegante  Manga Larga', 20.00, 15, 'assets/images/productos/20240621022356.jpg', 1, 1),
(3, 'Camisa Elegante  Manga Corta', 'Camisa Elegante  Manga Corta', 10.00, 40, 'assets/images/productos/20240621022429.jpg', 1, 1),
(4, 'Camisa Elegante  Cuadriculada', 'Camisa Elegante  Cuadriculada', 28.00, 5, 'assets/images/productos/20240621022527.jpg', 1, 1),
(5, 'Camisa Elegante Manga Larga Blanca', 'Camisa Elegante Manga Larga Blanca', 30.00, 12, 'assets/images/productos/20240621022607.jpg', 1, 1),
(6, 'Camisa Elegante Manga Larga Purple', 'Camisa Elegante Manga Larga Purple', 5.00, 16, 'assets/images/productos/20240621022648.jpg', 1, 1),
(7, 'Camisa Elegante Manga Larga Gris', 'Camisa Elegante Manga Larga Gris', 38.00, 5, 'assets/images/productos/20240621022727.jpg', 1, 1),
(8, 'Camisa Elegante Manga Larga Gris Floral', 'Camisa Elegante Manga Larga Gris Floral', 43.00, 12, 'assets/images/productos/20240621022804.jpg', 1, 1),
(10, 'Camisa Elegante Stampada', 'Camisa Elegante Stampada', 25.99, 20, 'assets/images/productos/20240621022937.jpg', 1, 1),
(11, 'Camisa Elegante Gris Claro', 'Camisa Elegante Gris Claro', 25.00, 20, 'assets/images/productos/20240621023024.jpg', 1, 1),
(12, 'Camisa Elegante Black', 'Camisa Elegante Black', 25.99, 20, 'assets/images/productos/20240621023052.jpg', 1, 1),
(13, 'Camisa Elegante Blue', 'Camisa Elegante Blue', 25.99, 20, 'assets/images/productos/20240621023125.jpg', 1, 1),
(14, 'Camisa Elegante cuadros Rojos', 'Camisa Elegante cuadros Rojos', 25.99, 20, 'assets/images/productos/20240621023150.jpg', 1, 1),
(15, 'Camisa Elegante Flores', 'Camisa Elegante Flores', 25.00, 20, 'assets/images/productos/20240621023215.jpg', 1, 1),
(16, 'Camisa Elegante', 'Camisa Elegante', 25.00, 20, 'assets/images/productos/20240621023318.jpg', 1, 1),
(17, 'Camisa Elegante Turquesa', 'Camisa Elegante Turquesa', 25.99, 20, 'assets/images/productos/20240621023346.jpg', 1, 1),
(18, 'Camiseta Elegante', 'Camiseta Elegante', 23.00, 15, 'assets/images/productos/20240621023412.jpg', 1, 1),
(19, 'Camiseta Elegante Vino', 'Camiseta Elegante Vino', 25.00, 20, 'assets/images/productos/20240621023439.jpg', 1, 1),
(20, 'Camiseta Tricolor', 'Camiseta Tricolor', 80.00, 20, 'assets/images/productos/20240621023505.jpg', 1, 1),
(21, 'Camiseta Yellow', 'Camiseta Yellow', 30.00, 20, 'assets/images/productos/20240621023537.jpg', 1, 1),
(22, 'Vestido Negro Elegante', 'Vestido Negro Elegante', 30.00, 20, 'assets/images/productos/20240621023709.jpg', 1, 2),
(23, 'Vestido Blue Elegante', 'Vestido Blue Elegante', 25.00, 20, 'assets/images/productos/20240621023757.jpg', 1, 2),
(24, 'Vestido Green Elegante', 'Vestido Green Elegante', 25.00, 20, 'assets/images/productos/20240621023851.jpg', 1, 2),
(25, 'Vestido Rosa Elegante', 'Vestido Rosa Elegante', 25.99, 20, 'assets/images/productos/20240621023917.jpg', 1, 2),
(26, 'Vestido Corto Elegante', 'Vestido Corto Elegante', 25.00, 20, 'assets/images/productos/20240621023950.jpg', 1, 2),
(27, 'Vestido White Elegante', 'Vestido White Elegante', 25.99, 20, 'assets/images/productos/20240621024021.jpg', 1, 2),
(28, 'Vestido Red Elegante', 'Vestido Red Elegante', 25.99, 20, 'assets/images/productos/20240621024048.jpg', 1, 2),
(29, 'Vestido Black Elegante', 'Vestido Black Elegante', 25.99, 20, 'assets/images/productos/20240621024111.jpg', 1, 2),
(30, 'Vestido Elegante', 'Vestido Elegante', 25.00, 20, 'assets/images/productos/20240621024135.jpg', 1, 2),
(31, 'Vestido Elegante Gris', 'Vestido Elegante Gris', 25.99, 20, 'assets/images/productos/20240621024205.jpg', 1, 2),
(32, 'Camisa Blanca Elegante', 'Camisa Blanca Elegante', 25.99, 20, 'assets/images/productos/20240621024239.jpg', 1, 2),
(33, 'Camisa Celeste Elegante', 'Camisa Celeste Elegante', 25.99, 20, 'assets/images/productos/20240621024321.jpg', 1, 2),
(34, 'Camisa Rosa Elegante', 'Camisa Rosa Elegante', 25.99, 20, 'assets/images/productos/20240621024354.jpg', 1, 2),
(35, 'Camisa Vino Elegante', 'Camisa Vino Elegante', 25.99, 20, 'assets/images/productos/20240621024428.jpg', 1, 2),
(36, 'Camisa Elegante', 'Camisa Elegante', 30.00, 20, 'assets/images/productos/20240621024514.jpg', 1, 2),
(37, 'Camisa Naranja Elegante', 'Camisa Naranja Elegante', 25.99, 20, 'assets/images/productos/20240621024542.jpg', 1, 2),
(38, 'Camisa Gris Elegante', 'Camisa Gris Elegante', 25.99, 20, 'assets/images/productos/20240621024613.jpg', 1, 2),
(39, 'Camisa Floral', 'Camisa Floral', 25.99, 20, 'assets/images/productos/20240621024646.jpg', 1, 2),
(40, 'Camisa para Dama', 'Camisa para Dama', 30.00, 20, 'assets/images/productos/20240621024717.jpg', 1, 2),
(41, 'Vestido Elegante', 'Vestido Elegante', 25.99, 20, 'assets/images/productos/20240621024803.jpg', 1, 2),
(42, 'Vestido Flores', 'Vestido Flores', 25.99, 20, 'assets/images/productos/20240621025002.jpg', 1, 4),
(43, 'Vestido Cafe', 'Vestido Cafe', 25.99, 20, 'assets/images/productos/20240621025024.jpg', 1, 4),
(44, 'Vestido Franjas', 'Vestido Franjas', 25.99, 20, 'assets/images/productos/20240621025125.jpg', 1, 4),
(45, 'Vestido Arcoiris', 'Vestido Arcoiris', 25.99, 20, 'assets/images/productos/20240621025341.jpg', 1, 4),
(46, 'Traje para Niña Verano', 'Traje para Niña Verano', 30.00, 20, 'assets/images/productos/20240621025613.jpg', 1, 4),
(47, 'Traje Deportivo', 'Traje Deportivo', 25.99, 20, 'assets/images/productos/20240621025641.jpg', 1, 4),
(48, 'Vestido Elegante', 'Vestido Elegante', 30.00, 20, 'assets/images/productos/20240621025709.jpg', 1, 4),
(49, 'Conjunto Mariposa', 'Conjunto Mariposa', 25.99, 20, 'assets/images/productos/20240621025748.jpg', 1, 4),
(50, 'Conjunto Lila Deportivo', 'Conjunto Lila Deportivo', 25.99, 20, 'assets/images/productos/20240621025826.jpg', 1, 4),
(51, 'Traje para Niña', 'Traje para Niña', 25.99, 20, 'assets/images/productos/20240621025850.jpg', 1, 4),
(52, 'Vestido Rosa', 'Vestido Rosa', 25.99, 15, 'assets/images/productos/20240621025916.jpg', 1, 4),
(53, 'Pijama Rosa', 'Pijama Rosa', 25.99, 20, 'assets/images/productos/20240621025951.jpg', 1, 4),
(54, 'Conjunto Elegante', 'Conjunto Elegante', 25.99, 20, 'assets/images/productos/20240621030024.jpg', 1, 4),
(55, 'Traje Blue Jeans', 'Traje Blue Jeans', 25.99, 20, 'assets/images/productos/20240621030049.jpg', 1, 4),
(56, 'Vestido Blanco', 'Vestido Blanco', 25.99, 20, 'assets/images/productos/20240621030113.jpg', 1, 4),
(57, 'Vestido Invierno', 'Vestido Invierno', 30.00, 20, 'assets/images/productos/20240621030155.jpg', 1, 4),
(58, 'Traje Floral', 'Traje Floral', 25.99, 20, 'assets/images/productos/20240621030220.jpg', 1, 4),
(59, 'Vestido Primavera', 'Vestido Primavera', 25.99, 20, 'assets/images/productos/20240621030242.jpg', 1, 4),
(60, 'Conjunto Verano', 'Conjunto Verano', 25.99, 20, 'assets/images/productos/20240621030311.jpg', 1, 4),
(61, 'Conjunto Pink', 'Conjunto Pink', 25.99, 20, 'assets/images/productos/20240621030341.jpg', 1, 4),
(62, 'Traje Casual', 'Traje Casual', 25.99, 20, 'assets/images/productos/20240621030420.jpg', 1, 3),
(63, 'Conjunto Niño Feliz', 'Conjunto Niño Feliz', 25.00, 20, 'assets/images/productos/20240621030503.jpg', 1, 3),
(64, 'Conjunto Camuflaje', 'Conjunto Camuflaje', 25.99, 20, 'assets/images/productos/20240621030528.jpg', 1, 3),
(65, 'Traje Elegante', 'Traje Elegante', 25.99, 20, 'assets/images/productos/20240621030555.jpg', 1, 3),
(66, 'Conjunto Blue para Niño', 'Conjunto Blue para Niño', 25.99, 20, 'assets/images/productos/20240621030625.jpg', 1, 3),
(67, 'Shorts para niño', 'Shorts para niño', 25.99, 20, 'assets/images/productos/20240621030709.jpg', 1, 3),
(68, 'Conjunto Niño Elegante', 'Conjunto Niño Elegante', 25.99, 20, 'assets/images/productos/20240621030737.jpg', 1, 3),
(69, 'Traje Elegante', 'Traje Elegante', 25.99, 20, 'assets/images/productos/20240621030803.jpg', 1, 3),
(70, 'Conjunto Casual', 'Conjunto Casual', 25.99, 20, 'assets/images/productos/20240621030845.jpg', 1, 3),
(71, 'Sueter para Niño', 'Sueter para Niño', 25.99, 20, 'assets/images/productos/20240621030911.jpg', 1, 3),
(72, 'Sueter con Gorro para Bebe', 'Sueter con Gorro para Bebe', 25.99, 20, 'assets/images/productos/20240621030958.jpg', 1, 3),
(73, 'Chaqueta y Corbatin', 'Chaqueta y Corbatin', 25.00, 20, 'assets/images/productos/20240621031039.jpg', 1, 3),
(74, 'Traje Elegante para Niño', 'Traje Elegante para Niño', 25.99, 20, 'assets/images/productos/20240621031105.jpg', 1, 3),
(75, 'Traje Casual Junior', 'Traje Casual Junior', 25.99, 20, 'assets/images/productos/20240621031145.jpg', 1, 3),
(76, 'Conjunto Junior', 'Conjunto Junior', 25.99, 20, 'assets/images/productos/20240621031209.jpg', 1, 3),
(77, 'Traje Elegante Junior', 'Traje Elegante Junior', 25.99, 20, 'assets/images/productos/20240621031237.jpg', 1, 3),
(78, 'Traje Elegante', 'Traje Elegante', 30.00, 20, 'assets/images/productos/20240621031303.jpg', 1, 3),
(79, 'Traje Casual Blue', 'Traje Casual Blue', 25.99, 20, 'assets/images/productos/20240621031332.jpg', 1, 3),
(80, 'Traje para Bebe', 'Traje para Bebe', 25.99, 20, 'assets/images/productos/20240621031409.jpg', 1, 3),
(81, 'Conjunto Naranja', 'Conjunto Naranja', 25.99, 20, 'assets/images/productos/20240621031439.jpg', 1, 3),
(82, 'Cincho para Caballero', 'Cincho para Caballero', 10.00, 20, 'assets/images/productos/20240621031537.jpg', 1, 5),
(83, 'Cincho Cafe para Caballero', 'Cincho Cafe para Caballero', 5.99, 20, 'assets/images/productos/20240621031718.jpg', 1, 5),
(84, 'Cincho Negro para Caballero', 'Cincho Negro para Caballero', 19.99, 20, 'assets/images/productos/20240621031758.jpg', 1, 5),
(85, 'Cincho Cafe Claro para Caballero', 'Cincho Cafe Claro para Caballero', 25.99, 20, 'assets/images/productos/20240621034020.jpg', 1, 5),
(86, 'Cincho Cafe Oscuro para Caballero', 'Cincho Cafe Oscuro para Caballero', 25.99, 20, 'assets/images/productos/20240621034046.jpg', 1, 5),
(87, 'Lentes E01', 'Lentes E01', 5.99, 20, 'assets/images/productos/20240621034112.jpg', 1, 5),
(88, 'Lentes E02', 'Lentes E02', 3.00, 15, 'assets/images/productos/20240621034136.jpg', 1, 5),
(89, 'Lentes E03', 'Lentes E03', 25.00, 15, 'assets/images/productos/20240621034205.jpg', 1, 5),
(90, 'Lentes E04', 'Lentes E04', 25.00, 20, 'assets/images/productos/20240621034229.jpg', 1, 5),
(91, 'Lentes E05', 'Lentes E05', 30.00, 20, 'assets/images/productos/20240621034247.jpg', 1, 5),
(92, 'Lentes E06', 'Lentes E06', 30.00, 20, 'assets/images/productos/20240621034307.jpg', 1, 5),
(93, 'SombreroE01', 'SombreroE01', 25.99, 20, 'assets/images/productos/20240621034338.jpg', 1, 5),
(94, 'SombreroE02', 'SombreroE02', 30.00, 20, 'assets/images/productos/20240621034357.jpg', 1, 5),
(95, 'SombreroE03', 'SombreroE03', 25.99, 15, 'assets/images/productos/20240621034423.jpg', 1, 5),
(96, 'SombreroE04', 'SombreroE04', 25.99, 20, 'assets/images/productos/20240621034520.jpg', 1, 5),
(97, 'SombreroE05', 'SombreroE05', 25.99, 20, 'assets/images/productos/20240621034629.jpg', 1, 5),
(98, 'Bolso001', 'Bolso001', 30.00, 15, 'assets/images/productos/20240621034650.jpg', 1, 5),
(99, 'Bolso002', 'Bolso002', 30.00, 20, 'assets/images/productos/20240621034709.jpg', 1, 5),
(100, 'Bolso002', 'Bolso002', 25.99, 20, 'assets/images/productos/20240621034734.jpg', 1, 5),
(101, 'Bolso003', 'Bolso003', 30.00, 20, 'assets/images/productos/20240621034809.jpg', 1, 5),
(102, 'Bolso004', 'Bolso004', 25.99, 20, 'assets/images/productos/20240621034831.jpg', 1, 5),
(103, 'Bolso005', 'Bolso005', 25.99, 20, 'assets/images/productos/20240621034851.jpg', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'Azucena', 'Castillo', 'castillozepeda0@gmail.com', '$2y$10$XtV68JJ/fABHwWMARZotF.9BHbkwBpquycry2HYOlS.QaUGt/mls2', NULL, 1),
(2, 'Jon', 'Do', 'john.doe@example.com', '$2y$10$ZX9BeymxshOoe/I3pGoIp.6Ai5mrVxN1rdS4nrAQILsOjE9DPwdXW', NULL, 1),
(3, 'Jane', 'Smith', 'jane.smith@example.net', '$2y$10$XhEmt5uACtrZvsQTXMZv0uEChzBB6spFY7Q1R9R3Uh9AIXAKtPx3q', NULL, 1),
(4, 'Michael', 'Brow', 'michael.brown@example.org', '$2y$10$ivqVu/qgAN2lZi8LOH4BCOooNApCSAyFtpWdHrq/br8jjUMHFufEu', NULL, 1),
(5, 'Linda', 'Jones', 'linda.jones@example.com', '$2y$10$lHfAH7XPjHsCQetfjsF17OwMdgiVJcCdewNA7Nr8DcYnvvWnfm/Zu', NULL, 1),
(6, 'David', 'Taylor', 'david.taylor@example.net', '$2y$10$VevYy5r6hO0A.NQuhf33Ve0rabkC/NLrWjvjM/oU/BCUto9D8THXy', NULL, 1),
(7, 'Mary', 'Wilson', 'mary.wilson@example.org', '$2y$10$w0RlY60z.ZBZd6dVmhCY6.tArLonang6OXNoRrnyaRkc9cWgu1oQu', NULL, 1),
(8, 'James', 'Moore', 'james.moore@example.com', '$2y$10$elPULcTS9vZigG8I38bF.eEMNeHjK04Lxf2FtcTxw/g.linhPEMKC', NULL, 1),
(9, 'Patricia', 'Thomas', 'patricia.thomas@example.net', '$2y$10$/10r.R9lqe00/vcyezhE.eln/fdFzHlbkcRLpeY2kgdCWsfLu8k2m', NULL, 1),
(10, 'Robert', 'Jackson', 'robert.jackson@example.org', '$2y$10$aDPLzvA3IJWpcgtezUcXg.MhSVv5dsagKN5i6CmZptIyDuHiBCdwG', NULL, 1),
(11, 'Jennifer', 'White', 'jennifer.white@example.com', '$2y$10$pg7GdbhqMm/yWBi.yS0qjuE.bD2hSK.xCrnlu9DDPBClzKBaoNPbi', NULL, 1),
(12, 'William', 'Harris', 'william.harris@example.net', '$2y$10$8QndFioWErZI6xJM0p8Ysu0AVaVAJssQrDfZhmr4NVBctuPEDYpLe', NULL, 1),
(13, 'Barbara', 'Martin', 'barbara.martin@example.org', '$2y$10$dKy2Pe8vLrlZegwWjK6kQe5WoORia0FNDdf0gJqqBsMs5/6DUMBqu', NULL, 1),
(14, 'Richard', 'Thompson', 'richard.thompson@example.com', '$2y$10$X4RJlyAY1xsJNwOHUblDA./dmD5zGcEJY2pn0pKh3CpAnDoQCDl8.', NULL, 1),
(15, 'Susan', 'Garcia', 'susan.garcia@example.net', '$2y$10$yTK8OSJHcubHlpBUV.oaUeUmOwmI8I84xDh7jkHMUYf9LDC/dARQO', NULL, 1),
(16, 'Charles', 'Martinez', 'charles.martinez@example.org', '$2y$10$avbo6/hbd58c8O7LGPwZXumYLtGSqCpKS7u4gMzF9JuGsjzzeqbQ2', NULL, 1),
(17, 'Karen', 'Robinso', 'karen.robinson@example.com', '$2y$10$kRYmqkAesUegVT8nRkYTOulBjpxCm1DnL0Y0Bn6Y4hn9HxjTrfv6K', NULL, 1),
(18, 'Josehp', 'Clasrk', 'joseph.clark@example.net', '$2y$10$ddeARUTd4Nty/JQSfCKmi.p516/4EUs6bypIBtc22Tty1Qu6aHOTi', NULL, 1),
(19, 'Nancy', 'Rodriguez', 'nancy.rodriguez@example.org', '$2y$10$cc7T5pcgmyRxKe/NDTTTsO2XrJ81GV82/ULLvdZs9UlWD8j4ZNMUi', NULL, 1),
(20, 'Thomas', 'Lewis', 'thomas.lewis@example.com', '$2y$10$EhrVYwAEwMdLnGDwaDVaNe1/Wj0c931qPEAmGlh7JGThy8H9x0gUe', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
