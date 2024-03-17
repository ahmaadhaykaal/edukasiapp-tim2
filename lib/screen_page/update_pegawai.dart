import 'dart:convert';
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
      return true;
    } else {
      return false;
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
                  }
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
                      if (value) {
                        final snackBar = SnackBar(
                          content: const Text('Data Berhasil Diedit'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBar = SnackBar(
                          content: const Text('Data Gagal Diedit'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => PageListPegawai())),
                        (route) => false);
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
