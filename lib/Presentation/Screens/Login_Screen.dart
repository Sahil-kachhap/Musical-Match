import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_match/Presentation/Screens/HomePage.dart';
import 'package:musical_match/Presentation/Screens/Profile_Page.dart';
import 'package:musical_match/auth.dart';
import 'package:musical_match/database.dart';
import 'package:musical_match/widgets/saveLocally.dart';
import 'Forgot_Password.dart';
import 'Register_Page.dart';
import '../../main.dart';

class loginPage extends StatefulWidget {
  static const String idScreen = "login";

  final Function toggle;
  loginPage(this.toggle);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = AuthMethods();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  bool isLoading = false;
  QuerySnapshot UserInfoSnapshot ;

  signIn(){
    if(formKey.currentState.validate()){
     // HelperFunctions.saveUserEmail(EmailController.text);

      databaseMethods.getUserByEmail(EmailController.text).then((value){
        UserInfoSnapshot = value;
       // HelperFunctions.saveUserName(UserInfoSnapshot.docs[0].data()["name"]);
      });

      setState(() {
        isLoading=true;
      });



      authMethods.SignInWithCredentials(EmailController.text, PasswordController.text).then((value){
        if(value!=null){
        //  HelperFunctions.saveUserLogInCredentials(true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }
      });


    }
  }
  //final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
                      key: formKey,
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
                                validator: (value){
                                  return RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                                  ).hasMatch(value)?null:"Please provide a valid Email Id.";
                                },//validateEmail,
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
                                validator: (value){
                                  return value.length >= 6 ? null : "Password must be atleast 6 characters long.";
                                },
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
                                   /* if (PasswordController.text.isEmpty) {
                                      displayErrorMessage(
                                          "Password is mandatory.", context);
                                    } else {
                                      loginUser(context);
                                    }*/
                                   signIn();
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
                                 /* Navigator.pushNamedAndRemoveUntil(context,
                                      RegisterPage.idScreen, (route) => false);*/
                                 widget.toggle();
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

  /*void loginUser(BuildContext context) async {
    final User firebaseUser = (await firebaseAuth
            .signInWithEmailAndPassword(
                email: EmailController.text, password: PasswordController.text)
            .catchError((errorMsg) {
      displayErrorMessage("Error: " + errorMsg.toString(), context);
    }))
        .user;*/

  /*  if (firebaseUser != null) {
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, ProfilePage.idScreen, (route) => false);
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
    }*/
  }

 /* String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}*/
