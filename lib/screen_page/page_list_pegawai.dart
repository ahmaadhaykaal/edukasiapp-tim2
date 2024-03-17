import 'dart:convert';

import 'package:edukasiapp_tim2/screen_page/create_pegawai.dart';
import 'package:edukasiapp_tim2/screen_page/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:edukasiapp_tim2/model/ModelPegawai.dart';
import 'package:edukasiapp_tim2/screen_page/page_detail_pegawai.dart';

class PageListPegawai extends StatefulWidget {
  const PageListPegawai({super.key});

  @override
  State<PageListPegawai> createState() => _PageListPegawaiState();
}

class _PageListPegawaiState extends State<PageListPegawai> {
  Future<List<Datum>?> getPegawai() async {
    try {
      http.Response res = await http
          .get(Uri.parse('http://192.168.1.4/edukasiDb/getPegawai.php'));
      return modelPegawaiFromJson(res.body).data;
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  Future _delete(String id) async {
    try {
      final response = await http.post(
          Uri.parse('http://192.168.1.4/edukasiDb/deletePegawai.php'),
          body: {
            "id": id,
          });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Pegawai',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PageListDataPegawai();
              }));
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return createPegawai();
              }));
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getPegawai(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 245, //220
                childAspectRatio: 5 / 2, //1
                crossAxisSpacing: 20,
                // mainAxisSpacing: 5,
              ),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Datum? data = snapshot.data?[index];
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageDetailPegawai(data)));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "${data?.nama}",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${data?.email}",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.pink,
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol hapus ditekan
                                // _deleteItem(data);
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return AlertDialog(
                                        content: Text(
                                            "Apakah yakin menghapus data?"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                _delete(data!.id).then((value) {
                                                  if (value) {
                                                    final snackBar = SnackBar(
                                                      content: const Text(
                                                          'Data Berhasil Dihapus'),
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  } else {
                                                    final snackBar = SnackBar(
                                                      content: const Text(
                                                          'Data Gagal Dihapus'),
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  }
                                                });
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            PageListPegawai())),
                                                    (route) => false);
                                              },
                                              child: Text("Hapus")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Batal")),
                                        ],
                                      );
                                    }));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
        },
      ),
    );
  }
}
