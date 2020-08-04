import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  final suggestions = <WordPair>[];
  final save = <WordPair>[];

  ListTile buildRow(WordPair pair) {
    final bool alreadySaved = save.contains(pair);

    return ListTile(
      onTap: () {
        setState(() {
          if (alreadySaved) {
            save.remove(pair);
          } else {
            save.add(pair);
          }
        });
      },
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: Colors.redAccent),
      title: Text('Producto ${pair.asPascalCase}'),
      subtitle: Text('Precio ${Random().nextInt(100)} USD'),
    );
  }

  @override
  Widget build(BuildContext context) {
    void pushSaved() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        final tiles = save
            .map<ListTile>((pair) => ListTile(
                  title: Text(pair.asPascalCase),
                ))
            .toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Favorites'),
          ),
          body: ListView(children: tiles),
        );
      }));
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text('Lista infinita'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: pushSaved)
        ],
      ),
      body: ListView.builder(
          // lista infinita
          itemBuilder: (context, i) {
        //valor es par o impar
        if (i.isOdd) return Divider();
        if (i >= suggestions.length) {
          suggestions.addAll(generateWordPairs().take(10));
        }
        return buildRow(suggestions[i]);
      }),
    );
  }
}
