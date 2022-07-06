
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--
-- Baza danych: `biblioteka`
--

-- --------------------------------------------------------

--
-- Struktura tablicy dla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Przekazanie danych do tablicy `admin`
--

INSERT INTO `admin` (`id`, `email`, `pass`) VALUES
(1, 'admin@mail.com', '123');

-- --------------------------------------------------------

--
-- Struktura tablicy dla  `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `bookauthor` varchar(25) NOT NULL, 
  `bookname` varchar(25) NOT NULL,
  `bookdetail` varchar(110) NOT NULL,
  `branch` varchar(110) NOT NULL,
  `bookprice` varchar(25) NOT NULL,
  `bookquantity` varchar(25) NOT NULL,  -- ilosc ksiazek
  `bookava` int(11) NOT NULL, -- ilosc ksiazek do wypozyczenia
  `bookrent` int(11) NOT NULL -- ilosc ksiazek wypozyczonych
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Przekazanie danych do tablicy ksiazek `book`
--

INSERT INTO `book` (`id`, `bookname`, `bookauthor`, `bookdetail`, `branch`, `bookprice`, `bookquantity`, `bookava`, `bookrent`) VALUES
(1, 'Pan Tadeusz', 'Adam Mickiewicz', 'ostatni zajazd na Litwie','literatura', '10', '20', 5, 2),
(2, 'Jezyk Java', 'Janusz Kowalski', 'programowanie','IT', '15', '15', 5, 1),
(3, 'Hobbit', 'J.R.R. Tolkien', 'czyli tam i z powrotem','fantasy', '10', '15', 2, 0),
(4, 'Wiedzmin', 'Andrzej Sapkowski', 'zlo to zlo','fantasy', '25', '15', 1, 0);

-- --------------------------------------------------------

--
-- Struktura tablicy dla `issuebook`
--

CREATE TABLE `issuebook` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `issuename` varchar(25) NOT NULL,
  `issuebook` varchar(25) NOT NULL,
  `issuetype` varchar(25) NOT NULL,
  `issuedays` int(11) NOT NULL,
  `issuedate` varchar(25) NOT NULL,
  `issuereturn` varchar(25) NOT NULL,
  `fine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Przekazanie danych do tablicy wydanych ksiazek `issuebook`
--

INSERT INTO `issuebook` (`id`, `userid`, `issuename`, `issuebook`, `issuetype`, `issuedays`, `issuedate`, `issuereturn`) VALUES
(1, 1, 'Nasiadko', 'Pan Tadeusz', 'student', 3, '03/07/2022', '27/07/2022'),
(2, 2, 'Kowalski', 'Pan Tadeusz', 'nauczyciel', 4, '02/07/2022', '26/07/2022'),
(3, 1, 'Nasiadko', 'Jezyk Java', 'student', 7, '01/07/2022', '29/07/2022');

-- --------------------------------------------------------

--
-- Struktura tablicy dla `requestbook`
--

CREATE TABLE `requestbook` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `usertype` varchar(25) NOT NULL,
  `bookname` varchar(25) NOT NULL,
  `issuedays` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tablicy dla `userdata`
--

CREATE TABLE `userdata` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Przekazanie danych do tablic `userdata`
--

INSERT INTO `userdata` (`id`, `name`, `email`, `pass`, `type`) VALUES
(1, 'Nasiadko', 'nasiadko@mail.com', '123', 'student'),
(2, 'Kowalski', 'kowalski@mail.com', '123', 'nauczyciel'),
(3, 'Nowy', 'nowy@mail.com', '123', 'student');


--
-- Indeksy dla przekazancyh tablic
-- 

--
-- Indeksy dla  tablicy `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla  tablicy `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla  tablicy `issuebook`
--
ALTER TABLE `issuebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_fk` (`userid`);

--
-- Indeksy dla  tablicy `requestbook`
--
ALTER TABLE `requestbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_fk_book` (`bookid`),
  ADD KEY `pk_fk_users` (`userid`);

--
-- Indeksy dla  tablicy `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla przekazanych tablic
--

--
-- AUTO_INCREMENT dla tablicy `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tablicy `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tablicy `issuebook`
--
ALTER TABLE `issuebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tablicy `requestbook`
--
ALTER TABLE `requestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tablicy `userdata`
--
ALTER TABLE `userdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla przekazanych tablic
--

--
-- Ograniczenia dla tablicy `issuebook`
--
ALTER TABLE `issuebook`
  ADD CONSTRAINT `pk_fk` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`);

--
-- Ograniczenia dla tablicy `requestbook`
--
ALTER TABLE `requestbook`
  ADD CONSTRAINT `pk_fk_users` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
