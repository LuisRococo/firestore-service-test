import 'package:fb_service_test_app/firebase/models/message_model.dart';
import 'package:fb_service_test_app/firebase/services/message_service.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String requestStatus = "Nothing, Haha Crazy";
  List<MessageModel> messages = [];
  MessageService msjService = MessageService();

  handleBtnPress() async {
    setState(() {
      requestStatus = "Loading";
      messages = [];
    });

    final newMessages = await msjService.getAllMessages();

    setState(() {
      messages = newMessages;
      requestStatus = "Updated !!!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: handleBtnPress, child: const Text("Get data")),
                const SizedBox(height: 20),
                Text("Status: $requestStatus"),
                const SizedBox(height: 20),
                const Text("Mensages: "),
                if (messages.isEmpty)
                  const Text(
                    "No data",
                    style: TextStyle(color: Color.fromARGB(255, 124, 124, 124)),
                  ),
                ...messages.map((message) => Text(message.message)).toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
