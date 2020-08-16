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
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: Row (
            children: <Widget>[
              SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                      'Leaderboard',
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
