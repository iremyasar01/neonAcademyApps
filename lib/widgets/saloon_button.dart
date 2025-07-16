import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SaloonButton extends StatefulWidget {
  const SaloonButton({super.key});

  @override
  State<SaloonButton> createState() => _SaloonButtonState();
}

class _SaloonButtonState extends State<SaloonButton> {
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

Future<void> _showSpecials() async {
  try {
    await player.play(AssetSource('sounds/open_bottle.mp3'));
    // print("✅ Ses çalma isteği gönderildi!");
  } catch (e) {
    //print("❌ Ses çalma hatası: $e");
  }
    
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text('🍗 Daily Specials'),
        content: Text('1. Whiskey BBQ\n2. Cowboy Chili\n3. Sarsaparilla Float'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Arka plan görseli eklendi
        image: const DecorationImage(
          image: AssetImage('assets/images/western_background.jpg'), // Görsel yolunu güncelleyin
          fit: BoxFit.cover,
          opacity: 0.8, // Görsel saydamlığı
        ),
        // Gradyan ve renk ayarları
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.deepOrange],
          stops: [0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: _showSpecials,
        child: const Center(
          child: Text(
            '🍺 View Specials',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow( 
                  blurRadius: 2,
                  color: Colors.black,
                  offset: Offset(1, 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
