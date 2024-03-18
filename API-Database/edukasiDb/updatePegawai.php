<?php

header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

$res = array();
$id = $_POST['id'];
$nama = $_POST['nama'];
$nobp = $_POST['nobp'];
$nohp = $_POST['nohp'];
$email = $_POST['email'];

$cek = "SELECT * FROM pegawai WHERE email = '$email' AND id != $id";
$result = mysqli_query($koneksi, $cek);
if (mysqli_num_rows($result) > 0) {
    $res['is_success'] = false;
    $res['value'] = 2;
    $res['message'] = "Email telah digunakan oleh pegawai lain. Gagal edit pegawai.";
} else {
    $sql = "UPDATE pegawai SET nama = '$nama', nobp = '$nobp', nohp = '$nohp', email = '$email' WHERE id=$id";
    $isSuccess = $koneksi->query($sql);

    if ($isSuccess) {
        $cek = "SELECT * FROM pegawai WHERE id = $id";
        $result = mysqli_fetch_array(mysqli_query($koneksi, $cek));
        $res['is_success'] = true;
        $res['value'] = 1;
        $res['message'] = "Berhasil edit pegawai";
        $res['nama'] = $result['nama'];
        $res['nobp'] = $result['nobp'];
        $res['nohp'] = $result['nohp'];
        $res['email'] = $result['email'];
        $res['id'] = $result['id'];
    } else {
        $res['is_success'] = false;
        $res['value'] = 0;
        $res['message'] = "Gagal edit pegawai";
    }
}

echo json_encode($res);

?>
