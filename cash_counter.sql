-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2022 at 01:30 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cash_counter`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_jabatan`
--

CREATE TABLE `data_jabatan` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_jabatan`
--

INSERT INTO `data_jabatan` (`id`, `nama_jabatan`) VALUES
(2, 'Divisi Editing Film'),
(7, 'Management Keuangan'),
(11, 'HRD'),
(12, 'Sutradara'),
(13, 'Team Creative'),
(14, 'Kerohanian'),
(15, 'Produser'),
(16, 'Ormas'),
(17, 'TPL'),
(18, 'Ketua Pengurus'),
(19, 'Bendahara'),
(20, 'Supervisi Lapangan');

-- --------------------------------------------------------

--
-- Table structure for table `data_karyawan`
--

CREATE TABLE `data_karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(255) NOT NULL,
  `jabatan_karyawan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_karyawan`
--

INSERT INTO `data_karyawan` (`id_karyawan`, `nama_karyawan`, `jabatan_karyawan`) VALUES
(1, 'Arip Budiman', 'Divisi Editing Film '),
(3, 'Mega ranisa', 'Management Keuangan '),
(4, 'Dias', 'Team Creative '),
(6, 'Bill Gates', 'HRD '),
(7, 'Nurhayati', 'Management Keuangan '),
(8, 'Slamet', 'TPL '),
(9, 'Yogi Saputra', 'TPL '),
(10, 'Rian Andriani Aziz', 'TPL '),
(12, 'Kamaludin', 'Supervisi Lapangan '),
(13, 'Mohamad Hasan', 'Supervisi Lapangan ');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `petugas_transaksi` varchar(255) NOT NULL,
  `seratus_ribu` int(20) NOT NULL,
  `tujuh_lima` int(20) NOT NULL,
  `lima_puluh` int(20) NOT NULL,
  `dua_puluh` int(20) NOT NULL,
  `sepuluh_ribu` int(20) NOT NULL,
  `lima_ribu` int(20) NOT NULL,
  `dua_ribu` int(20) NOT NULL,
  `seribu` int(20) NOT NULL,
  `seribu_coin` int(20) NOT NULL,
  `lima_ratus_coin` int(20) NOT NULL,
  `dua_ratus_coin` int(20) NOT NULL,
  `seratus_coin` int(20) NOT NULL,
  `creat_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `petugas_transaksi`, `seratus_ribu`, `tujuh_lima`, `lima_puluh`, `dua_puluh`, `sepuluh_ribu`, `lima_ribu`, `dua_ribu`, `seribu`, `seribu_coin`, `lima_ratus_coin`, `dua_ratus_coin`, `seratus_coin`, `creat_at`) VALUES
(3, 'Arip Budiman ', 5, 2, 50, 20, 10, 15, 18, 3, 10, 14, 12, 10, '2022-02-11 17:00:00'),
(4, 'Mega ranisa ', 5, 2, 50, 20, 10, 15, 18, 3, 10, 14, 12, 10, '2022-02-11 17:00:00'),
(5, 'Dias ', 45, 0, 25, 10, 30, 10, 10, 3, 10, 30, 20, 20, '2022-02-11 17:00:00'),
(6, 'Bill Gates ', 100, 50, 20, 10, 20, 30, 10, 20, 10, 20, 40, 80, '2022-02-11 17:00:00'),
(8, 'Dias ', 5, 2, 4, 10, 30, 40, 30, 2, 7, 30, 2, 10, '2022-02-12 14:43:09'),
(9, 'Yogi Saputra ', 2, 2, 50, 20, 30, 15, 10, 3, 7, 30, 2, 20, '2022-02-12 14:48:54'),
(10, 'Arip Budiman ', 100, 50, 200, 30, 30, 40, 30, 8, 7, 30, 20, 10, '2022-02-12 14:54:18'),
(11, 'Slamet ', 2, 1, 3, 2, 1, 4, 2, 1, 4, 2, 1, 4, '2022-02-12 23:54:33'),
(12, 'Yogi Saputra ', 1, 4, 0, 1, 2, 1, 2, 1, 3, 3, 1, 3, '2022-02-13 11:32:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_jabatan`
--
ALTER TABLE `data_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_karyawan`
--
ALTER TABLE `data_karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_jabatan`
--
ALTER TABLE `data_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `data_karyawan`
--
ALTER TABLE `data_karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
