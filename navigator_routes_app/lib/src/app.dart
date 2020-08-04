import 'package:flutter/material.dart';
import 'package:navigator_routes_app/src/screens/second.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  String title = 'Navigator';
  String textNavigator = 'Second';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: RaisedButton(
            child: Text(title),
            onPressed: () {
              //Navegar a pantalla
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Second(name: 'Juan')));
            }),
      ),
    );
  }
}
