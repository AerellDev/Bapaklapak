import 'dart:async';

import 'package:bapaklapak/widget/dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

//Untuk Membuat Text Uang
textUang(int uang) {
  var u = NumberFormat("#,##0", "id_ID");
  return u.format(uang);
}

//Untuk membuat notif di scafold
notifDoang(BuildContext context, String pesan, int duration) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(pesan),
    duration: Duration(milliseconds: duration),
  ));
}

lodingDoang(BuildContext context, String pesan, int duration) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(
          width: 15,
        ),
        Text(
          pesan,
          style: TextStyle(fontSize: 20),
        )
      ],
    ),
    duration: Duration(milliseconds: duration),
  ));
}

//Cek Koneksi
cekKoneksi(BuildContext context, Function() eksekusi) async {
  var result = await Connectivity().checkConnectivity();

  if(result == ConnectivityResult.none) {
    showDialog(
      context: context,
      builder: (context) {
        return BLDialogKonfirmasi(
          pesan: "Tidak ada koneksi internet",
          textTombolYa: "Coba Lagi",
          tombolYa: () {
            cekKoneksi(context, () {
              
            },);
            Navigator.of(context).pop();
          },
          textTombolTidak: "Keluar",
          tombolTidak: () {
            SystemNavigator.pop();
          },
        );
      },
    );
  }else{
    eksekusi();
  }
}
