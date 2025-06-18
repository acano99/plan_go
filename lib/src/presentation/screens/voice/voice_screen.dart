import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/voices_list.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
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
          onTap: (ussd) async => await SendUssdUseCase.invoke(context, ussd),
        ),
      ),
    );
  }
}
