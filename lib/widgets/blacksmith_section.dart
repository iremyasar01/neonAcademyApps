import 'package:flutter/material.dart';

class BlacksmithSection extends StatelessWidget {
  final bool isAvailable;
  final ValueChanged<bool> onChanged;

  const BlacksmithSection({
    super.key,
    required this.isAvailable,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Is Blacksmith in the shop?'),
          value: isAvailable,
          onChanged: onChanged,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: isAvailable
              ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Forge hammer enabled! 🔨')),
                  );
                }
              : null,
          child: const Text('🔧 Forge Hammer'),
        ),
      ],
    );
  }
}
