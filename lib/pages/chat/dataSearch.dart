import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './messageController.dart';


class DataSearch extends SearchDelegate<String> {

  MessageController messageController = new MessageController();

  final names = [
    '99dennis',
    'Olivia2628',
    '99dennis99',
    'Oliviaaa',
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

  var suggestionList = [];

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
    suggestionList = query.isEmpty
        ? recentNames
        : names.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          //showResults(context);
          print(suggestionList[index]);
          messageController.startChat(suggestionList[index], context, false, '');
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
