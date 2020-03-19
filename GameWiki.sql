-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 19. bře 2020, 19:20
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
(32, 25, '<p>dsadsadasdadsda</p>\r\n', 64, 63),
(35, 50, '<p>dsadsadasdsadasdaa</p>\r\n', 63, 62),
(36, 100, 'Jako alfa', 1, 60),
(37, 0, 'trash', 63, 60),
(38, 64, '<p>dasdasdasdasdadasd</p>\r\n', 65, 63),
(41, 54, 'dsadad', 1, 64),
(42, 89, 'Parádní hra!!', 1, 130),
(43, 24, 'Nic moc.', 1, 132);

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
(60, 'The Witcher 3: Wild Hunt', 'Zaklínač: Divoký Hon je příběhové RPG nové generace, navazující na cenami ověnčené předchůdce a slavnou knižní sérii. Můžete se těšit na ohromující fantasy svět, plný života a nepřeberného množství úkolů. Stovky míst k nekonečnému objevování a hlavně výtečně napsaný příběh plný zásadních rozhodnutí, která ovlivní hratelnost a budoucí děj.\r\n\r\nOpět se vrací starý známý lovec monster - Geralt z Rivie. Nyní však stojí před svým doposud nejtěžším úkolem. V obrovském a drsném světe, zmítaném válkou, musí najít Dítě Proroctví. Na své cestě navštíví mnoho rozličných měst, nebezpečných pirátských ostrovů, zrádných horských stezek, polozapomenutých jeskyní a dalších míst, o kterých není radno se zmiňovat.\r\n\r\nHRAJTE JAKO PROFESIONÁLNÍ ZABÍJAK MONSTER\r\nJiž od raného dětství jsou trénování a geneticky mutování tak, aby dosáhli nadlidských schopností, obrovské síly a hbitých reflexů - zaklínači jsou jakousi nedůvěřivou protiváhou k brutálnimu světu, zamořenému monstry a nestvůrami.\r\n- Likvidujte protivníky těmi nejděsivějšími způsoby, za pomoci řady vylepšitelných zbraní, nejrůznějších lektvarů a ničivé bojové magie.\r\n- Lovte širokou škálu rozmanitých monster. Od divoké zvěře potulující se v horských průsmycích, až po nadpřirozeně silné predátory číhající v temných stínech městských ulic.\r\n- Investujte vaše těžce získané odměny do vylepšení výzbroje, nakupujte na míru dělaná brnění nebo prostě všechno prosázejte v koňských závodech, kartách či se utkejte v pěstní bitce. Noční zábava v Zaklínači nezná hranic...\r\n\r\nOBJEVTE TAK TROCHU JINÝ FANTASY SVĚT\r\nObrovský svět zaklínače je stvořen pro nekonečné objevování a stovky dobrodružství. Jeho velikost, detailnost a komplexnost překonává vše, co jsme zatím ve hrách viděli.\r\n- Procestujte každý kout, objevujte zapomenuté ruiny, jeskyně a vraky. Ve městech obchodujte s kupci a trpasličími kováři. Lovte na rozlehlých planinách, skaliscích i otevřeném moři.\r\n- Uzavírejte dohody se zrádnými generály, záludnými čarodějnicemi a zkorumpovanými královskými majestáty. Poskytujte jim temné a nebezpečné služby, které zvládnete pouze vy.\r\n- Dělejte rozhodnutí, která překračují hranice dobra či zla a postavte se jejich dalekosáhlým důsledkům.\r\n\r\nDOSTIHNĚTĚ DÍTĚ PROROCTVÍ\r\nPřijměte dosud nejdůležitější kontrakt. Vystopujte Dítě Proroctví, které je klíčem k záchraně či zničení tohoto světa. Živoucí zbraň moci, jehož existence byla předpovězena starodávnými elfskými legendami.\r\n- Vzepřete se zuřivým vládcům, duchům ovládajícím divokou přírodu a v neposlední řadě také skryté hrozbě číhající kdesi ve skrytu.\r\n- Určete svůj osud ve světě, který možná ani nestojí za záchranu.  ', '2016-08-30', 'CD Projekt RED', 'PC'),
(61, 'PLAYERUNKNOWN\'S BATTLEGROUNDS', '<p>Masivn&iacute; multiplayerov&aacute; online survivol hra, kter&aacute; vtrhla na steam a ihned se stala kr&aacute;lem ž&aacute;nru.</p>\r\n\r\n<p>Hra je založena na jednoduch&eacute;m principu - spolu s dal&scaron;&iacute;mi hr&aacute;či (100) jste vyhozeni z letadla a za pomoc&iacute; sv&eacute;ho pad&aacute;ku doplacht&iacute;te na pevninu.</p>\r\n\r\n<p>Zde zač&iacute;n&aacute; boj o to, kdo si sežene jak&eacute; vybaven&iacute; a pak už se jde na řež samotnou. A jelikož se jedn&aacute; o survivol ž&aacute;nr, posledn&iacute; přeživ&scaron;&iacute; vyhr&aacute;v&aacute;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Aby jste se ale s hr&aacute;či nehledali na rozs&aacute;hl&eacute; mapě, v čase se zmen&scaron;uje hern&iacute; pole, do kter&eacute;ho se mus&iacute;te dostat, jinak postupně přijdete o život. Ať už tedy chcete nebo ne, do střetu se dostanete.</p>\r\n', '2017-03-23', 'PUBG Corp', 'Playstation 4'),
(62, 'Planetary Annihilation', 'Nestačí zvítězit, protivníka je nutné vyhladit!\r\n\r\nKolonizujte okolní sluneční soustavy, ničte domovské světy protivníků a vyhlazujte nepřátele v epických meziplanetárních bitvách více hráčů s tisícovkami jednotek. Planetary Annihilation posouvá žánr real-time strategií na dosud neviděnou úroveň a poskytuje hráčům výkonné nástroje nezbytné k ovládnutí všudypřítomného válečného chaosu.\r\n\r\n- Epická hra více hráčů\r\n- Pokročilé ovládání a velení\r\n- Dynamický obraz v obraze', '2014-09-05', 'Uber Entertainment', 'Notebook'),
(63, 'Warcraft III: Reforged', '  Toužebně očekávané pokračování slavné realtimové strategie přináší nečekané a zásadní změny. Kromě excelentního trojrozměrného zpracování zaujme zejména ubráním prvků z klasické real-timové strategie a přidáním prvků z RPG her.\r\nCo vám určitě vyrazí dech je vizuální a zvukové zpracování a nepopsatelná atmosféra fantasy světa plná orků, nočních elfů, nemrtvých a samozřejmě lidí. Nechybí ani do detailu propracovaný multiplayer a editor vlastních misí.V tomto balení naleznete vedle základní verze hry Wacraft III také datadisk The Frozen Throne. Warcraft 3: The Frozen Throne je datadisk k veleúspěšné strategii Warcraft 3, které se celosvětově prodalo již na 2 miliony.\r\nDěj hry je zasazen do válkou zničené země Azeroth. Jen několik měsíců uběhlo od chvíle, kdy byl Archimond a jeho armáda poražen v bitvě, a nad zemí visí nová hrozba. Nemrtvý král Ner´zhul byl uvězněn do obrovského ledovce uprostřed arktického kontinentu Northrend, ačkoliv je fyzicky mrtvev, jeho duše existuje dál a snaží se o útěk. K ledovému vězení spěchají hrdinové všech ras, aby zamezili této katastrofě. V datadisku na vás čeká : nový hrdina pro každou rasu, každý ovládá mocná kouzla a magické schopnosti. Houfy nových jednotek, každá disponuje novými dovednostmi a kouzly, která dávají hráči nové taktické a strategické kombinace. Rozšířený multiplayer přes Battle.net včetně nových map a podpory klanů. Propracovanější editor úrovní, který umožňuje navžení vlastní kampaně doplněné o videoscény. Neutrální budovy, kde hráči mohou získat nové předměty a vylepšení. Neutrální hrdinové, které lze najmout do družiny.\r\n', '2020-01-28', 'Blizzard Entertainment', 'PC'),
(64, 'Battlefield 4', 'Akční hit svého žánru, který určuje hlavní trendy. Jen v Battlefieldu hráči zažijí chvíle, kdy se prakticky smazávají rozdíly mezi hrou a pocitem skutečné radosti z úspěchu. Hra běží na bázi vysoce výkonného herního enginu Frostbite 3 příští generace. Battlefield 4 tak díky tomu nabízí naprosto jedinečně realistický a dramatický průběh akce. Ve hře můžete demolovat budovy, ve kterých se skrývají nepřátelé. Budete velet útoku ze zádě dělového člunu. Battlefield dává hráči svobodu v rozhodování, tedy toho, jakým způsobem chce dosáhnout lepších výsledků. Při hledání cesty k vítězství bude testovat vaše schopnosti na maximum.\r\nKromě typicky propracovaného multiplayeru obsahuje Battlefield 4 také napínavý příběh sledující osudy hlavní postavy. Děj se začíná odvíjet od evakuace amerických papalášů z čínského Šanghaje, kterým se hráčův oddíl musí probít až do bezpečí.\r\n \r\n\r\nÚžasný a atmosferický příběh.\r\nFrostbite 3, úžasná nová technologie, která posouvá úroveň animace, destrukce, osvětlení a zvuku do zcela nových výšek.\r\nBezkonkurenční nasazení bojové techniky — nejlepší zpracování boje v různých typech vojenské techniky.\r\nMožnost demolice a proměňování herního prostředí. ', '2013-11-15', 'EA Digital Illusions CE', 'Playstation 4'),
(67, 'ARK: Survival Evolved', '<p>Ark: Survival Evolved (zkr&aacute;ceně ARK) je open world action-adventure survival poč&iacute;tačov&aacute; hra. Byla vyvinuta společnost&iacute; Studio Wildcard s pomoc&iacute; Instinct Games, Efecto Studios a Virtual Basement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ve hře hr&aacute;č mus&iacute; přež&iacute;t, na jednom ze třech světů (kter&eacute; doposud vy&scaron;ly), ve světě nen&iacute; s&aacute;m, ale s dinosaury a dal&scaron;&iacute;mi prehistorick&yacute;mi zv&iacute;řaty nebo s ostatn&iacute;mi hr&aacute;či (multiplayer). Hr&aacute;č může vyr&aacute;bět různě věci na obranu, oblečen&iacute; nebo tak&eacute; na stavěn&iacute; nějak&eacute;ho př&iacute;bytku,atd...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Věci kter&eacute; může vyrobit se odemykaj&iacute; pomoc&iacute; engramů, kter&eacute; dostane na každ&eacute; dal&scaron;&iacute; &uacute;rovni. Zku&scaron;enosti se z&iacute;sk&aacute;vaj&iacute; jednodu&scaron;e stač&iacute; vyr&aacute;bět, sb&iacute;rat suroviny nebo zab&iacute;jet.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hra nem&aacute; ž&aacute;dn&yacute; konec.</p>\r\n', '2015-06-02', 'Studio Wildcard, Instinct Game', 'Xbox One'),
(68, 'The Sims', '<p>Hr&aacute;č měl na starost jednu a v&iacute;ce osob (Sim&iacute;ky), kter&eacute;mu ze zač&aacute;tku hry postavil nebo koupil dům a musel se starat o jeho potřeby, kter&eacute; byly vyj&aacute;dřeny ukazateli n&aacute;lady, čistoty, společnosti, hladu, &uacute;navy, z&aacute;bavy, prostřed&iacute; apod. Pokud Sim&iacute;k měl někter&yacute; z ukazatelů v kritick&eacute;m stavu, nejdř&iacute;ve protestoval. Později, pokud měl např&iacute;klad zanedbanou hygienu, začal zap&aacute;chat, pokud byl velmi unaven&yacute;, mohl usnout ve stoje nebo omdl&iacute;t, pokud měl kritick&eacute; hodnoty na ukazateli potřeby toalety, tak se počůral. Hr&aacute;č měl k dispozici 3 hern&iacute; m&oacute;dy: Život, ve kter&eacute;m se o Sim&iacute;ka staral, nech&aacute;val ho chodit do pr&aacute;ce, vařit, č&iacute;st noviny, prostě ž&iacute;t (i když regulovan&yacute;mi př&iacute;kazy) N&aacute;kup byl určen pro vybaven&iacute; dom&aacute;cnosti nebo exteri&eacute;ru předměty (stůl, židle, spor&aacute;k, sprcha...) Stavbu, kdy se čas v Sim&iacute;kově světě zastavil a hr&aacute;č mohl stavět/bourat dům, upravovat ter&eacute;n zahrady, stavět baz&eacute;n apod. Ve hře bylo kromě předdefinovan&yacute;ch postav možn&eacute; si vytvořit vlastn&iacute; postavu nebo celou rodinu. Oproti The Sims 2 v prvn&iacute;m d&iacute;lu bylo možn&eacute; sice vychovat v rodině d&iacute;tě, ale to nikdy nedospělo a dospěl&iacute; jedinci nest&aacute;rli, mohli v&scaron;ak zemř&iacute;t n&aacute;sledkem dlouhodob&eacute;ho zanedb&aacute;n&iacute;.</p>\r\n', '2000-02-04', 'Maxis', 'Notebook'),
(130, 'Diablo III', '<p>Zasazeno opět do světa Sanctuary, nad n&iacute;mž z nebe spadne kometa přesně do těch m&iacute;st, odkud kdysi Diablo vy&scaron;el na svět. Navr&aacute;tiv&scaron;&iacute; se postava Deckarda Caina možn&aacute; jednou z prvn&iacute;ch obět&iacute; zla. Mezi nov&yacute;mi lokacemi tak&eacute; star&aacute; zn&aacute;m&aacute; m&iacute;sta včetně vesnice Tristramu.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Možnost vybrat si mezi mužskou a ženskou verz&iacute; postav, rozd&iacute;l v&scaron;ak bude čistě vizu&aacute;ln&iacute;. Barbar nikoliv novou postavou se stejn&yacute;mi schopnostmi, n&yacute;brž o dvacet let zest&aacute;rl&yacute;m hrdinou z dvojky, což pozn&aacute;te podle &uacute;navy i mnoha &scaron;r&aacute;mů na těle. Nov&yacute; syst&eacute;m questů, přizpůsoben&yacute; pro tř&iacute;du hr&aacute;čovy postavy. Skilly př&iacute;stupn&eacute; př&iacute;mo z hlavn&iacute;ho hotbaru s možnost&iacute; jejich rychl&eacute;ho v&yacute;běru skrz kolečka na my&scaron;i. Včetně nov&eacute; metody uzdravov&aacute;n&iacute;, kdy přes dan&yacute; předmět bude stačit přej&iacute;t (tzn. nebudete jej muset sebrat a teprve potom vyp&iacute;t jako lahvičky).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Z nov&yacute;ch nepř&aacute;tel např. Berserker s obrovskou palic&iacute;, kter&aacute; bude moci uv&iacute;znout v zemi, než se v&aacute;lečn&iacute;kovi podař&iacute; ji vyprostit. Se snadněj&scaron;&iacute;m vyměňov&aacute;n&iacute;m předmětů a brněn&iacute;/zbran&iacute; mezi postavami v partě. Pro každ&eacute;ho hr&aacute;če v partě ze zabit&eacute;ho nepř&iacute;tele jin&eacute; předměty, tzn. nebudou již vypad&aacute;vat na zem, kde mezi sebou hr&aacute;či soutěžili o to, kdo je rychleji sebere.</p>\r\n', '2015-07-16', 'Blizzard Entertainment', 'PC'),
(131, 'DayZ', '<p>Tak jsme se dočkali. Po dlouh&eacute; prodlevě si každ&yacute; může vyzkou&scaron;et dlouho oček&aacute;van&yacute; zombie titul DayZ Standalone.</p>\r\n\r\n<p><br />\r\nPokud n&aacute;hodou nev&iacute;te, o co go, pak věřte, že DayZ Standalone je plnohodnotn&aacute; hra, postaven&aacute; na obl&iacute;ben&eacute;m m&oacute;du pro původn&iacute; Armu 2. Nab&iacute;z&iacute; otevřen&yacute; svět, realistick&eacute; pojet&iacute; přežit&iacute; a komunitn&iacute; propojen&yacute; online svět.<br />\r\nNezapom&iacute;nejte tak&eacute;, že se jedn&aacute; o alfaverzi. Hra se tedy neobejde bez chybek a nedodělků a slouž&iacute; předev&scaron;&iacute;m k tomu, abychom si bugů v&scaron;imli a v&yacute;voj&aacute;ři je stihli včas opravit. A k čemu dostaneme př&iacute;stup?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><br />\r\nZaběh&aacute;me si po Černarusi, prostřed&iacute; o rozloze 250 čtverečn&iacute;ch kilometrů, pokryt&eacute;mu hlubok&yacute;mi lesy, městečky, opu&scaron;těn&yacute;mi vesnicemi i vojensk&yacute;mi komplexy. Na jednom serveru se najednou může nach&aacute;zet až 40 hr&aacute;čů, o n&aacute;hodn&aacute; setk&aacute;n&iacute; tedy nebude nouze.</p>\r\n\r\n<p><br />\r\nPř&iacute;stupn&yacute; je i kompletn&iacute; invent&aacute;ř, craftov&aacute;n&iacute;, &uacute;prava zbran&iacute; a oblečen&iacute;. D&iacute;ky alfaverzi se můžeme tě&scaron;it na postupn&eacute; zlep&scaron;ov&aacute;n&iacute; a přid&aacute;v&aacute;n&iacute; nov&yacute;ch hern&iacute;ch prvků, jako je využit&iacute; vozidel, př&iacute;rodn&iacute; fauna, tvořen&iacute; vlastn&iacute;ch staven&iacute;, zlep&scaron;en&aacute; grafick&aacute; str&aacute;nka a fyzika (ragdoll atd.) a mohutn&aacute; podpora m&oacute;dů.</p>\r\n\r\n<p><br />\r\nJedn&aacute; se o hru s předběžn&yacute;m př&iacute;stupem. Z&iacute;skejte okamžit&yacute; př&iacute;stup a začněte hr&aacute;t. Zapoj&iacute;te se do t&eacute;to hry již během jej&iacute;ho v&yacute;voje.</p>\r\n', '2020-03-11', 'Bohemia Interactive Studio', 'PC'),
(132, 'Far Cry 4', '<p>Far Cry 4 navazuje na legend&aacute;rn&iacute; &uacute;spěch sv&eacute;ho předchůdce a přin&aacute;&scaron;&iacute; nejrozs&aacute;hlej&scaron;&iacute; a nejohromněj&scaron;&iacute; z&aacute;žitek z cel&eacute; dosavadn&iacute; s&eacute;rie Far Cry. Tě&scaron;it se můžete na zcela nov&yacute; obrovsk&yacute; otevřen&yacute; svět s integrovan&yacute;m kooperativn&iacute;m režimem, do kter&eacute;ho se můžete kdykoli zapojit a kdykoli se od něj zase odpojit.<br />\r\n<br />\r\nVelmi oček&aacute;van&eacute; pokračov&aacute;n&iacute; akčn&iacute;ho hern&iacute;ho dobrodružstv&iacute; Far Cry přich&aacute;z&iacute; a přin&aacute;&scaron;&iacute; hr&aacute;čům nov&eacute; prostřed&iacute; a dechbrouc&iacute; grafiku. Ve Far Cry 4 najdeme nov&yacute; otevřen&yacute; svět Him&aacute;lajsk&yacute;ch vrcholů, nov&eacute; zbraně, vozidla a tak&eacute; divok&aacute; zv&iacute;řata. Hlavn&iacute;m hrdinou je sněd&yacute; drsň&aacute;ck&yacute; mlad&iacute;k Ajay Ghale, kter&yacute; bude nucen čelit nesčetn&eacute;mu množstv&iacute; přek&aacute;žek a nebezpečn&yacute;m protivn&iacute;kům.</p>\r\n\r\n<p>Využ&iacute;vat budete lezen&iacute; po skal&aacute;ch pomoc&iacute; vystřelovac&iacute;ho h&aacute;ku, nebo si můžete už&iacute;t voln&yacute; p&aacute;d do propasti pomoc&iacute; speci&aacute;ln&iacute;ho obleku. K dispozici bude tak&eacute; velk&yacute; arsen&aacute;l zbran&iacute; pro odstřelov&aacute;n&iacute; nebo boj na bl&iacute;zko.</p>\r\n', '2020-03-12', 'Ubisoft', 'Playstation 4');

-- --------------------------------------------------------

--
-- Struktura tabulky `obrazek`
--

CREATE TABLE `obrazek` (
  `id_obr` int(10) NOT NULL,
  `typ` text NOT NULL,
  `id_hry` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `obrazek`
--

INSERT INTO `obrazek` (`id_obr`, `typ`, `id_hry`) VALUES
(1726, 'image/jpeg', 60),
(1727, 'image/jpeg', 60),
(1730, 'image/jpeg', 60),
(1731, 'image/jpeg', 60),
(1732, 'image/png', 60),
(1733, 'image/jpeg', 60),
(1734, 'image/jpeg', 61),
(1735, 'image/jpeg', 61),
(1736, 'image/jpeg', 61),
(1737, 'image/jpeg', 61),
(1738, 'image/jpeg', 61),
(1739, 'image/jpeg', 62),
(1740, 'image/jpeg', 62),
(1741, 'image/jpeg', 62),
(1742, 'image/jpeg', 62),
(1743, 'image/jpeg', 62),
(1744, 'image/jpeg', 63),
(1745, 'image/jpeg', 63),
(1746, 'image/jpeg', 63),
(1747, 'image/jpeg', 64),
(1748, 'image/jpeg', 64),
(1749, 'image/jpeg', 64),
(1756, 'image/jpeg', 67),
(1757, 'image/jpeg', 67),
(1758, 'image/jpeg', 67),
(1759, 'image/jpeg', 68),
(1760, 'image/jpeg', 68),
(1761, 'image/jpeg', 68),
(1762, 'image/png', 68),
(1921, 'image/jpeg', 130),
(1922, 'image/jpeg', 130),
(1923, 'image/jpeg', 130),
(1924, 'image/jpeg', 131),
(1925, 'image/jpeg', 131),
(1926, 'image/jpeg', 131),
(1927, 'image/jpeg', 131),
(1928, 'image/jpeg', 131),
(1929, 'image/jpeg', 131),
(1930, 'image/jpeg', 131),
(1931, 'image/jpeg', 132),
(1932, 'image/jpeg', 132),
(1933, 'image/jpeg', 132);

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
(63, 'test1', 'test1', 'test1', 'test1@test1.tes', '1b4f0e9851971998e732078544c96b36c3d01cedf7caa332359d6f1d83567014', 'gkafmfx4erwc2h2r8ay2jqs8ieyrsa4mbjv8gb8c', '1'),
(64, 'janko', 'janko', 'janko', 'janko@janko.cz', 'bbf8705546c206e438aa0029dd5e5ea1d623804d1f917c95a0813d897deee574', 'jfovsuobjg7bvebsf728miud086f3svwk3mnpksi', '0'),
(65, 'bum', 'bum', 'bum', 'bum@bum.bum', '205063ee66a82cd2b7f65a402f1b0dc671fae8675c4b9802bf72077a388fffd4', '6wmyahcik305mnfbcmfnsrtmpa0tk5iasb7f27cc', '0');

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
(34, 'https://youtu.be/fRfHeXvaC50', 67),
(35, 'https://youtu.be/lu7sSgSkTHs', 67),
(36, 'https://youtu.be/J_MoE2vkVwQ', 67),
(37, 'https://youtu.be/gi0AB5ksxuY', 68),
(38, 'https://youtu.be/Kkn5xazokXo', 68),
(39, 'https://youtu.be/AZGhAejabBM', 68),
(54, 'https://youtu.be/Ab2-WW1skOM', 130),
(55, 'https://youtu.be/aIWaCWgABz0', 130),
(56, 'https://youtu.be/b0rKX_MI9zw', 130),
(57, 'https://youtu.be/PSXzdo8ZOc4', 131),
(58, 'https://youtu.be/cQvL8ua3uWw', 131),
(59, 'https://youtu.be/goV7X9ECd0E', 131),
(60, 'https://youtu.be/xfQ3Bi1Z6MA', 132),
(61, 'https://youtu.be/Rj505d44x5k', 132),
(62, 'https://youtu.be/6d60v1OErEY', 132);

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
(19, 61),
(19, 130),
(19, 131),
(20, 130),
(20, 132),
(21, 61),
(21, 64),
(21, 131),
(21, 132),
(22, 60),
(22, 67),
(22, 131),
(22, 132),
(23, 131),
(27, 62),
(27, 63),
(28, 68),
(29, 68),
(29, 132),
(30, 60),
(30, 131),
(32, 131),
(33, 130),
(33, 131),
(35, 61),
(35, 131),
(36, 68),
(37, 60),
(37, 63),
(37, 130),
(37, 131),
(37, 132),
(38, 60),
(38, 130),
(39, 61),
(39, 67),
(39, 131),
(39, 132);

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
  MODIFY `id_hod` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pro tabulku `hra`
--
ALTER TABLE `hra`
  MODIFY `id_hry` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT pro tabulku `obrazek`
--
ALTER TABLE `obrazek`
  MODIFY `id_obr` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1934;

--
-- AUTO_INCREMENT pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  MODIFY `ID_uzivatele` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pro tabulku `video`
--
ALTER TABLE `video`
  MODIFY `id_vid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pro tabulku `zanr`
--
ALTER TABLE `zanr`
  MODIFY `id_zanru` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
