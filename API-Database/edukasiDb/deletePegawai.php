<?php

    header("Access-Control-Allow-Origin: header");
    header("Access-Control-Allow-Origin: *");

    include 'koneksi.php';

    $id = $_POST['id'];

	$sql = "DELETE FROM pegawai WHERE id = $id";
	$result = $koneksi->query($sql);

	if($result) {
		$response['isSuccess'] = true;
		$response['message'] = "Berhasil Menghapus Data Pegawai";
		// $response['data'] = array();
		// while ($row = $result->fetch_assoc()) {
		// 	$response['data'][] = $row;
		// }
	} else {
		$response['isSuccess'] = false;
		$response['message'] = "Gagal Menghapus Data Pegawai";
		// $response['data'] = null;
	}
	echo json_encode($response);


?>