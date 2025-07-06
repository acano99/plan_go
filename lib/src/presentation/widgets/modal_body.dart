import 'package:flutter/material.dart';
import 'package:plan_go/src/presentation/widgets/red_button.dart';

import 'blue_button.dart';

class ModalBody extends StatelessWidget {
  const ModalBody({
    super.key,
    required this.titleIcon,
    required this.title,
    this.children = const [],
    required this.cancelButtonLabel,
    required this.cancelButtonOnPressed,
    required this.confirmButtonLabel,
    required this.confirmButtonOnPressed,
  });

  final IconData titleIcon;
  final String title;
  final List<Widget> children;
  final String cancelButtonLabel;
  final VoidCallback cancelButtonOnPressed;
  final String confirmButtonLabel;
  final VoidCallback confirmButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(titleIcon, size: 20, color: colorScheme.primary),
                FittedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            ...children,
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: RedButton(
                    onPressed: cancelButtonOnPressed,
                    label: cancelButtonLabel,
                  ),
                ),
                Expanded(
                  child: BlueButton(
                    onPressed: confirmButtonOnPressed,
                    label: confirmButtonLabel,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
