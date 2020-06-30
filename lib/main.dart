import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/authenticate/authenticate.dart';
import 'package:hugsmobileapp/pages/authenticate/sign_up.dart';
import 'pages/view.dart';
import 'pages/authenticate/login.dart';
//wrap everything with provider to provide user data to every file
//import 'package:provider/provider.dart';


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
//    return MaterialApp(
//      home: Wrapper()
//    );
//  }
//}