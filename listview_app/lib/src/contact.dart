import 'package:flutter/material.dart';
import 'package:listview_app/src/model/contact_model.dart';
import 'package:listview_app/src/screeens/contact_item.dart';

class Contact extends StatelessWidget {
  buildList() {
    return <ContactModel>[
      ContactModel(name: 'Estiven Mazo', email: 'Estivenm@gmail.com'),
      ContactModel(name: 'Juan Mazo', email: 'Estivenm@gmail.com'),
      ContactModel(name: 'Carlos Mazo', email: 'Estivenm@gmail.com'),
      ContactModel(name: 'Luciana Mazo', email: 'Estivenm@gmail.com'),
      ContactModel(name: 'Matias Mazo', email: 'Estivenm@gmail.com'),
    ];
  }

  List<ContactItem> buildContacList() {
    return buildList()
        .map<ContactItem>((contact) => ContactItem(contact: contact))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Contactos'),
      ),
      body: ListView(
        children: buildContacList(),
      ),
    );
  }
}
