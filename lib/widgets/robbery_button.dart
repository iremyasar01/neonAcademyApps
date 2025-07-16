import 'package:flutter/material.dart';

class RobberyButton extends StatelessWidget {
  final bool isRobberyInProgress;
  final VoidCallback onStart;
  final Animation<Offset> animation;

  const RobberyButton({
    super.key,
    required this.isRobberyInProgress,
    required this.onStart,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: GestureDetector(
        onTap: onStart,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                isRobberyInProgress
                    ? 'assets/images/unlock.png'
                    : 'assets/images/lock.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                isRobberyInProgress
                    ? '💥 Cracking Vault...'
                    : '🏦 Start Robbery',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
