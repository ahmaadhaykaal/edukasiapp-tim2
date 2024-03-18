import 'package:cached_network_image/cached_network_image.dart';
import 'package:edukasiapp_tim2/gallery/photo_view_page.dart';
import 'package:edukasiapp_tim2/model/ModelGallery.dart';
import 'package:flutter/material.dart';

// class GalleryPage extends StatelessWidget {
//   GalleryPage({Key? key}) : super(key: key);

//   final List<String> photos = [
//     'https://pbs.twimg.com/media/FqOvM-8aMAE8Cyw.jpg',
//     'https://i.pinimg.com/474x/f7/9e/52/f79e5203f41bdaaf1a5b4176f98a8736.jpg',
//     'https://i.pinimg.com/550x/3b/ee/d6/3beed60e3668937c4ddeb5eecfe591ea.jpg',
//     'https://i.ytimg.com/vi/-3cdpWbUdhc/mqdefault.jpg',
//     'https://i.pinimg.com/236x/2e/ed/30/2eed301af40aebd2d77cff2fa3d6eeee.jpg',
//     'https://i.kym-cdn.com/entries/icons/facebook/000/048/010/side_eye_cat.jpg',
//     'https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?q=65&auto=format&w=1600&ar=2:1&fit=crop',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-46Ct1qQe-7nKUI93ke7QDxFIZb-wE6DxqQ&usqp=CAU',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Gallery",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.red,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: GridView.builder(
//         physics: const BouncingScrollPhysics(
//           parent: AlwaysScrollableScrollPhysics(),
//         ),
//         padding: const EdgeInsets.all(1),
//         itemCount: photos.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//         ),
//         itemBuilder: ((context, index) {
//           return Container(
//             padding: const EdgeInsets.all(0.5),
//             child: InkWell(
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => PhotoViewPage(photos: photos, index: index),
//                 ),
//               ),
//               child: Hero(
//                 tag: photos[index],
//                 child: CachedNetworkImage(
//                   imageUrl: photos[index],
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) => Container(color: Colors.grey),
//                   errorWidget: (context, url, error) => Container(
//                     color: Colors.red.shade400,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class GaleriPage extends StatefulWidget {
  @override
  _GaleriPageState createState() => _GaleriPageState();
}

class ZoomableImage extends StatelessWidget {
  final String imageUrl;

  ZoomableImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.black,
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
            backgroundDecoration: BoxDecoration(color: Colors.black),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2.0,
          ),
        ),
      ),
    );
  }
}


class _GaleriPageState extends State<GaleriPage> {
  Future<List<Datum>?> getGaleri() async {
    // Endpoint API galeri
    String apiUrl = 'http://192.168.1.4/edukasiDb/getGallery.php?data=galeri'; // Ganti dengan URL API yang sesuai
    
    try {
      // Melakukan request HTTP GET ke API
      final response = await http.get(Uri.parse(apiUrl));
      
      // Cek status kode response
      if (response.statusCode == 200) {
        // Parsing data JSON ke dalam objek ModelGaleri menggunakan modelGaleriFromJson
        List<Datum> galeriList = modelGaleriFromJson(response.body).data;
        
        // Mengembalikan data galeri
        return galeriList;
      } else {
        // Jika request gagal, lempar sebuah Exception
        throw Exception('Failed to load galeri');
      }
    } catch (e) {
      // Tangani jika terjadi error
      print('Error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Galery',
        ),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Datum>?>(
        future: getGaleri(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          // Tampilkan indikator loading jika future belum selesai
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          
          // Tampilkan pesan jika terjadi error
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          
          // Tampilkan data galeri jika future selesai
          if (snapshot.hasData && snapshot.data != null) {
            List<Datum> galeri = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: galeri.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ZoomableImage(imageUrl: 'http://192.168.1.4/edukasiDb/photo/${galeri[index].gambar}'),
                    ),
                  );
                },child : Image.network(
                  'http://192.168.1.4/edukasiDb/photo/${galeri[index].gambar}',
                  fit: BoxFit.cover,
                ));
              },
            );
          }
          
          // Tampilkan pesan jika tidak ada data galeri
          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}
