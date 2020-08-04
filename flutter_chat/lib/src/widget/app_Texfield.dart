import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String inputText;
  final bool obscureText;
  final ValueChanged<String> onSaved;
  final TextEditingController controller;
  final FocusNode focus;
  final FormFieldValidator<String> validator;
  final bool autoValidate;
  const AppTextField(
      {this.inputText,
      this.onSaved,
      this.obscureText,
      this.controller,
      this.focus,
      this.validator,
      this.autoValidate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focus,
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        autovalidate: autoValidate,
        obscureText: obscureText == null ? false : obscureText,
        decoration: InputDecoration(
            hintText: inputText,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0))),
        textAlign: TextAlign.center);
  }
}
