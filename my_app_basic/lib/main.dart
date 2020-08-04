import 'package:flutter/material.dart';

void main(){

  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Mi primera app"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Hola Mundo",
            style: TextStyle(fontSize:20.0)
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () { print('click'); }),
    ),
  );
runApp(app);
}


