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


//  //auto scroll to bottom
//  ScrollController _scrollController = new ScrollController();
//  _scrollToBottom() {
//    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//  }

  Widget chatMessages(){
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot){
        return snapshot.hasData ?  ListView.builder(
            itemCount: snapshot.data.documents.length,
//         controller: _scrollController,
//            reverse: true,
//            shrinkWrap: true,
            itemBuilder: (context, index){
//              _scrollToBottom();
              return snapshot.data.documents[index].data["messageType"] == 'image'
                  ? MessageTile(
                      message: snapshot.data.documents[index].data["message"],
                      sendByMe: Constants.myUid == snapshot.data.documents[index].data["sendBy"],
                      time: snapshot.data.documents[index].data["time"],
                      isText: false,
                      context: context
                    )
                  : MessageTile(
                    message: snapshot.data.documents[index].data["message"],
                    sendByMe: Constants.myUid == snapshot.data.documents[index].data["sendBy"],
                    time: snapshot.data.documents[index].data["time"],
                    isText: true
                  );
            },
            )
            : Container();
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
  }

  @override
  Widget build(BuildContext context) {
   // WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(widget.otherUsername),
            SizedBox(width: 165),
            Expanded(child: Image.asset(
              "assets/images/bear.png",
              height: 40,
            )),
          ],
        ),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Container(
        color: Color(0xFFFFF0b2),
        child: Stack(
          children: [
        new Container(
        margin: const EdgeInsets.only(bottom: 55.0),
          child : chatMessages(),
        ),
            Container(alignment: Alignment.bottomCenter,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                color: Color(0x54FFFFFF),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: new IconButton(
                        icon: new Icon(Icons.photo,color: Colors.cyan[900],),
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
                      )
                    ),
                    Expanded(
                        child: TextField(
                          controller: messageEditingController,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                              hintText: "Message ...",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                          ),
                        )
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        bool isText = true;
                        if (messageEditingController.text == '') {
                          isText = false;
                        }
                        addMessage(isText, messageEditingController.text);
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0x36FFFFFF),
                                    const Color(0x0FFFFFFF)
                                  ],
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.bottomRight
                              ),
                              borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(12),
                          child: Image.asset("assets/images/send.png",
                            height: 25, width: 25,)),
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
