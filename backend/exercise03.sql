-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 06, 2024 lúc 08:27 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `exercise03`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` varchar(36) NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` varchar(36) NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `attribute_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cards`
--

CREATE TABLE `cards` (
  `id` varchar(36) NOT NULL,
  `customer_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card_items`
--

CREATE TABLE `card_items` (
  `id` varchar(36) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `card_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` varchar(36) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `category_description` text DEFAULT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `icon` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `placeholder` text DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `active`, `category_description`, `category_name`, `created_at`, `icon`, `image`, `placeholder`, `updated_at`, `created_by`, `parent_id`, `updated_by`) VALUES
('06135cab-246c-4315-bf2c-34f204e7af7d', 1, 'Sữa tắm', 'Body Wash', '2024-04-15 19:22:42.000000', 'Sữa tắm', 'Sữa tắm', 'h', '2024-04-15 19:22:42.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'd9260206-cdf6-46ad-8d0b-a82d4b6f7c69', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('0aaa0c22-e95f-4308-a383-8f5f2abcec92', 1, 'Bags', 'Bags', '2024-04-15 19:24:37.000000', 'bag.png', 'Bags', 'h', '2024-04-15 19:24:37.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('147a3736-567e-45d4-8f6d-3575b46c2a06', 1, 'Đồ trang điểm', 'Makeup Kit', '2024-04-15 19:23:08.000000', 'Đồ trang điểm', 'Đồ trang điểm', 'h', '2024-04-15 19:23:08.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'd9260206-cdf6-46ad-8d0b-a82d4b6f7c69', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('1fe8352d-1a51-43f5-9245-05761044207b', 1, 'Kính râm', 'Sungglasses', '2024-04-15 19:23:52.000000', 'Kính râm', 'Kính râm', 'h', '2024-04-15 19:23:52.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '732b1bb1-3699-468f-9467-40bccadd35d1', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('2a2b41d9-de8b-4a81-b949-d0b92655643a', 1, 'Gold Watches', 'Gold Watches', '2024-04-15 19:28:17.000000', 'Gold Watches', 'Gold Watches', 'h', '2024-04-15 19:28:17.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '34938a02-6b0d-48c6-963c-366cc71f744f', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('2e71d591-14ae-4431-89f0-aa278cf952e5', 1, 'Clothes', 'Clothes', '2024-04-15 19:12:04.000000', 'dress.png', 'clothes.png', 'h', '2024-04-15 19:12:04.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('34938a02-6b0d-48c6-963c-366cc71f744f', 1, 'Watches', 'Watches', '2024-04-15 19:27:43.000000', 'watches.png', 'Watches', 'h', '2024-04-15 19:27:43.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('485327a2-ad86-4387-bb76-6f36ad27572c', 1, 'Perfume', 'Perfume', '2024-04-15 19:18:58.000000', 'perfume.png', 'Perfume', 'h', '2024-04-15 19:18:58.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('49a1f614-55d9-4e15-81ed-b50befe66138', 1, 'Purse', 'Purse', '2024-04-15 19:26:06.000000', 'Purse', 'Purse', 'h', '2024-04-15 19:26:06.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '0aaa0c22-e95f-4308-a383-8f5f2abcec92', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('49f5196e-4ebe-447c-8d90-4f1faf864799', 1, 'Nước hoa cho áo khoác', 'Jacket Perfume', '2024-04-15 19:20:19.000000', 'Nước hoa cho áo khoác', 'Nước hoa cho áo khoác', 'h', '2024-04-15 19:20:19.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '485327a2-ad86-4387-bb76-6f36ad27572c', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('4d584554-5370-4cc8-bfda-978377093511', 1, 'Vòng cổ', 'Necklace', '2024-04-15 19:18:38.000000', 'Vòng cổ', 'Vòng cổ', 'h', '2024-04-15 19:18:38.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '82fe94cf-96e5-4a69-9cb4-fcdb349531b5', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('4f3cb7cd-721c-4327-89a1-5e923981bbc7', 1, 'Party Wear', 'Party Wear', '2024-04-15 19:16:37.000000', 'Party Wear', 'Party Wear', 'h', '2024-04-15 19:16:37.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '7ddc259c-0af3-4af8-879e-af431db268a6', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('4fcb75b6-a0c1-45c4-aff8-2e8202781930', 1, 'Váy & Áo dài', 'Dress & Frock', '2024-04-15 19:14:27.000000', 'Váy và Áo dài', 'Váy và Áo dài', 'h', '2024-04-15 19:14:27.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '2e71d591-14ae-4431-89f0-aa278cf952e5', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('593af721-37fc-47ee-80c5-a41390f97af3', 1, 'Đồ thể dục', 'Sports', '2024-04-15 19:15:19.000000', 'Đồ thể dục', 'Đồ thể dục', 'h', '2024-04-15 19:15:19.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '7ddc259c-0af3-4af8-879e-af431db268a6', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('5c884c3d-87e0-4e9c-b04a-4eaeaa15d03d', 1, 'Túi mua sắm', 'Shopping Bag', '2024-04-15 19:25:09.000000', 'Túi mua sắm', 'Túi mua sắm', 'h', '2024-04-15 19:25:09.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '0aaa0c22-e95f-4308-a383-8f5f2abcec92', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('6c3c4c51-ccdc-4440-af62-83b789593c0e', 1, 'Hat', 'Hat', '2024-04-15 19:28:36.000000', 'hat.png', 'hat.png', 'h', '2024-04-15 19:28:36.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('732b1bb1-3699-468f-9467-40bccadd35d1', 1, 'Glasses', 'Glasses', '2024-04-15 19:23:23.000000', 'glasses.png', 'Glasses', 'h', '2024-04-15 19:23:23.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('77d0d967-e155-4610-9cd3-d386f8ac6980', 1, 'Đồ chính hãng', 'Formal', '2024-04-15 19:15:46.000000', 'Đồ chính hãng', 'Đồ chính hãng', 'h', '2024-04-15 19:15:46.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '7ddc259c-0af3-4af8-879e-af431db268a6', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('7d99ea9e-3301-44c6-8f3b-2bda6e42d7b5', 1, 'Đồ bình thường', 'Casual', '2024-04-15 19:16:11.000000', 'Đồ bình thường', 'Đồ bình thường', 'h', '2024-04-15 19:16:11.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '7ddc259c-0af3-4af8-879e-af431db268a6', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('7ddc259c-0af3-4af8-879e-af431db268a6', 1, 'Footwear', 'Footwear', '2024-04-15 19:14:48.000000', 'shoes.png', 'Footwear', 'h', '2024-04-15 19:14:48.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('82fe94cf-96e5-4a69-9cb4-fcdb349531b5', 1, 'Jewelry', 'Jewelry', '2024-04-15 19:16:55.000000', 'jewelry.png', 'Jewelry', 'h', '2024-04-15 19:16:55.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('8a39ddf8-2f5b-4d70-8728-e4a86bfc4a9f', 1, 'Áo sơ mi', 'Shirt', '2024-04-15 19:12:47.000000', 'Shirt', 'shirt.png', 'h', '2024-04-15 19:12:47.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '2e71d591-14ae-4431-89f0-aa278cf952e5', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('95740b30-78d9-48eb-8f94-6c008018b741', 1, 'Woolen Hat', 'Woolen Hat', '2024-04-15 19:29:02.000000', 'Woolen Hat', 'Woolen Hat', 'h', '2024-04-15 19:29:02.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '6c3c4c51-ccdc-4440-af62-83b789593c0e', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('987cce2c-329d-44b9-92be-6b7deea44a1d', 1, 'Kính áp tròng', 'Lenses', '2024-04-15 19:24:18.000000', 'Kính áp tròng', 'Kính áp tròng', 'h', '2024-04-15 19:24:18.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '732b1bb1-3699-468f-9467-40bccadd35d1', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('99d32c11-4615-47be-8e1c-e00da6beb8cf', 1, 'Bông tai', 'Earrings', '2024-04-15 19:17:31.000000', 'Bông tai', 'Bông tai', 'h', '2024-04-15 19:17:31.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '82fe94cf-96e5-4a69-9cb4-fcdb349531b5', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('a319caaf-0757-480b-9212-6283de10ceab', 1, 'Nước hoa quần áo', 'Clothes Perfume', '2024-04-15 19:19:26.000000', 'Nước hoa quần áo', 'Nước hoa quần áo', 'h', '2024-04-15 19:19:26.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '485327a2-ad86-4387-bb76-6f36ad27572c', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('ba04091b-fa36-4938-9e0e-f56c3d963202', 1, 'Kem chống nắng', 'Sunscreen', '2024-04-15 19:22:14.000000', 'Kem chống nắng', 'Kem chống nắng', 'h', '2024-04-15 19:22:14.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'd9260206-cdf6-46ad-8d0b-a82d4b6f7c69', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('c5876f4c-13e4-4255-881d-77959958d172', 1, 'Dầu gội đầu', 'Shampoo', '2024-04-15 19:21:44.000000', 'Dầu gội đầu', 'Dầu gội đầu', 'h', '2024-04-15 19:21:44.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'd9260206-cdf6-46ad-8d0b-a82d4b6f7c69', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('cd96c9f3-b290-47c8-8eee-e5f1e56eec80', 1, 'Khử mùi', 'Deodorant', '2024-04-15 19:19:53.000000', 'Khử mùi', 'Khử mùi', 'h', '2024-04-15 19:19:53.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '485327a2-ad86-4387-bb76-6f36ad27572c', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('cf858b46-f783-42b6-be68-e540c55820cb', 1, 'Áo khoác', 'Jacket', '2024-04-15 19:13:57.000000', 'Áo khoác', 'Áo khoác', 'h', '2024-04-15 19:13:57.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '2e71d591-14ae-4431-89f0-aa278cf952e5', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('d9260206-cdf6-46ad-8d0b-a82d4b6f7c69', 1, 'Cosmetics', 'Cosmetics', '2024-04-15 19:21:02.000000', 'cosmetics.png', 'Cosmetics', 'h', '2024-04-15 19:21:02.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('e188f6c7-f14f-4b8c-b1e0-24d7ed364672', 1, 'Ba lô thể dục', 'Gym Backpack', '2024-04-15 19:25:38.000000', 'Ba lô thể dục', 'Ba lô thể dục', 'h', '2024-04-15 19:25:38.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '0aaa0c22-e95f-4308-a383-8f5f2abcec92', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('ea04070e-d4ee-4383-b5aa-799cc8274184', 1, 'Men\'s belts', 'Men\'s belts', '2024-04-15 19:27:21.000000', 'Men\'s belts', 'Men\'s belts', 'h', '2024-04-15 19:27:21.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'f30cabf8-fb7e-408d-99d2-fccda89a6569', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('ec8022aa-391b-47bd-beae-96e562ad5458', 1, 'Nước hoa cho áo dài', 'Dress & Frock Perfume', '2024-04-15 19:20:44.000000', 'Nước hoa cho áo dài', 'Nước hoa cho áo dài', 'h', '2024-04-15 19:20:44.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '485327a2-ad86-4387-bb76-6f36ad27572c', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('ee59ef33-a76c-4d54-bdf4-7adb321bf5cb', 1, 'Nhẫn đôi', 'Couple Rings', '2024-04-15 19:18:02.000000', 'Nhẫn đôi', 'Nhẫn đôi', 'h', '2024-04-15 19:18:02.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '82fe94cf-96e5-4a69-9cb4-fcdb349531b5', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('f30cabf8-fb7e-408d-99d2-fccda89a6569', 1, 'Belt', 'Belt', '2024-04-15 19:26:51.000000', 'belt.png', 'Belt', 'h', '2024-04-15 19:26:51.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', NULL, 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('f37c3bf2-ff5b-40ca-965c-43d02a804f04', 1, 'Quần short & Quần jean', 'Shorts & Jeans', '2024-04-15 19:13:24.000000', 'short', 'short.png', 'h', '2024-04-15 19:13:24.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '2e71d591-14ae-4431-89f0-aa278cf952e5', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('f8c0e634-2295-4796-8fe5-d2d09a60e563', 1, 'Wallet', 'Wallet', '2024-04-15 19:26:34.000000', 'Wallet', 'Wallet', 'h', '2024-04-15 19:26:34.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '0aaa0c22-e95f-4308-a383-8f5f2abcec92', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `iso` varchar(2) NOT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `num_code` smallint(6) DEFAULT NULL,
  `phone_code` int(11) NOT NULL,
  `upper_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` varchar(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `coupon_description` text DEFAULT NULL,
  `coupon_end_date` datetime(6) NOT NULL,
  `coupon_start_date` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  `discount_value` decimal(38,2) DEFAULT NULL,
  `max_usage` decimal(38,2) DEFAULT NULL,
  `order_amount_limit` decimal(38,2) DEFAULT NULL,
  `times_used` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` varchar(36) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `email` text DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password_hash` text DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `registered_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` varchar(36) NOT NULL,
  `address_line1` text NOT NULL,
  `address_line2` text DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `dial_code` varchar(100) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `customer_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `galleries`
--

CREATE TABLE `galleries` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `image_path` text NOT NULL,
  `is_thumbnail` tinyint(1) DEFAULT 0,
  `placeholder` text NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL,
  `related_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `galleries`
--

INSERT INTO `galleries` (`id`, `created_at`, `image_path`, `is_thumbnail`, `placeholder`, `updated_at`, `created_by`, `product_id`, `updated_by`, `related_image`) VALUES
('0dc81e15-b4ae-4577-b0f3-b77c1169e418', '2024-04-28 20:42:26.000000', '1714311746996-filename.jpg', 0, '1714311746997-3-3.jpg', '2024-04-28 20:42:26.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '3f31a960-7a13-4b4f-89d6-7fad8072200e', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311746997-3-3.jpg'),
('13efa6ab-f362-4922-b00c-daec339490ee', '2024-04-28 20:48:42.000000', '1714312122956-filename.jpg', 0, '1714312122963-party-wear-2.jpg', '2024-04-28 20:48:42.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'b19d7e64-b4c9-4b87-9872-057a99694020', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312122963-party-wear-2.jpg'),
('27f38f85-f0cb-4d9a-9b40-c8f824beb261', '2024-04-28 20:45:29.000000', '1714311929141-filename.jpg', 0, '1714311929141-shoe-2_1.jpg', '2024-04-28 20:45:29.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '7066db2b-82a7-4791-a7db-38f6cb3bf24d', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311929141-shoe-2_1.jpg'),
('3908f1c3-011f-4be0-9130-d90e06ddc3e6', '2024-04-28 20:44:21.000000', '1714311861977-filename.jpg', 0, '1714311861978-belt-1.jpg', '2024-04-28 20:44:21.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'dcfc6f9f-9970-4885-8954-a928c620318e', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311861978-belt-1.jpg'),
('3c045114-44e9-4c7e-9f42-9d0646096ff7', '2024-04-28 20:45:54.000000', '1714311954296-filename.jpg', 0, '1714311954297-shoe-3-3.jpg', '2024-04-28 20:45:54.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'f6247464-adf1-4f2d-b0de-3c102caf3b74', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311954297-shoe-3-3.jpg'),
('3d7071f7-7a55-41f8-b4b4-4227eb5905b0', '2024-04-28 20:44:54.000000', '1714311894210-filename.jpg', 0, '1714311894210-jewellery-3-3.jpg', '2024-04-28 20:44:54.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c3de056d-6ba7-4cde-940e-dc6c3f309f6e', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311894210-jewellery-3-3.jpg'),
('4602a310-f245-4c7b-a93c-7ac29ea0b757', '2024-04-28 20:48:57.000000', '1714312137281-filename.jpg', 0, '1714312137282-sports-4.jpg', '2024-04-28 20:48:57.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'ff798c82-b8bf-42c1-b619-ca4373904184', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312137282-sports-4.jpg'),
('5446d4b9-4740-4843-af3c-d7590fc3829f', '2024-04-28 20:50:44.000000', '1714312244063-filename.jpg', 0, '1714312244063-jacket-6.jpg', '2024-04-28 20:50:44.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'b820221c-1a0a-4de5-a120-922dedbada97', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312244063-jacket-6.jpg'),
('55de21b0-1272-4ab9-980a-12caad455779', '2024-04-28 20:50:34.000000', '1714312234356-filename.jpg', 0, '1714312234357-jacket-2.jpg', '2024-04-28 20:50:34.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '209a87a1-da83-43a7-a524-d9cbf0eb58bd', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312234357-jacket-2.jpg'),
('57d49806-fed9-4fd0-8598-15418071afc6', '2024-04-28 20:42:43.000000', '1714311763657-filename.jpg', 0, '1714311763658-2-2.jpg', '2024-04-28 20:42:43.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '5abef3a8-2cd0-4400-8f8f-547a1c7cda00', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311763658-2-2.jpg'),
('5de5aee8-6509-4648-b4cb-0b3622ad4d33', '2024-04-28 20:44:07.000000', '1714311847402-filename.jpg', 0, '1714311847403-jewellery-2-2.jpg', '2024-04-28 20:44:07.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '39cbd498-cf06-41a0-a0b0-791a7d4cec0a', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311847403-jewellery-2-2.jpg'),
('5e4f2b90-8ccf-4abe-9e08-8bf31e8a1d27', '2024-04-28 20:50:55.000000', '1714312255770-filename.jpg', 0, '1714312255771-shirt-2.jpg', '2024-04-28 20:50:55.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '918b0bd2-60b5-49c9-8c73-b0308833686d', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312255771-shirt-2.jpg'),
('6a087a74-d67f-4ed2-bb3c-e58b250173c6', '2024-04-28 20:42:56.000000', '1714311776012-filename.jpg', 0, '1714311776012-1-1.jpg', '2024-04-28 20:42:56.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'a8e79940-e51b-47b8-9379-ae808e205bde', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311776012-1-1.jpg'),
('862486a7-8615-49c7-be1f-4573aeab07d3', '2024-04-28 20:50:12.000000', '1714312212601-filename.jpg', 0, '1714312212601-shorts-2.jpg', '2024-04-28 20:50:12.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '7fac29a5-efc8-430f-8384-c57cdbddc6a1', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312212601-shorts-2.jpg'),
('890dbb7a-c7f1-4b5f-a066-e40409a869a0', '2024-04-28 20:50:24.000000', '1714312224137-filename.jpg', 0, '1714312224138-jacket-3-3.jpg', '2024-04-28 20:50:24.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '3bd128c3-d5df-40ba-844e-2fe2a6ffc853', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312224138-jacket-3-3.jpg'),
('8d26a634-00af-4e1c-8c88-cf4f13f3fd64', '2024-04-28 20:46:13.000000', '1714311973357-filename.jpg', 0, '1714311973358-sports-6-6.jpg', '2024-04-28 20:46:13.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '2d414a3b-b489-4ac6-bc67-4beed1f5a198', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311973358-sports-6-6.jpg'),
('8fd26611-228a-43c9-a104-404a077498af', '2024-04-28 20:51:18.000000', '1714312278824-filename.jpg', 0, '1714312278825-clothes-2-2.jpg', '2024-04-28 20:51:18.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '7f1f0ff4-2c38-4737-8cee-1d5771c8c8d6', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312278825-clothes-2-2.jpg'),
('9f330cd8-d418-4a9d-ba97-2a8628ad158c', '2024-04-28 20:43:22.000000', '1714311802275-filename.jpg', 0, '1714311802276-shampoo-1.jpg', '2024-04-28 20:43:22.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '6aa11fbf-3399-496a-949d-994624db1267', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311802276-shampoo-1.jpg'),
('b7e945e1-e1a2-4fec-85fd-09742d78c9e2', '2024-04-28 20:51:28.000000', '1714312288049-filename.jpg', 0, '1714312288050-clothes-1-1.jpg', '2024-04-28 20:51:28.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '713e5905-03f0-46e0-a596-4ecdbbb5f24a', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312288050-clothes-1-1.jpg'),
('bc965b77-c8ef-42d3-87d0-9ba928f60aaf', '2024-04-28 20:45:08.000000', '1714311908754-filename.jpg', 0, '1714311908755-watch-4.jpg', '2024-04-28 20:45:08.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1fbf8ff3-c92f-4d63-9a7b-5a096f84e007', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311908755-watch-4.jpg'),
('c2f3b821-28db-4114-aef6-b1b47198a963', '2024-04-28 20:45:41.000000', '1714311941004-filename.jpg', 0, '1714311941005-shoe-1_1.jpg', '2024-04-28 20:45:41.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'e512c59c-0c18-4096-af40-001094a7e842', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311941005-shoe-1_1.jpg'),
('c37b7c7a-ff76-49ad-9b85-1535b3908c7f', '2024-04-28 20:43:09.000000', '1714311789259-filename.jpg', 0, '1714311789260-jewellery-1-1.jpg', '2024-04-28 20:43:09.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '4767fbd1-7317-4707-b531-6d927f22347c', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311789260-jewellery-1-1.jpg'),
('ccec37f9-a0ef-4fb8-93b0-995d14d11bb2', '2024-04-28 20:43:48.000000', '1714311828463-filename.jpg', 0, '1714311828464-watch-2.jpg', '2024-04-28 20:43:48.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'fdcaeb34-8262-4e91-9e71-535dcbce66ad', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311828464-watch-2.jpg'),
('d0d855e3-3bf9-4fe4-8664-5d6cbb80c295', '2024-04-28 20:44:40.000000', '1714311880831-filename.jpg', 0, '1714311880832-perfume-1.jpg', '2024-04-28 20:44:40.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '6affef12-9efb-4b58-9046-8417ec43e1dd', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714311880832-perfume-1.jpg'),
('d935de75-d224-4be7-bfee-5e8ef545bc45', '2024-05-01 16:29:58.000000', '1714555798957-filename.jpg', 0, '1714555798958-filename.jpg', '2024-05-01 16:29:58.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'da59dc1e-386f-427e-9569-f5e6460806aa', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714555798958-filename.jpg'),
('dc966af3-208f-4145-aa44-1ae8b194ded0', '2024-04-28 20:47:01.000000', '1714312021605-filename.jpg', 0, '1714312021606-sports-3-3.jpg', '2024-04-28 20:47:01.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '5b033be2-2748-4a4d-a060-66d7f613430f', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312021606-sports-3-3.jpg'),
('fc765d0e-1f21-47f2-9b4f-5422e23813eb', '2024-04-28 20:51:07.000000', '1714312267242-filename.jpg', 0, '1714312267242-clothes-4.jpg', '2024-04-28 20:51:07.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '3d59ef83-bfd6-410f-8af4-6488cc636fe5', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312267242-clothes-4.jpg'),
('fc9d5264-e76c-4b51-8641-a2ee90d3a3bd', '2024-04-28 20:49:29.000000', '1714312169108-filename.jpg', 0, '1714312169109-sports-1-1.jpg', '2024-04-28 20:49:29.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'ecda24c7-2747-4cc5-a67b-44a69aefdd5d', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', '1714312169109-sports-1-1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(36) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `notification_expiry_date` date DEFAULT curdate(),
  `receive_time` datetime(6) NOT NULL,
  `seen` bit(1) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `account_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_approved_at` datetime(6) NOT NULL,
  `order_delivered_carrier_date` datetime(6) NOT NULL,
  `order_delivered_customer_date` datetime(6) NOT NULL,
  `coupon_id` varchar(36) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `order_status_id` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` varchar(36) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `order_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `shipping_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` varchar(36) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `privacy` varchar(50) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` varchar(36) NOT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL,
  `compare_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `disable_out_of_stock` bit(1) NOT NULL,
  `note` text DEFAULT NULL,
  `product_description` text NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(64) DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `short_description` varchar(165) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `slug` text NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `buying_price`, `compare_price`, `created_at`, `disable_out_of_stock`, `note`, `product_description`, `product_name`, `product_type`, `published`, `quantity`, `sale_price`, `short_description`, `sku`, `slug`, `updated_at`, `created_by`, `updated_by`) VALUES
('1fbf8ff3-c92f-4d63-9a7b-5a096f84e007', 20.00, 50.00, '2024-04-15 19:34:41.000000', b'0', 'Pocket Watch Leather Pouch', 'Pocket Watch Leather Pouch', 'Pocket Watch Leather Pouch', 'sale', b'1', 100, 34.00, 'Pocket Watch Leather Pouch', 'PWLP-001', 'pocket-watch-leather-pouch', '2024-04-28 20:45:08.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('209a87a1-da83-43a7-a524-d9cbf0eb58bd', 18.00, 32.00, '2024-04-15 19:32:46.000000', b'0', 'Mens Winter Leathers Jackets', 'Mens Winter Leathers Jackets', 'Mens Winter Leathers Jackets', 'null', b'1', 100, 20.00, 'Mens Winter Leathers Jackets', 'MWLJ', 'mens-winter-leathers-jackets', '2024-04-28 20:50:34.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('2d414a3b-b489-4ac6-bc67-4beed1f5a198', 50.00, 55.00, '2024-04-15 19:34:01.000000', b'0', 'Air Trekking Shoes - white', 'Air Trekking Shoes - white', 'Air Trekking Shoes - white', 'null', b'1', 100, 52.00, 'Air Trekking Shoes - white', 'ATS-WHT-001', 'air-trekking-shoes-white', '2024-04-28 20:46:13.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('39cbd498-cf06-41a0-a0b0-791a7d4cec0a', 45.00, 65.00, '2024-04-15 19:35:22.000000', b'0', 'platinum Zircon Classic Ring', 'platinum Zircon Classic Ring', 'platinum Zircon Classic Ring', 'null', b'1', 100, 62.00, 'platinum Zircon Classic Ring', 'PZCR-001', 'platinum-zircon-classic-ring', '2024-04-28 20:44:07.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('3bd128c3-d5df-40ba-844e-2fe2a6ffc853', 40.00, 50.00, '2024-04-15 19:32:58.000000', b'0', 'Mens Winter Leathers Jackets Gray', 'Mens Winter Leathers Jackets Gray', 'Mens Winter Leathers Jackets Gray', '15%', b'1', 100, 25.00, 'Mens Winter Leathers Jackets Gray', 'MWLJG', 'mens-winter-leathers-jackets-gray', '2024-04-28 20:50:24.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('3d59ef83-bfd6-410f-8af4-6488cc636fe5', 60.00, 76.00, '2024-04-15 19:32:10.000000', b'0', 'Black Floral Wrap Midi Skirt', 'Black Floral Wrap Midi Skirt', 'Black Floral Wrap Midi Skirt', 'new', b'1', 100, 25.00, 'Black Floral Wrap Midi Skirt', 'BFWMS', 'black-floral-wrap-midi-skirt', '2024-04-28 20:51:07.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('3f31a960-7a13-4b4f-89d6-7fad8072200e', 10.00, 34.00, '2024-04-15 19:36:29.000000', b'0', 'girls t-shirt', 'girls t-shirt', 'girls t-shirt', 'null', b'1', 100, 12.00, 'girls t-shirt', 'GTS-001', 'girls-t-shirt', '2024-04-28 20:42:26.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('4767fbd1-7317-4707-b531-6d927f22347c', 1800.00, 2000.00, '2024-04-15 19:35:50.000000', b'0', 'Rose Gold diamonds Earring', 'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor dolor sit amet consectetur Lorem ipsum dolor', 'Rose Gold diamonds Earring', 'null', b'1', 100, 1990.00, 'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor dolor sit amet consectetur Lorem ipsum dolor', 'RGDE-001', 'rose-gold-diamonds-earring', '2024-04-28 20:43:09.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('5abef3a8-2cd0-4400-8f8f-547a1c7cda00', 50.00, 190.00, '2024-04-15 19:36:18.000000', b'0', 'men\'s hoodies t-shirt', 'men\'s hoodies t-shirt', 'men\'s hoodies t-shirt', 'null', b'1', 100, 78.00, 'men\'s hoodies t-shirt', 'MHTS-001', 'mens-hoodies-t-shirt', '2024-04-28 20:42:43.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('5b033be2-2748-4a4d-a060-66d7f613430f', 50.00, 65.00, '2024-04-15 19:33:49.000000', b'0', 'Sports Claw Women\'s Shoes', 'Sports Claw Women\'s Shoes', 'Sports Claw Women\'s Shoes', 'null', b'1', 100, 54.00, 'Sports Claw Women\'s Shoes', 'SCWS', 'sports-claw-womens-shoes', '2024-04-28 20:47:01.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('6aa11fbf-3399-496a-949d-994624db1267', 100.00, 200.00, '2024-04-15 19:35:41.000000', b'0', 'shampoo, conditioner &amp; facewash packs', 'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor dolor sit amet consectetur Lorem ipsum dolor', 'shampoo, conditioner &amp; facewash packs', 'null', b'1', 100, 150.00, 'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor dolor sit amet consectetur Lorem ipsum dolor', 'SCFP-001', 'shampoo-conditioner-facewash-packs', '2024-04-28 20:43:22.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('6affef12-9efb-4b58-9046-8417ec43e1dd', 20.00, 84.00, '2024-04-15 19:35:02.000000', b'0', 'Titan 100 Ml Womens Perfume', 'Titan 100 Ml Womens Perfume', 'Titan 100 Ml Womens Perfume', 'null', b'1', 100, 30.00, 'Titan 100 Ml Womens Perfume', 'TPW-100-001', 'titan-100ml-womens-perfume', '2024-04-28 20:44:40.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('7066db2b-82a7-4791-a7db-38f6cb3bf24d', 67.00, 80.00, '2024-04-15 19:34:32.000000', b'0', 'Casual Men\'s Brown shoes', 'Casual Men\'s Brown shoes', 'Casual Men\'s Brown shoes', 'null', b'1', 100, 75.00, 'Casual Men\'s Brown shoes', 'CMS-BRN-001', 'casual-mens-brown-shoes', '2024-04-28 20:45:29.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('713e5905-03f0-46e0-a596-4ecdbbb5f24a', 35.00, 45.00, '2024-04-15 19:31:48.000000', b'0', 'Relaxed Short full Sleeve T-Shirt', 'Relaxed Short full Sleeve T-Shirt', 'Relaxed Short full Sleeve T-Shirt', 'null', b'1', 100, 12.00, 'Relaxed Short full Sleeve T-Shirt', 'RSFST', 'relaxed-short-full-sleeve-t-shirt', '2024-04-28 20:51:28.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('7f1f0ff4-2c38-4737-8cee-1d5771c8c8d6', 45.00, 61.00, '2024-04-15 19:31:59.000000', b'0', 'Girls pnk Embro design Top', 'Girls pnk Embro design Top', 'Girls pnk Embro design Top', 'null', b'1', 100, 9.00, 'Girls pnk Embro design Top', 'GPEdT', 'girls-pnk-embro-design-top', '2024-04-28 20:51:18.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('7fac29a5-efc8-430f-8384-c57cdbddc6a1', 15.00, 20.00, '2024-04-15 19:33:09.000000', b'0', 'Better Basics French Terry Sweatshorts', 'Better Basics French Terry Sweatshorts', 'Better Basics French Terry Sweatshorts', 'sale', b'1', 100, 10.00, 'Better Basics French Terry Sweatshorts', 'BBFTS', 'better-basics-french-terry-sweatshorts', '2024-04-28 20:50:12.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('918b0bd2-60b5-49c9-8c73-b0308833686d', 49.00, 68.00, '2024-04-15 19:32:22.000000', b'0', 'Pure Garment Dyed Cotton Shirt', 'Pure Garment Dyed Cotton Shirt', 'Pure Garment Dyed Cotton Shirt', 'sale', b'1', 100, 31.00, 'Pure Garment Dyed Cotton Shirt', 'PGDCS', 'pure-garment-dyed-cotton-shirt', '2024-04-28 20:50:55.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('a8e79940-e51b-47b8-9379-ae808e205bde', 30.00, 67.00, '2024-04-15 19:36:01.000000', b'0', 'baby fabric shoes', 'baby fabric shoes', 'baby fabric shoes', 'null', b'1', 100, 45.00, 'baby fabric shoes', 'BFS-001', 'baby-fabric-shoes', '2024-04-28 20:42:55.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('b19d7e64-b4c9-4b87-9872-057a99694020', 80.00, 94.00, '2024-04-15 19:33:39.000000', b'0', 'Womens Party Wear Shoes', 'Womens Party Wear Shoes', 'Womens Party Wear Shoes', 'sale', b'1', 100, 42.00, 'Womens Party Wear Shoes', 'WPWS', 'womens-party-wear-shoes', '2024-04-28 20:48:42.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('b820221c-1a0a-4de5-a120-922dedbada97', 50.00, 61.00, '2024-04-15 19:32:34.000000', b'0', 'MEN Yarn Fleece Full-Zip Jacket', 'MEN Yarn Fleece Full-Zip Jacket', 'MEN Yarn Fleece Full-Zip Jacket', 'null', b'1', 100, 11.00, 'MEN Yarn Fleece Full-Zip Jacket', 'MYFFJ', 'men-yarn-fleece-full-zip-jacket', '2024-04-28 20:50:44.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('c3de056d-6ba7-4cde-940e-dc6c3f309f6e', 20.00, 84.00, '2024-04-15 19:34:53.000000', b'0', 'Silver Deer Heart Necklace', 'Silver Deer Heart Necklace', 'Silver Deer Heart Necklace', 'null', b'1', 100, 30.00, 'Silver Deer Heart Necklace', 'SDHN-001', 'silver-deer-heart-necklace', '2024-04-28 20:44:54.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('da59dc1e-386f-427e-9569-f5e6460806aa', 32.00, 68.00, '2024-04-15 19:36:39.000000', b'0', 'woolen hat for men', 'woolen hat for men', 'woolen hat for men', 'null', b'1', 100, 40.00, 'woolen hat for men', 'WHM-001', 'woolen-hat-for-men', '2024-05-01 16:29:58.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('dcfc6f9f-9970-4885-8954-a928c620318e', 5.00, 24.00, '2024-04-15 19:35:12.000000', b'0', 'Men\'s Leather Reversible Belt', 'Men\'s Leather Reversible Belt', 'Men\'s Leather Reversible Belt', 'null', b'1', 100, 10.00, 'Men\'s Leather Reversible Belt', 'MLRB-001', 'mens-leather-reversible-belt', '2024-04-28 20:44:21.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('e512c59c-0c18-4096-af40-001094a7e842', 40.00, 55.00, '2024-04-15 19:34:23.000000', b'0', 'Men\'s Leather Formal Wear shoes', 'Men\'s Leather Formal Wear shoes', 'Men\'s Leather Formal Wear shoes', 'null', b'1', 100, 50.00, 'Men\'s Leather Formal Wear shoes', 'MFWL-001', 'mens-leather-formal-wear-shoes', '2024-04-28 20:45:40.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('ecda24c7-2747-4cc5-a67b-44a69aefdd5d', 34.00, 49.00, '2024-04-15 19:33:18.000000', b'0', 'Running &amp; Trekking Shoes - White', 'Running &amp; Trekking Shoes - White', 'Running &amp; Trekking Shoes - White', 'null', b'1', 100, 15.00, 'Running &amp; Trekking Shoes - White', 'RTSW', 'running-trekking-shoes-white', '2024-04-28 20:49:29.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('f6247464-adf1-4f2d-b0de-3c102caf3b74', 15.00, 30.00, '2024-04-15 19:34:13.000000', b'0', 'Boot With Suede Detail', 'Boot With Suede Detail', 'Boot With Suede Detail', 'null', b'1', 100, 20.00, 'Boot With Suede Detail', 'BSD-001', 'boot-with-suede-detail', '2024-04-28 20:45:54.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('fdcaeb34-8262-4e91-9e71-535dcbce66ad', 40.00, 78.00, '2024-04-15 19:35:31.000000', b'0', 'Smart watche Vital Plus', 'Smart watche Vital Plus', 'Smart watche Vital Plus', 'null', b'1', 100, 56.00, 'Smart watche Vital Plus', 'SWVP-001', 'smartwatch-vital-plus', '2024-04-28 20:43:48.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('ff798c82-b8bf-42c1-b619-ca4373904184', 60.00, 78.00, '2024-04-15 19:33:29.000000', b'0', 'Trekking &amp; Running Shoes - black', 'Trekking &amp; Running Shoes - black', 'Trekking &amp; Running Shoes - black', 'sale', b'1', 100, 36.00, 'Trekking &amp; Running Shoes - black', 'TRSB', 'trekking-running-shoes-black', '2024-04-28 20:48:57.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` varchar(36) NOT NULL,
  `attribute_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` varchar(36) NOT NULL,
  `attribute_value_id` varchar(36) NOT NULL,
  `product_attribute_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `id` varchar(36) NOT NULL,
  `category_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_id`, `product_id`) VALUES
('0d1164d6-4ab1-438a-9a70-349f358ce6c3', '77d0d967-e155-4610-9cd3-d386f8ac6980', '7066db2b-82a7-4791-a7db-38f6cb3bf24d'),
('0faa548e-0112-4c29-9e54-2a1db833188f', '2e71d591-14ae-4431-89f0-aa278cf952e5', '7f1f0ff4-2c38-4737-8cee-1d5771c8c8d6'),
('298d910b-48ed-4f68-94d0-b3bf4e4e424d', 'd9260206-cdf6-46ad-8d0b-a82d4b6f7c69', '6aa11fbf-3399-496a-949d-994624db1267'),
('312944c6-86d2-4147-a78b-80cc2d2b8636', '8a39ddf8-2f5b-4d70-8728-e4a86bfc4a9f', '918b0bd2-60b5-49c9-8c73-b0308833686d'),
('416e995a-97dd-4524-9f2b-d40a053fb559', '8a39ddf8-2f5b-4d70-8728-e4a86bfc4a9f', '5abef3a8-2cd0-4400-8f8f-547a1c7cda00'),
('45495ded-c395-4d58-904b-197354781779', '2a2b41d9-de8b-4a81-b949-d0b92655643a', '1fbf8ff3-c92f-4d63-9a7b-5a096f84e007'),
('49c02f70-f357-452b-92ef-5a5fb56043fb', '8a39ddf8-2f5b-4d70-8728-e4a86bfc4a9f', '3f31a960-7a13-4b4f-89d6-7fad8072200e'),
('501636ad-367c-48a8-ac5d-3f43a60a007f', '593af721-37fc-47ee-80c5-a41390f97af3', 'ff798c82-b8bf-42c1-b619-ca4373904184'),
('5aebed9f-084a-4fb2-9fcb-ae913196ba9e', '593af721-37fc-47ee-80c5-a41390f97af3', 'a8e79940-e51b-47b8-9379-ae808e205bde'),
('5b5b30aa-da10-4202-ae1d-0b96d9b7a51f', '6c3c4c51-ccdc-4440-af62-83b789593c0e', 'da59dc1e-386f-427e-9569-f5e6460806aa'),
('5fd02968-c773-41ed-92fb-2fb56e382983', 'cf858b46-f783-42b6-be68-e540c55820cb', '3bd128c3-d5df-40ba-844e-2fe2a6ffc853'),
('6edcb104-a09c-4622-93c3-b6f2b8d0a201', '2e71d591-14ae-4431-89f0-aa278cf952e5', '3d59ef83-bfd6-410f-8af4-6488cc636fe5'),
('73d62de0-2118-4411-aad4-05bd65de3da4', '82fe94cf-96e5-4a69-9cb4-fcdb349531b5', 'c3de056d-6ba7-4cde-940e-dc6c3f309f6e'),
('79b7a94b-218e-4d82-88b5-6d0f6cb594cf', '593af721-37fc-47ee-80c5-a41390f97af3', 'ecda24c7-2747-4cc5-a67b-44a69aefdd5d'),
('877bdf29-3037-4568-b4f0-63ee75c90f17', '77d0d967-e155-4610-9cd3-d386f8ac6980', 'f6247464-adf1-4f2d-b0de-3c102caf3b74'),
('8d6cc089-1716-4377-bf5b-d01f39716f48', '485327a2-ad86-4387-bb76-6f36ad27572c', '6affef12-9efb-4b58-9046-8417ec43e1dd'),
('956bcb62-bfbb-472e-876e-e8c9c68f1089', 'cf858b46-f783-42b6-be68-e540c55820cb', 'b820221c-1a0a-4de5-a120-922dedbada97'),
('b84a487f-28d1-4dc8-9e6d-a45bd817a95e', '82fe94cf-96e5-4a69-9cb4-fcdb349531b5', '39cbd498-cf06-41a0-a0b0-791a7d4cec0a'),
('b8b5a078-4775-40bd-bf13-cfbdc56b91da', '593af721-37fc-47ee-80c5-a41390f97af3', '2d414a3b-b489-4ac6-bc67-4beed1f5a198'),
('c253cdab-38c7-4c87-989e-0d8b655405c1', '2e71d591-14ae-4431-89f0-aa278cf952e5', '713e5905-03f0-46e0-a596-4ecdbbb5f24a'),
('c376dc78-5916-413c-b5ae-e22343714400', '593af721-37fc-47ee-80c5-a41390f97af3', '5b033be2-2748-4a4d-a060-66d7f613430f'),
('c4715bfc-cc20-442a-b207-c8d627ba021e', 'cf858b46-f783-42b6-be68-e540c55820cb', '209a87a1-da83-43a7-a524-d9cbf0eb58bd'),
('c932018b-6596-40bb-b7d6-2127378ffb3d', 'f30cabf8-fb7e-408d-99d2-fccda89a6569', 'dcfc6f9f-9970-4885-8954-a928c620318e'),
('cfc0999f-0455-487c-a483-8070534abe49', 'f37c3bf2-ff5b-40ca-965c-43d02a804f04', '7fac29a5-efc8-430f-8384-c57cdbddc6a1'),
('d11f0ce8-a170-4320-98b8-6e13a9c54f1e', '77d0d967-e155-4610-9cd3-d386f8ac6980', 'e512c59c-0c18-4096-af40-001094a7e842'),
('d463a88b-da48-4641-94e0-b49b32c4ebdc', '82fe94cf-96e5-4a69-9cb4-fcdb349531b5', '4767fbd1-7317-4707-b531-6d927f22347c'),
('d60c72da-8364-457b-b9a2-79bb84f69696', '34938a02-6b0d-48c6-963c-366cc71f744f', 'fdcaeb34-8262-4e91-9e71-535dcbce66ad'),
('dcc91b01-97e2-442f-86e9-13e7b2eebeac', '4f3cb7cd-721c-4327-89a1-5e923981bbc7', 'b19d7e64-b4c9-4b87-9872-057a99694020');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_coupons`
--

CREATE TABLE `product_coupons` (
  `id` varchar(36) NOT NULL,
  `coupon_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_shipping_info`
--

CREATE TABLE `product_shipping_info` (
  `id` varchar(36) NOT NULL,
  `dimension_depth` double NOT NULL,
  `dimension_height` double NOT NULL,
  `dimension_unit` varchar(10) DEFAULT NULL CHECK (`dimension_unit` in ('l','ml')),
  `dimension_width` double NOT NULL,
  `volume` double NOT NULL,
  `volume_unit` varchar(10) DEFAULT NULL CHECK (`volume_unit` in ('l','ml')),
  `weight` double NOT NULL,
  `weight_unit` varchar(10) DEFAULT NULL CHECK (`weight_unit` in ('g','kg')),
  `product_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_suppliers`
--

CREATE TABLE `product_suppliers` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `supplier_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_tags`
--

CREATE TABLE `product_tags` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `tag_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`) VALUES
('00dedb6e-7f26-4bca-a17a-021a09d7c64f', '7fac29a5-efc8-430f-8384-c57cdbddc6a1', '01796e39-105c-4ca4-b3aa-d92ef6659562'),
('1639d3ea-40f4-47fc-a0dc-9f6fd934e785', '3d59ef83-bfd6-410f-8af4-6488cc636fe5', '01796e39-105c-4ca4-b3aa-d92ef6659562'),
('25bf732e-ed0a-4c15-a158-040c9ed40d37', 'f6247464-adf1-4f2d-b0de-3c102caf3b74', '3fa68de5-8476-4759-bb2e-2dd97e701fbb'),
('2baaa3c1-8e0a-4e9e-97ba-b61378a81ba7', 'da59dc1e-386f-427e-9569-f5e6460806aa', '42795dd0-2bf0-437c-b8f5-ba0a6f20b9f4'),
('30c1e976-7e15-44c8-b2ba-beac2196dc9f', 'ff798c82-b8bf-42c1-b619-ca4373904184', '3fa68de5-8476-4759-bb2e-2dd97e701fbb'),
('31bc6fce-a8a7-4894-9022-3375fd491e13', '4767fbd1-7317-4707-b531-6d927f22347c', 'e58831bd-4d5e-46e5-bd64-23794fe240fd'),
('35b972c0-3cb2-4f91-b782-b216c96fec22', '713e5905-03f0-46e0-a596-4ecdbbb5f24a', '01796e39-105c-4ca4-b3aa-d92ef6659562'),
('388d472d-e3cb-482d-bdef-0cd0a15c5e4b', '3f31a960-7a13-4b4f-89d6-7fad8072200e', '42795dd0-2bf0-437c-b8f5-ba0a6f20b9f4'),
('3caf515b-8870-47f4-a81a-ccdb0fc858f9', '3bd128c3-d5df-40ba-844e-2fe2a6ffc853', '01796e39-105c-4ca4-b3aa-d92ef6659562'),
('3e2926e8-a0c3-4e72-a1a4-421cf1f894b5', 'e512c59c-0c18-4096-af40-001094a7e842', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('4233add6-6f1e-40ec-8e11-37a2ecc382c8', '7066db2b-82a7-4791-a7db-38f6cb3bf24d', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('4733a69a-3ecc-46d2-829f-373f4d280bc3', '918b0bd2-60b5-49c9-8c73-b0308833686d', '01796e39-105c-4ca4-b3aa-d92ef6659562'),
('4d655095-1af9-4df8-9344-60d3c254b954', '5b033be2-2748-4a4d-a060-66d7f613430f', '3fa68de5-8476-4759-bb2e-2dd97e701fbb'),
('506d36d8-ba20-41f4-b055-2a9ad6e08697', '6affef12-9efb-4b58-9046-8417ec43e1dd', 'e58831bd-4d5e-46e5-bd64-23794fe240fd'),
('516d2eac-2012-4b63-9bb6-11e58c1c4322', 'b820221c-1a0a-4de5-a120-922dedbada97', '01796e39-105c-4ca4-b3aa-d92ef6659562'),
('550036ea-c0c2-4373-8d44-d31e487b0d7a', 'fdcaeb34-8262-4e91-9e71-535dcbce66ad', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('5a292225-38aa-4e35-83d7-355e3d5c0f4f', 'b19d7e64-b4c9-4b87-9872-057a99694020', '3fa68de5-8476-4759-bb2e-2dd97e701fbb'),
('6f5e385a-2d36-40b6-924b-42d642934fe7', '3bd128c3-d5df-40ba-844e-2fe2a6ffc853', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('7e4975fc-4456-4a06-81cc-5d55453cb75c', 'c3de056d-6ba7-4cde-940e-dc6c3f309f6e', 'e58831bd-4d5e-46e5-bd64-23794fe240fd'),
('823adb22-45fe-4395-81de-6bdc4a92fade', '209a87a1-da83-43a7-a524-d9cbf0eb58bd', '01796e39-105c-4ca4-b3aa-d92ef6659562'),
('846f10d8-b868-42d7-a43c-b3a2b655784c', '1fbf8ff3-c92f-4d63-9a7b-5a096f84e007', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('879d302a-5eb3-47e3-8805-06aff047a4de', 'dcfc6f9f-9970-4885-8954-a928c620318e', 'e58831bd-4d5e-46e5-bd64-23794fe240fd'),
('8d7e47f0-24be-4519-acec-077c53679cca', '39cbd498-cf06-41a0-a0b0-791a7d4cec0a', 'e58831bd-4d5e-46e5-bd64-23794fe240fd'),
('94f6d9ab-201c-4a09-8ae0-10328f9fd7cb', '209a87a1-da83-43a7-a524-d9cbf0eb58bd', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('95365058-83e3-4409-9d26-5fdac040c01e', 'ff798c82-b8bf-42c1-b619-ca4373904184', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('9d00df66-6878-4f69-9bda-8e0c85b058a2', '3d59ef83-bfd6-410f-8af4-6488cc636fe5', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('9f7ab8c1-4c6a-49eb-ab58-099499611225', '2d414a3b-b489-4ac6-bc67-4beed1f5a198', '3fa68de5-8476-4759-bb2e-2dd97e701fbb'),
('ab49a76e-f091-4333-82f8-e99acabbb208', '1fbf8ff3-c92f-4d63-9a7b-5a096f84e007', 'e58831bd-4d5e-46e5-bd64-23794fe240fd'),
('b2885ee3-d977-4a95-8bcc-354e293cf562', 'b19d7e64-b4c9-4b87-9872-057a99694020', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('b431d8e4-1268-484b-af28-4745ae563b2d', '918b0bd2-60b5-49c9-8c73-b0308833686d', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('d1729a23-e35e-4545-844a-98b7d67ffafd', 'e512c59c-0c18-4096-af40-001094a7e842', '3fa68de5-8476-4759-bb2e-2dd97e701fbb'),
('dbf2f7a5-dd82-48e7-a96f-a9baa54e954f', '5abef3a8-2cd0-4400-8f8f-547a1c7cda00', '42795dd0-2bf0-437c-b8f5-ba0a6f20b9f4'),
('de051853-b98a-4982-955d-8757f584dd22', '7066db2b-82a7-4791-a7db-38f6cb3bf24d', '3fa68de5-8476-4759-bb2e-2dd97e701fbb'),
('df06cf0a-baa6-4b0c-8bd6-c0f20f81cd49', '7f1f0ff4-2c38-4737-8cee-1d5771c8c8d6', '01796e39-105c-4ca4-b3aa-d92ef6659562'),
('e8ca3ac5-02f1-4c40-8751-47d863c4373a', 'ecda24c7-2747-4cc5-a67b-44a69aefdd5d', '3fa68de5-8476-4759-bb2e-2dd97e701fbb'),
('f1eb4781-2372-4c4a-aaa5-cb01e316fd3a', 'fdcaeb34-8262-4e91-9e71-535dcbce66ad', 'e58831bd-4d5e-46e5-bd64-23794fe240fd'),
('f3318451-185d-427b-a2e7-4e02e8a802a1', 'a8e79940-e51b-47b8-9379-ae808e205bde', '42795dd0-2bf0-437c-b8f5-ba0a6f20b9f4'),
('f3ae8722-114d-45cf-8f93-48c5966ab07c', 'b820221c-1a0a-4de5-a120-922dedbada97', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('f5f2613e-daf4-4f9c-97bc-87d5d2bee6d6', '6aa11fbf-3399-496a-949d-994624db1267', 'b377823e-34cc-467b-a287-5a9eb1001089'),
('fb343f2a-7ff6-4d36-a342-3fcc12be1127', '6aa11fbf-3399-496a-949d-994624db1267', 'e58831bd-4d5e-46e5-bd64-23794fe240fd'),
('fd2167b7-bf86-4a72-a9fd-39f791124ca1', '7fac29a5-efc8-430f-8384-c57cdbddc6a1', 'e09fae3f-0916-42b3-94c0-a1e9951d79a0'),
('fdfc1854-3e37-4b6b-ad80-6c40786df43c', '4767fbd1-7317-4707-b531-6d927f22347c', 'b377823e-34cc-467b-a287-5a9eb1001089');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` varchar(36) NOT NULL,
  `privileges` text DEFAULT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `privileges`, `role_name`) VALUES
('76149bb9-ffd0-485c-848e-be9ceecfe06e', 'super_admin_privilege, admin_read_privilege, admin_create_privilege, admin_update_privilege, admin_delete_privilege, staff_read_privilege, staff_create_privilege, staff_update_privilege, staff_delete_privilege', 'Store Administrator');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sells`
--

CREATE TABLE `sells` (
  `id` varchar(36) NOT NULL,
  `price` float DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `product_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT 0,
  `created_at` datetime(6) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `free_shipping` tinyint(1) DEFAULT 0,
  `icon_path` text DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `rate_type` varchar(64) DEFAULT NULL CHECK (`rate_type` = 'price'),
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_country`
--

CREATE TABLE `shipping_country` (
  `id` varchar(36) NOT NULL,
  `country_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_rates`
--

CREATE TABLE `shipping_rates` (
  `id` varchar(36) NOT NULL,
  `max_value` decimal(38,2) DEFAULT NULL,
  `min_value` decimal(38,2) NOT NULL,
  `no_max` tinyint(1) DEFAULT 1,
  `price` decimal(10,0) NOT NULL DEFAULT 0,
  `weight_unit` varchar(10) DEFAULT NULL CHECK (`weight_unit` in ('g','kg')),
  `shipping_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slideshows`
--

CREATE TABLE `slideshows` (
  `id` varchar(36) NOT NULL,
  `clicks` smallint(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `destination_url` text DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff_accounts`
--

CREATE TABLE `staff_accounts` (
  `id` varchar(36) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `password_hash` text NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `role_id` varchar(36) NOT NULL,
  `updated_by` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `staff_accounts`
--

INSERT INTO `staff_accounts` (`id`, `active`, `created_at`, `email`, `first_name`, `image`, `last_name`, `password_hash`, `phone_number`, `placeholder`, `updated_at`, `created_by`, `role_id`, `updated_by`) VALUES
('c635dc74-1dce-492e-9e59-3f1c7cfa8309', 1, '2024-04-15 19:10:33.000000', 'john.doe@example.com', 'John', 'profile_image_url', 'Doe', 'hashed_password', '123456789', 'placeholder_text', '2024-04-15 19:10:33.000000', NULL, '76149bb9-ffd0-485c-848e-be9ceecfe06e', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `id` varchar(36) NOT NULL,
  `address_line1` text NOT NULL,
  `address_line2` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `icon` text NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `updated_by` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `created_at`, `icon`, `tag_name`, `updated_at`, `created_by`, `updated_by`) VALUES
('01796e39-105c-4ca4-b3aa-d92ef6659562', '2024-04-15 19:30:16.000000', 'New Arrivals', 'New Arrivals', '2024-04-15 19:30:16.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('3fa68de5-8476-4759-bb2e-2dd97e701fbb', '2024-04-15 19:30:35.000000', 'Trending', 'Trending', '2024-04-15 19:30:35.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('42795dd0-2bf0-437c-b8f5-ba0a6f20b9f4', '2024-04-15 19:31:16.000000', 'Best Sellers', 'Best Sellers', '2024-04-15 19:31:16.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('b377823e-34cc-467b-a287-5a9eb1001089', '2024-04-15 19:30:54.000000', 'Deal Of The Day', 'Deal Of The Day', '2024-04-15 19:30:54.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('e09fae3f-0916-42b3-94c0-a1e9951d79a0', '2024-04-15 19:31:04.000000', 'New Products', 'New Products', '2024-04-15 19:31:04.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309'),
('e58831bd-4d5e-46e5-bd64-23794fe240fd', '2024-04-15 19:30:45.000000', 'Top Rated', 'Top Rated', '2024-04-15 19:30:45.000000', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309', 'c635dc74-1dce-492e-9e59-3f1c7cfa8309');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variants`
--

CREATE TABLE `variants` (
  `id` varchar(36) NOT NULL,
  `variant_option` text NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `variant_option_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_options`
--

CREATE TABLE `variant_options` (
  `id` varchar(36) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `buying_price` decimal(19,2) DEFAULT NULL,
  `compare_price` decimal(19,2) DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `sale_price` decimal(19,2) NOT NULL DEFAULT 0.00,
  `sku` varchar(255) DEFAULT NULL,
  `title` text NOT NULL,
  `image_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_values`
--

CREATE TABLE `variant_values` (
  `id` varchar(36) NOT NULL,
  `product_attribute_value_id` varchar(36) NOT NULL,
  `variant_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkagsu8uri85emo6x7lxpsvs9p` (`created_by`),
  ADD KEY `FKtgiw6t3448ahf7moes0v5jgsk` (`updated_by`);

--
-- Chỉ mục cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkaq0fvnivyrmqu857uy04xgmm` (`attribute_id`);

--
-- Chỉ mục cho bảng `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3ta7cnyyuv26sr3j2sxrr10bu` (`customer_id`);

--
-- Chỉ mục cho bảng `card_items`
--
ALTER TABLE `card_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5b0jbnfrpxa14s6p8pj4pr4p0` (`card_id`),
  ADD KEY `FKkdemwak5rm871ftwoc81834c9` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_41g4n0emuvcm3qyf1f6cn43c0` (`category_name`),
  ADD KEY `FKq8tdmuivklnln9qfhbd5t4h2i` (`created_by`),
  ADD KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`),
  ADD KEY `FK575exl9wfoqsbed5al2srh6jn` (`updated_by`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_eplt0kkm9yf2of2lnx6c1oy9b` (`code`),
  ADD KEY `FK9u002jqfpom1gxjld7jviqm21` (`created_by`),
  ADD KEY `FKeff5dawd2s1lbv8mx39e79mvv` (`updated_by`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrvr6wl9gll7u98cda18smugp4` (`customer_id`);

--
-- Chỉ mục cho bảng `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfl1clmfvrmjwr7d6ohxjnmuqt` (`created_by`),
  ADD KEY `FKn4fllmf69rio4pq2q5k4xfc9l` (`product_id`),
  ADD KEY `FKsib395t0otvfy6qf9s3bo6wxx` (`updated_by`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5dsqjxt1wpoa8icawskqijsec` (`account_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn1d1gkxckw648m2n2d5gx0yx5` (`coupon_id`),
  ADD KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`),
  ADD KEY `FKcbbqf26brulgfgvd0mf74rv4y` (`order_status_id`),
  ADD KEY `FKgclp4rs5m20onj4kjrs0kesx6` (`updated_by`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  ADD KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`),
  ADD KEY `FKkw5vysjnpidpaxnuyhswngn4w` (`shipping_id`);

--
-- Chỉ mục cho bảng `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe4b4y3muy8mopmamipe97nt5j` (`created_by`),
  ADD KEY `FKcg14f8n04d5xkfkpgnglots4n` (`updated_by`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ostq1ec3toafnjok09y9l7dox` (`slug`) USING HASH,
  ADD KEY `FKih40jfhwkc7lk0fhwlle8ev87` (`created_by`),
  ADD KEY `FK4smi13wyfknqmqchj8ivr6wxb` (`updated_by`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6ksuorb5567jpa08ihcumumy1` (`attribute_id`),
  ADD KEY `FKcex46yvx4g18b2pn09p79h1mc` (`product_id`);

--
-- Chỉ mục cho bảng `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcq2cdqxc2xn8a8ijv4ess9ifk` (`attribute_value_id`),
  ADD KEY `FKtcpenh8197oeo6a75jtbikim0` (`product_attribute_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd112rx0alycddsms029iifrih` (`category_id`),
  ADD KEY `FKlda9rad6s180ha3dl1ncsp8n7` (`product_id`);

--
-- Chỉ mục cho bảng `product_coupons`
--
ALTER TABLE `product_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm8d6v5e6fv8mjg3d0iifq6sw1` (`coupon_id`),
  ADD KEY `FKiaiu1xxcnyw38cbcx4j80psij` (`product_id`);

--
-- Chỉ mục cho bảng `product_shipping_info`
--
ALTER TABLE `product_shipping_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2661qi678nh0prih01pbo2or0` (`product_id`);

--
-- Chỉ mục cho bảng `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj4tjiwcxs97lybw5vac1sjlbp` (`product_id`),
  ADD KEY `FKmymnd7phgm081dt3iv276yl8a` (`supplier_id`);

--
-- Chỉ mục cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5rk6s19k3risy7q7wqdr41uss` (`product_id`),
  ADD KEY `FKpur2885qb9ae6fiquu77tcv1o` (`tag_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4u17xl8ugefnahmg6xa23du0b` (`product_id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKevk09xnigyo8mvtgc59l1uc3b` (`created_by`),
  ADD KEY `FKhvq9xih03y656rmfmghfxym4w` (`updated_by`);

--
-- Chỉ mục cho bảng `shipping_country`
--
ALTER TABLE `shipping_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkgsmu7q7qls6s3ijfgqm3ogrr` (`country_id`),
  ADD KEY `FKmdo3rrbfukr1g0twkfp4bd0ga` (`shipping_id`);

--
-- Chỉ mục cho bảng `shipping_rates`
--
ALTER TABLE `shipping_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKscbxvgjtniv8v877ewvt5ates` (`shipping_id`);

--
-- Chỉ mục cho bảng `slideshows`
--
ALTER TABLE `slideshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm4f4t2ur1uu0e24jklw6b7c9j` (`created_by`),
  ADD KEY `FKklo16kmuxbd5jsvv7e4r21p81` (`updated_by`);

--
-- Chỉ mục cho bảng `staff_accounts`
--
ALTER TABLE `staff_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_7fh415uxfcvf7hrv64hf8laq4` (`email`),
  ADD KEY `FK2w05mq0lpmivr2519iuiowve3` (`created_by`),
  ADD KEY `FKicmmixb56mmd16stkenpifr2q` (`role_id`),
  ADD KEY `FK8kt1rbp9uqo3us42qekqu2bwx` (`updated_by`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjcuohexsi23vnpxi0t25kvwg7` (`country_id`),
  ADD KEY `FKfiw13lay8hy782gbnxojca2b8` (`created_by`),
  ADD KEY `FKf018rv4htmcbcn4wjrpymxbme` (`updated_by`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj4ujfjyqtl6j6ltrh16llax9a` (`created_by`),
  ADD KEY `FKbfktnbyp9l27sc3ys66hc92hc` (`updated_by`);

--
-- Chỉ mục cho bảng `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK95bued017vcya4rf4s7n31ew4` (`product_id`),
  ADD KEY `FKkbk89y0ekurxw90mx7jt3hx3q` (`variant_option_id`);

--
-- Chỉ mục cho bảng `variant_options`
--
ALTER TABLE `variant_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqf4y59exjrgjqdl359joj02nv` (`image_id`),
  ADD KEY `FKp80xsi8rl51rtft29wsia24hq` (`product_id`);

--
-- Chỉ mục cho bảng `variant_values`
--
ALTER TABLE `variant_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7ypqk6dc1kdhdcwphasb0q360` (`product_attribute_value_id`),
  ADD KEY `FKqhr8f6gw7fykcrd2ijd80o5te` (`variant_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `FKkagsu8uri85emo6x7lxpsvs9p` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKtgiw6t3448ahf7moes0v5jgsk` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `FKkaq0fvnivyrmqu857uy04xgmm` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`);

--
-- Các ràng buộc cho bảng `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `FK3ta7cnyyuv26sr3j2sxrr10bu` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `card_items`
--
ALTER TABLE `card_items`
  ADD CONSTRAINT `FK5b0jbnfrpxa14s6p8pj4pr4p0` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
  ADD CONSTRAINT `FKkdemwak5rm871ftwoc81834c9` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK575exl9wfoqsbed5al2srh6jn` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKq8tdmuivklnln9qfhbd5t4h2i` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `FK9u002jqfpom1gxjld7jviqm21` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKeff5dawd2s1lbv8mx39e79mvv` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `FKrvr6wl9gll7u98cda18smugp4` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `FKfl1clmfvrmjwr7d6ohxjnmuqt` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKn4fllmf69rio4pq2q5k4xfc9l` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKsib395t0otvfy6qf9s3bo6wxx` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `FK5dsqjxt1wpoa8icawskqijsec` FOREIGN KEY (`account_id`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKcbbqf26brulgfgvd0mf74rv4y` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `FKgclp4rs5m20onj4kjrs0kesx6` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKn1d1gkxckw648m2n2d5gx0yx5` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKkw5vysjnpidpaxnuyhswngn4w` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`),
  ADD CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD CONSTRAINT `FKcg14f8n04d5xkfkpgnglots4n` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKe4b4y3muy8mopmamipe97nt5j` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK4smi13wyfknqmqchj8ivr6wxb` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKih40jfhwkc7lk0fhwlle8ev87` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `FK6ksuorb5567jpa08ihcumumy1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `FKcex46yvx4g18b2pn09p79h1mc` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `FKcq2cdqxc2xn8a8ijv4ess9ifk` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`),
  ADD CONSTRAINT `FKtcpenh8197oeo6a75jtbikim0` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`);

--
-- Các ràng buộc cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `FKd112rx0alycddsms029iifrih` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FKlda9rad6s180ha3dl1ncsp8n7` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `product_coupons`
--
ALTER TABLE `product_coupons`
  ADD CONSTRAINT `FKiaiu1xxcnyw38cbcx4j80psij` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKm8d6v5e6fv8mjg3d0iifq6sw1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Các ràng buộc cho bảng `product_shipping_info`
--
ALTER TABLE `product_shipping_info`
  ADD CONSTRAINT `FK2661qi678nh0prih01pbo2or0` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD CONSTRAINT `FKj4tjiwcxs97lybw5vac1sjlbp` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKmymnd7phgm081dt3iv276yl8a` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Các ràng buộc cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `FK5rk6s19k3risy7q7wqdr41uss` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKpur2885qb9ae6fiquu77tcv1o` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Các ràng buộc cho bảng `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `FK4u17xl8ugefnahmg6xa23du0b` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `FKevk09xnigyo8mvtgc59l1uc3b` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKhvq9xih03y656rmfmghfxym4w` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `shipping_country`
--
ALTER TABLE `shipping_country`
  ADD CONSTRAINT `FKkgsmu7q7qls6s3ijfgqm3ogrr` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `FKmdo3rrbfukr1g0twkfp4bd0ga` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`);

--
-- Các ràng buộc cho bảng `shipping_rates`
--
ALTER TABLE `shipping_rates`
  ADD CONSTRAINT `FKscbxvgjtniv8v877ewvt5ates` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`);

--
-- Các ràng buộc cho bảng `slideshows`
--
ALTER TABLE `slideshows`
  ADD CONSTRAINT `FKklo16kmuxbd5jsvv7e4r21p81` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKm4f4t2ur1uu0e24jklw6b7c9j` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `staff_accounts`
--
ALTER TABLE `staff_accounts`
  ADD CONSTRAINT `FK2w05mq0lpmivr2519iuiowve3` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FK8kt1rbp9uqo3us42qekqu2bwx` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKicmmixb56mmd16stkenpifr2q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `FKf018rv4htmcbcn4wjrpymxbme` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKfiw13lay8hy782gbnxojca2b8` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKjcuohexsi23vnpxi0t25kvwg7` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Các ràng buộc cho bảng `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `FKbfktnbyp9l27sc3ys66hc92hc` FOREIGN KEY (`updated_by`) REFERENCES `staff_accounts` (`id`),
  ADD CONSTRAINT `FKj4ujfjyqtl6j6ltrh16llax9a` FOREIGN KEY (`created_by`) REFERENCES `staff_accounts` (`id`);

--
-- Các ràng buộc cho bảng `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `FK95bued017vcya4rf4s7n31ew4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKkbk89y0ekurxw90mx7jt3hx3q` FOREIGN KEY (`variant_option_id`) REFERENCES `variant_options` (`id`);

--
-- Các ràng buộc cho bảng `variant_options`
--
ALTER TABLE `variant_options`
  ADD CONSTRAINT `FKp80xsi8rl51rtft29wsia24hq` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKqf4y59exjrgjqdl359joj02nv` FOREIGN KEY (`image_id`) REFERENCES `galleries` (`id`);

--
-- Các ràng buộc cho bảng `variant_values`
--
ALTER TABLE `variant_values`
  ADD CONSTRAINT `FK7ypqk6dc1kdhdcwphasb0q360` FOREIGN KEY (`product_attribute_value_id`) REFERENCES `product_attribute_values` (`id`),
  ADD CONSTRAINT `FKqhr8f6gw7fykcrd2ijd80o5te` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
