import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/dataPlansList.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
import 'package:plan_go/src/presentation/widgets/data_plan_tile.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: ThemeAppBar(title: 'Planes de Datos'),
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
            final plan = dataPlansList[index];

            final confirmed = await showModalBottomSheet<bool>(
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
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
                          Icon(
                            Icons.signal_cellular_4_bar_rounded,
                            size: 20,
                            color: colorScheme.primary,
                          ),
                          Text(
                            plan.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Datos:'),
                          Text(
                            plan.data,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      if (plan.voice.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Voz:'),
                            Text(
                              plan.voice,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      if (plan.sms.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('SMS:'),
                            Text(
                              plan.sms,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Precio:'),
                          Text(
                            plan.price,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 8,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text('Cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                colorScheme.primaryContainer,
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                colorScheme.onPrimaryContainer,
                              ),
                            ),
                            child: Text('Confirmar'),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            );
            if (context.mounted) {
              if (confirmed == true) {
                await SendUssdUseCase.invokeAsync(context, ussd);
              }
            }
          },
        ),
      ),
    );
  }
}
