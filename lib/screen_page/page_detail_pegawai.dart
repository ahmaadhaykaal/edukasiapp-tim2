import 'package:edukasiapp_tim2/screen_page/update_pegawai.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:edukasiapp_tim2/model/ModelPegawai.dart';

class PageDetailPegawai extends StatelessWidget {
  final Datum? data;

  const PageDetailPegawai(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Detail Data ' + data!.nama, style: TextStyle(color: Colors.white),), //data!.nama
        title: Text(
          'Biodata',
          style: TextStyle(color: Colors.white),
        ), //data!.nama
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink,
        // backgroundColor: Colors.pink.withOpacity(0.5),
      ),
      body: Center(
        child: Card(
          color: Color.fromARGB(255, 255, 246, 249),
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  "${data?.nama}",
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                  "No BP\t: ${data?.nobp}" +
                      "\nEmail\t\t: ${data?.email}" +
                      "\nNo HP\t: ${data?.nohp}",
                  maxLines: 4,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return updatePegawai(
                        ListData: {
                          "id": data?.id,
                          "nama": data?.nama,
                          "nobp": data?.nobp,
                          "nohp": data?.nohp,
                          "email": data?.email,
                        },
                      );
                    }));
                  },
                ),
              ),
              Divider(height: 30, thickness: 1.5, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
