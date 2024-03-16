<?php

  header("Access-Control-Allow-Origin: header");
  header("Access-Control-Allow-Origin: *");

  include 'koneksi.php';

  // $id = $_POST['id'];
  $nama = $_POST['nama'];
  $nobp = $_POST['nobp'];
  $nohp = $_POST['nohp'];
  $email = $_POST['email'];

  $sql = "INSERT INTO pegawai (nama, nobp, nohp, email, tgl_input) VALUES ('$nama', '$nobp', '$nohp', '$email', NOW())"; 
  $isSuccess = $koneksi->query($sql);

  if ($isSuccess) {

    // $result = mysqli_fetch_array(mysqli_query($koneksi));
    $res['is_success'] = true;
    $res['value'] = 1;
    $res['message'] = "Berhasil tambah data pegawai";
  } else {
    $res['is_success'] = false;
    $res['value'] = 0;
    $res['message'] = "Gagal tambah data pegawai";
  }
  echo json_encode($res);


?>
