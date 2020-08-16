import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/services/auth.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  String _oldPassword = '';
  String _newPassword = '';
  String _newPassword2 = '';
  final oldPasswordFormKey = GlobalKey<FormState>();
  final newPasswordFormKey = GlobalKey<FormState>();
  final newPasswordFormKey2 = GlobalKey<FormState>();
  String uid;
  Map<String, dynamic> userData;
  String storedEmail = '';
  String error = '';
  String noError = 'Password updated successful!';

  @override
  void initState() {
    super.initState();
    getUID();
  }

  Future getUID() async {
    final AuthService _auth = AuthService();
    final userId = await _auth.getUserId();
    final user = await Firestore.instance.collection('users').document(userId).get();

    setState(() {
      uid = userId;
      userData = user.data;
      storedEmail = userData['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Row (
          children: <Widget>[
            SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      color: Color(0xff272727),
                      fontWeight: FontWeight.w600,
                    )
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset('assets/images/Yellow dot.png'),
                    SizedBox(height: 12)
                  ],
                )
              ],
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.grey[850],
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            color: Colors.grey[850],
            iconSize: 30,
            onPressed: () async {
              FirebaseUser user = await FirebaseAuth.instance.currentUser();
//              print("User Email: ${user.email}");
              AuthCredential authCredential = EmailAuthProvider.getCredential(
                email: user.email,
                password: _oldPassword,
              );
              print("Auth Credential: ${authCredential.toString()}");
              user.reauthenticateWithCredential(authCredential).then((result) {
                setState(() {
                  error = "Success: $result";
                });
                user.updatePassword(_newPassword).then((result) {
                  setState(() {
                    error = "Password updated.";
                  });
                }).catchError((result) {
                  setState(() {
                    error = "An error occurred while changing the password: " + result.message;
                  });
                });
              }).catchError((result) {
                setState(() {
                  error = "[Old Password] " + result.message;
                });
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Old password:",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff272727)
                    ),
                  ),
                ),
              ),
              Form(
                key: oldPasswordFormKey,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Old Password",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffFFC000),
                            width: 3
                        )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xff59B3CA),
                              width: 3
                          )
                      ),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 3
                          )
                      ),
                    errorStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red
                    ),
                  ),
                  obscureText: true,
                  validator: (val) => val.isEmpty ? 'Enter your old password.' : null,
                  onChanged: (val) {
                    _oldPassword = val;
                  },
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "New password:",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff272727)
                    ),
                  ),
                ),
              ),
              Form(
                key: newPasswordFormKey,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "New Password",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xffFFC000),
                            width: 3
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xff59B3CA),
                            width: 3
                        )
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 3
                        )
                    ),
                    errorStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red
                    ),
                  ),
                  obscureText: true,
                  validator: (val) => val.isEmpty ? 'Enter your new password.' : null,
                  onChanged: (val) {
                    _newPassword = val;
                  },
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Confirm new password:",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff272727)
                    ),
                  ),
                ),
              ),
              Form(
                key: newPasswordFormKey2,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "New Password",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xffFFC000),
                            width: 3
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xff59B3CA),
                            width: 3
                        )
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 3
                        )
                    ),
                    errorStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red
                    ),
                  ),
                  obscureText: true,
                  validator: (val) => val.isEmpty ? 'Enter your new password.' : null,
                  onChanged: (val) {
                    _newPassword2 = val;
                    if (_newPassword2 == _newPassword) {
                      print("new password matched");
                    } else {}
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
            ],
          )
        ),
      ),
    );
  }
}
