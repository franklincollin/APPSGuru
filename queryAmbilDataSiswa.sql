SELECT kode_sekolah, nis, sandi FROM login where nama_pengguna = "Fikri";
SELECT nama, nis FROM siswa WHERE nis = "11076" AND kode_sekolah = "4102000";
SELECT g.gambar, s.nama, s.nis FROM `gambar_profil_siswa` g, `siswa` s WHERE s.nis = "11076" AND s.kode_sekolah = "4102000" AND g.nama_pengguna = "Fikri";

SELECT s.nama, d.tanggal_waktu, d.keterangan, pl.point_pelanggaran FROM `siswa` s, `data_point_pl_siswa` d, `point_pelanggaran` pl 
WHERE s.nis = ".$nis." AND s.kode_sekolah = ".$schoolCode." AND d.id_point_pl_siswa = ".$dataID[1]."AND pl.id = d.id_point_pl

