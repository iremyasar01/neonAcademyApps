import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonacademyapss/models/user_profile_models.dart';
import 'package:neonacademyapss/screens/picker_screen.dart';

class ProfileScreen extends StatefulWidget {
  final UserProfile user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.user.backgroundColor,
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.user.profileImage != null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(widget.user.profileImage!),
                    )
                  : const CircleAvatar(
                      radius: 60,
                      child: Icon(Icons.person, size: 40),
                    ),
              const SizedBox(height: 30),
              Text(
                "Name: ${widget.user.name}",
                style: GoogleFonts.getFont(
                   widget.user.fontFamily ?? 'Roboto',
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Age: ${widget.user.age}",
                style: GoogleFonts.getFont(
                  fontSize: 20,
                 widget.user.fontFamily ?? 'Roboto',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PickerScreen(),
                  ),
                ),
                child: const Text("Back to Main"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
