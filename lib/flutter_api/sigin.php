<?php

header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

$email = $_GET['email'];
$password = $_GET['sandi'];
$ulangi_password = $_GET['ulangi_sandi'];
$date = $_GET['date'];

$result = mysqli_query($koneksi, "SELECT * FROM akun WHERE email LIKE '%".$email."%'");
$data = mysqli_fetch_array($result,MYSQLI_ASSOC);

if($data['email'] != $email) {
    if(strlen($password) >= 8) {
        if($ulangi_password == $password) {
            $insert = "INSERT INTO akun(email,sandi,type_akun,tanggal_lahir,saldo) VALUES('$email','$password','member','$date','0')";
            mysqli_query($koneksi, $insert);

            echo "Akun berhasil di buat.";
        }else{
            echo "Ulangi password salah.";
        }
    }else{
        echo "Password minimal 8 character.";
    }

}else{
    echo "Email sudah terdaftar";
}

?>