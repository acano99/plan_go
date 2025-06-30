import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/consultations_list.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
import 'package:plan_go/src/presentation/globals/ussd_provider.dart';
import 'package:plan_go/src/presentation/widgets/consultation_tile.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';
import 'package:provider/provider.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: ThemeAppBar(title: 'Consultas'),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          mainAxisExtent: 120,
        ),
        itemCount: consultationsList.length,
        itemBuilder: (context, index) => ConsultationTile(
          consultation: consultationsList[index],
          onTap: (ussd) async {
            final consultation = consultationsList[index];

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
                            Icons.balance_rounded,
                            size: 20,
                            color: colorScheme.primary,
                          ),
                          Text(
                            consultation.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      Text(consultation.label, style: TextStyle(fontSize: 14)),
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
                await context.read<UssdProvider>().sendUssd(context, ussd);
              }
            }
          },
        ),
      ),
    );
  }
}
