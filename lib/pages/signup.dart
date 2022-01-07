// ignore_for_file: unnecessary_string_escapes

import 'package:first_test_app/widgets/email_field.dart';
import 'package:first_test_app/widgets/test_app_button.dart';
import 'package:first_test_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController email = TextEditingController();
  late TextEditingController passwrd = TextEditingController();
  late TextEditingController userName = TextEditingController();
  late TextEditingController addr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Signup Page")),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/hey.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                EmailField(
                  name: email,
                  hintTexts: 'Enter email',
                  labelText: 'Email',
                ),
                NewPassField(textController: passwrd),
                TextFieldCommon(
                    name: userName,
                    hintTexts: 'Enter Full name',
                    labelText: 'Name',
                    iconName: const Icon(Icons.account_circle_sharp)),
                TextFieldCommon(
                    name: userName,
                    hintTexts: 'Enter address',
                    labelText: 'Address',
                    iconName: const Icon(Icons.add_location)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TestAppButton(
                        buttonName: "Submit",
                        name: email,
                        formKey: _formKey,
                        onPressed: onSignUp),
                    // TestAppButton(
                    //     buttonName: "login",
                    //     name: email,
                    //     formKey: _formKey,
                    //     type: "signup"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onSignUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed('/login');
    }
  }
}
