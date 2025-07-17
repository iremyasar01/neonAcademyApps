import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neonacademyapss/models/user_profile_models.dart';
import 'font_picker_screen.dart';
import 'date_picker_screen.dart';
import 'color_picker_screen.dart';
import 'image_picker_screen.dart';
import 'profile_screen.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  UserProfile user = UserProfile(name: "İrem YAŞAR", age: 20);
 void _updateFont(String font) {
    setState(() {
      user.fontFamily = font;
    });
  }
  void _updateImage(File image) => setState(() => user.profileImage = image);
  //void _updateFont(String font) => setState(() => user.fontFamily = font);
  void _updateAge(int age) => setState(() => user.age = age);
  void _updateColor(Color color) => setState(() => user.backgroundColor = color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lost in the Sand Dunes")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(user: user),
              ),
            ),
            child: const Text("View Profile"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ImagePickerScreen(onImagePicked: _updateImage),
              ),
            ),
            child: const Text("Pick Profile Image"),
          ),
          ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FontPickerScreen(
                      onFontSelected: _updateFont,
                      currentFont: user.fontFamily,
                    ),
                  ),
                ); 
               if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(user: user),
                  ),
                );
              },
              child: const Text("Pick Font "),

          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DatePickerScreen(onAgeSelected: _updateAge),
              ),
            ),
            child: const Text("Pick Birth Date"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ColorPickerScreen(onColorPicked: _updateColor),
              ),
            ),
            child: const Text("Pick Background Color"),
          ),
        ],
      ),
    );
  }
}
