import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  getUserByName(String name) async{
    return await FirebaseFirestore.instance.collection("users").where("name",isEqualTo: name).get();
  }

  getUserByEmail(String UserEmail) async{
    return await FirebaseFirestore.instance.collection("users").where("email",isEqualTo: UserEmail).get();
  }

  uploadUserInfo(userMap){
   FirebaseFirestore.instance.collection("users").add(userMap);
  }

  createChatRoom(String roomId, chatRoomMap){
    FirebaseFirestore.instance.collection("ChatRoom").doc(roomId).set(chatRoomMap);
  }
}