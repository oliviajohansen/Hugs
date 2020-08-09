import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {

  static String isLoggedInKey = "ISLOGGEDIN";
  static String usernameKey = "USERNAME";
  static String userEmailKey = "USEREMAIL";


  // Saving data to shared preferences

  static Future <bool> saveUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(isLoggedInKey, isLoggedIn);
  }

  static Future <bool> saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    print('save username');
//    print(username);
    return await prefs.setString(usernameKey, username);
  }

  static Future <bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmailKey, userEmail);
  }

  // Getting data from SharedPreferences

  static Future <bool> getUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(isLoggedInKey);
  }

  static Future <String> getUsername() async {
//    print('get Username');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(usernameKey);
  }

  static Future <String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(userEmailKey);
  }


}