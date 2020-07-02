import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: <Widget>[
            Text(
              'Justina hugged you!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.grey[850]
              ),
            ),
            SizedBox(width: 5),
            Image.asset('images/Yellow dot.png')
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '12 Jun 2020',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7A8FA6)
                ),
              ),
              Text(
                '03 14',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7A8FA6)
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 245,
                width: 1000,
                color: Color(0xffE7B1A3),
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('images/Hug 1.png')
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset('images/Profile picture (Mocha).png'),
                    backgroundColor: Colors.grey[200],
                    radius: 35,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      child: Card(
                        child: Text(
                          'Hello Sarah! It has been a long time since we have met. Hope you are doing fine!',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[850]
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Image.asset('images/Hug button.png'),
                radius: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
