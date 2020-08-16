import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/authenticate/authenticate.dart';
import 'package:hugsmobileapp/pages/profile/change_password.dart';
import 'package:hugsmobileapp/pages/profile/edit_bio.dart';
import 'package:hugsmobileapp/pages/profile/edit_username.dart';
import 'package:hugsmobileapp/services/auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

final AuthService _auth = AuthService();

class _SettingsState extends State<Settings> {
  String uid;
  Map<String, dynamic> userData;
  String storedUsername = '';
  String storedEmail = '';
  String storedProfilePic = '';
  String storedBio = '';

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
      storedEmail = userData['email'];
      storedProfilePic = userData['profilePic'];
      storedBio = userData['bio'];
    });
  }

  @override
  Widget build(BuildContext context) {

//    void showUploadPicturePanel() {
//      showModalBottomSheet(context: context, builder: (context) {
//        return Container(
//          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//          height: 260,
//          child: Container(
//            margin: EdgeInsets.all(10),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  'Choose photo',
//                  style: TextStyle(
//                      fontFamily: 'Poppins',
//                      fontSize: 21,
//                      fontWeight: FontWeight.w600,
//                      color: Colors.grey[850]
//                  ),
//                ),
//                SizedBox(height: 10),
//                ListTile(
//                  contentPadding: EdgeInsets.all(0),
//                  onTap: () {},
//                  title: Text(
//                    'Take photo',
//                    style: TextStyle(
//                        fontFamily: 'Poppins',
//                        fontSize: 18,
//                        fontWeight: FontWeight.w500,
//                        color: Colors.grey[850]
//                    ),
//                  ),
//                  leading: Icon(Icons.camera_alt, color: Color(0xff59B3CA), size: 28),
//                ),
//                ListTile(
//                  contentPadding: EdgeInsets.all(0),
//                  onTap: () {},
//                  title: Text(
//                    'Upload from Gallery',
//                    style: TextStyle(
//                        fontFamily: 'Poppins',
//                        fontSize: 18,
//                        fontWeight: FontWeight.w500,
//                        color: Colors.grey[850]
//                    ),
//                  ),
//                  leading: Icon(Icons.image, color: Color(0xff59B3CA), size: 28),
//                ),
//                ListTile(
//                  contentPadding: EdgeInsets.all(0),
//                  onTap: () {},
//                  title: Text(
//                    'Remove photo',
//                    style: TextStyle(
//                        fontFamily: 'Poppins',
//                        fontSize: 18,
//                        fontWeight: FontWeight.w500,
//                        color: Colors.red
//                    ),
//                  ),
//                  leading: Icon(Icons.delete, color: Colors.red, size: 28),
//                ),
//              ],
//            ),
//          ),
//        );
//      });
//    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                    'Settings',
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    CircleAvatar(
//                      backgroundImage: NetworkImage(storedProfilePic),
                      backgroundColor: Color(0xffE8E7E7),
                      radius: 121/2,
                    ),
                    SizedBox(height: 15),
//                    FlatButton(
//                      onPressed: () => showUploadPicturePanel(),
//                      color: Colors.white,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(15),
//                        side: BorderSide(color: Color(0xffFFC000), width: 2),
//                      ),
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Text(
//                          'Change Profile Photo',
//                          style: TextStyle(
//                              fontFamily: 'Poppins',
//                              fontSize: 18,
//                              color: Colors.grey[850],
//                              fontWeight: FontWeight.w500
//                          ),
//                        ),
//                      ),
//                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Username',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              subtitle: Text(
                                storedUsername,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              leading: Icon(Icons.person_outline, color: Color(0xffFFC000),),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditUsername()
                                    )
                                );
                              },
                            ),
                            ListTile(
                              title: Text(
                                'Bio',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              subtitle: Text(
                                storedBio,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              leading: Icon(Icons.chat_bubble_outline, color: Color(0xffFFC000),),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditBio()
                                    )
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Email',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              subtitle: Text(
                                storedEmail,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              leading: Icon(Icons.email, color: Color(0xffFFC000),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Change Password',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              leading: Icon(Icons.lock_outline, color: Color(0xffFFC000),),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChangePassword()
                                    )
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Facebook',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              subtitle: Text(
                                'Linked',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              leading: Image.asset('assets/images/Facebook.png'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {},
                            ),
                            ListTile(
                              title: Text(
                                'Google',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              subtitle: Text(
                                'Link Account',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              leading: Image.asset('assets/images/Google.png'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.red, width: 2),
                          ),
                          onPressed: () async {
                            await _auth.signOut();
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => Authenticate())
                            );
                          },
                          child: Text(
                            'LOG OUT',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
