import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class BLDialogKonfirmasi extends StatelessWidget {
  String pesan;
  String textTombolYa;
  String textTombolTidak;
  Function() tombolYa;
  Function() tombolTidak;

  BLDialogKonfirmasi({super.key, required this.pesan, required this.tombolYa,required this.tombolTidak, this.textTombolYa = "Ya", this.textTombolTidak = "Tidak" });

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
