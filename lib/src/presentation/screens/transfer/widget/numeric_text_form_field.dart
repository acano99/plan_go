import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericTextFormField extends StatelessWidget {
  const NumericTextFormField({
    super.key,
    required this.controller,
    this.maxLength,
    this.inputFormatters,
    this.hintText,
    required this.label,
    this.prefix,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.suffix,
  });

  final TextEditingController controller;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String label;
  final Widget? prefix;
  final Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      maxLines: 1,
      maxLength: maxLength,
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        counterText: "",
        prefix: prefix,
        labelText: label,
        suffix: suffix,
      ),
    );
  }
}
