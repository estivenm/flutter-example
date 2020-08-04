import 'package:flutter/material.dart';
import 'package:form_app/src/screens/login_Screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Iniciar sesion',
        home: Scaffold(
          body: LoginScreen(),
        ));
  }
}
