import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neonacademyapss/data/passanger_data.dart';
import 'package:neonacademyapss/models/passanger_model.dart';
import 'package:neonacademyapss/widgets/passanger_detail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedFilter = 0; // 0: Name, 1: Surname
  String query = '';

  @override
  Widget build(BuildContext context) {
    final List<PassengerModel> filteredPassengers = passengerData.where((passenger) {
      final target = selectedFilter == 0 ? passenger.name.toLowerCase() : passenger.surname.toLowerCase();
      return target.contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Passengers'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoSegmentedControl<int>(
              children: const {
                0: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('Name')),
                1: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('Surname')),
              },
              groupValue: selectedFilter,
              onValueChanged: (int val) {
                setState(() => selectedFilter = val);
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() => query = val);
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: filteredPassengers.isEmpty
                ? const Center(child: Text('No passengers found'))
                : ListView.builder(
                    itemCount: filteredPassengers.length,
                    itemBuilder: (context, index) {
                      final passenger = filteredPassengers[index];
                      return ListTile(
                        title: Text('${passenger.name} ${passenger.surname}'),
                        subtitle: Text(passenger.team),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PassengerDetail(passenger: passenger),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
