<?php
header("Access-Control-Allow-Origin: *");

include '../php/aerell.php';

if(isset($_GET['cari'])) {
    $cari = $_GET['cari'];
    $queryResult = $koneksi->query("SELECT * FROM barang WHERE nama LIKE '%".$cari."%' OR harga LIKE '%".$cari."%' OR id LIKE '%".$cari."%'");
}else{
    $queryResult = $koneksi->query("SELECT * FROM barang");
}

$result = array();

while($fetchData=$queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

echo json_encode($result);

?>