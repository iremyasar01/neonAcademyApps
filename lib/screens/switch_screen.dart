import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isSwitchedOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitchedOn ? Colors.greenAccent : Colors.red[900],
      appBar: AppBar(
        title: const Text("🔁 Magic Switch - Giants & Dwarves"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Switch(
          value: isSwitchedOn,
          onChanged: (value) {
            setState(() {
              isSwitchedOn = value;
            });
          },
          activeColor: Colors.black, // thumb color when ON
          inactiveThumbColor: Colors.black, // thumb color when OFF
          activeTrackColor: Colors.red, // background when ON
          inactiveTrackColor: Colors.green, // background when OFF
        ),
      ),
    );
  }
}
