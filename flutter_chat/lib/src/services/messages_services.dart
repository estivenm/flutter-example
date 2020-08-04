import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesServices {
  final _fireStore = Firestore.instance;

  void save({String colletionName, Map<String, dynamic> colletionValues}) {
    _fireStore.collection(colletionName).add(colletionValues);
  }

  Future<QuerySnapshot> getMessages(String colletionName) async {
    return await _fireStore.collection(colletionName).getDocuments();
  }

  Stream<QuerySnapshot> getMessagesStream(String colletionName) {
    return _fireStore.collection(colletionName).snapshots();
  }
}
