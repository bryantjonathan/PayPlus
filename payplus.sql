-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2025 pada 21.56
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payplus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `phone` bigint(15) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `dueDate` varchar(10) DEFAULT NULL,
  `category` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bill`
--

INSERT INTO `bill` (`id`, `phone`, `name`, `amount`, `dueDate`, `category`) VALUES
(1, 0, 'Token Listrik', 100000, '2025-01-02', 'Electricity'),
(2, 0, 'Kost', 550000, '2025-01-05', 'Rent'),
(3, 0, 'Indihome', 350000, '2025-01-08', 'Internet'),
(4, 6281301223169, 'Ferrari', 100000000, '2025-01-06', 'Vehicle'),
(5, 6281301223169, 'Listrik', 10000, '2025-01-02', 'Electricity');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `receiver_phone` bigint(50) NOT NULL,
  `type` enum('normal','gift') NOT NULL,
  `date` date NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `expense`
--

INSERT INTO `expense` (`id`, `amount`, `phone`, `receiver_phone`, `type`, `date`, `message`) VALUES
(1, 150000, 6281301223169, 6281301223187, 'normal', '2024-12-01', NULL),
(2, 50000, 6281301223187, 0, 'gift', '2024-12-02', 'Hadiah ulang tahun untuk Budi'),
(3, 200000, 6281301223393, 0, 'normal', '2024-12-03', NULL),
(4, 125000, 6281301223401, 0, 'normal', '2024-12-05', NULL),
(5, 300000, 6281301223412, 0, 'gift', '2024-12-06', 'Hadiah liburan untuk Faisal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `sender_phone` bigint(50) NOT NULL,
  `type` enum('normal','gift','topup') NOT NULL,
  `date` date NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `income`
--

INSERT INTO `income` (`id`, `amount`, `phone`, `sender_phone`, `type`, `date`, `message`) VALUES
(1, 250000, 6281301223169, 6281301223169, 'topup', '2024-12-01', NULL),
(2, 100000, 6281301223187, 0, 'gift', '2024-12-02', 'Hadiah ulang tahun untuk Siti'),
(3, 300000, 6281301223393, 6281301223169, 'normal', '2024-12-03', NULL),
(4, 175000, 6281301223401, 0, 'normal', '2024-12-07', NULL),
(5, 200000, 6281301223412, 0, 'gift', '2024-12-08', 'Hadiah khusus untuk Bayu'),
(6, 50000, 6281301223169, 6281301223393, 'gift', '2025-01-05', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `savings`
--

CREATE TABLE `savings` (
  `id` int(11) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `target` bigint(50) NOT NULL,
  `terkumpul` bigint(50) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `savings`
--

INSERT INTO `savings` (`id`, `phone`, `nama`, `deskripsi`, `target`, `terkumpul`) VALUES
(1, 6281301223169, 'Beli motor', 'motor baru untuk kuliah', 20000000, 100005500000),
(2, 6281301223187, 'Uang darurat', 'untuk keperluan mendadak', 10000000, 2500000),
(3, 6281301223393, 'Liburan', 'Tabungan untuk liburan ke luar negeri', 0, 1000000),
(4, 6281301223401, 'HP Samsung', 'Beli HP baru', 0, 9000000),
(5, 6281301223412, 'Motor', 'Beli motor buat orang tua', 10000000, 10000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `phone` bigint(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(250) NOT NULL,
  `balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`phone`, `name`, `email`, `password`, `role`, `balance`) VALUES
(6281301223169, 'Andre Aditya Amann', 'andre@gmail.com', '3169', 'bronze', 5300000),
(6281301223187, 'Zaidaan Afif Randih', 'zaidanrandih@gmail.com', '3187', 'gold', 100900002),
(6281301223393, 'Rafi Suwardana', 'rafisuwardana@gmail.com', '3393', 'bronze', 5000000),
(6281301223401, 'Fahri Adnan', 'fahri@gmail.com', '3401', 'silver', 7500000),
(6281301223412, 'Amelia Yusuf', 'amelia@gmail.com', '3412', 'gold', 15000000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_expense_user` (`phone`);

--
-- Indeks untuk tabel `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_income_user` (`phone`);

--
-- Indeks untuk tabel `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_savings_user` (`phone`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`phone`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `fk_expense_user` FOREIGN KEY (`phone`) REFERENCES `users` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `fk_income_user` FOREIGN KEY (`phone`) REFERENCES `users` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `savings`
--
ALTER TABLE `savings`
  ADD CONSTRAINT `fk_savings_user` FOREIGN KEY (`phone`) REFERENCES `users` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
