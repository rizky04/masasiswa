-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: mahasiswa
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contoh_ujis`
--

DROP TABLE IF EXISTS `contoh_ujis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contoh_ujis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contoh_uji` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pcanalisa` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contoh_ujis_id_pcanalisa_foreign` (`id_pcanalisa`),
  CONSTRAINT `contoh_ujis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contoh_ujis`
--

LOCK TABLES `contoh_ujis` WRITE;
/*!40000 ALTER TABLE `contoh_ujis` DISABLE KEYS */;
INSERT INTO `contoh_ujis` VALUES (6,'<p>tes</p>','uploads/pengujian/1761471504_bg-abstract2.png',2,'2025-10-26 02:38:24','2025-10-26 02:38:24');
/*!40000 ALTER TABLE `contoh_ujis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_hasil_ujis`
--

DROP TABLE IF EXISTS `data_hasil_ujis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_hasil_ujis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_hasil_uji` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_program_uji` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pcanalisa` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_hasil_ujis_id_pcanalisa_foreign` (`id_pcanalisa`),
  CONSTRAINT `data_hasil_ujis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_hasil_ujis`
--

LOCK TABLES `data_hasil_ujis` WRITE;
/*!40000 ALTER TABLE `data_hasil_ujis` DISABLE KEYS */;
INSERT INTO `data_hasil_ujis` VALUES (9,'tes','Uji Tekanan Dalam',2,'2025-10-26 02:53:52','2025-10-26 02:53:52'),(10,'tes','Uji Tekanan Dalam',2,'2025-10-26 02:53:52','2025-10-26 02:53:52'),(11,'tes','Uji Kebocoran',2,'2025-10-26 02:53:52','2025-10-26 02:53:52');
/*!40000 ALTER TABLE `data_hasil_ujis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_teknis_identifikasis`
--

DROP TABLE IF EXISTS `data_teknis_identifikasis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_teknis_identifikasis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_teknis_identifikasi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_teknis_identifikasi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pcanalisa` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_teknis_identifikasis_id_pcanalisa_foreign` (`id_pcanalisa`),
  CONSTRAINT `data_teknis_identifikasis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_teknis_identifikasis`
--

LOCK TABLES `data_teknis_identifikasis` WRITE;
/*!40000 ALTER TABLE `data_teknis_identifikasis` DISABLE KEYS */;
INSERT INTO `data_teknis_identifikasis` VALUES (13,'tes 1','<p>tes 2</p>',2,'2025-10-26 02:53:52','2025-10-26 02:53:52'),(14,'tes 2','<p>tes2</p>',2,'2025-10-26 02:53:52','2025-10-26 02:53:52'),(15,'tes 3','<p>tes 3</p>',2,'2025-10-26 02:53:52','2025-10-26 02:53:52');
/*!40000 ALTER TABLE `data_teknis_identifikasis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_teknis_kemasans`
--

DROP TABLE IF EXISTS `data_teknis_kemasans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_teknis_kemasans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_teknis_kemasan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_teknis_kemasan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pcanalisa` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_teknis_kemasans_id_pcanalisa_foreign` (`id_pcanalisa`),
  CONSTRAINT `data_teknis_kemasans_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_teknis_kemasans`
--

LOCK TABLES `data_teknis_kemasans` WRITE;
/*!40000 ALTER TABLE `data_teknis_kemasans` DISABLE KEYS */;
INSERT INTO `data_teknis_kemasans` VALUES (13,'<p>tes 1</p>','tes 1',2,'2025-10-26 02:53:52','2025-10-26 02:53:52'),(14,'<p>tes 2</p>','tes 2',2,'2025-10-26 02:53:52','2025-10-26 02:53:52'),(15,'<p>tes 3</p>','tes 3',2,'2025-10-26 02:53:52','2025-10-26 02:53:52');
/*!40000 ALTER TABLE `data_teknis_kemasans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hasil_uji`
--

DROP TABLE IF EXISTS `hasil_uji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasil_uji` (
  `id_hasil_uji` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pcpar` bigint unsigned NOT NULL,
  `hasil_uji_in` text COLLATE utf8mb4_unicode_ci,
  `hasil_uji_en` text COLLATE utf8mb4_unicode_ci,
  `ketidakpastian_in` text COLLATE utf8mb4_unicode_ci,
  `ketidakpastian_en` text COLLATE utf8mb4_unicode_ci,
  `limitdeteksi_in` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limitdeteksi_en` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `simulan_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `simulan_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suhu_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suhu_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_input` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_hasil_uji`),
  KEY `hasil_uji_id_pcpar_foreign` (`id_pcpar`),
  CONSTRAINT `hasil_uji_id_pcpar_foreign` FOREIGN KEY (`id_pcpar`) REFERENCES `pcpar` (`id_pcpar`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasil_uji`
--

LOCK TABLES `hasil_uji` WRITE;
/*!40000 ALTER TABLE `hasil_uji` DISABLE KEYS */;
INSERT INTO `hasil_uji` VALUES (1,1,'12.5',NULL,NULL,NULL,NULL,NULL,'mg/L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-23 06:36:44','2025-10-22 23:36:44','2025-10-22 23:36:44');
/*!40000 ALTER TABLE `hasil_uji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kesimpulanl_ujis`
--

DROP TABLE IF EXISTS `kesimpulanl_ujis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kesimpulanl_ujis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kesimpulan_uji` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pcanalisa` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kesimpulanl_ujis_id_pcanalisa_foreign` (`id_pcanalisa`),
  CONSTRAINT `kesimpulanl_ujis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kesimpulanl_ujis`
--

LOCK TABLES `kesimpulanl_ujis` WRITE;
/*!40000 ALTER TABLE `kesimpulanl_ujis` DISABLE KEYS */;
INSERT INTO `kesimpulanl_ujis` VALUES (5,'<p>tessss</p>',2,'2025-10-26 02:53:52','2025-10-26 02:53:52');
/*!40000 ALTER TABLE `kesimpulanl_ujis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_10_15_084221_create_mst_standar_uji_table',1),(5,'2025_10_15_085522_create_mst_produk_table',1),(6,'2025_10_15_090133_create_mst_parameter_table',1),(7,'2025_10_15_090425_create_mst_sub_parameter_table',1),(8,'2025_10_15_090608_create_mst_syarat_mutu_table',1),(9,'2025_10_16_081214_create_mst_laboratorium_table',1),(10,'2025_10_16_082419_create_pcs_table',1),(11,'2025_10_16_082532_create_pcanalisas_table',1),(12,'2025_10_16_082553_create_pcpars_table',1),(13,'2025_10_16_082620_create_hasil_ujis_table',1),(14,'2025_10_23_075248_add_status_validasi_to_pcanalisa_table',2),(15,'2025_10_26_005635_create_pengujians_table',3),(17,'2025_10_26_041313_create_data_teknis_kemasans_table',5),(18,'2025_10_26_044516_create_data_teknis_identifikasis_table',5),(19,'2025_10_26_045117_create_program_ujis_table',5),(20,'2025_10_26_045902_create_data_hasil_ujis_table',5),(21,'2025_10_26_054208_create_kesimpulanl_ujis_table',5),(22,'2025_10_26_031454_create_contoh_ujis_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_laboratorium`
--

DROP TABLE IF EXISTS `mst_laboratorium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_laboratorium` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_laboratorium` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_lab` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_laboratorium`
--

LOCK TABLES `mst_laboratorium` WRITE;
/*!40000 ALTER TABLE `mst_laboratorium` DISABLE KEYS */;
INSERT INTO `mst_laboratorium` VALUES (1,'Laboratorium Bahan dan Produk','BHP','Laboratorium pengujian kemasan dan bahan plastik','2025-10-22 23:36:44','2025-10-22 23:36:44');
/*!40000 ALTER TABLE `mst_laboratorium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_parameter`
--

DROP TABLE IF EXISTS `mst_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_parameter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_parameter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_parameter_in` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_parameter_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_parameter`
--

LOCK TABLES `mst_parameter` WRITE;
/*!40000 ALTER TABLE `mst_parameter` DISABLE KEYS */;
INSERT INTO `mst_parameter` VALUES (1,'PRM001','Kadar Air','Moisture Content','Menentukan kadar air dalam sampel produk','2025-10-22 23:36:44','2025-10-22 23:36:44'),(2,'PRM002','Kadar Abu','Ash Content','Menentukan kandungan abu pada produk','2025-10-22 23:36:44','2025-10-22 23:36:44'),(3,'PRM003','pH Larutan','Solution pH','Menentukan tingkat keasaman atau kebasaan larutan','2025-10-22 23:36:44','2025-10-22 23:36:44');
/*!40000 ALTER TABLE `mst_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_produk`
--

DROP TABLE IF EXISTS `mst_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_produk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_produk` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_produk`
--

LOCK TABLES `mst_produk` WRITE;
/*!40000 ALTER TABLE `mst_produk` DISABLE KEYS */;
INSERT INTO `mst_produk` VALUES (1,'PRD001','Minyak Cengkeh','Produk bahan alam untuk uji mutu minyak atsiri','2025-10-22 23:36:44','2025-10-22 23:36:44'),(2,'PRD002','Kapsul Herbal','Produk sediaan farmasi herbal untuk uji standar mutu','2025-10-22 23:36:44','2025-10-22 23:36:44');
/*!40000 ALTER TABLE `mst_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_standar_uji`
--

DROP TABLE IF EXISTS `mst_standar_uji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_standar_uji` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_standar` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_standar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_standar_uji`
--

LOCK TABLES `mst_standar_uji` WRITE;
/*!40000 ALTER TABLE `mst_standar_uji` DISABLE KEYS */;
INSERT INTO `mst_standar_uji` VALUES (1,NULL,'SNI 1234:2020','Standar uji mutu bahan dan produk kimia','2025-10-22 23:36:44','2025-10-22 23:36:44');
/*!40000 ALTER TABLE `mst_standar_uji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_sub_parameter`
--

DROP TABLE IF EXISTS `mst_sub_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_sub_parameter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_sub` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_sub` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_sub_parameter`
--

LOCK TABLES `mst_sub_parameter` WRITE;
/*!40000 ALTER TABLE `mst_sub_parameter` DISABLE KEYS */;
INSERT INTO `mst_sub_parameter` VALUES (1,'SP001','Migrasi Logam Berat','2025-10-22 23:36:44','2025-10-22 23:36:44'),(2,'SP002','Migrasi Total','2025-10-22 23:36:44','2025-10-22 23:36:44');
/*!40000 ALTER TABLE `mst_sub_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_syarat_mutu`
--

DROP TABLE IF EXISTS `mst_syarat_mutu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_syarat_mutu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_syarat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_syarat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_syarat_mutu`
--

LOCK TABLES `mst_syarat_mutu` WRITE;
/*!40000 ALTER TABLE `mst_syarat_mutu` DISABLE KEYS */;
INSERT INTO `mst_syarat_mutu` VALUES (1,'SM001','Sesuai Baku Mutu SNI','2025-10-22 23:36:44','2025-10-22 23:36:44'),(2,'SM002','Sesuai ISO 17025','2025-10-22 23:36:44','2025-10-22 23:36:44');
/*!40000 ALTER TABLE `mst_syarat_mutu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc`
--

DROP TABLE IF EXISTS `pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc` (
  `id_pc` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_mst_laboratorium` bigint unsigned NOT NULL,
  `no_order` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_order` date NOT NULL,
  `lama_order` int DEFAULT NULL,
  `banyak_contoh` int DEFAULT NULL,
  `tujuan_pengujian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tujuan_pengujian_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bahasa_lhu` enum('indonesia','inggris','indonesia dan inggris') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'indonesia',
  `tgl_samplingmulai` date DEFAULT NULL,
  `tgl_samplingselesai` date DEFAULT NULL,
  `nomor_bapc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan_tambahan` text COLLATE utf8mb4_unicode_ci,
  `badanusaha_customerdn` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badanusaha_customerln` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamatpabrik_customer` text COLLATE utf8mb4_unicode_ci,
  `nip_input` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pc`),
  KEY `pc_id_mst_laboratorium_foreign` (`id_mst_laboratorium`),
  CONSTRAINT `pc_id_mst_laboratorium_foreign` FOREIGN KEY (`id_mst_laboratorium`) REFERENCES `mst_laboratorium` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc`
--

LOCK TABLES `pc` WRITE;
/*!40000 ALTER TABLE `pc` DISABLE KEYS */;
INSERT INTO `pc` VALUES (1,1,'SERT-0882/KMN/2024','2024-08-09',14,3,'Sertifikasi mutu kemasan plastik','Permintaan uji performa jerigen 20L NMC','indonesia','2024-08-10','2024-08-11','BAPC/0882/KMN/2024','Contoh diambil langsung dari pabrik NMC','PT','PT Kadujaya Perkasa',NULL,'Jl. Industri Raya No. 88, Cikarang, Jawa Barat\r\nJl. Industri Raya No. 88, Cikarang, Jawa Barat\r\nJl. Industri Raya No. 88, Cikarang, Jawa Barat','Kawasan Industri Jababeka','198701012023011001','2025-10-23 06:36:44','2025-10-22 23:36:44','2025-10-22 23:36:44'),(2,1,'0002/KMN/2025','2025-07-23',25,6,'Menguji Dangers good','-','indonesia',NULL,NULL,NULL,NULL,'PT','PT Timuraya Tunggal','2','Perkantoran Permata Senayan D-35, Jl Tentara Pelajar','Jl. Anggadita no 205,, Desa Anggadita Kec Klari','198701012023011001','2025-08-22 06:20:44','2025-08-21 23:20:44',NULL);
/*!40000 ALTER TABLE `pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcanalisa`
--

DROP TABLE IF EXISTS `pcanalisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pcanalisa` (
  `id_pcanalisa` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pc` bigint unsigned NOT NULL,
  `id_standar_uji` bigint unsigned DEFAULT NULL,
  `nopcanalisa` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layanan_cepat` enum('normal','silver','gold','platinum') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `spm` int DEFAULT NULL,
  `tgl_perkiraan_analisaselesai` date DEFAULT NULL,
  `jenis_analisa` enum('satuan','paket') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'satuan',
  `nomor_bapc` text COLLATE utf8mb4_unicode_ci,
  `file_bapc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_samplingmulai` date DEFAULT NULL,
  `tgl_samplingselesai` date DEFAULT NULL,
  `namasample_indo` text COLLATE utf8mb4_unicode_ci,
  `namasample_inggris` text COLLATE utf8mb4_unicode_ci,
  `merek` text COLLATE utf8mb4_unicode_ci,
  `tipe_indo` text COLLATE utf8mb4_unicode_ci,
  `tipe_inggris` text COLLATE utf8mb4_unicode_ci,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `filedatadukung` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_produk` bigint unsigned DEFAULT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Diproses','Batal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Diproses',
  `alasan_batal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filedatadukung_batal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_batal` datetime DEFAULT NULL,
  `nip_batal` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kendala` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_kendala` datetime DEFAULT NULL,
  `nip_kendala` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_mt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_proses_mt` datetime DEFAULT NULL,
  `nip_penanggungjawab` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_penanggungjawab` datetime DEFAULT NULL,
  `tgl_terima_korlab` datetime DEFAULT NULL,
  `tgl_terima_sample` datetime DEFAULT NULL,
  `tgl_penugasan` datetime DEFAULT NULL,
  `lhucatatan_in` text COLLATE utf8mb4_unicode_ci,
  `lhucatatan_en` text COLLATE utf8mb4_unicode_ci,
  `lhukesimpulan_in` text COLLATE utf8mb4_unicode_ci,
  `lhukesimpulan_en` text COLLATE utf8mb4_unicode_ci,
  `tgl_validasilhu_korlab` datetime DEFAULT NULL,
  `tgl_validasilhu_mt` datetime DEFAULT NULL,
  `status_validasilhu_mt` enum('setuju','tolak','-') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `ket_validasilhu_mt` text COLLATE utf8mb4_unicode_ci,
  `kan` enum('ya','tidak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tidak',
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_lhu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limitdeteksi` enum('ya','tidak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tidak',
  `nip_penandatangan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_cetaklhu` datetime DEFAULT NULL,
  `nip_cetaklhu` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filelhu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_upload` datetime DEFAULT NULL,
  `nip_upload` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_validasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'analis',
  PRIMARY KEY (`id_pcanalisa`),
  KEY `pcanalisa_id_pc_foreign` (`id_pc`),
  KEY `pcanalisa_id_standar_uji_foreign` (`id_standar_uji`),
  CONSTRAINT `pcanalisa_id_pc_foreign` FOREIGN KEY (`id_pc`) REFERENCES `pc` (`id_pc`) ON DELETE CASCADE,
  CONSTRAINT `pcanalisa_id_standar_uji_foreign` FOREIGN KEY (`id_standar_uji`) REFERENCES `mst_standar_uji` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcanalisa`
--

LOCK TABLES `pcanalisa` WRITE;
/*!40000 ALTER TABLE `pcanalisa` DISABLE KEYS */;
INSERT INTO `pcanalisa` VALUES (1,1,1,'0882/KMN/2024','normal',10,'2024-08-24','paket','-','-','0000-00-00','0000-00-00','Jerigen 20L NMC','-','-','jerigen','jerigen','-',NULL,1,'Jerigen','Diproses','-','-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'setuju',NULL,'ya',NULL,NULL,'tidak',NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-22 23:36:44','2025-10-23 05:55:23','manajer'),(2,2,1,'0437/KMN/2025','normal',20,'2025-09-03','satuan',NULL,NULL,NULL,NULL,'LLDPE guesst Bag(170 micron, COF 0.7 mm) Merek Timuraya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LLDPE guesst Bag(170 micron, COF 0.7 mm) Merek Timuraya','Diproses',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'-',NULL,'tidak',NULL,NULL,'tidak',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-25 20:06:46','analis');
/*!40000 ALTER TABLE `pcanalisa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcpar`
--

DROP TABLE IF EXISTS `pcpar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pcpar` (
  `id_pcpar` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pcanalisa` bigint unsigned NOT NULL,
  `id_produk` bigint unsigned DEFAULT NULL,
  `id_parameter` bigint unsigned DEFAULT NULL,
  `id_sub_parameter` bigint unsigned DEFAULT NULL,
  `id_syarat_mutu` bigint unsigned DEFAULT NULL,
  `urutan` int DEFAULT NULL,
  `jenispcpar` enum('parameter','syaratmutu') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'parameter',
  `nama_parameter_in` text COLLATE utf8mb4_unicode_ci,
  `nama_parameter_en` text COLLATE utf8mb4_unicode_ci,
  `id_parameterinduk` bigint unsigned DEFAULT NULL,
  `id_parameterdetil_induk` bigint unsigned DEFAULT NULL,
  `hargasatuan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limitdeteksi_in` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limitdeteksi_en` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metoda_in` text COLLATE utf8mb4_unicode_ci,
  `metoda_en` text COLLATE utf8mb4_unicode_ci,
  `baku_mutu_in` text COLLATE utf8mb4_unicode_ci,
  `baku_mutu_en` text COLLATE utf8mb4_unicode_ci,
  `nip_input` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `nip_petugas` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_penugasan` datetime DEFAULT NULL,
  `alasan_perubahan_penugasan` text COLLATE utf8mb4_unicode_ci,
  `tgl_analis_selesai` datetime DEFAULT NULL,
  `nip_validasikorlab_subkon` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_validasikorlab_subkon` datetime DEFAULT NULL,
  `catatan_korlab` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_catatan_korlab` datetime DEFAULT NULL,
  `nip_catatan_korlab` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pcpar`),
  KEY `pcpar_id_pcanalisa_foreign` (`id_pcanalisa`),
  KEY `pcpar_id_produk_foreign` (`id_produk`),
  KEY `pcpar_id_parameter_foreign` (`id_parameter`),
  KEY `pcpar_id_sub_parameter_foreign` (`id_sub_parameter`),
  KEY `pcpar_id_syarat_mutu_foreign` (`id_syarat_mutu`),
  CONSTRAINT `pcpar_id_parameter_foreign` FOREIGN KEY (`id_parameter`) REFERENCES `mst_parameter` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pcpar_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE,
  CONSTRAINT `pcpar_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `mst_produk` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pcpar_id_sub_parameter_foreign` FOREIGN KEY (`id_sub_parameter`) REFERENCES `mst_sub_parameter` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pcpar_id_syarat_mutu_foreign` FOREIGN KEY (`id_syarat_mutu`) REFERENCES `mst_syarat_mutu` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcpar`
--

LOCK TABLES `pcpar` WRITE;
/*!40000 ALTER TABLE `pcpar` DISABLE KEYS */;
INSERT INTO `pcpar` VALUES (1,1,1,1,NULL,NULL,NULL,'parameter','Paket Uji Kantong Plastik Film\r\n',NULL,NULL,NULL,'250000','1x Uji',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-22 23:36:44','2025-10-22 23:36:44'),(2,2,2,3,1,1,2,'parameter','Paket Uji Kantong Plastik Film\r\n1. Dimensi, Berat dan Pengkondisian\r\n2. Ketebalan\r\n3. Uji Jatuh\r\n',NULL,NULL,NULL,'5000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pcpar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujians`
--

DROP TABLE IF EXISTS `pengujians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengujians` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contoh_uji` text COLLATE utf8mb4_unicode_ci,
  `data_teknis` text COLLATE utf8mb4_unicode_ci,
  `program_uji` text COLLATE utf8mb4_unicode_ci,
  `hasil_uji` text COLLATE utf8mb4_unicode_ci,
  `kesimpulan` text COLLATE utf8mb4_unicode_ci,
  `foto` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujians`
--

LOCK TABLES `pengujians` WRITE;
/*!40000 ALTER TABLE `pengujians` DISABLE KEYS */;
INSERT INTO `pengujians` VALUES (1,'<p>aa</p>','<p>aa</p>','<p>a</p>','<p>a</p>','<p>a</p>','uploads/pengujian/1761446362_bg-404.jpeg','2025-10-25 19:39:22','2025-10-25 19:39:22'),(2,'<p>sajdlkasjdas asdsdasda</p>','<p>asdasdasd</p>','<p>asdasd</p>','<p>asdasd</p>','<p>asdasd</p>','uploads/pengujian/1761448432_bg-404.jpeg','2025-10-25 20:13:52','2025-10-25 20:13:52');
/*!40000 ALTER TABLE `pengujians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_ujis`
--

DROP TABLE IF EXISTS `program_ujis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_ujis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_program_uji` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_program_uji` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_program_uji` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pcanalisa` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_ujis_id_pcanalisa_foreign` (`id_pcanalisa`),
  CONSTRAINT `program_ujis_id_pcanalisa_foreign` FOREIGN KEY (`id_pcanalisa`) REFERENCES `pcanalisa` (`id_pcanalisa`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_ujis`
--

LOCK TABLES `program_ujis` WRITE;
/*!40000 ALTER TABLE `program_ujis` DISABLE KEYS */;
INSERT INTO `program_ujis` VALUES (13,'tes1','<p>tes1</p>','Uji Jatuh',2,'2025-10-26 02:53:52','2025-10-26 02:53:52'),(14,'tes 2','<p>tew2</p>','Uji Kebocoran',2,'2025-10-26 02:53:52','2025-10-26 02:53:52'),(15,'tes 3','<p>tes 3</p>','Uji Tekanan Dalam',2,'2025-10-26 02:53:52','2025-10-26 02:53:52');
/*!40000 ALTER TABLE `program_ujis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('fCC9kvmaTeebEykILPkyNQipsytkVoDNqlBVcOcA',4,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidDJmOU9EVlpTYlNjZ1I0S3RWSjJDWGdnSE1tSFR2SnR2b29HbFljViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZW5ndWppYW4vMi9wZGYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=',1761488707),('Ys7YXFePjhKw9BYb7pktD1gNoErN4lSZwewszDWt',2,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ1Z1VUxpWm9FUDl0ZUh6QUtyS3Y5U0plZE90NktZbHQ0R1JmT1V0QyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZW5ndWppYW4vMi9lZGl0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9',1761488776);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('analis','korlab','manajer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'analis',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test User','test@example.com','2025-10-22 23:36:36','$2y$12$UmNhyzdDyphpdVuRl7lCf.NrlRV4iitDy3SI/VFChgm6PQLMeipEe','analis','T9mDBQ3tyw','2025-10-22 23:36:36','2025-10-22 23:36:36'),(2,'mas analis','analis@gmail.com',NULL,'$2y$12$HSSkMPQn1uWFwrTUYP5KNu/8QKYkIBhvwEqIr07TSuVpuqMYCFnNS','analis',NULL,'2025-10-22 23:36:44','2025-10-22 23:36:44'),(3,'mas korlab','korlab@gmail.com',NULL,'$2y$12$8CKh6NJQdjCOK9iyZoadOO9AwNcjYSYHk/Q39tXv/2lmVFswipQ8G','korlab',NULL,'2025-10-22 23:36:44','2025-10-22 23:36:44'),(4,'mas manajer','manajer@gmail.com',NULL,'$2y$12$PII4tBffdsvcwAPTC92EnewqeTfG718ofJHufqPmef4A5oHulRj5q','manajer',NULL,'2025-10-22 23:36:44','2025-10-22 23:36:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-27  7:29:21
