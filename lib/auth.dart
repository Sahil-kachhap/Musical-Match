import 'package:firebase_auth/firebase_auth.dart';
import 'package:musical_match/model/User.dart';

class AuthMethods{

  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel _userFormFirebaseUser(User user){
    return user!=null ? UserModel(UserID: user.uid) : null;
  }

Future SignInWithCredentials(String email, String password) async{
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      return _userFormFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }

 Future SignUpWithCredential(String email, String password) async{
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFormFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
 }

 Future ResetPassword(String email) async{
    try{
      return await auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
 }

 Future SignOut() async{
    try {
      return await auth.signOut();
    }catch(e){
      print(e.toString());
    }
 }
}