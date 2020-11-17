import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../main.dart';
import 'Forgot_Password.dart';
import 'HomePage.dart';
import 'Register_Page.dart';

class loginPage extends StatefulWidget {
  static const String idScreen = "login";

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
                                controller: EmailController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    labelText: "Email ID",
                                    labelStyle:
                                        GoogleFonts.montserrat(fontSize: 20.0)),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextFormField(
                                controller: PasswordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle:
                                        GoogleFonts.montserrat(fontSize: 20.0),
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
                                    style:
                                        GoogleFonts.montserrat(fontSize: 16.0),
                                  ),
                                  onPressed: () {
                                    if (!EmailController.text.contains("@")) {
                                      displayErrorMessage(
                                          "Email Id is not valid.", context);
                                    } else if (PasswordController
                                        .text.isEmpty) {
                                      displayErrorMessage(
                                          "Password is mandatory.", context);
                                    } else {
                                      loginUser(context);
                                    }
                                  }),
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
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18.0,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 100.0,
                              ),
                              Text("Don't have an account?",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18.0)),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      RegisterPage.idScreen, (route) => false);
                                },
                                child: Text(
                                  "Create Account",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal),
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

  void loginUser(BuildContext context) async {
    final User firebaseUser = (await firebaseAuth
            .signInWithEmailAndPassword(
                email: EmailController.text, password: PasswordController.text)
            .catchError((errorMsg) {
      displayErrorMessage("Error: " + errorMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.idScreen, (route) => false);
          displayErrorMessage("You are Logged-in now.", context);
        } else {
          firebaseAuth.signOut();
          displayErrorMessage(
              "No record exist for this user.Please create new account.",
              context);
        }
      });
    } else {
      displayErrorMessage("Error occured. Cannot Sign in.", context);
    }
  }
}
