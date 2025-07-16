import 'package:flutter/material.dart';

class SheriffMenu extends StatelessWidget {
  const SheriffMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Open Sheriff Menu',
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.brown.shade800,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.amber, width: 2),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, blurRadius: 4, offset: Offset(2, 3)),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.badge, color: Colors.white),
            SizedBox(width: 8),
            Text(
              '👮 Sheriff\'s Menu',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      onSelected: (value) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('👮 Sheriff Action'),
            content: Text('You selected: $value'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      itemBuilder: (_) => const [
        PopupMenuItem(
          value: 'Call for Backup',
          child: Text('📢 Call for Backup'),
        ),
        PopupMenuItem(
          value: 'Issue Warning',
          child: Text('⚠️ Issue Warning'),
        ),
      ],
    );
  }
}
