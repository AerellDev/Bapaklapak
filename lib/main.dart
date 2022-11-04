import 'package:bapaklapak/provider/barang_provider.dart';
import 'package:bapaklapak/screen/akun_settings.dart';
import 'package:bapaklapak/screen/login_screen.dart';
import 'package:bapaklapak/screen/shop.dart';
import 'package:bapaklapak/screen/sigin_screen.dart';
import 'package:bapaklapak/screen/splash_screen.dart';
import 'package:bapaklapak/screen/tambah_barang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'provider/akun_provider.dart';
import 'screen/akun_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => BarangProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AkunProvider(),
      )
    ],
    child: const BapakLapak(),
  ));
}

class BapakLapak extends StatelessWidget {
  const BapakLapak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      theme: ThemeData(
          primaryColor: HexColor('DD3B3B'),
          primarySwatch: generateMaterialColor(color: HexColor('DD3B3B'))),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        "/shop": (context) => ShopScreen(),
        "/tambahbarang": (context) => TambahBarangScreen(),
        "/login": (context) => LoginScreen(),
        "/sigin": (context) => SiginScreen(),
        "/akunscreen": (context) => AkunScreen(),
      },
    );
  }
}
