import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './fullphoto.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MessageTile extends StatelessWidget {

  final String message;
  final bool sendByMe;
  final int time;
  final bool isText;
  final context;

  MessageTile({@required this.message, @required this.sendByMe, @required this.time, @required this.isText, this.context});

  Widget _imageMessage(imageUrlFromFB) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FullPhoto(url: imageUrlFromFB)));
        },
        child: CachedNetworkImage(
          imageUrl: imageUrlFromFB,
          placeholder: (context, url) => Container(
            transform: Matrix4.translationValues(0, 0, 0),
            child: Container( width: 60, height: 80,
                child: Center(child: new CircularProgressIndicator())),
          ),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          width: 60,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }


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
            isText
              ? Text(message,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'OverpassRegular',
                  fontWeight: FontWeight.w300)
              )
              : _imageMessage(message),
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
