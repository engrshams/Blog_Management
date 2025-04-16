-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2025 at 05:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 1, 7, '2025-04-14 08:57:07', '2025-04-14 08:57:07'),
(3, 2, 6, '2025-04-14 08:57:40', '2025-04-14 08:57:40');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `parent_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 5, 1, NULL, 'Hello there', '2025-04-14 08:46:16', '2025-04-14 08:46:16'),
(2, 5, 1, NULL, 'Write me a letter.', '2025-04-14 08:46:37', '2025-04-14 08:46:37'),
(3, 5, 2, NULL, 'Ok, writing the letter for you.', '2025-04-14 08:47:19', '2025-04-14 08:47:19'),
(4, 3, 2, NULL, 'hello there', '2025-04-14 08:47:31', '2025-04-14 08:47:31'),
(5, 2, 2, NULL, 'Hi.', '2025-04-14 08:47:40', '2025-04-14 08:47:40'),
(6, 1, 2, NULL, 'Hello', '2025-04-14 08:48:19', '2025-04-14 08:48:19'),
(7, 5, 1, NULL, 'Hello there', '2025-04-14 08:55:40', '2025-04-14 08:55:40'),
(8, 7, 1, NULL, 'Hi', '2025-04-14 08:55:45', '2025-04-14 08:55:45'),
(9, 7, 1, NULL, 'Hello', '2025-04-14 08:55:52', '2025-04-14 08:55:52'),
(10, 8, 2, NULL, 'Hello', '2025-04-14 08:57:59', '2025-04-14 08:57:59'),
(11, 7, 2, NULL, 'Hello', '2025-04-14 08:58:06', '2025-04-14 08:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, 8, '2025-04-14 08:57:01', '2025-04-14 08:57:01'),
(2, 2, 8, '2025-04-14 08:57:35', '2025-04-14 08:57:35'),
(3, 2, 6, '2025-04-14 08:57:39', '2025-04-14 08:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_11_031742_create_posts_table', 1),
(5, '2025_04_14_052344_create_bookmarks_table', 1),
(6, '2025_04_14_070708_create_likes_table', 1),
(7, '2025_04_14_101333_create_tags_table', 1),
(8, '2025_04_14_101351_create_post_tag_table', 1),
(9, '2025_04_14_141058_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `user_id`, `img`, `visibility`, `created_at`, `updated_at`) VALUES
(1, 'Introduction to Laravel', 'Laravel is a powerful PHP framework for web development.', 1, 'uploads/1744562390.jpg', 'public', '2025-04-14 08:45:23', '2025-04-14 08:45:23'),
(2, 'Getting Started with Eloquent', 'Eloquent ORM simplifies database interactions in Laravel.', 2, 'uploads/1744562399.jpg', 'public', '2025-04-14 08:45:23', '2025-04-14 08:45:23'),
(3, 'Authentication in Laravel', 'Learn how to implement user authentication in Laravel applications.', 1, 'uploads/1744562405.jpg', 'public', '2025-04-14 08:45:23', '2025-04-14 08:45:23'),
(4, 'Laravel Blade Templating', 'Blade is a simple yet powerful templating engine in Laravel.', 2, 'uploads/1744562587.jpg', 'private', '2025-04-14 08:45:23', '2025-04-14 08:45:23'),
(5, 'Building RESTful APIs in Laravel', 'Create RESTful APIs with Laravel for modern web and mobile applications.', 1, 'uploads/1744562612.jpg', 'public', '2025-04-14 08:45:23', '2025-04-14 08:45:23'),
(6, 'নারীরা কবিতা লিখতে পারে না', 'যদি একবার চোখখুলে আমরা লিখিত কবিতার ইতিহাসের দিকে তাকাই, তবে দেখবো- কবিতার আসলে কোনো জনক নেই। কবিতার আছে জননী। এনহেদুয়ান্না তাঁর নাম। যিনি জন্মেছিলেন স্বয়ং যিশুখ্রিস্টের জন্মেরও আড়াই হাজার বছর আগে। তিনি একজন কবি, একজন নারী। এখন পর্যন্ত তাকেই ধরা হয় এই মহাপৃথিবীর ইতিহাসের প্রথম কবি। কিন্তু যদি আপনার মনে একজন কবির আলপনা আঁকতে বলা হয়, খুব সাধারণত আপনার কল্পনা জগতে ভেসে ওঠার কথা নয় একজন নারীর প্রতিমূর্তি। কবি শব্দটি শুনলেই আমাদের ভাবনায় যে অবয়ব এসে প্রতীয়মান হয়, তা মূলত একজন পুরুষের। এমনকি আপনার সমসাময়িক ১০ জন নারী কবি’র নাম’ও যদি আপনাকে জিজ্ঞেস করা হয়, সাধারণত আপনি চট করেই এর জবাব দিতে পারবেন না। আমিও পারবো না আসলে। কিন্তু এইযে আমি ‘নারী কবি’ শব্দ দুটি পাশাপাশি লিখলাম, পুরুষ কবির ক্ষেত্রে কখনো কী আলাদাভাবে ‘পুরুষ কবি’ লেখার প্রয়োজন পড়েছে আমাদের কোনোদিন? মনে পড়েনা। নাকি আমরা ধরেই নিয়েছি যে- ‘কবি’ শব্দটি একটা নির্দিষ্ট লিঙ্গভিত্তিক সম্পত্তি, আর নারী সে সম্পত্তির অর্বাচীন ভাগিদার! তাই কোনো কবি সামাজিক অথবা শারীরিক লিঙ্গের অবস্থান থেকে নারী হলে আমাদের এখনো কবি হিসেবে তাকে স্বীকার করার আগে স্মরণ করিয়ে দিতে হয় যে- এই কবি মূলত একজন নারী। আমরা এখনো নারীকে কবি হিসেবে দেখতে অভ্যস্ত হইনি, এই অনভ্যস্ততার দাসত্বে থাকতে থাকতে আমাদের মস্তিষ্ক নিজেই নিজের মতো করে সাজিয়ে নিয়েছে বহু মিথ। যার মধ্যে বহুল প্রচলিত একটা মিথ- “নারীরা কবিতা লিখতে পারেনা”। যেকোনো মিথের সূত্রেই লুকিয়ে থাকে ঐতিহাসিক বাস্তবতা, মিথ কেবল সেটা প্রচার ও প্রসার করার এক লোকরঞ্জনমূলক মাধ্যম মাত্র। মিথ ব্যাখ্যা করতে গিয়ে নারীরা সত্যিই কবিতা লিখতে পারে কী পারে না- এই বিতর্কে আমি যাবো না। তা হবে সরাসরি কবিতার ইতিহাসের সাথেই মুনাফিকী। আমি কেবল কিছু বাস্তবতার কথা বলতে এসেছি। বলা শেষ হলেই যেকোনো শরণার্থীর মতো রওনা করবো অজানা গন্তব্যের উদ্দেশ্যে। একবিংশ শতাব্দীর বাস্তবতায় দাঁড়িয়ে একথা অস্বীকার করার উপায় আসলে নেই যে- আরো অনেক ক্ষেত্রের মতোই নারীরা সাহিত্যে আজও পিছিয়ে আছে। ‘পিছিয়ে আছে’ কথাটার মাঝেও লুকিয়ে আছে এক ভয়াবহ পুরুষতান্ত্রিক চাতুরী। মূলত কথাটা হবে- আরো অনেক ক্ষেত্রের মতো নারীদের আজও পিছিয়ে রাখা হয়েছে সাহিত্যে। কবিতা তো কোনো আধ্যাত্মিক বিষয় নয়, ব্যক্তিগত অভিজ্ঞতা থেকে বলতে পারি- কোনো ফেরেশতা এসে নাজিলও করে দিয়ে যায়না কবিতা।', 2, 'uploads/1744642233.jpg', 'public', '2025-04-14 08:50:33', '2025-04-14 08:50:33'),
(7, 'পঞ্চগড়ে পুলিশের কনস্টেবল নিয়োগ: শতভাগ মেধাভিত্তিক হবে, সুপারিশ নয় রিটেন পরীক্ষাই নির্ধারক', 'পঞ্চগড়ে পুলিশের কনস্টেবল পদে নিয়োগ হচ্ছে। এখন ফিটনেস পরীক্ষা চলছে। এরপরে ৫০ মার্কের লিখিত পরীক্ষা হবে। সবশেষে ১৫ মার্কের ভাইভা হবে। ফিটনেস পরীক্ষায় উত্তীর্ণ হলে লিখিত এবং ভাইবার ৬৫ মার্কের উপর নির্ভর করবে তার চাকরি হবে কিনা। অর্থাৎ এখানে রিটেন পরীক্ষা সবচেয়ে গুরুত্বপূর্ণ। যে রিটেনে যত ভালো করবে তার চাকরি পাবার সম্ভাবনা ততো বেশি। গতবার প্রায় ৫০০+ পরীক্ষার্থী ফিটনেসে উত্তীর্ণ হয়ে রিটেন এবং ভাইবা দিয়েছিল। এর মধ্যে ফাইনালি ২৮ জন নিয়োগ পেয়েছিল। ভাইভাতে মোটামুটি বেসিক জ্ঞান থাকলে ১৫\'র মধ্যে ৭-৮ এমনিতেই পায়। সেখানে ভাইভাতে সুপারিশ করে ২-৪ মার্ক বাড়িয়ে কোন লাভ নেই যদি আপনি রিটেনে ভালো না করতে পারেন। যেহেতু রিটেনে ভাইবার তিনগুণ মার্কস রয়েছে তাই যদি আপনি পুলিশের কনস্টেবল হতে চান তাহলে লিখিত পরীক্ষার প্রস্তুতি ভালোভাবে নিন।', 2, 'uploads/1744642317.jpg', 'public', '2025-04-14 08:51:57', '2025-04-14 08:51:57'),
(8, 'সেরা ইফতারির জন্য স্ন্যাকস রেসিপি', 'বিগত মাসের পুরোটা সময় ছিল রমজান। রমজান মাসে হয় নানা রকমের খাবারের আয়োজন। খাবারের তালিকা ভারী খাবারের সাথে সবার বাড়িতে স্ন্যাকসের আয়োজন হয়। আমার বাংলা ব্লগের ৭০ তম প্রতিযোগিতার মূল বিষয়, ইফতারে বানানো স্ন্যাকসের রেসিপির। তাতে আমার বাংলা ব্লগের অনেক সদস্য অংশ অংশগ্রহণ করেছিলেন। তার মধ্যে থেকে বেশ কিছু তাক লাগানোর নতুন রেসিপি পেলাম যেগুলো দেখতেও যেমন হয়েছিল আশা করি খেতেও তেমন সুস্বাদু ছিল। আমার বাংলা ব্লগ এর প্রতিযোগিতা মানে এক অন্য রকমের অনুভূতি। যদিও খুব বেশি স্ন্যাকস রেসিপির আমরা পাইনি তবে যেগুলো হয়েছিল সবগুলোই দৃষ্টি নন্দন ও ইউনিক। স্ন্যাকস এর বিভিন্নতা এবং উপস্থাপনা দুটোর মধ্যেই যে ক্রিয়েটিভিটি প্রতিযোগীরা দেখিয়েছেন তাতে মুগ্ধ হয়েছি। যেকটা রেসিপি ছিলো তার মধ্যে বিজয়ী বাছতে আমাদের রীতিমতো হিমশিম খেতে হয়েছে। প্রতিটি রেসিপি ছিলো লোভনীয়। আর কথা বেশি বাড়াবো না, সোজা চলে যাবো পুরস্কার বিতরণীতে।', 1, 'uploads/1744642611.jpg', 'public', '2025-04-14 08:56:51', '2025-04-14 08:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`) VALUES
(1, 6, 1),
(2, 6, 2),
(3, 6, 3),
(4, 7, 4),
(5, 7, 5),
(6, 8, 6),
(7, 8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('by772tN3ES4aqeOTsK4ChUlKRrCGETETqEsQnqX8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMmNVVjVRMDF0enNPWEk1ZDBqM0xiVzZBaEhpMUdsc2g0QWtXMEJxNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL2Rhc2hhbGwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEwOiJMb2dnZWRVc2VyIjtpOjM7fQ==', 1744642742);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'নারি', '2025-04-14 08:50:33', '2025-04-14 08:50:33'),
(2, 'পহেলা বৈশাখ', '2025-04-14 08:50:33', '2025-04-14 08:50:33'),
(3, 'Post', '2025-04-14 08:50:33', '2025-04-14 08:50:33'),
(4, 'Police', '2025-04-14 08:51:57', '2025-04-14 08:51:57'),
(5, 'Recruitment', '2025-04-14 08:51:57', '2025-04-14 08:51:57'),
(6, 'Roja', '2025-04-14 08:56:51', '2025-04-14 08:56:51'),
(7, 'Islam', '2025-04-14 08:56:51', '2025-04-14 08:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `img`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Engr. Shams', 'engr.sams@gmail.com', '2025-04-14 08:45:23', 'password', NULL, 'PRwzGORPaS', '2025-04-14 08:45:23', '2025-04-14 08:45:23'),
(2, 'Engr. Suhaan', 'engr.shams@yahoo.com', '2025-04-14 08:45:23', 'password', NULL, 'Psdfp6tmhI', '2025-04-14 08:45:23', '2025-04-14 08:45:23'),
(3, 'Shams', 'shams@gmail.com', NULL, 'abcd', 'uploads/1744642509.jpg', NULL, '2025-04-14 08:55:09', '2025-04-14 08:55:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_user_id_foreign` (`user_id`),
  ADD KEY `bookmarks_post_id_foreign` (`post_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `likes_user_id_post_id_unique` (`user_id`,`post_id`),
  ADD KEY `likes_post_id_foreign` (`post_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_visibility_index` (`visibility`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
