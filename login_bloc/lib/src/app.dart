import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_Screen.dart';
import 'package:provider/provider.dart';
import 'package:login_bloc/src/bloc/bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Bloc>(
        create: (context) => Bloc(),
        dispose: (context, bloc) => bloc.dispose(),
        child: MaterialApp(
            title: 'Iniciar sesion',
            home: Scaffold(
              appBar: AppBar(
                title: Text('login Screen'),
                backgroundColor: Colors.black,
              ),
              body: LoginScreen(),
            )));
  }
}
