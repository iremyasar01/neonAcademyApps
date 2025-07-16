import 'package:flutter/material.dart';
import 'package:neonacademyapss/widgets/gradient_slider_track.dart';

class RescueSliderScreen extends StatefulWidget {
  const RescueSliderScreen({super.key});

  @override
  State<RescueSliderScreen> createState() => _RescueSliderScreenState();
}

class _RescueSliderScreenState extends State<RescueSliderScreen> {
  double _sliderValue = 50;
  bool _dragonDefeated = false;
  bool _showPrincesses = false;

  void _battleDragon() {
    if (_sliderValue == 50) {
      setState(() => _dragonDefeated = true);
      
      // Ejderha yenildikten sonra prensesleri göster
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _showPrincesses = true);
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("🎉 Dragon defeated! Princesses are saved!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _sliderValue > 50 
              ? "🔥 The red dragon is too strong! Set to 50 for the right moment"
              : "🐲 Keep going! You need exactly 50 to defeat the dragon",
          ),
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🐉 The Dragon Slayer"),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Dragon images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/green_dragon.png',
                      width: 60,
                      height: 60,
                    ),
                    const Text("Min Power", style: TextStyle(color: Colors.green)),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/red_dragon.png',
                      width: 60,
                      height: 60,
                    ),
                    const Text("Max Power", style: TextStyle(color: Colors.red)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Power display with dynamic color
            Text(
              'Dragon Power: ${_sliderValue.toInt()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.lerp(Colors.green, Colors.red, _sliderValue/100),
              ),
            ),
            const SizedBox(height: 20),

            // Magical slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.transparent,
                inactiveTrackColor: Colors.transparent,
                trackShape: GradientSliderTrackShape(),
                thumbColor: Colors.blue,
                overlayColor: Colors.blue.withOpacity(0.2),
                trackHeight: 10,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 12,
                  disabledThumbRadius: 8,
                  elevation: 4,
                ),
              ),
              child: Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue.toInt().toString(),
                onChanged: _dragonDefeated 
                  ? null // Disable after victory
                  : (value) {
                      setState(() {
                        _sliderValue = value;
                        if (_showPrincesses) {
                          _showPrincesses = false; // Reset princesses if slider moved
                        }
                      });
                    },
              ),
            ),
            
            // Victory instruction
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                _dragonDefeated 
                  ? "The Dragon Slayer saved the kingdom!"
                  : "Set the slider to exactly 50 to defeat the dragon",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: _dragonDefeated ? Colors.green : Colors.blue,
                ),
              ),
            ),
            
            const SizedBox(height: 20),

            // Battle button
            ElevatedButton.icon(
              onPressed: _dragonDefeated ? null : _battleDragon,
              icon: const Icon(Icons.shield, color: Colors.blue),
              label: const Text("Use Dragon Slayer", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade100,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                disabledBackgroundColor: Colors.grey.shade300,
              ),
            ),

            // Princesses appear after victory
            if (_showPrincesses)
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const Text("Princesses Rescued!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => 
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.face, color: Colors.pink, size: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
