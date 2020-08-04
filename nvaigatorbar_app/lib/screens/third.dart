import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  String contentText = 'Third Tab';
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.airplanemode_active, size: 160.0, color: Colors.white),
              Text(contentText,style: TextStyle( fontSize: 20.0, color: Colors.white),)
            ],
          ),
        ),
      )
    );
 }
}