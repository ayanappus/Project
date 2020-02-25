-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 25 2020 г., 09:59
-- Версия сервера: 10.1.38-MariaDB
-- Версия PHP: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'Ayan', 'Ayanapp@gmail.com', '$2y$10$gwadjXoAGPJyaWR3s4pEFewB49GmXphxGUOGYNvb6JW0frXN8TxZm', '0'),
(2, 'Yan', 'ayanappus12345@gmail.com', '$2y$10$6gw6AENsPeTDa0mppuMdZ.vVLZZuOKDeNZW4YBBo1xclTwH6Kn0H2', '0'),
(3, 'OverlordOfPeace', 'ayanappus1337@gmail.com', '$2y$10$phkkp2hJOKTJ82d1z70G3.R19SdiZ0CKNVz.PnW3ntsja/CkeiJA2', '0'),
(4, 'rizwan', 'AyanApp12345@list.ru', '$2y$10$gWsEBqbhkEVXHEu4GAml.eqjUVpEN/BXiHEpj54HE5OPhVCItQmB2', '0'),
(5, 'tima_suffer', 'xuesos@gmail.com', '$2y$10$PugdkUv9IwLvq1/qdUZt5.8agsnPCFwCUe8USFIMIO4rFN26xIFXK', '0'),
(6, 'rezan', 'koshka123@gmail.com', '$2y$10$Sz0BMw9wztxo.AGpST91hujpKtaCmjy9Q..zMksUryy5LrCWPZcdu', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HGK500'),
(2, 'Tuturum'),
(3, 'Brand');

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 1, '::1', 2, 1),
(2, 1, '::1', 4, 1),
(4, 1, '::1', 7, 1),
(5, 2, '::1', 7, 1),
(6, 3, '::1', 7, 1),
(7, 3, '::1', 8, 1),
(8, 6, '::1', 7, 1),
(9, 5, '::1', 7, 1),
(10, 4, '::1', 7, 15),
(12, 4, '::1', 10, 0),
(13, 9, '::1', 11, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Training apparatus'),
(2, 'Fitness accessories'),
(3, 'Sports game goods');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 10, 4, 5, '2W683872K9523482A', 'Completed'),
(2, 10, 4, 1, '2JE9633137751171D', 'Completed');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(4, 3, 1, 'Badminton Racket 1', 8000, 15, 'The badminton racket', '1578589455_1-1.jpg', 'badminton, racket, sport'),
(5, 3, 1, 'Badminton Racket 2', 10000, 15, 'The badminton racket 2', '1578589560_1-3.jpg', 'racket, badminton, sport'),
(6, 3, 2, 'Bike Model 1', 50000, 5, 'The Bike Model 1', '1578589687_1-2.jpg', 'sport, bike'),
(7, 3, 2, 'Snowboard Model 1', 38000, 10, 'Snowboard Model 1', '1578589768_1-4.jpg', 'snowboard, snowboards, sport, snow'),
(9, 1, 1, 'Cardio Run', 75000, 3, 'The training product.', '1579590101_2-2.jpg', 'training apparatus');

-- --------------------------------------------------------

--
-- Структура таблицы `sorting`
--

CREATE TABLE `sorting` (
  `sorting_id` int(10) NOT NULL,
  `sorting_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `sorting`
--

INSERT INTO `sorting` (`sorting_id`, `sorting_title`) VALUES
(1, 'Ascending order'),
(2, 'Descending order');

-- --------------------------------------------------------

--
-- Структура таблицы `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Atgjk', 'nmnmnmn', 'kdak@gmail.com', '4ccd1d07e28537faa6421c9739fe1866', '7775301530', 'dassad', 'daasd'),
(2, 'Aybek', 'Alimkhan', 'ayanappus@gmail.com', '4ccd1d07e28537faa6421c9739fe1866', '7775301530', 'sadsad', 'dsdadsad'),
(3, 'Ayan', 'Baimakhan', 'ayanapp@gmail.com', '01440c64bb357f8c0f83818b470b7ec6', '7775301530', 'dassad', '124421421'),
(4, 'Aaren', 'Leroy', 'ayanapp@list.ru', '4ccd1d07e28537faa6421c9739fe1866', '7775301530', '231231321321', '13232132131'),
(10, 'Sayazhan', 'Rizwan', 'koshka@gmail.com', '584c37eda3b892d7e35d58491e9de4d1', '8702663418', 'Street Tauke Khan', 'House 135'),
(11, 'Aybek', 'Grendy', 'ayanappasan@gmail.com', '4ccd1d07e28537faa6421c9739fe1866', '8775301530', 'Ð•Ñ€ÐµÑˆÐ¾Ðº 24', 'Ð•Ñ€ÐµÑˆÐ¾Ð');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Индексы таблицы `sorting`
--
ALTER TABLE `sorting`
  ADD PRIMARY KEY (`sorting_id`);

--
-- Индексы таблицы `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `sorting`
--
ALTER TABLE `sorting`
  MODIFY `sorting_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
