-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 16. úno 2020, 21:24
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

--
-- Vypisuji data pro tabulku `hodnoceni`
--

INSERT INTO `hodnoceni` (`id_hod`, `hodnoceni`, `komentar`, `id_uzivatele`, `id_hry`) VALUES
(22, 60, 'Stejně originální hra, jako bylo před léty SimCity.', 1, 68);

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
(59, 'DayZ', '    Po fenomenální úspěchu DayZ, modifikace k ARMA II, si hru vzalo na paškál studio Bohemia Interactive a naservírovali nám jedinečnou hru, která udává směr survival her.\r\n\r\nDayZ Standalone samozřejmě vychází z jedné z nejúspěšnějších modifikací v historii, z DayZ. Bohemia Interactive, tvůrci ARMA, díky které modifikace vznikla, se dohodli s tvůrcem modifikace, vzali ho pod svá křídla a servírují nám jedinečný zážitek v podobě survival titulu, který udává směr a stal se inspirací prakticky pro všechny další survival hry. Hra se odehrává v Černarusi, ve fiktivním východním státě pod ruským vlivem, který již známe z her ARMA. Tento svět byl zamořen zombie, vláda padla, svět, jak ho známe, zde nefunguje. \r\nJe tedy jen na Vás, jak dlouho dokážete v tomto nelítostném světe přežít. Smrt neznamená obnovení na posledním checkpointu. Smrt znamená ztrátu všech věcí, které v době smrti byli součástí Vašeho inventáře. Craftujte, ozbrojte se, vytvořte si útočiště. Svět je nebezpečný.  ', '2013-12-16', 'Bohemia Interactive Studio', 'PC'),
(60, 'The Witcher 3: Wild Hunt', 'Zaklínač: Divoký Hon je příběhové RPG nové generace, navazující na cenami ověnčené předchůdce a slavnou knižní sérii. Můžete se těšit na ohromující fantasy svět, plný života a nepřeberného množství úkolů. Stovky míst k nekonečnému objevování a hlavně výtečně napsaný příběh plný zásadních rozhodnutí, která ovlivní hratelnost a budoucí děj.\r\n\r\nOpět se vrací starý známý lovec monster - Geralt z Rivie. Nyní však stojí před svým doposud nejtěžším úkolem. V obrovském a drsném světe, zmítaném válkou, musí najít Dítě Proroctví. Na své cestě navštíví mnoho rozličných měst, nebezpečných pirátských ostrovů, zrádných horských stezek, polozapomenutých jeskyní a dalších míst, o kterých není radno se zmiňovat.\r\n\r\nHRAJTE JAKO PROFESIONÁLNÍ ZABÍJAK MONSTER\r\nJiž od raného dětství jsou trénování a geneticky mutování tak, aby dosáhli nadlidských schopností, obrovské síly a hbitých reflexů - zaklínači jsou jakousi nedůvěřivou protiváhou k brutálnimu světu, zamořenému monstry a nestvůrami.\r\n- Likvidujte protivníky těmi nejděsivějšími způsoby, za pomoci řady vylepšitelných zbraní, nejrůznějších lektvarů a ničivé bojové magie.\r\n- Lovte širokou škálu rozmanitých monster. Od divoké zvěře potulující se v horských průsmycích, až po nadpřirozeně silné predátory číhající v temných stínech městských ulic.\r\n- Investujte vaše těžce získané odměny do vylepšení výzbroje, nakupujte na míru dělaná brnění nebo prostě všechno prosázejte v koňských závodech, kartách či se utkejte v pěstní bitce. Noční zábava v Zaklínači nezná hranic...\r\n\r\nOBJEVTE TAK TROCHU JINÝ FANTASY SVĚT\r\nObrovský svět zaklínače je stvořen pro nekonečné objevování a stovky dobrodružství. Jeho velikost, detailnost a komplexnost překonává vše, co jsme zatím ve hrách viděli.\r\n- Procestujte každý kout, objevujte zapomenuté ruiny, jeskyně a vraky. Ve městech obchodujte s kupci a trpasličími kováři. Lovte na rozlehlých planinách, skaliscích i otevřeném moři.\r\n- Uzavírejte dohody se zrádnými generály, záludnými čarodějnicemi a zkorumpovanými královskými majestáty. Poskytujte jim temné a nebezpečné služby, které zvládnete pouze vy.\r\n- Dělejte rozhodnutí, která překračují hranice dobra či zla a postavte se jejich dalekosáhlým důsledkům.\r\n\r\nDOSTIHNĚTĚ DÍTĚ PROROCTVÍ\r\nPřijměte dosud nejdůležitější kontrakt. Vystopujte Dítě Proroctví, které je klíčem k záchraně či zničení tohoto světa. Živoucí zbraň moci, jehož existence byla předpovězena starodávnými elfskými legendami.\r\n- Vzepřete se zuřivým vládcům, duchům ovládajícím divokou přírodu a v neposlední řadě také skryté hrozbě číhající kdesi ve skrytu.\r\n- Určete svůj osud ve světě, který možná ani nestojí za záchranu.  ', '2016-08-30', 'CD Projekt RED', 'PC'),
(61, 'PLAYERUNKNOWN\'S BATTLEGROUNDS', 'Masivní multiplayerová online survivol hra, která vtrhla na steam a ihned se stala králem žánru. Hra je založena na jednoduchém principu - spolu s dalšími hráči (100) jste vyhozeni z letadla a za pomocí svého padáku doplachtíte na pevninu. Zde začíná boj o to, kdo si sežene jaké vybavení a pak už se jde na řež samotnou. A jelikož se jedná o survivol žánr, poslední přeživší vyhrává. Aby jste se ale s hráči nehledali na rozsáhlé mapě, v čase se zmenšuje herní pole, do kterého se musíte dostat, jinak postupně přijdete o život. Ať už tedy chcete nebo ne, do střetu se dostanete.  ', '2017-03-23', 'PUBG Corp', 'Playstation 4'),
(62, 'Planetary Annihilation', 'Nestačí zvítězit, protivníka je nutné vyhladit!\r\n\r\nKolonizujte okolní sluneční soustavy, ničte domovské světy protivníků a vyhlazujte nepřátele v epických meziplanetárních bitvách více hráčů s tisícovkami jednotek. Planetary Annihilation posouvá žánr real-time strategií na dosud neviděnou úroveň a poskytuje hráčům výkonné nástroje nezbytné k ovládnutí všudypřítomného válečného chaosu.\r\n\r\n- Epická hra více hráčů\r\n- Pokročilé ovládání a velení\r\n- Dynamický obraz v obraze', '2014-09-05', 'Uber Entertainment', 'Notebook'),
(63, 'Warcraft III: Reforged', '  Toužebně očekávané pokračování slavné realtimové strategie přináší nečekané a zásadní změny. Kromě excelentního trojrozměrného zpracování zaujme zejména ubráním prvků z klasické real-timové strategie a přidáním prvků z RPG her.\r\nCo vám určitě vyrazí dech je vizuální a zvukové zpracování a nepopsatelná atmosféra fantasy světa plná orků, nočních elfů, nemrtvých a samozřejmě lidí. Nechybí ani do detailu propracovaný multiplayer a editor vlastních misí.V tomto balení naleznete vedle základní verze hry Wacraft III také datadisk The Frozen Throne. Warcraft 3: The Frozen Throne je datadisk k veleúspěšné strategii Warcraft 3, které se celosvětově prodalo již na 2 miliony.\r\nDěj hry je zasazen do válkou zničené země Azeroth. Jen několik měsíců uběhlo od chvíle, kdy byl Archimond a jeho armáda poražen v bitvě, a nad zemí visí nová hrozba. Nemrtvý král Ner´zhul byl uvězněn do obrovského ledovce uprostřed arktického kontinentu Northrend, ačkoliv je fyzicky mrtvev, jeho duše existuje dál a snaží se o útěk. K ledovému vězení spěchají hrdinové všech ras, aby zamezili této katastrofě. V datadisku na vás čeká : nový hrdina pro každou rasu, každý ovládá mocná kouzla a magické schopnosti. Houfy nových jednotek, každá disponuje novými dovednostmi a kouzly, která dávají hráči nové taktické a strategické kombinace. Rozšířený multiplayer přes Battle.net včetně nových map a podpory klanů. Propracovanější editor úrovní, který umožňuje navžení vlastní kampaně doplněné o videoscény. Neutrální budovy, kde hráči mohou získat nové předměty a vylepšení. Neutrální hrdinové, které lze najmout do družiny.\r\n', '2020-01-28', 'Blizzard Entertainment', 'PC'),
(64, 'Battlefield 4', 'Akční hit svého žánru, který určuje hlavní trendy. Jen v Battlefieldu hráči zažijí chvíle, kdy se prakticky smazávají rozdíly mezi hrou a pocitem skutečné radosti z úspěchu. Hra běží na bázi vysoce výkonného herního enginu Frostbite 3 příští generace. Battlefield 4 tak díky tomu nabízí naprosto jedinečně realistický a dramatický průběh akce. Ve hře můžete demolovat budovy, ve kterých se skrývají nepřátelé. Budete velet útoku ze zádě dělového člunu. Battlefield dává hráči svobodu v rozhodování, tedy toho, jakým způsobem chce dosáhnout lepších výsledků. Při hledání cesty k vítězství bude testovat vaše schopnosti na maximum.\r\nKromě typicky propracovaného multiplayeru obsahuje Battlefield 4 také napínavý příběh sledující osudy hlavní postavy. Děj se začíná odvíjet od evakuace amerických papalášů z čínského Šanghaje, kterým se hráčův oddíl musí probít až do bezpečí.\r\n \r\n\r\nÚžasný a atmosferický příběh.\r\nFrostbite 3, úžasná nová technologie, která posouvá úroveň animace, destrukce, osvětlení a zvuku do zcela nových výšek.\r\nBezkonkurenční nasazení bojové techniky — nejlepší zpracování boje v různých typech vojenské techniky.\r\nMožnost demolice a proměňování herního prostředí. ', '2013-11-15', 'EA Digital Illusions CE', 'Playstation 4'),
(65, 'Far Cry 4', 'Far Cry 4 navazuje na legendární úspěch svého předchůdce a přináší nejrozsáhlejší a nejohromnější zážitek z celé dosavadní série Far Cry. Těšit se můžete na zcela nový obrovský otevřený svět s integrovaným kooperativním režimem, do kterého se můžete kdykoli zapojit a kdykoli se od něj zase odpojit.\r\n\r\nVelmi očekávané pokračování akčního herního dobrodružství Far Cry přichází a přináší hráčům nové prostředí a dechbroucí grafiku. Ve Far Cry 4 najdeme nový otevřený svět Himálajských vrcholů, nové zbraně, vozidla a také divoká zvířata. Hlavním hrdinou je snědý drsňácký mladík Ajay Ghale, který bude nucen čelit nesčetnému množství překážek a nebezpečným protivníkům. Využívat budete lezení po skalách pomocí vystřelovacího háku, nebo si můžete užít volný pád do propasti pomocí speciálního obleku. K dispozici bude také velký arsenál zbraní pro odstřelování nebo boj na blízko.', '2014-11-18', 'Ubisoft Montreal, Ubisoft Kiev', 'Playstation 3'),
(66, 'Diablo III', 'Zasazeno opět do světa Sanctuary, nad nímž z nebe spadne kometa přesně do těch míst, odkud kdysi Diablo vyšel na svět. Navrátivší se postava Deckarda Caina možná jednou z prvních obětí zla. Mezi novými lokacemi také stará známá místa včetně vesnice Tristramu. Možnost vybrat si mezi mužskou a ženskou verzí postav, rozdíl však bude čistě vizuální. Barbar nikoliv novou postavou se stejnými schopnostmi, nýbrž o dvacet let zestárlým hrdinou z dvojky, což poznáte podle únavy i mnoha šrámů na těle. Nový systém questů, přizpůsobený pro třídu hráčovy postavy. Skilly přístupné přímo z hlavního hotbaru s možností jejich rychlého výběru skrz kolečka na myši. Včetně nové metody uzdravování, kdy přes daný předmět bude stačit přejít (tzn. nebudete jej muset sebrat a teprve potom vypít jako lahvičky). Z nových nepřátel např. Berserker s obrovskou palicí, která bude moci uvíznout v zemi, než se válečníkovi podaří ji vyprostit. Se snadnějším vyměňováním předmětů a brnění/zbraní mezi postavami v partě. Pro každého hráče v partě ze zabitého nepřítele jiné předměty, tzn. nebudou již vypadávat na zem, kde mezi sebou hráči soutěžili o to, kdo je rychleji sebere.', '2012-05-15', 'Blizzard Entertainment', 'PC'),
(67, 'ARK: Survival Evolved', 'Ark: Survival Evolved (zkráceně ARK) je open world action-adventure survival počítačová hra.\r\nByla vyvinuta společností Studio Wildcard s pomocí Instinct Games, Efecto Studios a Virtual Basement.\r\nVe hře hráč musí přežít, na jednom ze třech světů (které doposud vyšly), ve světě není sám, ale s dinosaury a dalšími prehistorickými zvířaty nebo s ostatními hráči (multiplayer). Hráč může vyrábět různě věci na obranu, oblečení nebo také na stavění nějakého příbytku,atd... Věci které může vyrobit se odemykají pomocí engramů, které dostane na každé další úrovni. Zkušenosti se získávají jednoduše stačí vyrábět, sbírat suroviny nebo zabíjet. Hra nemá žádný konec.', '2015-06-02', 'Studio Wildcard, Instinct Game', 'Xbox One'),
(68, 'The Sims', 'Hráč měl na starost jednu a více osob (Simíky), kterému ze začátku hry postavil nebo koupil dům a musel se starat o jeho potřeby, které byly vyjádřeny ukazateli nálady, čistoty, společnosti, hladu, únavy, zábavy, prostředí apod. Pokud Simík měl některý z ukazatelů v kritickém stavu, nejdříve protestoval. Později, pokud měl například zanedbanou hygienu, začal zapáchat, pokud byl velmi unavený, mohl usnout ve stoje nebo omdlít, pokud měl kritické hodnoty na ukazateli potřeby toalety, tak se počůral.\r\n\r\nHráč měl k dispozici 3 herní módy:\r\n\r\nŽivot, ve kterém se o Simíka staral, nechával ho chodit do práce, vařit, číst noviny, prostě žít (i když regulovanými příkazy)\r\nNákup byl určen pro vybavení domácnosti nebo exteriéru předměty (stůl, židle, sporák, sprcha...)\r\nStavbu, kdy se čas v Simíkově světě zastavil a hráč mohl stavět/bourat dům, upravovat terén zahrady, stavět bazén apod.\r\nVe hře bylo kromě předdefinovaných postav možné si vytvořit vlastní postavu nebo celou rodinu. Oproti The Sims 2 v prvním dílu bylo možné sice vychovat v rodině dítě, ale to nikdy nedospělo a dospělí jedinci nestárli, mohli však zemřít následkem dlouhodobého zanedbání.', '2000-02-04', 'Maxis', 'Notebook');

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

--
-- Vypisuji data pro tabulku `obrazek`
--

INSERT INTO `obrazek` (`id_obr`, `nazev_obr`, `typ`, `id_hry`) VALUES
(1719, 'Pohled do údolí', 'image/jpeg', 59),
(1720, 'Těžká cesta', 'image/jpeg', 59),
(1721, 'Multiplayer', 'image/jpeg', 59),
(1722, 'Výzva', 'image/jpeg', 59),
(1723, 'Noví přátelé', 'image/jpeg', 59),
(1724, 'DayZ', 'image/jpeg', 59),
(1725, 'Přežití', 'image/jpeg', 59),
(1726, 'Zaklínač', 'image/jpeg', 60),
(1727, 'Magie', 'image/jpeg', 60),
(1730, 'Souboje', 'image/jpeg', 60),
(1731, 'Víno a krev', 'image/jpeg', 60),
(1732, 'Ztracená', 'image/png', 60),
(1733, 'Hunting monsters', 'image/jpeg', 60),
(1734, 'Přežij!', 'image/jpeg', 61),
(1735, 'S přáteli', 'image/jpeg', 61),
(1736, 'Vozidla', 'image/jpeg', 61),
(1737, 'Gameplay', 'image/jpeg', 61),
(1738, '6. Sezóna', 'image/jpeg', 61),
(1739, 'Měsíc', 'image/jpeg', 62),
(1740, 'Obrovké armády', 'image/jpeg', 62),
(1741, 'Titáni', 'image/jpeg', 62),
(1742, 'Destrukce', 'image/jpeg', 62),
(1743, 'Anihalace', 'image/jpeg', 62),
(1744, 'Warcraft', 'image/jpeg', 63),
(1745, 'Ork', 'image/jpeg', 63),
(1746, 'Real time souboje', 'image/jpeg', 63),
(1747, 'Grafika', 'image/jpeg', 64),
(1748, 'Epické bitvy', 'image/jpeg', 64),
(1749, 'Válečné stroje', 'image/jpeg', 64),
(1750, 'Tvé hřiště', 'image/jpeg', 65),
(1751, 'Multiplayer', 'image/jpeg', 65),
(1752, 'Šílenství', 'image/jpeg', 65),
(1753, 'Souboje', 'image/jpeg', 66),
(1754, 'Třetí osoba', 'image/jpeg', 66),
(1755, 'Hardcore', 'image/jpeg', 66),
(1756, 'Lovec', 'image/jpeg', 67),
(1757, 'Ochočuj', 'image/jpeg', 67),
(1758, 'Buduj', 'image/jpeg', 67),
(1759, 'Buduj', 'image/jpeg', 68),
(1760, 'Starej se', 'image/jpeg', 68),
(1761, 'Buduj', 'image/jpeg', 68),
(1762, 'Řeš spory', 'image/png', 68);

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
(1, 'admin', 'admin', 'admin', 'admin@admin.admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '774dmdseqswm5ec5doa7y6kz2miw7jprrgu3awqv', 'A'),
(62, 'test0', 'test0', 'test0', 'test0@test0.test0', '590c9f8430c7435807df8ba9a476e3f1295d46ef210f6efae2043a4c085a569e', '7yf7s3oicnceabqpjwuz5uvgqw3nwoxmw8y444r5', '0'),
(63, 'test1', 'test1', 'test1', 'test1@test1.test1', '1b4f0e9851971998e732078544c96b36c3d01cedf7caa332359d6f1d83567014', 'gkafmfx4erwc2h2r8ay2jqs8ieyrsa4mbjv8gb8c', '1');

-- --------------------------------------------------------

--
-- Struktura tabulky `video`
--

CREATE TABLE `video` (
  `id_vid` int(10) NOT NULL,
  `link` varchar(255) NOT NULL,
  `id_hry` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `video`
--

INSERT INTO `video` (`id_vid`, `link`, `id_hry`) VALUES
(10, 'https://youtu.be/4xv8aRPYdyI', 59),
(11, 'https://youtu.be/Z8WPVjf_2PM', 59),
(12, 'https://youtu.be/NLI5AMY3Eik', 59),
(13, 'https://youtu.be/yO-OMB6Ilf4', 60),
(14, 'https://youtu.be/xx8kQ4s5hCY', 60),
(15, 'https://youtu.be/YdHc3JZixRY', 60),
(16, 'https://youtu.be/Wro3FVoqweM', 61),
(17, 'https://youtu.be/T9zdkonmM2c', 61),
(18, 'https://youtu.be/mGR8ECSd-z0', 61),
(19, 'https://youtu.be/KuXCU7IeN9c', 62),
(20, 'https://youtu.be/SWX8_jFx7dc', 62),
(21, 'https://youtu.be/INYaVfENea4', 62),
(22, 'https://youtu.be/TUXjHKh2hpY', 63),
(23, 'https://youtu.be/QDUMoceCoRE', 63),
(24, 'https://youtu.be/b7uQnE04gz4', 63),
(25, 'https://youtu.be/MUukd0ayD-Q', 64),
(26, 'https://youtu.be/o0X5l-rc_4M', 64),
(27, 'https://youtu.be/8rHPxgOf9nc', 64),
(28, 'https://youtu.be/JBIzAuWllCA', 65),
(29, 'https://youtu.be/BT3pbhcBu98', 65),
(30, 'https://youtu.be/ZfaFyLjx3To', 65),
(31, 'https://youtu.be/K518KDqiDys', 66),
(32, 'https://youtu.be/Q17FDfU7-ds', 66),
(33, 'https://youtu.be/iDYGVoRaedc', 66),
(34, 'https://youtu.be/fRfHeXvaC50', 67),
(35, 'https://youtu.be/lu7sSgSkTHs', 67),
(36, 'https://youtu.be/J_MoE2vkVwQ', 67),
(37, 'https://youtu.be/gi0AB5ksxuY', 68),
(38, 'https://youtu.be/Kkn5xazokXo', 68),
(39, 'https://youtu.be/AZGhAejabBM', 68);

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
(18, '4X', 'Pojem 4X se obvykle nepoužívá pro všechny hry, které splňují výše uvedené body, ale jen pro hry, které dosahují určité komplexnosti ve správě říše a v nichž hraje významnou roli diplomacie, výzkum. Často v nich existuje i nevojenská cesta k vítězství (například ve hře Civilization lze zvítězit vysláním kosmické lodi).  Pojmem 4X se označují realtimová i tahové strategické hry. Poprvé byl použit v roce 1993 Alanem Emrichem v souvislosti se hrou Master of Orion, ovšem po svém rozšíření je používán i pro některé hry, které vznikly před jeho vznikem.'),
(19, 'Battle royale', 'Battle royale je videoherní žánr, který kombinuje přežití, průzkum a soupeření „do posledního dechu“. Hry typu Battle royale hraje najednou velké množství hráčů. Hráči obvykle začínají s minimálním vybavením, musejí hledat zbraně a vybavení a eliminovat všechny ostatní soupeře. Vítězem se stává poslední hráč ve hře. Hráči jsou nuceni ke konfrontacím s tím, jak se herní mapa postupně zmenšuje (mimo hranice herní mapy jejich postavy ztrácejí zdraví). Jméno tohoto žánru je převzato z japonského filmu Battle Royale z roku 2000, který představuje podobnou koncepci zápasu v postupně zmenšující se zóně.'),
(20, 'Escape the room', 'Escape the room (TD) je subžánr adventur, tedy počítačových her, v nichž hlavní hrdina (nemusí být jeden) řeší rozličné úkoly (tzv. questy – z angl. slova poslání). Hráč postupuje \'klikatým\' příběhem k vzdálenému cíli, přičemž je kladen důraz na mnohost řešení zápletek a hádanek.  V adventurách subžánru Escape the room (v češtině se pro ně ujal název \"útěkovky\") se hráči obvykle snaží dostat z konkrétní místnosti, nebo z jiného místa pryč. Úkolem je vyřešit hádanky a získat klíč, či objevit jinou cestu, jak se z místa dostat. Útěkovky jsou populární hlavně ve flashi, takže je hráči mohou zapnout přímo v browseru.'),
(21, 'First-person shooter', 'First-person shooter (zkráceně FPS; česky střílečka z pohledu první osoby) je podžánr stříleček charakteristický simulací vlastního pohledu herní postavy, neboli postavy za kterou hráč jedná v samotné hře. Zkratka znamená v češtině střílečka z pohledu první osoby. Tento pojem se používá i k odlišení od akčních her zobrazovaných z pohledu třetí osoby (tzv. third-person shooter (TPS) – střílečka z pohledu třetí osoby).  Pro znázorňované násilí a snahu o maximální vizuální realismus, zastoupený ve většině her tohoto žánru, stává se tento žánr kontroverzním odvětvím herního průmyslu.  Dříve se také používal, dnes už zastaralý výraz doomovka, užívaný zejména komunitou počítačových hráčů a videoherními periodiky v České republice, označení doom klon mělo pak význam celosvětový (oba výrazy odkazují na legendární počítačovou hru Doom z roku 1993).'),
(22, 'Open world', 'Hra s otevřeným světem (anglicky open world) je typ hry která hráči umožňuje volně se pohybovat po virtuálním světě a nechává mu značnou volnost ve výběru cílů. Používá se také pojem „free roaming“, který naznačuje absenci umělých bariér (neviditelné zdi, nahrávací obrazovky) obvyklých v lineárně navržených hrách.  Otevřená hra nemusí být nutně hrou typu sandbox. Hra typu sandbox („pískoviště“) poskytuje nástroje, jimiž může hráč měnit herní svět podle vlastních představ.  Obecně platí, že i hry s otevřeným světem hráče nějakým způsobem omezují; jde buď o omezení vyplývající z technických možností hardwaru nebo herní omezení dané linearitou hry (zamčené lokace).'),
(23, 'MMORPG', 'Zkratka MMORPG (z anglického massively multiplayer online role-playing game, volně Hra obrovského počtu hráčů s RPG prvky) je označení žánru počítačových her. Jedná se o počítačovou online hru na hrdiny o více hráčích, která umožňuje připojení i tisíců hráčů najednou; zpravidla skrze Internet. Hra se obvykle, podobně jako jiné hry na hrdiny, odehrává ve fiktivním světě, často ve fantasy či sci-fi prostředí.  Hry žánru MMORPG se vyvinuly z textových RPG online her, tzv. MUDů, a původně (kolem poloviny 90. let 20. století) byly označovány jako grafické MUDy. S termínem MMORPG přišel až Richard Garriott, tvůrce Ultimy Online, v roce 1997.[1] Ultima Online, ač nebyla zcela první grafickou online hrou na hrdiny, zaznamenala takový úspěch, že hry podobného rázu jsou od té doby nazývány MMORPG. MUDy jsou pak někdy naopak označované i jako textové MMORPG hry.[2]  Podle PCGamesN mezi nejlepší MMORPG patří EVE Online, Final Fantasy XIV: A Realm Reborn, Guild Wars 2, Lord of the Rings Online, PlanetSide 2, Rift, Runescape 3, Star Wars: The Old Republic, The Secret World a World of Warcraft: Warlords of Draenor.[3] První českou MMORPG je Chmatákov Online.[4]'),
(24, 'MOBA', 'Multiplayer Online Battle Arena (MOBA), známá také jako Action Real-Time Strategy (ARTS) je žánr hry, ve kterém se více hráčů utká online v aréně. Nejznámější MOBA hry jsou například League of Legends, Dota 2, Heroes of the Storm nebo Shards of War. Jednou z prvních MOBA her byla hra Herzog Zwei, která vyšla v roce 1989 v Japonsku.'),
(25, 'Plošinovka', 'Plošinovka (někdy též skákačka, hopsačka nebo platformovka; anglicky platform game, platformers) je žánr videohry. Úkolem hráče je dostat se z jednoho místa na druhé. Cestu mu většinou znepříjemňují různé pasti a protivníci. V některých hrách tohoto typu se musí hráč protivníkům vyhýbat nebo naopak s nimi bojovat. Cestou hráč sbírá různé předměty, které mu mohou pomoci. Hry jsou většinou arkády – obtížnost se postupně stupňuje a zvyšuje se počet pastí. Plošinovky prověřují postřeh a hbitost hráče.'),
(26, 'Rail shooter', 'Rail shooters aneb kolejové střílečky, jsou typ počítačových her, kde je ovládání hráče omezeno na určení, kam má střelit. Hráč tak nemůže ovlivňovat pohled kamery a ani cestu, kterou se pohybuje. Kolejové střílečky jsou podtyp shoot \'em up. Shoot \'em up hry jsou dále podtyp stříleček.'),
(27, 'Realtimová strategie', 'Realtimová strategie (Real-time strategy, RTS) je poddruh žánru strategických počítačových her, v kterém probíhá veškerý hráčův úkon a počítačem řízené odezvy v reálném čase. První českou realtimovou strategií byla hra Paranoia, která byla po hrách Dune II a Warcraft v pořadí také třetí světovou hrou tohoto žánru.'),
(28, 'Scrolling shooter', 'Scrolling shooters aneb skrolované střílečky, správněji však akční hra s plynulým posunem, jsou typ počítačových her, podtyp shoot \'em up. Shoot \'em up hry jsou dále podtyp stříleček.'),
(29, 'Shoot \'em up', 'Shoot-em-up (shmup nebo též arcade shooter, twitch shooter, space shooter, nebo někdy jednoduše střílečka, přičemž shoot \'em upy jsou nejpopulárnější typ stříleček[zdroj?]), je žánr počítačové hry, kde má hráč omezenou kontrolu nad svojí figurkou (obvykle letadlo nebo vesmírná loď) a důraz je většinou kladen na zničení nepřítele. Většina shoot \'em upů zobrazuje hráčovo skóre, což je znak, který před nimi nebyl tak rozšířen.  I když žánr by mohl mít 3D grafiku, hra je dělaná téměř výlučně v 2D grafice. Žánr vznikl pravděpodobně v hernách ze Space Invaders a zažil mnoho rozličných her mnoha forem. Zvýšení popularity nastalo s přidáním hry dvou hráčů v polovině 80. let 20. století. Teď existuje několik podžánrů, které mají svoje vlastní herní charakteristiky. Střílečky dnes mají mnoho přívrženců, hlavně v Japonsku a mnoho titulů používá internet jako online ratingové systémy.'),
(30, 'Simulátor', 'Pravděpodobně nejvíce zastoupený výskyt simulátorů probíhá na počítačích, a to především formou počítačové hry. Takto si lze vyzkoušet řízení osobního auta, nákladního auta, autobusu, vlaku, metra, pilotování letadla a další. Simulátorů je totiž celá řada, mezi další tak patří vesmírné, sportovní, budovatelské, vojenské, záchranářské apod.'),
(31, 'Sportovní', 'Sportovní počítačová hra je hrou, jejímž námětem je jakýkoliv sport. Nejčastěji se jedná o simulace. Ve většině sportovních her hrají primární roli prvky, jako jsou například rychlost, načasovanost, taktika, postřeh, pohotovost a důvtip.  Mezi sportovní počítačové hry lze zařadit i závodní simulace vozidel, avšak simulátory jsou obvykle kromě toho řazeny i do samostatné kategorie a do kategorie strategických počítačových her.  Nejpopulárnějšími počítačovými hrami bývají simulace hokejových, basketbalových a fotbalových klání. Těmito náměty se zabývá např. americká firma EA Sports, která vytvořila například tituly NHL, NBA a FIFA. Názvy jsou odvozeny od asociací sdružující týmy ve svých ligách. EA Sports vydává tyto hry každoročně s obměněnými kádry týmů, ekvivalentních daným transakcím proběhlým během daného roku, vždy v novém grafickém zpracování a s inovativními změnami. Jako sériový produkt proto dostávají nová vydání hry název příslušné asociace doplněný o označení roku, následujícího po roce započaté sezóny. Ta v těchto ligách začíná obvykle na podzim. Např. hokejová hra simulující kanadsko-americkou ligu, vydaná v roce 2005, tak nese označení NHL 2006). Mezitím však uběhlo několik let a tato hokejová hra se vyvíjela a praktický každý rok přibyl jeden titul.  V počítačových hrách samotných však také dochází ke změně. Sportovní počítačové hry se přenášejí z počítače na internet a stávají se dalším prvkem komunikace mezi uživateli internetu. Sportovní stránka zde převládá, avšak důležitou součástí her je i chat a pošta mezi jednotlivými hráči. Jedním z příkladů je například hokejový Manager PPM (Powerplay manager).'),
(32, 'Stealth', 'Stealth videohra (anglicky stealth game) je podžánrem akčních dobrodružných videoher, jejíž charakteristickým rysem je tichý styl hraní a snaha nevzbudit pozornost svých protivníků. Cílem hráče je obvykle vymyslet a následně provést chytrou strategii, jak se proplížit nepřátelským územím a pokud možno se přitom vyhnout oponentům. Je kladen důraz na minimální použití smrtících zbraní a snahu co nejdéle zůstat nespatřen a nevyvolat poplach. Obvyklými prostředky ve stealth hrách bývají tlumiče střelných zbraní či tiché zbraně jako luk, kuše, omračující prostředky (uspávací šipky, tasery apod.), různé prostředky pro odlákávání protivníků, tiché útoky či eliminace protivníka, převleky, schovávání těl nepřátel (omráčených či zabitých) z dohledu ostatních nepřátel apod. (některé hry jak kupř. série Thief či Metro berou v potaz i světlo a stín - hráč má možnost se ukrývat ve stínu a dokonce si např. zhasínáním loučí tmu na potřebných místech vytvářet).  Zakladatelem žánru je DOSovka Castle Wolfenstein, která poprvé vyšla roku 1981. Ačkoli byla ve své době hrou velice oblíbenou, stealth žánr zůstával dlouho opomíjeným odvětvím herního průmyslu.  Za \"stealth strategii\" by se daly označit první díly herní série Commandos.  Obvykle je stealth (tichý) postup hrou pouze jako možnost, nikoliv nutnost. Hráč je při tichém průchodu hrou odměněn přirozeným způsobem - nikdo ho nepronásleduje, nestříli po něm apod., v případě, že dojde k přerušení stealth (hráče uvidí nepřítel, spustí poplach apod.), stává se ze hry obvykle frenetická akce, která je protikladem předchozímu klidnému průchodu. Je jen málo hardcore stealth her, které při nezdařeném stealth postupu znamenají rychlou hráčovu smrt a nutnost misi opakovat - stealth je většinou volba, jak se vyhnout boji a pokud je hráč nepřítelem odhalen, má hráč obvykle možnost útěku či protiútoku a vysoké šance na následné přežití a eventuální dokončneí mise.  Některé hry (např. ze série Assassins Creed) mají příběhové mise s vynuceným stealthem, kdy hráče hra potrestá vynuceným opakováním mise okamžitě, jakmile je přerušen stealth a tedy volba způsobu průchodu v těchto případech nezáleží na hráči.'),
(33, 'Survival horor', 'Survival horor (anglicky survival horror) je žánr videoher/počítačových her, v němž hráč musí čelit útokům nadpřirozených nepřátel (často nemrtvých, zombie apod.) a přežít. Nejčastěji se příběh odehrává v klaustrofobickém industrializovaném prostředí, kterému dominuje znepokojivá bizarní stylizace.  Hry obvykle bývají ztvárněny v žánru 3D akčních her (tzv. third-person shooter), ve kterých se kromě bojů objevují také adventurní sekvence. Hudební složkou bývá lomozivá ambientní hudba, která spolu s děsivými zvuky a temnou grafickou stránkou celé hry nabízí psychologicky stresující zážitek, který bývá ještě umocněn (např. ve hrách Silent Hill) fyzicky slabší, neobratnou, militantně nezaloženou hlavní postavou, která neumí příliš dobře zacházet se zbraněmi (často netrefí cíl, nemotorně manipuluje se zbraněmi na blízko) a neholduje násilí. Kvůli těmto indispozicím pomalu nabíjí střelné zbraně a zbraně na blízko, jako jsou např. palice, halapartna, větší sekera atp., táhne po zemi za sebou.  Dalšími stresujícími faktory snažící se u hráče vyvolat např. pocity opuštěnosti, nejistoty a beznaděje jsou minimum munice, možnost ukládat hru jen na určitých místech a mnohdy i technické nedostatky jako kamera hůře snímající hráčův postup prostředím atd.  Za průkopnický titul survival hororu je považována hra Alone In The Dark z roku 1992. Označení survival horor přišlo však až se hrou Resident Evil.  Kultovními zástupci survival hororu jsou herní série Alone In The Dark, Resident Evil, Silent Hill, Project Zero, Forbidden Siren a další.  Mezi české tituly tohoto žánru lze zařadit Bloodline, Silent Hill: Downpour nebo DayZ.'),
(34, 'Tahová strategie', 'Tahová strategie (Turn-based strategy, TBS) je poddruh žánru strategických počítačových her.  Tento druh strategie se liší od jiných tím, že se (jak název napovídá) odehrává po kolech či tazích. Tímto žánrem se většinou označují počítačové hry s velmi propracovaným managementem jako je správa základny, jednotek atd., který je příliš složitý na to, aby se dal zvládat v reálném čase, jako je tomu u žánru realtimových strategií.'),
(35, 'Third-person shooter', 'Third-person shooter (zkráceně TPS; česky střílečka z pohledu třetí osoby) je podžánr stříleček, které jsou zobrazovány pohledem kamery mimo hlavního hrdinu, přičemž se kamera pohybuje za zády virtuálního hrdiny. Do češtiny lze anglický termín přeložil jako střílečka z pohledu třetí osoby. Pojem se používá k odlišení od akčních her zobrazovaných z pohledu hlavního hrdiny (tzv. First-person shooter (FPS) – střílečka z pohledu první osoby).  Některé hry však sice používají kameru z pohledu třetí osoby, avšak hráč ji může ovládat, čímž se docílí pohledu z pozice ovládané postavy. Proto je někdy těžké určit, která počítačová hra může být označena za střílečku z pohledu třetí osoby a která ne. Příkladem střílečky z pohledu třetí osoby může být hra Max Payne, řada počítačových her jako např. Serious Sam a The Suffering stojí na pomezí podžánrů FPS a TPS, neboť užívají kamerového pohledu třetí i první osoby.  TPS hry mají výhody i nevýhody. Na straně jedné zobrazení z pohledu třetí osoby může hráči zajistit lepší přehled o jeho okolí, na druhé straně však špatné řízení kamery může hráči zobrazovat nepotřebné lokace, skrývat důležité objekty a nepřátele v pohledu ovládaného hrdiny. Někdy se vyskytují i chyby, kdy kamera nesprávně zobrazí prostředí za zdmi a jinými neprůhlednými překážkami.'),
(36, 'Tower defense', 'Tower defense (TD) je žánr počítačových her a v doslovném překladu znamená \"věžová obrana\". V češtině se pro tento druh her ujal název \"věžovky\". Úkolem hráče je stavit obranné věže (popř. vojáky, kouzelníky, draky atd.). Ty bojují proti nepřátelským útokům, které obvykle přichází v takzvaných vlnách.'),
(37, 'RPG', 'RPG (angl. Role-playing strategy) jsou v překladu \"hry na hrdiny\". Jedná se o herní žánr, ve kterém hráč hraje za fiktivní postavu (hrdinu). RPG může mít podobu nejen počítačové hry, ale na hrdiny si můžeme hrát i v rámci stolních her. Základem těchto her je ale vždy daná postava, charakter.'),
(38, 'Adventura', 'Adventury jsou žánrem počítačových a konzolových her, kde většinou hrajete za hlavní postavu, která v rámci interaktivního příběhu objevuje nebo řeší situace, které často vyžadují zapojení logického uvažování. Žánr adventur se tedy zaměřuje zejména na propracovaný herní příběh, který mnohdy svou propracovaností připomíná literární či filmová díla. Spousta adventur je tvořena zejména pro single player. Tvorba takových her může trvat i dlouhé roky, jelikož scénáře obsahují spousty alternativních příběhových cest a konců.'),
(39, 'Střílečka', 'Střílečky jsou podžánrem akčních her, kde nejčastěji hrajete za jednoho hráče a kde nejčastěji rozhoduje rychlost a reakce. Střílečky se často liší v různorodosti zbraní a postav, za které můžete hrát. Stejně tak v prostředí, do kterého jsou střílečky zasazeny.  Cíl stříleček je poměrně jednoduchý a logický - zastřelit svého oponenta. Často jsou hráči rozděleni do dvou týmů, které hrají proti sobě, zároveň je však sledováno skóre jednotlivých hráčů.');

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
(18, 67),
(19, 61),
(21, 61),
(21, 64),
(22, 60),
(22, 66),
(22, 67),
(27, 62),
(27, 63),
(27, 65),
(27, 66),
(30, 59),
(30, 60),
(30, 68),
(32, 59),
(33, 59),
(33, 66),
(35, 61),
(37, 59),
(37, 60),
(37, 63),
(37, 66),
(38, 60),
(38, 65),
(38, 66),
(39, 59),
(39, 61),
(39, 65),
(39, 67);

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
  MODIFY `id_hod` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pro tabulku `hra`
--
ALTER TABLE `hra`
  MODIFY `id_hry` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pro tabulku `obrazek`
--
ALTER TABLE `obrazek`
  MODIFY `id_obr` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1763;

--
-- AUTO_INCREMENT pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  MODIFY `ID_uzivatele` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pro tabulku `video`
--
ALTER TABLE `video`
  MODIFY `id_vid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pro tabulku `zanr`
--
ALTER TABLE `zanr`
  MODIFY `id_zanru` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

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
