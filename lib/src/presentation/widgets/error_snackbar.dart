import 'package:flutter/material.dart';

SnackBar showErrorSnackbar(BuildContext context, String error) {
  final colorScheme = Theme.of(context).colorScheme;

  return SnackBar(
    backgroundColor: colorScheme.error,
    content: Text(error, style: TextStyle(color: colorScheme.onError)),
  );
}
