import 'package:flutter/material.dart';
import 'package:hugsmobileapp/services/authentication.dart';
import '../bottomNavBar.dart';

class SignUp extends StatefulWidget {

  Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final Authentication _auth = Authentication();
  //identify, validate form, keep track of state of form
  final _formKey = GlobalKey<FormState>();
  String error = '';

  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: <Widget> [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.6,
                      0.4
                    ],
                    colors: [Color(0XffFFE289), Color(0XFFE289)]
                ),
              ),
            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/Hugs logo.png',
                          height: 80.0,
                          width: 80.0)
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 10.0,
                          )
                        ]
                    ),
                    child: Column(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                          child: Text('Welcome to Hugs!',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                          children: <Widget> [
                            Container(
                                padding: EdgeInsets.fromLTRB(25.0, 3.0, 0.0, 5.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username or Email",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                    validator: (val) => val.isEmpty
                                        ? 'Please enter an email'
                                        : null,
                                )
                            ),
                            Container(
                                padding: EdgeInsets.fromLTRB(25.0, 5.0, 0.0, 3.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  validator: (val) => val.length  < 6
                                      ? 'Please enter minimum 6 characters'
                                      : null,
                                )
                            ),
                            Container(
                                padding: EdgeInsets.fromLTRB(25.0, 5.0, 0.0, 3.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => confirmPassword = val);
                                  },
                                  validator: (val) => val != password
                                    ? 'Passwords do not match'
                                    : null,
                                )
                             ),
                            SizedBox(height: 10.0),
                            ButtonTheme(
                              minWidth: 200,
                              height: 40,
                              child: RaisedButton(
                                child: Text('Register',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        shadows: <Shadow> [
                                          Shadow(
                                            offset: Offset(2.5, 2.5),
                                            color: Colors.grey.withOpacity(0.6),
                                          )
                                        ]
                                    )),
                                color: Color(0XffFFE289),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () async {
                                  if(_formKey.currentState.validate()) {
                                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                    if(result == null) {
                                      setState(() {
                                        error = 'Please supply a valid email';
                                      });
                                      print(error);
                                    } else {
                                      print('successfully registered');
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 10.0)
                           ],
                         ),
                        ),
                     ]
                   )
                  ),
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
                        Text('Register with',
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
                              onTap: () {},
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
                              onTap: () {},
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
                          onTap: () {print('existing user tapped');},
                          child: Text('Existing user? ',
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
                          child: Text('Login',
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
