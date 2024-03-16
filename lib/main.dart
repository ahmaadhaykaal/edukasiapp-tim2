// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const PageUtama(),
        debugShowCheckedModeBanner: false,

    );
  }
}

class PageUtama extends StatelessWidget {
  const PageUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Edukasi App - Tim 2'),
        backgroundColor: Colors.purple,
      ),
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(accountName: Text('Rizki Syaputra'),
                  accountEmail: Text('rizki@udacoding.id'),
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
                 
                },
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.person, size: 45,color: Colors.red,),
            Icon(Icons.newspaper, size: 45,color: Colors.red,),
          ],
        ),
      ),
    );
  }
}