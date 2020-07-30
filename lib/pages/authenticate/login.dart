import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/helper/helperFunctions.dart';
import 'package:hugsmobileapp/services/auth.dart';
import '../bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import '../authenticate/signin_button.dart';
import '../authenticate/teddy_controller.dart';
import '../authenticate/tracking_text_input.dart';


class Login extends StatefulWidget {

  final Function toggleView;
  Login({ this.toggleView });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }


  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
//      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: <Widget> [
            Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    // Box decoration takes a gradient
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.0, 1.0],
                      colors: [
                        Color.fromRGBO(170, 207, 211, 1.0),
                        Color.fromRGBO(93, 142, 155, 1.0),
                      ],
                    ),
                  ),
                )),
            Positioned.fill(
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 200,
                            padding: const EdgeInsets.only(left: 30.0, right:30.0),
                            child: FlareActor(
                              "assets/Teddy.flr",
                              shouldClip: false,
                              alignment: Alignment.bottomCenter,
                              fit: BoxFit.contain,
                              controller: _teddyController,
                            )),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Form(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TrackingTextInput(
                                          label: "Email",
                                          hint: "What's your email address?",
                                          onCaretMoved: (Offset caret) {
                                            _teddyController.lookAt(caret);
                                          }),
                                      TrackingTextInput(
                                        label: "Password",
                                        hint: "Enter your Password",
                                        isObscured: true,
                                        onCaretMoved: (Offset caret) {
                                          _teddyController.coverEyes(caret != null);
                                          _teddyController.lookAt(null);
                                        },
                                        onTextChanged: (String value) {
                                          _teddyController.setPassword(value);
                                        },
                                      ),
                                      SigninButton(
                                          child: Text("Sign In",
                                              style: TextStyle(
                                                  fontFamily: "RobotoMedium",
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                          onPressed: () async {
                                            if (_formKey.currentState.validate()) {
                                              dynamic result = await _auth
                                                  .signInWithEmailAndPassword(
                                                  emailEditingController.text, passwordEditingController.text);
                                              if (result['user'] == null) {
                                                setState(() {
                                                  error = result['error'];
                                                });
                                              } else {
                                                HelperFunctions.saveUserLoggedIn(true);
                                                HelperFunctions.saveUserEmail(emailEditingController.text);
                                                print('successful login');
                                              }
                                            }
                                          })
                                    ],
                                  )),
                            )),
                      ])),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [

                  Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
                  SizedBox(height: 30.0),
                  Row(
                      children: <Widget> [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withOpacity(0.9),
                            height: 20.0,
                            thickness: 0.3,
                            endIndent: 15.0,
                          ),
                        ),
                        Text('Login with',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                              //fontSize: 20.0,
                            )
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withOpacity(0.9),
                            height: 20.0,
                            thickness: 0.3,
                            indent: 15.0,
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Material(
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        child: Ink.image(
                            image: AssetImage('assets/images/Facebook.png'),
                            fit: BoxFit.cover,
                            width: 35.0,
                            height: 35.0,
                            child: InkWell(
                              onTap: () {
                                _auth.signInWithFacebook();
                              },
                            )
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Material(
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                            image: AssetImage('assets/images/Google.png'),
                            fit: BoxFit.cover,
                            width: 35.0,
                            height: 35.0,
                            child: InkWell(
                              onTap: () {
                                _auth.signInWithGoogle();
                              },
                            )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                            },
                          child: Text('New user? ',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  shadows: <Shadow> [
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      color: Colors.grey.withOpacity(0.8),
                                    )
                                  ]
                              )
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text('Sign up',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0XffFFE289),
                                  fontWeight: FontWeight.bold,
                                  shadows: <Shadow> [
                                    Shadow(
                                      offset: Offset(1.3, 1.3),
                                      color: Colors.grey.withOpacity(0.8),
                                    )
                                  ]
                              )
                          ),
                        )
                      ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
//      bottomNavigationBar: BottomNavBar(),
    );
  }
}

