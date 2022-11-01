import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../tambahan.dart';

class TempatBarang extends StatelessWidget {
  String idBarang;
  String fotoBarang;
  String namaBarang;
  String deskripsiBarang;
  String stokBarang;
  String hargaBarang;
  Function() tombolHapus;
  Function() tombolEdit;
  Function() tombolBeli;

  TempatBarang(
      {required this.idBarang,
      required this.fotoBarang,
      required this.namaBarang,
      required this.deskripsiBarang,
      required this.stokBarang,
      required this.hargaBarang,
      required this.tombolBeli,
      required this.tombolEdit,
      required this.tombolHapus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
          color: HexColor('F0F3F3'), // Warna Container Barang
          borderRadius: BorderRadius.circular(11),
          // border: Border.all(color: Colors.black, width: 0.5),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(5, 5))
          ]),
      child: Column(
        children: [
          //Foto Barang,
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: 168,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(9)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  "https://bapaklapak.000webhostapp.com/assets/img/$fotoBarang",
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
            // child: Image.asset(
            //   "assets/images/no_image.png",
            //   fit: BoxFit.contain,
            // ),
          ),
          //Tempat Nama, Harga, Stok, Deskripsi Barang
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  //Tempat Nama Barang
                  Text(
                    namaBarang,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //Tempat Deskripsi Barang
                  SizedBox(
                    height: 28,
                    child: Text(
                      (deskripsiBarang == "")
                          ? "Penjual tidak menuliskan deskripsi..."
                          : deskripsiBarang,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 115, 115, 115),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                  //Tempat Stok Barang
                  Text(
                    "Stok : $stokBarang",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  //Tempat Harga Barang
                  Text(
                    "Rp${textUang(int.parse(hargaBarang))}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          Divider(
            height: 20,
            thickness: 5,
            color: Colors.black.withOpacity(0.2),
          ),
          // Tomboll Di Tempat Barang
          Row(
            children: [
              Expanded(
                child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                        onPressed: () {
                          print("Tombol Beli");
                          tombolBeli();
                        },
                        child: const Text(
                          "Beli",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ))),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                        onPressed: () {
                          print("Tombol Edit");
                          tombolEdit();
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ))),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                        onPressed: () {
                          print("Tombol Hapus");
                          tombolHapus();
                        },
                        child: const Text(
                          "Hapus",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ))),
              )
            ],
          )
        ],
      ),
    );
  }
}
