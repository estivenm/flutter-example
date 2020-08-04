import 'package:flutter/material.dart';

class MytextField extends StatefulWidget {

  
  @override
  _MytextFieldState createState() => new _MytextFieldState();
}

class _MytextFieldState extends State<MytextField> {
  String inputText = "";
  final TextEditingController controller = TextEditingController();

void onSubmitted(String value){
  setState(() {
     inputText = inputText + '\n'+ value;
     controller.text = '';
  });
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("TextField Widget"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                onSubmitted: onSubmitted,
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Ingrese Texto...',
                  labelText: 'Texto',
                ),
              ),
              Text(inputText)
            ],
          ),
        ));
  }
}
