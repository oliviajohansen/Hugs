import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: 1,
      color: Colors.grey[200],
      backgroundColor: Color(0x94FAFAFA),
      buttonBackgroundColor: Color(0xffFFE289),
      height: 65,
      items: <Widget>[
        Image.asset('assets/images/Home button.png',
          height: 50,
          width: 50,
        ),
        Image.asset('assets/images/Chat button.png',
          height: 50,
          width: 50,
        ),
        Icon(
            Icons.add,
            size: 30,
            color: Color(0xff7A8FA6)
        ),
        Image.asset('assets/images/Trophy button.png',
          height: 50,
          width: 50,
        ),
        Image.asset('assets/images/Profile button.png',
          height: 50,
          width: 50,
        ),
      ],
//        onTap: (index) {
//        setState(() {
//    //            position = index;
//        });
    );
  }
}
