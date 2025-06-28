import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plan_go/src/presentation/widgets/card_container.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: ThemeAppBar(title: 'Transferencias'),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          CardContainer(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 16,
                  children: [
                    TextField(
                      maxLines: 1,
                      maxLength: 8,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: "Numero de telefono",
                        border: OutlineInputBorder(),
                        counterText: "",
                      ),
                    ),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: "Monto",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: "Clave",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
                foregroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),
              ),
              child: Text('Transferir'),
            ),
          ),
        ],
      ),
    );
  }
}
