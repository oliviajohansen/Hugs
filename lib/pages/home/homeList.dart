import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hugsmobileapp/services/auth.dart';
import 'package:hugsmobileapp/services/database.dart';
import 'package:hugsmobileapp/pages/helper/helperFunctions.dart';
import '../chat/chats.dart';
import '../helper/helperFunctions.dart';
import '../helper/constants.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {

  String uid;
  Map<String, dynamic> userData;
  TextEditingController _controller;

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
      _controller = new TextEditingController(text: userData['username']);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder()
            ),
            controller: _controller,
            maxLength: 20,
            textAlign: TextAlign.center,
            onSubmitted: (val) async {
              await DatabaseService(uid: uid).updateUserData(Constants.myName, val);
              await HelperFunctions.saveUsername(_controller.text);
              Constants.myName = await HelperFunctions.getUsername();
            }
          ),
        FlatButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Chats())
            );
          },
          child: Text(
            "Temporary button to chat",
          ),
        )
      ],
    );
  }

}
