import 'dart:convert';

import 'package:edukasiapp_tim2/screen_page/page_register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  Future<int> _login() async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.100.6/edukasiDb/login.php'),
        body: {
          "username": txtUsername.text,
          "password": txtPassword.text,
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final loginStatus = responseData['value'];

        if (loginStatus == 1) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
      }

        return loginStatus ?? 0;
      } else {
        return 0;
      }
    } catch (e) {
        print(e);
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // backgroundColor: Colors.blue,
      //     // title: Text('Login Form'),
      //     ),
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/bgapp.jpg"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // color: Colors.blueGrey,
        color: Colors.pink.withOpacity(0.5),
        child: Center(
          child: Card(
            color: const Color.fromARGB(255, 240, 240, 240),
            margin: EdgeInsets.all(100),
            child: Form(
              key: keyForm,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding:
                    EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Aplikasi Edukasi', // Judul
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                        validator: (val) {
                          return val!.isEmpty ? "Tidak Boleh kosong" : null;
                        },
                        controller: txtUsername,
                        decoration: InputDecoration(
                            hintText: "Username",
                            border: UnderlineInputBorder()),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                        obscureText: true,
                        validator: (val) {
                          return val!.isEmpty ? "Tidak Boleh kosong" : null;
                        },
                        controller: txtPassword,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: UnderlineInputBorder()),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (keyForm.currentState?.validate() == true) {
                            _login().then((loginStatus) {
                              if (loginStatus == 1) {
                                Navigator.pushReplacementNamed(
                                    context, '/PageUtama');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Login failed. Please check your credentials.'),
                                    backgroundColor: Colors.deepOrange,
                                  ),
                                );
                              }
                            }).catchError((error) {
                              print("Error during login: $error");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'An error occurred during login. Please try again later.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            });
                          }
                        },
                        child: Text('Login'),
                        color: Colors.pink,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                      text: TextSpan(
                        text: 'Belum Punya Akun? ',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Silahkan Register',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.blue, // Warna teks kedua
                            ),
                            // event handler jika teks kedua ditekan
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PageRegister()),
                                    (route) => false);
                              },
                          ),
                        ],
                      ),
                    ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
