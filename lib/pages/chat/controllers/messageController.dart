import 'package:flutter/material.dart';
import '../../helper/constants.dart';
import '../../../services/database.dart';
import '../chatRoom.dart';

class MessageController {

  DatabaseService databaseService = new DatabaseService();

  getChatRoomId(String a, String b) {
    print(a);
    print(b);
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  startChat(String username, context, bool isNewChat, String lastMessage) async {
    String myUid = Constants.myUid;
    //alternative
    //String myUid = await databaseService.getUserIdByUsername(Constants.myName);
    String uid = await databaseService.getUserIdByUsername(username);
    List<String> users = [myUid, uid];
    String chatRoomId = getChatRoomId(myUid, uid);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId" : chatRoomId,
      "lastMessage": lastMessage
    };

    isNewChat ? databaseService.createChatRoom(chatRoomId, chatRoom)
      : databaseService.openChatRoom(chatRoomId, chatRoom);

    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChatRoom(
            chatRoomId: chatRoomId,
            otherUsername: username
        )
    ));
  }

}
