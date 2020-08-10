import 'package:flutter/material.dart';
import 'package:hugsmobileapp/pages/new_hug/hug2.dart';

class Hug extends StatefulWidget {
  @override
  _HugState createState() => _HugState();
}

class _HugState extends State<Hug> {
  List<String> images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
  ];

  String acceptedData = "";

  List<int> acceptedImages = [];

  String finalImage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Move finger around the screen",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff989898)
                  ),
                ),
                Text(
                  "to create your unique hug",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff989898)
                  ),
                ),
                SizedBox(height: 15),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.2),
                  itemBuilder: (BuildContext context, int index) {// handle your image tap here
                    return FlatButton(
                      onPressed: () {
                        setState(() {
                          if (acceptedImages.length < 3) {
                            acceptedImages.add(index);
                          }
                        });
                      },
                      padding: EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(images[index])),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(
                              width: 5,
                              color: acceptedImages.contains(index) ? Color(0xff59B3CA) : Colors.white
                          )
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Stack(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Color(0xffFFC000), width: 3),
                          ),
                          onPressed: () {
                            int finalNum = 0;
                            for (int num in acceptedImages) {
                              finalNum += num;
                            }
                            finalNum = finalNum % 10;
                            if (finalNum == 9) {
                              finalNum = 8;
                            }
                            setState(() {
                              finalImage = images[finalNum];
                              acceptedImages.clear();
                            });
                          },
                          child: Text(
                            'Generate',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.grey[850],
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              acceptedImages.clear();
                              finalImage = "";
                            });
                          },
                          icon: Icon(Icons.refresh, color: Color(0xffFFC000), size: 30,)
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Next',
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
                            if (!finalImage.isEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Hug2(finalImage)
                                  )
                              );
                            } else {
                              // error msg
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: DragTarget<String>(
                    builder: (context, accepted, rejected) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Water.png'),
                          fit: BoxFit.fill
                        )
                      ),
                      child: Center(
                        child: !finalImage.isEmpty
                            ? Image.asset(finalImage, height: 100)
                            : Image.asset('assets/images/Water.png'),
                      )
                    ),
                    onAccept: (String data) {
                      acceptedData = data;
                    },
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
