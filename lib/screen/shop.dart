// ignore_for_file: avoid_print
import 'package:bapaklapak/provider/akun_provider.dart';
import 'package:bapaklapak/provider/barang_provider.dart';
import 'package:bapaklapak/screen/edit_barang.dart';
import 'package:bapaklapak/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../tambahan.dart';
import '../widget/tempat_barang.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    cekKoneksi(context, () {},);
    final barangProvider = Provider.of<BarangProvider>(context, listen: false);
    final akunProvider = Provider.of<AkunProvider>(context, listen: false);
    TextEditingController cariForm = TextEditingController();
    barangProvider.ambilBarangDariDatabase();
    return Scaffold(
      backgroundColor: HexColor('E9E9E9'),
      appBar: AppBar(
        //Appbar Color
        backgroundColor: HexColor('3F3F3F'),
        //Title Bapaklapak
        title: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Bapak",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Text("Lapak",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: false, //Title Appbar di tengah
        //Logo
        actions: [
          //Popup Menu Di AppBar
          if(akunProvider.isLogin)...[
            PopupMenuButton(
              icon: Image.asset(
                'assets/images/lg.png',
                fit: BoxFit.contain,
              ),
              iconSize: 37,
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  const PopupMenuItem(value: 0, child: Text("Profil")),
                  const PopupMenuItem(value: 1, child: Text("Tambah Barang")),
                  const PopupMenuItem(value: 2, child: Text("Database Akun")),
                  const PopupMenuDivider(
                    height: 5,
                  ),
                  const PopupMenuItem(value: 3, child: Text("Logout")),
                ];
              },
              onSelected: (value) {
                switch (value) {
                  case 0:
                    print("Halaman Profil");
                    break;
                  case 1:
                    Navigator.of(context).pushReplacementNamed("/tambahbarang");
                    break;
                  case 2:
                    print("Halaman Database Akun");
                    break;
                  case 3:
                    print("Halaman Logout");
                    break;
                }
              },
            ),
          ]else...[
            PopupMenuButton(
              icon: Image.asset(
                'assets/images/lg.png',
                fit: BoxFit.contain,
              ),
              iconSize: 37,
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  const PopupMenuItem(value: 0, child: Text("Login")),
                ];
              },
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.of(context).pushReplacementNamed("/login");
                    break;
                }
              },
            ),
          ],
          
        ],
      ),
      body: Column(
        children: [
          //Kolom Pencarian
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(9)),
                    child: TextFormField(
                      controller: cariForm,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      decoration: InputDecoration(
                          hintText: 'Cari...',
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                              left: 10, right: 10, top: 3, bottom: 10)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //Tombol Cari
                SizedBox(
                  height: 42,
                  width: 68,
                  child: ElevatedButton(
                    child: const Text(
                      "Cari",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      print("Tombol Cari");
                      barangProvider.cariBarang(cariForm.text);
                    },
                  ),
                )
              ],
            ),
          ),
          //Tempat Barang
          Expanded(
            child: Consumer<BarangProvider>(
              builder: (context2, value, child) => (value.jumlahBarang != 0) ? ListView.builder(
                itemCount: value.jumlahBarang,
                itemBuilder: (context2, index) {
                  return TempatBarang(
                    idBarang: value.barang[index]['id'],
                    fotoBarang: value.barang[index]['foto'],
                    namaBarang: value.barang[index]['nama'],
                    deskripsiBarang: value.barang[index]['deskripsi'],
                    stokBarang: value.barang[index]['stok'],
                    hargaBarang: value.barang[index]['harga'],
                    tombolBeli: () {
                      
                    },
                    tombolEdit: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                        return EditBarangScreen(
                          idBarang: value.barang[index]['id'], 
                          fotoBarang: value.barang[index]['foto'], 
                          namaBarang: value.barang[index]['nama'], 
                          hargaBarang: value.barang[index]['harga'], 
                          stokBarang: value.barang[index]['stok'], 
                          deskripsiBarang: value.barang[index]['deskripsi']
                          );
                      },));
                    },
                    tombolHapus: () {
                      showDialog(context: context, 
                        builder: (context) {
                          return BLDialogKonfirmasi(
                            pesan: 'Yakin Ingin Menghapus Barang Ini?', 
                            tombolTidak: () {
                              
                            },
                            tombolYa: () {
                            barangProvider.hapusBarang(context, int.parse(value.barang[index]['id']));
                          },);
                        },
                      );
                    },
                  );
                },
              ) : Center(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Tidak Ada Barang", style: TextStyle(color: Color.fromARGB(255, 126, 126, 126), fontSize: 16, fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            )
          )
        ],
      ),
    );
  }
}
