import 'package:flutter/material.dart';

class BusyBeesScreen extends StatefulWidget {
  const BusyBeesScreen({super.key});

  @override
  State<BusyBeesScreen> createState() => _BusyBeesScreenState();
}

class _BusyBeesScreenState extends State<BusyBeesScreen> {
  bool _isCounting = false;
  int _counter = 0;
  Color _indicatorColor = Colors.orange;

  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.pink,
    Colors.indigo,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
  ];

  Future<void> _startCounter() async {
    setState(() {
      _isCounting = true;
      _counter = 0;
      _indicatorColor = _colors[0];
    });

    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 100)); 
      if (!mounted) return;

      setState(() {
        _counter = i;
        if (i % 10 == 0) {
          _indicatorColor = _colors[(i ~/ 10) % _colors.length];
        }
      });
    }

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    setState(() {
      _isCounting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🐝 Busy Bees Challenge"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isCounting)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(_indicatorColor),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '$_counter',
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Counting from 0 to 100...',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              if (!_isCounting)
                ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Start Counting"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: _startCounter,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

