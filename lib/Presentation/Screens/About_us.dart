import 'package:flutter/material.dart';
import 'Profile_Page.dart';

void main() => runApp(AboutUs());

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Us',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff09031D),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> ProfilePage()
              ));
            },
          ),
          title: Text('About Us'),
        ),
        body:  Container(
          width: MediaQuery.of(context).size.width ,
          padding: EdgeInsets.all(10),
          child: Text('Team Alphacode \n\nMembers :\n_____________\n\n Sahil Kachhap \n\n Vivek Pattanayak \n\n S Manas ', textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}