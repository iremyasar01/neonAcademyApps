import 'package:flutter/material.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("💥 Hulk's Bottom TabBar"),
          backgroundColor: Colors.green[700],
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("🏠 Hulk's Base")),
            Center(child: Text("⚠️ Incoming Threats")),
            Center(child: Text("🛡️ Defense Systems")),
            Center(child: Text("⚡ Hulk Smash!")),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: TabBar(
            indicator: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.circular(16),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.green[900],
            tabs: const [
              Tab(icon: Icon(Icons.home), text: "Base"),
              Tab(icon: Icon(Icons.warning), text: "Threats"),
              Tab(icon: Icon(Icons.shield), text: "Defense"),
              Tab(icon: Icon(Icons.bolt), text: "Action"),
            ],
          ),
        ),
      ),
    );
  }
}

