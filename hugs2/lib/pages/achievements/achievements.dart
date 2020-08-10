import 'package:flutter/material.dart';
import '../../models/hug.dart';
import 'achievementCard.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {

  List<Hug> hugs = [
    Hug(image: 'bear.png', achievement: 'Bear Hugger'),
    Hug(image: 'best.png', achievement: 'Cozy Hugger'),
    Hug(image: 'first.png', achievement: 'Hug streak 1'),
    Hug(image: 'friendship.png', achievement: 'Friendly Hugger'),
    Hug(image: 'grandma.png', achievement: 'Grandma Hugger'),
    Hug(image: 'quick.png', achievement: 'Quick Hugger'),
    Hug(image: 'side.png', achievement: 'Side Hugger'),
    Hug(image: 'warm.png', achievement: 'Warm Hugger'),
    Hug(image: 'chill.png', achievement: 'Chill Hugger'),
    Hug(image: 'bear.png', achievement: 'Bear Hugger'),
    Hug(image: 'best.png', achievement: 'Cozy Hugger'),
    Hug(image: 'first.png', achievement: 'Hug streak 1'),
    Hug(image: 'friendship.png', achievement: 'Friendly Hugger'),
    Hug(image: 'grandma.png', achievement: 'Grandma Hugger'),
    Hug(image: 'quick.png', achievement: 'Quick Hugger'),
    Hug(image: 'side.png', achievement: 'Side Hugger'),
    Hug(image: 'warm.png', achievement: 'Warm Hugger'),
    Hug(image: 'chill.png', achievement: 'Chill Hugger')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1/1.5,
          ),
          itemCount: hugs.length,
          itemBuilder: (context, index) {
            return Container(
                color: Color(0xffFFE289),
                child: AchievementCard()
            );
          }
      ),
    );
  }
}
