import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:musical_match/Presentation/Screens/HomePage.dart';
import 'package:musical_match/main.dart';
import 'Login_Screen.dart';

class RegisterPage extends StatefulWidget {
  static const String idScreen = "register";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

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
          Center(
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
                              controller: NameController,
                              decoration: InputDecoration(
                                labelText: "Name",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            TextFormField(
                              controller: EmailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: "Email Address",
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              controller: PasswordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: "Create Password",
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
                                    }),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: icon ? true : false,
                            ),
                            TextFormField(
                              controller: PhoneController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: "Phone no. (Optional)",
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                            Padding(padding: EdgeInsets.only(top: 40.0)),
                            MaterialButton(
                                height: 40.0,
                                minWidth: 100.0,
                                color: Colors.teal,
                                textColor: Colors.white,
                                splashColor: Colors.redAccent,
                                child: Text(
                                  "CREATE ACCOUNT",
                                ),
                                onPressed: () {
                                  if(NameController.text.length<4)
                                  {
                                    displayErrorMessage("Name must be atleast 4 characters.", context);
                                  }
                                  else if(!EmailController.text.contains("@"))
                                  {
                                      displayErrorMessage("Email Id is not valid.", context);
                                  }
                                  else if(PasswordController.text.length < 6)
                                    {
                                      displayErrorMessage("Password must be atleast 6 characters", context);
                                    }
                                  else {
                                    registerUser(context);
                                  }
                                }),
                            SizedBox(
                              height: 22.0,
                            ),
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamedAndRemoveUntil(context, loginPage.idScreen, (route) => false);
                              },
                              child: Text(
                                "Login",
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
        ],
      ),
    );
  }

  void registerUser(BuildContext context) async {
    final User firebaseUser =
        (await _firebaseAuth.createUserWithEmailAndPassword(
                email: EmailController.text, password: PasswordController.text
        ).catchError((errorMsg){
          displayErrorMessage("Error: "+errorMsg.toString(), context);
        })).user;

    if(firebaseUser != null)
    {

      Map userData ={
        "name": NameController.text.trim(),
        "email": EmailController.text.trim(),
        "phone": PhoneController.text.trim(),
      };

      userRef.child(firebaseUser.uid).set(userData);
      displayErrorMessage("Congratulation, Your Account has been created.", context);

      Navigator.pushNamedAndRemoveUntil(context, HomePage.idScreen, (route) => false);
    }
    else{
      displayErrorMessage(("User Account has not been Created"),context);
    }
  }
}

displayErrorMessage(String message , BuildContext context)
{
  Fluttertoast.showToast(msg: message);
}
