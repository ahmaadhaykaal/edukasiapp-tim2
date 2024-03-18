-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2024 at 02:58 PM
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
-- Database: `db_edukasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `isi_berita` text NOT NULL,
  `gambar_berita` varchar(100) NOT NULL,
  `tgl_berita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id`, `judul`, `isi_berita`, `gambar_berita`, `tgl_berita`) VALUES
(1, '22 Sekolah Kedinasan Kemenhub yang Langsung Jadi CPNS setelah Lulus', 'JAKARTA - 22 sekolah kedinasan milik Kementerian Perhubungan ( Kemenhub ) ini bisa diangkat jadi CPNS setelah lulus.Sehingga lulusannya pun tidak dipusingkan lagi dengan mencari kerja usai tamat belajar. \r\nKemenhub memiliki 22 sekolah kedinasan yang tersebar di seluruh Indonesia dan lulusannya disiapkan untuk kebutuhan pegawai negeri bidang transportasi darat, laut, dan juga udara.\r\n22 sekolah kedinasan Kemenhub ini lulusannya bisa langsung diangkat menjadi calon pegawai negeri sipil ( CPNS ). Pada 2023, Kemenhub formasi CPNS di 22 sekolah kedinasan ini. \r\nSeleksi penerimaan calon taruna taruni 22 sekolah kedinasan ini pada tahun lalu menggunakan pola pembibitan Kemenhub dan pola pembibitan daerah (pemda).\r\nLalu mana saja sekolah kedinasan Kementerian Perhubungan (Kemenhub) yang lulusannya langsung menjadi CPNS? Dikutip dari laman Sipencatar, berikut ini daftarnya. \r\n22 Sekolah Kedinasan Kemenhub yang Langsung Diangkat Jadi CPNS \r\na.	Politeknik Penerbangan (Poltekbang) Jayapura\r\nb.	Politeknik Penerbangan (Poltekbang) Medan\r\nc.	Politeknik Penerbangan (Poltekbang) Surabaya\r\nd.	Politeknik Penerbangan (Poltekbang) Makassar\r\ne.	Politeknik Penerbangan Indonesia (PPI) Curug\r\nf.	Politeknik Penerbangan (Poltekbang) Palembang\r\ng.	Akademi Penerbang Indonesia (API) Banyuwangi \r\nh.	Politeknik Perkeretaapian Indonesia (PPI Madiun)\r\ni.	Politeknik Transportasi Sungai Danau dan Penyeberangan (Poltektrans SDP) Palembang\r\nj.	Politeknik Pelayaran (Poltekpel) Sumatera Barat\r\nk.	Politeknik Pelayaran (Poltekpel) Sulawesi Utara \r\nl.	Politeknik Pelayaran (Poltekpel) Barombong \r\nm.	Politeknik Transportasi Darat (Poltrada) Bali \r\nn.	Politeknik Tlmu Pelayaran (PIP) Semarang\r\no.	Politeknik Pelayaran (Poltekpel) Surabaya \r\np.	Politeknik Transportasi Darat Indonesia-STTD (PTDI-STTD) \r\nq.	Politeknik Pelayaran (Poltekpel) Banten \r\nr.	Sekolah Tinggi Ilmu Pelayaran (STIP)Jakarta \r\ns.	Politeknik Ilmu Pelayaran (PIP) Makassar \r\nt.	Politeknik Pelayaran (Poltekpel) Malahayati Aceh \r\nu.	Politeknik Keselamatan Transportasi Jalan (PKTJ) Tegal \r\nv.	Politeknik Pelayaran (Poltekpel) Sorong \r\nDemikian 22 sekolah kedinasan milik Kemenhub yang langsung diangkat menjadi CPNS . Semoga informasi ini bermanfaat bagi pembaca setia SINDOnews.\r\n', '1.jpeg', '2024-03-12 14:48:19'),
(2, '2 Sekolah Kedinasan yang Memakai Syarat Nilai UTBK 2024 untuk Daftar\r\nJAKARTA - Ini daftar 2 Sekolah Kedinasan yang memakai syarat nilai UTBK 2024 untuk mendaftar.', 'Pendaftaran Sekolah Kedinasan 2024 dibuka pada minggu ketiga Maret. Lulusan SMA/SMK sederajat yang mau mendaftar sekolah kedinasan 2024, perlu tahu bahwa ada dua sekolah kedinasan yang menggunakan syarat nilai UTBK 2024 (Ujian Tulis Berbasis Komputer).Mana saja? Artikel kali ini akan membahasnya, simak ya! 2 Sekolah Kedinasan yang Pakai Syarat Nilai UTBK 2024 untuk Daftar Sesuai informasi resmi dari laman masing-masing, dua sekolah kedinasan yang punya syarat nilai UTBK 2024 adalah: \r\na.	Politeknik Keuangan Negara (PKN) STAN sekolah kedinasan milik Keuangan Negara (Kemenkeu).\r\nb.	Politeknik Siber dan Sandi Negara (Poltek SSN) adalah sekolah kedinasan yang diselenggarakan oleh Badan Siber dan Sandi Negara (BSSN). \r\nMeski kedua Sekolah Kedinasan ini sudah memberikan informasi resmi bahwa untuk mendaftar wajib mempunyai nilai UTBK 2024, namun belum ada informasi resmi berapa nilai UTBK 2024 minimal yang harus dicapai calon mahasiswa agar bisa memenuhi persyaratan mendaftar.\r\n', '2.jpeg', '2024-03-12 14:49:11'),
(3, 'Dibuka 21 Maret, Berikut Syarat Batas Usia untuk Daftar UTBK SNBT 2024', 'JAKARTA - Ini syarat batas usia untuk mendaftar UTBK SNBT 2024 yang pendaftaranya akan dibuka 21 Maret. \r\nUTBK-SNBT 2024 adalah seleksi masuk perguruan tinggi negeri menggunakan tes yang diadakan setelah SNBP 2024 (Seleksi Nasional Berdasarkan Prestasi). UTBK SNBT 2024 bisa diikuti oleh siswa kelas 12 yang bukan siswa eligible dan tidak bisa mendaftar SNBP 2024. Selain itu, siswa lulusan dua tahun sebelumnya juga bisa mendaftar UTBK SNBT 2024.\r\nCalon mahasiswa yang mau mendaftar UTBK SNBT 2024 perlu tahu syarat batas usia yang diberlakukan. Seperti apa? Artikel kali ini akan membahasnya, simak ya! \r\nSyarat Batas Usia untuk Daftar UTBK SNBT 2024 \r\nDalam peraturan pendaftaran UTBK SNBT 2024, peserta didik Paket C yang bisa mendaftar maksimal berusia 25 tahun tahun terhitung per 1 Juli 2024. \r\nSedangkan siswa lulusan atau siswa gap year yang bisa mendaftar adalah dari lulusan 2022 dan 2023. Sehingga siswa lulusan SMA/SMK/MA sederajat tahun 2021 yang mau mencoba kuliah di perguruan tinggi negeri lewat jalur UTBK SNBT 2024 tidak bisa mendaftar. \r\n\r\nSelain syarat usia, saat mendaftar UTBK SNBT pada 21 Maret 2024 mendatang, pastikan kamu sudah mempunyai akun SNPMB (Seleksi Nasional Penerimaan Mahasiswa Baru) dan tidak dinyatakan lolos SNBP 2024. \r\nPenting diketahui calon mahasiswa yang mau mendaftar UTBK SNBT 2024. Bahwa siswa yang telah dinyatakan lulus seleksi Jalur SNBP 2024, SNBP 2023 dan Seleksi Nasional Masuk Perguruan Tinggi Negeri (SNMPTN) 2022 tidak dapat mendaftar UTBK SNBT 2024. \r\nSiswa yang dinyatakan lulus seleksi jalur SNBP 2024 tidak dapat mengikuti seleksi Jalur Mandiri di perguruan tinggi negeri manapun. Peserta yang dinyatakan lulus melalui jalur SNBT 2024 dan telah daftar ulang atau registrasi di PTN yang dituju tidak dapat diterima pada seleksi Jalur Mandiri di PTN manapun.\r\n', '3.jpeg', '2024-03-12 14:49:41'),
(4, 'IPB Buka 3 Jalur Mandiri 2024 Awal Mei, Ini Syarat dan Ketentuannya', 'JAKARTA - Ini informasi 3 jalur Mandiri di IPB University 2024. Kamu yang berminat mendaftar di IPB University tetapi bukan di jalur SNBP dan SNBT, maka Jalur Seleksi Mandiri adalah pilihan tepat. Seperti diketahui jalur Seleksi Mandiri merupakan satu dari sejumlah jalur seleksi msuk Perguruaan Tinggi Negeri (PTN). \r\nLalu kapan jalur Mandiri IPB University dibuka? Ketiga jalur Mandiri IPB ialah Jalur Mandiri Ketua OSIS, Jalur Prestasi Internasional dan Nasional (PIN), dan Seleksi Mandiri (SM) IPB. Semua jalur ini dibuka per 1 Mei 2024 secara online.UNtuk info lebih jelasnya, artikel kali ini akan membahas 3 jalur Seleksi Mandiri IPB tahun 2024, simak ya!\r\nInfo Pendaftaran Jalur Seleksi Mandiri IPB University 2024 \r\nUntuk Jalur mandiri Ketua OSIS di IPB dibuka bagi calon mahasiswa yang pernah menjadi ketua OSIS dan mempunyai prestasi akademik bagus. Sementara jalur mandiri PIN, untuk calon mahasiswa dengan prestasi tingkat nasional dan internasional. Bahkan di jalur ini ada kuota bagi anggota Pramuka Jawa Barat. \r\nLalu, SM IPB terdiri dari dua jalur. Pertama, menggunakan hasil nilai Ujian Tulis Berbasis Komputer di Seleksi Nasional Berdasarkan Tes (SNBT). Kedua, jalur ujian online oleh IPB University. Persyaratan Jalur Mandiri IPB 2024\r\n\r\nPersyaratan Jalur Mandiri Ketua OSIS IPB \r\na.	Pernah menjadi ketua OSIS selama di SMA/MA, yang diperkuat dengan surat Kepala Sekolah bahwa pelamar adalah benar siswa di sekolahnya dan pernah menjadi ketua OSIS selama sekurangnya satu periode, dilengkapi dengan surat keputusan kepala Sekolah tentang pengangkatan pelamar sebagai ketua OSIS \r\nb.	Lulusan tahun 2024 \r\nc.	Rataan nilai Matematika, Fisika, Kimia dan Biologi selama 5 semester sekurangnya 80 \r\nd.	Bersedia mendapatkan pelatihan kepemimpinan, kewirausahaan dan pelatihan lainnya. \r\nBiaya pendaftaran jalur Ketua OSIS Rp200.000 \r\nJadwal Jalur Mandiri Ketua OSIS IPB 2025 \r\nPendaftaran : 1 Mei – 14 Juni 2024\r\nMemilih Jalur Masuk : 1 Mei – 14 Juni 2024 pukul 12.00 WIB\r\n', '4.jpeg', '2024-03-12 14:49:41'),
(5, 'Gagal SNBP-SNBT Perlu Coba, Ini 8 Jalur Mandiri di Universitas Negeri Jakarta 2024', 'JAKARTA - Berikut 8 jalur Seleksi Mandiri di UNJ 2024 yang perlu diketahui calon mahasiswa. Gagal di jalur Seleksi Nasional Berdasarkan Prestasi (SNBP) dan Seleksi Nasional Berdasarkan Tes (SNBT) bukan berarti peluang untuk masuk perguruan tinggi negeri (PTN) tertutup. \r\nAda satu jalur seleksi yang bisa dicoba calo mahasiswa baru untuk mendaftar PTN yakni jalur seleksi Mandiri. Salah satu PTN yang membuka jalur Mandiri 2024 adalah Universitas Negeri Jakarta (UNJ). Artikel kali ini akan membahas 8 jalur seleksi Mandiri di UNJ 2024, simak ya!\r\n\r\n8 Jalur Seleksi Mandiri di UNJ 2024 \r\nDilansir dari laman resmi UNJ, Senin (11/3/2024) berikut jalur mandiri UNJ 2024 yang dibuka untuk tahun akademik 2024/2025 dan bisa dicoba calon mahasiswa. Sebagai informasi, jalur mandiri UNJ biasa disebut Penerimaan Mahasiswa Baru Universitas Negeri Jakarta (Penmaba UNJ). \r\nMeski jadwal pendaftaran jalur mandiri UNJ 2024 belum ada, tapi tak ada salahnya kamu tahu apa saja jalur mandiri UNJ yang bakal dibuka. \r\na.	Penmaba Jalur Portofolio Rapor Seleksi Mandiri ini ditujukan bagi peserta SNBP 2024 (Seleksi Nasional Berdasarkan Prestasi) yang memilih UNJ sebagai pilihan pertama namun tidak diterima. \r\nb.	Penmaba Jalur Tulis Seleksi mandiri ujian tulis Universitas Negeri Jakarta jalur ini menerapkan tes yang berjenis TPS, penalaran matematika, literasi bahasa Indonesia, dan literasi bahasa Inggris, serta ujian keterampilan bagi program studi yang mewajibkan ujian keterampilan. \r\nc.	Penmaba Jalur Prestasi Lomba Seleksi Mandiri ini diperuntukkan bagi siswa SMA/sederajat yang pernah meraih juara tingkat nasional dan internasional selama di SMA/ sederajat dalam bidang: Sains dan Teknologi; Seni dan Sastra Sosial Humaniora Olahraga Lomba Bidang Keagamaan\r\nd.	 Penmaba Jalur Portofolio Prestasi Non-Lomba Seleksi Mandiri yang diperuntukkan bagi siswa SMA/sederajat yang memiliki talenta kepemimpinan maupun keagamaan: \r\n-	Ketua OSIS dan Ketua MPK \r\n-	Pramuka Garuda \r\n-	Keagamaan (Tahfidz Alquran minimal 10 juz). \r\ne.	Penmaba jalur nilai UTBK SNBT Seleksi Mandiri yang diperuntukkan bagi siswa SMA/sederajat tiga tahun terakhir yang telah memilki nilai UTBK SNBT tahun 2024. \r\nf.	Penmaba khusus peserta difabel Seleksi Mandiri UNJ yang satu ini khusus diperuntukkan bagi siswa SMA/sederajat tiga tahun terakhir yang memiliki keterbatasan dalam fisik maupun psikis dengan tahapan Ujian Tulis dan Ujian Wawancara. \r\ng.	Penmaba Jalur Tes Kelas Internasional Seleksi Mandiri yang diperuntukkan bagi WNI atau WNA yang akan mengikuti kelas Internasional di Universitas Negeri Jakarta. \r\nh.	Penmaba Jalur Portofolio Mahasiswa Internasional Seleksi Mandiri UNJ yang satu ini diperuntukkan khusus bagi Warga Negara Asing (WNA) yang ingin melanjutkan studi jenjang Sarjana maupun Pascasarjana di Universitas Negeri Jakarta.\r\n', '5.jpeg', '2024-03-12 14:50:33'),
(6, 'Mahasiswa yang Berprestasi Itu seperti Apa sebagai Syarat Mengikuti Pilmapres 2024?', 'JAKARTA - Pengertian dari mahasiswa berprestasi menjadi rujukan penting mengikuti Pilmapres . Pilmapres adalah salah satu ajang kompetisi yang diselenggarakan Kemendikbudristek. \r\nPemilihan Mahasiswa Berprestasi (Pilmapres) merupakan salah satu ajang talenta yang digelar Pusat Prestasi Nasional (Puspresnas) Kemendikbudristek untuk mencari mahasiswa -mahasiswa terbaik dari seluruh penjuru Indonesia.\r\nPada Pilmapres Nasional 2023 lalu yang menjadi pemenang Pilmapres kategori sarjana adalah mahasiswi UGM bernama Schalke Anindya Putri dan jenjang diploma adalah mahasiswi IPB University bernama Violika Sinci Sari. \r\nTentunya terpilih menjadi mahasiswa berprestasi di antara jutaan mahasiswa di Indonesia merupakan prestasi tersendiri. Kalian bisa mengikuti jejak para pemenang dengan mengikuti Pilmapres 2024. \r\n\r\nPengertian Mahasiswa Berprestasi \r\nDikutip dari Pedoman Pilmapres 2024, para mahasiswa yang ingin mengikuti ajang talenta berbakat ini sudah sepatutnya mengetahui kriteria dari mahasiswa berprestasi. \r\nDefinisi selengkapnya mahasiswa berprestasi sesuai pedoman adalah mahasiswa yang mampu meraih beragam prestasi yang membanggakan di bidang akademik baik melalui intra, ko, maupun ekstra-kurikuler. \r\nMahasiswa berprestasi merupakan mahasiswa yang mampu memberikan kontribusi nyata, menunjukkan komitmen, kepedulian terhadap masyarakat sebagai bentuk representasi nasionalisme, kecerdasan sosial, emosional, dan spiritual. \r\nMahasiswa Berprestasi Peraih IPK 3,73 Mahasiswa berprestasi juga memiliki kemampuan menuangkan pemikiran tertulis dan menyampaikan secara lisan baik dengan Bahasa Indonesia maupun Bahasa Asing dengan baik, serta memiliki sikap dan perilaku yang patut diteladani. \r\nDemikian pengertian mahasiswa berprestasi yang menjadi landasan Pilmapres yang digadang sebagai usaha untuk mendorong munculnya mahasiswa-mahasiswa unggul yang memiliki keunggulan seimbang antara kecerdasan intelektual, emosional, kinestetis, dan spiritual. \r\n', '6.jpeg', '2024-03-12 14:50:33'),
(7, 'Studi Mengungkap Hubungan Antara Penggunaan Teknologi dan Hasil Belajar', 'Sebuah studi terbaru menggunakan data dummy telah mengungkap hubungan yang signifikan antara tingkat penggunaan teknologi dalam pembelajaran dan hasil belajar siswa. Temuan ini memberikan wawasan baru bagi pendidik untuk mengintegrasikan teknologi secara efektif dalam kurikulum.', '7.jpeg', '2024-03-12 14:51:29'),
(8, 'Inovasi Pembelajaran: Pemanfaatan Realitas Virtual dalam Ruang Kelas', 'Pemanfaatan realitas virtual (VR) dalam pendidikan semakin meningkat dengan adanya penelitian baru yang menggunakan data dummy untuk menunjukkan manfaatnya dalam meningkatkan pemahaman dan keterlibatan siswa dalam pembelajaran.', '8.jpeg', '2024-03-12 14:51:29'),
(9, 'Kajian Mendalam Mengenai Dampak Bullying Terhadap Kesejahteraan Mental Siswa', 'Sebuah kajian mendalam yang menggunakan data dummy mengungkapkan dampak serius bullying terhadap kesejahteraan mental siswa. Temuan ini mendorong perhatian lebih lanjut terhadap upaya pencegahan bullying di lingkungan pendidikan.', '9.jpeg', '2024-03-12 14:52:20'),
(10, 'Program Pendidikan Inklusif: Menjadi Model untuk Masyarakat yang Lebih Ramah terhadap Disabilitas', 'Program pendidikan inklusif mendapat sorotan melalui penelitian yang menggunakan data dummy untuk menunjukkan keberhasilannya dalam menciptakan lingkungan yang inklusif dan ramah bagi siswa dengan disabilitas, menjadi model untuk masyarakat yang lebih inklusif.', '10.jpeg', '2024-03-12 14:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `gambar` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `gambar`) VALUES
(1, '1.jpg'),
(2, '2.jpg'),
(3, '3.jpg'),
(4, '4.jpg'),
(5, '5.jpg'),
(6, '6.jpg'),
(7, '7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nobp` varchar(15) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tgl_input` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nobp`, `nohp`, `email`, `tgl_input`) VALUES
(1, 'Jason Susanto', '001', '082234567890', 'jason@mail.com', '2024-03-12 15:35:00'),
(2, 'Aaron', '002', '089534527890', 'aron@mail.com', '2024-03-12 15:35:00'),
(3, 'Davai', '003', '082334566788', 'davai@mail.com', '2024-03-12 15:40:05'),
(4, 'Tyson', '004', '08125134834', 'tyson@mail.com', '2024-03-12 15:40:05'),
(5, 'Kevin Susanto', '005', '085334566632', 'kevin@mail.com', '2024-03-12 15:41:05'),
(6, 'Dobi', '006', '089534552371', 'dobi@mail.com', '2024-03-12 15:41:05'),
(7, 'Ryan O.', '007', '08953734832', 'ryan@mail.com', '2024-03-12 15:42:36'),
(8, 'Subroza', '008', '081251322233', 'roza@gmail.com', '2024-03-12 15:42:36'),
(9, 'Kyedae', '009', '0812518328', 'kye@mail.com', '2024-03-12 15:43:38'),
(10, 'Gloria Shin', '010', '08533451231', 'gloria@mail.com', '2024-03-12 15:44:25'),
(11, 'Connor Moran', '011', '08218738202', 'prod@mail.com', '2024-03-12 15:44:25'),
(12, 'Kangkang', '012', '082234567822', 'kang@mail.com', '2024-03-12 15:46:04'),
(13, 'Froody', '013', '0898232721', 'froo@mail.com', '2024-03-12 15:46:47'),
(14, 'Kevin Viano', '014', '08231772321', 'kevin@mail.com', '2024-03-12 15:46:47'),
(15, 'Fandra', '015', '0853874584', 'octo@mail.com', '2024-03-12 15:47:48'),
(16, 'Scrodinger Lee', '016', '0823891234', 'lee@mail.com', '2024-03-12 15:48:44'),
(17, 'Josh Seki', '017', '08121724232', 'josh@mail.com', '2024-03-12 15:48:44'),
(18, 'Grim Sage', '018', '08321761223', 'grim@mail.com', '2024-03-12 15:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `tgl_daftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullname`, `tgl_daftar`) VALUES
(1, 'dila', 'rani@mail.com', '3e09293769927345f70104c89df5c45c', 'fadhilla rahmanisa', '2024-03-12 14:46:00'),
(2, 'ahmad', 'ahmad@mail.com', '724efe3eda37d5ee757e9d11a121840b', 'ahmad givantri haykal', '2024-03-12 14:46:19'),
(3, 'haykal', 'haykal@mail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Ahmad Givantri Haykal', '2024-03-17 23:53:37'),
(4, 'budi', 'budi@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'budibudi', '2024-03-18 09:56:24'),
(5, 'haykal1232', 'ahaykal@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'ahmad22', '2024-03-18 18:53:55'),
(6, 'anton', 'anton@mail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'anton sinaga', '2024-03-18 20:29:37'),
(7, 'cahya', 'monyet@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'monyet', '2024-03-18 20:36:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
