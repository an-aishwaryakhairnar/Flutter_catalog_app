import 'package:first_test_app/pages/cart.dart';
import 'package:first_test_app/pages/home.dart';
import 'package:first_test_app/pages/login.dart';
import 'package:first_test_app/pages/signup.dart';
import 'package:first_test_app/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'router/app.router.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MyCart(),
        ),
      ],
      child: MaterialApp(
        // initialRoute: "/home",
        debugShowCheckedModeBanner: false,

        // routes: customRoutes,
        //initialRoute: MyRoutes.H\\,
        routes: {
          "/": (context) => const Login(),
          MyRoutes.homeRoute: (context) => const Home(),
          MyRoutes.loginRoute: (context) => const Login(),
          MyRoutes.signupRoute: (context) => const SignUp(),
          MyRoutes.cartRoute: (context) => const Cart(),
        },
        themeMode: ThemeMode.system,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
      ),
    );
  }
}
