<?php

header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

$id = $_GET['hapus_id'];

$hasil = mysqli_query($koneksi, "DELETE FROM barang WHERE id = '$id'");

if($hasil) {
    echo 'Barang berhasil di hapus.';
}else{
    echo 'Barang tidak berhasil di hapus.';
}

?>