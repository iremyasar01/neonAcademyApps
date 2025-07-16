import 'package:flutter/material.dart';

class AladdinProgressScreen extends StatefulWidget {
  const AladdinProgressScreen({super.key});

  @override
  State<AladdinProgressScreen> createState() => _AladdinProgressScreenState();
}

class _AladdinProgressScreenState extends State<AladdinProgressScreen> {
  int _progress = 0;

  void _incrementProgress() {
    setState(() {
      _progress = (_progress + 1) % 11;

      
      if (_progress == 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("🎉 You've mastered this Flutter level!"),
            backgroundColor: Colors.indigo,
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = _progress / 10;

    return Scaffold(
      appBar: AppBar(
        title: const Text("🧞 Aladdin's Progress Journey"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tap the lamp every time you learn!",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(
              value: progressValue,
              minHeight: 20,
              backgroundColor: Colors.black,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(
              "Progress: $_progress / 10",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _incrementProgress,
              icon: const Icon(Icons.flash_on),
              label: const Text("Make Progress"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white, // Yazı ve ikon rengi düzeltildi
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

