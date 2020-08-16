import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SendTo extends StatefulWidget {

  String acceptedData;
  String message;

  SendTo(this.acceptedData, this.message);

  @override
  _SendToState createState() => _SendToState(acceptedData, message);
}

class _SendToState extends State<SendTo> {

  String acceptedData;
  String message;

  _SendToState(this.acceptedData, this.message);

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
      backgroundColor: Color(0xfffafafa),
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
                    'Send To',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      color: Colors.grey[850],
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              FlatButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Ink(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffF8F9CD), Color(0xffFFE289)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/images/Search icon.png'),
                      SizedBox(width: 15),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Colors.grey[850],
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/Profile picture (Mocha).png'),
                          backgroundColor: Colors.grey[200],
                          radius: 40,
                        ),
                        trailing: FlatButton(
                          onPressed: () {},
                          color: Color(0xffFFC000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Send',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
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
                          'Life Lover',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff989898)
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                      );
                    },
                    itemCount: names.length,
                  ),
                ),
              ),
            ],
          )
      ),
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
          backgroundImage: AssetImage('assets/images/Profile picture (Mocha).png'),
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