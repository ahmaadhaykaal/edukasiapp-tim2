import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageSearch extends StatefulWidget {
  const PageSearch({super.key});

  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _beritaList = [];
  List<dynamic> _filteredBeritaList = [];

  @override
  void initState() {
    super.initState();
    fetchBerita();
  }

  Future<void> fetchBerita() async {
    final response = await http.get(Uri.parse('http://192.168.100.6/edukasiDb/getBerita.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        _beritaList = responseData['data'];
        _filteredBeritaList = _beritaList;
      });
    } else {
      throw Exception('Failed to load Data');
    }
  }

  void _filterBerita(String query) {
    setState(() {
      _filteredBeritaList = _beritaList
          .where((judul) =>
          judul['judul'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Berita'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterBerita(value);
              },
              decoration: InputDecoration(
                labelText: 'Cari',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredBeritaList.length,
              itemBuilder: (context, index) {
                return Card( 
                  child: ListTile(
                    title: Text(_filteredBeritaList[index]['judul']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}