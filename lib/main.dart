// ignore_for_file: prefer_const_constructors

import 'package:edukasiapp_tim2/berita/PageDetailBerita.dart';
import 'package:edukasiapp_tim2/model/ModelBerita.dart';
import 'package:edukasiapp_tim2/screen_page/page_list_pegawai.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const PageUtama(),
        debugShowCheckedModeBanner: false,

    );
  }
}

class PageUtama extends StatefulWidget {
  const PageUtama({super.key});

  @override
  State<PageUtama> createState() => _PageUtamaState();
}

class _PageUtamaState extends State<PageUtama> {

  String? userName;

  Future<List<Datum>?> getBerita() async{
    try{
      http.Response res = await http.get(Uri.parse('http://192.168.100.6/edukasiDb/getBerita.php'));
      return modelBeritaFromJson(res.body).data;
    }catch(e){
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Edukasi App - Tim 2',
          style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              
            },
          ),
        ],
      ),
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(accountName: Text('Ahmad Givantri Haykal'),
                  accountEmail: Text('haykalhaykal@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    child: Icon(
                      Icons.person,
                      color: Colors.green,
                      size: 65,
                    ),
                  ),
              ),

              ListTile(
                title: Text("Info Profile"),
                onTap: (){
                  
                },
              ),
              ListTile(
                title: const Text("Data Pegawai"),
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)
                        => PageListPegawai()
                      ));
                },
              ),
              ListTile(
                title: const Text("Gallery Foto"),
                onTap: (){
                 
                },
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder(
            future: getBerita(),
            builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    Datum? data = snapshot.data?[index];
                    return Padding(
                      padding: EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                            => PageDetailBerita(data)));
                        },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                                padding: EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network('http://192.168.100.6/edukasiDb/gambar_berita/${data?.gambarBerita}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("${data?.judul}",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                subtitle: Text("${data?.isiBerita}",
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black54
                                  ),
                                ),

                              )
                            ],
                        )
                      ),
                      )
                    );
                  },
                );
              }else if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  )
                );
              }
            }
        ),
      )
    )
    );
  }
  
}