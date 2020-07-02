import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HugsPage extends StatefulWidget {
  @override
  _HugsPageState createState() => _HugsPageState();
}

class _HugsPageState extends State<HugsPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int position = 0;

  final names = [
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                      'New Hugs',
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
                      Image.asset('images/Yellow dot.png'),
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
                Image.asset('images/Menu icon.png'),
              ],
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                        color: Color(0xffFFC000)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('images/Profile picture (Mocha).png'),
                          backgroundColor: Colors.grey[200],
                          radius: 40.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Sarah Tan',
                          style: TextStyle(
                              fontSize: 21.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                        ),
                        Text(
                          'Life Lover',
                          style: TextStyle(
                            fontSize: 14.5,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.group),
                      title: Text(
                        'New Group',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[850]
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'Contacts',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[850]
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.bookmark_border),
                      title: Text(
                        'Saved Messages',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[850]
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[850]
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person_add),
                      title: Text(
                        'Invite Friends',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[850]
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.comment),
                      title: Text(
                        'Hugs FAQ',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[850]
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
            ],
          )
      ),
      body: Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("images/Water2.png"),
                fit: BoxFit.fitWidth
            )
        ),
        alignment: Alignment.topLeft,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              child: Text(
                "Move finger around the screen to create your unique hug",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color(0xff989898)
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            ),
            Stack(children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: images.length,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {// handle your image tap here
                  return  GestureDetector(
                    child:Image.network(images[index]),
                    onTap: () {},
                  );
                },
              ),
            ]),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 20),
                Text('The hug',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff272727),
                      fontWeight: FontWeight.w700,
                    )
                ),
                SizedBox(width: 5),
                Column(
                  children: <Widget>[
                    SizedBox(width: 20),
                    Image.asset('images/Yellow dot.png'),
                  ],
                ),
                SizedBox(width: 160),
                Text('Send to',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff272727),
                      fontWeight: FontWeight.w700,
                    )
                ),
                IconButton(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/Arrow (yellow).png'),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        color: Colors.grey[200],
        backgroundColor: Color(0xff00caea),
        buttonBackgroundColor: Color(0xffFFE289),
        height: 65,
        items: <Widget>[
          Image.asset('images/Home button.png',
            height: 50,
            width: 50,
          ),
          Image.asset('images/Chat button.png',
            height: 50,
            width: 50,
          ),
          Icon(
              Icons.add,
              size: 30,
              color: Color(0xff7A8FA6)
          ),
          Image.asset('images/Trophy button.png',
            height: 50,
            width: 50,
          ),
          Image.asset('images/Profile button.png',
            height: 50,
            width: 50,
          ),
        ],
        onTap: (index) {
          setState(() {
            position = index;
          });
        },
      ),
    );
  }
}