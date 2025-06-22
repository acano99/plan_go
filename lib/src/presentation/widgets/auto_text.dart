import 'package:flutter/material.dart';

class AutoText extends StatelessWidget {
  const AutoText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final basedScreenWidth = 360;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final scaleFactor = screenWidth / basedScreenWidth;

    return Text(
      text,
      style: style?.copyWith(fontSize: style!.fontSize! * scaleFactor),
    );
  }
}
