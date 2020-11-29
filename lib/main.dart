import 'package:flutter/material.dart';
import 'package:musical_match/Presentation/Screens/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:musical_match/widgets/decider.dart';
import 'package:musical_match/widgets/saveLocally.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MusicalApp());
}

//DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");

class MusicalApp extends StatefulWidget {
  @override
  _MusicalAppState createState() => _MusicalAppState();
}

class _MusicalAppState extends State<MusicalApp> {

  bool userIsLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
 //   getLoggedInState();
    super.initState();
  }

  /*getLoggedInState() async{
    await HelperFunctions.getUserLogInCredentials().then((value){
      setState(() {
       userIsLoggedIn = value;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Musical Match',
        home : Authenticate(),
    /*  routes: {
         // RegisterPage.idScreen: (context)=>RegisterPage(),
          //loginPage.idScreen: (context)=> loginPage(),
          HomePage.idScreen: (context)=> HomePage(),
          ProfilePage.idScreen: (context)=>ProfilePage()
      },*/
    );
  }
}