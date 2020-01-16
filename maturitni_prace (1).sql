-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 16. led 2020, 22:36
-- Verze serveru: 10.4.11-MariaDB
-- Verze PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `maturitni_prace`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `hodnoceni`
--

CREATE TABLE `hodnoceni` (
  `id_hod` int(10) NOT NULL,
  `hodnoceni` tinyint(4) NOT NULL,
  `komentar` text NOT NULL,
  `id_uzivatele` int(10) NOT NULL,
  `id_hry` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `hra`
--

CREATE TABLE `hra` (
  `id_hry` int(10) NOT NULL,
  `Jmeno` varchar(50) NOT NULL,
  `obsah` text NOT NULL,
  `datum_vydani` date NOT NULL,
  `vyvojar` varchar(30) DEFAULT NULL,
  `platforma` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `hra`
--

INSERT INTO `hra` (`id_hry`, `Jmeno`, `obsah`, `datum_vydani`, `vyvojar`, `platforma`) VALUES
(52, 'ss', 'sss', '2020-01-01', 'sa', 'Playstation 1'),
(53, 'ss/ss', 'sdada', '2020-01-16', 'dsada', 'Notebook'),
(54, 'Jen', 'zivot je  na nic', '2020-01-03', 'já', 'Xbox One S');

-- --------------------------------------------------------

--
-- Struktura tabulky `obrazek`
--

CREATE TABLE `obrazek` (
  `id_obr` int(10) NOT NULL,
  `nazev_obr` varchar(45) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL,
  `typ` text NOT NULL,
  `id_hry` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel`
--

CREATE TABLE `uzivatel` (
  `ID_uzivatele` int(10) NOT NULL,
  `jmeno` varchar(80) NOT NULL,
  `prijmeni` varchar(80) NOT NULL,
  `prezdivka` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `heslo` varchar(64) NOT NULL,
  `over_kod` varchar(40) NOT NULL,
  `typ_uctu` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `uzivatel`
--

INSERT INTO `uzivatel` (`ID_uzivatele`, `jmeno`, `prijmeni`, `prezdivka`, `email`, `heslo`, `over_kod`, `typ_uctu`) VALUES
(4, 'Tom', 'Bom', 'aaaa', 'Bem@ss.c', '9d72fa678c71834cad751a9d64a4936cdbc6a33e3f5fe35c7c0789fd97ed0d8b', '774dmdseqswm5ec5doa7y6kz2miw7jprrgu3awqv', 'A'),
(57, 'sdadas', 'dsada', 'bbbb', 'ccc@ccc.ccc', 'b51222f3978ccd47cb6509903650a434660729060bafd95fc4f450c6d8c28691', 'vfvz6mxcndubne5h386z0s52kkmakhwcp2nnn08f', '1'),
(58, 'ccc', 'ccc', 'ccc', 'ccc@ccc.cccs', '980cb3a6a8f4ced9ccc29f820a0f32b07643b1b06f84a8332536a75657bfc6a4', 'v6fysf850quw7twuehty25moc77idnf7japcokky', '1'),
(60, 'Exo', 'Exo', 'Exo', 'excalibrforyou@gmail.com', '8ef2df9540f01b6e52246bed1b5bde4274c93077b75a59cc1571a50f087b0127', 'dgck8ydzsx6fmh8me7tb08ux320oea7bxqjpjq5c', '1');

-- --------------------------------------------------------

--
-- Struktura tabulky `video`
--

CREATE TABLE `video` (
  `id_vid` int(10) NOT NULL,
  `nazev_vid` varchar(45) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `id_hry` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `zanr`
--

CREATE TABLE `zanr` (
  `id_zanru` int(10) NOT NULL,
  `nazev` varchar(50) NOT NULL,
  `popis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `zanr`
--

INSERT INTO `zanr` (`id_zanru`, `nazev`, `popis`) VALUES
(1, 'Akcni', 'neco'),
(2, 'Strategie', 'neco'),
(9, 'Bam', '111');

-- --------------------------------------------------------

--
-- Struktura tabulky `zanrhra`
--

CREATE TABLE `zanrhra` (
  `id_zanru` int(10) NOT NULL,
  `id_hry` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `zanrhra`
--

INSERT INTO `zanrhra` (`id_zanru`, `id_hry`) VALUES
(2, 52),
(2, 54),
(9, 52),
(9, 53),
(9, 54);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `hodnoceni`
--
ALTER TABLE `hodnoceni`
  ADD PRIMARY KEY (`id_hod`),
  ADD KEY `id_uzivatele` (`id_uzivatele`),
  ADD KEY `id_hry` (`id_hry`);

--
-- Klíče pro tabulku `hra`
--
ALTER TABLE `hra`
  ADD PRIMARY KEY (`id_hry`);

--
-- Klíče pro tabulku `obrazek`
--
ALTER TABLE `obrazek`
  ADD PRIMARY KEY (`id_obr`),
  ADD KEY `id_hry` (`id_hry`);

--
-- Klíče pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  ADD PRIMARY KEY (`ID_uzivatele`);

--
-- Klíče pro tabulku `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_vid`),
  ADD KEY `id_hry` (`id_hry`);

--
-- Klíče pro tabulku `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`id_zanru`);

--
-- Klíče pro tabulku `zanrhra`
--
ALTER TABLE `zanrhra`
  ADD PRIMARY KEY (`id_zanru`,`id_hry`),
  ADD KEY `id_hry` (`id_hry`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `hodnoceni`
--
ALTER TABLE `hodnoceni`
  MODIFY `id_hod` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `hra`
--
ALTER TABLE `hra`
  MODIFY `id_hry` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pro tabulku `obrazek`
--
ALTER TABLE `obrazek`
  MODIFY `id_obr` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1653;

--
-- AUTO_INCREMENT pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  MODIFY `ID_uzivatele` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pro tabulku `video`
--
ALTER TABLE `video`
  MODIFY `id_vid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `zanr`
--
ALTER TABLE `zanr`
  MODIFY `id_zanru` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `hodnoceni`
--
ALTER TABLE `hodnoceni`
  ADD CONSTRAINT `hodnoceni_ibfk_1` FOREIGN KEY (`id_uzivatele`) REFERENCES `uzivatel` (`ID_uzivatele`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hodnoceni_ibfk_2` FOREIGN KEY (`id_hry`) REFERENCES `hra` (`id_hry`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `obrazek`
--
ALTER TABLE `obrazek`
  ADD CONSTRAINT `obrazek_ibfk_1` FOREIGN KEY (`id_hry`) REFERENCES `hra` (`id_hry`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`id_hry`) REFERENCES `hra` (`id_hry`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `zanrhra`
--
ALTER TABLE `zanrhra`
  ADD CONSTRAINT `zanrhra_ibfk_1` FOREIGN KEY (`id_zanru`) REFERENCES `zanr` (`id_zanru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zanrhra_ibfk_2` FOREIGN KEY (`id_hry`) REFERENCES `hra` (`id_hry`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
