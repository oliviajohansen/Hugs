import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/services/auth.dart';
import 'package:hugsmobileapp/services/database.dart';

class EditBio extends StatefulWidget {
  @override
  _EditBioState createState() => _EditBioState();
}

class _EditBioState extends State<EditBio> {

  String _bio;
  final editBioFormKey = GlobalKey<FormState>();
  String uid;
  Map<String, dynamic> userData;
  String storedBio = '';
  String error = '';
  String noError = 'You had successfully changed your bio.';

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
      storedBio = userData['bio'];
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
              if (editBioFormKey.currentState.validate()) {
                // If the form is valid (i.e. the username input is valid)
                dynamic result = await DatabaseService(uid: uid).updateUserBio(_bio);
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
                key: editBioFormKey,
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
                  validator: (val) => val.isEmpty ? 'Enter your new bio' : null,
                  onChanged: (val) {
                    _bio = val;
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