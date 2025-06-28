import 'package:flutter/material.dart';

import '../consult/consultation_screen.dart';
import '../plans/plan_screen.dart';
import '../utility/utility_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 1;
  final _screens = [
    UtilitiesScreen(key: ValueKey<String>('utilities')),
    ConsultationScreen(key: ValueKey<String>('consultations')),
    PlanScreen(key: ValueKey<String>('plan')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) =>
            setState(() => _selectedIndex = value),
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
            label: 'Planes',
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: _screens[_selectedIndex],
      ),
    );
  }
}
