import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/new_hug/sendTo.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Hug2 extends StatefulWidget {

  String acceptedData;

  Hug2(this.acceptedData);

  @override
  _Hug2State createState() => _Hug2State(acceptedData);
}

class _Hug2State extends State<Hug2> {

  String acceptedData;

  final messageController = TextEditingController();

  _Hug2State(this.acceptedData);

  _PatternVibrate() {
    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 500),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );
    HapticFeedback.mediumImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                    'New Hug',
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15),
              Container(
                height: 200,
                color: Color(0xff69DAF7),
                child: Center(
                  child: Image.asset(acceptedData, height: 130)
                )
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Profile picture.png'),
                    backgroundColor: Color(0xffE8E7E7),
                    radius: 30,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: "Write a message",
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 3),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff59B3CA), width: 3)
                          )
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.grey[850]
                        ),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.go,
                        minLines: 1,
                        maxLines: 5,
                      )
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              FlatButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  print('vibrate');
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffFB8195), width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                  child: Text(
                    'Create a hug',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.grey[850],
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Send To',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Color(0xff272727),
                        fontWeight: FontWeight.w600,
                      )
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/Arrow (yellow).png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SendTo(acceptedData, messageController.text)
                          )
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
