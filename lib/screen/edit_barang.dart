import 'dart:io';

import 'package:bapaklapak/provider/barang_provider.dart';
import 'package:bapaklapak/tambahan.dart';
import 'package:bapaklapak/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditBarangScreen extends StatefulWidget {
  String idBarang;
  String fotoBarang;
  String namaBarang;
  String hargaBarang;
  String stokBarang;
  String deskripsiBarang;
  bool gantiGambar = false;

  EditBarangScreen({
    super.key,
    required this.idBarang,
    required this.fotoBarang,
    required this.namaBarang,
    required this.hargaBarang,
    required this.stokBarang,
    required this.deskripsiBarang,
  });

  @override
  State<EditBarangScreen> createState() => _EditBarangScreenState();
}

class _EditBarangScreenState extends State<EditBarangScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickFotoBarang;

  @override
  Widget build(BuildContext context) {
    TextEditingController nama = TextEditingController(text: widget.namaBarang);
    TextEditingController harga =
        TextEditingController(text: widget.hargaBarang);
    TextEditingController stok = TextEditingController(text: widget.stokBarang);
    TextEditingController deskripsi =
        TextEditingController(text: widget.deskripsiBarang);
    print("Build");

    final barangProvider = Provider.of<BarangProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Edit Barang",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Bapaklapak",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              height: 710,
              width: 373,
              decoration: BoxDecoration(
                  color: HexColor('F0F3F3'),
                  borderRadius: BorderRadius.circular(11),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(5, 5))
                  ]),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 168,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (!widget.gantiGambar) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BLDialogKonfirmasi(
                                      pesan: "Yakin Ingin Mengganti Foto?",
                                      tombolYa: () {
                                        setState(() {
                                          widget.gantiGambar = true;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BLDialogPickImage(
                                      tombolGaleri: () async {
                                        pickFotoBarang =
                                            await _picker.pickImage(
                                                source: ImageSource.gallery);
                                        setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                      tombolCamera: () async {
                                        pickFotoBarang =
                                            await _picker.pickImage(
                                                source: ImageSource.camera);
                                        setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            child: (!widget.gantiGambar)
                                ? Image.network(
                                    "https://bapaklapak.000webhostapp.com/assets/img/${widget.fotoBarang}",
                                    fit: BoxFit.contain,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  )
                                : (pickFotoBarang == null)
                                    ? Image.asset("assets/images/no_image.png")
                                    : Image.file(File(pickFotoBarang!.path))),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 5,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nama : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Nama Barang
                  Container(
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(9)),
                    child: TextFormField(
                      controller: nama,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      decoration: InputDecoration(
                          hintText: 'Nama Barang',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Harga : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Harga Barang
                  Container(
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(9)),
                    child: TextFormField(
                      controller: harga,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Harga Barang',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Stok : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Stok Barang
                  Container(
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(9)),
                    child: TextFormField(
                      controller: stok,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Stok Barang',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Deskripsi : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Deskripsi Barang
                  Container(
                    height: 129,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(9)),
                    child: TextFormField(
                      controller: deskripsi,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: 'Deskripsi Barang...',
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 42,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (widget.gantiGambar) {
                              if (pickFotoBarang == null) {
                                notifDoang(context,
                                    'Foto barang tidak boleh kosong.', 700);
                              } else if (nama.text == "") {
                                notifDoang(context,
                                    'Nama barang tidak boleh kosong.', 700);
                              } else if (harga.text == "") {
                                notifDoang(context,
                                    'Harga barang tidak boleh kosong.', 700);
                              } else if (stok.text == "") {
                                notifDoang(context,
                                    'Stok barang tidak boleh kosong.', 700);
                              } else {
                                barangProvider
                                    .editBarangPakeGambar(
                                        context,
                                        widget.idBarang,
                                        nama.text,
                                        harga.text,
                                        pickFotoBarang!,
                                        stok.text,
                                        deskripsi.text)
                                    .then((value) {
                                  Navigator.of(context)
                                      .pushReplacementNamed("/shop");
                                });
                              }
                            } else {
                              if (widget.fotoBarang == "") {
                                notifDoang(context,
                                    'Foto barang tidak boleh kosong.', 700);
                              } else if (nama.text == "") {
                                notifDoang(context,
                                    'Nama barang tidak boleh kosong.', 700);
                              } else if (harga.text == "") {
                                notifDoang(context,
                                    'Harga barang tidak boleh kosong.', 700);
                              } else if (stok.text == "") {
                                notifDoang(context,
                                    'Stok barang tidak boleh kosong.', 700);
                              } else {
                                barangProvider
                                    .editBarangTanpaGambar(
                                        context,
                                        widget.idBarang,
                                        nama.text,
                                        harga.text,
                                        widget.fotoBarang,
                                        stok.text,
                                        deskripsi.text)
                                    .then((value) {
                                  Navigator.of(context)
                                      .pushReplacementNamed("/shop");
                                });
                              }
                            }
                          },
                          child: const Text(
                            "Ubah Data",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 42,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(HexColor("969696")),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("/shop");
                          },
                          child: const Text(
                            "Kembali",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
