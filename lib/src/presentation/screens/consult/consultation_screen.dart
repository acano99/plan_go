import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plan_go/src/data/default/consultations_list.dart';
import 'package:plan_go/src/presentation/globals/ussd_provider.dart';
import 'package:plan_go/src/presentation/widgets/consultation_tile.dart';
import 'package:plan_go/src/presentation/widgets/modal_body.dart';
import 'package:provider/provider.dart';

import '../../../config/router/router.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Text(
              'Consultas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                onPressed: () => context.pushNamed(AppRouter.settings),
                icon: Icon(Icons.settings_rounded),
              ),
            ],
            actionsPadding: EdgeInsets.only(right: 8),
          ),
        ],
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
                builder: (context) => ModalBody(
                  titleIcon: Icons.balance_rounded,
                  title: consultation.name,
                  cancelButtonLabel: 'Cancelar',
                  cancelButtonOnPressed: () => Navigator.of(context).pop(),
                  confirmButtonLabel: 'Confirmar',
                  confirmButtonOnPressed: () async {
                    Navigator.of(context).pop(false);
                    if (context.mounted) {
                      await context.read<UssdProvider>().sendUssd(
                        context,
                        ussd,
                      );
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
                      child: Text(
                        consultation.label,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
