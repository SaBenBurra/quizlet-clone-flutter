import 'package:flutter/material.dart';

TextFormField buildCustomTextFormField(
    {TextEditingController? controller, String? Function(String?)? validator}) {
  return TextFormField(
      cursorColor: Colors.white,
      validator: validator,
      decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow))),
      style: TextStyle(color: Colors.white),
      controller: controller);
}
