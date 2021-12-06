-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 06 Des 2021 pada 04.55
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-raport`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_access_menu`
--

CREATE TABLE `tbl_access_menu` (
  `id_access_menu` tinyint(4) NOT NULL,
  `role_id` tinyint(4) NOT NULL,
  `menu_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_access_menu`
--

INSERT INTO `tbl_access_menu` (`id_access_menu`, `role_id`, `menu_id`) VALUES
(2, 1, 1),
(14, 3, 3),
(16, 2, 3),
(17, 2, 2),
(22, 1, 2),
(23, 1, 3),
(24, 1, 6),
(25, 1, 7),
(26, 1, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_agenda`
--

CREATE TABLE `tbl_agenda` (
  `id_agenda` int(11) NOT NULL,
  `agenda_nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `agenda_mulai` varchar(45) NOT NULL,
  `agenda_selesai` varchar(45) NOT NULL,
  `agenda_waktu` varchar(45) NOT NULL,
  `agenda_deskripsi` text NOT NULL,
  `agenda_tempat` varchar(255) NOT NULL,
  `agenda_keterangan` text NOT NULL,
  `agenda_author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_balasan`
--

CREATE TABLE `tbl_balasan` (
  `id_balasan` int(11) NOT NULL,
  `balasan_nama` varchar(45) NOT NULL,
  `balasan_isi` text NOT NULL,
  `komentar_id` mediumint(9) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_blog`
--

CREATE TABLE `tbl_blog` (
  `id_blog` mediumint(9) NOT NULL,
  `blog_slug` varchar(255) NOT NULL,
  `blog_author` varchar(255) NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `blog_isi` text NOT NULL,
  `blog_img` varchar(255) NOT NULL,
  `blog_thumb` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_kategori_id` smallint(6) NOT NULL,
  `user_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_blog`
--

INSERT INTO `tbl_blog` (`id_blog`, `blog_slug`, `blog_author`, `blog_title`, `blog_isi`, `blog_img`, `blog_thumb`, `created_at`, `blog_kategori_id`, `user_id`) VALUES
(25, '', '', 'Majapahit sejarah', '', '', '', '2020-07-02 11:00:44', 0, 0),
(26, '', '', 'Sejarah', '', '', '', '2020-07-02 11:00:01', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_file`
--

CREATE TABLE `tbl_file` (
  `id_file` int(11) NOT NULL,
  `file_slug` varchar(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `file_kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `id_jurusan` tinyint(4) NOT NULL,
  `nama_jurusan` varchar(255) NOT NULL,
  `nama_lain_jurusan` varchar(55) NOT NULL,
  `deskripsi_jurusan` text NOT NULL,
  `img_jurusan` varchar(255) NOT NULL,
  `kategori_jurusan_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori_blog`
--

CREATE TABLE `tbl_kategori_blog` (
  `id_kategori_blog` mediumint(9) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori_blog`
--

INSERT INTO `tbl_kategori_blog` (`id_kategori_blog`, `nama_kategori`) VALUES
(1, 'Pendidikan'),
(2, 'Sejarah'),
(3, 'Teknologi'),
(4, 'Olahraga');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori_file`
--

CREATE TABLE `tbl_kategori_file` (
  `id_kategori_file` int(11) NOT NULL,
  `kategori_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori_file`
--

INSERT INTO `tbl_kategori_file` (`id_kategori_file`, `kategori_nama`) VALUES
(1, 'Ebook'),
(2, 'Soure Code'),
(3, 'Template'),
(4, 'Musik'),
(5, 'Dokumen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori_jurusan`
--

CREATE TABLE `tbl_kategori_jurusan` (
  `id_kategori_jurusan` tinyint(4) NOT NULL,
  `nama_kategori_jurusan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori_jurusan`
--

INSERT INTO `tbl_kategori_jurusan` (`id_kategori_jurusan`, `nama_kategori_jurusan`) VALUES
(1, 'Informatika'),
(2, 'Otomotif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori_kelas`
--

CREATE TABLE `tbl_kategori_kelas` (
  `id_kategori_kelas` tinyint(10) NOT NULL,
  `nama_kategori_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori_kelas`
--

INSERT INTO `tbl_kategori_kelas` (`id_kategori_kelas`, `nama_kategori_kelas`) VALUES
(1, '2021-2022');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id_kelas` tinyint(4) NOT NULL,
  `nama_kelas` varchar(255) NOT NULL,
  `nama_lain_kelas` varchar(55) NOT NULL,
  `deskripsi_kelas` text NOT NULL,
  `img_kelas` varchar(255) NOT NULL,
  `kategori_kelas_id` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_komentar`
--

CREATE TABLE `tbl_komentar` (
  `id_komentar` bigint(20) NOT NULL,
  `blog_id` varchar(25) NOT NULL,
  `komentar_nama` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `komentar_isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` tinyint(4) NOT NULL,
  `menu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `menu`) VALUES
(1, 'ADMIN'),
(2, 'GURU'),
(3, 'USER');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_nav_home`
--

CREATE TABLE `tbl_nav_home` (
  `id_nav` tinyint(4) NOT NULL,
  `title` varchar(25) NOT NULL,
  `url` varchar(25) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_nav_home`
--

INSERT INTO `tbl_nav_home` (`id_nav`, `title`, `url`, `is_active`) VALUES
(1, 'Home', 'home', 1),
(2, 'About', 'about', 1),
(3, 'Contact', 'contact', 1),
(4, 'Blog', 'blog', 0),
(5, 'Pengumuman', 'pengumuman', 0),
(6, 'Agenda', 'agenda', 0),
(7, 'Download', 'download', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengumuman`
--

CREATE TABLE `tbl_pengumuman` (
  `id_pengumuman` int(11) NOT NULL,
  `pengumuman_nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pengumuman_deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pesan`
--

CREATE TABLE `tbl_pesan` (
  `id_pesan` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `email` varchar(80) NOT NULL,
  `isi` text NOT NULL,
  `status_pesan` tinyint(1) NOT NULL COMMENT '1=read,0=unread',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_role`
--

CREATE TABLE `tbl_role` (
  `id_role` tinyint(4) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_role`
--

INSERT INTO `tbl_role` (`id_role`, `role`) VALUES
(1, 'Admin'),
(2, 'Guru'),
(3, 'Member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` smallint(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `role_id` smallint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `email`, `password`, `profile_image`, `role_id`, `is_active`, `date_created`) VALUES
(51, 'Admin 1', 'admin1@sdnpurwantoro2.sch.id', '$2y$10$cMeLdDJLctjJH9aNovDgAeASdX3i6DubOkenTS3GyBeu2Is2PV2Ta', 'sean-lim-NPlv2pkYoUA-unsplash.jpg', 1, 1, '2021-12-06 02:11:57'),
(52, 'Guru', 'guru@sdnpurwantoro2.sch.id', '$2y$10$VYn7o1MOQgsF5eTqUl9Ts.NrCD4WbLcFmXK4AhpxSIy9MCq.0Yhfm', 'user.png', 2, 1, '2021-12-06 02:12:42'),
(53, 'Siswa', 'siswa@sdnpurwantoro2.sch.id', '$2y$10$X9XserM3XkT2eNcxoz7RL.wuq5J/LXqANWgKfJtH.Y8Ld3CugCALa', 'user.png', 3, 1, '2021-12-06 02:13:10'),
(54, 'Siswa 1', 'siswa1@sdnpurwantoro2.sch.id', '$2y$10$2Q0ZHatKBmElnx61.AKEme5kXuUilRH0X80WLhyKhVp483P4YXFau', 'user.png', 3, 1, '2021-12-06 02:13:32'),
(55, 'Admin', 'admin@sdnpurwantoro2.sch.id', '$2y$10$nh7ZFccag1vjoMXH.gO46u08WWU8C7rKIMaTN1tQOEa0gSTC8aS5u', 'user.png', 1, 1, '2021-12-06 02:13:39'),
(56, 'Admin 2', 'admin2@sdnpurwantoro2.sch.id', '$2y$10$IHJHNPT8UNXWpPmoZT9Caud7XkdYT6faa6xLtrpEb7ICg7V5hS4Nm', 'user.png', 1, 1, '2021-12-06 02:14:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_menu`
--

CREATE TABLE `tbl_user_menu` (
  `id_user_menu` tinyint(4) NOT NULL,
  `user_menu_title` varchar(50) NOT NULL,
  `user_menu_icon` varchar(80) NOT NULL,
  `user_menu_url` varchar(50) NOT NULL,
  `user_menu_is_active` tinyint(1) NOT NULL,
  `menu_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user_menu`
--

INSERT INTO `tbl_user_menu` (`id_user_menu`, `user_menu_title`, `user_menu_icon`, `user_menu_url`, `user_menu_is_active`, `menu_id`) VALUES
(1, 'Dashboard', 'nav-icon fas fa-tachometer-alt', 'admin', 1, 1),
(2, 'User', 'nav-icon fas fa-users', 'admin/master-user', 1, 1),
(3, 'Kelas', 'nav-icon fas fa-user-tie', 'admin/master-kelas', 1, 1),
(4, 'Dashboard Guru', 'nav-icon fas fa-tachometer-alt\r\n', 'guru', 1, 2),
(8, 'Edit Profil', 'nav-icon fas fa-user-edit', 'user/edit-profile', 1, 3),
(9, 'Ubah Password', 'nav-icon fas fa-lock', 'user/change-password', 1, 3),
(10, 'Profil Saya', 'nav-icon fas fa-user', 'user', 1, 3),
(12, 'Pesan', 'nav-icon fas fa-envelope', 'admin/master-pesan', 1, 1),
(16, 'Menu Sidebar', 'nav-icon fas fa-folder', 'admin/master-menu', 1, 1),
(19, 'Download', 'nav-icon fas fa-download', 'user/download', 1, 3),
(20, 'Hapus Akun Saya', 'nav-icon fa fa-ban', 'user/delete-my-account', 1, 3),
(21, 'File', 'nav-icon fas fa-file', 'admin/master-file', 1, 1),
(22, 'Token', 'nav-icon fas fa-key', 'admin/master-token', 0, 1),
(23, 'Akses Manager', 'nav-icon fa fa-user-secret', 'admin/access-manager', 1, 1),
(24, 'Menu Manager', 'nav-icon fa fa-folder-open', 'admin/menu-manager', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_token`
--

CREATE TABLE `tbl_user_token` (
  `id_user_token` mediumint(9) NOT NULL,
  `token` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_access_menu`
--
ALTER TABLE `tbl_access_menu`
  ADD PRIMARY KEY (`id_access_menu`);

--
-- Indeks untuk tabel `tbl_agenda`
--
ALTER TABLE `tbl_agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Indeks untuk tabel `tbl_balasan`
--
ALTER TABLE `tbl_balasan`
  ADD PRIMARY KEY (`id_balasan`);

--
-- Indeks untuk tabel `tbl_blog`
--
ALTER TABLE `tbl_blog`
  ADD PRIMARY KEY (`id_blog`);

--
-- Indeks untuk tabel `tbl_file`
--
ALTER TABLE `tbl_file`
  ADD PRIMARY KEY (`id_file`);

--
-- Indeks untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `tbl_kategori_blog`
--
ALTER TABLE `tbl_kategori_blog`
  ADD PRIMARY KEY (`id_kategori_blog`);

--
-- Indeks untuk tabel `tbl_kategori_file`
--
ALTER TABLE `tbl_kategori_file`
  ADD PRIMARY KEY (`id_kategori_file`);

--
-- Indeks untuk tabel `tbl_kategori_jurusan`
--
ALTER TABLE `tbl_kategori_jurusan`
  ADD PRIMARY KEY (`id_kategori_jurusan`);

--
-- Indeks untuk tabel `tbl_kategori_kelas`
--
ALTER TABLE `tbl_kategori_kelas`
  ADD PRIMARY KEY (`id_kategori_kelas`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tbl_komentar`
--
ALTER TABLE `tbl_komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `tbl_nav_home`
--
ALTER TABLE `tbl_nav_home`
  ADD PRIMARY KEY (`id_nav`);

--
-- Indeks untuk tabel `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indeks untuk tabel `tbl_pesan`
--
ALTER TABLE `tbl_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `tbl_user_menu`
--
ALTER TABLE `tbl_user_menu`
  ADD PRIMARY KEY (`id_user_menu`);

--
-- Indeks untuk tabel `tbl_user_token`
--
ALTER TABLE `tbl_user_token`
  ADD PRIMARY KEY (`id_user_token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_access_menu`
--
ALTER TABLE `tbl_access_menu`
  MODIFY `id_access_menu` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tbl_agenda`
--
ALTER TABLE `tbl_agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_balasan`
--
ALTER TABLE `tbl_balasan`
  MODIFY `id_balasan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_blog`
--
ALTER TABLE `tbl_blog`
  MODIFY `id_blog` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tbl_file`
--
ALTER TABLE `tbl_file`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `id_jurusan` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori_blog`
--
ALTER TABLE `tbl_kategori_blog`
  MODIFY `id_kategori_blog` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori_file`
--
ALTER TABLE `tbl_kategori_file`
  MODIFY `id_kategori_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori_jurusan`
--
ALTER TABLE `tbl_kategori_jurusan`
  MODIFY `id_kategori_jurusan` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori_kelas`
--
ALTER TABLE `tbl_kategori_kelas`
  MODIFY `id_kategori_kelas` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `id_kelas` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_komentar`
--
ALTER TABLE `tbl_komentar`
  MODIFY `id_komentar` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_nav_home`
--
ALTER TABLE `tbl_nav_home`
  MODIFY `id_nav` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  MODIFY `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pesan`
--
ALTER TABLE `tbl_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `id_role` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_menu`
--
ALTER TABLE `tbl_user_menu`
  MODIFY `id_user_menu` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_token`
--
ALTER TABLE `tbl_user_token`
  MODIFY `id_user_token` mediumint(9) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
