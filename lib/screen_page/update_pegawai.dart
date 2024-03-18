import 'dart:convert';
import 'dart:core';
import 'package:edukasiapp_tim2/screen_page/page_list_pegawai.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class updatePegawai extends StatefulWidget {
  final Map ListData;
  const updatePegawai({Key? key, required this.ListData}) : super(key: key);
  // const updatePegawai({super.key});

  @override
  State<updatePegawai> createState() => _updatePegawaiState();
}

class _updatePegawaiState extends State<updatePegawai> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController nobp = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tgl_input = TextEditingController();
  
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  Future _update() async {
    final response = await http.post(
        Uri.parse('http://192.168.100.6/edukasiDb/updatePegawai.php'),
        body: {
          "id": id.text.toString(),
          "nama": nama.text.toString(),
          "nobp": nobp.text.toString(),
          "nohp": nohp.text.toString(),
          "email": email.text.toString(),
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
    id.text = widget.ListData['id'];
    nama.text = widget.ListData['nama'];
    nobp.text = widget.ListData['nobp'];
    nohp.text = widget.ListData['nohp'];
    email.text = widget.ListData['email'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Data Pegawai',
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
                    _update().then((value) {
                      if (value == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Berhasil edit pegawai!'),
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
                            content: Text('email telah digunakan. gagal edit pegawai'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (value == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Gagal edit pegawai'),
                            backgroundColor: Colors.deepOrange,
                          ),
                        );
                      } else {}
                    });
                  }
                },
                child: Text(
                  "Update Data",
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
