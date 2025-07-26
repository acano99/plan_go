import 'package:flutter/material.dart';

import '../../config/router/router.dart';

class ThemeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ThemeAppBar({super.key, required this.title, this.showSetting = true});
  final String title;
  final bool showSetting;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      actions: [
        if (showSetting)
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRouter.settings),
            icon: Icon(Icons.settings_rounded),
          ),
      ],
      actionsPadding: EdgeInsets.only(right: 8),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
