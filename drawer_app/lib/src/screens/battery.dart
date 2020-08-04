
import 'package:flutter/material.dart';

class Battery extends StatelessWidget {
  static const String routeName = '/battery';
 @override
 Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    title: Text('Batery'),
  ),
  body: Container(
    child: Center(
      child: Text('Pantalla de Battery'),
    )
  ),
 );
 }
}