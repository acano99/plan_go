import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/sms_list.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';
import 'package:plan_go/src/presentation/widgets/sms_tile.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultas')),
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
              final response = await SendUssdService.sendUssd(ussd);
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(response)));
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            }
          },
        ),
      ),
    );
  }
}
