import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        imagePath,
        color: colorScheme.primary,
        width: 32,
        height: 32,
      ),
    );
  }
}
