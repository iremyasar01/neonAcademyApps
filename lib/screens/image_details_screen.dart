import 'package:flutter/material.dart';
class ImageDetailScreen extends StatelessWidget {
  final String imageUrl;

  const ImageDetailScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SafeArea(
        child: Hero(
          tag: imageUrl,
          child: InteractiveViewer( // Zoom yapılabilmesi için
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain, // Ekrana orantılı şekilde sığdır
              ),
            ),
          ),
        ),
      ),
    );
  }
}

