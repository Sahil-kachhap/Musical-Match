import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:musical_match/Presentation/Screens/HomePage.dart';
import 'package:musical_match/Presentation/Screens/Profile_Page.dart';
import 'package:musical_match/Presentation/Screens/Register_Page.dart';
import 'Presentation/Screens/Login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MusicalApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");

class MusicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Musical Match',
        initialRoute: loginPage.idScreen,
      routes: {
          RegisterPage.idScreen: (context)=>RegisterPage(),
          loginPage.idScreen: (context)=>loginPage(),
        HomePage.idScreen: (context)=> HomePage(),
          ProfilePage.idScreen: (context)=>ProfilePage()
      },

    );
  }
}