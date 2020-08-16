import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import '../authenticate/login_teddy/teddy_controller.dart';
import '../home/HomePage3.dart';
import '../home/HomePage1.dart';
class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.0, 1.0],
                        colors: [
                          Color.fromRGBO(30, 207, 211, 1.0),
                          Color.fromRGBO(40, 142, 60, 1.0),
                        ],
                      ),
                    ),
                  )),
              Positioned.fill(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 200,
                              padding: const EdgeInsets.only(left: 30.0, right:30.0),
                              child: FlareActor(
                                "assets/TeddyYellow.flr",
                                shouldClip: false,
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.contain,
                                controller: _teddyController,
                              )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(130.0, 160.0, 20.0, 10.0),
                            child: Container(
                                child: SafeArea(
                                  child: Row(
                                      children:<Widget> [
                                        IconButton(
                                          onPressed: () {
                                            print("You clicked on HAPPY");
                                            _teddyController.play("success");
                                          },
                                          icon: Icon(Icons.accessibility_new),
                                          color: Colors.amber,
                                          iconSize: 40.0,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            print("You clicked on fidget");
                                            _teddyController.play("fail");
                                          },
                                          icon: Icon(Icons.ac_unit),
                                          color: Colors.amber,
                                          iconSize: 40.0,
                                        )]
                                  ),
                                )
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(130.0, 20.0, 20.0, 10.0),
                              child: Container(
                                  child: SafeArea(
                                    child: Row(
                                        children:<Widget> [
                                          IconButton(
                                            onPressed: () {
                                              print("Switched to Teddy 1");
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyHomePage1(),
                                                  )
                                              );
                                            },
                                            icon: Icon(Icons.account_box),
                                            color: Colors.white,
                                            iconSize: 40.0,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              print("Switched to Teddy 3");
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyHomePage3(),
                                                  )
                                              );
                                            },
                                            icon: Icon(Icons.account_box),
                                            color: Colors.white,
                                            iconSize: 40.0,
                                          )]
                                    ),
                                  )
                              )
                          )
                        ])),
              ),
            ],
          )),
    );
  }
}
