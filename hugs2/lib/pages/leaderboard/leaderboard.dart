import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {

  List<String> leader = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 20.0, 0, 20.0),
          child: Row(
              children: <Widget> [
                Text('Leaderboard',
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
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
//              scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: leader.length,
            itemBuilder: (context, index) {
              return Padding(padding: const EdgeInsets.symmetric(
                  vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                      onTap: () {},
                      title: Text('Leader' + leader[index]),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/anon.png'),
                      ),
                      trailing: Wrap(
                          spacing: 20,
                          children: <Widget>[
                            index == 0
                                ? Image.asset(
                                'assets/images/Trophy button (yellow).png')
                                : new Container(width: 0.0, height: 0.0),
                            Text('81'),
                          ]
                      )
                  ),
                ),
              );
            }
        )
      ],
    );
  }
}
