import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Forgot_Password.dart';
import 'HomePage.dart';
import 'Register_Page.dart';

class loginPage extends StatefulWidget {
  static const String idScreen = "login";

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool icon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("Assets/Images/musician.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Form(
                      child: Theme(
                        data: ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.teal,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  labelText: "Email ID",
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    suffixIcon: IconButton(
                                        icon: icon
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                        onPressed: () {
                                          setState(() {
                                            icon == true
                                                ? icon = false
                                                : icon = true;
                                          });
                                        })),
                                keyboardType: TextInputType.text,
                                obscureText: icon ? true : false,
                              ),
                              Padding(padding: EdgeInsets.only(top: 40.0)),
                              MaterialButton(
                                  height: 40.0,
                                  minWidth: 100.0,
                                  color: Colors.teal,
                                  textColor: Colors.white,
                                  splashColor: Colors.redAccent,
                                  child: Text(
                                    "LOGIN",
                                  ),
                                  onPressed: () {}
                                  ),
                              SizedBox(
                                height: 13.0,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return ForgotPassword();
                                        }));
                                  });
                                },
                                child: Text(
                                  "Forgot Your Password?",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                              SizedBox(
                                height: 100.0,
                              ),
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context, RegisterPage.idScreen, (route) => false);
                                },
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
