import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../authenticate/authenticate.dart';
import '../home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Listen for changes in authentication, when there is a change,
    //check if its a logout or login and render pages respectively
    final firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
