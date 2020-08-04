import 'package:flutter/material.dart';
import 'package:form_app/src/mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixins {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.5)),
              submitButton()
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'Ingrese email',
        labelText: 'Email *',
      ),
      validator: validateEmail,
      onSaved: (String value) {},
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.remove_red_eye),
        hintText: 'Ingrese contraseña',
        labelText: 'password *',
      ),
      validator: validatePassword,
      onSaved: (String value) {},
    );
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text('Enviar'),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
          }
          // formKey.currentState.reset();
        });
  }
}
