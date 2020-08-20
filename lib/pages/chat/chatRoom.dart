import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hugsmobileapp/services/auth.dart';
import './messageTile.dart';
import '../helper/constants.dart';
import '../../services/database.dart';
import './controllers/pickImageController.dart';

class ChatRoom extends StatefulWidget {

  final String chatRoomId;
  final String otherUsername;

  ChatRoom({ this.chatRoomId, this.otherUsername });

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();
  AuthService _auth = AuthService();
  int currMessagesCount;
  int newMessagesCount;


  //auto scroll to bottom
  ScrollController _scrollController = new ScrollController();
  _scrollToBottom() {
    _scrollController.hasClients
        ? _scrollController.jumpTo(_scrollController.position.maxScrollExtent)
    : print('ScrollController position empty, not attached to any scroll views');
  }

  Widget chatMessages(){
    return StreamBuilder(
      stream: chats,
      // ignore: missing_return
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.only(bottom:50),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                Timer(
                    Duration(milliseconds: 350),
                        () => _scrollToBottom()
                );
                return snapshot.data.documents[index].data["messageType"] ==
                    'image'
                    ? MessageTile(
                    message: snapshot.data.documents[index].data["message"],
                    sendByMe: Constants.myUid ==
                        snapshot.data.documents[index].data["sendBy"],
                    time: snapshot.data.documents[index].data["time"],
                    isText: false,
                    context: context
                )
                    : MessageTile(
                    message: snapshot.data.documents[index].data["message"],
                    sendByMe: Constants.myUid ==
                        snapshot.data.documents[index].data["sendBy"],
                    time: snapshot.data.documents[index].data["time"],
                    isText: true
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  addMessage(isText, message) {
    String messageType = 'text';
    String lastMsg = message;
    if (!isText) {
      messageType = 'image';
      lastMsg = 'photo';
    }
    if (!isText || messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "name": Constants.myName,
        "sendBy": Constants.myUid,
        "message": message,
        'time': DateTime
            .now()
            .millisecondsSinceEpoch,
        'messageType': messageType
      };

      DatabaseService().addMessage(widget.chatRoomId, chatMessageMap, lastMsg);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    DatabaseService().getMessages(widget.chatRoomId).then((val) {
      setState(() {
        chats = val;
      });
    });
    super.initState();
    Timer(
        Duration(milliseconds: 350),
            () => _scrollToBottom()
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 350),
          () => _scrollToBottom()
    );
   //WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
            widget.otherUsername,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 21,
              color: Colors.grey[850],
              fontWeight: FontWeight.w600,
            )
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.grey[850],
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.all(0),
            icon: Image.asset("assets/images/bear.png", height: 30),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 55),
              child : chatMessages(),
            ),
            Container(alignment: Alignment.bottomCenter,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.photo, color: Color(0xff59B3CA), size: 30,),
                        onPressed: () {
                          PickImageController.instance.cropImageFromFile().then((croppedFile) async {
                            if (croppedFile != null) {
                              String imageDownloadUrl = await DatabaseService()
                                  .saveImageInChatRoomStorage(croppedFile, widget.chatRoomId);
                              addMessage(false, imageDownloadUrl);
                            } else {
                              print('Pick Image Cancelled');
                            }
                          });
                        }
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: TextField(
                          controller: messageEditingController,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                              hintText: "Message",
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.grey[850],
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                          ),
                        )
                    ),
                    IconButton(
                      onPressed: () {
                        bool isText = true;
                        if (messageEditingController.text == '') {
                          isText = false;
                        }
                        addMessage(isText, messageEditingController.text);
                      },
                      icon: Image.asset("assets/images/send.png",
                        height: 25, width: 25, color: Color(0xff59B3CA),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
