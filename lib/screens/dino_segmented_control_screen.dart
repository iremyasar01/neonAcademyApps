import 'package:flutter/material.dart';

class DinoSegmentedControlScreen extends StatefulWidget {
  const DinoSegmentedControlScreen({super.key});

  @override
  State<DinoSegmentedControlScreen> createState() => _DinoSegmentedControlScreenState();
}

class _DinoSegmentedControlScreenState extends State<DinoSegmentedControlScreen> {
  int selectedIndex = 0;

  final List<String> labels = ["Neon Academy 2023", "Neon", "Apps"];
  final List<Color> neonColors = [
    Colors.cyanAccent,
    Colors.greenAccent,
    Colors.pinkAccent,
  ];

  double _getWidth(int index) {
    if (selectedIndex == index) {
      switch (index) {
        case 0:
          return 200;
        case 1:
          return 150;
        case 2:
          return 100;
      }
    }
    return 80;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text("🦖 Segmented Control Challenge"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 2),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.teal.withOpacity(0.1),
                blurRadius: 10,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: _getWidth(index),
                height: 50,
                decoration: BoxDecoration(
                  color: neonColors[index],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedIndex == index ? Colors.black : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Center(
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
