import 'package:flutter/material.dart';
import '../../models/hug.dart';

class AchievementCard extends StatelessWidget {

  final List<Hug> hugs = [
    Hug(image: 'bear.png', achievement: 'Bear Hugger')
  ];

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Stack(
      //alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            left: 5.0,
            bottom: 5.0,
            right: 5.0,
            top: 5.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Material(
                        child: Ink(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/' + hugs[index].image),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
//                                child: InkWell(
//                                  onTap: () {}
//                                )
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget> [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/Achievement locked.png'),
                          maxRadius: 8,
                          backgroundColor: Colors.white,
                        ),
                        Text(hugs[index].achievement, style: TextStyle(fontFamily: 'Poppins')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 5.0,
              bottom: 5.0,
              right: 5.0,
              top: 5.0,
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {})
              )
          )
        ]
    );
  }
}
