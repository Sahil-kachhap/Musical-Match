import 'package:flutter/material.dart';
import 'Presentation/Screens/Login_Screen.dart';

void main()=> runApp(MusicalApp());

class MusicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musical Match',
      home: loginPage(),
    );
  }
}
