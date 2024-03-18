import 'dart:convert';
import 'dart:core';
import 'package:edukasiapp_tim2/screen_page/page_list_pegawai.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class createPegawai extends StatefulWidget {
  const createPegawai({super.key});

  @override
  State<createPegawai> createState() => _createPegawaiState();
}

class _createPegawaiState extends State<createPegawai> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController nobp = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tgl_input = TextEditingController();
  
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  Future<int> _simpan() async {
    final response = await http.post(
        Uri.parse('http://192.168.1.4/edukasiDb/createPegawai.php'),
        body: {
          "nama": nama.text,
          "nobp": nobp.text,
          "nohp": nohp.text,
          "email": email.text,
        });

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final value = responseData['value'];

        return value ?? 0;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Data Pegawai',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                  hintText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nobp,
                decoration: InputDecoration(
                  hintText: "No BP",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "No BP tidak boleh kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nohp,
                decoration: InputDecoration(
                  hintText: "No HP",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "No HP tidak boleh kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                          return "Email tidak boleh kosong";
                        } else if (!emailRegex.hasMatch(value)) {
                          return "format email salah. ex: ex@mail.com";
                        }
                        return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _simpan().then((value) {
                      if (value == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Berhasil tambah data pegawai!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageListPegawai())),
                            (route) => false);
                      } else if (value == 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('email telah digunakan!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (value == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Gagal tambah data pegawai'),
                            backgroundColor: Colors.deepOrange,
                          ),
                        );
                      } else {}
                    });
                  }
                },
                child: Text(
                  "Simpan Data",
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
