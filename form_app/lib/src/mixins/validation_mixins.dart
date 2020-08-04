class ValidationMixins {
  String validateEmail(String value) {
    return !value.contains('@') ? 'Ingrese un correo valido' : null;
  }

  String validatePassword(String value) {
    return value.length < 6 ? 'Contraseña invalida' : null;
  }
}
