import 'package:flutter/material.dart';
import 'package:neonacademyapss/models/user_profile_models.dart';
import 'package:neonacademyapss/screens/profile_screen.dart';

class DatePickerScreen extends StatelessWidget {
  final Function(int) onAgeSelected;

  const DatePickerScreen({super.key, required this.onAgeSelected});

  void _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      final age = now.year - picked.year;
      onAgeSelected(age);
      //Navigator.pop(context);
        if (!context.mounted) return; 
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(user: UserProfile(name: "İrem YAŞAR", age: age)),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick Your Birth Date")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _selectDate(context),
          child: const Text("Select Date"),
        ),
      ),
    );
  }
}

      
