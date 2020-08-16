import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bottomNavBar.dart';
import '../helper/constants.dart';
import '../../services/database.dart';
import './chatRoom.dart';
import '../../services/auth.dart';
import 'controllers/messageController.dart';
import './dataSearch.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  DatabaseService databaseService = DatabaseService();
  MessageController messageController = new MessageController();
  Stream<QuerySnapshot> chatList;

  int position = 1;

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


  Widget getChatList() {
    return StreamBuilder(
      stream: chatList,
      builder: (context, chatListSnapshot) {
        return chatListSnapshot.hasData ?
        ListView(
//          separatorBuilder: (context, index) => Divider(
//            color: Colors.grey[850],
//          ),
//          itemCount: chatListSnapshot.data.documents.length,
//          itemBuilder: (context, index) {
            children: chatListSnapshot.data.documents.map<Widget>((chatData) {
              String otherId = (chatData != null) ? chatData['users'][0] == Constants.myUid
                  ? chatData['users'][1]
                  : chatData['users'][0]
                  : '';
                return StreamBuilder(
                  stream: Firestore.instance
                      .collection('users')
                      .document(otherId)
                      .snapshots(),
                  builder: (context, userSnapshot) {
                    return userSnapshot.hasData ?
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/Profile picture (Mocha).png'),
                          backgroundColor: Colors.grey[200],
                          radius: 40,
                        ),
                        title: Text(
                            userSnapshot.data['username']??'',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[850]
                          )
                        ),
                          subtitle: Text(
                            chatData['lastMessage'] ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                            ),
                        ),
                        onTap: () {
                          messageController.startChat(userSnapshot.data['username'], context, false, chatData['lastMessage']);
                       },
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                      )
                  : Container();
              },
          );
        }).toList())
            : Container();
      }
    );
    }

  void initState() {
    databaseService.getChats(Constants.myUid).then((val) => {
      setState(() => {
        chatList = val
      })
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
              'Chat',
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
      backgroundColor: Colors.white,
      elevation: 5,
      actions: <Widget>[
        IconButton(
          icon: Image.asset('assets/images/Search icon (black).png'),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        )
      ],
    ),
      body: SafeArea(
          child: getChatList()
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
