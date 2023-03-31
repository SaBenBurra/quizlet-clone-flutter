import 'package:flutter/material.dart';

TextFormField buildCustomTextFormField(
    {TextEditingController? controller,
    String? Function(String?)? validator,
    double? fontSize}) {
  return TextFormField(
      cursorColor: Colors.white,
      validator: validator,
      decoration: const InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow))),
      style: TextStyle(color: Colors.white, fontSize: fontSize),
      controller: controller);
}
