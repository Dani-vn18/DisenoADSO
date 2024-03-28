-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2024 a las 03:06:25
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `djangoadso`
--
CREATE DATABASE IF NOT EXISTS `djangoadso` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `djangoadso`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `actualizarEmpleados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarEmpleados` (IN `idemp` INT(11), IN `nom_emp` VARCHAR(150), IN `ape_emp` VARCHAR(150), IN `dias_trabaj` INT(8), IN `salario_espe` INT(8), IN `gen_emp` VARCHAR(20), IN `cel_emp` VARCHAR(20), IN `corr_emp` VARCHAR(100), IN `depa` VARCHAR(100), IN `doc_emp` VARCHAR(100), IN `cta_ban` VARCHAR(80), IN `tipo_cuen` VARCHAR(20), IN `c_id` INT(11))   BEGIN
UPDATE empleado SET nombre_emp=nom_emp,apellido_emp=ape_emp,dias_trabajados=dias_trabaj,salario_esperado=salario_espe,genero_emp=gen_emp,celular_emp=cel_emp,correo_emp=corr_emp,departamento=depa,documento_emp=doc_emp,cuenta_bancaria=cta_ban,tipo_cuenta=tipo_cuen,cargo_id=c_id WHERE idemp=id;
END$$

DROP PROCEDURE IF EXISTS `borrarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarEmpleado` (IN `idempleado` INT(11))   BEGIN

DELETE FROM empleado WHERE id=idempleado;

END$$

DROP PROCEDURE IF EXISTS `cargarEmpleados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargarEmpleados` ()   SELECT e.id,e.nombre_emp,e.apellido_emp,e.genero_emp,e.celular_emp,e.correo_emp,e.departamento,e.documento_emp,e.cuenta_bancaria,e.tipo_cuenta,c.nombre as NombreCargo,c.salario from empleado as e INNER JOIN cargo as c WHERE e.cargo_id = c.id$$

DROP PROCEDURE IF EXISTS `insertarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarEmpleado` (IN `nombre_emp` VARCHAR(150), IN `apellido_emp` VARCHAR(150), IN `genero_emp` VARCHAR(20), IN `celular_emp` VARCHAR(20), IN `correo_emp` VARCHAR(100), IN `departamento` VARCHAR(100), IN `documento_emp` VARCHAR(100), IN `cuenta_bancaria` VARCHAR(80), IN `tipo_cuenta` VARCHAR(20), IN `cargo_id` INT(11))   BEGIN
INSERT INTO empleado (nombre_emp,apellido_emp,genero_emp,celular_emp,correo_emp,departamento,documento_emp,cuenta_bancaria,tipo_cuenta,cargo_id) VALUES (nombre_emp,apellido_emp,genero_emp,celular_emp,correo_emp,departamento,documento_emp,cuenta_bancaria,tipo_cuenta,cargo_id);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add cargo', 1, 'add_cargo'),
(2, 'Can change cargo', 1, 'change_cargo'),
(3, 'Can delete cargo', 1, 'delete_cargo'),
(4, 'Can view cargo', 1, 'view_cargo'),
(5, 'Can add empleado', 2, 'add_empleado'),
(6, 'Can change empleado', 2, 'change_empleado'),
(7, 'Can delete empleado', 2, 'delete_empleado'),
(8, 'Can view empleado', 2, 'view_empleado'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session'),
(33, 'Can add producto', 9, 'add_producto'),
(34, 'Can change producto', 9, 'change_producto'),
(35, 'Can delete producto', 9, 'delete_producto'),
(36, 'Can view producto', 9, 'view_producto'),
(37, 'Can add cliente', 10, 'add_cliente'),
(38, 'Can change cliente', 10, 'change_cliente'),
(39, 'Can delete cliente', 10, 'delete_cliente'),
(40, 'Can view cliente', 10, 'view_cliente'),
(41, 'Can add factura', 11, 'add_factura'),
(42, 'Can change factura', 11, 'change_factura'),
(43, 'Can delete factura', 11, 'delete_factura'),
(44, 'Can view factura', 11, 'view_factura'),
(45, 'Can add facturahash producto', 12, 'add_facturahashproducto'),
(46, 'Can change facturahash producto', 12, 'change_facturahashproducto'),
(47, 'Can delete facturahash producto', 12, 'delete_facturahashproducto'),
(48, 'Can view facturahash producto', 12, 'view_facturahashproducto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(3, 'pbkdf2_sha256$600000$J2VpGxExd0kwV9AJQKrtHD$avLNFGNCqKjaP0ef4ks3ygg6PlNYe1e3PFjMHI4ny9Q=', NULL, 0, 'redes@wonnersclub.com', 'Daniel', 'Vergara', 'dv53468@gmail.com', 0, 1, '2023-09-12 13:37:24.657896'),
(4, 'pbkdf2_sha256$600000$PKeVuTtuRnwpFOLiF0aUmV$fbotR4ytaJ1s1tKisb8cvUF8BntoeaCWql/iV79+mFE=', '2024-03-28 01:11:10.279070', 0, 'juandavn', 'Dani', 'Nieto', 'juanda.vn@gmail.com', 0, 1, '2023-09-12 13:39:13.448214'),
(5, 'pbkdf2_sha256$600000$9hRwic1A8oKgsSUWmfkHcI$jjGbxNFoLnDJI1g2/fvcUIE6KEZ0aWYZg2BXv6nR9kY=', '2023-09-12 15:32:14.742672', 0, 'w', 'wW', 'w', 'w@h.vom', 0, 1, '2023-09-12 15:32:00.092943'),
(6, 'pbkdf2_sha256$600000$G4OBLX3WA29vDYyKuQzyXq$B1/jh8qr5JyfNHaCCOqteA5wdEs+FyxfoampgH7dRrA=', '2023-10-04 11:38:31.428565', 0, 'juan_vergara', 'Juan Daniel', 'Vergara Nieto', 'dv53468@gmail.com', 0, 1, '2023-10-04 11:37:19.133177'),
(7, 'pbkdf2_sha256$600000$tTbe1CGEHzYK6l4LEaOQ1U$1q1JxV3tSYJ3y4833kbFj4C7f4PUlYfEufrMdYG+r/8=', '2024-03-11 17:21:29.598196', 0, 'pablop', 'Pablo', 'Palacio', 'pablo@gmail.com', 0, 1, '2024-03-11 17:20:55.273077'),
(8, 'pbkdf2_sha256$600000$Wavw0qkRanBtDuEwvYu4B5$j8bjIy9pzjzSZAPE8kix9KLgjjSBOkgXh41Hasd+n0s=', '2024-03-28 01:56:25.247232', 0, 'administrador1', 'Probando Nuevo Registro', 'Administrador', 'admin1@gmail.com', 0, 1, '2024-03-28 01:56:04.363422');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `salario` int(8) NOT NULL,
  `turno_laboral` varchar(150) NOT NULL,
  `rotacion_laboral` varchar(150) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `nombre`, `salario`, `turno_laboral`, `rotacion_laboral`, `descripcion`) VALUES
(1, 'ADMINISTRADOR', 3500000, 'DIURNO', 'NO', 'Encargado de control de todas las operaciones'),
(2, 'VIGILANTE', 1200000, 'MIXTO', 'SI', 'Encargado de preservar la seguridad de las personas y los bienes de la organización.'),
(3, 'VENDEDOR', 1500000, 'NOCTURNO', 'NO', 'Encargado de atender los clientes y registrar las compras que se realizan dentro del punto físico.'),
(4, 'ASESOR COMERCIAL', 1200000, 'NOCTURNO', 'NO', 'Encargado de optimizar los procesos de venta de los vendedores.'),
(6, 'Auxiliar Operario', 1800000, 'MIXTO', 'NO', 'Auxiliar operario en el área encargada de despachos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre_cliente` varchar(250) NOT NULL,
  `tipo_identificacion` varchar(250) NOT NULL,
  `numero_identificacion` varchar(250) NOT NULL,
  `departamento` varchar(250) NOT NULL,
  `ciudad` varchar(250) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `cod_postal` varchar(250) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `telefono` varchar(250) NOT NULL,
  `pref_contacto` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre_cliente`, `tipo_identificacion`, `numero_identificacion`, `departamento`, `ciudad`, `direccion`, `cod_postal`, `correo`, `telefono`, `pref_contacto`) VALUES
(4, 'Juan Vergara', 'CC', '222222', 'Probando Cambios', 'En esta vuelta', 'Cra 4 # 1 0', '22222', 'juandaaaaaa@gmail.com', '56857969', 'Correo Electrónico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(1, 'proyectoADSO', 'cargo'),
(10, 'proyectoADSO', 'cliente'),
(2, 'proyectoADSO', 'empleado'),
(11, 'proyectoADSO', 'factura'),
(12, 'proyectoADSO', 'facturahashproducto'),
(9, 'proyectoADSO', 'producto'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-29 13:49:54.746971'),
(2, 'auth', '0001_initial', '2023-08-29 13:49:54.858944'),
(3, 'admin', '0001_initial', '2023-08-29 13:49:54.897135'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-29 13:49:54.901631'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-29 13:49:54.907363'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-29 13:49:54.926768'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-29 13:49:54.940779'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-29 13:49:54.947340'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-29 13:49:54.953344'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-29 13:49:54.965809'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-29 13:49:54.966810'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-29 13:49:54.973808'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-29 13:49:54.986083'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-29 13:49:54.993079'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-29 13:49:55.002090'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-29 13:49:55.008759'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-29 13:49:55.017279'),
(18, 'sessions', '0001_initial', '2023-08-29 13:49:55.029692');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3h9t2zn3a886n5d7srwvvn2fw97d4fqs', '.eJxVjDsOwjAQBe_iGlmxs_hDSc8ZorV3FwdQLMVJhbg7iZQC2pl5760GXJcyrI3nYSR1UaBOvyxhfvK0C3rgdK8612mZx6T3RB-26Vslfl2P9u-gYCvb2ooTQmEP0UHwgl2UDfXiOgYDJuWzR4LOJePFxmAcE1gfKLKNpk_q8wX4MDfy:1r7jFL:YlSc9djTAoAX3HCfMztb-rZjrS232DkPEhcylzkJ1xI', '2023-12-11 21:34:27.163899'),
('6ns2v6wlbhdlh4u1q5smpx7liq6niq62', '.eJxVjDsOwjAQBe_iGlmxs_hDSc8ZorV3FwdQLMVJhbg7iZQC2pl5760GXJcyrI3nYSR1UaBOvyxhfvK0C3rgdK8612mZx6T3RB-26Vslfl2P9u-gYCvb2ooTQmEP0UHwgl2UDfXiOgYDJuWzR4LOJePFxmAcE1gfKLKNpk_q8wX4MDfy:1qvcIw:XyUaDEVZ6-U3loZcTdtxspmXnqTSPyiEueH_oFfk6M0', '2023-11-08 11:44:06.228950'),
('cjyfi49e8q4maai450dsl2gzzzyjpszm', '.eJxVjDsOwjAQBe_iGlmxs_hDSc8ZorV3FwdQLMVJhbg7iZQC2pl5760GXJcyrI3nYSR1UaBOvyxhfvK0C3rgdK8612mZx6T3RB-26Vslfl2P9u-gYCvb2ooTQmEP0UHwgl2UDfXiOgYDJuWzR4LOJePFxmAcE1gfKLKNpk_q8wX4MDfy:1reZB8:r-6MoWDkwud9pEw0GZJpuk-o6dN4XcWQkrqJt_ewVg0', '2024-03-11 11:29:50.651481'),
('di3wps4vpnnegindcbot42jotywsxhv7', '.eJxVTEsOwiAQvQtrQ6DtCLh07xmaGWaUqoGktCvj3aWmC01eXvK-LzXiuqRxrTKPE6uTcurw6xHGh-Qt4DvmW9Gx5GWeSG8VvadVXwrL87x3_w4S1tTWGDySkPUmGrpGDz34rwJjBrCug3Bk25i5a4awb4A4OMMSerLq_QHcjzdy:1rjjL7:HAQYZPuFq4n9ytO2dKPhLWSSm7v_CpBTPUwanVIwSfo', '2024-03-25 17:21:29.598986'),
('ftk7hrbeuar8uti2ppzkssi9wvtstlq0', '.eJxVjDsOwjAQBe_iGlnxN2tK-pzBWq83OIAcKU4qxN1JpBTQvpl5bxFxW0vcGi9xyuIqvLj8bgnpyfUA-YH1Pkua67pMSR6KPGmTw5z5dTvdv4OCrew1djkkgp7ZknegLGiXTM8-a0OoclKdcwmsxTE41LsJbJwFMKO3gUh8vuhpN7k:1qo0D1:L_aqZiJuhwCIT8eMxfBvQ66yJx2OKuoQCK3KiK2acK8', '2023-10-18 11:38:31.428565'),
('pfmynzgw8pf7lx11yrt9dwufd5tcyprz', '.eJxVjDsOwjAQBe_iGlmxs_hDSc8ZorV3FwdQLMVJhbg7iZQC2pl5760GXJcyrI3nYSR1UaBOvyxhfvK0C3rgdK8612mZx6T3RB-26Vslfl2P9u-gYCvb2ooTQmEP0UHwgl2UDfXiOgYDJuWzR4LOJePFxmAcE1gfKLKNpk_q8wX4MDfy:1rS10B:1yDlitvkWsg8Y7TQ5eOKt8WX729nHorCm3o0mPO9Vr8', '2024-02-05 20:34:39.709898'),
('qjuu73slhy6uppc00p4xizipmst2ddl2', '.eJxVjDsOwjAQBe_iGlmxs_hDSc8ZorV3FwdQLMVJhbg7iZQC2pl5760GXJcyrI3nYSR1UaBOvyxhfvK0C3rgdK8612mZx6T3RB-26Vslfl2P9u-gYCvb2ooTQmEP0UHwgl2UDfXiOgYDJuWzR4LOJePFxmAcE1gfKLKNpk_q8wX4MDfy:1qvcKA:vlkV5mZACUV0X7aMqW4kRuVofICR9-_lXQDa3vGDMp0', '2023-11-08 11:45:22.013522'),
('triey2ar4xeqfhp2vrfnxarlwpvwvlrv', '.eJxVjDsOwjAQBe_iGlmxs_hDSc8ZorV3FwdQLMVJhbg7iZQC2pl5760GXJcyrI3nYSR1UaBOvyxhfvK0C3rgdK8612mZx6T3RB-26Vslfl2P9u-gYCvb2ooTQmEP0UHwgl2UDfXiOgYDJuWzR4LOJePFxmAcE1gfKLKNpk_q8wX4MDfy:1r9sdm:OIGSt-DT8Sl5YhdRPqeLKb7zgGUjaYiqx3d079Z4bpY', '2023-12-17 20:00:34.351308'),
('xqxnbgjky85m3om1uyyhudmawz9lctpz', '.eJxVjDsOwjAQBe_iGlmxs_hDSc8ZorV3FwdQLMVJhbg7iZQC2pl5760GXJcyrI3nYSR1UaBOvyxhfvK0C3rgdK8612mZx6T3RB-26Vslfl2P9u-gYCvb2ooTQmEP0UHwgl2UDfXiOgYDJuWzR4LOJePFxmAcE1gfKLKNpk_q8wX4MDfy:1qg5fB:EE_hPds3QggobwxGz0s6GKe5XpQkfBViTlvWyBVeLT8', '2023-09-26 15:50:53.791197');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `nombre_emp` varchar(150) NOT NULL,
  `apellido_emp` varchar(150) NOT NULL,
  `genero_emp` varchar(20) NOT NULL,
  `celular_emp` varchar(20) NOT NULL,
  `correo_emp` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `documento_emp` varchar(100) NOT NULL,
  `cuenta_bancaria` varchar(80) NOT NULL,
  `tipo_cuenta` varchar(20) NOT NULL,
  `cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre_emp`, `apellido_emp`, `genero_emp`, `celular_emp`, `correo_emp`, `departamento`, `documento_emp`, `cuenta_bancaria`, `tipo_cuenta`, `cargo_id`) VALUES
(9, 'Prueba', 'Editadoo', 'FEMENINO', '3434', 'asd@gmail.com', 'asdas', '11122', '767676', 'CORRIENTE', 4),
(10, 'Juan Daniel', 'Vergara', 'MASCULINO', '3043898027', 'juan@gmail.com', 'Sistemas', '1000662255', '0098877', 'CORRIENTE', 2),
(11, 'Juan Daniel', 'asads', 'MASCULINO', '30438998', 'dani@gmail.com', 'Sistemas', '1123213', '0098877', 'AHORROS', 2),
(14, 'Freddy', 'Camacho', 'MASCULINO', '545454', 'fred@gmail.com', 'asdasd', '121221', '34534534', 'CORRIENTE', 3),
(15, 'Alejandro', 'Largo', 'MASCULINO', '345345', 'largo@gmail.com', 'Sistemas', '2898989', '3878787', 'CORRIENTE', 1),
(16, 'Victor', 'Pemberty', 'MASCULINO', '31413123', 'asdadsdsd@gmail.com', 'asdasdas', '131231235', '4364356', 'CORRIENTE', 4),
(17, 'Julian', 'Aaskldjlaksjd', 'MASCULINO', '44343435', 'julianempleado@gmail.com', 'Ventas', '12637612', '182739172983', 'CORRIENTE', 3),
(18, 'Nuevo empleado', 'Novato', 'MASCULINO', '23121321231', 'asdqqqq@gmail.com', 'Ventas', '11155566', '0021213211', 'CORRIENTE', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `total` double NOT NULL,
  `empleado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `total`, `empleado_id`) VALUES
(1, '2023-11-22', 50000, 11),
(2, '2023-11-22', 50000, 11),
(3, '2023-11-22', 50000, 11),
(4, '2023-11-22', 24000, 11),
(5, '2023-11-23', 41000, 10),
(6, '2023-11-23', 190500, 10),
(7, '2023-11-24', 19000, 10),
(8, '2023-11-24', 3000, 10),
(9, '2023-11-27', 72000, 14),
(10, '2023-12-03', 29000, 10),
(11, '2024-02-07', 38000, 11),
(12, '2024-02-07', 13000, 10),
(13, '2024-02-08', 35200, 10),
(14, '2024-02-08', 30900, 11),
(15, '2024-02-08', 16000, 11),
(16, '2024-02-12', 36500, 10),
(17, '2024-02-13', 28500, 15),
(18, '2024-02-13', 32000, 16),
(19, '2024-02-14', 21800, 15),
(20, '2024-02-19', 72000, 10),
(21, '2024-02-28', 19000, 16),
(22, '2024-03-11', 4500000, 17),
(23, '2024-03-11', 3750000, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturahashproducto`
--

DROP TABLE IF EXISTS `facturahashproducto`;
CREATE TABLE `facturahashproducto` (
  `id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturahashproducto`
--

INSERT INTO `facturahashproducto` (`id`, `factura_id`, `producto_id`, `cantidad`) VALUES
(1, 1, 5, 2),
(2, 1, 6, 3),
(3, 1, 7, 4),
(4, 1, 8, 5),
(5, 1, 5, 2),
(6, 1, 7, 2),
(7, 1, 6, 2),
(8, 1, 8, 2),
(9, 5, 5, 2),
(10, 5, 6, 3),
(11, 5, 7, 5),
(12, 5, 8, 1),
(13, 6, 6, 2),
(14, 6, 5, 3),
(15, 6, 7, 34),
(16, 6, 8, 5),
(17, 7, 5, 2),
(18, 7, 7, 3),
(19, 8, 8, 2),
(20, 9, 6, 2),
(21, 9, 7, 5),
(22, 9, 5, 20),
(23, 10, 6, 2),
(24, 10, 8, 4),
(25, 10, 9, 5),
(26, 11, 6, 2),
(27, 11, 8, 4),
(28, 11, 7, 5),
(29, 12, 6, 2),
(30, 12, 8, 4),
(31, 13, 6, 2),
(32, 13, 7, 5),
(33, 13, 9, 1),
(34, 14, 6, 7),
(35, 14, 9, 2),
(36, 15, 7, 2),
(37, 15, 5, 3),
(38, 16, 6, 2),
(39, 16, 8, 3),
(40, 16, 7, 5),
(41, 17, 6, 2),
(42, 17, 7, 4),
(43, 17, 8, 1),
(44, 18, 7, 2),
(45, 18, 9, 5),
(46, 18, 5, 3),
(47, 19, 5, 1),
(48, 19, 6, 2),
(49, 19, 9, 4),
(50, 20, 6, 2),
(51, 20, 7, 5),
(52, 20, 5, 20),
(53, 21, 6, 2),
(54, 21, 5, 3),
(55, 21, 8, 4),
(56, 22, 11, 1),
(57, 22, 10, 1),
(58, 23, 11, 1),
(59, 23, 12, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`) VALUES
(5, 'Chocorramo', 2000),
(6, 'Papas', 3500),
(7, 'Bon Yurt', 5000),
(8, 'Gol', 1500),
(9, 'Papas criolla', 3200),
(10, 'Poncho', 2000000),
(11, 'iPhone 15', 2500000),
(12, 'Cargador de Android', 150000),
(13, 'Probando producto nuevo', 222222),
(14, 'Nuevo Producto2', 180000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cargo_id` (`cargo_id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indices de la tabla `facturahashproducto`
--
ALTER TABLE `facturahashproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factura_id` (`factura_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `facturahashproducto`
--
ALTER TABLE `facturahashproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `facturahashproducto`
--
ALTER TABLE `facturahashproducto`
  ADD CONSTRAINT `facturahashproducto_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`),
  ADD CONSTRAINT `facturahashproducto_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
