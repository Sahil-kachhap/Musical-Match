import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String idScreen = "home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/sahil2.jpg"),
                ),
                accountName: Text("Sahil Kachhap"),
                accountEmail: Text("Sahil.kachhap111989@gmail.com"),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/drawer.jpeg"),
                        fit: BoxFit.cover)),
              ),
              ListTile(
                title: Text("Account Settings"),
                trailing: Icon(Icons.person),
                onTap: () {},
              ),
              ListTile(
                title: Text("Log Out"),
              )
            ],
          )),
      appBar: AppBar(
        title: Text("Musical Match",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                " No Feeds Created Yet",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,fontFamily: 'OpenSans'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Click the big green button to get started.\n     Make your time more productive",
                  style: TextStyle(color: Colors.grey,fontFamily: 'OpenSans'),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 12.0)),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: MaterialButton(
                    color: Colors.green,
                    child: Text(
                      "New Project",
                      style: TextStyle(fontSize: 16.0, color: Colors.white,fontFamily: 'OpenSans'),
                    ),
                    shape: StadiumBorder(),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
