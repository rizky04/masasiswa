-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 28, 2025 at 11:43 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u522270047_mahasiswa`
--

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
-- Table structure for table `contoh_ujis`
--

CREATE TABLE `contoh_ujis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contoh_uji` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id_pcanalisa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contoh_ujis`
--

INSERT INTO `contoh_ujis` (`id`, `contoh_uji`, `image`, `id_pcanalisa`, `created_at`, `updated_at`) VALUES
(6, '<p>6 (enam) LLDPE gusset bag (170 micron, COF 0.7 mm) Merek Timuraya terdiri dari 3 buah kantong dengan isi dan 3 buah kantong kosong, sebagaimana yang dimaksud dengan deskripsi (5H3) dalam ketentuan yangberbeda.<br>&nbsp;</p>', 'uploads/pengujian/1761545571_ppwoven.jpg', 2, '2025-10-26 02:38:24', '2025-10-27 06:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `data_hasil_ujis`
--

CREATE TABLE `data_hasil_ujis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_hasil_uji` text DEFAULT NULL,
  `jenis_program_uji` text DEFAULT NULL,
  `id_pcanalisa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_hasil_ujis`
--

INSERT INTO `data_hasil_ujis` (`id`, `nama_hasil_uji`, `jenis_program_uji`, `id_pcanalisa`, `created_at`, `updated_at`) VALUES
(30, 'tes', 'Uji Jatuh', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `data_teknis_identifikasis`
--

CREATE TABLE `data_teknis_identifikasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_teknis_identifikasi` text DEFAULT NULL,
  `subject_teknis_identifikasi` text DEFAULT NULL,
  `id_pcanalisa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_teknis_identifikasis`
--

INSERT INTO `data_teknis_identifikasis` (`id`, `nama_teknis_identifikasi`, `subject_teknis_identifikasi`, `id_pcanalisa`, `created_at`, `updated_at`) VALUES
(46, 'tes 1', '<p>tes 2</p>', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(47, 'tes 2', '<p>tes2</p>', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(48, 'tes 3', '<p>tes 3</p>', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `data_teknis_kemasans`
--

CREATE TABLE `data_teknis_kemasans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_teknis_kemasan` text DEFAULT NULL,
  `subject_teknis_kemasan` text DEFAULT NULL,
  `id_pcanalisa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_teknis_kemasans`
--

INSERT INTO `data_teknis_kemasans` (`id`, `nama_teknis_kemasan`, `subject_teknis_kemasan`, `id_pcanalisa`, `created_at`, `updated_at`) VALUES
(50, NULL, 'Kemasan Kantong', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(51, '<p>Bag Plastic Material (5H3) Identifikasi : Kemasan Kantong dalam kondisi baik.&nbsp;</p>', 'Tipe :', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(52, NULL, 'Dimensi Luar', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(53, '<p>&nbsp;691,1 mm Ketidakpastian (95%) : ± 0,3 mm</p>', 'Panjang :', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(54, '<p>355,4 mm Ketidakpastian (95%) : ± 0,4 mm</p>', 'Lebar :', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(55, '<p>25,2 kg Ketidakpastian (95%) : ± 0,2 kg</p>', 'Berat :', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(56, '<p>0,1029 kg Ketidakpastian (95%) : ± 0,0008 kg</p>', 'Berat kemasan kosong :', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(57, '<p>0,175 mm Ketidakpastian (95%) : ± 0,005 mm&nbsp;</p>', 'Ketebalan kantong :', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12');

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
-- Table structure for table `hasil_uji`
--

CREATE TABLE `hasil_uji` (
  `id_hasil_uji` bigint(20) UNSIGNED NOT NULL,
  `id_pcpar` bigint(20) UNSIGNED NOT NULL,
  `hasil_uji_in` text DEFAULT NULL,
  `hasil_uji_en` text DEFAULT NULL,
  `ketidakpastian_in` text DEFAULT NULL,
  `ketidakpastian_en` text DEFAULT NULL,
  `limitdeteksi_in` varchar(30) DEFAULT NULL,
  `limitdeteksi_en` varchar(30) DEFAULT NULL,
  `satuan_in` varchar(255) DEFAULT NULL,
  `satuan_en` varchar(255) DEFAULT NULL,
  `simulan_in` varchar(255) DEFAULT NULL,
  `simulan_en` varchar(255) DEFAULT NULL,
  `suhu_in` varchar(255) DEFAULT NULL,
  `suhu_en` varchar(255) DEFAULT NULL,
  `waktu_in` varchar(255) DEFAULT NULL,
  `waktu_en` varchar(255) DEFAULT NULL,
  `nip_input` varchar(30) DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hasil_uji`
--

INSERT INTO `hasil_uji` (`id_hasil_uji`, `id_pcpar`, `hasil_uji_in`, `hasil_uji_en`, `ketidakpastian_in`, `ketidakpastian_en`, `limitdeteksi_in`, `limitdeteksi_en`, `satuan_in`, `satuan_en`, `simulan_in`, `simulan_en`, `suhu_in`, `suhu_en`, `waktu_in`, `waktu_en`, `nip_input`, `tgl_input`, `created_at`, `updated_at`) VALUES
(1, 1, '12.5', NULL, NULL, NULL, NULL, NULL, 'mg/L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-23 06:36:44', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

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
-- Table structure for table `kesimpulanl_ujis`
--

CREATE TABLE `kesimpulanl_ujis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kesimpulan_uji` text DEFAULT NULL,
  `id_pcanalisa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kesimpulanl_ujis`
--

INSERT INTO `kesimpulanl_ujis` (`id`, `kesimpulan_uji`, `id_pcanalisa`, `created_at`, `updated_at`) VALUES
(16, '<p>Kemasan Kantong <strong>memenuhi</strong> persyaratan pengujian untuk transportasi Dangerous Goods dengan klasifikasi packaging group.&nbsp;</p>', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12');

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
(4, '2025_10_15_084221_create_mst_standar_uji_table', 1),
(5, '2025_10_15_085522_create_mst_produk_table', 1),
(6, '2025_10_15_090133_create_mst_parameter_table', 1),
(7, '2025_10_15_090425_create_mst_sub_parameter_table', 1),
(8, '2025_10_15_090608_create_mst_syarat_mutu_table', 1),
(9, '2025_10_16_081214_create_mst_laboratorium_table', 1),
(10, '2025_10_16_082419_create_pcs_table', 1),
(11, '2025_10_16_082532_create_pcanalisas_table', 1),
(12, '2025_10_16_082553_create_pcpars_table', 1),
(13, '2025_10_16_082620_create_hasil_ujis_table', 1),
(14, '2025_10_23_075248_add_status_validasi_to_pcanalisa_table', 2),
(15, '2025_10_26_005635_create_pengujians_table', 3),
(17, '2025_10_26_041313_create_data_teknis_kemasans_table', 5),
(18, '2025_10_26_044516_create_data_teknis_identifikasis_table', 5),
(19, '2025_10_26_045117_create_program_ujis_table', 5),
(20, '2025_10_26_045902_create_data_hasil_ujis_table', 5),
(21, '2025_10_26_054208_create_kesimpulanl_ujis_table', 5),
(22, '2025_10_26_031454_create_contoh_ujis_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `mst_laboratorium`
--

CREATE TABLE `mst_laboratorium` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_laboratorium` varchar(100) NOT NULL,
  `kode_lab` varchar(20) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mst_laboratorium`
--

INSERT INTO `mst_laboratorium` (`id`, `nama_laboratorium`, `kode_lab`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Laboratorium Bahan dan Produk', 'BHP', 'Laboratorium pengujian kemasan dan bahan plastik', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `mst_parameter`
--

CREATE TABLE `mst_parameter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_parameter` varchar(50) DEFAULT NULL,
  `nama_parameter_in` varchar(255) NOT NULL,
  `nama_parameter_en` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mst_parameter`
--

INSERT INTO `mst_parameter` (`id`, `kode_parameter`, `nama_parameter_in`, `nama_parameter_en`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'PRM001', 'Kadar Air', 'Moisture Content', 'Menentukan kadar air dalam sampel produk', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 'PRM002', 'Kadar Abu', 'Ash Content', 'Menentukan kandungan abu pada produk', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(3, 'PRM003', 'pH Larutan', 'Solution pH', 'Menentukan tingkat keasaman atau kebasaan larutan', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `mst_produk`
--

CREATE TABLE `mst_produk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_produk` varchar(50) DEFAULT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mst_produk`
--

INSERT INTO `mst_produk` (`id`, `kode_produk`, `nama_produk`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'PRD001', 'Minyak Cengkeh', 'Produk bahan alam untuk uji mutu minyak atsiri', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 'PRD002', 'Kapsul Herbal', 'Produk sediaan farmasi herbal untuk uji standar mutu', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `mst_standar_uji`
--

CREATE TABLE `mst_standar_uji` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_standar` varchar(50) DEFAULT NULL,
  `nama_standar` varchar(255) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mst_standar_uji`
--

INSERT INTO `mst_standar_uji` (`id`, `kode_standar`, `nama_standar`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, NULL, 'SNI 1234:2020', 'Standar uji mutu bahan dan produk kimia', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `mst_sub_parameter`
--

CREATE TABLE `mst_sub_parameter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_sub` varchar(50) DEFAULT NULL,
  `nama_sub` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mst_sub_parameter`
--

INSERT INTO `mst_sub_parameter` (`id`, `kode_sub`, `nama_sub`, `created_at`, `updated_at`) VALUES
(1, 'SP001', 'Migrasi Logam Berat', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 'SP002', 'Migrasi Total', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `mst_syarat_mutu`
--

CREATE TABLE `mst_syarat_mutu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_syarat` varchar(50) DEFAULT NULL,
  `nama_syarat` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mst_syarat_mutu`
--

INSERT INTO `mst_syarat_mutu` (`id`, `kode_syarat`, `nama_syarat`, `created_at`, `updated_at`) VALUES
(1, 'SM001', 'Sesuai Baku Mutu SNI', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 'SM002', 'Sesuai ISO 17025', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

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
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `id_pc` bigint(20) UNSIGNED NOT NULL,
  `id_mst_laboratorium` bigint(20) UNSIGNED NOT NULL,
  `no_order` varchar(50) NOT NULL,
  `tgl_order` date NOT NULL,
  `lama_order` int(11) DEFAULT NULL,
  `banyak_contoh` int(11) DEFAULT NULL,
  `tujuan_pengujian` varchar(255) DEFAULT NULL,
  `tujuan_pengujian_ket` varchar(255) DEFAULT NULL,
  `bahasa_lhu` enum('indonesia','inggris','indonesia dan inggris') NOT NULL DEFAULT 'indonesia',
  `tgl_samplingmulai` date DEFAULT NULL,
  `tgl_samplingselesai` date DEFAULT NULL,
  `nomor_bapc` varchar(50) DEFAULT NULL,
  `keterangan_tambahan` text DEFAULT NULL,
  `badanusaha_customerdn` varchar(10) DEFAULT NULL,
  `nama_customer` varchar(255) DEFAULT NULL,
  `badanusaha_customerln` varchar(10) DEFAULT NULL,
  `alamat_customer` varchar(255) DEFAULT NULL,
  `alamatpabrik_customer` text DEFAULT NULL,
  `nip_input` varchar(30) DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pc`
--

INSERT INTO `pc` (`id_pc`, `id_mst_laboratorium`, `no_order`, `tgl_order`, `lama_order`, `banyak_contoh`, `tujuan_pengujian`, `tujuan_pengujian_ket`, `bahasa_lhu`, `tgl_samplingmulai`, `tgl_samplingselesai`, `nomor_bapc`, `keterangan_tambahan`, `badanusaha_customerdn`, `nama_customer`, `badanusaha_customerln`, `alamat_customer`, `alamatpabrik_customer`, `nip_input`, `tgl_input`, `created_at`, `updated_at`) VALUES
(1, 1, 'SERT-0882/KMN/2024', '2024-08-09', 14, 3, 'Sertifikasi mutu kemasan plastik', 'Permintaan uji performa jerigen 20L NMC', 'indonesia', '2024-08-10', '2024-08-11', 'BAPC/0882/KMN/2024', 'Contoh diambil langsung dari pabrik NMC', 'PT', 'PT Kadujaya Perkasa', NULL, 'Jl. Industri Raya No. 88, Cikarang, Jawa Barat\r\nJl. Industri Raya No. 88, Cikarang, Jawa Barat\r\nJl. Industri Raya No. 88, Cikarang, Jawa Barat', 'Kawasan Industri Jababeka', '198701012023011001', '2025-10-23 06:36:44', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 1, '0002/KMN/2025', '2025-07-23', 25, 6, 'Menguji Dangers good', '-', 'indonesia', NULL, NULL, NULL, NULL, 'PT', 'PT Timuraya Tunggal', '2', 'Perkantoran Permata Senayan D-35, Jl Tentara Pelajar', 'Jl. Anggadita no 205,, Desa Anggadita Kec Klari', '198701012023011001', '2025-08-22 06:20:44', '2025-08-21 23:20:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pcanalisa`
--

CREATE TABLE `pcanalisa` (
  `id_pcanalisa` bigint(20) UNSIGNED NOT NULL,
  `id_pc` bigint(20) UNSIGNED NOT NULL,
  `id_standar_uji` bigint(20) UNSIGNED DEFAULT NULL,
  `nopcanalisa` varchar(40) NOT NULL,
  `layanan_cepat` enum('normal','silver','gold','platinum') NOT NULL DEFAULT 'normal',
  `spm` int(11) DEFAULT NULL,
  `tgl_perkiraan_analisaselesai` date DEFAULT NULL,
  `jenis_analisa` enum('satuan','paket') NOT NULL DEFAULT 'satuan',
  `nomor_bapc` text DEFAULT NULL,
  `file_bapc` varchar(255) DEFAULT NULL,
  `tgl_samplingmulai` date DEFAULT NULL,
  `tgl_samplingselesai` date DEFAULT NULL,
  `namasample_indo` text DEFAULT NULL,
  `namasample_inggris` text DEFAULT NULL,
  `merek` text DEFAULT NULL,
  `tipe_indo` text DEFAULT NULL,
  `tipe_inggris` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `filedatadukung` varchar(255) DEFAULT NULL,
  `id_produk` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `status` enum('Diproses','Batal') NOT NULL DEFAULT 'Diproses',
  `alasan_batal` varchar(255) DEFAULT NULL,
  `filedatadukung_batal` varchar(255) DEFAULT NULL,
  `tgl_batal` datetime DEFAULT NULL,
  `nip_batal` varchar(30) DEFAULT NULL,
  `kendala` varchar(255) DEFAULT NULL,
  `tgl_kendala` datetime DEFAULT NULL,
  `nip_kendala` varchar(30) DEFAULT NULL,
  `nip_mt` varchar(30) DEFAULT NULL,
  `tgl_proses_mt` datetime DEFAULT NULL,
  `nip_penanggungjawab` varchar(30) DEFAULT NULL,
  `tgl_penanggungjawab` datetime DEFAULT NULL,
  `tgl_terima_korlab` datetime DEFAULT NULL,
  `tgl_terima_sample` datetime DEFAULT NULL,
  `tgl_penugasan` datetime DEFAULT NULL,
  `lhucatatan_in` text DEFAULT NULL,
  `lhucatatan_en` text DEFAULT NULL,
  `lhukesimpulan_in` text DEFAULT NULL,
  `lhukesimpulan_en` text DEFAULT NULL,
  `tgl_validasilhu_korlab` datetime DEFAULT NULL,
  `tgl_validasilhu_mt` datetime DEFAULT NULL,
  `status_validasilhu_mt` enum('setuju','tolak','-') NOT NULL DEFAULT '-',
  `ket_validasilhu_mt` text DEFAULT NULL,
  `kan` enum('ya','tidak') NOT NULL DEFAULT 'tidak',
  `foto` varchar(255) DEFAULT NULL,
  `template_lhu` varchar(255) DEFAULT NULL,
  `limitdeteksi` enum('ya','tidak') NOT NULL DEFAULT 'tidak',
  `nip_penandatangan` varchar(30) DEFAULT NULL,
  `tgl_cetaklhu` datetime DEFAULT NULL,
  `nip_cetaklhu` varchar(30) DEFAULT NULL,
  `filelhu` varchar(255) DEFAULT NULL,
  `tgl_upload` datetime DEFAULT NULL,
  `nip_upload` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_validasi` varchar(255) NOT NULL DEFAULT 'analis'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pcanalisa`
--

INSERT INTO `pcanalisa` (`id_pcanalisa`, `id_pc`, `id_standar_uji`, `nopcanalisa`, `layanan_cepat`, `spm`, `tgl_perkiraan_analisaselesai`, `jenis_analisa`, `nomor_bapc`, `file_bapc`, `tgl_samplingmulai`, `tgl_samplingselesai`, `namasample_indo`, `namasample_inggris`, `merek`, `tipe_indo`, `tipe_inggris`, `keterangan`, `filedatadukung`, `id_produk`, `nama_produk`, `status`, `alasan_batal`, `filedatadukung_batal`, `tgl_batal`, `nip_batal`, `kendala`, `tgl_kendala`, `nip_kendala`, `nip_mt`, `tgl_proses_mt`, `nip_penanggungjawab`, `tgl_penanggungjawab`, `tgl_terima_korlab`, `tgl_terima_sample`, `tgl_penugasan`, `lhucatatan_in`, `lhucatatan_en`, `lhukesimpulan_in`, `lhukesimpulan_en`, `tgl_validasilhu_korlab`, `tgl_validasilhu_mt`, `status_validasilhu_mt`, `ket_validasilhu_mt`, `kan`, `foto`, `template_lhu`, `limitdeteksi`, `nip_penandatangan`, `tgl_cetaklhu`, `nip_cetaklhu`, `filelhu`, `tgl_upload`, `nip_upload`, `created_at`, `updated_at`, `status_validasi`) VALUES
(1, 1, 1, '0882/KMN/2024', 'normal', 10, '2024-08-24', 'paket', '-', '-', '0000-00-00', '0000-00-00', 'Jerigen 20L NMC', '-', '-', 'jerigen', 'jerigen', '-', NULL, 1, 'Jerigen', 'Diproses', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'setuju', NULL, 'ya', NULL, NULL, 'tidak', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-22 23:36:44', '2025-10-23 05:55:23', 'manajer'),
(2, 2, 1, '0437/KMN/2025', 'normal', 20, '2025-09-03', 'satuan', NULL, NULL, NULL, NULL, 'LLDPE guesst Bag(170 micron, COF 0.7 mm) Merek Timuraya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LLDPE guesst Bag(170 micron, COF 0.7 mm) Merek Timuraya', 'Diproses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'tidak', NULL, NULL, 'tidak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-25 20:06:46', 'analis');

-- --------------------------------------------------------

--
-- Table structure for table `pcpar`
--

CREATE TABLE `pcpar` (
  `id_pcpar` bigint(20) UNSIGNED NOT NULL,
  `id_pcanalisa` bigint(20) UNSIGNED NOT NULL,
  `id_produk` bigint(20) UNSIGNED DEFAULT NULL,
  `id_parameter` bigint(20) UNSIGNED DEFAULT NULL,
  `id_sub_parameter` bigint(20) UNSIGNED DEFAULT NULL,
  `id_syarat_mutu` bigint(20) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `jenispcpar` enum('parameter','syaratmutu') NOT NULL DEFAULT 'parameter',
  `nama_parameter_in` text DEFAULT NULL,
  `nama_parameter_en` text DEFAULT NULL,
  `id_parameterinduk` bigint(20) UNSIGNED DEFAULT NULL,
  `id_parameterdetil_induk` bigint(20) UNSIGNED DEFAULT NULL,
  `hargasatuan` varchar(100) DEFAULT NULL,
  `satuan_in` varchar(255) DEFAULT NULL,
  `satuan_en` varchar(255) DEFAULT NULL,
  `limitdeteksi_in` varchar(30) DEFAULT NULL,
  `limitdeteksi_en` varchar(30) DEFAULT NULL,
  `metoda_in` text DEFAULT NULL,
  `metoda_en` text DEFAULT NULL,
  `baku_mutu_in` text DEFAULT NULL,
  `baku_mutu_en` text DEFAULT NULL,
  `nip_input` varchar(18) DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `nip_petugas` varchar(30) DEFAULT NULL,
  `tgl_penugasan` datetime DEFAULT NULL,
  `alasan_perubahan_penugasan` text DEFAULT NULL,
  `tgl_analis_selesai` datetime DEFAULT NULL,
  `nip_validasikorlab_subkon` varchar(30) DEFAULT NULL,
  `tgl_validasikorlab_subkon` datetime DEFAULT NULL,
  `catatan_korlab` varchar(255) DEFAULT NULL,
  `tgl_catatan_korlab` datetime DEFAULT NULL,
  `nip_catatan_korlab` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pcpar`
--

INSERT INTO `pcpar` (`id_pcpar`, `id_pcanalisa`, `id_produk`, `id_parameter`, `id_sub_parameter`, `id_syarat_mutu`, `urutan`, `jenispcpar`, `nama_parameter_in`, `nama_parameter_en`, `id_parameterinduk`, `id_parameterdetil_induk`, `hargasatuan`, `satuan_in`, `satuan_en`, `limitdeteksi_in`, `limitdeteksi_en`, `metoda_in`, `metoda_en`, `baku_mutu_in`, `baku_mutu_en`, `nip_input`, `tgl_input`, `nip_petugas`, `tgl_penugasan`, `alasan_perubahan_penugasan`, `tgl_analis_selesai`, `nip_validasikorlab_subkon`, `tgl_validasikorlab_subkon`, `catatan_korlab`, `tgl_catatan_korlab`, `nip_catatan_korlab`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, NULL, NULL, 'parameter', 'Paket Uji Kantong Plastik Film\r\n', NULL, NULL, NULL, '250000', '1x Uji', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 2, 2, 3, 1, 1, 2, 'parameter', 'Paket Uji Kantong Plastik Film\r\n1. Dimensi, Berat dan Pengkondisian\r\n2. Ketebalan\r\n3. Uji Jatuh\r\n', NULL, NULL, NULL, '5000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengujians`
--

CREATE TABLE `pengujians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contoh_uji` text DEFAULT NULL,
  `data_teknis` text DEFAULT NULL,
  `program_uji` text DEFAULT NULL,
  `hasil_uji` text DEFAULT NULL,
  `kesimpulan` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengujians`
--

INSERT INTO `pengujians` (`id`, `contoh_uji`, `data_teknis`, `program_uji`, `hasil_uji`, `kesimpulan`, `foto`, `created_at`, `updated_at`) VALUES
(1, '<p>aa</p>', '<p>aa</p>', '<p>a</p>', '<p>a</p>', '<p>a</p>', 'uploads/pengujian/1761446362_bg-404.jpeg', '2025-10-25 19:39:22', '2025-10-25 19:39:22'),
(2, '<p>sajdlkasjdas asdsdasda</p>', '<p>asdasdasd</p>', '<p>asdasd</p>', '<p>asdasd</p>', '<p>asdasd</p>', 'uploads/pengujian/1761448432_bg-404.jpeg', '2025-10-25 20:13:52', '2025-10-25 20:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `program_ujis`
--

CREATE TABLE `program_ujis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_program_uji` text DEFAULT NULL,
  `subject_program_uji` text DEFAULT NULL,
  `jenis_program_uji` text DEFAULT NULL,
  `id_pcanalisa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_ujis`
--

INSERT INTO `program_ujis` (`id`, `nama_program_uji`, `subject_program_uji`, `jenis_program_uji`, `id_pcanalisa`, `created_at`, `updated_at`) VALUES
(46, 'tes1', '<p>tes1</p>', 'Uji Jatuh', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(47, 'tes 2', '<p>tew2</p>', 'Uji Kebocoran', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12'),
(48, 'tes 3', '<p>tes 3</p>', 'Uji Tekanan Dalam', 2, '2025-10-28 23:36:12', '2025-10-28 23:36:12');

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
('7harO9qGWpYUY6lOOyxPTEckMYvxhzbKrPmv7YUM', NULL, '130.211.225.248', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0pqN09OY1F3UWxoNjNkU3lNMnFrUTZvOE1aV0dwZXRRMW5GWDYzTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vdGVzdC5jb2RlYW1pbi5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761661722),
('IP2zVNoUEXT0VUfnUskfjdCAtk1X2BTGGYwpKvWA', 4, '202.65.225.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT0VGdlV4N1BJaWZrSEYxV00yNTlkb1BDVEVSM0Zvck4xdmREN2F1dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vdGVzdC5jb2RlYW1pbi5pZC9wZW5ndWppYW4vMi9wZGYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1761662390),
('IqwWnuXhuFmsDm8QCuMzOopBJ5PZvtPbxHFtyDFH', NULL, '35.229.67.77', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWtMY2RKUEpIWkl3cTYyZHVOeURVTm51OUcycW9NaGpjS1NZazJ2VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vdGVzdC5jb2RlYW1pbi5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761672181),
('KouOzvPC3qzsAjpnuFBi5rpP5YidNiCwxfOrWBMR', NULL, '34.21.42.166', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib08zNHVBTGNPS1QxR09KNEdUd1NVMHA1UFBEVEY5VW1VTjRCMDFIaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vdGVzdC5jb2RlYW1pbi5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761688310),
('Miq6md6swqEr2NxN5sIS0wyDJKpxHPWaEQIM5XkD', 2, '202.65.225.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid0RITzh2TWZydEhZUVRaNmxEWDlZQ21pVHJVMGxoS2JyNFlEUlUzeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vdGVzdC5jb2RlYW1pbi5pZC9hbmFsaXMvZGF0YS1hbmFsaXNhIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1761662369),
('MKBteD7s5Ky00vaVVWRCOf6yuA9S0lDrSlo6egav', 2, '114.8.227.195', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYzY3blZ3RWpNNDZtVXFwOE1vYXplb2V1NllEOUFLR2RScmc3WjA0TCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vdGVzdC5jb2RlYW1pbi5pZC9wZW5ndWppYW4vMi9wZGYiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1761694916),
('o6FfSv6efG3Pe4bw2PnnowRNMPz0TAzBLuyQM6ss', 4, '114.8.227.195', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQkdTRmprT1c5cWd2VHV0RW9OS29zTWJxMTZvYzFTNTdUc2Z0WDBIdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vdGVzdC5jb2RlYW1pbi5pZC9wZW5ndWppYW4vMS9wZGYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1761660757),
('RICHIwgsSiR92500YMFASUCtMc769IhNio7OmqJ2', NULL, '35.229.63.175', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0ZPRWVsY1c5THJ0UXJCVVNMclA1RnZVU3pkNWNEZHZsa2thdmlTVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LnRlc3QuY29kZWFtaW4uaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1761673680);

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
  `role` enum('analis','korlab','manajer') NOT NULL DEFAULT 'analis',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-10-22 23:36:36', '$2y$12$UmNhyzdDyphpdVuRl7lCf.NrlRV4iitDy3SI/VFChgm6PQLMeipEe', 'analis', 'T9mDBQ3tyw', '2025-10-22 23:36:36', '2025-10-22 23:36:36'),
(2, 'mas analis', 'analis@gmail.com', NULL, '$2y$12$HSSkMPQn1uWFwrTUYP5KNu/8QKYkIBhvwEqIr07TSuVpuqMYCFnNS', 'analis', NULL, '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(3, 'mas korlab', 'korlab@gmail.com', NULL, '$2y$12$8CKh6NJQdjCOK9iyZoadOO9AwNcjYSYHk/Q39tXv/2lmVFswipQ8G', 'korlab', NULL, '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(4, 'mas manajer', 'manajer@gmail.com', NULL, '$2y$12$PII4tBffdsvcwAPTC92EnewqeTfG718ofJHufqPmef4A5oHulRj5q', 'manajer', NULL, '2025-10-22 23:36:44', '2025-10-22 23:36:44');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `contoh_ujis`
--
ALTER TABLE `contoh_ujis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contoh_ujis_id_pcanalisa_foreign` (`id_pcanalisa`);

--
-- Indexes for table `data_hasil_ujis`
--
ALTER TABLE `data_hasil_ujis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_hasil_ujis_id_pcanalisa_foreign` (`id_pcanalisa`);

--
-- Indexes for table `data_teknis_identifikasis`
--
ALTER TABLE `data_teknis_identifikasis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_teknis_identifikasis_id_pcanalisa_foreign` (`id_pcanalisa`);

--
-- Indexes for table `data_teknis_kemasans`
--
ALTER TABLE `data_teknis_kemasans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_teknis_kemasans_id_pcanalisa_foreign` (`id_pcanalisa`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hasil_uji`
--
ALTER TABLE `hasil_uji`
  ADD PRIMARY KEY (`id_hasil_uji`),
  ADD KEY `hasil_uji_id_pcpar_foreign` (`id_pcpar`);

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
-- Indexes for table `kesimpulanl_ujis`
--
ALTER TABLE `kesimpulanl_ujis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kesimpulanl_ujis_id_pcanalisa_foreign` (`id_pcanalisa`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_laboratorium`
--
ALTER TABLE `mst_laboratorium`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_parameter`
--
ALTER TABLE `mst_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_produk`
--
ALTER TABLE `mst_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_standar_uji`
--
ALTER TABLE `mst_standar_uji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_sub_parameter`
--
ALTER TABLE `mst_sub_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_syarat_mutu`
--
ALTER TABLE `mst_syarat_mutu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id_pc`),
  ADD KEY `pc_id_mst_laboratorium_foreign` (`id_mst_laboratorium`);

--
-- Indexes for table `pcanalisa`
--
ALTER TABLE `pcanalisa`
  ADD PRIMARY KEY (`id_pcanalisa`),
  ADD KEY `pcanalisa_id_pc_foreign` (`id_pc`),
  ADD KEY `pcanalisa_id_standar_uji_foreign` (`id_standar_uji`);

--
-- Indexes for table `pcpar`
--
ALTER TABLE `pcpar`
  ADD PRIMARY KEY (`id_pcpar`),
  ADD KEY `pcpar_id_pcanalisa_foreign` (`id_pcanalisa`),
  ADD KEY `pcpar_id_produk_foreign` (`id_produk`),
  ADD KEY `pcpar_id_parameter_foreign` (`id_parameter`),
  ADD KEY `pcpar_id_sub_parameter_foreign` (`id_sub_parameter`),
  ADD KEY `pcpar_id_syarat_mutu_foreign` (`id_syarat_mutu`);

--
-- Indexes for table `pengujians`
--
ALTER TABLE `pengujians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_ujis`
--
ALTER TABLE `program_ujis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_ujis_id_pcanalisa_foreign` (`id_pcanalisa`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `contoh_ujis`
--
ALTER TABLE `contoh_ujis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `data_hasil_ujis`
--
ALTER TABLE `data_hasil_ujis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `data_teknis_identifikasis`
--
ALTER TABLE `data_teknis_identifikasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `data_teknis_kemasans`
--
ALTER TABLE `data_teknis_kemasans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_uji`
--
ALTER TABLE `hasil_uji`
  MODIFY `id_hasil_uji` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesimpulanl_ujis`
--
ALTER TABLE `kesimpulanl_ujis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mst_laboratorium`
--
ALTER TABLE `mst_laboratorium`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mst_parameter`
--
ALTER TABLE `mst_parameter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mst_produk`
--
ALTER TABLE `mst_produk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_standar_uji`
--
ALTER TABLE `mst_standar_uji`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mst_sub_parameter`
--
ALTER TABLE `mst_sub_parameter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_syarat_mutu`
--
ALTER TABLE `mst_syarat_mutu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pc`
--
ALTER TABLE `pc`
  MODIFY `id_pc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pcanalisa`
--
ALTER TABLE `pcanalisa`
  MODIFY `id_pcanalisa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pcpar`
--
ALTER TABLE `pcpar`
  MODIFY `id_pcpar` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengujians`
--
ALTER TABLE `pengujians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `program_ujis`
--
ALTER TABLE `program_ujis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contoh_ujis`
--
ALTER TABLE `contoh_ujis`
  ADD CONSTRAINT `contoh_ujis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE;

--
-- Constraints for table `data_hasil_ujis`
--
ALTER TABLE `data_hasil_ujis`
  ADD CONSTRAINT `data_hasil_ujis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE;

--
-- Constraints for table `data_teknis_identifikasis`
--
ALTER TABLE `data_teknis_identifikasis`
  ADD CONSTRAINT `data_teknis_identifikasis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE;

--
-- Constraints for table `data_teknis_kemasans`
--
ALTER TABLE `data_teknis_kemasans`
  ADD CONSTRAINT `data_teknis_kemasans_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE;

--
-- Constraints for table `hasil_uji`
--
ALTER TABLE `hasil_uji`
  ADD CONSTRAINT `hasil_uji_id_pcpar_foreign` FOREIGN KEY (`id_pcpar`) REFERENCES `pcpar` (`id_pcpar`) ON DELETE CASCADE;

--
-- Constraints for table `kesimpulanl_ujis`
--
ALTER TABLE `kesimpulanl_ujis`
  ADD CONSTRAINT `kesimpulanl_ujis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE;

--
-- Constraints for table `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `pc_id_mst_laboratorium_foreign` FOREIGN KEY (`id_mst_laboratorium`) REFERENCES `mst_laboratorium` (`id`);

--
-- Constraints for table `pcanalisa`
--
ALTER TABLE `pcanalisa`
  ADD CONSTRAINT `pcanalisa_id_pc_foreign` FOREIGN KEY (`id_pc`) REFERENCES `pc` (`id_pc`) ON DELETE CASCADE,
  ADD CONSTRAINT `pcanalisa_id_standar_uji_foreign` FOREIGN KEY (`id_standar_uji`) REFERENCES `mst_standar_uji` (`id`);

--
-- Constraints for table `pcpar`
--
ALTER TABLE `pcpar`
  ADD CONSTRAINT `pcpar_id_parameter_foreign` FOREIGN KEY (`id_parameter`) REFERENCES `mst_parameter` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pcpar_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE,
  ADD CONSTRAINT `pcpar_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `mst_produk` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pcpar_id_sub_parameter_foreign` FOREIGN KEY (`id_sub_parameter`) REFERENCES `mst_sub_parameter` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pcpar_id_syarat_mutu_foreign` FOREIGN KEY (`id_syarat_mutu`) REFERENCES `mst_syarat_mutu` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `program_ujis`
--
ALTER TABLE `program_ujis`
  ADD CONSTRAINT `program_ujis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
