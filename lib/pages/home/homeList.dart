import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hugsmobileapp/pages/chat/chats.dart';
import 'package:hugsmobileapp/services/auth.dart';
import 'package:hugsmobileapp/services/database.dart';
import 'package:hugsmobileapp/pages/helper/helperFunctions.dart';
import '../profile/my_profile.dart';
import '../helper/helperFunctions.dart';
import '../helper/constants.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {

  List<String> images = [
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.11.55-PM.png",
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.08.41-PM.png",
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.08.53-PM.png",
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.11.48-PM.png",
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.13.10-PM.png",
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.09.35-PM.png",
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.12.26-PM.png",
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.09.25-PM.png",
    "https://media.publit.io/file/Screenshot-2020-06-01-at-8.08.32-PM.png",
  ];

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

  final Set<int> selectedIndexes = Set<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Column(
            children: <Widget>[
              SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                      'Create profile',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        color: Color(0xff272727),
                        fontWeight: FontWeight.w700,
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
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/Water2.png"),
                fit: BoxFit.fitWidth
            )
        ),
        alignment: Alignment.topLeft,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              child: Text(
                "Type your username:",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color(0xff272727)
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            ),
            SizedBox(height: 30),
            TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      border: OutlineInputBorder()
                  ),
                  controller: _controller,
                  maxLength: 20,
                  textAlign: TextAlign.center,
                  onChanged: (val) async {
                    await DatabaseService(uid: uid).updateUserData(val);
                    await HelperFunctions.saveUsername(_controller.text);
                    print(_controller.text);
                  }
              ),
            SizedBox(height: 20),
            Container(
              child: Text(
                "Choose your avatar!",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color(0xff272727)
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            ),
            Stack(children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 9,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1),
                itemBuilder: (BuildContext context, int index) {// handle your image tap here
                  return FlatButton(
                    child:Image.network(images[index]),
                    onPressed: () async {
                      final AuthService _auth = AuthService();
                      final userId = await _auth.getUserId();
                      setState(() {
                        if (selectedIndexes.length < 1) {
                          selectedIndexes.add(index);
                          DatabaseService(uid: userId).updateUserProfilePic(images[index]);
                          print("profile picture updated");
                        } else {
                          selectedIndexes.clear();
                          selectedIndexes.add(index);
                          DatabaseService(uid: userId).updateUserProfilePic(images[index]);
                          print("profile picture updated");
                        }
                      });
                    },
                    color: selectedIndexes.contains(index) ? Color(0xffFFE289) : Colors.white,
                  );
                },
              ),
            ]),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () async {
                    final AuthService _auth = AuthService();
                    final userId = await _auth.getUserId();
                    DatabaseService(uid: userId).updateUserBio('Hello everybody!');
                    Constants.myName = await HelperFunctions.getUsername();
                    print(Constants.myName);
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => Profile())
                    );
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.navigate_next,
                    size: 50.0,
                  ),
                  shape: CircleBorder(),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
