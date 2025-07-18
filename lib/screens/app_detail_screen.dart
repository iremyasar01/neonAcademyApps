import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/app_model.dart';

class AppDetailScreen extends StatelessWidget {
  final AppModel app;

  const AppDetailScreen({super.key, required this.app});

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(app.appName)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: app.appName,
              child: CachedNetworkImage(
                imageUrl: app.highResArtwork,
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            Text(app.appName, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 10),
            Text('by ${app.artistName}',
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            _buildDetailRow('Release Date', app.releaseDate.substring(0, 10)),
            _buildDetailRow('Category', app.appCategory),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Open in App Store'),
              onPressed: () => _launchStore(context, app.storeURL),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  void _launchStore(BuildContext context, String? url) async {
    debugPrint('Store URL: $url');

    if (url == null || url.isEmpty) {
      _showError(context, 'Uygulama bağlantısı bulunamadı.');
      return;
    }

    try {
      final uri = Uri.parse(url);
      launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('URL launch error: $e');
      _showError(context, 'Bağlantı açılamadı: ${e.toString()}');
    }
  }
}
