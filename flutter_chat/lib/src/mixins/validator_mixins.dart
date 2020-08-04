class ValidatorMixins {
  String validateEmail(String value) {
    return !value.contains('@') ? 'Ingrese un correo valído' : null;
    // ^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$
  }

  String validatePassword(String value) {
    return value.length < 6 ? 'Contraseña invalida' : null;
  }
}
