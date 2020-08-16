import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/services/auth.dart';
import 'package:hugsmobileapp/services/database.dart';
import '../../models/hug.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {

  String uid;
  Map<String, dynamic> userData;
  List storedAchievements;

  List<Achievement> achievements = [
    Achievement(image: 'bear.png', title: 'Bear Hugger'),
    Achievement(image: 'best.png', title: 'Cozy Hugger'),
    Achievement(image: 'first.png', title: 'Hug streak 1'),
    Achievement(image: 'friendship.png', title: 'Friendly Hug'),
    Achievement(image: 'grandma.png', title: 'Nice Hugger'),
    Achievement(image: 'quick.png', title: 'Quick Hug'),
    Achievement(image: 'side.png', title: 'Side Hugger'),
    Achievement(image: 'warm.png', title: 'Warm Hug'),
    Achievement(image: 'chill.png', title: 'Chill Hugger'),
    Achievement(image: 'bear.png', title: 'Bear Hugger'),
    Achievement(image: 'best.png', title: 'Cozy Hugger'),
    Achievement(image: 'first.png', title: 'Hug streak 1'),
    Achievement(image: 'friendship.png', title: 'Friendly Hug'),
    Achievement(image: 'grandma.png', title: 'Nice Hugger'),
    Achievement(image: 'quick.png', title: 'Quick Hug'),
    Achievement(image: 'side.png', title: 'Side Hugger'),
    Achievement(image: 'warm.png', title: 'Warm Hug'),
    Achievement(image: 'chill.png', title: 'Chill Hugger')
  ];

  @override
  void initState() {
    super.initState();
    getUID();
  }

  Future getUID() async {
    final AuthService _auth = AuthService();
    final userId = await _auth.getUserId();
    final user = await Firestore.instance.collection('users')
        .document(userId)
        .get();

    setState(() {
      uid = userId;
      userData = user.data;
      storedAchievements = userData['achievements'];
    });
  }

  _displayDialog(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("You unlocked " + achievements[index].title + "!"),
          actions: <Widget>[
            FlatButton(
              onPressed: () async {
                Navigator.of(context).pop();
                },
              child: Text('Yay!'),
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1/1.5,
          ),
          itemCount: achievements.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<DocumentSnapshot>(
                  stream: Firestore.instance.collection('users').document(uid).snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    List lst = [];
                    try {
                      lst = snapshot.data["achievements"];
                    } catch (Exception) {}
                    if (snapshot.data == null) return CircularProgressIndicator();
                    for (var i = 0; i < lst.length; i++) {
                      achievements[lst[i]].isUnlocked = true;
                    }
                    return Expanded(
                      child: FlatButton(
                        onPressed: () async {
                          setState(() {
                            achievements[index].isUnlocked = true;
                            _displayDialog(context, index);
                          });
                          final AuthService _auth = AuthService();
                          final userId = await _auth.getUserId();
                          lst.add(index);
                          DatabaseService(uid: userId).updateUserAchievements(lst);
                          print("achievements updated");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/' + achievements[index].image)),
                            color: Color(0xffE5E9EC),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: achievements[index].isUnlocked
                                ? Border.all(color: Color(0xff59B3CA), width: 5)
                                : Border.all(color: Color(0xffE5E9EC), width: 5)
                          ),
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(height: 5),
                Text(achievements[index].title, style: TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                SizedBox(height: 5),
              ],
            );
          }
      ),
    );
  }
}
