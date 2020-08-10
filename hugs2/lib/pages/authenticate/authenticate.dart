import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/authenticate/login.dart';
import 'package:hugsmobileapp/pages/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLoginPage = true;
  void toggleView() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? Login(toggleView: toggleView)
        : SignUp(toggleView: toggleView);
  }
}
