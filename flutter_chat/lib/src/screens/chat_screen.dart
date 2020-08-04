import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/src/services/authentication.dart';
import 'package:flutter_chat/src/services/messages_services.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseUser loggedInUser;
  final auth = FirebaseAuth.instance;
  static String colletionName = 'messages';

  TextEditingController _controllerMessages = TextEditingController();
  InputDecoration _messageTextInputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      hintText: 'Ingresa mensaje',
      border: InputBorder.none);

  BoxDecoration _messageContainerDecoration = BoxDecoration(
    border: Border(top: BorderSide(color: Colors.lightBlue, width: 2.0)),
    // image: DecorationImage(image: AssetImage('images/fondo.png'))
  );

  TextStyle _sendButtonStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.lightBlueAccent);

  @override
  void initState() {
    super.initState();

    getCurrentUser();
    getMessages();
  }

  void getCurrentUser() async {
    var user = await Authentication().getCurrentUser();
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  void getMessages() async {
    await for (var messages
        in MessagesServices().getMessagesStream(colletionName)) {
      for (var item in messages.documents) {
        print(item.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('chat'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                Authentication().singOut();
                Navigator.pop(context);
              })
        ],
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: MessagesServices().getMessagesStream(colletionName),
            builder: (context, snapShopt) {
              if (snapShopt.hasData) {
                return Flexible(
                    child: ListView(
                        children: _getChatItems(snapShopt.data.documents)));
              }
            },
          ),
          Container(
            decoration: _messageContainerDecoration,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: _controllerMessages,
                  decoration: _messageTextInputDecoration,
                )),
                FlatButton(
                  onPressed: () {
                    var messagesData = {
                      'value': _controllerMessages.text,
                      'sender': loggedInUser.email
                    };

                    MessagesServices().save(
                        colletionName: colletionName,
                        colletionValues: messagesData);

                    _controllerMessages.clear();
                  },
                  child: Text('Enviar', style: _sendButtonStyle),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  List<ChatItem> _getChatItems(dynamic messages) {
    List<ChatItem> chatItems = [];

    for (var message in messages) {
      final messagesValues = message.data['value'];
      final messagesSender = message.data['sender'];
      chatItems.add(ChatItem(
        message: messagesValues,
        sender: messagesSender,
        isLoggedInuser: messagesSender == loggedInUser.email,
      ));
    }
    return chatItems;
  }
}

class ChatItem extends StatelessWidget {
  final String sender;
  final String message;
  final bool isLoggedInuser;

  ChatItem({this.sender, this.message, this.isLoggedInuser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isLoggedInuser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(sender, style: TextStyle(fontSize: 15.0, color: Colors.black54)),
          Material(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                message,
                style: TextStyle(
                    fontSize: 16,
                    color: isLoggedInuser ? Colors.black54 : Colors.white),
              ),
            ),
            borderRadius: BorderRadius.only(
              topRight:
                  isLoggedInuser ? Radius.circular(0) : Radius.circular(30.0),
              topLeft:
                  isLoggedInuser ? Radius.circular(30.0) : Radius.circular(0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isLoggedInuser ? Colors.white : Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
