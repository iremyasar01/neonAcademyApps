import 'package:flutter/material.dart';
import 'package:neonacademyapss/models/page_models.dart';


class RoyalBackground extends StatelessWidget {
  final PageModels currentPage;
  final Widget child;

  const RoyalBackground({
    super.key,
    required this.currentPage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 2.0,
          colors: [
            currentPage.color.withOpacity(0.2),
            Colors.white,
          ],
        ),
      ),
      child: child,
    );
  }
}