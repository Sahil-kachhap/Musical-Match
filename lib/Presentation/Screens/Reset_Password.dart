import 'package:flutter/material.dart';
import 'Login_Screen.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Reset Password",style: TextStyle(fontFamily: 'OpenSans',color: Colors.white,fontSize: 27.0),),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: "Enter New Password",
                                  suffixIcon: IconButton(icon: icon ? Icon(Icons.visibility_off):Icon(Icons.visibility),
                                      onPressed: (){
                                        setState(() {
                                          icon==true ? icon = false :icon= true;
                                        });
                                      })
                              ),
                              obscureText: icon ? true : false,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: "Confirm New Password",
                              ),
                              obscureText: icon ? true : false,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            Padding(padding: EdgeInsets.only(top: 40.0)),
                            MaterialButton(
                                color: Colors.teal,
                                height: 40.0,
                                minWidth: 100.0,
                                textColor: Colors.white,
                                child: Text("DONE",style: TextStyle(fontFamily: 'Montserrat'),),
                                onPressed: (){
                                  setState(() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return loginPage();
                                    }));
                                  });
                                }),
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
}
