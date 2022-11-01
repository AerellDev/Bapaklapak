<?php

header("Access-Control-Allow-Origin: *");
include '../php/aerell.php';

if(isset($_POST['ganti_gambar'])) {
    
    $id = $_POST['id'];
    $nama = htmlspecialchars($_POST['nama_barang']);
    $harga = $_POST['harga_barang'];
    
    $foto = $_FILES["foto_barang"]['name'];
    $ukuranfile = $_FILES["foto_barang"]["size"];
    $tmp_name = $_FILES['foto_barang']['tmp_name'];
    
    $stok = $_POST['stok'];
    $deskripsi = htmlspecialchars($_POST['deskripsi']);
    
    $extensiGambarValid = ['jpg', 'jpeg', 'png'];
    $extensiGambar = explode('.', $foto);
    $extensiGambar = strtolower(end($extensiGambar));

    if(!in_array($extensiGambar, $extensiGambarValid)) {
        echo '<script>
        alert("File Harus Gambar");
        </script>';
        return false;
    }
    
    if($ukuranfile > 10000000) {
        echo '<script>
        alert("File Terlalu Besar");
        </script>';
        return false;
    }
    
    $fileNamaBaru = uniqid();
    $foto = $fileNamaBaru.'.'.$extensiGambar;
    
    move_uploaded_file($tmp_name,"../assets/img/$foto");

}else{
    $id = $_POST['id'];
    $nama = $_POST['nama_barang'];
    $harga = $_POST['harga_barang'];
    $foto = $_POST['foto'];
    $stok = $_POST['stok'];
    $deskripsi = $_POST['deskripsi'];
}

if(mysqli_query($koneksi,"UPDATE barang SET nama='$nama', harga='$harga', foto='$foto', stok='$stok', deskripsi='$deskripsi' where id='$id'")) {
    echo 'Data barang berhasil di edit.';
}else{
    echo 'Data barang gagal di edit.';
}

?>