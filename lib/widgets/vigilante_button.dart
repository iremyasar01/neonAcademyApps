import 'package:flutter/material.dart';

class VigilanteButton extends StatelessWidget {
  final Color vigilanteColor;
  final VoidCallback onTapDown;
  final VoidCallback onTapUp;

  const VigilanteButton({
    super.key,
    required this.vigilanteColor,
    required this.onTapDown,
    required this.onTapUp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => onTapDown(),
      onTapUp: (_) => onTapUp(),
      onTapCancel: onTapUp,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: vigilanteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.security, color: Colors.purple.shade300),
            const SizedBox(width: 8),
            const Text('👤 Vigilante Patrol'),
          ],
        ),
      ),
    );
  }
}
