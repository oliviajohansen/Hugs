import 'package:flutter/material.dart';

class AchievementHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
          children: <Widget> [
            Text('Achievements',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 8.0, 0.0, 0.0),
              child: Image.asset('assets/images/Yellow dot.png'),
            )

          ]
      ),
      trailing: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Profile picture.png')
      ),
    );
  }
}
