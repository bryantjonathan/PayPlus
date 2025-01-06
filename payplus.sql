

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

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
);

--
-- Dumping data untuk tabel `bill`
--

INSERT INTO `bill` (`id`, `phone`, `name`, `amount`, `dueDate`, `category`) VALUES
(1, 6281301220081, 'Kost', 1200000, '2025-01-04', 'Rent'),
(2, 6281301220081, 'Token Listrik', 50000, '2025-01-08', 'Electricity'),
(3, 6281301220081, 'BPJS', 350000, '2025-02-03', 'Heart'),
(4, 6281301220081, 'Motor', 5000000, '2025-01-07', 'Vehicle'),
(5, 6281301223393, 'Motor', 5000000, '2025-01-07', 'Vehicle');

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
);

--
-- Dumping data untuk tabel `expense`
--

INSERT INTO `expense` (`id`, `amount`, `phone`, `receiver_phone`, `type`, `date`, `message`) VALUES
(1, 200000, 6281301220081, 6281301223168, 'gift', '2025-01-05', 'hai andre'),
(2, 1000, 6281301223393, 6281301220081, 'gift', '2025-01-05', 'halo kamu'),
(3, 50000, 6281301223168, 6281301223393, 'gift', '2025-01-06', 'makan yaa'),
(4, 8000000, 6281301220310, 6281301220081, 'normal', '2025-01-06', NULL),
(5, 300000, 6281301220310, 6281301220081, 'gift', '2025-01-06', 'halooo'),
(6, 40000, 6281301223187, 6281301220081, 'normal', '2025-01-01', NULL);

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
);

--
-- Dumping data untuk tabel `income`
--

INSERT INTO `income` (`id`, `amount`, `phone`, `sender_phone`, `type`, `date`, `message`) VALUES
(1, 200000, 6281301223168, 6281301223187, 'gift', '2025-01-05', 'hai andre'),
(2, 1000000, 6281301220081, 6281301223187, 'topup', '2025-01-05', NULL),
(3, 6000000, 6281301223393, 6281301223393, 'topup', '2025-01-05', NULL),
(4, 4000000, 6281301223168, 6281301223168, 'topup', '2025-01-06', NULL),
(5, 300000, 6281301223393, 6281301223168, 'gift', '2025-01-06', 'Hai raffi'),
(6, 50000, 6281301223393, 6281301223168, 'gift', '2025-01-06', 'hai kamuuu'),
(7, 300000, 6281301223393, 6281301223393, 'topup', '2025-01-05', NULL),
(8, 8000000, 6281301220081, 6281301220310, 'normal', '2025-01-06', NULL),
(9, 300000, 6281301220081, 6281301220310, 'gift', '2025-01-06', 'halooo');

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
);

--
-- Dumping data untuk tabel `savings`
--

INSERT INTO `savings` (`id`, `phone`, `nama`, `deskripsi`, `target`, `terkumpul`) VALUES
(1, 6281301220081, 'motor', 'menabung untuk motor mio', 7000000, 100000),
(2, 6281301223393, 'Beli Mobil', 'menabung mobil pajero', 500000000, 4000000);

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
  `balance` bigint(50) NOT NULL
);

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`phone`, `name`, `email`, `password`, `role`, `balance`) VALUES
(6281301220081, 'Fausta Akbar', 'fausta@gmail.com', '0081', 'gold', 10300000),
(6281301220310, 'Bryant Jonathan', 'bryant@gmail.com', '0310', 'gold', 6700000),
(6281301223168, 'Andre Aditya Amann', 'andre@gmail.com', '3168', 'bronze', 5000000),
(6281301223187, 'Zaidaan Afif', 'zaidaan@gmail.com', '3187', 'bronze', 3000000),
(6281301223393, 'Rafi Suwardana', 'rafisuwardana@gmail.com', '3393', 'bronze', 8000000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone` (`phone`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `savings`
--
ALTER TABLE `savings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`phone`) REFERENCES `users` (`phone`) ON DELETE CASCADE ON UPDATE CASCADE;

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

