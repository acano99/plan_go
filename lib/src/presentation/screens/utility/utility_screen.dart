import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plan_go/src/data/default/utilities_list.dart';

import '../../widgets/plans_tile.dart';
import '../../widgets/theme_app_bar.dart';

class UtilitiesScreen extends StatelessWidget {
  const UtilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBar(title: 'Utilidades'),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          mainAxisExtent: 140,
        ),
        itemCount: utilitiesList.length,
        itemBuilder: (context, index) => PlansTile(
          plan: utilitiesList[index],
          onTap: () => context.pushNamed(utilitiesList[index].route),
        ),
      ),
    );
  }
}
