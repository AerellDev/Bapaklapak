import 'package:bapaklapak/provider/akun_provider.dart';
import 'package:bapaklapak/tambahan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:provider/provider.dart';

class AkunSettings extends StatefulWidget {
  TextEditingController email;
  TextEditingController sandi;
  TextEditingController type_akun;
  TextEditingController date;

  AkunSettings(
      {super.key,
      required this.date,
      required this.email,
      required this.sandi,
      required this.type_akun});

  @override
  State<AkunSettings> createState() => _AkunSettingsState();
}

class _AkunSettingsState extends State<AkunSettings> {
  @override
  Widget build(BuildContext context) {
    final akunProvider = Provider.of<AkunProvider>(context, listen: false);
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
                "Profil Settings",
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
                height: 602,
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
                      height: 5,
                    ),
                    Divider(
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email : ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //Email
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(9)),
                      child: TextFormField(
                        controller: widget.email,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email Akun',
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
                        "Sandi : ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //Sandi
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(9)),
                      child: TextFormField(
                        controller: widget.sandi,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        obscureText: true,
                        obscuringCharacter: '●',
                        decoration: InputDecoration(
                            hintText: 'Sandi Akun',
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
                        "Type Akun : ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //Type Akun
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(9)),
                      child: TextFormField(
                        controller: widget.type_akun,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: 'Type Akun',
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
                        "Tanggal Lahir : ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //Tanggal Lahir
                    GestureDetector(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1945),
                                lastDate: DateTime.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              widget.date.text =
                                  "${value.year}-${value.month}-${value.day}";
                            });
                          }
                        });
                      },
                      child: Container(
                        height: 42,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(9)),
                        child: TextFormField(
                          controller: widget.date,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          enabled: false,
                          decoration: InputDecoration(
                              hintText: 'Tanggal Lahir Akun',
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
                    SizedBox(
                      height: 10,
                    ),
                    //Tombol Simpan
                    SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              akunProvider.EditAkun(
                                  context,
                                  akunProvider.akun['id'],
                                  widget.email.text,
                                  widget.sandi.text,
                                  widget.type_akun.text,
                                  widget.date.text,
                                  akunProvider.akun['saldo']);
                            },
                            child: const Text(
                              "Simpan",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ))),
                    SizedBox(
                      height: 10,
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
                                  .pushReplacementNamed("/akunscreen");
                            },
                            child: const Text(
                              "Kembali",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ))),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 5,
                    ),
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
