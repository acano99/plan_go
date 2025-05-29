import 'package:flutter/material.dart';
import 'package:plan_go/src/config/router/router.dart';

class ThemeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ThemeAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () => Navigator.pushNamed(context, AppRouter.settings),
      //     icon: Icon(Icons.settings_rounded),
      //   ),
      // ],
      // actionsPadding: EdgeInsets.only(right: 8),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
