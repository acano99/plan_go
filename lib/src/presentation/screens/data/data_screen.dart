import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plan_go/src/data/default/dataPlansList.dart';
import 'package:plan_go/src/presentation/globals/ussd_provider.dart';
import 'package:plan_go/src/presentation/widgets/data_plan_tile.dart';
import 'package:plan_go/src/presentation/widgets/modal_body.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';
import 'package:provider/provider.dart';

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

            await showModalBottomSheet(
              context: context,
              builder: (context) => ModalBody(
                titleIcon: Icons.signal_cellular_4_bar_rounded,
                title: plan.name,
                cancelButtonLabel: 'Cancelar',
                cancelButtonOnPressed: () => context.pop(),
                confirmButtonLabel: 'Comprar',
                confirmButtonOnPressed: () async {
                  if (context.mounted) {
                    context.pop();
                    await context.read<UssdProvider>().sendUssd(context, ussd);
                  }
                },
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colorScheme.secondaryContainer,
                    ),
                    child: Column(
                      spacing: 4,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Datos:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSecondaryContainer,
                              ),
                            ),
                            Text(
                              plan.data,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSecondaryContainer,
                              ),
                            ),
                          ],
                        ),
                        if (plan.voice.isNotEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Voz:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                              ),
                              Text(
                                plan.voice,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        if (plan.sms.isNotEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SMS:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                              ),
                              Text(
                                plan.sms,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Precio:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSecondaryContainer,
                              ),
                            ),
                            Text(
                              plan.price,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSecondaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Está seguro que desea raelizar la compra?',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
