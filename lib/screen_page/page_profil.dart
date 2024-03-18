import 'package:edukasiapp_tim2/screen_page/page_update_profil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageProfil extends StatefulWidget {
  @override
  _PageProfilState createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  late String username;
  late String fullname;
  late String email;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      fullname = prefs.getString('fullname') ?? '';
      email = prefs.getString('email') ?? '';
    });
  }

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
                  '$fullname',
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                  'Username : $username\n' +
                      'Email : $email',
                  maxLines: 4,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.pink,
                  onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageUpdateProfil()),
                ).then((value) {

                  if (value != null && value) {
                    _loadProfile();
                  }
                });
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