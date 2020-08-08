import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/services/auth.dart';
import 'package:hugsmobileapp/services/database.dart';

class EditUsername extends StatefulWidget {
  @override
  _EditUsernameState createState() => _EditUsernameState();
}

class _EditUsernameState extends State<EditUsername> {

  String _username;
  final editUsernameFormKey = GlobalKey<FormState>();
  String uid;
  Map<String, dynamic> userData;
  String storedUsername = '';
  String error = '';
  String noError = 'You had successfully changed your username.';

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
      storedUsername = userData['username'];
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
                    'Edit Username',
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
              if (editUsernameFormKey.currentState.validate()) {
                // If the form is valid (i.e. the username input is valid)
                print("Username had been updated from " + storedUsername + " to " + _username + ".");
                dynamic result = await DatabaseService(uid: uid).updateUserData(_username);
                setState(() {
                  try {
                    error = result['error'];
                  } catch (Exception) {
                    error = noError;
                  }
                });
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: editUsernameFormKey,
                  child: TextFormField(
                    decoration: InputDecoration(
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
                    validator: (val) => val.isEmpty ? 'Enter a username' : null,
                    onChanged: (val) {
                      _username = val;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
            ],
        ),
      ),
    );
  }
}