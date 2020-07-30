import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../authenticate/authenticate.dart';
import '../home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Wrap widget tree in a provider and supply the provider with auth change stream
    //Whenever there is new data in the auth change stream, the provider makes
    //it accessible to any descendant in the widget tree
    //check if its a logout or login and render pages respectively
    final firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
