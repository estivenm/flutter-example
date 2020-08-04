import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/src/models/auth_request_model.dart';

enum error {
  ERROR_USER_NOT_FOUNT,
  ERROR_WORD_PASSWORD,
  ERROR_NETWORD_REQUEST_FAILED
}

class Authentication {
  //crea una instancia de  FirebaseAuth atravez del patron singleton
  final _auth = FirebaseAuth.instance;

  Future<AutheticationRequest> createUser(
      {String email = "", String password = ""}) async {
    AutheticationRequest autheticationRequest = AutheticationRequest();
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        autheticationRequest.success = true;
      }
    } catch (e) {
      _mapErrorMessage(autheticationRequest, e.code);
    }
    return autheticationRequest;
  }

  Future<FirebaseUser> getCurrentUser() async {
    AutheticationRequest autheticationRequest = AutheticationRequest();
    try {
      // var user = await _auth.currentUser();
      return await _auth.currentUser();
      // if(user != null){
      //   autheticationRequest.success = true;
      // }
    } catch (e) {
      _mapErrorMessage(autheticationRequest, e.code);
    }
    // return autheticationRequest;
    return null;
  }

  /**
   * Login de usuario en la aplicacion
   * email: Correo
   * password: contraseña del usuario
   */
  Future<AutheticationRequest> loginUser(
      {String email = "", String password = ""}) async {
    AutheticationRequest autheticationRequest = AutheticationRequest();
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        autheticationRequest.success = true;
      }
    } catch (e) {
      _mapErrorMessage(autheticationRequest, e.code);
    }
    return autheticationRequest;
  }

  /**
   * desloguea usuario en la aplicacion
   */
  Future<void> singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
    return null;
  }

  void _mapErrorMessage(AutheticationRequest authRequest, String code) {
    switch (code) {
      case 'ERROR_USER_NOT_FOUNT':
        authRequest.errorMessage = 'Usuario no encontrado';
        break;
      case 'ERROR_WRONG_PASSWORD':
        authRequest.errorMessage = 'Contraseña invalida';
        break;
      case 'ERROR_NETWORD_REQUEST_FAILED':
        authRequest.errorMessage = 'Error de red';
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        authRequest.errorMessage = 'El usuario ya está registrado';
        break;
      default:
        authRequest.errorMessage = code;
    }
  }
}
