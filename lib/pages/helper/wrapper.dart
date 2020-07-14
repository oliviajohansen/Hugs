import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../authenticate/authenticate.dart';
import '../home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
