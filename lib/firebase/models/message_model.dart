import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String message;

  MessageModel({required this.id, required this.message});

  MessageModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        message = doc.data()!["message"];
}
