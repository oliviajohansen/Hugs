import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/authenticate/authenticate.dart';
import 'package:hugsmobileapp/pages/authenticate/login.dart';
import 'package:hugsmobileapp/services/auth.dart';


class Reset extends StatefulWidget {

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {

  final AuthService _auth = AuthService();

  TextEditingController emailEditingController = new TextEditingController();

  //identify, validate form, keep track of state of form
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String noError = 'A link to reset your password had been sent to your inbox';

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
                      0.5,
                      0.5
                    ],
                    colors: [Color(0XffFFE289), Color(0XFFE289)]
                ),
              ),
            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/Hugs logo.png',
                          height: 80.0,
                          width: 80.0)
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 100.0),
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
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset('assets/images/Arrow.png'),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context) => Authenticate())
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                                  child: Text('Reset Password',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
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
                                        controller: emailEditingController,
                                        validator: (val) => val.isEmpty
                                            ? 'Please enter an email'
                                            : null,
                                      )
                                  ),
                                  SizedBox(height: 10.0),
                                  ButtonTheme(
                                    minWidth: 200,
                                    height: 40,
                                    child: RaisedButton(
                                      child: Text('Reset',
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
                                        dynamic result = await _auth.resetPassword(emailEditingController.text);
                                        setState(() {
                                          try {
                                            error = result['error'];
                                          } catch (Exception) {
                                            error = noError;
                                          }
                                        });
                                      }
                                    ),
                                  ),
                                  SizedBox(height: 10.0)
                                ],
                              ),
                            ),
                          ]
                      )
                  ),
                  SizedBox(height: 10.0),
                  Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
                  SizedBox(height: 200.0),
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
