import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_match/Presentation/Screens/HomePage.dart';
import 'package:musical_match/User_Repository.dart';

class ProfilePage extends StatefulWidget {
  static const String idScreen = "profile";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List tags = ['music', 'vocal', 'guitar', 'piano', 'flute'];

  List Categories = ['Featured', 'Favorites', 'Collabs', 'Live Event'];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: (){
          Navigator.pushNamedAndRemoveUntil(context,
              HomePage.idScreen, (route) => false);
        },
      ),
      key: _scaffoldKey,
      backgroundColor: Color(0xff09031D),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text("Profile"),
        elevation: 0,
        backgroundColor: Color(0xff09031D),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: _openEndDrawer,
            ),
          ),
        ],
      ),
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.48,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('More Options',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
                decoration: BoxDecoration(
                  color: Color(0xff09031D),
                ),
              ),
              ListTile(
                title: Text('About Us'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      // Disable opening the end drawer with a swipe gesture accidentaly
      endDrawerEnableOpenDragGesture: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 7.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("Assets/Images/sahil.jpg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user?.displayName}",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 17,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "${user?.phoneNumber}",//"Bokaro- Jharkhand",
                                style: TextStyle(
                                    color: Colors.white,
                                    wordSpacing: 2,
                                    letterSpacing: 4),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 38.0, left: 38, top: 15, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "followers",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    width: 0.2,
                    height: 22,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "following",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    width: 0.2,
                    height: 22,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 18.0, right: 18.0, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(33)),
                      gradient: LinearGradient(
                          colors: [Color(0xff6D0EB5), Color(0xff4059F1)],
                          begin: Alignment.bottomRight,
                          end: Alignment.centerLeft),
                    ),
                    child: Text(
                      'Follow',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tags.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      border: Border.all(color: Colors.white12),
                    ),
                    margin: EdgeInsets.only(right: 13),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 13.0, bottom: 5, right: 20, left: 20),
                      child: Text(
                        tags[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 33.0, right: 25, left: 25),
                      child: Text(
                        'Portfolio',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 33),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 25, left: 25),
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 17.0, top: 3),
                            child: index == 1
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        Categories[index],
                                        style: TextStyle(
                                            color: Color(0xff434AE8),
                                            fontSize: 19),
                                      ),
                                      CircleAvatar(
                                        radius: 2,
                                        backgroundColor: Color(0xff434AE8),
                                      )
                                    ],
                                  )
                                : Text(
                                    Categories[index],
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.9),
                                        fontSize: 19),
                                  ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 200,
                              padding: EdgeInsets.only(right: 25, left: 25),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
