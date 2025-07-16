import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:neonacademyapss/widgets/blacksmith_section.dart';
import 'package:neonacademyapss/widgets/robbery_button.dart';
import 'package:neonacademyapss/widgets/saloon_button.dart';
import 'package:neonacademyapss/widgets/sheriff_menu.dart';
import 'package:neonacademyapss/widgets/vigilante_button.dart';

class WildWestScreen extends StatefulWidget {
  const WildWestScreen({super.key});

  @override
  State<WildWestScreen> createState() => _WildWestScreenState();
}

class _WildWestScreenState extends State<WildWestScreen>
    with SingleTickerProviderStateMixin {
  bool isBlacksmithAvailable = false;
  bool isRobberyInProgress = false;
  Color vigilanteColor = Colors.purple.shade100;

  late final AnimationController _controller;
  late final Animation<Offset> _shakeAnimation;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.03, 0),
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    player.dispose();
    super.dispose();
  }

  void playShakeSound() async {
    await player.play(AssetSource('sounds/large_door.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3E0),
      appBar: AppBar(
        title: const Text('🏜️ Wild West Challenge'),
        backgroundColor: Colors.brown.shade800,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Center(child: SheriffMenu()),
            const SizedBox(height: 20),
            const SaloonButton(),
            const SizedBox(height: 20),
            VigilanteButton(
              vigilanteColor: vigilanteColor,
              onTapDown: () =>
                  setState(() => vigilanteColor = Colors.yellow.shade100),
              onTapUp: () =>
                  setState(() => vigilanteColor = Colors.purple.shade100),
            ),
            const SizedBox(height: 20),
            BlacksmithSection(
              isAvailable: isBlacksmithAvailable,
              onChanged: (val) => setState(() => isBlacksmithAvailable = val),
            ),
            const SizedBox(height: 20),
            RobberyButton(
              isRobberyInProgress: isRobberyInProgress,
              onStart: () async {
                await _controller.forward(from: 0);
                playShakeSound();
                setState(() => isRobberyInProgress = true);

                Future.delayed(const Duration(seconds: 5), () {
                  setState(() => isRobberyInProgress = false);
                });
              },
              animation: _shakeAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
