import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/authenticate/login_teddy/login_teddy.dart';
import 'services/auth.dart';
import 'pages/helper/wrapper.dart';
//wrap everything with provider to provide user data to every file
import 'package:provider/provider.dart';

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