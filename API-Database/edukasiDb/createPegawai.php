<?php

  header("Access-Control-Allow-Origin: header");
  header("Access-Control-Allow-Origin: *");

  include 'koneksi.php';

  $response = array();
  // $id = $_POST['id'];
  $nama = $_POST['nama'];
  $nobp = $_POST['nobp'];
  $nohp = $_POST['nohp'];
  $email = $_POST['email'];
  
  $cek = "SELECT * FROM pegawai WHERE email = '$email'";
	$result = mysqli_fetch_array(mysqli_query($koneksi, $cek));

  if(isset($result)){
		$response['value'] = 2;
		$response['message'] = "email telah digunakan";
		echo json_encode($response);
	} else {
		$insert = "INSERT INTO pegawai (nama, nobp, nohp, email, tgl_input) VALUES ('$nama', '$nobp', '$nohp', '$email', NOW())";
		if(mysqli_query($koneksi, $insert)){
			$response['value'] = 1;
			$response['message'] = "Berhasil tambah data pegawai";
			echo json_encode($response);
		} else {
			$response['value'] = 0;
			$response['message'] = "Gagal tambah data pegawai";
			echo json_encode($response);
		}
	}


?>
