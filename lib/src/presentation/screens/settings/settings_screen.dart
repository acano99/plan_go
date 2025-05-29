import 'package:flutter/material.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: ThemeAppBar(title: 'Ajustes'),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Card(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.dark_mode_rounded, size: 40),
                          RadioMenuButton(
                            value: '',
                            groupValue: '',
                            onChanged: (value) {},
                            child: Text('Oscuro'),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.dark_mode_rounded, size: 40),
                          RadioMenuButton(
                            value: '',
                            groupValue: '',
                            onChanged: (value) {},
                            child: Text('Oscuro'),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.dark_mode_rounded, size: 40),
                          RadioMenuButton(
                            value: '',
                            groupValue: '',
                            onChanged: (value) {},
                            child: Text('Oscuro'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
