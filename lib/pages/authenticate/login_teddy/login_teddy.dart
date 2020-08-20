import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/authenticate/login_teddy/signin_button.dart';
import 'package:hugsmobileapp/pages/authenticate/login_teddy/teddy_controller.dart';
import 'package:hugsmobileapp/pages/authenticate/login_teddy/tracking_text_input.dart';
import 'package:hugsmobileapp/pages/helper/constants.dart';
import 'package:hugsmobileapp/pages/helper/helperFunctions.dart';
import 'package:hugsmobileapp/services/auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:hugsmobileapp/services/database.dart';

class LoginTeddy extends StatefulWidget {

  final Function toggleView;
  LoginTeddy({ this.toggleView });

  @override
  _LoginTeddyState createState() => _LoginTeddyState();
}

class _LoginTeddyState extends State<LoginTeddy> {

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

  initStates() async {
    HelperFunctions.saveUserLoggedIn(true);
    HelperFunctions.saveUserEmail(emailEditingController.text);
    String username = await DatabaseService().getUsernameByUserEmail(emailEditingController.text);
    HelperFunctions.saveUsername(username);
    Constants.myName = username;
    Constants.myUid = await _auth.getUserId();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
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
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TrackingTextInput(
                                          label: "Email",
                                          hint: "What's your email address?",
                                          onCaretMoved: (Offset caret) {
                                            _teddyController.lookAt(caret);
                                          },
                                          onTextChanged: (String value) {
                                            emailEditingController.text = value;
                                          }
                                      ),
                                      TrackingTextInput(
                                        label: "Password",
                                        hint: "Enter your Password",
                                        isObscured: true,
                                        onCaretMoved: (Offset caret) {
                                          _teddyController.coverEyes(caret != null);
                                          _teddyController.lookAt(null);
                                        },
                                        onTextChanged: (String value) {
                                          passwordEditingController.text = value;
                                          _teddyController.setPassword(value);
                                        },
                                      ),
                                      SigninButton(
                                          child: Text("Sign In",
                                              style: TextStyle(
                                                  fontFamily: "RobotoMedium",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
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
                                                initStates();
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
              padding: EdgeInsets.fromLTRB(40.0, 60.0, 40.0, 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
                  SizedBox(height: 30),
                  Row(
                      children: <Widget> [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[700].withOpacity(0.9),
                            height: 20.0,
                            thickness: 0.8,
                            endIndent: 15.0,
                          ),
                        ),
                        Text('Login with',
                            style: TextStyle(
                              fontFamily: 'RobotoMedium',
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            )
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[700].withOpacity(0.9),
                            height: 20.0,
                            thickness: 0.8,
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
                            onTap: () async {
                              dynamic res = await _auth.signInWithFacebook();
                              if (res != false) {
                                emailEditingController.text = res;
                                initStates();
                              }
                            }
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
                              onTap: () async {
                                if(await _auth.signInWithGoogle()) {
                                  initStates();
                                }
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
                                  fontFamily: 'RobotoMedium',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
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
                                  fontFamily: 'RobotoMedium',
                                  color: Color(0XffFFE289),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
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