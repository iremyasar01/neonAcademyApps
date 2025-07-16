import 'package:flutter/material.dart';
import 'package:neonacademyapss/models/page_models.dart';


class RoyalPage extends StatelessWidget {
  final PageModels content;

  const RoyalPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: content.color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: content.color, width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Image.asset(
              content.imageAsset,
              width: 80,
              height: 80,
              color: content.color,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            content.title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: content.color,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            content.subtitle,
            style: TextStyle(
              fontSize: 20,
              color: content.color.withOpacity(0.8),
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}