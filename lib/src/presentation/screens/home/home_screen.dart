import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/plans_list.dart';
import 'package:plan_go/src/presentation/widgets/plans_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plan Go')),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisExtent: 140,
        ),
        itemCount: plansList.length,
        itemBuilder: (context, index) => PlansTile(
          plan: plansList[index],
          onTap: () => Navigator.pushNamed(context, plansList[index].route),
        ),
      ),
    );
  }
}
