import 'dart:math';

import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  String nameText= '';
  int index = 0;
  List<String> colletion = ['Juan','Tom','Aion'];
  Random random = new Random();

  void onpressButton(){
    setState(() {
     index = random.nextInt(colletion.length);
     nameText = colletion[index];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Stateful widget'), backgroundColor: Colors.pink),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              nameText,
              style: TextStyle(fontSize: 40.0),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              child: Text('Actualizar', style: TextStyle(color: Colors.white)),
              color: Colors.blueAccent,
              onPressed: () { onpressButton(); },
            )
          ],
        ),
      )),
    );
  }
}
