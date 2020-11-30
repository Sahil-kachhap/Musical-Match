/*import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  static String UserLoggedInKey = "IsLoggedIn";
  static String UserNameKey = "UsernameKey";
  static String UserEmailKey = "UserEmailKey";

  static Future<bool> saveUserLogInCredentials(bool isUserLoggedIn) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(UserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(UserNameKey, userName);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(UserEmailKey, userEmail);
  }

  static Future<bool> getUserLogInCredentials() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getBool(UserLoggedInKey);
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString(UserNameKey);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString(UserEmailKey);
  }
}*/