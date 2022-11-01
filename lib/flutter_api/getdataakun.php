<?php
header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

$queryResult = $koneksi->query("SELECT * FROM akun");

$result = array();

while($fetchData=$queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

echo json_encode($result);

?>