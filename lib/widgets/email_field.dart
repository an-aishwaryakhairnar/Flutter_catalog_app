import 'package:first_test_app/validations/validators.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class EmailField extends StatelessWidget {
  final String hintTexts;
  final String labelText;

  const EmailField(
      {Key? key,
      required this.name,
      required this.hintTexts,
      required this.labelText})
      : super(key: key);

  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: name,
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        hintText: hintTexts,
        labelText: labelText,
      ),
      validator: (value) {
        RegExp regex = RegExp(RegularExpressions.emailPattern.toString());

        if (value!.isEmpty) {
          return 'Email is required';
        } else if (!regex.hasMatch(value)) {
          return MessageConstants.invalidEmail;
        } else {
          return null;
        }
      },
    );
  }
}
