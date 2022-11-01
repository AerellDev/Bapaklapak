// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:bapaklapak/screen/shop.dart';
import 'package:bapaklapak/tambahan.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class BarangProvider with ChangeNotifier {
  List _barang = [];

  List get barang => _barang;

  int get jumlahBarang => _barang.length;

  ambilBarangDariDatabase() async {
    Uri urlAPI = Uri.parse(
        "https://bapaklapak.000webhostapp.com/flutter_api/getdatabarang.php");

    var hasil = await http.get(urlAPI);

    if (hasil.statusCode == 200) {
      _barang = json.decode(hasil.body);
      print("Berhasil Mengambil Barang Dari Database");
      notifyListeners();
    } else {
      print("Gagal Mengambil Barang Dari Database");
      notifyListeners();
    }
  }

  cariBarang(String cari) async {
    Uri urlAPI = Uri.parse(
        "https://bapaklapak.000webhostapp.com/flutter_api/getdatabarang.php?cari=$cari");

    var hasil = await http.get(urlAPI);

    if (hasil.statusCode == 200) {
      _barang = json.decode(hasil.body);
      print("Berhasil Mengambil Barang Dari Database");
      notifyListeners();
    } else {
      print("Gagal Mengambil Barang Dari Database");
      notifyListeners();
    }
  }

  hapusBarang(BuildContext context, int idBarang) async {
    lodingDoang(context, 'Menghapus', 500);

    Uri urlAPI = Uri.parse(
        "https://bapaklapak.000webhostapp.com/flutter_api/hapus_barang.php?hapus_id=$idBarang");

    Timer(
      Duration(milliseconds: 500),
      () async {
        var hasil = await http.get(urlAPI);
        notifDoang(context, hasil.body, 700);

        ambilBarangDariDatabase();

        Navigator.of(context).pop();
      },
    );
  }

  Future tambahBarang(
      BuildContext context,
      String nama_barang,
      String harga_barang,
      XFile foto_barang,
      String stok,
      String deskripsi) async {
    Uri urlAPI = Uri.parse(
        "https://bapaklapak.000webhostapp.com/flutter_api/tambah_barang.php");

    var hasil = await http.MultipartRequest('POST', urlAPI);

    var image = await http.MultipartFile.fromPath('foto_barang', foto_barang.path);

    if (foto_barang != null) {
      hasil.fields['nama_barang'] = nama_barang;
      hasil.fields['harga_barang'] = harga_barang;
      hasil.fields['stok'] = stok;
      hasil.fields['deskripsi'] = deskripsi;

      hasil.files.add(image);

      await hasil.send().then((result) {
        http.Response.fromStream(result).then((response) {
          notifDoang(context, response.body, 700);
        });
      });
    }
  }

  Future editBarangPakeGambar(
      BuildContext context,
      String id,
      String nama_barang,
      String harga_barang,
      XFile foto_barang,
      String stok,
      String deskripsi) async {
    Uri urlAPI = Uri.parse(
        "https://bapaklapak.000webhostapp.com/flutter_api/edit_barang.php");

    var hasil = await http.MultipartRequest('POST', urlAPI);

    var image = await http.MultipartFile.fromPath('foto_barang', foto_barang.path);

    if (foto_barang != null) {
      hasil.fields['ganti_gambar'] = "";
      hasil.fields['id'] = id;
      hasil.fields['nama_barang'] = nama_barang;
      hasil.fields['harga_barang'] = harga_barang;
      hasil.fields['stok'] = stok;
      hasil.fields['deskripsi'] = deskripsi;

      hasil.files.add(image);

      await hasil.send().then((result) {
        http.Response.fromStream(result).then((response) {
          notifDoang(context, response.body, 700);
        });
      });
    }
  }

  Future editBarangTanpaGambar(
      BuildContext context,
      String id,
      String nama_barang,
      String harga_barang,
      String foto,
      String stok,
      String deskripsi) async {
    Uri urlAPI = Uri.parse(
        "https://bapaklapak.000webhostapp.com/flutter_api/edit_barang.php");

    var hasil = await http.MultipartRequest('POST', urlAPI);

      hasil.fields['id'] = id;
      hasil.fields['foto'] = foto;
      hasil.fields['nama_barang'] = nama_barang;
      hasil.fields['harga_barang'] = harga_barang;
      hasil.fields['stok'] = stok;
      hasil.fields['deskripsi'] = deskripsi;

      await hasil.send().then((result) {
        http.Response.fromStream(result).then((response) {
          notifDoang(context, response.body, 700);
        });
      });
  }
}
