import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical_match/Presentation/Screens/Profile_Page.dart';
import 'package:musical_match/Presentation/Screens/search_Page.dart';
import 'package:musical_match/Presentation/Screens/About_us.dart';
import 'package:musical_match/auth.dart';
import 'package:musical_match/widgets/constants.dart';
import 'package:musical_match/widgets/decider.dart';
import 'package:musical_match/widgets/saveLocally.dart';

class HomePage extends StatefulWidget {
  static const String idScreen = "home";
  String name;

  HomePage({Key key, this.name}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final FirebaseAuth firebaseAuth= FirebaseAuth.instance;
  AuthMethods authMethods = AuthMethods();

  @override
  void initState() {
    // TODO: implement initState
   // getUserInfo();
    super.initState();
  }

 /* getUserInfo() async{
    Constants.myName = await HelperFunctions.getUserName();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff09031D),
          child: Icon(Icons.account_circle),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, ProfilePage.idScreen, (route) => false);
          }),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("Images/sahil.jpg"),
            ),
            accountName: Text("Sahil Kachhap"),
            accountEmail: Text("Sahil.kachhap111989@gmail.com"),
            decoration: BoxDecoration(
                color: Color(0xff09031D),
                image: DecorationImage(
                    image: AssetImage("Images/drawer.jpeg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text("Account"),
            trailing: Icon(Icons.person),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ProfilePage()
              ));
            },
          ),
          ListTile(
            title: Text("About Us"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> AboutUs()
              ));
            },
          ),
          ListTile(
            title: InkWell(
              child: Text("Log Out"),
              onTap: () {
                authMethods.SignOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
            ),
          )
        ],
      )),
      appBar: AppBar(
        backgroundColor: Color(0xff09031D),
        title: Text(
          "Musical Match",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>SearchPage()
              ));
            },
          ),
          IconButton(
            icon: Icon(Icons.send_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hello ${widget.name}, No Feeds Created Yet",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Click the big green button to get started.\n     Make your time more productive",
                  style: TextStyle(color: Colors.grey, fontFamily: 'OpenSans'),
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
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontFamily: 'OpenSans'),
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
