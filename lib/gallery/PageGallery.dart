import 'package:cached_network_image/cached_network_image.dart';
import 'package:edukasiapp_tim2/gallery/photo_view_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key? key}) : super(key: key);

  final List<String> photos = [
    'https://pbs.twimg.com/media/FqOvM-8aMAE8Cyw.jpg',
    'https://i.pinimg.com/474x/f7/9e/52/f79e5203f41bdaaf1a5b4176f98a8736.jpg',
    'https://i.pinimg.com/550x/3b/ee/d6/3beed60e3668937c4ddeb5eecfe591ea.jpg',
    'https://i.ytimg.com/vi/-3cdpWbUdhc/mqdefault.jpg',
    'https://i.pinimg.com/236x/2e/ed/30/2eed301af40aebd2d77cff2fa3d6eeee.jpg',
    'https://i.kym-cdn.com/entries/icons/facebook/000/048/010/side_eye_cat.jpg',
    'https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?q=65&auto=format&w=1600&ar=2:1&fit=crop',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-46Ct1qQe-7nKUI93ke7QDxFIZb-wE6DxqQ&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        backgroundColor: Colors.red,
        ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.all(1),
        itemCount: photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.all(0.5),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PhotoViewPage(photos: photos, index: index),
                ),
              ),
              child: Hero(
                tag: photos[index],
                child: CachedNetworkImage(
                  imageUrl: photos[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(color: Colors.grey),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.red.shade400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}