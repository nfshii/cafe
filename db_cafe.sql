-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2024 at 01:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_bayar`
--

CREATE TABLE `tb_bayar` (
  `id_bayar` bigint(20) NOT NULL,
  `nominal_uang` bigint(20) NOT NULL,
  `total_bayar` bigint(20) NOT NULL,
  `waktu_bayar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_bayar`
--

INSERT INTO `tb_bayar` (`id_bayar`, `nominal_uang`, `total_bayar`, `waktu_bayar`) VALUES
(2401091155779, 70000, 70000, '2024-01-10 00:55:09'),
(2401091156197, 100000, 85000, '2024-01-10 01:36:19'),
(2401091941361, 130000, 130000, '2024-01-10 02:18:14'),
(2401100836101, 0, 0, '2024-01-11 10:10:26'),
(2401100918798, 10000, 10000, '2024-01-10 02:20:16'),
(2401102203811, 120000, 120000, '2024-01-10 15:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `tb_daftar_menu`
--

CREATE TABLE `tb_daftar_menu` (
  `id` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `nama_menu` varchar(200) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `kategori` int(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `stok` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_daftar_menu`
--

INSERT INTO `tb_daftar_menu` (`id`, `foto`, `nama_menu`, `keterangan`, `kategori`, `harga`, `stok`) VALUES
(14, '67419-1.png', 'mie Goreng belanda', 'mie dengan racikan asli import dari belanda', 16, '15000', '50'),
(22, '68534-3.png', ' Gulai sapi', 'asam manis', 16, '25', '50'),
(23, '74537-4.png', 'Es Campoer&#039; goela aren', 'es khas medan', 19, '13000', '20'),
(24, '71981-12.png', 'mangga&#039;juice', 'mangga segar diambil langsung dari perkebunan ', 21, '15000', '20'),
(25, '76473-9.png', 'chotoo Lamd', 'soto khass lamongan', 16, '22000', '25'),
(26, '47317-5.png', 'kuwut Ice&#039;', 'asli dari bali ', 19, '17000', '10'),
(27, '19099-8.png', 'rice tutug chicken', 'nasi dengan ayam', 16, '27000', '20'),
(28, '47233-2.png', 'burger', 'pedas/tak pedas', 17, '18000', '10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_menu` int(11) NOT NULL,
  `jenis_menu` int(1) NOT NULL,
  `kategori_menu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_menu`, `jenis_menu`, `kategori_menu`) VALUES
(12, 1, 'snack'),
(13, 1, 'teh'),
(16, 1, 'Makanan Utama'),
(17, 1, 'Makanan Ringan'),
(18, 2, 'Minuman panas'),
(19, 2, 'Minuman Dingin'),
(20, 2, 'kopi'),
(21, 2, 'jus');

-- --------------------------------------------------------

--
-- Table structure for table `tb_list_order`
--

CREATE TABLE `tb_list_order` (
  `id_list_order` int(11) NOT NULL,
  `menu` int(11) NOT NULL,
  `kode_order` bigint(19) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `catatan` varchar(200) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_list_order`
--

INSERT INTO `tb_list_order` (`id_list_order`, `menu`, `kode_order`, `jumlah`, `catatan`, `status`) VALUES
(6, 14, 2401091156197, 3, 'segar', 2),
(15, 13, 2401091155779, 2, 'panas', 2),
(16, 16, 2401091155779, 1, 'panas', 2),
(17, 15, 2401091155779, 2, 'pedas', 1),
(18, 13, 2401091156197, 2, 'jawa', 2),
(25, 13, 2401091941361, 5, 'pedas', 2),
(26, 14, 2401091941361, 2, 'oke', 0),
(27, 16, 2401100918798, 1, 'tanpa es', 2),
(30, 15, 2401101720770, 2, 'bonus ', 1),
(31, 13, 2401102203811, 5, 'pedas', 2),
(32, 15, 2401102203811, 2, 'oke', 2),
(33, 22, 2401101720770, 2, 'panas', 0),
(34, 13, 2401100836101, 5, 'panas', 2),
(35, 23, 2401101720770, 2, 'es sdikit', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` bigint(19) NOT NULL,
  `pelanggan` varchar(200) NOT NULL,
  `meja` int(10) NOT NULL,
  `pelayan` int(10) NOT NULL,
  `waktu_order` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `pelanggan`, `meja`, `pelayan`, `waktu_order`) VALUES
(2401091155779, 'aku', 3, 6, '2024-01-09 23:21:22'),
(2401091156197, 'my', 2, 6, '2024-01-09 05:05:25'),
(2401091941361, 'ahmad', 5, 6, '2024-01-10 01:39:14'),
(2401100836101, 'fuadah', 2, 6, '2024-01-10 02:22:23'),
(2401100918798, 'darto', 4, 6, '2024-01-10 02:19:22'),
(2401101720770, 'eni', 4, 6, '2024-01-10 10:21:05'),
(2401102203811, 'tono', 5, 6, '2024-01-10 15:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(10) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(10) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `alamat` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `level`, `nohp`, `alamat`) VALUES
(3, 'pelayan1@gmail.com', 'pelayan1@gmail.com', '511cc40443f2a1ab03ab373b77d28091', 3, '081931340725', 'purwamekar'),
(4, 'dapur1', 'dapur1@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 4, '0859590256', 'plered'),
(6, 'admin1', 'admin1@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 1, '081219613121', 'jatiluhur\r\n'),
(19, 'kasir1', 'kasir@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '087798043525', 'koncara'),
(21, 'dapur2', 'dapur2@gmail.com', 'de20b1d289dd6005ba8116085122f144', 4, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bayar`
--
ALTER TABLE `tb_bayar`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indexes for table `tb_daftar_menu`
--
ALTER TABLE `tb_daftar_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tb_list_order`
--
ALTER TABLE `tb_list_order`
  ADD PRIMARY KEY (`id_list_order`),
  ADD KEY `menu` (`menu`),
  ADD KEY `order` (`kode_order`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `pelayan` (`pelayan`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_bayar`
--
ALTER TABLE `tb_bayar`
  MODIFY `id_bayar` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2401102203812;

--
-- AUTO_INCREMENT for table `tb_daftar_menu`
--
ALTER TABLE `tb_daftar_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_list_order`
--
ALTER TABLE `tb_list_order`
  MODIFY `id_list_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_list_order`
--
ALTER TABLE `tb_list_order`
  ADD CONSTRAINT `tb_list_order_ibfk_3` FOREIGN KEY (`kode_order`) REFERENCES `tb_order` (`id_order`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`pelayan`) REFERENCES `tb_user` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
