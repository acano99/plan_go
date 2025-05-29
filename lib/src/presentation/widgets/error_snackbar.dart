import 'package:flutter/material.dart';

class ErrorSnackbar extends StatelessWidget {
  const ErrorSnackbar({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SnackBar(
      backgroundColor: colorScheme.error,
      content: Text(error, style: TextStyle(color: colorScheme.onError)),
    );
  }
}
