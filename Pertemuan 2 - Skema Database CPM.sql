-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 15, 2020 at 12:10 PM
-- Server version: 8.0.21-0ubuntu0.20.04.4
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpm`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `id_jurusan` int NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'Pendidikan Sistem dan Teknologi Informasi'),
(2, 'Pendidikan Guru Sekolah Dasar'),
(3, 'Pendidikan Guru Pendidikan Anak Usia Dini'),
(4, 'Sistem Telekomunikasi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelompok`
--

CREATE TABLE `tbl_kelompok` (
  `id_kelompok` int NOT NULL,
  `nama_kelompok` varchar(255) NOT NULL,
  `id_panitia` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_kelompok`
--

INSERT INTO `tbl_kelompok` (`id_kelompok`, `nama_kelompok`, `id_panitia`) VALUES
(1, 'Linux', 3),
(2, 'Windows', 4),
(3, 'MacOs', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `id_mahasiswa` int NOT NULL,
  `nama_mahasiswa` varchar(255) NOT NULL,
  `id_jurusan` int NOT NULL,
  `id_kelompok` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`id_mahasiswa`, `nama_mahasiswa`, `id_jurusan`, `id_kelompok`) VALUES
(1, 'Agus', 2, 2),
(2, 'Meri Rahmawati', 1, 1),
(3, 'Wali', 2, 1),
(4, 'Deli', 1, 2),
(5, 'Letih', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_panitia`
--

CREATE TABLE `tbl_panitia` (
  `id_panitia` int NOT NULL,
  `nama_panitia` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('keamanan','evalitbang','mentor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_panitia`
--

INSERT INTO `tbl_panitia` (`id_panitia`, `nama_panitia`, `username`, `password`, `role`) VALUES
(1, 'Robby Akbar', 'robbyakbar', '123456', 'keamanan'),
(2, 'Akbar Robby', 'akbar', '654321', 'evalitbang'),
(3, 'Rabka Ibbor', 'ibbor', '123qwe', 'mentor'),
(4, 'Ibbor Rabka', 'rabka', 'qwe123', 'mentor'),
(5, 'Pudin', 'udin', 'qwerty', 'mentor');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggaran`
--

CREATE TABLE `tbl_pelanggaran` (
  `id_pelanggaran` int NOT NULL,
  `id_mahasiswa` int NOT NULL,
  `id_peraturan` int NOT NULL,
  `id_panitia` int NOT NULL,
  `tgl_pelanggaran` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_pelanggaran`
--

INSERT INTO `tbl_pelanggaran` (`id_pelanggaran`, `id_mahasiswa`, `id_peraturan`, `id_panitia`, `tgl_pelanggaran`) VALUES
(1, 3, 2, 1, '2020-08-15 11:30:02'),
(2, 2, 3, 1, '2020-08-15 11:30:02'),
(3, 1, 1, 1, '2020-08-15 11:30:02'),
(4, 2, 2, 1, '2020-08-15 11:30:02'),
(5, 3, 1, 1, '2020-08-15 11:30:02'),
(6, 3, 3, 1, '2020-08-15 11:30:02'),
(7, 2, 1, 1, '2020-08-15 11:30:02'),
(8, 1, 2, 1, '2020-08-15 11:30:02'),
(9, 1, 3, 1, '2020-08-15 11:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_peraturan`
--

CREATE TABLE `tbl_peraturan` (
  `id_peraturan` int NOT NULL,
  `isi_peraturan` text NOT NULL,
  `jenis_pelanggaran` enum('ringan','sedang','berat') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_peraturan`
--

INSERT INTO `tbl_peraturan` (`id_peraturan`, `isi_peraturan`, `jenis_pelanggaran`) VALUES
(1, 'Harus Menghidupan WebCam', 'ringan'),
(2, 'Tidak Membawa Senjata Api', 'berat'),
(3, 'Izin Maksimal 2 Hari', 'sedang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `tbl_kelompok`
--
ALTER TABLE `tbl_kelompok`
  ADD PRIMARY KEY (`id_kelompok`),
  ADD KEY `id_panitia` (`id_panitia`);

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_kelompok` (`id_kelompok`);

--
-- Indexes for table `tbl_panitia`
--
ALTER TABLE `tbl_panitia`
  ADD PRIMARY KEY (`id_panitia`);

--
-- Indexes for table `tbl_pelanggaran`
--
ALTER TABLE `tbl_pelanggaran`
  ADD PRIMARY KEY (`id_pelanggaran`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_peraturan` (`id_peraturan`),
  ADD KEY `id_panitia` (`id_panitia`);

--
-- Indexes for table `tbl_peraturan`
--
ALTER TABLE `tbl_peraturan`
  ADD PRIMARY KEY (`id_peraturan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `id_jurusan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_kelompok`
--
ALTER TABLE `tbl_kelompok`
  MODIFY `id_kelompok` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  MODIFY `id_mahasiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_panitia`
--
ALTER TABLE `tbl_panitia`
  MODIFY `id_panitia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_pelanggaran`
--
ALTER TABLE `tbl_pelanggaran`
  MODIFY `id_pelanggaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_peraturan`
--
ALTER TABLE `tbl_peraturan`
  MODIFY `id_peraturan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_kelompok`
--
ALTER TABLE `tbl_kelompok`
  ADD CONSTRAINT `tbl_kelompok_ibfk_1` FOREIGN KEY (`id_panitia`) REFERENCES `tbl_panitia` (`id_panitia`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD CONSTRAINT `tbl_mahasiswa_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `tbl_kelompok` (`id_kelompok`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_mahasiswa_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `tbl_jurusan` (`id_jurusan`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_pelanggaran`
--
ALTER TABLE `tbl_pelanggaran`
  ADD CONSTRAINT `tbl_pelanggaran_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `tbl_mahasiswa` (`id_mahasiswa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_pelanggaran_ibfk_2` FOREIGN KEY (`id_peraturan`) REFERENCES `tbl_peraturan` (`id_peraturan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_pelanggaran_ibfk_3` FOREIGN KEY (`id_panitia`) REFERENCES `tbl_panitia` (`id_panitia`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
