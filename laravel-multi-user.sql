-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Okt 2025 pada 07.17
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
-- Database: `laravel-multi-user`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `hasil_uji`
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
-- Dumping data untuk tabel `hasil_uji`
--

INSERT INTO `hasil_uji` (`id_hasil_uji`, `id_pcpar`, `hasil_uji_in`, `hasil_uji_en`, `ketidakpastian_in`, `ketidakpastian_en`, `limitdeteksi_in`, `limitdeteksi_en`, `satuan_in`, `satuan_en`, `simulan_in`, `simulan_en`, `suhu_in`, `suhu_en`, `waktu_in`, `waktu_en`, `nip_input`, `tgl_input`, `created_at`, `updated_at`) VALUES
(1, 1, '12.5', NULL, NULL, NULL, NULL, NULL, 'mg/L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-23 06:36:44', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
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
-- Struktur dari tabel `job_batches`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
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
(14, '2025_10_23_075248_add_status_validasi_to_pcanalisa_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_laboratorium`
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
-- Dumping data untuk tabel `mst_laboratorium`
--

INSERT INTO `mst_laboratorium` (`id`, `nama_laboratorium`, `kode_lab`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Laboratorium Bahan dan Produk', 'BHP', 'Laboratorium pengujian kemasan dan bahan plastik', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_parameter`
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
-- Dumping data untuk tabel `mst_parameter`
--

INSERT INTO `mst_parameter` (`id`, `kode_parameter`, `nama_parameter_in`, `nama_parameter_en`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'PRM001', 'Kadar Air', 'Moisture Content', 'Menentukan kadar air dalam sampel produk', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 'PRM002', 'Kadar Abu', 'Ash Content', 'Menentukan kandungan abu pada produk', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(3, 'PRM003', 'pH Larutan', 'Solution pH', 'Menentukan tingkat keasaman atau kebasaan larutan', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_produk`
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
-- Dumping data untuk tabel `mst_produk`
--

INSERT INTO `mst_produk` (`id`, `kode_produk`, `nama_produk`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'PRD001', 'Minyak Cengkeh', 'Produk bahan alam untuk uji mutu minyak atsiri', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 'PRD002', 'Kapsul Herbal', 'Produk sediaan farmasi herbal untuk uji standar mutu', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_standar_uji`
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
-- Dumping data untuk tabel `mst_standar_uji`
--

INSERT INTO `mst_standar_uji` (`id`, `kode_standar`, `nama_standar`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, NULL, 'SNI 1234:2020', 'Standar uji mutu bahan dan produk kimia', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_sub_parameter`
--

CREATE TABLE `mst_sub_parameter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_sub` varchar(50) DEFAULT NULL,
  `nama_sub` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mst_sub_parameter`
--

INSERT INTO `mst_sub_parameter` (`id`, `kode_sub`, `nama_sub`, `created_at`, `updated_at`) VALUES
(1, 'SP001', 'Migrasi Logam Berat', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 'SP002', 'Migrasi Total', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_syarat_mutu`
--

CREATE TABLE `mst_syarat_mutu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_syarat` varchar(50) DEFAULT NULL,
  `nama_syarat` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mst_syarat_mutu`
--

INSERT INTO `mst_syarat_mutu` (`id`, `kode_syarat`, `nama_syarat`, `created_at`, `updated_at`) VALUES
(1, 'SM001', 'Sesuai Baku Mutu SNI', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 'SM002', 'Sesuai ISO 17025', '2025-10-22 23:36:44', '2025-10-22 23:36:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pc`
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
-- Dumping data untuk tabel `pc`
--

INSERT INTO `pc` (`id_pc`, `id_mst_laboratorium`, `no_order`, `tgl_order`, `lama_order`, `banyak_contoh`, `tujuan_pengujian`, `tujuan_pengujian_ket`, `bahasa_lhu`, `tgl_samplingmulai`, `tgl_samplingselesai`, `nomor_bapc`, `keterangan_tambahan`, `badanusaha_customerdn`, `nama_customer`, `badanusaha_customerln`, `alamat_customer`, `alamatpabrik_customer`, `nip_input`, `tgl_input`, `created_at`, `updated_at`) VALUES
(1, 1, 'SERT-0882/KMN/2024', '2024-08-09', 14, 3, 'Sertifikasi mutu kemasan plastik', 'Permintaan uji performa jerigen 20L NMC', 'indonesia', '2024-08-10', '2024-08-11', 'BAPC/0882/KMN/2024', 'Contoh diambil langsung dari pabrik NMC', 'PT', 'PT Kadujaya Perkasa', NULL, 'Jl. Industri Raya No. 88, Cikarang, Jawa Barat\r\nJl. Industri Raya No. 88, Cikarang, Jawa Barat\r\nJl. Industri Raya No. 88, Cikarang, Jawa Barat', 'Kawasan Industri Jababeka', '198701012023011001', '2025-10-23 06:36:44', '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 1, '0002/KMN/2025', '2025-07-23', 25, 6, 'Menguji Dangers good', '-', 'indonesia', NULL, NULL, NULL, NULL, 'PT', 'PT Timuraya Tunggal', '2', 'Perkantoran Permata Senayan D-35, Jl Tentara Pelajar', 'Jl. Anggadita no 205,, Desa Anggadita Kec Klari', '198701012023011001', '2025-08-22 06:20:44', '2025-08-21 23:20:44', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pcanalisa`
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
-- Dumping data untuk tabel `pcanalisa`
--

INSERT INTO `pcanalisa` (`id_pcanalisa`, `id_pc`, `id_standar_uji`, `nopcanalisa`, `layanan_cepat`, `spm`, `tgl_perkiraan_analisaselesai`, `jenis_analisa`, `nomor_bapc`, `file_bapc`, `tgl_samplingmulai`, `tgl_samplingselesai`, `namasample_indo`, `namasample_inggris`, `merek`, `tipe_indo`, `tipe_inggris`, `keterangan`, `filedatadukung`, `id_produk`, `nama_produk`, `status`, `alasan_batal`, `filedatadukung_batal`, `tgl_batal`, `nip_batal`, `kendala`, `tgl_kendala`, `nip_kendala`, `nip_mt`, `tgl_proses_mt`, `nip_penanggungjawab`, `tgl_penanggungjawab`, `tgl_terima_korlab`, `tgl_terima_sample`, `tgl_penugasan`, `lhucatatan_in`, `lhucatatan_en`, `lhukesimpulan_in`, `lhukesimpulan_en`, `tgl_validasilhu_korlab`, `tgl_validasilhu_mt`, `status_validasilhu_mt`, `ket_validasilhu_mt`, `kan`, `foto`, `template_lhu`, `limitdeteksi`, `nip_penandatangan`, `tgl_cetaklhu`, `nip_cetaklhu`, `filelhu`, `tgl_upload`, `nip_upload`, `created_at`, `updated_at`, `status_validasi`) VALUES
(1, 1, 1, '0882/KMN/2024', 'normal', 10, '2024-08-24', 'paket', '-', '-', '0000-00-00', '0000-00-00', 'Jerigen 20L NMC', '-', '-', 'jerigen', 'jerigen', '-', NULL, 1, 'Jerigen', 'Diproses', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'setuju', NULL, 'ya', NULL, NULL, 'tidak', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-22 23:36:44', '2025-10-23 05:55:23', 'manajer'),
(2, 2, 1, '0437/KMN/2025', 'normal', 20, '2025-09-03', 'satuan', NULL, NULL, NULL, NULL, 'LLDPE guesst Bag(170 micron, COF 0.7 mm) Merek Timuraya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LLDPE guesst Bag(170 micron, COF 0.7 mm) Merek Timuraya', 'Diproses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'tidak', NULL, NULL, 'tidak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-23 21:24:12', 'final');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pcpar`
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
-- Dumping data untuk tabel `pcpar`
--

INSERT INTO `pcpar` (`id_pcpar`, `id_pcanalisa`, `id_produk`, `id_parameter`, `id_sub_parameter`, `id_syarat_mutu`, `urutan`, `jenispcpar`, `nama_parameter_in`, `nama_parameter_en`, `id_parameterinduk`, `id_parameterdetil_induk`, `hargasatuan`, `satuan_in`, `satuan_en`, `limitdeteksi_in`, `limitdeteksi_en`, `metoda_in`, `metoda_en`, `baku_mutu_in`, `baku_mutu_en`, `nip_input`, `tgl_input`, `nip_petugas`, `tgl_penugasan`, `alasan_perubahan_penugasan`, `tgl_analis_selesai`, `nip_validasikorlab_subkon`, `tgl_validasikorlab_subkon`, `catatan_korlab`, `tgl_catatan_korlab`, `nip_catatan_korlab`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, NULL, NULL, 'parameter', 'Paket Uji Kantong Plastik Film\r\n', NULL, NULL, NULL, '250000', '1x Uji', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-22 23:36:44', '2025-10-22 23:36:44'),
(2, 2, 2, 3, 1, 1, 2, 'parameter', 'Paket Uji Kantong Plastik Film\r\n1. Dimensi, Berat dan Pengkondisian\r\n2. Ketebalan\r\n3. Uji Jatuh\r\n', NULL, NULL, NULL, '5000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
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
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('qqB4gQYut9X06vY3T70hVkuibIHUoSgrNDSdN3OK', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVlVXUUJ6TlgyVEN3WmNMOUZlUnRBazlqYndySk5tY3ZLcWZSV29vTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hbmFsaXMvaW5wdXQtaGFzaWwvMiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1761280041),
('VQ7uGJbIhQ2HjdketItLa67F0SruG7oL5YGlGVnf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0RUSHZKOWNlM0c0Z2JPWHc2RVBRaXp0TU9rVEE1QmhYWjByb091SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYW5hamVyL3ZhbGlkYXNpLWxodSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761276592);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
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
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `hasil_uji`
--
ALTER TABLE `hasil_uji`
  ADD PRIMARY KEY (`id_hasil_uji`),
  ADD KEY `hasil_uji_id_pcpar_foreign` (`id_pcpar`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mst_laboratorium`
--
ALTER TABLE `mst_laboratorium`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mst_parameter`
--
ALTER TABLE `mst_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mst_produk`
--
ALTER TABLE `mst_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mst_standar_uji`
--
ALTER TABLE `mst_standar_uji`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mst_sub_parameter`
--
ALTER TABLE `mst_sub_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mst_syarat_mutu`
--
ALTER TABLE `mst_syarat_mutu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id_pc`),
  ADD KEY `pc_id_mst_laboratorium_foreign` (`id_mst_laboratorium`);

--
-- Indeks untuk tabel `pcanalisa`
--
ALTER TABLE `pcanalisa`
  ADD PRIMARY KEY (`id_pcanalisa`),
  ADD KEY `pcanalisa_id_pc_foreign` (`id_pc`),
  ADD KEY `pcanalisa_id_standar_uji_foreign` (`id_standar_uji`);

--
-- Indeks untuk tabel `pcpar`
--
ALTER TABLE `pcpar`
  ADD PRIMARY KEY (`id_pcpar`),
  ADD KEY `pcpar_id_pcanalisa_foreign` (`id_pcanalisa`),
  ADD KEY `pcpar_id_produk_foreign` (`id_produk`),
  ADD KEY `pcpar_id_parameter_foreign` (`id_parameter`),
  ADD KEY `pcpar_id_sub_parameter_foreign` (`id_sub_parameter`),
  ADD KEY `pcpar_id_syarat_mutu_foreign` (`id_syarat_mutu`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hasil_uji`
--
ALTER TABLE `hasil_uji`
  MODIFY `id_hasil_uji` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `mst_laboratorium`
--
ALTER TABLE `mst_laboratorium`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `mst_parameter`
--
ALTER TABLE `mst_parameter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `mst_produk`
--
ALTER TABLE `mst_produk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mst_standar_uji`
--
ALTER TABLE `mst_standar_uji`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `mst_sub_parameter`
--
ALTER TABLE `mst_sub_parameter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mst_syarat_mutu`
--
ALTER TABLE `mst_syarat_mutu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pc`
--
ALTER TABLE `pc`
  MODIFY `id_pc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pcanalisa`
--
ALTER TABLE `pcanalisa`
  MODIFY `id_pcanalisa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pcpar`
--
ALTER TABLE `pcpar`
  MODIFY `id_pcpar` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hasil_uji`
--
ALTER TABLE `hasil_uji`
  ADD CONSTRAINT `hasil_uji_id_pcpar_foreign` FOREIGN KEY (`id_pcpar`) REFERENCES `pcpar` (`id_pcpar`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `pc_id_mst_laboratorium_foreign` FOREIGN KEY (`id_mst_laboratorium`) REFERENCES `mst_laboratorium` (`id`);

--
-- Ketidakleluasaan untuk tabel `pcanalisa`
--
ALTER TABLE `pcanalisa`
  ADD CONSTRAINT `pcanalisa_id_pc_foreign` FOREIGN KEY (`id_pc`) REFERENCES `pc` (`id_pc`) ON DELETE CASCADE,
  ADD CONSTRAINT `pcanalisa_id_standar_uji_foreign` FOREIGN KEY (`id_standar_uji`) REFERENCES `mst_standar_uji` (`id`);

--
-- Ketidakleluasaan untuk tabel `pcpar`
--
ALTER TABLE `pcpar`
  ADD CONSTRAINT `pcpar_id_parameter_foreign` FOREIGN KEY (`id_parameter`) REFERENCES `mst_parameter` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pcpar_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE,
  ADD CONSTRAINT `pcpar_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `mst_produk` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pcpar_id_sub_parameter_foreign` FOREIGN KEY (`id_sub_parameter`) REFERENCES `mst_sub_parameter` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pcpar_id_syarat_mutu_foreign` FOREIGN KEY (`id_syarat_mutu`) REFERENCES `mst_syarat_mutu` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
