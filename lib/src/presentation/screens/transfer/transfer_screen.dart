import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plan_go/src/presentation/screens/sms/sms_screen.dart';
import 'package:plan_go/src/presentation/screens/transfer/transfer_provider.dart';
import 'package:plan_go/src/presentation/screens/transfer/widget/numeric_text_form_field.dart';
import 'package:plan_go/src/presentation/widgets/blue_button.dart';
import 'package:plan_go/src/presentation/widgets/card_container.dart';
import 'package:plan_go/src/presentation/widgets/modal_body.dart';
import 'package:plan_go/src/presentation/widgets/red_button.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';
import 'package:plan_go/src/presentation/widgets/warning_container.dart';
import 'package:provider/provider.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void resetForm() {
    _phoneController.clear();
    _amountController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _amountController.dispose();
    _passwordController.dispose();
    _phoneFocusNode.dispose();
    _amountFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.read<TransferProvider>();
    final uiState = context.watch<TransferProvider>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void onPressed() {
      FocusManager.instance.primaryFocus?.unfocus();

      if (!formKey.currentState!.validate()) return;

      provider.setFormsParams(
        _phoneController.text,
        _passwordController.text,
        _amountController.text,
      );

      showModalBottomSheet(
        context: context,
        builder: (context) => ModalBody(
          title: 'Confirmar Transferencia',
          titleIcon: Icons.monetization_on_rounded,
          cancelButtonLabel: 'Cancelar',
          cancelButtonOnPressed: () => Navigator.of(context).pop(),
          confirmButtonLabel: 'Transferir',
          confirmButtonOnPressed: () async {
            Navigator.of(context).pop();
            resetForm();
            await provider.makeTransfer(context);
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
                spacing: 4,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Teléfono:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      Text(
                        uiState.phoneNumber.toString(),
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
                        'Monto:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      Text(
                        uiState.amount.toString(),
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
              'Está seguro que desea proseguir con la transacción?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: ThemeAppBar(title: 'Transferencias'),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          CardContainer(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    NumericTextFormField(
                      controller: _phoneController,
                      focusNode: _phoneFocusNode,
                      hintText: 'Ej: 55555555',
                      label: 'Teléfono',
                      onFieldSubmitted: (_) {
                        _phoneFocusNode.unfocus();
                        _amountFocusNode.requestFocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Teléfono no válido';
                        }
                        if (value.length < 8) {
                          return 'El télefono debe poseer 8 dígitos';
                        }
                        return null;
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 8,
                    ),
                    NumericTextFormField(
                      controller: _amountController,
                      focusNode: _amountFocusNode,
                      hintText: 'Ej: 27',
                      label: 'Monto',
                      onFieldSubmitted: (_) {
                        _amountFocusNode.unfocus();
                        _passwordFocusNode.requestFocus();
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    NumericTextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      label: 'Contrasena',
                      onFieldSubmitted: (_) async {
                        _passwordFocusNode.unfocus();
                        onPressed();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Contrasenna requerida';
                        }
                        return null;
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      obscureText: uiState.obscureText,
                      suffix: GestureDetector(
                        onTap: () => provider.toggleObscureText(),
                        child: Icon(
                          uiState.obscureText
                              ? Icons.lock_open_rounded
                              : Icons.lock_rounded,
                        ),
                      ),
                    ),
                    WarningContainer(
                      text:
                          'Atencion: Si desea transferir centavos (Ej: 27.5) deje el monto en blanco.',
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: RedButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();

                              provider.clearForm();
                              resetForm();
                            },
                            label: 'Reiniciar',
                          ),
                        ),
                        Expanded(
                          child: BlueButton(
                            onPressed: onPressed,
                            label: 'Continuar',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
