import 'package:flutter/material.dart';

TextFormField buildCustomTextFormField({TextEditingController? controller}) {
  return TextFormField(
      cursorColor: Colors.white,
      decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow))),
      style: TextStyle(color: Colors.white),
      controller: controller);
}
