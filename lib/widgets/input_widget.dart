import 'package:flutter/material.dart';

import '../const/constant.dart';
class InputField extends StatelessWidget {
  TextEditingController controller;
  String label;
  String hint;
  String errorMessage;
  TextInputType inputType;
  bool isPassword;


  InputField({required this.controller, required this.label, required this.hint, required this.errorMessage,
    required this.inputType, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty || value.length <3) {
          return errorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          border:  OutlineInputBorder(
              borderSide: BorderSide(
                width: 5,
                color: selectionColor,
                style: BorderStyle.solid,
              ))),
      autofocus: true,
      keyboardType: inputType,
      obscureText:isPassword,
    )
    );
  }
}
