import 'package:first_test_app/widgets/email_field.dart';
import 'package:first_test_app/widgets/test_app_button.dart';
import 'package:first_test_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  // togglePasswordView() {
  //   setState(() {
  //     isHidden = !isHidden;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    late TextEditingController email = TextEditingController();
    late TextEditingController passwrd = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login Page",
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              EmailField(
                name: email,
                hintTexts: 'Enter email',
                labelText: 'Email',
              ),
              NewPassField(textController: passwrd),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TestAppButton(
                    buttonName: "Submit",
                    onPressed: onLogin,
                    name: email,
                    formKey: _formKey,
                  ),
                  TestAppButton(
                    buttonName: "Signup",
                    name: email,
                    formKey: _formKey,
                    onPressed: navigateToSignup,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed('/home');
    } else {
      //Navigator.of(context).pushNamed('/signup');
    }
  }

  void navigateToSignup() {
    Navigator.of(context).pushNamed('/signup');
  }
}
