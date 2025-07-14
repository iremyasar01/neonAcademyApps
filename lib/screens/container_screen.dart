import 'package:flutter/material.dart';
import 'package:neonacademyapss/screens/image_details_screen.dart';

class ContainerScreen extends StatelessWidget {
  ContainerScreen({super.key});
  final List<String> imageUrls = [
    'https://picsum.photos/id/237/600/400',
    'https://picsum.photos/id/238/600/400',
    'https://picsum.photos/id/239/600/400',
    'https://picsum.photos/id/240/600/400',
    'https://picsum.photos/id/241/600/400',
    'https://picsum.photos/id/242/600/400',
    'https://picsum.photos/id/243/600/400',
    'https://picsum.photos/id/244/600/400',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Gallery'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final imageUrl = imageUrls[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImageDetailScreen(imageUrl: imageUrl),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Hero(
                tag: imageUrl,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder:
                          (context, error, stackTrace) => // Hata durumu
                              Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.broken_image),
                      ),
                      loadingBuilder:
                          (_, child, progress) => // Yükleme animasyonu
                              progress == null
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator()),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
