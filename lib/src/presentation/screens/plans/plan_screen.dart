import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/plans_list.dart';
import 'package:plan_go/src/domain/services/request_permision_service.dart';
import 'package:plan_go/src/presentation/widgets/plans_tile.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  void initState() {
    Future.microtask(
      () async => await RequestPermissionsService.requestPhonePermission(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
          onTap: () => Navigator.pushNamed(context, plansList[index].route),
        ),
      ),
    );
  }
}
