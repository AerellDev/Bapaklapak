import 'dart:convert';

import 'package:bapaklapak/tambahan.dart';
import 'package:bapaklapak/widget/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AkunProvider with ChangeNotifier {
  dynamic _akun;

  dynamic get akun => _akun;

  bool isLogin = false;

  login(BuildContext context, String email, String sandi) async {
    Uri urlApi = Uri.parse(
        "https://bapaklapak.000webhostapp.com/flutter_api/login.php?email=$email&&sandi=$sandi");

    var hasil = await http.get(urlApi);

    if (hasil.body != "email kosong" &&
        hasil.body != "" &&
        hasil.body != "sandi kosong" &&
        hasil.body != "Password kurang dari 8." &&
        hasil.body != "Email atau sandi salah." &&
        hasil.body != "Akun telah di banned") {
      if (_akun == null) {
        _akun = json.decode(hasil.body);

        if (_akun != null) {
          isLogin = true;
          notifDoang(context, "Login berhasil!", 700);
          notifyListeners();
          Navigator.of(context).pushReplacementNamed("/shop");
        }
      }
    } else {
      notifDoang(context, hasil.body, 700);
    }
  }

  sigin(BuildContext context, String email, String sandi, String ulangiSandi,
      String date) async {
    Uri urlApi = Uri.parse(
        "https://bapaklapak.000webhostapp.com/flutter_api/sigin.php?email=$email&&sandi=$sandi&&ulangi_sandi=$ulangiSandi&&date=$date");

    var hasil = await http.get(urlApi);

    if (hasil.body == "Password minimal 8 character.") {
      notifDoang(context, "Password minimal 8 character", 700);
    } else if (hasil.body == "Ulangi password salah.") {
      notifDoang(context, "Ulangi password salah.", 700);
    } else if (hasil.body == "Email sudah terdaftar.") {
      notifDoang(context, "Email sudah terdaftar.", 700);
    } else if (hasil.body == "Akun berhasil di buat.") {
      notifDoang(context, "Akun berhasil di buat.", 700);
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      notifDoang(context, hasil.body, 700);
    }
  }

  logout() {
    _akun = null;
    isLogin = false;
    notifyListeners();
  }
}
