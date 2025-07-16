import 'package:flutter/material.dart';
import 'package:neonacademyapss/models/page_models.dart';


class PageIndicator extends StatelessWidget {
  final PageController pageController;
  final int currentIndex;
  final List<PageModels> pages;

  const PageIndicator({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pages.length, (index) {
        return GestureDetector(
          onTap: () => pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: currentIndex == index ? 12 : 10,
            width: currentIndex == index ? 30 : 10,
            decoration: BoxDecoration(
              color: currentIndex == index 
                  ? pages[index].color 
                  : pages[index].color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}