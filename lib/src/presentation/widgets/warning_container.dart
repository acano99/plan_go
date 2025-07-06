import 'package:flutter/material.dart';

class WarningContainer extends StatelessWidget {
  const WarningContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.tertiaryContainer,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          color: colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }
}
