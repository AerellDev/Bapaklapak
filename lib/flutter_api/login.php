<?php

header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

if(!isset($_GET['email'])) {
    echo "email kosong";
    exit;
}else{
    $email = htmlspecialchars($_GET['email']);
}

if(!isset($_GET['sandi'])) {
    echo "sandi kosong";
    exit;
}else{
    $password = htmlspecialchars($_GET['sandi']);
}

$result = mysqli_query($koneksi, "SELECT * FROM akun WHERE email LIKE '%".$email."%' AND sandi LIKE '%".$password."%'");
$data = mysqli_fetch_array($result,MYSQLI_ASSOC);

if(!strlen($password) >= 8) {
    echo "Password kurang dari 8.";
    exit;
}

if($data['email'] != $email && $data['sandi'] != $password) {
    echo "Email atau sandi salah.";
        exit;
}

if($data['type_akun'] == 'banned'){
    echo "Akun telah di banned";
    exit;
}else{
    echo json_encode($data);
    exit;
}

?>