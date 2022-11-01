import 'dart:convert';

import 'package:bapaklapak/tambahan.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Akun with ChangeNotifier {

  List _akun = [];

  List get akun => _akun;

  login(BuildContext context, String email, String sandi) async {

    Uri urlApi = Uri.parse("https://bapaklapak.000webhostapp.com/flutter_api/login.php?email=$email&&sandi=$sandi");

    var hasil = await http.get(urlApi);

    if(hasil.body == "email kosong" || hasil.body == "sandi kosong" || hasil.body == "Password kurang dari 8." || hasil.body == "Email atau sandi salah." || hasil.body == "Akun telah di banned") {
      notifDoang(context, hasil.body, 700);
    }else{
      _akun = json.decode(hasil.body);
      print(hasil.body);
      notifDoang(context, 'Login Berhasil', 700);
    }

  }

}