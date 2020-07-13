import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int position = 1;

  final names = [
    'Kristie Zhang',
    'Rachel Tan',
    'Chloe Wong',
    'Ryan Lim',
    'Dominic Neo',
    'Steve Jobs',
    'Notch Lim',
    'Melvin Lim',
    'Clarrisa Tan',
    'Jason Cheng',
    'Michelle Tan',
    'Zoe Tay',
    'Maybelline Neo',
    'Justina Tay',
    'Priscilla Lau',
    'Sharon Sim',
    'Joe Doe',
    'Tom Lau',
    'Harry Lau',
    'Phoenix Cheng'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xfffafafa),
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
                      'Chat',
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
          elevation: 20,
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
          actions: <Widget>[
            IconButton(
              icon: Column(
                children: <Widget>[
                  SizedBox(height: 18),
                  Image.asset('images/Search icon (black).png'),
                ],
              ),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            )
          ],
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
                          backgroundImage: AssetImage('images/Profile pic.png'),
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
      body: SafeArea(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[850],
            ),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/Profile picture (Mocha).png'),
                  backgroundColor: Colors.grey[200],
                  radius: 40,
                ),
                title: Text(
                    '${names[index]}',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[850]
                    )),
                subtitle: Text(
                  'Hello ru there?',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff989898)
                  ),
                ),
                onTap: () {},
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
              );
            },
            itemCount: names.length,
          )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        color: Colors.grey[200],
        backgroundColor: Color(0x94FAFAFA),
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
//      bottomNavigationBar: SnakeNavigationBar(
//        style: SnakeBarStyle.pinned,
//        backgroundColor: Color(0x94FAFAFA),
//        selectedItemColor: Color(0xffFFC000),
//        snakeColor: Colors.black,
//
//        currentIndex: position,
//        onPositionChanged: (index) => setState(() => position = index),
//        items: [
//          BottomNavigationBarItem(
//            icon: Image.asset('images/Home button.png'),
//          ),
//          BottomNavigationBarItem(
//            icon: Image.asset('images/Chat button.png'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.add),
//          ),
//          BottomNavigationBarItem(
//            icon: Image.asset('images/Trophy button.png'),
//          ),
//          BottomNavigationBarItem(
//            icon: Image.asset('images/Profile button.png'),
//          )
//        ],
//      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  final names = [
    'Kristie Zhang',
    'Rachel Tan',
    'Chloe Wong',
    'Ryan Lim',
    'Dominic Neo',
    'Steve Jobs',
    'Notch Lim',
    'Melvin Lim',
    'Clarrisa Tan',
    'Jason Cheng',
    'Michelle Tan',
    'Zoe Tay',
    'Maybelline Neo',
    'Justina Tay',
    'Priscilla Lau',
    'Sharon Sim',
    'Joe Doe',
    'Tom Lau',
    'Harry Lau',
    'Phoenix Cheng'
  ];

  final recentNames = [
    'Jason Cheng',
    'Michelle Tan',
    'Zoe Tay'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for AppBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // shows some result based on the selection
    return Text(
        query
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // shows when someone searches for something
    final suggestionList = query.isEmpty
        ? recentNames
        : names.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/Profile picture (Mocha).png'),
          backgroundColor: Colors.grey[200],
          radius: 40,
        ),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Poppins',
                    color: Colors.grey[850],
                    fontWeight: FontWeight.w600
                ),
                children: [TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                    )
                )]
            )
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ThemeData(
        primaryColor: Color(0xffFFE289),
        textTheme: TextTheme(
            title: TextStyle(
                fontSize: 21.0,
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold
            )
        )
    );
  }
}
