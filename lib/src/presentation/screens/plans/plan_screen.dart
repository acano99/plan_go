import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plan_go/src/data/default/plans_list.dart';
import 'package:plan_go/src/presentation/widgets/plans_tile.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBar(title: 'Planes'),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          mainAxisExtent: 140,
        ),
        itemCount: plansList.length,
        itemBuilder: (context, index) => PlansTile(
          plan: plansList[index],
          onTap: () => context.pushNamed(plansList[index].route),
        ),
      ),
    );
  }
}
