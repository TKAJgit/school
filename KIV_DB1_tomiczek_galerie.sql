-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 08. led 2018, 19:40
-- Verze serveru: 10.1.28-MariaDB
-- Verze PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `galerie_tkaj`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `fotka`
--

CREATE TABLE `fotka` (
  `id_FOTKA` int(11) NOT NULL,
  `UMISTENI_id_GALERIE` int(11) NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `podnadpis` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `popis` longtext COLLATE utf8_czech_ci,
  `datum_zalozeni` timestamp NULL DEFAULT NULL,
  `datum_zmeny` timestamp NULL DEFAULT NULL,
  `platnost` int(11) DEFAULT NULL,
  `odkaz_na_fotku` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `fotka`
--

INSERT INTO `fotka` (`id_FOTKA`, `UMISTENI_id_GALERIE`, `nazev`, `podnadpis`, `popis`, `datum_zalozeni`, `datum_zmeny`, `platnost`, `odkaz_na_fotku`) VALUES
(64, 49, 'Cesta', NULL, 'Fotografie zděluje možnost volby.', '2017-12-13 23:00:00', '2017-12-13 23:00:00', 1, 'cesta01.jpg'),
(65, 49, 'Procitnuti', NULL, 'Malby vytváří vzpomínky na historii.', '2017-12-13 23:00:00', '2017-12-13 23:00:00', 1, 'proc02.jpg'),
(66, 12, 'Nový', NULL, 'Poznal jsem novou.', '2017-12-13 23:00:00', '2017-12-13 23:00:00', 1, 'nova02.jpg'),
(67, 12, 'Koncert', 'Zábava', NULL, '2018-01-03 23:00:00', '2018-01-09 23:00:00', 0, 'koncert05.jpg'),
(68, 2, 'Běžný', NULL, 'Plný stůl věcí které odvádí pozornost od učení.', '2018-01-09 23:00:00', '2018-01-09 23:00:00', 0, 'bezny01.jpg'),
(69, 2, 'Super i hrdina', 'Každy může býr hrdina', NULL, '2018-01-03 23:00:00', '2018-01-03 23:00:00', 1, 'hrdina01.jpg'),
(70, 3, 'Sova', 'Ilustrace', NULL, '2018-01-11 23:00:00', '2018-01-10 23:00:00', 1, 'sova02.jpg'),
(71, 3, 'Stroje', 'období páry', NULL, '2018-01-10 23:00:00', '2018-01-10 23:00:00', 0, 'stroj02.jpg'),
(72, 3, 'Stroj', 'pod vodou', NULL, '2018-01-03 23:00:00', '2018-01-08 23:00:00', 0, 'stroj01.jpg');

-- --------------------------------------------------------

--
-- Struktura tabulky `galerie`
--

CREATE TABLE `galerie` (
  `id_GALERIE` int(11) NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `podnadpis` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `datum_zalozeni` timestamp NULL DEFAULT NULL,
  `datum_zmeny` timestamp NULL DEFAULT NULL,
  `typ_galerie` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `platnost` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `popis` longtext COLLATE utf8_czech_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `galerie`
--

INSERT INTO `galerie` (`id_GALERIE`, `nazev`, `podnadpis`, `datum_zalozeni`, `datum_zmeny`, `typ_galerie`, `platnost`, `popis`) VALUES
(2, 'Plakáty', 'Tvořím na zakázku.', '2017-12-13 23:00:00', '2017-12-25 23:00:00', '1', '0', ''),
(3, 'Grafiky', 'Tvorba pro radost', '2017-12-05 23:00:00', '2017-12-17 23:00:00', '1', '1', ''),
(12, 'Loga', 'Tvořm rád', '2017-12-16 23:00:00', '2017-12-17 23:00:00', NULL, '1', ''),
(49, 'Malby', 'Letní krajinky', '2018-01-03 23:00:00', '2018-01-03 23:00:00', NULL, '1', 'Krajina v pojetí moderních si-realistů.');

-- --------------------------------------------------------

--
-- Struktura tabulky `role`
--

CREATE TABLE `role` (
  `id_PRAVA` int(11) NOT NULL,
  `nazev` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `role`
--

INSERT INTO `role` (`id_PRAVA`, `nazev`) VALUES
(1, 'Admin'),
(2, 'Redaktor'),
(3, 'Autor');

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel`
--

CREATE TABLE `uzivatel` (
  `id_UZIVATEL` int(11) NOT NULL,
  `id_PRAVA` int(11) NOT NULL,
  `login` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `jmeno` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `prijmeni` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `heslo` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `mail` varchar(45) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatel`
--

INSERT INTO `uzivatel` (`id_UZIVATEL`, `id_PRAVA`, `login`, `jmeno`, `prijmeni`, `heslo`, `mail`) VALUES
(2, 1, 'Pav', 'Pav', 'Pav', 'Pav', 'tomi@gmail.com'),
(11, 2, 'cestovatel', 'Jiří', 'Buřil', 'cervena', 'buril.jan@gmail.com'),
(12, 1, 'kuchař', 'Martin ', 'Vostrý', 'modra', 'vostry@gmail.com'),
(13, 3, 'bachař', 'Honza ', 'Radobyl', 'bila', 'radob@seznam.com'),
(50, 2, 'Jindrich', 'Jindrich', 'Horn', 'svetlo', 'jind@seznam.cz'),
(51, 3, 'Pavel', 'Pavel', 'Severa', 'cesta', 'pav.sev@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel_has_fotka`
--

CREATE TABLE `uzivatel_has_fotka` (
  `UZIVATEL` int(11) NOT NULL,
  `FOTKA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatel_has_fotka`
--

INSERT INTO `uzivatel_has_fotka` (`UZIVATEL`, `FOTKA`) VALUES
(11, 64),
(11, 67),
(12, 65),
(12, 66),
(12, 68),
(50, 69),
(50, 71),
(51, 70),
(51, 72);

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel_has_galerie`
--

CREATE TABLE `uzivatel_has_galerie` (
  `UZIVATEL` int(11) NOT NULL,
  `GALERIE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatel_has_galerie`
--

INSERT INTO `uzivatel_has_galerie` (`UZIVATEL`, `GALERIE`) VALUES
(2, 12),
(2, 49),
(12, 2),
(12, 3);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `fotka`
--
ALTER TABLE `fotka`
  ADD PRIMARY KEY (`id_FOTKA`),
  ADD KEY `fk_FOTKA_GALERIE1_idx` (`UMISTENI_id_GALERIE`);

--
-- Klíče pro tabulku `galerie`
--
ALTER TABLE `galerie`
  ADD PRIMARY KEY (`id_GALERIE`);

--
-- Klíče pro tabulku `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_PRAVA`);

--
-- Klíče pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  ADD PRIMARY KEY (`id_UZIVATEL`),
  ADD KEY `fk_UZIVATEL_PRAVA_UZIVATELU1_idx` (`id_PRAVA`);

--
-- Klíče pro tabulku `uzivatel_has_fotka`
--
ALTER TABLE `uzivatel_has_fotka`
  ADD PRIMARY KEY (`UZIVATEL`,`FOTKA`),
  ADD KEY `fk_UZIVATEL_has_FOTKA_FOTKA1_idx` (`FOTKA`),
  ADD KEY `fk_UZIVATEL_has_FOTKA_UZIVATEL1_idx` (`UZIVATEL`);

--
-- Klíče pro tabulku `uzivatel_has_galerie`
--
ALTER TABLE `uzivatel_has_galerie`
  ADD PRIMARY KEY (`UZIVATEL`,`GALERIE`),
  ADD KEY `fk_UZIVATEL_has_GALERIE_GALERIE1_idx` (`GALERIE`),
  ADD KEY `fk_UZIVATEL_has_GALERIE_UZIVATEL1_idx` (`UZIVATEL`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `fotka`
--
ALTER TABLE `fotka`
  MODIFY `id_FOTKA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pro tabulku `galerie`
--
ALTER TABLE `galerie`
  MODIFY `id_GALERIE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pro tabulku `role`
--
ALTER TABLE `role`
  MODIFY `id_PRAVA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  MODIFY `id_UZIVATEL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `fotka`
--
ALTER TABLE `fotka`
  ADD CONSTRAINT `fk_FOTKA_GALERIE1` FOREIGN KEY (`UMISTENI_id_GALERIE`) REFERENCES `galerie` (`id_GALERIE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  ADD CONSTRAINT `fk_UZIVATEL_PRAVA_UZIVATELU1` FOREIGN KEY (`id_PRAVA`) REFERENCES `role` (`id_PRAVA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `uzivatel_has_fotka`
--
ALTER TABLE `uzivatel_has_fotka`
  ADD CONSTRAINT `fk_UZIVATEL_has_FOTKA_FOTKA1` FOREIGN KEY (`FOTKA`) REFERENCES `fotka` (`id_FOTKA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_UZIVATEL_has_FOTKA_UZIVATEL1` FOREIGN KEY (`UZIVATEL`) REFERENCES `uzivatel` (`id_UZIVATEL`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `uzivatel_has_galerie`
--
ALTER TABLE `uzivatel_has_galerie`
  ADD CONSTRAINT `fk_UZIVATEL_has_GALERIE_GALERIE1` FOREIGN KEY (`GALERIE`) REFERENCES `galerie` (`id_GALERIE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_UZIVATEL_has_GALERIE_UZIVATEL1` FOREIGN KEY (`UZIVATEL`) REFERENCES `uzivatel` (`id_UZIVATEL`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
