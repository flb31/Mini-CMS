-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-07-2016 a las 17:27:49
-- Versión del servidor: 5.6.30-0ubuntu0.14.04.1
-- Versión de PHP: 5.6.13-1+deb.sury.org~trusty+3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cms_solvetic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `direccion` tinytext NOT NULL,
  `geolocalizacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `titulo`, `direccion`, `geolocalizacion`) VALUES
(1, 'Mi sitio de peliculas', 'Mi direccion web', '1234567,67890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos`
--

CREATE TABLE IF NOT EXISTS `contenidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `contenido` longtext NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo` varchar(20) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `alias` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `contenidos`
--

INSERT INTO `contenidos` (`id`, `titulo`, `contenido`, `fecha_publicacion`, `tipo`, `categoria`, `alias`) VALUES
(1, 'Iron Man', '%3Cp%3E%3Cstrong%3EAnthony%20Edward%20&quot;Tony&quot;%20Stark%3C/strong%3E&nbsp;o%20mejor%20conocido%20como&nbsp;%3Cstrong%3EEl%20Hombre%20de%20Hierro%3C/strong%3E&nbsp;u%20originalmente&nbsp;%3Cstrong%3EIron%20Man%3C/strong%3E,%20es%20un%20superh&eacute;roe%20que%20aparece%20en%20los&nbsp;%3Ca%20href=%22https://es.wikipedia.org/wiki/C%25C3%25B3mic%22%20title=%22C%C3%B3mic%22%3Ec&oacute;mics%3C/a%3E&nbsp;publicados%20por&nbsp;%3Ca%20href=%22https://es.wikipedia.org/wiki/Marvel_Comics%22%20title=%22Marvel%20Comics%22%3EMarvel%20Comics%3C/a%3E.%20El%20personaje%20fue%20creado%20por%20el%20guionista%20y%20editor%3Ca%20href=%22https://es.wikipedia.org/wiki/Stan_Lee%22%20title=%22Stan%20Lee%22%3EStan%20Lee%3C/a%3E,%20desarrollado%20por%20el%20guionista&nbsp;%3Ca%20href=%22https://es.wikipedia.org/w/index.php?title=Larry_Lieber&amp;action=edit&amp;redlink=1%22%20title=%22Larry%20Lieber%20(a%C3%BAn%20no%20redactado)%22%3ELarry%20Lieber%3C/a%3E,%20y%20dise&ntilde;ado%20por%20los%20artistas&nbsp;%3Ca%20href=%22https://es.wikipedia.org/w/index.php?title=Don_Heck&amp;action=edit&amp;redlink=1%22%20title=%22Don%20Heck%20(a%C3%BAn%20no%20redactado)%22%3EDon%20Heck%3C/a%3E&nbsp;y&nbsp;%3Ca%20href=%22https://es.wikipedia.org/wiki/Jack_Kirby%22%20title=%22Jack%20Kirby%22%3EJack%20Kirby%3C/a%3E.%20Hizo%20su&nbsp;%3Ca%20href=%22https://es.wikipedia.org/w/index.php?title=Primera_aparici%25C3%25B3n&amp;action=edit&amp;redlink=1%22%20title=%22Primera%20aparici%C3%B3n%20(a%C3%BAn%20no%20redactado)%22%3Eprimera%20aparici&oacute;n%3C/a%3E&nbsp;en&nbsp;%3Cem%3E%3Ca%20href=%22https://es.wikipedia.org/wiki/Tales_of_Suspense%22%20title=%22Tales%20of%20Suspense%22%3ETales%20of%20Suspense%3C/a%3E%3C/em%3E&nbsp;#39%20(marzo%20de%201963).%3C/p%3E%0A', '2016-05-02 02:01:50', 'POST', 'comic', 'iron-man'),
(2, 'Inicio', '%3Ch1%3E%3Cstrong%3EBienvenidos%20a%20mi%20sitio%20web%20de%20peliculas%3C/strong%3E%3C/h1%3E%0A%0A%3Cp%3E&nbsp;%3C/p%3E%0A%0A%3Cp%3EEspero%20que%20disfrutes%20todas%20las%20peliculas%20que%20tenemos%20disponible%20en%20nuestro%20sitio%20web.%3C/p%3E%0A%0A%3Cp%3E&nbsp;%3C/p%3E%0A%0A%3Ch1%3E%3Ca%20href=%22http://localhost/cms/public/mis-peliculas%22%3E%3Cstrong%3EEntrar%3C/strong%3E%3C/a%3E%3C/h1%3E%0A', '2016-05-02 16:08:50', 'PAGE', '', ''),
(3, 'Mis Peliculas', '%3Cp%3EEstas%20todas%20las%20peliculas%20que%20est&aacute;n%20disponible%20en%20mi%20sitio%20web.%3C/p%3E%0A%0A%3Cp%3EEstas%20son%20las%20peliculas%20que%20tengo%20en%20mi%20web.%3C/p%3E%0A%0A%3Cp%3E%5Bmis_peliculas%5D%3C/p%3E%0A%0A%3Cp%3E%3Cstrong%3E%5Bsuma:1,3%5D%3C/strong%3E%3C/p%3E%0A', '2016-05-02 03:01:39', 'PAGE', '', 'mis-peliculas'),
(4, 'Hulk', '%3Cp%3EEsto%20habla%20sobre%20Hulk%3C/p%3E%0A', '2016-05-02 01:57:41', 'POST', 'comic', 'hulk'),
(5, 'La Bruja de Blair', '%3Cp%3EEste%20post%20habla%20sobre%20la%20bruja%20de%20blair.%3C/p%3E%0A', '2016-05-02 01:57:43', 'POST', 'terror', 'bruja-de-blair'),
(6, 'RÃ¡pido y furioso', '%3Cp%3ERapido%20y%20furioso!!!!!%3C/p%3E%0A', '2016-05-02 01:57:47', 'POST', 'AcciÃ³n', 'rapido-furioso');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
