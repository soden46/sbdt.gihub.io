/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.17-MariaDB : Database - pabrik
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pabrik` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `pabrik`;

/*Table structure for table `gudang` */

DROP TABLE IF EXISTS `gudang`;

CREATE TABLE `gudang` (
  `idgudang` int(10) NOT NULL,
  `stok_produk` int(10) DEFAULT NULL,
  `tanggal_datang_bunga` datetime DEFAULT NULL,
  `jenis_produk` enum('teh','manisan','sirup','selai') DEFAULT NULL,
  `idpesan_bunga` int(10) DEFAULT NULL,
  `kode_produk` int(10) DEFAULT NULL,
  PRIMARY KEY (`idgudang`),
  KEY `fkgudang` (`kode_produk`),
  KEY `fkgudang2` (`idpesan_bunga`),
  KEY `fkgudang3` (`jenis_produk`),
  CONSTRAINT `fkgudang` FOREIGN KEY (`kode_produk`) REFERENCES `produk` (`kode_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkgudang2` FOREIGN KEY (`idpesan_bunga`) REFERENCES `pesan_bunga` (`idpesan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkgudang3` FOREIGN KEY (`jenis_produk`) REFERENCES `produk` (`jenis_produk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `gudang` */

insert  into `gudang`(`idgudang`,`stok_produk`,`tanggal_datang_bunga`,`jenis_produk`,`idpesan_bunga`,`kode_produk`) values 
(1,120,'2021-04-05 11:20:53','manisan',81,61),
(2,85,'2021-04-06 09:21:34','selai',82,62),
(3,90,'2021-04-08 13:22:10','sirup',83,63),
(4,89,'2021-04-09 12:26:22','teh',84,64);

/*Table structure for table `pemesanan_produk` */

DROP TABLE IF EXISTS `pemesanan_produk`;

CREATE TABLE `pemesanan_produk` (
  `idpemesanan` int(10) NOT NULL,
  `jlh_pesanan` int(10) DEFAULT NULL,
  `jenis_produk` enum('teh','manisan','sirup','selai') DEFAULT NULL,
  `tgl_pemesanan` datetime DEFAULT NULL,
  PRIMARY KEY (`idpemesanan`),
  KEY `fkpesan` (`jenis_produk`),
  CONSTRAINT `fkpesan` FOREIGN KEY (`jenis_produk`) REFERENCES `produk` (`jenis_produk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pemesanan_produk` */

insert  into `pemesanan_produk`(`idpemesanan`,`jlh_pesanan`,`jenis_produk`,`tgl_pemesanan`) values 
(91,25,'sirup','2021-04-04 09:57:18'),
(92,28,'teh','2021-04-03 08:57:41'),
(93,30,'selai','2021-04-04 09:58:07'),
(94,30,'manisan','2021-04-05 12:25:27');

/*Table structure for table `penjadwalan_cafe` */

DROP TABLE IF EXISTS `penjadwalan_cafe`;

CREATE TABLE `penjadwalan_cafe` (
  `id_jadwal_cafe` int(10) NOT NULL,
  `tanggal_pesan` datetime DEFAULT NULL,
  `tanggal_pengiriman` datetime DEFAULT NULL,
  `jumlah_produk` int(11) DEFAULT NULL,
  `jenis_produk` enum('teh','manisan','sirup','selai') DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_cafe`),
  KEY `fkjadwal` (`jenis_produk`),
  CONSTRAINT `fkjadwal` FOREIGN KEY (`jenis_produk`) REFERENCES `produk` (`jenis_produk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `penjadwalan_cafe` */

insert  into `penjadwalan_cafe`(`id_jadwal_cafe`,`tanggal_pesan`,`tanggal_pengiriman`,`jumlah_produk`,`jenis_produk`) values 
(11,'2021-04-04 09:57:18','2021-04-05 11:27:37',25,'sirup'),
(12,'2021-04-03 08:57:41','2021-04-04 09:28:12',28,'teh'),
(13,'2021-04-05 09:58:07','2021-04-06 10:28:54',30,'selai'),
(14,'2021-04-05 12:25:27','2021-04-06 14:29:31',30,'manisan');

/*Table structure for table `pesan_bunga` */

DROP TABLE IF EXISTS `pesan_bunga`;

CREATE TABLE `pesan_bunga` (
  `idpesan` int(10) NOT NULL,
  `jlh_pesanan` int(10) DEFAULT NULL,
  `tgl_pesanan` datetime DEFAULT NULL,
  PRIMARY KEY (`idpesan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pesan_bunga` */

insert  into `pesan_bunga`(`idpesan`,`jlh_pesanan`,`tgl_pesanan`) values 
(81,40,'2021-04-04 07:54:03'),
(82,35,'2021-04-05 09:54:25'),
(83,48,'2021-04-05 08:54:46'),
(84,52,'2021-04-06 08:55:08');

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `kode_produk` int(10) NOT NULL,
  `tgl_produksi` datetime DEFAULT NULL,
  `jenis_produk` enum('teh','manisan','sirup','selai') DEFAULT NULL,
  `tgl_kadaluarsa` datetime DEFAULT NULL,
  `harga_produk` int(10) DEFAULT NULL,
  `kode_barcode` char(50) DEFAULT NULL,
  PRIMARY KEY (`kode_produk`),
  KEY `fkproduk2` (`jenis_produk`),
  KEY `kode_barcode` (`kode_barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `produk` */

insert  into `produk`(`kode_produk`,`tgl_produksi`,`jenis_produk`,`tgl_kadaluarsa`,`harga_produk`,`kode_barcode`) values 
(61,'2021-03-30 08:12:31','manisan','2022-04-30 12:12:46',150000,'55169'),
(62,'2021-03-31 08:13:37','selai','2022-04-30 11:13:50',100000,'55170'),
(63,'2021-03-31 10:14:18','sirup','2022-04-29 11:14:31',120000,'55171'),
(64,'2021-03-30 09:15:00','teh','2022-04-29 10:15:17',130000,'55172');

/*Table structure for table `validasi` */

DROP TABLE IF EXISTS `validasi`;

CREATE TABLE `validasi` (
  `id_validasi` int(10) NOT NULL,
  `tgl_scan_produk` datetime DEFAULT NULL,
  `kode_barcode` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_validasi`),
  KEY `fkvalidasi` (`kode_barcode`),
  CONSTRAINT `fkvalidasi` FOREIGN KEY (`kode_barcode`) REFERENCES `produk` (`kode_barcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `validasi` */

insert  into `validasi`(`id_validasi`,`tgl_scan_produk`,`kode_barcode`) values 
(71,'2021-04-01 11:15:55','55169'),
(72,'2021-04-01 13:16:20','55170'),
(73,'2021-04-02 08:16:42','55171'),
(74,'2021-04-02 10:17:04','55172');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
