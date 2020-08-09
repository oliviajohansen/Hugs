import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/services/auth.dart';
import 'package:hugsmobileapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homeList.dart';
import '../helper/helperFunctions.dart';
import '../helper/constants.dart';
import '../bottomNavBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUsername();
    print(Constants.myName);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().user,
      child: Scaffold(
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
                        'New Profile',
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
            leading: IconButton(
              icon: Column(
                children: <Widget>[
                  SizedBox(height: 18),
                  Image.asset('assets/images/Menu icon.png'),
                ],
              ),
              onPressed: () {
              },
            ),
          ),
        ),
//        appBar: AppBar(
//          title: Text('Home page'),
//          actions: <Widget>[
//            FlatButton.icon(
//              icon: Icon(Icons.person),
//              label: Text('Logout'),
//              onPressed: () async {
//                await _auth.signOut();
//            },
//            )
//          ],
//        ),
        body: HomeList(),
//        bottomNavigationBar: BottomNavBar(),
        bottomNavigationBar:CurvedNavigationBar(
          index: 2,
          color: Colors.grey[200],
          backgroundColor: Color(0xff00caea),
          buttonBackgroundColor: Color(0xffFFE289),
          height: 65,
          items: <Widget>[
            Image.asset('assets/images/Home button.png',
              height: 50,
              width: 50,
            ),
            Image.asset('assets/images/Chat button.png',
              height: 50,
              width: 50,
            ),
            Icon(
                Icons.add,
                size: 30,
                color: Color(0xff7A8FA6)
            ),
            Image.asset('assets/images/Trophy button.png',
              height: 50,
              width: 50,
            ),
            Image.asset('assets/images/Profile button.png',
              height: 50,
              width: 50,
            ),
          ],
          onTap: (index) {
            setState(() {
            });
          },
        ),
      ),
    );
  }
}
