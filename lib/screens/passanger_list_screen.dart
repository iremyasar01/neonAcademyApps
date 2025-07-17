import 'package:flutter/material.dart';
import 'package:neonacademyapss/models/passanger_model.dart';
import 'package:neonacademyapss/widgets/passanger_detail.dart';

class PassengerListScreen extends StatelessWidget {
  PassengerListScreen({super.key});

  final List<PassengerModel> passengers = [
    PassengerModel(name: 'irem', surname: 'yaşar', team: 'Flutter Team', age: 24, hometown: 'London', mail: 'iremn@flutter.dev'),
    PassengerModel(name: 'neslişah', surname: 'kurtoglu', team: 'iOS Team', age: 18, hometown: 'New York', mail: 'nesli@ios.com'),
    PassengerModel(name: 'umut', surname: 'kaya', team: 'Android Team', age: 27, hometown: 'Istanbul', mail: 'umut@android.com'),
    PassengerModel(name: 'mert', surname: 'göksu', team: 'Design Team', age: 23, hometown: 'Ankara', mail: 'mert@design.com'),
  ];

  // Takımları tanımla (görüntüleme sırası için)
  final List<String> teams = [
    'Flutter Team',
    'iOS Team',
    'Android Team',
    'Design Team'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titanic Passengers'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, teamIndex) {
          final team = teams[teamIndex];
          final teamPassengers = passengers.where((p) => p.team == team).toList();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _getTeamColor(team),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    width: double.infinity,
                    child: Text(
                      team,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 20,
                      headingRowColor: WidgetStateColor.resolveWith((states) => Colors.grey.shade200),
                      columns: const [
                        DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Surname', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Age', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Details', style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: teamPassengers.map((passenger) {
                        return DataRow(
                          cells: [
                            DataCell(Text(passenger.name)),
                            DataCell(Text(passenger.surname)),
                            DataCell(Text(passenger.age.toString())),
                            DataCell(
                              IconButton(
                                icon: const Icon(Icons.info_outline, color: Colors.blue),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PassengerDetail(passenger: passenger),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getTeamColor(String team) {
    switch (team) {
      case 'Flutter Team':
        return Colors.blue;
      case 'iOS Team':
        return Colors.grey;
      case 'Android Team':
        return Colors.green;
      case 'Design Team':
        return Colors.purple;
      default:
        return Colors.blueGrey;
    }
  }
}