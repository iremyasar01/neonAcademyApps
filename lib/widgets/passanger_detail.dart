import 'package:flutter/material.dart';
import 'package:neonacademyapss/models/passanger_model.dart';

class PassengerDetail extends StatelessWidget {
  final PassengerModel passenger;

  const PassengerDetail({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${passenger.name} ${passenger.surname}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Team: ${passenger.team}', style: const TextStyle(fontSize: 18)),
              Text('Age: ${passenger.age}', style: const TextStyle(fontSize: 18)),
              Text('Hometown: ${passenger.hometown}', style: const TextStyle(fontSize: 18)),
              Text('Email: ${passenger.mail}', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
