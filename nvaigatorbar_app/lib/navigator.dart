import 'package:flutter/material.dart';
import 'package:nvaigatorbar_app/screens/firts.dart';
import 'package:nvaigatorbar_app/screens/second.dart';
import 'package:nvaigatorbar_app/screens/third.dart';

class MyNavigator extends StatefulWidget {
  @override
  _MyNavigatorState createState() {
    return new _MyNavigatorState();
  }
}

class _MyNavigatorState extends State<MyNavigator> {
  String title = 'Navigator';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar:
                AppBar(title: Text(title), backgroundColor: Colors.blueAccent),
            body: TabBarView(
                // Se Proporcionan  todos los widget que se desean contener
                children: <Widget>[
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ]),
            bottomNavigationBar: Material(
              color: Colors.blueAccent,
              child: TabBar(tabs: <Tab>[
                Tab(icon: Icon(Icons.alarm)),
                Tab(icon: Icon(Icons.watch_later)),
                Tab(icon: Icon(Icons.airplanemode_active)),
              ]),
            )));
  }
}
