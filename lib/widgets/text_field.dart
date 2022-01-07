import 'package:first_test_app/validations/validators.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldCommon extends StatelessWidget {
  final String hintTexts;
  final String labelText;
  final TextEditingController name;
  // ignore: prefer_typing_uninitialized_variables
  final Icon iconName;

  const TextFieldCommon(
      {Key? key,
      required this.name,
      required this.hintTexts,
      required this.labelText,
      required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: iconName,
        hintText: hintTexts,
        labelText: labelText,
      ),
    );
  }
}

class NewPassField extends StatefulWidget {
  final TextEditingController textController;
  const NewPassField({Key? key, required this.textController})
      : super(key: key);

  @override
  _NewPassFieldState createState() => _NewPassFieldState();
}

class _NewPassFieldState extends State<NewPassField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      obscureText: showPassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
              showPassword == true ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            showPassword = !showPassword;
            setState(() {});
          },
        ),
        icon: const Icon(Icons.phone),
        hintText: 'Enter password',
        labelText: 'Password',
      ),
      validator: (value) {
        RegExp regex = RegExp(RegularExpressions.passwordPattern.toString());
        if (value!.isEmpty) {
          return "password is required";
        } else if ((value.length <= 6) || (value.length > 16)) {
          return MessageConstants.invalidPassLength;
        } else if (!regex.hasMatch(value)) {
          return MessageConstants.invalidPassword;
        }
        return null;
      },
    );
  }
}
