import 'package:flutter/material.dart';
import '../../models/hug.dart';

class AchievementCard extends StatelessWidget {

  List<Achievement> achievements = [
    Achievement(image: 'bear.png', title: 'Bear Hugger'),
    Achievement(image: 'best.png', title: 'Cozy Hugger'),
    Achievement(image: 'first.png', title: 'Hug streak 1'),
    Achievement(image: 'friendship.png', title: 'Friendly Hugger'),
    Achievement(image: 'grandma.png', title: 'Grandma Hugger'),
    Achievement(image: 'quick.png', title: 'Quick Hugger'),
    Achievement(image: 'side.png', title: 'Side Hugger'),
    Achievement(image: 'warm.png', title: 'Warm Hugger'),
    Achievement(image: 'chill.png', title: 'Chill Hugger'),
    Achievement(image: 'bear.png', title: 'Bear Hugger'),
    Achievement(image: 'best.png', title: 'Cozy Hugger'),
    Achievement(image: 'first.png', title: 'Hug streak 1'),
    Achievement(image: 'friendship.png', title: 'Friendly Hugger'),
    Achievement(image: 'grandma.png', title: 'Grandma Hugger'),
    Achievement(image: 'quick.png', title: 'Quick Hugger'),
    Achievement(image: 'side.png', title: 'Side Hugger'),
    Achievement(image: 'warm.png', title: 'Warm Hugger'),
    Achievement(image: 'chill.png', title: 'Chill Hugger')
  ];

  @override
  Widget build(BuildContext context) {
    int index = 1;
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
                              image: AssetImage('assets/images/' + achievements[index].image),
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
                        Text(achievements[index].title, style: TextStyle(fontFamily: 'Poppins')),
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
