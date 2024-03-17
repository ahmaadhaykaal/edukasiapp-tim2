import 'package:edukasiapp_tim2/screen_page/page_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtFullName = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  Future _register() async {
    final response = await http
        .post(Uri.parse('http://192.168.100.6/edukasiDb/register.php'), body: {
      "username": txtUsername.text,
      "email": txtEmail.text,
      "password": txtPassword.text,
      "fullname": txtFullName.text,
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: Text('Register Form'),
        // ),
        body: Container(
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
                      'Membuat Akun Baru', // Judul
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
                      controller: txtFullName,
                      decoration: InputDecoration(
                          hintText: "Full Name",
                          border: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 5,
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
                          hintText: "Username", border: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                      validator: (val) {
                        return val!.isEmpty ? "Tidak Boleh kosong" : null;
                      },
                      controller: txtEmail,
                      decoration: InputDecoration(
                          hintText: "Email", border: UnderlineInputBorder()),
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
                          hintText: "Password", border: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (keyForm.currentState?.validate() == true) {
                          _register().then((registerSuccess) {
                            if (registerSuccess) {
                              // Registrasi berhasil, lakukan tindakan yang sesuai
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Registration successful!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              // Misalnya, navigasi ke halaman beranda setelah registrasi berhasil
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              // Registrasi gagal, tampilkan pesan kesalahan
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Registration failed. Please try again.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: Text('Register'),
                      color: Colors.pink,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageLogin()),
                            (route) => false);
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            // Warna ketika teks ditekan
                            return Colors
                                .transparent; // Misalnya, transparent untuk menghilangkan warna overlay
                          }
                          // Warna default
                          return Colors.transparent;
                        }),
                      ),
                      child: Text(
                        'Sudah Punya Akun? Silahkan Login', // Teks yang dapat diklik
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.blue, // Warna teks
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
