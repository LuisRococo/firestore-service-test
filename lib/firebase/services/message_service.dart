import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_service_test_app/firebase/models/message_model.dart';

class MessageService {
  final db = FirebaseFirestore.instance;

  Future<List<MessageModel>> getAllMessages() async {
    List<MessageModel> messages = [];
    final QuerySnapshot querySnapshot = await db.collection("messages").get();

    for (var doc in querySnapshot.docs) {
      messages.add(MessageModel.fromDocumentSnapshot(doc as dynamic));
    }

    return messages;
  }
}
