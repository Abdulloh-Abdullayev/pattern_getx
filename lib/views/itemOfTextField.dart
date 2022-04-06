import 'package:flutter/material.dart';

TextFormField texFormField({required TextEditingController controller,required String hintText}) {
  return TextFormField(
    textInputAction: TextInputAction.next,
    controller:controller,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
    ),
  );
}