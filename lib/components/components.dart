// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hotel/api/const.dart';

Widget defaultButton(
    {required double width,
    required Function() function,
    required String label,
    Color buttonColor = primaryColor,
    Color TextColor = Colors.white,
    double radius = 8.0}) {
  return Container(
      width: width,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          label,
          style: TextStyle(
              color: TextColor, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ));
}

// General Form

Widget defaultForm({
  required TextEditingController controller,
  required TextInputType type,
  required IconData prefixIcon,
  IconData? sufixIcon,
  bool validate = false,
  String validationMessage = 'This field is required',
  bool isPassword = false,
  required String label,
  Color borderColor = primaryColor,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword == true ? true : false,
    keyboardType: type,
    validator: validate == true
        ? (value) {
            if (value!.isEmpty) {
              return validationMessage;
            }
            if (isPassword == true && value.length < 8) {
              return 'The Password is too short';
            }
            return null;
          }
        : null,
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      suffixIcon: sufixIcon != null ? Icon(sufixIcon) : null,
      labelText: label,
      border: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.solid, color: borderColor)),
    ),
  );
}

Messanger(
    {required BuildContext context,
    required String message,
    bool status = true}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    backgroundColor: status ? primaryColor : Colors.redAccent,
  ));
}
