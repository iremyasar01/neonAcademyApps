import 'package:flutter/material.dart';

class ScrollViewScreen extends StatefulWidget {
  const ScrollViewScreen({super.key});

  @override
  State<ScrollViewScreen> createState() => _ScrollViewScreenState();
}

class _ScrollViewScreenState extends State<ScrollViewScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _alertShown = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0 &&
          !_alertShown) {
        _alertShown = true;
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Alert"),
            content: const Text("You have reached the end of the scroll view."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _label(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
@override
Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final appBarHeight = AppBar().preferredSize.height;
  final paddingTop = MediaQuery.of(context).padding.top;

  final usableHeight = screenHeight - appBarHeight - paddingTop;

  return Scaffold(
    appBar: AppBar(
      title: const Text("🦾 Iron Man's ScrollView Rescue"),
      backgroundColor: Colors.redAccent,
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),

      child: Container(
        height: usableHeight * 2, // görünür alanın 2 katı
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _label("Repulsor Blast", Colors.red),
            _label("Unibeam", Colors.blue),
            _label("Micro Missiles", Colors.orange),
            _label("Laser Cutter", Colors.green),
            _label("Nano Shield", Colors.teal),
            _label("Flight Boost", Colors.deepPurple),
            _label("EMP Pulse", Colors.pink),
            _label("Arc Reactor Overdrive", Colors.brown),
          ],
        ),
      ),
    ),
  );
}
}