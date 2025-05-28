-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: my_1_db:3306
-- Tiempo de generación: 28-05-2025 a las 15:08:56
-- Versión del servidor: 9.3.0
-- Versión de PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `defult_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date_init` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `amount` int NOT NULL,
  `url_image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `date_init`, `date_end`, `amount`, `url_image`, `created_at`, `updated_at`) VALUES
(1, 'Curso de Cocina Italiana Clásica', 'Aprende los secretos de la auténtica pasta y las salsas italianas.', '2025-01-10 09:00:00', '2025-03-10 17:00:00', 121, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSp_K2OKRNxf6vvDhITLSiUrWDG_Kt2ukhtfr6pypmTrvNoud0W0iraD4HR7FIf', '2024-02-15 10:30:00', '2024-03-01 14:15:00'),
(2, 'Curso de Repostería Francesa Avanzada', 'Domina la creación de postres clásicos y modernos franceses.', '2025-02-20 10:00:00', '2025-04-20 18:00:00', 186, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ8vV_A-38TveMgQL0VqoNA-vBWamckI1GeQO-ZzmNzgdClaoBsyEkN7pOFheUF', '2024-03-20 09:00:00', '2024-04-10 11:00:00'),
(3, 'Curso de Sushi y Cocina Japonesa', 'Introducción al arte del sushi, nigiri y rolls, además de técnicas básicas de cocina japonesa como tempura y teriyaki.', '2025-03-01 11:00:00', '2025-05-01 19:00:00', 210, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS_80lNbw9b9DR_ywJ73bwiB-waLnENX5HRf4mRjlS9xUyVY6Gp7g1f_l250ap', '2024-01-05 15:45:00', '2024-01-25 10:00:00'),
(4, 'Curso de Panadería Artesanal', 'Elaboración de panes de masa madre, baguettes, ciabattas y otras delicias horneadas con técnicas tradicionales.', '2025-04-15 08:30:00', '2025-06-15 16:30:00', 95, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWrlp5oGRYFsotB3mSwSqLM80XVlF03w-0jnHal_GkNV-Yu_cCB7J65BT_cVHC', '2024-04-01 11:00:00', '2024-04-20 09:30:00'),
(5, 'Curso de Cocina Saludable y Nutritiva', 'Recetas equilibradas y deliciosas para una vida más sana.', '2025-05-05 10:00:00', '2025-07-05 18:00:00', 130, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTOXdhLU1nmM5d_QbsO0kCqtO9BEPM_b76b-9WELbFex90D2MrkVoAWeDhY8MvN', '2024-05-10 14:00:00', '2024-05-28 16:00:00'),
(6, 'Curso de Parrilla y Ahumados Argentinos', 'Dominio de la carne a la parrilla y técnicas de ahumado.', '2025-06-01 12:00:00', '2025-08-01 20:00:00', 250, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTat4gBwrR_kPWuz22aEyWk5FyxNAWLDUAhK5RFFp6N56RDyIEfBBcnosB_izsr', '2024-06-05 10:00:00', '2024-06-25 13:00:00'),
(7, 'Curso de Coctelería Clásica y Moderna', 'Técnicas de preparación de cócteles clásicos y creaciones modernas.', '2025-07-10 14:00:00', '2025-09-10 22:00:00', 160, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTShk8JrHN1aTDRAxGOZ7hgTz-sjkQkQLv6bGUKlGwIlTJq_31y0Ci4M9IvmLZT', '2024-07-01 11:30:00', '2024-07-15 15:00:00'),
(8, 'Curso de Pastas Sin Gluten y Veganas', 'Descubre cómo hacer pastas y platos deliciosos sin gluten y aptos para veganos.', '2025-08-01 09:30:00', '2025-10-01 17:30:00', 115, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXsroAUmDo92Zt5tm7FoIiOo-ojCBPcDzZwwjW3oukrxh3vkEk4jPV-SbipMFG', '2024-08-12 09:45:00', '2024-08-30 11:30:00'),
(9, 'Curso de Cocina Peruana Fusión', 'Explora los sabores vibrantes y las técnicas culinarias de Perú.', '2025-09-10 10:00:00', '2025-11-10 18:00:00', 190, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSBB73UOXELJUoClb8tV-7HfsAyXCayBqe6FuazqBoA3Fago_VJ3N3xCJgkMGL_', '2024-09-01 13:00:00', '2024-09-20 16:00:00'),
(10, 'Curso de Introducción al Mundo del Vino', 'Conceptos básicos sobre el vino, cata y maridaje perfecto.', '2025-10-01 11:00:00', '2025-12-01 19:00:00', 140, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSylJsUEQYmSzCH-SEaN2o6zWC6g862YWu-7Y4Qpg7_c-fh2Y19DVpztJqhMXnF', '2024-10-05 10:15:00', '2024-10-25 12:45:00'),
(11, 'Curso de Chocolatería Artesanal', 'Desde el grano hasta la barra: el arte de crear chocolates artesanales.', '2025-11-05 09:00:00', '2026-01-05 17:00:00', 175, 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQMw1dBgBMqblpHhdhHKVBQHyGizsNmTBpSoMF4Kh0w3wSgtV9e2X00v7nrWwSL', '2024-01-22 16:00:00', '2024-02-10 09:00:00'),
(12, 'Curso de Cocina Asiática Express', 'Explora sabores exóticos y técnicas culinarias de Asia.', '2025-12-01 10:30:00', '2026-02-01 18:30:00', 135, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTd8vqqiONeRBgV9nbtqJZaIhMOBzavUZZtH0vXyRt_m9jAFSoDHnyrk1T3JlP7', '2024-03-08 12:00:00', '2024-03-28 14:00:00'),
(13, 'Curso de El Arte del Café: Barista', 'Conviértete en barista experto: técnicas de extracción, latte art y más.', '2026-01-15 08:00:00', '2026-03-15 16:00:00', 155, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT-He8jY-jy-Ok6uyvtrq8uv6znelTOWKVAUByxW576KZ2SGw8Rq8MclaFr0J7T', '2024-04-18 10:45:00', '2024-05-05 13:30:00'),
(14, 'Curso de Cocina Mexicana Auténtica', 'Tacos, enchiladas, moles y todo el sabor de México en tu cocina.', '2026-02-01 12:00:00', '2026-04-01 20:00:00', 165, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRGMVT3XS1bBuc9kyZZmzIhUMsB8effkzSXEBrzKVkP3Viv1NYoNHmI0Bv32-6t', '2024-05-22 11:15:00', '2024-06-11 15:45:00'),
(15, 'Curso de Gestión de Restaurantes', 'Principios de operación, finanzas y marketing para la gestión de un negocio de alimentos.', '2026-03-10 09:00:00', '2026-05-10 17:00:00', 280, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSC6rc6Xac2hnAxOiSYKWBy4XF_SUF0--nC9ttvGWurEd1Gm8DJhTOphQf-Yv2p', '2024-06-15 09:30:00', '2024-07-05 10:00:00'),
(16, 'Curso de Ensaladas Creativas y Aderezos', 'Crea ensaladas frescas y saludables con aderezos caseros e innovadores.', '2026-04-05 10:00:00', '2026-06-05 18:00:00', 80, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQPICzAjLWlR2O7hLnVaWu8Hj3kswYRvA2sv2wHKR0MfM0bA2eyOKNWVptGnMH5', '2024-07-28 14:00:00', '2024-08-15 16:30:00'),
(17, 'Curso de Cocina Tailandesa: Curry y Especias', 'Domina los sabores y técnicas de la cocina tailandesa, incluyendo currys aromáticos.', '2026-05-01 11:00:00', '2026-07-01 19:00:00', 195, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQa3WGk1vZ9spayIEz9jB-NEWF0PR4WAk2AflCNyDbQs1ZiMMwwSRGwvqarmhgz', '2024-08-03 10:00:00', '2024-08-22 12:00:00'),
(18, 'Curso de Catering y Eventos', 'Planificación, producción y ejecución de eventos gastronómicos.', '2026-06-15 10:30:00', '2026-08-15 18:30:00', 320, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz01uNHXXc_5vkmytUIJlnlH42x4uUYZl0YDbOe-eyVW1JEcQTkLuP8wKbbzx9', '2024-09-10 11:00:00', '2024-09-30 14:00:00'),
(19, 'Curso de Fermentados y Probióticos', 'Descubre los beneficios y cómo elaborar tus propios alimentos fermentados.', '2026-07-01 09:00:00', '2026-09-01 17:00:00', 105, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS9-JM9htJs_Aryer2KFGFL87_ZZF4EB2kq027aQTYFZZ-dDmwCdAS5b2KHqVu8', '2024-10-14 09:00:00', '2024-10-29 11:00:00'),
(20, 'Curso de Cocina de Caza y Pescados de Río', 'Técnicas para preparar platos con ingredientes de caza y pesca sostenible.', '2026-08-10 11:00:00', '2026-10-10 19:00:00', 200, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcShj0-nLaTH6Gl6OCvGt7ejQFkfVGKXR1nQBwEI_3ONiWBtpLNElCCvAO3CQUAd', '2024-02-01 13:00:00', '2024-02-20 15:00:00'),
(21, 'Curso de Decoración de Tortas', 'Técnicas básicas y avanzadas para decorar tortas de forma profesional.', '2026-09-01 09:30:00', '2026-11-01 17:30:00', 145, 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSisz0UNKzd27sxnsE-v_lkTKfWL6BV72yt2STcxUr81hPTbiUPhyotMAY6bvh4', '2024-03-11 10:00:00', '2024-03-30 12:00:00'),
(22, 'Curso de Introducción a la Sommellerie', 'Vinos del mundo, regiones, variedades y cata experta para principiantes.', '2026-10-05 10:00:00', '2026-12-05 18:00:00', 170, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS6zSdHRb0VFpxE0jv5P3Lpm2Wiz118frhSKNIVtVtyXe9pfjuUVEIfO7Dtt0Qn', '2024-04-05 14:00:00', '2024-04-25 16:00:00'),
(23, 'Curso de Cocina Griega y Mediterránea', 'Sabores frescos y saludables: un viaje culinario por Grecia y el Mediterráneo.', '2026-11-01 11:00:00', '2027-01-01 19:00:00', 130, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRUaZUsriDxRdH4BQQc-qWV0mwO9IqzGh0qKqJnc_3wVD6Cmr9Xx-ROsArvkmaC', '2024-05-01 09:30:00', '2024-05-18 11:30:00'),
(24, 'Curso de Conservas y Mermeladas Caseras', 'Aprende a preparar conservas, mermeladas y encurtidos caseros.', '2026-12-05 08:30:00', '2027-02-05 16:30:00', 90, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTbbTKhyksLYsewoEN2bdkM6x2rmhqToomOc_keLkNiXGj1hUTpXTV2l1UvGcLU', '2024-06-20 15:00:00', '2024-07-07 17:00:00'),
(25, 'Curso de Cocina para Niños (Edición Verano)', 'Clases divertidas de cocina para los más pequeños, con recetas fáciles y saludables.', '2025-01-20 09:00:00', '2025-03-20 17:00:00', 75, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1cYmEgJOlaspUstjWFvFD9mGuuq2c0HAjYez4eg-qujuHlktrczMlOMbeGwBb', '2024-07-10 10:00:00', '2024-07-25 12:00:00'),
(26, 'Curso de Bebidas Saludables y Smoothies', 'Elabora bebidas refrescantes y nutritivas: zumos, batidos y más.', '2025-02-15 10:00:00', '2025-04-15 18:00:00', 85, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSVt_vBJBOi5uKQCYAKUT8oEaz-OPzPvANiDiJ_OIzFhxKjLqHH9PC2GEm-r1Tk', '2024-08-05 11:00:00', '2024-08-20 13:00:00'),
(27, 'Curso de Street Food Internacional', 'Un recorrido por la comida callejera más popular del mundo.', '2025-03-20 11:00:00', '2025-05-20 19:00:00', 160, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSXM1KD6pcI3sOCmWPmPbg7qzNKv1yBSH0k0Rof5tYaCxGfCRNOt1AkH-H_wsvS', '2024-09-08 14:00:00', '2024-09-28 16:00:00'),
(28, 'Curso de Cocina Molecular (Introducción)', 'Explora las técnicas de la gastronomía molecular para crear platos innovadores.', '2025-04-01 12:00:00', '2025-06-01 20:00:00', 270, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTtMR64ohKe3mq913nFEyPbM70YEf_MI8mEV2RbUbdYLj7aWBzX1VTZ4ZoIzNxt', '2024-10-01 10:30:00', '2024-10-15 12:30:00'),
(29, 'Curso de Cocina Vegetariana y Vegana', 'Recetas creativas y deliciosas para una dieta sin productos animales.', '2025-05-10 09:30:00', '2025-07-10 17:30:00', 110, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSLSw5rtS4U7cVxaET0DbGEAvyK1RrWWuBeNsfDBlVGYny0FSdSqJlktcSuJdHO', '2024-01-10 09:00:00', '2024-01-28 11:00:00'),
(30, 'Curso de Platos Fáciles para el Día a Día', 'Soluciones rápidas y deliciosas para cocinar en el día a día sin complicaciones.', '2025-06-01 10:00:00', '2025-08-01 18:00:00', 90, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT60eJhF-K1LXFqCliT4VgXcO_MhnRfXEDcknLDcopc041bgaj_5CaVhNLfVLZJ', '2024-02-20 14:00:00', '2024-03-10 16:00:00'),
(31, 'Taller de Fotografía Culinaria', 'Aprende a capturar tus creaciones culinarias de forma profesional.', '2025-07-01 11:00:00', '2025-09-01 19:00:00', 150, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSp_K2OKRNxf6vvDhITLSiUrWDG_Kt2ukhtfr6pypmTrvNoud0W0iraD4HR7FIf', '2024-03-01 11:00:00', '2024-03-25 13:00:00'),
(32, 'Curso de Repostería Creativa para Eventos', 'Diseña y elabora postres espectaculares para cualquier celebración.', '2025-08-05 09:00:00', '2025-10-05 17:00:00', 220, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ8vV_A-38TveMgQL0VqoNA-vBWamckI1GeQO-ZzmNzgdClaoBsyEkN7pOFheUF', '2024-04-10 09:00:00', '2024-05-01 11:00:00'),
(33, 'Cocina Regional Argentina: Sabores del Norte', 'Un viaje culinario por las tradiciones y platos del norte argentino.', '2025-09-15 10:00:00', '2025-11-15 18:00:00', 160, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS_80lNbw9b9DR_ywJ73bwiB-waLnENX5HRf4mRjlS9xUyVY6Gp7g1f_l250ap', '2024-05-15 14:00:00', '2024-06-05 16:00:00'),
(34, 'Técnicas de Fermentación Avanzadas', 'Profundiza en la ciencia y el arte de la fermentación de alimentos.', '2025-10-01 11:00:00', '2025-12-01 19:00:00', 175, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWrlp5oGRYFsotB3mSwSqLM80XVlF03w-0jnHal_GkNV-Yu_cCB7J65BT_cVHC', '2024-06-01 10:00:00', '2024-06-28 12:00:00'),
(35, 'Introducción a la Cocina Sostenible', 'Descubre cómo cocinar de forma responsable y amigable con el medio ambiente.', '2025-11-05 09:30:00', '2026-01-05 17:30:00', 110, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTOXdhLU1nmM5d_QbsO0kCqtO9BEPM_b76b-9WELbFex90D2MrkVoAWeDhY8MvN', '2024-07-05 11:30:00', '2024-07-20 13:30:00'),
(36, 'Dominio del Horno de Barro y Leña', 'Aprende a cocinar como un experto en hornos tradicionales.', '2025-12-01 12:00:00', '2026-02-01 20:00:00', 280, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTat4gBwrR_kPWuz22aEyWk5FyxNAWLDUAhK5RFFp6N56RDyIEfBBcnosB_izsr', '2024-08-01 09:00:00', '2024-08-25 11:00:00'),
(37, 'Cerveza Artesanal: Del Grano a la Copa', 'Todo lo que necesitas saber para elaborar tu propia cerveza casera.', '2026-01-10 10:00:00', '2026-03-10 18:00:00', 190, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTShk8JrHN1aTDRAxGOZ7hgTz-sjkQkQLv6bGUKlGwIlTJq_31y0Ci4M9IvmLZT', '2024-09-01 13:00:00', '2024-09-20 15:00:00'),
(38, 'Cocina de Mar y Pescados Frescos', 'Descubre las mejores técnicas para cocinar delicias del mar.', '2026-02-20 11:00:00', '2026-04-20 19:00:00', 210, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXsroAUmDo92Zt5tm7FoIiOo-ojCBPcDzZwwjW3oukrxh3vkEk4jPV-SbipMFG', '2024-10-01 10:00:00', '2024-10-20 12:00:00'),
(39, 'Pastelería para Intolerancias Alimentarias', 'Recetas dulces y seguras para personas con dietas especiales.', '2026-03-01 09:00:00', '2026-05-01 17:00:00', 130, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSBB73UOXELJUoClb8tV-7HfsAyXCayBqe6FuazqBoA3Fago_VJ3N3xCJgkMGL_', '2024-01-20 12:00:00', '2024-02-10 14:00:00'),
(40, 'Cultivo de Hongos Comestibles', 'Guía completa para cultivar tus propios hongos en casa.', '2026-04-15 10:00:00', '2026-06-15 18:00:00', 115, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSylJsUEQYmSzCH-SEaN2o6zWC6g862YWu-7Y4Qpg7_c-fh2Y19DVpztJqhMXnF', '2024-02-28 09:00:00', '2024-03-15 11:00:00'),
(41, 'Cocina para Fiestas y Celebraciones', 'Recetas y tips para organizar banquetes inolvidables.', '2026-05-01 11:00:00', '2026-07-01 19:00:00', 240, 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQMw1dBgBMqblpHhdhHKVBQHyGizsNmTBpSoMF4Kh0w3wSgtV9e2X00v7nrWwSL', '2024-03-25 15:00:00', '2024-04-10 17:00:00'),
(42, 'El Arte de la Charcutería Casera', 'Elabora tus propios embutidos y fiambres artesanales.', '2026-06-10 09:00:00', '2026-08-10 17:00:00', 180, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTd8vqqiONeRBgV9nbtqJZaIhMOBzavUZZtH0vXyRt_m9jAFSoDHnyrk1T3JlP7', '2024-04-20 10:00:00', '2024-05-05 12:00:00'),
(43, 'Introducción a la Cocina Oriental', 'Descubre los sabores y técnicas de la cocina asiática.', '2026-07-05 10:00:00', '2026-09-05 18:00:00', 140, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT-He8jY-jy-Ok6uyvtrq8uv6znelTOWKVAUByxW576KZ2SGw8Rq8MclaFr0J7T', '2024-05-08 11:00:00', '2024-05-25 13:00:00'),
(44, 'Repostería con Vegetales y Frutas', 'Aprende a incorporar ingredientes saludables en tus postres.', '2026-08-01 11:00:00', '2026-10-01 19:00:00', 105, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRGMVT3XS1bBuc9kyZZmzIhUMsB8effkzSXEBrzKVkP3Viv1NYoNHmI0Bv32-6t', '2024-06-03 14:00:00', '2024-06-20 16:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `handle_courses`
--

CREATE TABLE `handle_courses` (
  `id` bigint UNSIGNED NOT NULL,
  `id_course` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED DEFAULT NULL,
  `id_payment` bigint UNSIGNED DEFAULT NULL,
  `date_init` date NOT NULL,
  `date_end` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `handle_courses`
--

INSERT INTO `handle_courses` (`id`, `id_course`, `id_user`, `id_payment`, `date_init`, `date_end`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 3, NULL, '2025-07-15', '2026-01-20', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(2, 7, 5, NULL, '2025-07-15', '2026-01-20', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(3, 7, 1, NULL, '2025-07-15', '2026-01-20', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(4, 1, 4, NULL, '2025-10-10', '2026-04-15', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(5, 1, 3, NULL, '2025-10-10', '2026-04-15', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(6, 1, 2, NULL, '2025-10-10', '2026-04-15', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(7, 1, 1, NULL, '2025-10-10', '2026-04-15', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(8, 3, 3, NULL, '2025-09-15', '2026-03-30', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(9, 10, 2, NULL, '2025-10-01', '2026-04-05', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(10, 4, 5, NULL, '2025-11-08', '2026-05-18', 'pending', '2025-05-28 03:12:33', '2025-05-28 03:12:33'),
(11, 17, 1, NULL, '2025-04-20', '2025-09-09', 'active', '2025-05-28 04:35:16', '2025-05-28 04:35:16'),
(12, 17, 3, NULL, '2025-04-20', '2025-09-09', 'active', '2025-05-28 04:35:16', '2025-05-28 04:35:16'),
(13, 17, 5, NULL, '2025-04-20', '2025-09-09', 'active', '2025-05-28 04:35:16', '2025-05-28 04:35:16'),
(14, 17, 2, NULL, '2025-04-20', '2025-09-09', 'active', '2025-05-28 04:35:16', '2025-05-28 04:35:16'),
(15, 17, 4, NULL, '2025-04-20', '2025-09-09', 'active', '2025-05-28 04:35:16', '2025-05-28 04:35:16'),
(16, 22, 1, NULL, '2025-01-20', '2025-07-20', 'active', '2025-05-28 04:46:39', '2025-05-28 04:46:39'),
(17, 22, 3, NULL, '2025-01-20', '2025-07-20', 'active', '2025-05-28 04:46:39', '2025-05-28 04:46:39'),
(18, 22, 5, NULL, '2025-01-20', '2025-07-20', 'active', '2025-05-28 04:46:39', '2025-05-28 04:46:39'),
(19, 24, 1, NULL, '2025-01-10', '2025-02-15', 'cancelled', '2025-05-28 04:58:55', '2025-05-28 04:58:55'),
(20, 24, 2, NULL, '2025-01-10', '2025-02-15', 'cancelled', '2025-05-28 04:58:55', '2025-05-28 04:58:55'),
(21, 24, 3, NULL, '2025-01-10', '2025-02-15', 'cancelled', '2025-05-28 04:58:55', '2025-05-28 04:58:55'),
(22, 29, 4, NULL, '2025-02-05', '2025-03-20', 'cancelled', '2025-05-28 04:59:11', '2025-05-28 04:59:11'),
(23, 29, 5, NULL, '2025-02-05', '2025-03-20', 'cancelled', '2025-05-28 04:59:11', '2025-05-28 04:59:11'),
(24, 29, 1, NULL, '2025-02-05', '2025-03-20', 'cancelled', '2025-05-28 04:59:11', '2025-05-28 04:59:11'),
(25, 35, 2, NULL, '2025-03-25', '2025-05-20', 'cancelled', '2025-05-28 04:59:26', '2025-05-28 04:59:26'),
(26, 35, 3, NULL, '2025-03-25', '2025-05-20', 'cancelled', '2025-05-28 04:59:26', '2025-05-28 04:59:26'),
(27, 35, 4, NULL, '2025-03-25', '2025-05-20', 'cancelled', '2025-05-28 04:59:26', '2025-05-28 04:59:26'),
(28, 35, 5, NULL, '2025-03-25', '2025-05-20', 'cancelled', '2025-05-28 04:59:26', '2025-05-28 04:59:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_25_004910_create_courses_table', 1),
(6, '2025_05_26_150134_create_payments_table', 1),
(7, '2025_05_27_183242_create_handle_courses_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number_hashed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_month_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvv_hashed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ARS',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `course_id`, `full_name`, `email`, `phone`, `card_number_hashed`, `expiry_month_year`, `card_holder_name`, `dni`, `cvv_hashed`, `amount`, `currency`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 'Usuario Uno', 'usuario1@example.com', '5491111111111', 'hashed_card_A1B2C3D4', '01/26', 'USUARIO UNO', '11111111', 'hashed_cvv_111', 160.00, 'ARS', 'completed', '2025-05-10 10:00:00', '2025-05-28 04:03:25'),
(2, 3, 7, 'Usuario Tres', 'usuario3@example.com', '5491133333333', 'hashed_card_E5F6G7H8', '05/27', 'USUARIO TRES', '33333333', 'hashed_cvv_333', 160.00, 'ARS', 'completed', '2025-04-25 14:30:00', '2025-05-28 04:03:25'),
(3, 5, 7, 'Usuario Cinco', 'usuario5@example.com', '5491155555555', 'hashed_card_I9J0K1L2', '09/28', 'USUARIO CINCO', '55555555', 'hashed_cvv_555', 160.00, 'ARS', 'completed', '2026-05-15 09:15:00', '2025-05-28 04:03:25'),
(4, 1, 1, 'Usuario Uno (Rep.)', 'usuario1_rep@example.com', '5491111111112', 'hashed_card_M3N4O5P6', '03/26', 'USUARIO UNO', '11111112', 'hashed_cvv_112', 160.00, 'ARS', 'completed', '2025-09-04 11:45:00', '2025-05-28 04:03:25'),
(5, 4, 1, 'Usuario Cuatro', 'usuario4@example.com', '5491144444444', 'hashed_card_Q7R8S9T0', '02/27', 'USUARIO CUATRO', '44444444', 'hashed_cvv_444', 121.00, 'ARS', 'completed', '2025-11-05 10:30:00', '2025-05-28 04:14:28'),
(6, 3, 1, 'Usuario Tres (B)', 'usuario3b@example.com', '5491133333334', 'hashed_card_U1V2W3X4', '06/28', 'USUARIO TRES', '33333334', 'hashed_cvv_334', 121.00, 'ARS', 'completed', '2026-01-20 15:00:00', '2025-05-28 04:14:28'),
(7, 2, 1, 'Usuario Dos', 'usuario2@example.com', '5491122222222', 'hashed_card_Y5Z6A7B8', '10/26', 'USUARIO DOS', '22222222', 'hashed_cvv_222', 121.00, 'ARS', 'completed', '2026-03-10 09:00:00', '2025-05-28 04:14:28'),
(8, 3, 3, 'Usuario Uno (C)', 'usuario1c@example.com', '5491111111113', 'hashed_card_C9D0E1F2', '04/27', 'USUARIO UNO', '11111113', 'hashed_cvv_113', 210.00, 'ARS', 'completed', '2025-12-15 12:00:00', '2025-05-28 04:14:28'),
(9, 2, 10, 'Usuario Dos', 'usuario2_new@example.com', '5491122222223', 'hashed_card_G3H4I5J6', '07/28', 'USUARIO DOS', '22222223', 'hashed_cvv_223', 140.00, 'ARS', 'completed', '2025-09-20 10:00:00', '2025-05-28 04:23:13'),
(10, 5, 4, 'Usuario Cinco', 'usuario5_new@example.com', '5491155555556', 'hashed_card_K7L8M9N0', '12/29', 'USUARIO CINCO', '55555556', 'hashed_cvv_556', 95.00, 'ARS', 'completed', '2025-05-28 01:27:25', '2025-05-28 04:27:49'),
(11, 1, 22, 'Usuario Uno', 'usuario1_payment@example.com', '5491111111114', 'hashed_card_P1Q2R3S4', '08/29', 'USUARIO UNO', '11111114', 'hashed_cvv_114', 170.00, 'ARS', 'completed', '2025-01-20 10:00:00', '2025-05-28 04:49:09'),
(12, 3, 22, 'Usuario Tres', 'usuario3_payment@example.com', '5491133333335', 'hashed_card_T5U6V7W8', '09/27', 'USUARIO TRES', '33333335', 'hashed_cvv_335', 170.00, 'ARS', 'completed', '2025-01-20 10:00:00', '2025-05-28 04:49:09'),
(13, 5, 22, 'Usuario Cinco', 'usuario5_payment@example.com', '5491155555557', 'hashed_card_X9Y0Z1A2', '10/26', 'USUARIO CINCO', '55555557', 'hashed_cvv_557', 170.00, 'ARS', 'completed', '2025-01-20 10:00:00', '2025-05-28 04:49:09'),
(14, 3, 24, 'Usuario Tres (Pago)', 'usuario3_pago@example.com', '5491133333336', 'hashed_card_B3C4D5E6', '01/28', 'USUARIO TRES', '33333336', 'hashed_cvv_336', 110.00, 'ARS', 'completed', '2025-06-15 11:00:00', '2025-05-28 05:08:04'),
(15, 2, 24, 'Usuario Dos (Pago)', 'usuario2_pago@example.com', '5491122222224', 'hashed_card_F7G8H9I0', '02/27', 'USUARIO DOS', '22222224', 'hashed_cvv_224', 110.00, 'ARS', 'completed', '2025-10-01 14:00:00', '2025-05-28 05:08:04'),
(16, 1, 24, 'Usuario Uno (Pago)', 'usuario1_pago@example.com', '5491111111115', 'hashed_card_J1K2L3M4', '03/26', 'USUARIO UNO', '11111115', 'hashed_cvv_115', 110.00, 'ARS', 'completed', '2026-01-05 09:30:00', '2025-05-28 05:08:04'),
(17, 2, 35, 'Usuario Dos (Pago)', 'usuario2_pay@example.com', '5491122222225', 'hashed_card_N5O6P7Q8', '04/27', 'USUARIO DOS', '22222225', 'hashed_cvv_225', 110.00, 'ARS', 'completed', '2025-02-20 10:00:00', '2025-05-28 05:10:00'),
(18, 3, 35, 'Usuario Tres (Pago)', 'usuario3_pay@example.com', '5491133333337', 'hashed_card_R9S0T1U2', '05/28', 'USUARIO TRES', '33333337', 'hashed_cvv_337', 110.00, 'ARS', 'completed', '2025-03-05 14:30:00', '2025-05-28 05:10:00'),
(19, 4, 35, 'Usuario Cuatro (Pago)', 'usuario4_pay@example.com', '5491144444445', 'hashed_card_V3W4X5Y6', '06/29', 'USUARIO CUATRO', '44444445', 'hashed_cvv_445', 110.00, 'ARS', 'completed', '2025-03-18 09:15:00', '2025-05-28 05:10:00'),
(20, 1, 29, 'Usuario Uno (Pago)', 'usuario1_pay2@example.com', '5491111111116', 'hashed_card_Z7A8B9C0', '05/27', 'USUARIO UNO', '11111116', 'hashed_cvv_116', 110.00, 'ARS', 'completed', '2025-02-05 09:00:00', '2025-05-28 05:14:43'),
(21, 4, 29, 'Usuario Cuatro (Pago)', 'usuario4_pay2@example.com', '5491144444446', 'hashed_card_D1E2F3G4', '06/28', 'USUARIO CUATRO', '44444446', 'hashed_cvv_446', 110.00, 'ARS', 'completed', '2025-02-12 11:30:00', '2025-05-28 05:14:43'),
(22, 5, 29, 'Usuario Cinco (Pago)', 'usuario5_pay2@example.com', '5491155555558', 'hashed_card_H5I6J7K8', '07/29', 'USUARIO CINCO', '55555558', 'hashed_cvv_558', 110.00, 'ARS', 'completed', '2025-02-18 14:00:00', '2025-05-28 05:14:43'),
(23, 1, 29, 'Usuario Uno (Pago Rep.)', 'usuario1_pay3@example.com', '5491111111117', 'hashed_card_L9M0N1O2', '08/27', 'USUARIO UNO', '11111117', 'hashed_cvv_117', 110.00, 'ARS', 'completed', '2025-02-08 10:45:00', '2025-05-28 05:14:43'),
(24, 2, 40, 'Fabiana Iozia', 'cardiosancris@gmail.com', '340866960', '6441', '2029-09', 'Fabiana Carina Iozia', '35878521', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 115.00, 'ARS', 'completed', '2025-05-28 14:17:24', '2025-05-28 14:17:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rosario Talar Luke', 'ro.talu@gmail.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2025-05-01 10:00:00', '2025-05-01 10:00:00'),
(2, 'María García', 'maria.garcia@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2025-05-05 11:30:00', '2025-05-05 11:30:00'),
(3, 'Carlos Rodríguez', 'carlos.rodriguez@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2025-05-10 14:00:00', '2025-05-10 14:00:00'),
(4, 'Laura Fernández', 'laura.fernandez@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2025-05-15 09:15:00', '2025-05-15 09:15:00'),
(5, 'Pedro Sánchez', 'pedro.sanchez@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2025-05-20 16:45:00', '2025-05-20 16:45:00'),
(6, 'Admin', 'admin@admin.com', NULL, 'admin1234', NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `handle_courses`
--
ALTER TABLE `handle_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `handle_courses_id_course_foreign` (`id_course`),
  ADD KEY `handle_courses_id_user_foreign` (`id_user`),
  ADD KEY `handle_courses_id_payment_foreign` (`id_payment`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_course_id_foreign` (`course_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `handle_courses`
--
ALTER TABLE `handle_courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `handle_courses`
--
ALTER TABLE `handle_courses`
  ADD CONSTRAINT `handle_courses_id_course_foreign` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `handle_courses_id_payment_foreign` FOREIGN KEY (`id_payment`) REFERENCES `payments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `handle_courses_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
