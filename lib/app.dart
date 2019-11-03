
import 'package:flutter_form/ui/signup.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.lightBlue,
          primaryColor: Colors.white,
          //this will change the color of icon which shows with cursor
          textSelectionHandleColor: Colors.lightBlue,),
      title: "Pre_login",
    );
  }
}
