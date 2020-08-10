import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/authenticate/authenticate.dart';
import 'package:hugsmobileapp/pages/authenticate/sign_up.dart';
import 'package:hugsmobileapp/pages/chat/chats.dart';
import 'pages/achievements/view.dart';
import 'pages/authenticate/login.dart';
import 'services/auth.dart';
import 'pages/helper/wrapper.dart';
//wrap everything with provider to provide user data to every file
import 'package:provider/provider.dart';
import 'package:hugsmobileapp/HuggerList.dart';


void main() => runApp(MaterialApp(
    initialRoute: '/authenticate',
    routes: {
      '/login': (context) => Login(),
      '/view': (context) => ViewPage(),
      '/signup': (context) => SignUp(),
      '/authenticate': (context) => Authenticate()
    }
));

//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamProvider<FirebaseUser>.value(
//      value: AuthService().user,
//      child: MaterialApp(
//        home: Wrapper()
//      ),
//    );
//  }
//}