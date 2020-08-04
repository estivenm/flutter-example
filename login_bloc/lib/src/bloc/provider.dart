import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/bloc.dart';

class Provider extends InheritedWidget {
  Provider({key, Widget child}) : super(key: key, child: child);

  final bloc = Bloc();
  bool updateShouldNotify(_) {
    return true;
  }

  static Bloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
}
