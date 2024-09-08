import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String? label;
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;

  TextFieldComponent(
      {this.label,
      this.hintText,
      this.controller,
      this.icon,
      this.textInputType,
      this.minLines,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: true,
      controller: controller ?? null,
      minLines: minLines ?? null,
      maxLines: maxLines ?? null,
      decoration: InputDecoration(
        labelText: label ?? null,
        hintText: hintText ?? null,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        icon: Icon(icon),
      ),
      style: TextStyle(color: Colors.black, fontSize: 15.0),
      keyboardType: textInputType ?? TextInputType.text,
    );
  }
}
