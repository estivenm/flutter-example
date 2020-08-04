import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (!email.contains('@'))
      sink.addError('Ingrese un correo valido');
    else {
      sink.add(email);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 6)
      sink.addError('Contraseña invalida');
    else {
      sink.add(password);
    }
  });
}
