import 'package:market/data/repository/app.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/resources/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final TextEditingController _message = TextEditingController();
  void _sendFeedback() async {
    final user = context.read<AppRepository>().user;
    if (_message.text.isNotEmpty && user != null) {
      final res = await service<UserAccount>().feedback(
        subject: "subject",
        description: _message.text,
      );
      res.when(
        onError: (error) => context.snackBar(InfoMessage.fromError(error)),
        onSuccess: (data) => context.snackBar(
          const InfoMessage(
              message: "Thank you for the feedback", type: MessageType.success),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: _sendFeedback,
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Form(
              child: TextFormField(
                maxLines: 8,
                controller: _message,
                minLines: 6,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Color(0xfff3f3f4),
                    filled: true,
                    hintText: "write your feedback"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
