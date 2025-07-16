import 'package:flutter/material.dart';
import 'package:neonacademyapss/screens/container_screen.dart';
import 'package:neonacademyapss/screens/dino_segmented_control_screen.dart';
import 'package:neonacademyapss/screens/dress_up_screen.dart';
import 'package:neonacademyapss/screens/page_control_screen.dart';
import 'package:neonacademyapss/screens/resque_slider_screen.dart';
import 'package:neonacademyapss/screens/switch_screen.dart';
import 'package:neonacademyapss/screens/wicked_queen_screen.dart';
import 'package:neonacademyapss/screens/wild_west_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neon Academy Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContainerScreen()),
                );
              },
              child: const Text('Awesome Gallery'),
              //contaniers
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WildWestScreen()),
                );
              },
              child: const Text('Wild Test'),
              //buttons
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WickedQueenScreen()),
                );
              },
              child: const Text('The Wicked Queen'),
              //Textfields
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RescueSliderScreen()),
                );
              },
              child: const Text('Resque Mission'),
              //Sliders
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SwitchScreen()),
                );
              },
              child: const Text('Switch'),
              //Switches
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DressUpScreen()),
                );
              },
              child: const Text('Dress Up'),
              //Stepper
            ),
             const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageControlScreen()),
                );
              },
              child: const Text('Prince pages'),
              //page control
            ),
              const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DinoSegmentedControlScreen()),
                );
              },
              child: const Text('dino segmented control'),
              //segmented control
            ),
          ],
        ),
      ),
    );
  }
}
