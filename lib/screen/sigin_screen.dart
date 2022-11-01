import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class SiginScreen extends StatefulWidget {
  const SiginScreen({super.key});

  @override
  State<SiginScreen> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController sandi = TextEditingController();
    TextEditingController ulangiSandi = TextEditingController();
    TextEditingController date = TextEditingController();

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
                "Daftar",
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
                height: 595,
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
                    //Email
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
                    //Sandi
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
                    //Ulangi Sandi
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(9)),
                      child: TextFormField(
                        controller: ulangiSandi,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        obscureText: true,
                        obscuringCharacter: '●',
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: 'Ulangi Sandi',
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
                              print(
                                  "${value.year}-${value.month}-${value.day}");
                              date.text =
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
                          controller: date,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          enabled: false,
                          decoration: InputDecoration(
                              hintText: 'Tanggal Lahir',
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
                    //Tombol Masuk
                    SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Daftar",
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
                          "Sudah Punya Akun?",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed("/login");
                          },
                          child: Text("Masuk",
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
