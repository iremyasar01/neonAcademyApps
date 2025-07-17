
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:neonacademyapss/models/user_profile_models.dart';
import 'package:neonacademyapss/screens/profile_screen.dart';

class ColorPickerScreen extends StatefulWidget {
  final Function(Color) onColorPicked;

  const ColorPickerScreen({super.key, required this.onColorPicked});

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color currentColor = Colors.white;

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick Background Color")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorPicker(
            pickerColor: currentColor,
            onColorChanged: changeColor,
          ),
          ElevatedButton(
            onPressed: () {
              widget.onColorPicked(currentColor);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    user: UserProfile(name: "İrem YAŞAR", age: 20, backgroundColor: currentColor),
                  ),
                ),
              );
            },
            child: const Text("Apply Color"),
          ),
        ],
      ),
    );
  }
}
