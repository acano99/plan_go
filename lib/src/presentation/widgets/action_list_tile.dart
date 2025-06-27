import 'package:flutter/material.dart';

class ActionListTile extends StatelessWidget {
  const ActionListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(title),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: colorScheme.secondary,
      ),
      subtitle: Text(subtitle),
      subtitleTextStyle: TextStyle(fontSize: 14, color: colorScheme.secondary),
      trailing: Icon(icon),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
