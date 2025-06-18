import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/voices_list.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';
import 'package:plan_go/src/presentation/widgets/voice_tile.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

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
        itemCount: voicesList.length,
        itemBuilder: (context, index) => VoiceTile(
          voice: voicesList[index],
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
