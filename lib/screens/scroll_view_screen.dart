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
    final position = _scrollController.position;

    // Eğer en alta geldiyse ve alert gösterilmediyse
    if (position.atEdge && position.pixels != 0 && !_alertShown) {
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

   
    if (position.pixels < position.maxScrollExtent - 50 && _alertShown) {
     
      _alertShown = false;
    }
  });
}


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
/*
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
  */

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    //final screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("🦾 Iron Man's ScrollView Rescue"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final labelHeight = constraints.maxHeight / 12;
          final labelMargin = labelHeight * 2; 
          return SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              height: screenHeight * 2.0,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLabelSection("Repulsor Blast", Colors.red, labelHeight, labelMargin),
                  _buildLabelSection("Unibeam", Colors.blue, labelHeight, labelMargin),
                  _buildLabelSection("Micro Missiles", Colors.orange, labelHeight, labelMargin),
                  _buildLabelSection("Laser Cutter", Colors.green, labelHeight, labelMargin),
                  _buildLabelSection("Nano Shield", Colors.teal, labelHeight, labelMargin),
                  _buildLabelSection("Flight Boost", Colors.deepPurple, labelHeight, labelMargin),
                  _buildLabelSection("EMP Pulse", Colors.pink, labelHeight, labelMargin),
                  _buildLabelSection("Arc Reactor Overdrive", Colors.brown, labelHeight, labelMargin),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget _buildLabelSection(String text, Color color, double height, double margin) {
    return Container(
      height: height,
      margin: EdgeInsets.only(bottom: margin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  
  }
}