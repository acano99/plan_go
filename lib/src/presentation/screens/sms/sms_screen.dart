import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plan_go/src/data/default/sms_list.dart';
import 'package:plan_go/src/presentation/globals/ussd_provider.dart';
import 'package:plan_go/src/presentation/widgets/modal_body.dart';
import 'package:plan_go/src/presentation/widgets/sms_tile.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';
import 'package:provider/provider.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: ThemeAppBar(title: 'SMS'),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          mainAxisExtent: 120,
        ),
        itemCount: smsList.length,
        itemBuilder: (context, index) => SmsTile(
          sms: smsList[index],
          onTap: (ussd) async {
            final plan = smsList[index];

            await showModalBottomSheet(
              context: context,
              builder: (context) => ModalBody(
                titleIcon: Icons.sms_rounded,
                title: plan.name,
                cancelButtonLabel: 'Cancelar',
                cancelButtonOnPressed: () => Navigator.of(context).pop(),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
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
