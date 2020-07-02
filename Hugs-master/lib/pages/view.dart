import 'package:flutter/material.dart';
import 'achievements/achievements.dart';
import 'leaderboard/leaderboard.dart';
import 'achievements/achievementHeader.dart';
import 'bottomNavBar.dart';


class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: AchievementHeader(),
                  ),
                  Achievements(),
                  Leaderboard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
