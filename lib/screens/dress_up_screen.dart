import 'package:flutter/material.dart';

class DressUpScreen extends StatefulWidget {
  const DressUpScreen({super.key});

  @override
  State<DressUpScreen> createState() => _DressUpScreenState();
}

class _DressUpScreenState extends State<DressUpScreen> {
  int _currentValue = 0;
  final List<Color> _outfitColors = [
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  void _increment() {
    setState(() {
      if (_currentValue < 50) _currentValue += 5;
    });
  }

  void _decrement() {
    setState(() {
      if (_currentValue > 0) _currentValue -= 5;
    });
  }

  Color _getOutfitColor() {
    final index = (_currentValue ~/ 10) % _outfitColors.length;
    return _outfitColors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], 
      appBar: AppBar(
        title: const Text("🎀 Sarah's Magical Stepper"),
        backgroundColor: Colors.pink[300],
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.brown[200], // Ahşap rengi
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.brown[800]!, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.5),
                blurRadius: 12,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Outfit Tracker",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(height: 16),
              
            
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  color: _getOutfitColor().withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _getOutfitColor(),
                    width: 3,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    
                    const Icon(Icons.person, size: 80, color: Colors.pink),
                    
                   
                    Positioned(
                      bottom: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getOutfitColor(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Outfit ${_currentValue ~/ 5 + 1}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),

           
              Text(
                'Current Outfit #: $_currentValue',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 24),

       
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _decrement,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/pink_minus.png',
                          width: 60,
                        ),
                        const SizedBox(height: 4),
                        const Icon(Icons.favorite, color: Colors.pink),
                      ],
                    ),
                  ),

               
                  Container(
                    width: 4,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

              
                  GestureDetector(
                    onTap: _increment,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/pink_button.png',
                          width: 60,
                        ),
                        const SizedBox(height: 4),
                        const Icon(Icons.favorite, color: Colors.pink),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 10),
              
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Min: 0",
                    style: TextStyle(
                      color: _currentValue == 0 ? Colors.red : Colors.grey,
                      fontWeight: _currentValue == 0 
                          ? FontWeight.bold 
                          : FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Max: 50",
                    style: TextStyle(
                      color: _currentValue == 50 ? Colors.green : Colors.grey,
                      fontWeight: _currentValue == 50 
                          ? FontWeight.bold 
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
