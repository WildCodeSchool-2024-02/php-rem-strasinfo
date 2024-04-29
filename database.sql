-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Octobre 2017 à 13:53
-- Version du serveur :  5.7.19-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `simple-mvc`
--

-- --------------------------------------------------------

CREATE TABLE service (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `price` FLOAT NOT NULL, 
  `image` VARCHAR(255) NULL,
  description TEXT NOT NULL
);

INSERT INTO service (name, price, description) VALUES ('Diagnostic Complet', 50, 'Notre équipe effectue un diagnostic complet de votre ordinateur pour identifier les problèmes matériels et logiciels. Vous recevrez un rapport détaillé des problèmes détectés, ainsi que des recommandations pour les réparations nécessaires.'), 
('Réparation de Système d\'Exploitation', 80, 'Nous réparons les problèmes liés au système d\'exploitation de votre ordinateur, y compris les erreurs de démarrage, les plantages du système et les problèmes de performance. Nous assurons que votre système fonctionne de manière optimale.'),
('Nettoyage et Optimisation', 60, 'Notre équipe pourra éliminer les fichiers inutiles, les programmes indésirables et les virus de votre ordinateur. Nous optimisons également les paramètres pour améliorer les performances et la vitesse de votre système.'),
('Remplacement de Disque Dur', 120, 'Nous remplaçons votre disque dur défectueux par un nouveau, plus performant et plus fiable. Cette réparation est idéale pour résoudre les problèmes de stockage, les pannes de disque dur et les erreurs de lecture/écriture'),
('Réparation de Carte Mère', 150, 'Notre équipe de techniciens expérimentés répare les problèmes de carte mère, tels que les ports endommagés, les circuits défectueux et les problèmes de connectivité. Nous assurons le bon fonctionnement de votre ordinateur en réparant efficacement la carte mère'),
('Récupération de Données', 100, 'En cas de perte de données, notre service de récupération peut vous aider à retrouver vos fichiers importants. Nous utilisons des techniques avancées pour récupérer les données à partir de disques durs endommagés, de cartes mémoire et d\'autres supports de stockage.');


CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `adresse` TEXT NOT NULL,
  `isAdmin` BOOLEAN DEFAULT NULL,
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `user` (email, password, firstname, lastname, adresse, isAdmin) VALUES ('admin@admin.com', '$2y$10$lUMqQlZ805EXrgjY6GZhSOyPS6p7uAiuNDBKZKjcFKeyOjvHmHYdW', 'admin','admin', '12 rue de Paris', 1);

CREATE TABLE `service_user` (
    `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `description` TEXT NULL,
    `laptop` VARCHAR(150) NOT NULL,
    `service_id` INT NOT NULL,
  `user_id` INT NOT NULL,
    FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION 
)ENGINE = InnoDB;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;