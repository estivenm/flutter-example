import 'package:flutter/material.dart';
import 'package:flutter_chat/src/mixins/validator_mixins.dart';
import 'package:flutter_chat/src/services/authentication.dart';
import 'package:flutter_chat/src/widget/app_Texfield.dart';
import 'package:flutter_chat/src/widget/app_button.dart';
import 'package:flutter_chat/src/widget/app_icon.dart';
import 'package:flutter_chat/src/widget/error_message_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/registration';
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with ValidatorMixins {
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _controllerEmail;
  TextEditingController _controllerPassword;
  FocusNode _focusEmail;
  bool _showSpinner = false;
  bool _autoValidate = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _focusEmail = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _focusEmail.dispose();
  }

  void setSpinnerStatus(bool status) {
    setState(() {
      _showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
          inAsyncCall: _showSpinner,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppIcon(),
                    SizedBox(height: 48.0),
                    _emailField(),
                    SizedBox(height: 8.0),
                    _passWordField(),
                    SizedBox(height: 24.0),
                    showErrorMessage(),
                    _submitButtomField()
                  ],
                ),
              ))),
    );
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
      name: 'Registrarse',
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          setSpinnerStatus(true);
          var auth = await Authentication().createUser(
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
