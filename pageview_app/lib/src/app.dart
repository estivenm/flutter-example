import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(child: PageView.builder(itemBuilder: (context, index) {
      return Container(
        color: index.isOdd ? Colors.pink : Colors.cyanAccent,
      );
    })

        // child: PageView(
        //   children: <Widget>[
        //     Container(
        //       color: Colors.red,
        //     ),
        //     Container(
        //       color: Colors.greenAccent,
        //     ),
        //     Container(
        //       color: Colors.pinkAccent,
        //     )
        //   ],
        // )
        );
  }
}
