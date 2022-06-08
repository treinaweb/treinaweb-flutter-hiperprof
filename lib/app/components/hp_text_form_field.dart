import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HPTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialValue;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final Color? fillColor;
  final bool? isDense;
  final String? label;
  const HPTextFormField({
    Key? key,
    this.padding,
    this.validator,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.initialValue,
    this.onTap,
    this.inputFormatters,
    this.suffix,
    this.fillColor,
    this.isDense,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: TextFormField(
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        initialValue: initialValue,
        onTap: onTap,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffix: suffix,
            fillColor: fillColor,
            isDense: isDense,
            label: Text(label ?? '')),
      ),
    );
  }
}
