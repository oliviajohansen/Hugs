import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatelessWidget {

  final String message;
  final bool sendByMe;
  final int time;

  MessageTile({@required this.message, @required this.sendByMe, this.time});


  @override
  Widget build(BuildContext context) {
    final DateTime date = new DateTime.fromMillisecondsSinceEpoch(time * 1000);
    final DateFormat formatter = DateFormat.jm();
    final String formattedTime = formatter.format(date).toString();
    return Container(
      padding: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: sendByMe ? 0 : 24,
          right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: sendByMe
            ? EdgeInsets.only(left: 30)
            : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(
            top: 10, bottom: 10, left: 15, right: 15),
        decoration: BoxDecoration(
            borderRadius: sendByMe ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23)
            ) :
            BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: sendByMe ? [
                const Color(0xff007EF4),
                const Color(0xff2A75BC)
              ]
                  : [
                const Color(0xFF9E9E9E),
                const Color(0xFF9E9E9E)
              ],
            )
        ),
        child: Column(
          crossAxisAlignment: sendByMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: <Widget>[
            Text(message,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300)
            ),
            Text(formattedTime,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'OverpassRegular',
                  fontWeight: FontWeight.w300
              ))
          ],
        ),
      ),
    );
  }
}
