import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/app_model.dart';

class AppGridItem extends StatelessWidget {
  final AppModel app;
  final Function(BuildContext) onTap;
  final Function() onShare;

  const AppGridItem({
    super.key,
    required this.app,
    required this.onTap,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
  actions: [
    CupertinoContextMenuAction(
      onPressed: () {
        Navigator.pop(context);
        onShare();
      },
      child: const Text('Share', style: TextStyle(color: Colors.blue)),
    ),
    CupertinoContextMenuAction(
      onPressed: () {
        Navigator.pop(context);
        onTap(context);
      },
      child: const Text('View Details', style: TextStyle(color: Colors.blue)),
    ),
  ],
  child: SizedBox(
    height: 200,
    width: 160, 
    child: Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: InkWell(
          onTap: () => onTap(context),
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: SizedBox(
                  height: 120, 
                  child: CachedNetworkImage(
                    imageUrl: app.artworkUrl100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.blue[50],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  app.appName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  app.appCategory,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);
  }
  }