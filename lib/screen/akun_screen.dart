import 'package:bapaklapak/provider/akun_provider.dart';
import 'package:bapaklapak/screen/akun_settings.dart';
import 'package:bapaklapak/tambahan.dart';
import 'package:bapaklapak/widget/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:provider/provider.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final akunProvider = Provider.of<AkunProvider>(context, listen: false);
    TextEditingController saldo = TextEditingController(
        text: "Rp${textUang(int.parse(akunProvider.akun['saldo']))}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Akun",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                "Bapaklapak",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                height: 495,
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
                    SizedBox(
                      height: 141,
                      width: 143,
                      child: Image.asset(
                        "assets/images/lg.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _namaAkun(akunProvider.akun["email"]),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(akunProvider.akun["email"],
                        style: TextStyle(
                            color: Color.fromARGB(255, 131, 131, 131))),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //Tombol Masuk
                    SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) {
                                  return AkunSettings(
                                    date: TextEditingController(
                                        text:
                                            akunProvider.akun['tanggal_lahir']),
                                    email: TextEditingController(
                                        text: akunProvider.akun['email']),
                                    sandi: TextEditingController(
                                        text: akunProvider.akun['sandi']),
                                    type_akun: TextEditingController(
                                        text: akunProvider.akun['type_akun']),
                                  );
                                },
                              ));
                            },
                            child: const Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ))),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //Saldo Akun
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(9)),
                      child: Consumer<AkunProvider>(
                          builder: (context, value, child) {
                        saldo.text =
                            "Rp${textUang(int.parse(value.akun['saldo']))}";
                        return TextFormField(
                          controller: saldo,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          decoration: InputDecoration(
                              enabled: false,
                              hintText: 'Saldo',
                              hintStyle: TextStyle(
                                fontSize: 17,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 3, bottom: 10)),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Tombol Isi Saldo
                    SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return BLDialogTopUp();
                                },
                              );
                            },
                            child: const Text(
                              "Isi Saldo",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ))),
                    SizedBox(
                      height: 43,
                    ),
                    //Tombol Kembali
                    SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(HexColor("969696")),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("/shop");
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
      ),
    );
  }
}

String _namaAkun(String namaAkun) {
  String hasil = namaAkun.substring(0, namaAkun.lastIndexOf("@"));
  return hasil;
}
