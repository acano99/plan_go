import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/dataPlansList.dart';
import 'package:plan_go/src/data/models/data_plan.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
import 'package:plan_go/src/presentation/widgets/data_plan_tile.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('Planes de Datos')),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          mainAxisExtent: 170,
        ),
        itemCount: dataPlansList.length,
        itemBuilder: (context, index) => DataPlanTile(
          dataPlan: dataPlansList[index],
          onTap: (ussd) async {
            try {
              await SendUssdUseCase.invoke(context, ussd);
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: colorScheme.error,
                    content: Text(
                      e.toString(),
                      style: TextStyle(color: colorScheme.onError),
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
