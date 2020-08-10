import 'package:flutter/material.dart';
import '../bottomNavBar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int position = 4;

  bool isHugsDelivered = true;

  List<String> imgsHugsDelivered = [
    'assets/images/A.jpg',
    'assets/images/B.jpg',
    'assets/images/C.jpg',
    'assets/images/D.jpg',
    'assets/images/Heart.png',
    'assets/images/Hug 1.png',
    'assets/images/Hug 2.png',
    'assets/images/Profile picture.png',
    'assets/images/Settings icon.png'
  ];

  List<String> imgsHugsReceived = [
    'assets/images/Hug 1.png',
    'assets/images/Hug 2.png'
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
                            'assets/images/Settings icon.png',
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
                              backgroundImage: AssetImage('assets/images/Profile picture.png'),
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
                            'Sarah Tan',
                            style: TextStyle(
                              fontSize: 21.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Life Lover',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  isHugsDelivered = true;
                                });
                              },
                              child: Text(
                                  'Hugs Delivered',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: const Color(0xff1d2226),
                                    fontWeight: FontWeight.w700,
                                    height: 1.0625,
                                  )
                              )
                          ),
                          Container(
                              height: 4.41,
                              width: 187.5,
                              color: isHugsDelivered ? Color(0xff59B3CA) : Colors.white,
                              child: Text('')
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  isHugsDelivered = false;
                                });
                              },
                              child: Text(
                                  'Hugs Received',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: const Color(0xff1d2226),
                                    fontWeight: FontWeight.w700,
                                    height: 1.0625,
                                  )
                              )
                          ),
                          Container(
                              height: 4.41,
                              width: 187.5,
                              color: isHugsDelivered ? Colors.white : Color(0xff59B3CA),
                              child: Text('')
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 3,
                        children: isHugsDelivered
                            ? imgsHugsDelivered.map((img) => Card(
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(img),
                                        fit: BoxFit.cover
                                    )
                                )
                            )
                        )).toList()
                            : imgsHugsReceived.map((img) => Card(
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(img),
                                        fit: BoxFit.cover
                                    )
                                )
                            )
                        )).toList()
                    ),
                  ),
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