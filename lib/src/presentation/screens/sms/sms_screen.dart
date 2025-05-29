import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/sms_list.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
import 'package:plan_go/src/presentation/widgets/sms_tile.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({super.key});

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
        itemCount: smsList.length,
        itemBuilder: (context, index) => SmsTile(
          sms: smsList[index],
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
