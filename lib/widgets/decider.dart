import 'package:flutter/cupertino.dart';
import 'package:musical_match/Presentation/Screens/Login_Screen.dart';
import 'package:musical_match/Presentation/Screens/Register_Page.dart';

class Authenticate extends StatefulWidget {
  static const String idScreen = "authenticate";

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIN = true;

  void toggleScreen(){
    setState(() {
      showSignIN = !showSignIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIN){
      return loginPage(toggleScreen);
    }else{
      return RegisterPage(toggleScreen);
    }
  }
}
