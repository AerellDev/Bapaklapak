import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController sandi = TextEditingController();
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
                "Masuk",
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
                      height: 20,
                    ),
                    //Email Barang
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(9)),
                      child: TextFormField(
                        controller: email,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email',
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
                      height: 10,
                    ),
                    //Sandi Barang
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(9)),
                      child: TextFormField(
                        controller: sandi,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        obscureText: true,
                        obscuringCharacter: '●',
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: 'Sandi',
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
                      height: 10,
                    ),
                    //Tombol Masuk
                    SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Masuk",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ))),
                    SizedBox(
                      height: 10,
                    ),
                    //Tombol Home
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
                    SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum Daftar?",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed("/sigin");
                          },
                          child: Text("Buat Akun",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )
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
