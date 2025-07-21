import 'package:flutter/material.dart';
import '../models/article_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Görsel
            if (article.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 100),
                ),
              ),

            const SizedBox(height: 20),

            /// Başlık
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            /// Açıklama
            if (article.description.isNotEmpty)
              Text(
                article.description,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),

            const SizedBox(height: 16),

            /// İçerik
            if (article.content.isNotEmpty)
              Text(
                _cleanContent(article.content),
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
          ],
        ),
      ),
    );
  }

  String _cleanContent(String content) {
    final regex = RegExp(r'\[\+\d+\schars\]');
    return content.replaceAll(regex, '').trim();
  }
}
