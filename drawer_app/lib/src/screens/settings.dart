import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String routeName = '/settings';

 @override
 Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    title: Text('Configuraciónes'),
  ),
  body: Container(
    child: Center(
      child: Text('Pantalla de Settins'),
    )
  ),
 );
 }
}