<?php

header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

$id = $_GET['id'];
$email = htmlspecialchars($_GET['email']);
$sandi = htmlspecialchars($_GET['sandi']);
$type_akun = $_GET['type_akun'];
$tanggal_lahir = $_GET['tanggal_lahir'];
$saldo = htmlspecialchars($_GET['saldo']);

mysqli_query($koneksi,"UPDATE akun SET email='$email', sandi='$sandi', type_akun='$type_akun', tanggal_lahir='$tanggal_lahir', saldo='$saldo' where id='$id'");

echo 'Data akun berhasil di ubah';

?>