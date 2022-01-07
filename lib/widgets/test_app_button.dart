import 'package:flutter/material.dart';

class TestAppButton extends StatelessWidget {
  const TestAppButton({
    Key? key,
    required this.name,
    required this.buttonName,
    // required this.type,
    required GlobalKey<FormState> formKey,
    required this.onPressed,
  })  : _formKey = formKey,
        super(key: key);

  final TextEditingController name;
  final GlobalKey<FormState> _formKey;
  final String buttonName;
  // final String type;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 30),
      child: TextButton(
        child: Text(
          buttonName,
          style: const TextStyle(color: Colors.white),
        ),
        // onPressed: () {},
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: onPressed,
        // () {
        //   //  print(name.text);
        //   if (type == "login") {
        //     // print("value of fo");
        //     if (buttonName == 'Submit' && _formKey.currentState!.validate()) {
        //       Navigator.of(context).pushNamed('/home');
        //     } else {
        //       Navigator.of(context).pushNamed('/signup');
        //     }
        //   } else if (type == "signup") {
        //     if (buttonName == "Submit" && _formKey.currentState!.validate()) {
        //       Navigator.of(context).pushNamed('/login');
        //     }
        //   }
        // },
      ),
    );
  }
}
