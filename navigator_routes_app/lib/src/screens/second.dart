import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  final String name;
  Second({this.name});

  @override
  Widget build(BuildContext context) {
    String title = 'Seconds';
    String buttomText = 'Ir atras';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text(buttomText),
              onPressed: () {
                //Navegar pantalla atras
                Navigator.pop(context);
              }),
          Text('Tú nombre es: $name'),
        ],
      )),
    );
  }
}
