
import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
 }
 
enum DialogAction {
  yes,
  no
}

class _MyDialogState extends State<MyDialog> {
  String title = 'My dialog';  
  TextEditingController controller = TextEditingController();

  String showText(){
    String text = controller.text;
    return text;
  }

  void alertResult(DialogAction action){
    print('Tú selección es ${ action }');

  }

  void showAlert(String value){

    AlertDialog dialog = AlertDialog(
      content:  Text(value),
      actions: <Widget>[
        FlatButton(
          child: Text('Si'),
          onPressed:() {alertResult(DialogAction.yes);},
        ),
         FlatButton(
          child: Text(' No'),
          onPressed:() {alertResult(DialogAction.no);},
        ),
      ],
    );

  showDialog(context: context, 
    builder: (BuildContext context){ return dialog;}
  );

  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
       title: Text(title),
     ),
     body:Container(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
             TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Ingrese Texto...',
                  labelText: 'Texto',
                ),
              ),
              RaisedButton(
                child: Text('Ver alerta'),
                onPressed:(){ showAlert(showText());}
              ),
         ],
       ),
     )
   );
  }
}