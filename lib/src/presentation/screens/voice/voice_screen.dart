import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/voices_list.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';
import 'package:plan_go/src/presentation/widgets/voice_tile.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: ThemeAppBar(title: 'Voz'),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          mainAxisExtent: 120,
        ),
        itemCount: voicesList.length,
        itemBuilder: (context, index) => VoiceTile(
          voice: voicesList[index],
          onTap: (ussd) async {
            final plan = voicesList[index];

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
                            Icons.call_rounded,
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
                          Text('Minutos:'),
                          Text(
                            plan.minutes,
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
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: colorScheme.tertiaryContainer,
                        ),
                        child: Text(
                          'Atencion: Al comprar un plan de voz lo esta haciendo con su saldo principal',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: colorScheme.onTertiaryContainer,
                          ),
                        ),
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
                await SendUssdUseCase.invoke(context, ussd);
              }
            }
          },
        ),
      ),
    );
  }
}
