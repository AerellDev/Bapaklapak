import 'dart:async';

import 'package:bapaklapak/tambahan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    cekKoneksi().then((value) {
      if(value) {
        Timer(Duration(seconds: 1), () {
          Navigator.of(context).pushReplacementNamed('/shop');
        },);
      }
    });

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset(
              "assets/images/splash_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          Image.asset("assets/images/splash_lg.png"),
          Positioned(bottom: 100, child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
