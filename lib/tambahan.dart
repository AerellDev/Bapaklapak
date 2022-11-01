import 'package:bapaklapak/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

//Untuk Membuat Text Uang
textUang(int uang) {
  var u = NumberFormat("#,##0", "id_ID");
  return u.format(uang);
}

//Untuk membuat notif di scafold
notifDoang(BuildContext context, String pesan, int duration) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan), duration: Duration(milliseconds: duration),));
}

lodingDoang(BuildContext context, String pesan, int duration) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(children: [
      CircularProgressIndicator(),
      SizedBox(width: 15,),
      Text(pesan, style: TextStyle(fontSize: 20),)
    ],), 
    duration: Duration(milliseconds: duration),));
}

//Cek Koneksi
Future<bool> cekKoneksi() async {
    bool result = await InternetConnectionChecker().hasConnection;
    
    if(!result) {
      BLDialogKonfirmasi(
        pesan: 'Tidak ada koneksi internet', 
        tombolYa: () {
          cekKoneksi();
        }, 
        textTombolYa: "Coba lagi",
      );
      return false;
    }else{
      return true;
    }

}