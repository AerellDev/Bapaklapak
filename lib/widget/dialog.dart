import 'package:bapaklapak/tambahan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../provider/akun_provider.dart';

class BLDialogKonfirmasi extends StatelessWidget {
  String pesan;
  String textTombolYa;
  String textTombolTidak;
  Function() tombolYa;
  Function() tombolTidak;

  BLDialogKonfirmasi(
      {super.key,
      required this.pesan,
      required this.tombolYa,
      required this.tombolTidak,
      this.textTombolYa = "Ya",
      this.textTombolTidak = "Tidak"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 285,
            width: 373,
            decoration: BoxDecoration(
                color: HexColor("F0F3F3"),
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: HexColor("000000"),
                      offset: const Offset(5, 5))
                ]),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    pesan,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Divider(
                    height: 30,
                  ),
                  SizedBox(
                      height: 42,
                      width: 331,
                      child: ElevatedButton(
                          onPressed: () {
                            tombolYa();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            textTombolYa,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      height: 42,
                      width: 331,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(HexColor("969696")),
                          ),
                          onPressed: () {
                            tombolTidak();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            textTombolTidak,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BLDialogPemberitahuanWithLink extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Tidak dapat memuat link $url";
    }
  }

  String pesan;
  String textLink;
  String link;
  String textTombolOk;
  Function() tombolOk;

  BLDialogPemberitahuanWithLink({
    super.key,
    required this.pesan,
    required this.tombolOk,
    this.textTombolOk = "Oke",
    required this.textLink,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 255,
            width: 373,
            decoration: BoxDecoration(
                color: HexColor("F0F3F3"),
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: HexColor("000000"),
                      offset: const Offset(5, 5))
                ]),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    pesan,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL("bapaklapak.000webhostapp.com");
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      textLink,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 203, 53, 42)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Divider(
                    height: 30,
                  ),
                  SizedBox(
                      height: 42,
                      width: 331,
                      child: ElevatedButton(
                          onPressed: () {
                            tombolOk();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            textTombolOk,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BLDialogPemberitahuan extends StatelessWidget {
  String pesan;
  String textTombolOk;
  Function() tombolOk;

  BLDialogPemberitahuan(
      {super.key,
      required this.pesan,
      required this.tombolOk,
      this.textTombolOk = "Oke"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 235,
            width: 373,
            decoration: BoxDecoration(
                color: HexColor("F0F3F3"),
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: HexColor("000000"),
                      offset: const Offset(5, 5))
                ]),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    pesan,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Divider(
                    height: 30,
                  ),
                  SizedBox(
                      height: 42,
                      width: 331,
                      child: ElevatedButton(
                          onPressed: () {
                            tombolOk();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            textTombolOk,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BLDialogPickImage extends StatelessWidget {
  Function() tombolGaleri;
  Function() tombolCamera;

  BLDialogPickImage(
      {super.key, required this.tombolGaleri, required this.tombolCamera});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 285,
            width: 373,
            decoration: BoxDecoration(
                color: HexColor("F0F3F3"),
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: HexColor("000000"),
                      offset: const Offset(5, 5))
                ]),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Ambil Foto Dari",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Divider(
                    height: 30,
                  ),
                  SizedBox(
                      height: 42,
                      width: 331,
                      child: ElevatedButton(
                          onPressed: () {
                            tombolGaleri();
                          },
                          child: const Text(
                            "Galeri",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      height: 42,
                      width: 331,
                      child: ElevatedButton(
                          onPressed: () {
                            tombolCamera();
                          },
                          child: const Text(
                            "Camera",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BLDialogTopUp extends StatelessWidget {
  BLDialogTopUp({super.key});

  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final akunProvider = Provider.of<AkunProvider>(context, listen: false);
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        height: 250,
        width: 373,
        decoration: BoxDecoration(
            color: HexColor("F0F3F3"),
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: HexColor("000000"),
                  offset: const Offset(5, 5))
            ]),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  Isi Saldo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "       Gift Code : ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 42,
                width: 331,
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor("BDBDBD")),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9)),
                child: TextFormField(
                  controller: code,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Gift Code',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 10)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 42,
                  width: 331,
                  child: ElevatedButton(
                      onPressed: () {
                        if (code.text.isNotEmpty) {
                          akunProvider.TopUp(
                              context, code.text, akunProvider.akun['id']);
                        } else {
                          notifDoang(context, "Code tidak boleh kosong", 700);
                        }
                      },
                      child: Text(
                        "Top Up",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ))),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 42,
                  width: 331,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("969696")),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Kembali",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
