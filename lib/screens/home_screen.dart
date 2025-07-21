import 'package:flutter/material.dart';
import 'package:neonacademyapss/screens/aladdin_progress_screen.dart';
import 'package:neonacademyapss/screens/busy_bees_screen.dart';
import 'package:neonacademyapss/screens/container_screen.dart';
import 'package:neonacademyapss/screens/dino_segmented_control_screen.dart';
import 'package:neonacademyapss/screens/dress_up_screen.dart';
import 'package:neonacademyapss/screens/grid_app_screen.dart';
import 'package:neonacademyapss/screens/news_screen.dart';
import 'package:neonacademyapss/screens/page_control_screen.dart';
import 'package:neonacademyapss/screens/passanger_list_screen.dart';
import 'package:neonacademyapss/screens/picker_screen.dart';
import 'package:neonacademyapss/screens/pino_alert_screen.dart';
import 'package:neonacademyapss/screens/resque_slider_screen.dart';
import 'package:neonacademyapss/screens/scroll_view_screen.dart';
import 'package:neonacademyapss/screens/search_screen.dart';
import 'package:neonacademyapss/screens/stack_views_screen.dart';
import 'package:neonacademyapss/screens/switch_screen.dart';
import 'package:neonacademyapss/screens/tabbar_screen.dart';
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
      body: SingleChildScrollView( 
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ContainerScreen()));
                  },
                  child: const Text('Awesome Gallery'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const WildWestScreen()));
                  },
                  child: const Text('Wild Test'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const WickedQueenScreen()));
                  },
                  child: const Text('The Wicked Queen'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RescueSliderScreen()));
                  },
                  child: const Text('Resque Mission'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SwitchScreen()));
                  },
                  child: const Text('Switch'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const DressUpScreen()));
                  },
                  child: const Text('Dress Up'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const PageControlScreen()));
                  },
                  child: const Text('Prince pages'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (_) => const DinoSegmentedControlScreen()));
                  },
                  child: const Text('Dino Segmented Control'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const PinoAlertScreen()));
                  },
                  child: const Text('Pino Alert Controllers'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const BusyBeesScreen()));
                  },
                  child: const Text('Busy Bees Challenge'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const AladdinProgressScreen()));
                  },
                  child: const Text('Aladdin Progress Screen'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const StackViewScreen()));
                  },
                  child: const Text('Stack Views'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ScrollViewScreen()));
                  },
                  child: const Text('Scroll Views'),
                ),
                 const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const TabBarScreen()));
                  },
                  child: const Text('Tabbar'),
                ),
                 const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const PickerScreen()));
                  },
                  child: const Text('Pickers'),
                ),
                   const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PassengerListScreen()));
                  },
                  child: const Text('Data Table'),
                ),
                    const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SearchScreen()));
                  },
                  child: const Text('SearchBar'),
                ),
                      const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const GridAppScreen()));
                  },
                  child: const Text('Grid View'),
                ),
                        const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) =>  NewsScreen()));
                  },
                  child: const Text('List View'),
                ),
             
             
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

