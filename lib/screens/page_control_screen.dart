import 'package:flutter/material.dart';
import 'package:neonacademyapss/models/page_models.dart';
import '../widgets/royal_page.dart';
import '../widgets/page_indicator.dart';
import '../widgets/royal_background.dart';


class PageControlScreen extends StatefulWidget {
  const PageControlScreen({super.key});

  @override
  State<PageControlScreen> createState() => _PageControlScreenState();
}

class _PageControlScreenState extends State<PageControlScreen> {
  final PageController _pageController = PageController();
  final List<PageModels> _pages = [
    PageModels(
      title: 'Royal Decree',
      subtitle: 'New Tax Policies Announced',
      color: Colors.purple,
      imageAsset: 'assets/images/crown.png',
    ),
    PageModels(
      title: 'Kingdom News',
      subtitle: 'Harvest Festival Begins Tomorrow',
      color: Colors.green,
      imageAsset: 'assets/images/scroll.png',
    ),
    PageModels(
      title: 'Castle Bulletin',
      subtitle: 'Dragon Sighting in North Mountains',
      color: Colors.orange,
      imageAsset: 'assets/images/castle.png',
    ),
    PageModels(
      title: 'Royal Wedding',
      subtitle: 'Prince Alexander to Marry Princess Elena',
      color: Colors.pink,
      imageAsset: 'assets/images/wedding.png',
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Royal Page Control'),
        centerTitle: true,
        backgroundColor: _pages[_currentIndex].color,
      ),
      body: RoyalBackground(
        currentPage: _pages[_currentIndex],
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return RoyalPage(content: _pages[index]);
                },
              ),
            ),
            PageIndicator(
              pageController: _pageController,
              currentIndex: _currentIndex,
              pages: _pages,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}