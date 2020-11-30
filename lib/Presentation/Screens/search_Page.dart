import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musical_match/Presentation/Screens/Conversation_page.dart';
import 'package:musical_match/database.dart';
import 'package:musical_match/widgets/constants.dart';
import 'package:musical_match/widgets/saveLocally.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextController = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  QuerySnapshot searchSnapshot;

  Widget searchList(){
    return searchSnapshot!=null ? ListView.builder(
        itemCount: searchSnapshot.docs.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return SearchTile(
            username: searchSnapshot.docs[index].data()["name"],
            userEmail: searchSnapshot.docs[index].data()["email"],
          );
        }):Container();
  }

  initiateSearch(){
    databaseMethods.getUserByName(searchTextController.text).then((value){
      setState(() {
        searchSnapshot = value;
      });
    });
  }

  createChatRoom({String username}){
    if(username != Constants.myName) {
      String chatRoomId = getChatRoomId(username, Constants.myName);

      List<String> users = [username, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatRoomId": chatRoomId
      };
      DatabaseMethods().createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ConversationScreen()));
    }else{

    }
  }

  Widget SearchTile({String username ,String userEmail}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24 ,vertical: 16),
      child: Row(
        children: [
          Column(
            children: [
              Text(username),
              Text(userEmail),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
                createChatRoom(username: username);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Text("Message"),
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchTextController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Search Username...",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none),
                  )),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      initiateSearch();
                    },
                  )
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }
}

getChatRoomId(String a,String b){
  if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)){
    return "$b\_$a";
  }else{
    return "$b\_$a";
  }
}
