import 'package:flutter/material.dart';
import 'package:flutter_chat/src/mixins/validator_mixins.dart';
import 'package:flutter_chat/src/services/authentication.dart';
import 'package:flutter_chat/src/widget/app_Texfield.dart';
import 'package:flutter_chat/src/widget/app_button.dart';
import 'package:flutter_chat/src/widget/app_icon.dart';
import 'package:flutter_chat/src/widget/error_message_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidatorMixins {
  TextEditingController _controllerEmail;
  TextEditingController _controllerPassword;
  FocusNode _focusEmail;
  bool showSpinner = false;
  bool _autoValidate = false;
  String _errorMessage = '';

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _focusEmail = FocusNode();
  }

  //liberar reacursos de la applicación
  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _focusEmail.dispose();
  }

  void setSpinnerStatus(bool status) {
    setState(() {
      showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AppIcon(),
                      SizedBox(height: 48.0),
                      _emailField(),
                      SizedBox(height: 8.0),
                      _passWordField(),
                      SizedBox(height: 23.0),
                      showErrorMessage(),
                      _submitButtomField()
                    ],
                  ),
                ))));
  }

  Widget _emailField() {
    return AppTextField(
      inputText: 'Ingrese Email',
      autoValidate: _autoValidate,
      validator: validateEmail,
      onSaved: (value) {},
      controller: _controllerEmail,
      focus: _focusEmail,
    );
  }

  Widget _passWordField() {
    return AppTextField(
      inputText: 'Ingrese Contraseña',
      autoValidate: _autoValidate,
      validator: validatePassword,
      onSaved: (value) {},
      obscureText: true,
      controller: _controllerPassword,
    );
  }

  Widget _submitButtomField() {
    return AppButton(
      color: Colors.blueAccent,
      name: 'Log In',
      onPressed: () async {
        if (formKey.currentState.validate()) {
          setSpinnerStatus(true);
          var auth = await Authentication().loginUser(
              email: _controllerEmail.text, password: _controllerPassword.text);
          if (auth.success) {
            Navigator.pushNamed(context, '/chat');

            //Realizar autoFoco del inputText
            FocusScope.of(context).requestFocus(_focusEmail);
            //lmpiar campo de texto
            _controllerEmail.text = '';
            _controllerPassword.text = '';
          } else {
            setState(() {
              _errorMessage = auth.errorMessage;
            });
            print(auth.errorMessage);
          }
          setSpinnerStatus(false);
        } else {
          setState(() => _autoValidate = true);
        }
      },
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return ErrorMessage(errorMessage: _errorMessage);
    } else {
      return Container(height: 0.0);
    }
  }
}
