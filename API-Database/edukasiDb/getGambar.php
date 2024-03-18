<?php
include "koneksi.php";

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

$sql = "SELECT * FROM gallery";
$result = $koneksi->query($sql);

if ($result->num_rows > 0) {
    $res['is_success'] = true;
    $res['statusCode'] = 200;
    $res['message'] = "Berhasil mengambil Gambar";
    $res['data'] = array();
    while ($row = $result->fetch_assoc()) {
        $res['data'][] = $row;
    }
    // http_response_code(200); // Set status code 200 OK
} else {
    $res['is_success'] = false;
    $res['message'] = "Gagal Mengambil Gambar";
    $res['data'] = null;
    // http_response_code(404); // Set status code 404 Not Found
}

// Set header untuk mengizinkan akses dari domain yang berbeda
header('Content-Type: application/json');
echo json_encode($res);
$koneksi->close();