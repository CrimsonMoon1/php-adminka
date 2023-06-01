-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 04 2023 г., 07:02
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `libre`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `date_born` date NOT NULL COMMENT 'Дата рождения',
  `date_death` date DEFAULT NULL COMMENT 'дата смерти (если есть)',
  `author_name` varchar(255) NOT NULL COMMENT 'имя',
  `author_lastname` varchar(255) NOT NULL COMMENT 'фамилия',
  `author_surname` varchar(255) NOT NULL COMMENT 'отчество'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`author_id`, `date_born`, `date_death`, `author_name`, `author_lastname`, `author_surname`) VALUES
(1, '0000-00-00', '0000-00-00', '[4]', '[5]', '[6]'),
(2, '0000-00-00', '0000-00-00', '[4]', '[ыыы]', '[6]');

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `storage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`book_id`, `author_id`, `genre_id`, `storage_id`) VALUES
(1, 1, 1, 1),
(4, 0, 1, 1),
(5, 0, 1, 1),
(6, 0, 1, 1),
(7, 0, 1, 1),
(8, 0, 1, 1),
(9, 0, 1, 1),
(10, 0, 2, 3),
(11, 0, 1, 1),
(12, 0, 2, 1),
(13, 0, 123, 3231),
(14, 0, 123, 3231),
(15, 0, 123, 3231),
(16, 0, 123, 123),
(17, 2, 3, 1),
(18, 1, 1, 4),
(19, 1, 1231, 1231),
(20, 2, 1231, 123123),
(21, 1, 123, 123);

-- --------------------------------------------------------

--
-- Структура таблицы `extradition`
--

CREATE TABLE `extradition` (
  `worker_id` int(11) NOT NULL,
  `tick_id` int(11) NOT NULL,
  `date_ex` date NOT NULL COMMENT 'Дата выдачи',
  `date_back` date NOT NULL COMMENT 'Дата сдачи обратно'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fund`
--

CREATE TABLE `fund` (
  `fund_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `fund_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(255) NOT NULL,
  `genre_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `storage`
--

CREATE TABLE `storage` (
  `storage_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL COMMENT 'книга',
  `hall_id` int(11) NOT NULL COMMENT 'зал',
  `rack_id` int(11) NOT NULL COMMENT 'стеллаж в библиотеке',
  `shelf_id` int(11) NOT NULL COMMENT 'полка',
  `fund_id` int(11) NOT NULL COMMENT 'фонд'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `storage-book`
--

CREATE TABLE `storage-book` (
  `st_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `tick`
--

CREATE TABLE `tick` (
  `tick_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bibl_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `educational_institution` varchar(255) DEFAULT NULL,
  `faculty` varchar(255) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `group_s` varchar(100) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `scientific_theme` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL COMMENT 'айди юзера',
  `tick_id` int(11) NOT NULL COMMENT 'номер билета',
  `bibl_id` int(11) NOT NULL COMMENT 'айди библиотеки',
  `type_id` int(11) NOT NULL COMMENT 'тип пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `tick_id`, `bibl_id`, `type_id`) VALUES
(7, 2, 2, 2),
(8, 3, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `worker`
--

CREATE TABLE `worker` (
  `worker_id` int(11) NOT NULL,
  `w_name` varchar(100) NOT NULL,
  `w_lastname` varchar(100) NOT NULL,
  `bibl_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Индексы таблицы `fund`
--
ALTER TABLE `fund`
  ADD PRIMARY KEY (`fund_id`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Индексы таблицы `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`storage_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `tick`
--
ALTER TABLE `tick`
  ADD PRIMARY KEY (`tick_id`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`worker_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `fund`
--
ALTER TABLE `fund`
  MODIFY `fund_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `storage`
--
ALTER TABLE `storage`
  MODIFY `storage_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tick`
--
ALTER TABLE `tick`
  MODIFY `tick_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'айди юзера', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `worker`
--
ALTER TABLE `worker`
  MODIFY `worker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
