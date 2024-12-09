import 'package:flutter/material.dart';

import '../const/constant.dart';
class TeaxtAreaField extends StatelessWidget {
 String label;
 String hint;
 String errorMessage;
 TextInputType inputType;
 TextEditingController controller;


 TeaxtAreaField({
   required this.label,
   required this.hint,
   required this.errorMessage,
   required this.inputType,
   required this.controller
});

 @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      maxLines: 7,
      minLines: 4,
      keyboardType: inputType,
      obscureText:false,
    );

  }
}
