<?php

header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

$code = $_GET['code'];

$result = mysqli_query($koneksi, "SELECT * FROM gift_code WHERE code LIKE '%$code%'");
$data = mysqli_fetch_array($result,MYSQLI_ASSOC);

$idakun = $_GET['id'];

$akun = mysqli_query($koneksi, "SELECT * FROM akun WHERE id LIKE $idakun");
$akundata = mysqli_fetch_array($akun,MYSQLI_ASSOC);

if(empty($data)) {
    echo "Gift code salah!";
    exit;
}

if($code == $data['code']) {

    $cal = $data['nominal'] + $akundata['saldo'];

    mysqli_query($koneksi,"UPDATE akun SET saldo='$cal' where id='$idakun'");

    $id = $data['id'];
    mysqli_query($koneksi, "DELETE FROM gift_code WHERE id = '$id'");

    echo "Topup ".text_harga($data['nominal'])." berhasil!";

    exit;
}


?>