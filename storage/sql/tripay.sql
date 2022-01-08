-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2022 at 09:03 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tripay`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `name`, `type`, `validation`, `is_required`, `is_unique`, `is_filterable`, `is_configurable`, `created_at`, `updated_at`) VALUES
(1, 'color', 'Color', 'select', NULL, 0, 0, 1, 1, '2021-12-01 01:44:42', '2021-12-01 01:44:42'),
(2, 'size', 'Size', 'select', NULL, 0, 0, 1, 1, '2021-12-01 01:45:27', '2021-12-01 01:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Red', '2021-12-01 01:48:38', '2021-12-01 01:48:38'),
(2, 1, 'Yellow', '2021-12-01 01:49:00', '2021-12-01 01:49:00'),
(3, 1, 'Navy', '2021-12-01 01:49:34', '2021-12-01 01:49:34'),
(5, 2, 'M', '2021-12-01 01:50:11', '2021-12-01 01:50:11'),
(7, 1, 'White', '2021-12-01 01:50:33', '2021-12-01 01:50:33'),
(8, 2, 'L', '2021-12-01 01:50:42', '2021-12-01 01:50:42'),
(11, 2, 'S', '2021-12-01 01:51:18', '2021-12-01 01:51:18'),
(13, 2, 'XL', '2021-12-01 01:51:34', '2021-12-01 01:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product_values`
--

CREATE TABLE `attribute_product_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(8,2) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_product_values`
--

INSERT INTO `attribute_product_values` (`id`, `parent_product_id`, `product_id`, `attribute_id`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `created_at`, `updated_at`) VALUES
(1, 3, 4, 1, 'Red', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 02:01:20', '2021-12-01 02:01:20'),
(2, 3, 4, 2, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 02:01:20', '2021-12-01 02:01:20'),
(3, 3, 5, 1, 'Red', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 02:01:20', '2021-12-01 02:01:20'),
(4, 3, 5, 2, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 02:01:20', '2021-12-01 02:01:20'),
(5, 3, 6, 1, 'Yellow', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 02:01:20', '2021-12-01 02:01:20'),
(6, 3, 6, 2, 'L', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 02:01:20', '2021-12-01 02:01:20'),
(7, 3, 7, 1, 'Yellow', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 02:01:20', '2021-12-01 02:01:20'),
(8, 3, 7, 2, 'XL', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 02:01:20', '2021-12-01 02:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Pakaian', 'pakaian', 0, '2021-12-01 01:10:46', '2021-12-01 01:10:46'),
(3, 'Asesoris', 'asesoris', 0, '2021-12-01 01:11:34', '2021-12-01 01:11:34'),
(4, 'Peralatan Sekolah', 'peralatan-sekolah', 0, '2021-12-01 01:11:50', '2021-12-01 01:11:50'),
(5, 'Elektronik', 'elektronik', 0, '2021-12-01 01:12:05', '2021-12-01 01:12:05'),
(6, 'Otomotif', 'otomotif', 0, '2021-12-01 20:49:45', '2021-12-01 20:49:45'),
(7, 'Formal', 'formal', 1, '2021-12-01 20:50:08', '2021-12-01 20:56:15'),
(8, 'Mainan', 'mainan', 5, '2021-12-10 22:27:56', '2021-12-10 22:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '9f539c84-5284-4a11-8201-1cb45ee2365d', 'database', 'default', '{\"uuid\":\"9f539c84-5284-4a11-8201-1cb45ee2365d\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #1056)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-15 05:30:18'),
(2, 'a39cec18-e1d0-423a-82ec-eed0ddf17f8f', 'database', 'default', '{\"uuid\":\"a39cec18-e1d0-423a-82ec-eed0ddf17f8f\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:22'),
(3, 'f406af21-951f-481d-89d6-3ac43534a7a7', 'database', 'default', '{\"uuid\":\"f406af21-951f-481d-89d6-3ac43534a7a7\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:26'),
(4, 'a047daa9-2c09-43ef-b5b1-140e9082defd', 'database', 'default', '{\"uuid\":\"a047daa9-2c09-43ef-b5b1-140e9082defd\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:27');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(5, '24b0ada4-af36-40f5-b953-4af5fe9f947d', 'database', 'default', '{\"uuid\":\"24b0ada4-af36-40f5-b953-4af5fe9f947d\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:31'),
(6, 'a856a8b6-3c4a-4398-9012-599cee323c16', 'database', 'default', '{\"uuid\":\"a856a8b6-3c4a-4398-9012-599cee323c16\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:35'),
(7, '6033e633-96f9-4a54-89c6-d12e50d1cda0', 'database', 'default', '{\"uuid\":\"6033e633-96f9-4a54-89c6-d12e50d1cda0\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:39'),
(8, '834af5ab-416d-42b9-830b-3bea91c4fea2', 'database', 'default', '{\"uuid\":\"834af5ab-416d-42b9-830b-3bea91c4fea2\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:42');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(9, '5625d78c-1d1d-43c0-ad00-9ba1f3b48dec', 'database', 'default', '{\"uuid\":\"5625d78c-1d1d-43c0-ad00-9ba1f3b48dec\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:45'),
(10, '846b5534-6a57-4ebe-9029-0336a1989246', 'database', 'default', '{\"uuid\":\"846b5534-6a57-4ebe-9029-0336a1989246\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderReceived\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\SendMailOrderReceived\\\":12:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.gmail.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: No such host is known.  in D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php:261\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}(2, \'stream_socket_c...\', \'D:\\\\xampp\\\\htdocs...\', 264, Array)\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(264): stream_socket_client(\'tcp://smtp.gmai...\', 0, \'php_network_get...\', 30, 4, Resource id #996)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Transport\\AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\swiftmailer\\swiftmailer\\lib\\classes\\Swift\\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(187): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(304): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderReceived))\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderReceived))\n#13 D:\\xampp\\htdocs\\tripay\\app\\Jobs\\SendMailOrderReceived.php(42): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderReceived))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailOrderReceived->handle()\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#20 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#21 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#22 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailOrderReceived), false)\n#24 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#25 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailOrderReceived))\n#26 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailOrderReceived))\n#28 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#40 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 {main}', '2021-12-17 04:00:52'),
(11, 'db157613-4fec-4759-9f20-a7700af25545', 'database', 'default', '{\"uuid\":\"db157613-4fec-4759-9f20-a7700af25545\",\"displayName\":\"App\\\\Jobs\\\\SendMailOrderShipped\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailOrderShipped\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\SendMailOrderShipped\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Jobs\\SendMailOrderShipped has been attempted too many times or run too long. The job may have previously timed out. in D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php:750\nStack trace:\n#0 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#2 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#3 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(329): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#4 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#6 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#12 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Command\\Command.php(299): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#13 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(978): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(295): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 D:\\xampp\\htdocs\\tripay\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 D:\\xampp\\htdocs\\tripay\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 D:\\xampp\\htdocs\\tripay\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 {main}', '2021-12-30 14:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 5, 3, '2021-12-21 11:29:02', '2021-12-21 11:29:02'),
(4, 5, 8, '2021-12-21 11:29:10', '2021-12-21 11:29:10'),
(5, 3, 8, '2021-12-21 11:43:05', '2021-12-21 11:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_18_081410_create_categories_table', 1),
(6, '2021_11_18_111004_create_products_table', 1),
(7, '2021_11_18_112544_create_attributes_table', 1),
(8, '2021_11_18_112824_create_attribute_product_values_table', 1),
(9, '2021_11_18_114028_create_product_inventories_table', 1),
(10, '2021_11_18_114811_create_categories_product_table', 1),
(11, '2021_11_18_115238_create_product_images_table', 1),
(12, '2021_11_18_120134_rename_column_depth_in_products_table', 1),
(13, '2021_11_19_103656_alter_column_in_products_table', 1),
(14, '2021_11_24_054348_add_columns_to_attributes_table', 1),
(15, '2021_11_24_055136_create_attribute_options_table', 1),
(16, '2021_11_25_022947_remove_column_attribute_product_value_id_in_product_inventories_table', 1),
(17, '2021_11_25_025730_add_parent_id_and_type_to_products_table', 1),
(18, '2021_11_25_031332_alter_attribute_relation_in_attribute_product_values_table', 1),
(19, '2021_11_27_215141_create_permission_tables', 1),
(20, '2021_12_10_085832_add_full_text_search_index_to_products_table', 2),
(21, '2021_12_11_115105_add_parent_product_id_to_attribute_product_values_table', 3),
(22, '2021_12_11_213013_rename_column_and_add_columns_in_users_table', 4),
(23, '2021_12_14_071431_create_orders_table', 5),
(24, '2021_12_14_075237_create_order_items_table', 5),
(25, '2021_12_14_075529_create_payments_table', 5),
(26, '2021_12_14_075736_create_shipments_table', 5),
(27, '2021_12_15_115842_create_jobs_table', 6),
(28, '2021_12_15_184959_add_payment_token_to_orders_table', 7),
(29, '2021_12_15_185328_add_status_to_payments_table', 7),
(30, '2021_12_19_212940_add_columns_to_product_images_table', 8),
(31, '2021_12_21_173337_create_favorites_table', 9),
(32, '2021_12_21_190343_create_slides_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `payment_due` datetime NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_total_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(16,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_postcode` int(11) DEFAULT NULL,
  `shipping_courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_service_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `cancelled_by` bigint(20) UNSIGNED DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancellation_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `code`, `status`, `order_date`, `payment_due`, `payment_status`, `payment_token`, `payment_url`, `base_total_price`, `tax_amount`, `tax_percent`, `discount_amount`, `discount_percent`, `shipping_cost`, `grand_total`, `note`, `customer_first_name`, `customer_last_name`, `customer_address1`, `customer_address2`, `customer_phone`, `customer_email`, `customer_city_id`, `customer_province_id`, `customer_postcode`, `shipping_courier`, `shipping_service_name`, `approved_by`, `approved_at`, `cancelled_by`, `cancelled_at`, `cancellation_note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'INV/20211214/XII/XIV/00001', 'created', '2021-12-14 18:58:33', '2021-12-21 18:58:33', 'unpaid', NULL, NULL, '120000.00', '14400.00', '12.00', '0.00', '0.00', '36000.00', '170400.00', 'note', 'Name First', 'Name Last', 'Depok', 'suite', '7788778877', 'superadmin@gmail.com', '440', '9', 99008, 'tiki', 'TIKI - ONS', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14 11:58:36', '2021-12-14 11:58:36'),
(3, 1, 'INV/20211214/XII/XIV/00002', 'created', '2021-12-14 22:34:36', '2021-12-21 22:34:36', 'unpaid', NULL, NULL, '140000.00', '16800.00', '12.00', '0.00', '0.00', '17000.00', '173800.00', 'Note No Ship', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'superadmin@gmail.com', '51', '11', 99008, 'jne', 'JNE - OKE', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14 15:34:37', '2021-12-14 15:34:37'),
(4, 6, 'INV/20211215/XII/XV/00001', 'created', '2021-12-15 09:04:28', '2021-12-22 09:04:28', 'unpaid', NULL, NULL, '120000.00', '14400.00', '12.00', '0.00', '0.00', '7000.00', '141400.00', 'note shipment checkout', 'Rizki', 'Fadillah', 'Tiga Putra', 'Tiga Putra', '7788778877', 'rizkifadillah26.rf@gmail.com', '457', '3', 99008, 'tiki', 'TIKI - ECO', NULL, NULL, NULL, NULL, NULL, '2021-12-19 04:42:53', '2021-12-15 02:04:32', '2021-12-19 04:42:53'),
(5, 6, 'INV/20211215/XII/XV/00002', 'cancelled', '2021-12-15 09:58:27', '2021-12-22 09:58:27', 'unpaid', NULL, NULL, '20000.00', '2400.00', '12.00', '0.00', '0.00', '13000.00', '35400.00', 'note', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '107', '9', 99008, 'tiki', 'TIKI - ECO', NULL, NULL, 1, '2021-12-17 11:24:57', 'Belum Bayar sampai batas waktu nya', NULL, '2021-12-15 02:58:27', '2021-12-17 04:24:57'),
(6, 6, 'INV/20211215/XII/XV/00003', 'created', '2021-12-15 10:28:00', '2021-12-22 10:28:00', 'unpaid', NULL, NULL, '20000.00', '2400.00', '12.00', '0.00', '0.00', '67500.00', '89900.00', 'Note', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '89', '15', 99008, 'pos', 'POS - Paket Kilat Khusus', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 03:28:00', '2021-12-15 03:28:00'),
(7, 6, 'INV/20211215/XII/XV/00004', 'created', '2021-12-15 12:27:38', '2021-12-22 12:27:38', 'unpaid', NULL, NULL, '100000.00', '12000.00', '12.00', '0.00', '0.00', '22000.00', '134000.00', 'note', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '126', '9', 99008, 'jne', 'JNE - REG', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 05:27:38', '2021-12-15 05:27:38'),
(8, 6, 'INV/20211215/XII/XV/00005', 'created', '2021-12-15 12:37:22', '2021-12-22 12:37:22', 'unpaid', NULL, NULL, '100000.00', '12000.00', '12.00', '0.00', '0.00', '87000.00', '199000.00', 'note', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '257', '16', 99008, 'pos', 'POS - Paket Kilat Khusus', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 05:37:22', '2021-12-15 05:37:22'),
(10, 6, 'INV/20211215/XII/XV/00006', 'created', '2021-12-15 12:49:30', '2021-12-22 12:49:30', 'unpaid', NULL, NULL, '20000.00', '2400.00', '12.00', '0.00', '0.00', '34000.00', '56400.00', 'Desc Note', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '156', '8', 99008, 'pos', 'POS - Paket Kilat Khusus', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 05:49:33', '2021-12-15 05:49:33'),
(11, 6, 'INV/20211215/XII/XV/00007', 'created', '2021-12-15 12:53:38', '2021-12-22 12:53:38', 'unpaid', NULL, NULL, '100000.00', '10000.00', '10.00', '0.00', '0.00', '101000.00', '211000.00', NULL, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '372', '20', 99008, 'jne', 'JNE - REG', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 05:53:38', '2021-12-15 05:53:38'),
(21, 6, 'INV/20211215/XII/XV/00008', 'created', '2021-12-15 22:45:39', '2021-12-22 22:45:39', 'unpaid', '3d5220e7-ecbb-456e-9d38-6457aa41650d', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/3d5220e7-ecbb-456e-9d38-6457aa41650d', '120000.00', '12000.00', '10.00', '0.00', '0.00', '13000.00', '145000.00', 'Note', 'Rizki', 'Fadillah', 'Depok', 'Kompleks', '7788778877', 'rizkifadillah26.rf@gmail.com', '115', '9', 99008, 'tiki', 'TIKI - ECO', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 15:45:39', '2021-12-15 15:45:41'),
(22, 6, 'INV/20211216/XII/XVI/00001', 'cancelled', '2021-12-16 06:39:52', '2021-12-23 06:39:52', 'unpaid', '1923b8f9-80dc-419d-abf7-8226cc74ace9', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/1923b8f9-80dc-419d-abf7-8226cc74ace9', '120000.00', '12000.00', '10.00', '0.00', '0.00', '13000.00', '145000.00', 'Note delivery', 'Rizki', 'Fadillah', 'tiga putra', 'Kompleks', '7788778877', 'rizkifadillah26.rf@gmail.com', '109', '9', 99008, 'tiki', 'TIKI - ECO', NULL, NULL, 1, '2021-12-17 19:25:57', 'tes', NULL, '2021-12-15 23:39:52', '2021-12-17 12:25:57'),
(23, 6, 'INV/20211216/XII/XVI/00002', 'created', '2021-12-16 07:32:22', '2021-12-23 07:32:22', 'unpaid', '1c90de51-e111-4706-8ead-25e70a0e63f6', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/1c90de51-e111-4706-8ead-25e70a0e63f6', '140000.00', '14000.00', '10.00', '0.00', '0.00', '12000.00', '166000.00', 'note', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '156', '8', 99008, 'tiki', 'TIKI - ECO', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-16 00:32:22', '2021-12-18 13:59:48'),
(24, 6, 'INV/20211216/XII/XVI/00003', 'created', '2021-12-16 08:03:57', '2021-12-23 08:03:57', 'unpaid', 'cda5a402-69f0-45d6-a303-f89e71d97efd', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/cda5a402-69f0-45d6-a303-f89e71d97efd', '100000.00', '10000.00', '10.00', '0.00', '0.00', '51000.00', '161000.00', 'note delivery', 'Rizki', 'Fadillah', 'Depok', 'Apart', '7788778877', 'rizkifadillah26.rf@gmail.com', '167', '14', 99008, 'jne', 'JNE - REG', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-16 01:03:57', '2021-12-16 01:03:59'),
(25, 6, 'INV/20211216/XII/XVI/00004', 'created', '2021-12-16 09:34:19', '2021-12-23 09:34:19', 'unpaid', 'ebc5125b-f184-4446-94c9-9e1bcf1b95cf', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/ebc5125b-f184-4446-94c9-9e1bcf1b95cf', '200000.00', '20000.00', '10.00', '0.00', '0.00', '42000.00', '262000.00', 'Note sss', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '283', '18', 99008, 'jne', 'JNE - OKE', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-16 02:34:19', '2021-12-16 02:34:20'),
(26, 6, 'INV/20211216/XII/XVI/00005', 'confirmed', '2021-12-16 09:49:50', '2021-12-23 09:49:50', 'paid', 'a449d342-4d90-4500-bb3f-c39cee3ad18f', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/a449d342-4d90-4500-bb3f-c39cee3ad18f', '20000.00', '2000.00', '10.00', '0.00', '0.00', '51000.00', '73000.00', 'test', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '39', '5', 99008, 'jne', 'JNE - REG', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-16 02:49:50', '2021-12-16 03:02:07'),
(27, 6, 'INV/20211216/XII/XVI/00006', 'confirmed', '2021-12-16 10:01:28', '2021-12-23 10:01:28', 'paid', '6a867a60-d12b-47ed-b4f3-db5425af1c5d', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/6a867a60-d12b-47ed-b4f3-db5425af1c5d', '200000.00', '20000.00', '10.00', '0.00', '0.00', '53000.00', '273000.00', NULL, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '341', '15', 99008, 'jne', 'JNE - OKE', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-16 03:01:28', '2021-12-16 03:05:10'),
(28, 1, 'INV/20211216/XII/XVI/00007', 'created', '2021-12-16 10:02:38', '2021-12-23 10:02:38', 'unpaid', 'e06df64a-d552-41b7-b8d2-26d985e83809', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/e06df64a-d552-41b7-b8d2-26d985e83809', '40000.00', '4000.00', '10.00', '0.00', '0.00', '40000.00', '84000.00', 'Note', 'Superadmin', 'Fadillah', 'Sss', 'Sprt', '85716855817', 'superadmin@gmail.com', '175', '4', 23658, 'tiki', 'TIKI - ECO', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-16 03:02:38', '2021-12-16 03:02:39'),
(29, 6, 'INV/20211216/XII/XVI/00008', 'completed', '2021-12-16 13:22:42', '2021-12-23 13:22:42', 'paid', '126a1ee0-738c-4cd5-a202-4be80c97533d', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/126a1ee0-738c-4cd5-a202-4be80c97533d', '100000.00', '10000.00', '10.00', '0.00', '0.00', '45000.00', '155000.00', 'note', 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '48', '17', 99008, 'jne', 'JNE - REG', 1, '2021-12-18 08:44:11', NULL, NULL, NULL, NULL, '2021-12-16 06:22:42', '2021-12-18 01:44:11'),
(30, 6, 'INV/20211230/XII/XXX/00001', 'created', '2021-12-30 21:30:49', '2022-01-06 21:30:49', 'unpaid', 'b650b8e1-7197-4833-9237-99a9e1500e7a', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/b650b8e1-7197-4833-9237-99a9e1500e7a', '40000.00', '4000.00', '10.00', '0.00', '0.00', '46000.00', '90000.00', 'test note', 'Rizki', 'Fadillah', 'Depok', 'no 29', '7788778877', 'rizkifadillah26.rf@gmail.com', '28', '2', 99008, 'jne', 'JNE - OKE', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-30 14:30:51', '2021-12-30 14:30:53'),
(31, 6, 'INV/20211230/XII/XXX/00002', 'created', '2021-12-30 21:40:55', '2022-01-06 21:40:55', 'unpaid', '88d51429-bb68-4fe4-a4e9-9b3ddf30d0aa', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/88d51429-bb68-4fe4-a4e9-9b3ddf30d0aa', '20000.00', '2000.00', '10.00', '0.00', '0.00', '16000.00', '38000.00', 'note', 'Rizki', 'Fadillah', 'Depok', 'no 29', '7788778877', 'rizkifadillah26.rf@gmail.com', '179', '11', 99008, 'jne', 'JNE - REG', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-30 14:40:55', '2021-12-30 14:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `base_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `base_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`attributes`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `base_price`, `base_total`, `tax_amount`, `tax_percent`, `discount_amount`, `discount_percent`, `sub_total`, `sku`, `type`, `name`, `weight`, `attributes`, `created_at`, `updated_at`) VALUES
(3, 3, 5, 2, '20000.00', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '7382893-1-13', 'configurable', 'Jersey Barcelona Home - Red - XL', '220.00', '{\"size\":\"XL\",\"color\":\"Red\"}', '2021-12-14 15:34:37', '2021-12-14 15:34:37'),
(4, 3, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-14 15:34:37', '2021-12-14 15:34:37'),
(5, 4, 4, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-1-8', 'configurable', 'Jersey Barcelona Home - Red - L', '200.00', '{\"size\":\"L\",\"color\":\"Red\"}', '2021-12-15 02:04:32', '2021-12-15 02:04:32'),
(6, 4, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-15 02:04:32', '2021-12-15 02:04:32'),
(7, 5, 4, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-1-8', 'configurable', 'Jersey Barcelona Home - Red - L', '200.00', '{\"size\":\"L\",\"color\":\"Red\"}', '2021-12-15 02:58:27', '2021-12-15 02:58:27'),
(8, 6, 4, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-1-8', 'configurable', 'Jersey Barcelona Home - Red - L', '200.00', '{\"size\":\"L\",\"color\":\"Red\"}', '2021-12-15 03:28:00', '2021-12-15 03:28:00'),
(9, 7, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-15 05:27:39', '2021-12-15 05:27:39'),
(10, 8, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-15 05:37:22', '2021-12-15 05:37:22'),
(12, 10, 4, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-1-8', 'configurable', 'Jersey Barcelona Home - Red - L', '200.00', '{\"size\":\"L\",\"color\":\"Red\"}', '2021-12-15 05:49:33', '2021-12-15 05:49:33'),
(13, 11, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-15 05:53:39', '2021-12-15 05:53:39'),
(32, 21, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-15 15:45:39', '2021-12-15 15:45:39'),
(33, 21, 6, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-2-8', 'configurable', 'Jersey Barcelona Home - Yellow - L', '200.00', '{\"size\":\"L\",\"color\":\"Yellow\"}', '2021-12-15 15:45:39', '2021-12-15 15:45:39'),
(34, 22, 5, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-1-13', 'configurable', 'Jersey Barcelona Home - Red - XL', '220.00', '{\"size\":\"XL\",\"color\":\"Red\"}', '2021-12-15 23:39:52', '2021-12-15 23:39:52'),
(35, 22, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-15 23:39:52', '2021-12-15 23:39:52'),
(36, 23, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-16 00:32:22', '2021-12-16 00:32:22'),
(37, 23, 4, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-1-8', 'configurable', 'Jersey Barcelona Home - Red - L', '200.00', '{\"size\":\"L\",\"color\":\"Red\"}', '2021-12-16 00:32:22', '2021-12-16 00:32:22'),
(38, 23, 7, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-2-13', 'configurable', 'Jersey Barcelona Home - Yellow - XL', '220.00', '{\"size\":\"XL\",\"color\":\"Yellow\"}', '2021-12-16 00:32:22', '2021-12-16 00:32:22'),
(39, 24, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-16 01:03:57', '2021-12-16 01:03:57'),
(40, 25, 8, 2, '100000.00', '200000.00', '0.00', '0.00', '0.00', '0.00', '200000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-16 02:34:19', '2021-12-16 02:34:19'),
(41, 26, 4, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-1-8', 'configurable', 'Jersey Barcelona Home - Red - L', '200.00', '{\"size\":\"L\",\"color\":\"Red\"}', '2021-12-16 02:49:50', '2021-12-16 02:49:50'),
(42, 27, 8, 2, '100000.00', '200000.00', '0.00', '0.00', '0.00', '0.00', '200000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-16 03:01:28', '2021-12-16 03:01:28'),
(43, 28, 7, 2, '20000.00', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '7382893-2-13', 'configurable', 'Jersey Barcelona Home - Yellow - XL', '220.00', '{\"size\":\"XL\",\"color\":\"Yellow\"}', '2021-12-16 03:02:38', '2021-12-16 03:02:38'),
(44, 29, 8, 1, '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', 'sku-12344', 'simple', 'Robot Gundam', '400.00', '[]', '2021-12-16 06:22:43', '2021-12-16 06:22:43'),
(45, 30, 4, 2, '20000.00', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '7382893-1-8', 'configurable', 'Jersey Barcelona Home - Red - L', '200.00', '{\"size\":\"L\",\"color\":\"Red\"}', '2021-12-30 14:30:51', '2021-12-30 14:30:51'),
(46, 31, 5, 1, '20000.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '7382893-1-13', 'configurable', 'Jersey Barcelona Home - Red - XL', '220.00', '{\"size\":\"XL\",\"color\":\"Red\"}', '2021-12-30 14:40:55', '2021-12-30 14:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('bb@gmail.com', '$2y$10$Xw.tonMTrjeFCKC09Lx1cexZvWmhoDC6upkpAV/49wf2jpnrgqoeq', '2021-12-11 22:42:05'),
('basrul@gmail.com', '$2y$10$ttV.sv2IqZs66LI5Ioqvv.5n1YACVnrpWFC/r93IXQz5GuuzQfo.G', '2021-12-11 22:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payloads` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payloads`)),
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biller_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `number`, `amount`, `method`, `status`, `token`, `payloads`, `payment_type`, `va_number`, `vendor_name`, `biller_code`, `bill_key`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 26, 'PAY/20211216/XII/XVI/00001', '73000.00', 'midtrans', 'deny', '9659160f-3a1f-49d8-95d1-1e722ad467bb', '{\"transaction_time\":\"2021-12-16 09:50:26\",\"transaction_status\":\"deny\",\"transaction_id\":\"9659160f-3a1f-49d8-95d1-1e722ad467bb\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"202\",\"signature_key\":\"73b26781b8acad079677854b6ecd65b4b7268b5fa6f4a3ead6ce76306c29f5e81673a633d2d4a04980a4fe6d74728a40e07aa4c80f5be22a596dd901477d64f9\",\"payment_type\":\"credit_card\",\"order_id\":\"INV/20211216/XII/XVI/00005\",\"merchant_id\":\"G219685591\",\"masked_card\":\"491111-1113\",\"gross_amount\":\"73000.00\",\"fraud_status\":\"accept\",\"eci\":\"05\",\"currency\":\"IDR\",\"channel_response_message\":\"Do not honour\",\"channel_response_code\":\"05\",\"card_type\":\"debit\",\"bank\":\"bni\"}', 'credit_card', NULL, NULL, NULL, NULL, NULL, '2021-12-16 02:57:53', '2021-12-16 02:57:53'),
(2, 26, 'PAY/20211216/XII/XVI/00002', '73000.00', 'midtrans', 'settlement', '8e7ade8a-dc2f-4a13-9e91-6aa1b1c656bd', '{\"transaction_time\":\"2021-12-16 09:52:26\",\"transaction_status\":\"settlement\",\"transaction_id\":\"8e7ade8a-dc2f-4a13-9e91-6aa1b1c656bd\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"9de0b0f61d60b68604503938d309f0f135ae392b9ac2989d74b74cc5a399466caf7e371a7be32ec41ff34eeed84f293a90ee6aea14dd819a19453bacee857782\",\"settlement_time\":\"2021-12-16 09:52:30\",\"payment_type\":\"bca_klikpay\",\"order_id\":\"INV/20211216/XII/XVI/00005\",\"merchant_id\":\"G219685591\",\"gross_amount\":\"73000.00\",\"fraud_status\":\"accept\",\"currency\":\"IDR\",\"approval_code\":\"112233\"}', 'bca_klikpay', NULL, NULL, NULL, NULL, NULL, '2021-12-16 03:02:07', '2021-12-16 03:02:07'),
(3, 27, 'PAY/20211216/XII/XVI/00003', '273000.00', 'midtrans', 'deny', 'b78742fa-7eba-498e-ab75-d59e6d260993', '{\"transaction_time\":\"2021-12-16 10:03:07\",\"transaction_status\":\"deny\",\"transaction_id\":\"b78742fa-7eba-498e-ab75-d59e6d260993\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"202\",\"signature_key\":\"03f4dec2544753aa7f33a6c6be24e4cfce6eddb4b66d4e1749d15d5a28cf2f21380a0a0a394d41883dedc48699ae814b71750a7ac13cbdb527a888e790ceccd9\",\"payment_type\":\"credit_card\",\"order_id\":\"INV/20211216/XII/XVI/00006\",\"merchant_id\":\"G219685591\",\"masked_card\":\"491111-1113\",\"gross_amount\":\"273000.00\",\"fraud_status\":\"accept\",\"eci\":\"05\",\"currency\":\"IDR\",\"channel_response_message\":\"Do not honour\",\"channel_response_code\":\"05\",\"card_type\":\"debit\",\"bank\":\"bni\"}', 'credit_card', NULL, NULL, NULL, NULL, NULL, '2021-12-16 03:03:17', '2021-12-16 03:03:17'),
(4, 27, 'PAY/20211216/XII/XVI/00004', '273000.00', 'midtrans', 'success', '7151ca0e-70b9-422a-9d6e-165098817fdc', '{\"transaction_time\":\"2021-12-16 10:04:45\",\"transaction_status\":\"capture\",\"transaction_id\":\"7151ca0e-70b9-422a-9d6e-165098817fdc\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"843295d41ca5c32abe9070023814dfd54284305a8682b4e5d80dbc1346aad136acd285e5cce6bc846fcd2b7617fb995b05e5ed6072368176499d616434d2a2de\",\"payment_type\":\"credit_card\",\"order_id\":\"INV/20211216/XII/XVI/00006\",\"merchant_id\":\"G219685591\",\"masked_card\":\"481111-1114\",\"gross_amount\":\"273000.00\",\"fraud_status\":\"accept\",\"eci\":\"05\",\"currency\":\"IDR\",\"channel_response_message\":\"Approved\",\"channel_response_code\":\"00\",\"card_type\":\"credit\",\"bank\":\"bni\",\"approval_code\":\"1639623908159\"}', 'credit_card', NULL, NULL, NULL, NULL, NULL, '2021-12-16 03:05:10', '2021-12-16 03:05:10'),
(5, 28, 'PAY/20211216/XII/XVI/00005', '84000.00', 'midtrans', 'pending', '9fbf2624-7fc9-4d08-a771-e92a240d20c9', '{\"transaction_time\":\"2021-12-16 10:05:51\",\"transaction_status\":\"pending\",\"transaction_id\":\"9fbf2624-7fc9-4d08-a771-e92a240d20c9\",\"store\":\"indomaret\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"201\",\"signature_key\":\"184f02d3945e91a24278288cd682c66aaf1fa488d161099afb6bbd17e154688d8bebffce8db3a2b216669d525e431efbae1b95d101e4fb8700c7be40314fd2f6\",\"payment_type\":\"cstore\",\"payment_code\":\"795716855817\",\"order_id\":\"INV/20211216/XII/XVI/00007\",\"merchant_id\":\"G219685591\",\"gross_amount\":\"84000.00\",\"currency\":\"IDR\"}', 'cstore', NULL, NULL, NULL, NULL, NULL, '2021-12-16 03:05:53', '2021-12-16 03:05:53'),
(6, 29, 'PAY/20211216/XII/XVI/00006', '155000.00', 'midtrans', 'deny', '919897bc-1677-483d-9548-0d1c11718169', '{\"transaction_time\":\"2021-12-16 13:25:03\",\"transaction_status\":\"deny\",\"transaction_id\":\"919897bc-1677-483d-9548-0d1c11718169\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"202\",\"signature_key\":\"04f046015ca49cf1e577797aa5139a707975c77c8d2911d163c32b75c96701c1ff5d7b802a5efe6699fb6fe3e3e2c2976d2e0a7672f2604d7c990c28f6bfdfea\",\"payment_type\":\"credit_card\",\"order_id\":\"INV/20211216/XII/XVI/00008\",\"merchant_id\":\"G219685591\",\"masked_card\":\"491111-1113\",\"gross_amount\":\"155000.00\",\"fraud_status\":\"accept\",\"eci\":\"05\",\"currency\":\"IDR\",\"channel_response_message\":\"Do not honour\",\"channel_response_code\":\"05\",\"card_type\":\"debit\",\"bank\":\"bni\"}', 'credit_card', NULL, NULL, NULL, NULL, NULL, '2021-12-16 06:25:40', '2021-12-16 06:25:40'),
(7, 29, 'PAY/20211216/XII/XVI/00007', '155000.00', 'midtrans', 'success', '23dec3f9-4fed-49ad-a957-cb33971310c9', '{\"transaction_time\":\"2021-12-16 13:26:23\",\"transaction_status\":\"capture\",\"transaction_id\":\"23dec3f9-4fed-49ad-a957-cb33971310c9\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"f5478a301eb3f1c6df07081a47cd0c5a7f02b49175763c69eeb0870a1dea06df56b9a22b869a43875fae9f3402ce7a3d056c3c84467ad439dac74c8bcb1097ca\",\"payment_type\":\"credit_card\",\"order_id\":\"INV/20211216/XII/XVI/00008\",\"merchant_id\":\"G219685591\",\"masked_card\":\"481111-1114\",\"gross_amount\":\"155000.00\",\"fraud_status\":\"accept\",\"eci\":\"05\",\"currency\":\"IDR\",\"channel_response_message\":\"Approved\",\"channel_response_code\":\"00\",\"card_type\":\"credit\",\"bank\":\"bni\",\"approval_code\":\"1639635993793\"}', 'credit_card', NULL, NULL, NULL, NULL, NULL, '2021-12-16 06:26:46', '2021-12-16 06:26:46'),
(8, 31, 'PAY/20211230/XII/XXX/00001', '38000.00', 'midtrans', 'pending', '2dc59d31-d38f-4fe3-a582-202045225442', '{\"transaction_time\":\"2021-12-30 21:41:55\",\"transaction_status\":\"pending\",\"transaction_id\":\"2dc59d31-d38f-4fe3-a582-202045225442\",\"store\":\"indomaret\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"201\",\"signature_key\":\"5d99648080c43c9d8227244c97c9cc9dc8e8c85a56303fb92aac4114f8fc4bceb09f4d450694feefc5708affd5e4d00e1453207d04504391607877906b69bbe4\",\"payment_type\":\"cstore\",\"payment_code\":\"837788778877\",\"order_id\":\"INV/20211230/XII/XXX/00002\",\"merchant_id\":\"G219685591\",\"gross_amount\":\"38000.00\",\"currency\":\"IDR\"}', 'cstore', NULL, NULL, NULL, NULL, NULL, '2021-12-30 14:42:00', '2021-12-30 14:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_products', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(2, 'add_products', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(3, 'edit_products', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(4, 'delete_products', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(5, 'view_categories', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(6, 'add_categories', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(7, 'edit_categories', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(8, 'delete_categories', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(9, 'view_attributes', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(10, 'add_attributes', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(11, 'edit_attributes', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(12, 'delete_attributes', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(13, 'view_roles', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(14, 'add_roles', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(15, 'edit_roles', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(16, 'delete_roles', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(17, 'view_users', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(18, 'add_users', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(19, 'edit_users', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(20, 'delete_users', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(21, 'view_orders', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(22, 'add_orders', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(23, 'edit_orders', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(24, 'delete_orders', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `parent_id`, `user_id`, `sku`, `type`, `name`, `slug`, `price`, `weight`, `width`, `height`, `length`, `short_description`, `description`, `status`, `created_at`, `updated_at`) VALUES
(3, NULL, 1, '7382893', 'configurable', 'Jersey Barcelona Home', 'jersey-barcelona-home', NULL, NULL, NULL, NULL, NULL, 'jersey barca Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham', 'jersey barca Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham', 1, '2021-12-01 02:01:20', '2021-12-09 07:37:00'),
(4, 3, 1, '7382893-1-8', 'simple', 'Jersey Barcelona Home - Red - L', 'jersey-barcelona-home-red-l', '20000.00', '200.00', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-01 02:01:20', '2021-12-01 02:03:36'),
(5, 3, 1, '7382893-1-13', 'simple', 'Jersey Barcelona Home - Red - XL', 'jersey-barcelona-home-red-xl', '20000.00', '220.00', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-01 02:01:20', '2021-12-01 02:03:36'),
(6, 3, 1, '7382893-2-8', 'simple', 'Jersey Barcelona Home - Yellow - L', 'jersey-barcelona-home-yellow-l', '20000.00', '200.00', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-01 02:01:20', '2021-12-01 02:03:36'),
(7, 3, 1, '7382893-2-13', 'simple', 'Jersey Barcelona Home - Yellow - XL', 'jersey-barcelona-home-yellow-xl', '20000.00', '220.00', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-01 02:01:20', '2021-12-01 02:03:36'),
(8, NULL, 2, 'sku-12344', 'simple', 'Robot Gundam', 'robot-gundam', '100000.00', '400.00', '2.00', '2.00', '10.00', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, '2021-12-01 20:45:18', '2021-12-09 07:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(9, 3, 7, NULL, NULL),
(10, 8, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_large` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `large` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `extra_large`, `large`, `medium`, `small`, `created_at`, `updated_at`) VALUES
(5, 3, 'uploads/images/original/jersey-barcelona-home_1639971827.jpg', 'uploads/images/xlarge/jersey-barcelona-home_1639971827.jpg', 'uploads/images/large/jersey-barcelona-home_1639971827.jpg', 'uploads/images/medium/jersey-barcelona-home_1639971827.jpg', 'uploads/images/small/jersey-barcelona-home_1639971827.jpg', '2021-12-20 03:43:50', '2021-12-20 03:43:50'),
(6, 3, 'uploads/images/original/jersey-barcelona-home_1639972100.png', 'uploads/images/xlarge/jersey-barcelona-home_1639972100.png', 'uploads/images/large/jersey-barcelona-home_1639972100.png', 'uploads/images/medium/jersey-barcelona-home_1639972100.png', 'uploads/images/small/jersey-barcelona-home_1639972100.png', '2021-12-20 03:48:28', '2021-12-20 03:48:28'),
(7, 3, 'uploads/images/original/jersey-barcelona-home_1639972285.jpeg', 'uploads/images/xlarge/jersey-barcelona-home_1639972285.jpeg', 'uploads/images/large/jersey-barcelona-home_1639972285.jpeg', 'uploads/images/medium/jersey-barcelona-home_1639972285.jpeg', 'uploads/images/small/jersey-barcelona-home_1639972285.jpeg', '2021-12-20 03:51:30', '2021-12-20 03:51:30'),
(8, 8, 'uploads/images/original/robot-gundam_1639972394.jpeg', 'uploads/images/xlarge/robot-gundam_1639972394.jpeg', 'uploads/images/large/robot-gundam_1639972394.jpeg', 'uploads/images/medium/robot-gundam_1639972394.jpeg', 'uploads/images/small/robot-gundam_1639972394.jpeg', '2021-12-20 03:53:22', '2021-12-20 03:53:22'),
(9, 8, 'uploads/images/original/robot-gundam_1639972452.jpeg', 'uploads/images/xlarge/robot-gundam_1639972452.jpeg', 'uploads/images/large/robot-gundam_1639972452.jpeg', 'uploads/images/medium/robot-gundam_1639972452.jpeg', 'uploads/images/small/robot-gundam_1639972452.jpeg', '2021-12-20 03:54:17', '2021-12-20 03:54:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_inventories`
--

INSERT INTO `product_inventories` (`id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 4, 194, '2021-12-01 02:03:36', '2021-12-30 14:30:51'),
(2, 5, 197, '2021-12-01 02:03:36', '2021-12-30 14:40:55'),
(3, 6, 199, '2021-12-01 02:03:36', '2021-12-15 15:45:39'),
(4, 7, 197, '2021-12-01 02:03:36', '2021-12-18 13:59:48'),
(5, 8, 188, '2021-12-01 20:46:05', '2021-12-19 04:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(2, 'Admin', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(3, 'Client', 'web', '2021-11-29 00:38:22', '2021-11-29 00:38:22'),
(4, 'Owner', 'web', '2021-12-02 03:23:55', '2021-12-02 03:23:55'),
(5, 'Gudang', 'web', '2021-12-03 02:56:38', '2021-12-03 02:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 4),
(6, 1),
(6, 2),
(6, 4),
(7, 1),
(7, 2),
(7, 4),
(8, 1),
(8, 2),
(8, 4),
(9, 1),
(9, 2),
(9, 4),
(10, 1),
(10, 2),
(10, 4),
(11, 1),
(11, 2),
(11, 4),
(12, 1),
(12, 2),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(15, 4),
(16, 1),
(16, 4),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 2),
(21, 4),
(22, 1),
(22, 2),
(22, 4),
(23, 1),
(23, 2),
(23, 4),
(24, 1),
(24, 2),
(24, 4);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `track_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_weight` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `shipped_by` bigint(20) UNSIGNED DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `user_id`, `order_id`, `track_number`, `status`, `total_qty`, `total_weight`, `first_name`, `last_name`, `address1`, `address2`, `phone`, `email`, `city_id`, `province_id`, `postcode`, `shipped_by`, `shipped_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, 'pending', 3, 840, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'superadmin@gmail.com', '51', '11', 99008, NULL, NULL, NULL, '2021-12-14 15:34:37', '2021-12-14 15:34:37'),
(2, 6, 4, NULL, 'pending', 2, 600, 'Ship satu', 'Ship last', 'Ship Address', NULL, '444555666777', 'rizkifadillah26.rf@gmail.com', '135', '5', 321232, NULL, NULL, NULL, '2021-12-15 02:04:32', '2021-12-15 02:04:32'),
(3, 6, 5, NULL, 'pending', 1, 200, 'Rizki', 'Fadillah', 'tiga putra', 'Kompleks', '7788778877', 'rizkifadillah26.rf@gmail.com', '79', '9', 99008, NULL, NULL, NULL, '2021-12-15 02:58:27', '2021-12-15 02:58:27'),
(4, 6, 6, NULL, 'pending', 1, 200, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '89', '15', 99008, NULL, NULL, NULL, '2021-12-15 03:28:01', '2021-12-15 03:28:01'),
(5, 6, 7, NULL, 'pending', 1, 400, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '126', '9', 99008, NULL, NULL, NULL, '2021-12-15 05:27:39', '2021-12-15 05:27:39'),
(6, 6, 8, NULL, 'pending', 1, 400, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '257', '16', 99008, NULL, NULL, NULL, '2021-12-15 05:37:22', '2021-12-15 05:37:22'),
(7, 6, 10, NULL, 'pending', 1, 200, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '156', '8', 99008, NULL, NULL, NULL, '2021-12-15 05:49:33', '2021-12-15 05:49:33'),
(8, 6, 11, NULL, 'pending', 1, 400, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '372', '20', 99008, NULL, NULL, NULL, '2021-12-15 05:53:39', '2021-12-15 05:53:39'),
(9, 6, 21, NULL, 'pending', 2, 600, 'Rizki', 'Fadillah', 'Depok', 'Kompleks', '7788778877', 'rizkifadillah26.rf@gmail.com', '115', '9', 99008, NULL, NULL, NULL, '2021-12-15 15:45:41', '2021-12-15 15:45:41'),
(10, 6, 22, NULL, 'pending', 2, 620, 'Rizki', 'Fadillah', 'tiga putra', 'Kompleks', '7788778877', 'rizkifadillah26.rf@gmail.com', '109', '9', 99008, NULL, NULL, NULL, '2021-12-15 23:39:56', '2021-12-15 23:39:56'),
(11, 6, 23, NULL, 'pending', 3, 820, 'shp1', 'ship2', 'address ship', NULL, '4343434343434', 'rizki@gmail.com', '154', '6', 23232, NULL, NULL, NULL, '2021-12-16 00:32:23', '2021-12-16 00:32:23'),
(12, 6, 24, NULL, 'pending', 1, 400, 'Ship1', 'Ship2', 'ship address', 'apartement ship', '2121234533', 'ship@gmail.com', '442', '8', 22333, NULL, NULL, NULL, '2021-12-16 01:03:59', '2021-12-16 01:03:59'),
(13, 6, 25, NULL, 'pending', 2, 800, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '283', '18', 99008, NULL, NULL, NULL, '2021-12-16 02:34:20', '2021-12-16 02:34:20'),
(14, 6, 26, NULL, 'pending', 1, 200, 'Ship1', 'Ship2', 'ship address', 'apartement ship', '2121234533', 'ship@gmail.com', '302', '17', 22333, NULL, NULL, NULL, '2021-12-16 02:49:54', '2021-12-16 02:49:54'),
(15, 6, 27, NULL, 'pending', 2, 800, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '341', '15', 99008, NULL, NULL, NULL, '2021-12-16 03:01:30', '2021-12-16 03:01:30'),
(16, 1, 28, NULL, 'pending', 2, 440, 'Superadmin', 'Fadillah', 'Sss', 'Sprt', '85716855817', 'superadmin@gmail.com', '175', '4', 23658, NULL, NULL, NULL, '2021-12-16 03:02:39', '2021-12-16 03:02:39'),
(17, 6, 29, '111222333444', 'shipped', 1, 400, 'Rizki', 'Fadillah', 'Depok', NULL, '7788778877', 'rizkifadillah26.rf@gmail.com', '48', '17', 99008, 1, '2021-12-18 08:43:55', NULL, '2021-12-16 06:22:45', '2021-12-18 01:43:55'),
(18, 6, 30, NULL, 'pending', 2, 400, 'Rizki', 'Fadillah', 'Depok', 'no 29', '7788778877', 'rizkifadillah26.rf@gmail.com', '28', '2', 99008, NULL, NULL, NULL, '2021-12-30 14:30:53', '2021-12-30 14:30:53'),
(19, 6, 31, NULL, 'pending', 1, 220, 'Rizki', 'Fadillah', 'Depok', 'no 29', '7788778877', 'rizkifadillah26.rf@gmail.com', '179', '11', 99008, NULL, NULL, NULL, '2021-12-30 14:40:57', '2021-12-30 14:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_large` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `small` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `user_id`, `title`, `url`, `position`, `status`, `body`, `original`, `extra_large`, `small`, `created_at`, `updated_at`) VALUES
(1, 1, 'Batik <br> Trushmi', '#', 1, 'active', 'Trushmi Batik berkualitas internasional tinggi , halus, dan lembut', 'uploads/images/original/batik-br-trushmi_1640090771.png', 'uploads/images/xlarge/batik-br-trushmi_1640090771.png', 'uploads/images/small/batik-br-trushmi_1640090771.png', '2021-12-21 12:46:14', '2021-12-21 12:46:14'),
(2, 1, 'Batik <br> Pekalongan', '#', 2, 'active', 'Batik Pekalongan Harga murah terjamin dikantong', 'uploads/images/original/batik-br-pekalongan_1640090864.jpg', 'uploads/images/xlarge/batik-br-pekalongan_1640090864.jpg', 'uploads/images/small/batik-br-pekalongan_1640090864.jpg', '2021-12-21 12:47:47', '2021-12-21 12:47:47'),
(3, 1, 'Kain Sarung Tenun Sunda', '#', 3, 'active', 'Sarung Tenun Sunda terlaris di nusantara', 'uploads/images/original/kain-sarung-tenun-sunda_1640091066.jpg', 'uploads/images/xlarge/kain-sarung-tenun-sunda_1640091066.jpg', 'uploads/images/small/kain-sarung-tenun-sunda_1640091066.jpg', '2021-12-21 12:51:14', '2021-12-21 12:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `company`, `address1`, `address2`, `province_id`, `city_id`, `postcode`, `created_at`, `updated_at`) VALUES
(1, 'Superadmin', NULL, 'superadmin@gmail.com', NULL, '2021-11-29 00:38:21', '$2y$10$daH2/c3M9iZnZKMzg/pF8eOhRWD/4WTJWz8a1e.IGEytF9q/fxdvi', 'v2p69Kmc686LGEX6OOI7oehV5Vl0P9bbXGnI1lqkf46lMFUIvBSdWWrYSLud', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-29 00:38:21', '2021-11-29 00:38:21'),
(2, 'sasa', NULL, 'sasa@gmail.com', NULL, NULL, '$2y$10$OGrvsRD5RwL3PUq/qkr3ZOc74eUNY/LCaNohPp.mMfnOdlAumu1pG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 17:47:47', '2021-12-01 17:47:47'),
(3, 'ari keriting', NULL, 'keriting@gmail.com', NULL, NULL, '$2y$10$3NAzCchnhyLgsT.61DtB3O4DKZPxvfuNesTfFan5aG6HmcoeHXepO', 'wooeWhK9KdNUcoxrgEw2eCOg55qcQc6rwe3lMP6eVRcy8Rr8qMGZ7xrxb1rF', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-02 03:43:55', '2021-12-02 03:43:55'),
(4, 'basrul', NULL, 'basrul@gmail.com', NULL, NULL, '$2y$10$o1mQNh/x7Qa4ekTFKKt0dOsczlJ1z0cmqwhD/6RMU8c8IM8WnNX.y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-03 02:58:18', '2021-12-03 02:58:18'),
(5, 'Badrul', 'Basar', 'bb@gmail.com', NULL, NULL, '$2y$10$gWObvPfa1/3Wuv.osfrlt.KilJOTIAPOp./ru4neEilYGkd.CRjlm', 'fzQe39XK0Ig8UXSr97dTvpnUtNX2WBhUklN3nbLR9AUF4untnRu4zfebOHop', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 22:29:09', '2021-12-11 22:29:09'),
(6, 'Rizki', 'Fadillah', 'rizkifadillah26.rf@gmail.com', NULL, NULL, '$2y$10$9sTld/w8xG9naoLL3UcTWuccu5wJYKuOjoiuM7hBCeUoi1QSOdJSa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 01:25:06', '2021-12-15 01:25:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_product_values`
--
ALTER TABLE `attribute_product_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_values_product_id_foreign` (`product_id`),
  ADD KEY `attribute_product_values_attribute_id_foreign` (`attribute_id`),
  ADD KEY `attribute_product_values_parent_product_id_foreign` (`parent_product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_product_id_foreign` (`product_id`),
  ADD KEY `favorites_user_id_product_id_index` (`user_id`,`product_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_unique` (`code`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_approved_by_foreign` (`approved_by`),
  ADD KEY `orders_cancelled_by_foreign` (`cancelled_by`),
  ADD KEY `orders_code_index` (`code`),
  ADD KEY `orders_code_order_date_index` (`code`,`order_date`),
  ADD KEY `orders_payment_token_index` (`payment_token`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_sku_index` (`sku`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_number_unique` (`number`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_number_index` (`number`),
  ADD KEY `payments_method_index` (`method`),
  ADD KEY `payments_token_index` (`token`),
  ADD KEY `payments_payment_type_index` (`payment_type`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);
ALTER TABLE `products` ADD FULLTEXT KEY `search` (`name`,`slug`,`short_description`,`description`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_inventories_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_user_id_foreign` (`user_id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_shipped_by_foreign` (`shipped_by`),
  ADD KEY `shipments_track_number_index` (`track_number`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slides_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `attribute_product_values`
--
ALTER TABLE `attribute_product_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_product_values`
--
ALTER TABLE `attribute_product_values`
  ADD CONSTRAINT `attribute_product_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `attribute_product_values_parent_product_id_foreign` FOREIGN KEY (`parent_product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `attribute_product_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `shipments_shipped_by_foreign` FOREIGN KEY (`shipped_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shipments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
