import 'package:flutter/material.dart';
import '../bottomNavBar.dart';

class OtherProfile extends StatefulWidget {
  @override
  _OtherProfileState createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {

  int position = 4;

  bool isHugsDelivered = true;

  List<String> imgsHugsDelivered = [
    'images/A.jpg',
    'images/B.jpg',
    'images/C.jpg',
    'images/D.jpg',
    'images/Heart.png',
    'images/Hug 1.png',
    'images/Hug 2.png',
    'images/Profile pic.png',
    'images/Settings icon.png'
  ];

  List<String> imgsHugsReceived = [
    'images/Hug 1.png',
    'images/Hug 2.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: EdgeInsets.all(30.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                            'images/Settings icon.png',
                            scale: 15)
                    )
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 28.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 28.0),
                      Column(
                          children: <Widget> [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/Profile picture (Mocha).png'),
                              backgroundColor: Color(0xffE8E7E7),
                              radius: 121/2,
                            ),
                            SizedBox(height: 5),
                            Container(
                                width: 90,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Color(0xffffc000),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(width: 5.0),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                      child: Text(
                                        '8',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      '14/50',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )
                            ),
                          ]
                      ),
                      SizedBox(width: 168.5-149.5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Emma Lim',
                            style: TextStyle(
                              fontSize: 21.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Gracious Giver',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7A8FA6),
                            ),
                          ),
                          Text(
                            'Hello, nice to meet you!',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7A8FA6),
                            ),
                            maxLines: null,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Divider(
                    height: 36,
                    color: Colors.grey[850],
                  ),
                  SizedBox(height: 46),
                  FlatButton(
                    onPressed: () {},
                    child: Container(
                      width: 302.0,
                      height: 71.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff59B3CA),
                          width: 3
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(0, 3),
                              blurRadius: 36)
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                            'Send Emma Lim a hug',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7A8FA6),
                          ),
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 25),
                  FlatButton(
                    onPressed: () {},
                      child: Container(
                        width: 302.0,
                        height: 71.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xff59B3CA),
                              width: 3
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(0, 3),
                                blurRadius: 36)
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Send Emma Lim a message',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7A8FA6),
                            ),
                          ),
                        ),
                      )
                  )
                ],
              )
            ],
          )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

/*
                Container(
                  width: 302.0,
                  height: 71.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x08000000),
                          offset: Offset(0, 3),
                          blurRadius: 36)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '109',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: const Color(0xff1b1b1b),
                                fontWeight: FontWeight.w700,
                              )
                            ),
                            Text(
                              'Hugs Sent',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: const Color(0x997a8fa6),
                              )
                            ),
                            SizedBox(height: 12.0)
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Image.asset('images/Heart.png'),
                            Text(
                                'Experience',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  color: const Color(0x997a8fa6),
                                )
                            ),
                            SizedBox(height: 12.0)
                          ],
                        )
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '71',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: const Color(0xff1b1b1b),
                                fontWeight: FontWeight.w700,
                              )
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: const Color(0x997a8fa6),
                              )
                            ),
                            SizedBox(height: 12.0)
                          ],
                        ),
                      ),
                    ],
                  )
                ),
 */