import 'package:flutter/material.dart';
import 'package:plan_go/src/data/default/consultations_list.dart';
import 'package:plan_go/src/domain/services/ussd_service.dart';
import 'package:plan_go/src/domain/use_cases/send_ussd_use_case.dart';
import 'package:plan_go/src/presentation/widgets/consultation_tile.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

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
        itemCount: consultationsList.length,
        itemBuilder: (context, index) => ConsultationTile(
          consultation: consultationsList[index],
          onTap: (ussd) async => await SendUssdUseCase.invoke(context, ussd),
        ),
      ),
    );
  }
}
