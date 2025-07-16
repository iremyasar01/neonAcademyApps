import 'package:flutter/material.dart';

class StackViewScreen extends StatelessWidget {
  const StackViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("🪄 Harry's Stack View Challenge"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: screenWidth * 0.8,
          height: screenHeight * 0.6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: _spellLabel("Expelliarmus", Colors.redAccent),
              ),
              Positioned(
                top: screenHeight * 0.15,
                left: 0,
                child: _spellLabel("Expecto Patronum", Colors.blue),
              ),
              Positioned(
                bottom: screenHeight * 0.15,
                right: 0,
                child: _spellLabel("Lumos", Colors.amber),
              ),
              Positioned(
                bottom: 0,
                child: _spellLabel("Stupefy", Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _spellLabel(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
