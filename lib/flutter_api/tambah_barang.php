<?php

header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

// var_dump($_POST);
// var_dump($_FILES);

$nama_barang = htmlspecialchars($_POST['nama_barang']);
$harga_barang = $_POST['harga_barang'];

$foto = $_FILES["foto_barang"]['name'];
$ukuranfile = $_FILES["foto_barang"]["size"];
$tmp_name = $_FILES['foto_barang']['tmp_name'];

$stok = $_POST['stok'];
$deskripsi = htmlspecialchars($_POST['deskripsi']);

$extensiGambarValid = ['jpg', 'jpeg', 'png'];
$extensiGambar = explode('.', $foto);
$extensiGambar = strtolower(end($extensiGambar));

if(!in_array($extensiGambar, $extensiGambarValid)) {
    echo 'File harus gambar';
    return false;
}

if($ukuranfile > 10000000) {
    echo 'File terlalu besar';
    return false;
}

$fileNamaBaru = uniqid();
$foto = $fileNamaBaru.'.'.$extensiGambar;

move_uploaded_file($tmp_name,"../assets/img/$foto");

$insert = "INSERT INTO barang(nama,harga,foto,stok,deskripsi) VALUES('$nama_barang','$harga_barang','$foto','$stok','$deskripsi')";
mysqli_query($koneksi, $insert);

echo "Barang berhasil di tambahkan.";

// //Data image
// $nama = $_GET['nama'];
// $harga = $_GET['harga'];
// $stok = $_GET['stok'];
// $deskripsi = $_GET['deskripsi'];

// //get image name
// $image = $_FILES['image']['name']; 

// //create date now
// $date = date('Y-m-d');

// //make image path
// $imagePath = '../assets/img/'.$foto; 

// $tmp_name = $_FILES['image']['tmp_name']; 

// //move image to images folder
// move_uploaded_file($tmp_name, $imagePath);

// $insert = "INSERT INTO barang(nama,harga,foto,stok,deskripsi) VALUES('$nama_barang','$harga_barang','$image','$stok','$deskripsi')";

// $result = mysqli_query($koneksi, $insert);

// if($result){
//     echo json_encode([
//         'message' => 'Barang berhasil di tambahkan.'
//     ]);
// }else{
//     echo json_encode([
//         'message' => 'Barang gagal di tambahkan.'
//     ]);
// }

?>