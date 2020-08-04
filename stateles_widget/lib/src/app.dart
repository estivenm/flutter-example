import 'package:flutter/material.dart';
import 'package:stateles_widget/src/screens/card.dart';

class MyApp extends StatelessWidget {
  final double iconSize = 40.0;
  final TextStyle textStyle = TextStyle(color: Colors.grey, fontSize: 30.0);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateles Widget"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyCard(
              title: Text('Estiven Mazo', style: textStyle),
              icon: Icon(Icons.favorite,color: Colors.redAccent,size: iconSize),
            ),
           MyCard(
              title: Text('Tom Mazo', style: textStyle),
              icon: Icon(Icons.thumb_up ,color: Colors.blueAccent,size: iconSize),
            ),
             MyCard(
              title: Text('Aion Mazo', style: textStyle),
              icon: Icon(Icons.queue_play_next,color: Colors.brown,size: iconSize),
            )
          ],
        ),
      ),
    );
  }
}