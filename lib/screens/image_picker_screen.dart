
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neonacademyapss/models/user_profile_models.dart';
import 'package:neonacademyapss/screens/profile_screen.dart';

class ImagePickerScreen extends StatefulWidget {
  final Function(File) onImagePicked;

  const ImagePickerScreen({super.key, required this.onImagePicked});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _image = File(picked.path));
      widget.onImagePicked(File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick Profile Image")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, height: 200)
                : const Text("No image selected."),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _pickImage, child: const Text("Choose Image")),
            ElevatedButton(
  onPressed: () {
    if (_image != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ProfileScreen(
            user: UserProfile(
              name: 'İrem YAŞAR',
              age:20,
              profileImage: _image,
            ),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("select an image first")),
      );
    }
  },
  child: const Text("Go to Profile"),
),

          ],
        ),
      ),
    );
  }
}
