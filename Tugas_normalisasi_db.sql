USE pelita_dunia_electric;

CREATE TABLE reff_toko(
id INT PRIMARY KEY AUTO_INCREMENT,
nama VARCHAR (100) UNIQUE,
logo VARCHAR (100),
alamat VARCHAR (100),
tlp TINYINT
);
SHOW TABLES ;
SELECT * FROM reff_toko;
DESCRIBE reff_toko;

CREATE TABLE reff_karyawan (
id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
id_jabatan INT,
id_bank INT,
NIK INT UNIQUE,
nama VARCHAR (100),
alamat VARCHAR (200),
no_hp TINYINT,
email VARCHAR (50),
username VARCHAR (20) UNIQUE,
pasword VARCHAR (60),
no_rek INT,
stats ENUM ('aktif','nonaktif')
);
ALTER TABLE reff_karyawan ADD FOREIGN KEY (id_jabatan) REFERENCES reff_jabatan (id_jabatan);
SELECT * FROM reff_karyawan;
DESCRIBE reff_karyawan;

CREATE TABLE reff_jabatan (
id_jabatan INT PRIMARY KEY AUTO_INCREMENT,
nama_jabatan VARCHAR (50),
stats ENUM ('aktif','nonaktif')
);
SELECT * FROM reff_jabatan;

DROP TABLE reff_pos;
CREATE TABLE reff_pos (
id_pos INT PRIMARY KEY AUTO_INCREMENT,
nama_pos VARCHAR(50),
stats ENUM ('aktif','no_aktif')
);
DESCRIBE reff_pos;
SELECT * FROM reff_pos;

CREATE TABLE reff_satuan (
id_satuan INT PRIMARY KEY AUTO_INCREMENT,
nama_satuan VARCHAR (20),
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);
DESCRIBE reff_satuan;
SELECT * FROM reff_satuan;

DROP TABLE reff_gudang;
CREATE TABLE reff_gudang (
id_gudang INT PRIMARY KEY AUTO_INCREMENT,
id_rak INT ,
nama VARCHAR (50),
jml_lantai INT,
alamat_gudang VARCHAR (200),
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);

DESCRIBE reff_gudang;
ALTER TABLE reff_gudang ADD id_suplier INT;
ALTER TABLE reff_gudang ADD FOREIGN KEY (id_suplier) REFERENCES reff_suplier (id_suplier);
ALTER TABLE reff_gudang ADD FOREIGN KEY (id_rak) REFERENCES reff_rak (id_rak);
SELECT * FROM reff_gudang;

CREATE TABLE reff_rak (
id_rak INT PRIMARY KEY AUTO_INCREMENT,
id_gudang INT,
nama_rak VARCHAR (20),
no_rak INT,
jml_tingkat INT,
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);

DESCRIBE reff_rak;
ALTER TABLE reff_rak ADD FOREIGN KEY (id_gudang) REFERENCES reff_gudang(id_gudang);

CREATE TABLE reff_barang (

id_barang INT PRIMARY KEY AUTO_INCREMENT,
id_rak INT  NOT NULL,
id_satuan INT NOT NULL,
barcode VARCHAR (20),
jenis_barang VARCHAR (30),
nama_barang VARCHAR (50),
keterangan VARCHAR (100),
stok INT,
stats ENUM ('aktif','no_aktif')

);

ALTER TABLE reff_barang ADD FOREIGN KEY (id_rak) REFERENCES reff_rak(id_rak);
ALTER TABLE reff_barang ADD FOREIGN KEY (id_satuan) REFERENCES reff_satuan(id_satuan);

DESCRIBE reff_barang;

DROP TABLE reff_suplier;

CREATE TABLE reff_suplier (
id_suplier INT NOT NULL,
id_barang INT,
nama_suplier VARCHAR (50),
no_tlp TINYINT,
alamat_suplier VARCHAR (100),
no_rekening INT,
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);

DESC reff_suplier;
ALTER TABLE reff_barang ADD FOREIGN KEY (id_rak) REFERENCES reff_rak(id_rak);

CREATE TABLE reff_bank (
id_bank INT PRIMARY KEY AUTO_INCREMENT,
nama_bank VARCHAR (50),
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);

DESC reff_bank;

CREATE TABLE reff_pelanggan (
id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
NIK INT (16) UNIQUE,
nama_pelanggan VARCHAR (50),
alamat_pelanggan VARCHAR (100),
no_hp TINYINT,
email VARCHAR (50),
poin INT,
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);

DESC reff_pelanggan;


CREATE TABLE reff_transaksi (
id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
id_pelanggan INT,
id_barang INT,
tgl_transaksi DATE,
no_struk INT,
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);

DESC reff_transaksi;
ALTER TABLE reff_transaksi ADD FOREIGN KEY (id_pelanggan) REFERENCES reff_pelanggan(id_pelanggan);
ALTER TABLE reff_transaksi ADD FOREIGN KEY (id_barang) REFERENCES reff_barang(id_barang);

CREATE TABLE reff_diskon (
id_diskon INT PRIMARY KEY AUTO_INCREMENT,
nilai_diskon INT,
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);

DESC reff_diskon;

CREATE TABLE reff_footer (
id_footer INT PRIMARY KEY AUTO_INCREMENT,
isi_footer VARCHAR (200),
keterangan VARCHAR (100),
stats ENUM ('aktif','no_aktif')
);

DESC reff_footer;
