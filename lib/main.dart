import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/authenticate/authenticate.dart';
import 'package:hugsmobileapp/pages/authenticate/login_teddy/login_teddy.dart';
import 'package:hugsmobileapp/pages/authenticate/sign_up.dart';
import 'package:hugsmobileapp/pages/chat/chats.dart';
import 'package:hugsmobileapp/pages/home/HomePage1.dart';
import 'package:hugsmobileapp/pages/home/home.dart';
import 'package:hugsmobileapp/pages/new_hug/hug.dart';
import 'package:hugsmobileapp/pages/new_hug/hug2.dart';
import 'package:hugsmobileapp/pages/profile/my_profile.dart';
import 'package:hugsmobileapp/pages/profile/other_profile.dart';
import 'package:hugsmobileapp/pages/profile/post.dart';
import 'pages/achievements/view.dart';
import 'pages/authenticate/login.dart';
import 'services/auth.dart';
import 'pages/helper/wrapper.dart';
//wrap everything with provider to provide user data to every file
import 'package:provider/provider.dart';
import 'package:hugsmobileapp/HuggerList.dart';

//
//void main() => runApp(MaterialApp(
//    initialRoute: '/authenticate',
//    routes: {
//      '/login': (context) => Login(),
//      '/view': (context) => ViewPage(),
//      '/signup': (context) => SignUp(),
//      '/authenticate': (context) => Authenticate()
//    }
//));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
          home: LoginTeddy()
      ),
    );
  }
}