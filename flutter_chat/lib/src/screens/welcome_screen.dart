import 'package:flutter/material.dart';
import 'package:flutter_chat/src/widget/app_button.dart';
import 'package:flutter_chat/src/widget/app_icon.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '';

  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //centrar elementos
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppIcon(),
              SizedBox(height: 45.0),
              AppButton(
                color: Colors.lightBlueAccent,
                name: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              AppButton(
                color: Colors.blueAccent,
                name: 'Registrarse',
                onPressed: () {
                  Navigator.pushNamed(context, '/registration');
                },
              ),
            ],
          ),
        ));
  }
}
