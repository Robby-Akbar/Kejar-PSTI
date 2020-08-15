//Input Data Master
INSERT INTO tbl_panitia (nama_panitia, username, password, role)
VALUES ('Robby Akbar', 'robbyakbar', '123456', 'keamanan');

INSERT INTO tbl_jurusan (nama_jurusan) VALUES
('Pendidikan Sistem dan Teknologi Informasi');

INSERT INTO tbl_kelompok (nama_kelompok, id_panitia) VALUES
('Linux', 1);

INSERT INTO tbl_mahasiswa (nama_mahasiswa, id_jurusan, id_kelompok) VALUES
('Meri Rahmawati', 1, 2);

//Login
SELECT * FROM tbl_panitia WHERE username = 'robbyakbar1';

//Panitia Evalit buat Peraturan
INSERT INTO tbl_peraturan (isi_peraturan, jenis_pelanggaran) VALUES
('Harus Menghidupan WebCam', 'ringan');

//Menampilkan Semua Peraturan
SELECT * FROM tbl_peraturan;
//Menampilkan Peraturan Berdasarkan jenis
SELECT * FROM tbl_peraturan WHERE jenis_pelanggaran = 'ringan';
//Menampilkan Peraturan diurut Berdasarkan jenis (ringan, sedang, berat)
SELECT * FROM tbl_peraturan ORDER BY jenis_pelanggaran;

//Menampilkan Kelompok
SELECT * FROM tbl_kelompok ORDER BY nama_kelompok;

//Menampilkan Mahasiswa Berdasarkan id_kelompok
SELECT * FROM tbl_mahasiswa WHERE id_kelompok = 2 ORDER BY nama_mahasiswa;

//Menginput Pelanggaran
INSERT INTO tbl_pelanggaran (id_mahasiswa, id_peraturan, id_panitia) VALUES
(1, 1, 1);

//Menampilkan Pelanggaran
SELECT * FROM tbl_pelanggaran;
//Menampilkan Jurusan
SELECT * FROM tbl_jurusan ORDER BY nama_jurusan;
//Menampilkan Pelanggaran Berdasarkan Jurusan
SELECT tbl_pelanggaran.id_pelanggaran, tbl_mahasiswa.nama_mahasiswa, tbl_peraturan.isi_peraturan, tbl_peraturan.jenis_pelanggaran, tbl_pelanggaran.tgl_pelanggaran FROM tbl_pelanggaran
INNER JOIN tbl_mahasiswa ON tbl_pelanggaran.id_mahasiswa = tbl_mahasiswa.id_mahasiswa
INNER JOIN tbl_peraturan ON tbl_pelanggaran.id_peraturan = tbl_peraturan.id_peraturan
WHERE tbl_mahasiswa.id_jurusan = 2;
//Menampilkan Pelanggaran Berdasarkan Kelompok
SELECT tbl_pelanggaran.id_pelanggaran, tbl_mahasiswa.nama_mahasiswa, tbl_peraturan.isi_peraturan, tbl_peraturan.jenis_pelanggaran, tbl_pelanggaran.tgl_pelanggaran FROM tbl_pelanggaran
INNER JOIN tbl_mahasiswa ON tbl_pelanggaran.id_mahasiswa = tbl_mahasiswa.id_mahasiswa
INNER JOIN tbl_peraturan ON tbl_pelanggaran.id_peraturan = tbl_peraturan.id_peraturan
WHERE tbl_mahasiswa.id_kelompok = 2;
//Menampilkan Pelanggaran Berdasarkan Jenis Pelanggaran
SELECT tbl_pelanggaran.id_pelanggaran, tbl_mahasiswa.nama_mahasiswa, tbl_peraturan.isi_peraturan, tbl_peraturan.jenis_pelanggaran, tbl_pelanggaran.tgl_pelanggaran FROM tbl_pelanggaran
INNER JOIN tbl_mahasiswa ON tbl_pelanggaran.id_mahasiswa = tbl_mahasiswa.id_mahasiswa
INNER JOIN tbl_peraturan ON tbl_pelanggaran.id_peraturan = tbl_peraturan.id_peraturan
WHERE tbl_peraturan.jenis_pelanggaran = 'ringan'
//Menampilkan Pelanggaran Berdasarkan Tanggal Pelanggaran
SELECT tbl_pelanggaran.id_pelanggaran, tbl_mahasiswa.nama_mahasiswa, tbl_peraturan.isi_peraturan, tbl_peraturan.jenis_pelanggaran, tbl_pelanggaran.tgl_pelanggaran FROM tbl_pelanggaran
INNER JOIN tbl_mahasiswa ON tbl_pelanggaran.id_mahasiswa = tbl_mahasiswa.id_mahasiswa
INNER JOIN tbl_peraturan ON tbl_pelanggaran.id_peraturan = tbl_peraturan.id_peraturan
WHERE tbl_pelanggaran.tgl_pelanggaran LIKE '2020-08-14%'

//Menghitung Jumlah Pelanggaran Berdasarkan Jenis
SELECT COUNT(tbl_peraturan.jenis_pelanggaran), tbl_peraturan.jenis_pelanggaran FROM tbl_pelanggaran
INNER JOIN tbl_peraturan ON tbl_pelanggaran.id_peraturan = tbl_peraturan.id_peraturan
GROUP BY tbl_peraturan.jenis_pelanggaran

//Menghitung Jumlah Pelanggaran Berdasarkan Jenis dari Jurusan Tertentu
SELECT COUNT(tbl_peraturan.jenis_pelanggaran), tbl_peraturan.jenis_pelanggaran FROM tbl_pelanggaran
INNER JOIN tbl_peraturan ON tbl_pelanggaran.id_peraturan = tbl_peraturan.id_peraturan
INNER JOIN tbl_mahasiswa ON tbl_pelanggaran.id_mahasiswa = tbl_mahasiswa.id_mahasiswa
WHERE tbl_mahasiswa.id_jurusan = 2 //WHERE tbl_mahasiswa.id_kelompok = 2
GROUP BY tbl_peraturan.jenis_pelanggaran

//dst...
