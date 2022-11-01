<?php

header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

//Ngecek Stok Barang
$id_barang = $_GET['beli'];
$barang_query = mysqli_query($koneksi, "SELECT * FROM barang WHERE id LIKE '%$id_barang%'");
$barang = mysqli_fetch_array($barang_query,MYSQLI_ASSOC);
$harga_barang = $barang['harga'];

if($barang['stok'] == 0) {
    echo "Stok barang habis.";
    exit;
}

//Ngecek Saldo Akun
$id_akun = $_GET['id'];
$akun_query = mysqli_query($koneksi, "SELECT * FROM akun WHERE id LIKE $id_akun");
$akun = mysqli_fetch_array($akun_query,MYSQLI_ASSOC);

if($akun['saldo'] >= $harga_barang) {
    $saldo_akun = $akun['saldo'] - $barang['harga'];
    mysqli_query($koneksi,"UPDATE akun SET saldo='$saldo_akun' where id='$id_akun'");

    $stok_barang = $barang['stok'] - 1;
    mysqli_query($koneksi,"UPDATE barang SET stok='$stok_barang' where id='$id_barang'");
    echo "Pembelian berhasil!";
    exit;
}else{
    echo "Saldo kamu kurang.";
    exit;
}

?>