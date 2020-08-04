import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Bloc>(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.accessibility_new,
              size: 100.0,
            ),
          ),
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 20.0)),
          submitButton(bloc)
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (BuildContext context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Ingrese email',
              labelText: 'Email *',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.remove_red_eye),
              hintText: 'Ingrese contraseña',
              labelText: 'password *',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
              child: Text('Enviar'),
              onPressed: !snapshot.hasData ? null : bloc.submit);
        });
  }
}
