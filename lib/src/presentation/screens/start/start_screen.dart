import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() => selectedIndex = value),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.build_outlined),
            selectedIcon: Icon(Icons.build_rounded),
            label: 'Utilidades',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics_rounded),
            label: 'Consultas',
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            selectedIcon: Icon(Icons.article_rounded),
            label: 'Consultas',
          ),
        ],
      ),
      body: [
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
      ][selectedIndex],
    );
  }
}
