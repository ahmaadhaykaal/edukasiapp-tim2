import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:kamusfrench_indo/models/model_kata.dart';

class PageListDataPegawai extends StatefulWidget {
  const PageListDataPegawai({super.key});

  @override
  State<PageListDataPegawai> createState() => _PageListDataPegawaiState();
}

class _PageListDataPegawaiState extends State<PageListDataPegawai> {  
  Future<void> getDataPegawai() async {
    final response = await http.get(Uri.parse('http://192.168.1.4/edukasiDb/getPegawai.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        _datapegawaiList = responseData['data'];
        _filteredDatapegawaiList = _datapegawaiList;
      });
    } else {
      throw Exception('Failed to load data pegawai');
    }
  }

  TextEditingController _searchController = TextEditingController();
  List<dynamic> _datapegawaiList = [];
  List<dynamic> _filteredDatapegawaiList = [];

  @override
  void initState() {
    super.initState();
    getDataPegawai();
  }

  void _filterDatapegawai(String query) {
    setState(() {
      _filteredDatapegawaiList = _datapegawaiList
          .where((nama) =>
          nama['nama'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors  .pink,
        title: Text(
          'Data Pegawai',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    _filterDatapegawai(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search Data",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.1),
                    suffixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDatapegawaiList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Card(
                      child: ListTile(
                        title: Text(_filteredDatapegawaiList[index]['nama']),
                        subtitle: Text(_filteredDatapegawaiList[index]['nobp']),
                        // onTap: (){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)
                        //     => PageDetail(_filteredKosakataList[index]['kosakata']),
                        //   ));
                        // },
                      ),
                    ),
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}