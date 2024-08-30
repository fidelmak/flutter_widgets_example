import 'package:flutter/material.dart';

import '../widgets/message_bubble.dart';

void main() => runApp(ChatScreenApp());

class ChatScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          MessageBubble(
            userImage: 'https://example.com/image.png',
            username: 'John Doe',
            message: 'Hello there!',
            isMe: true,
            isFirstInSequence: true,
            maxBubbleWidth: 250,
            borderRadius: 16,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
          ),
          MessageBubble(
            message: 'How are you?',
            isMe: true,
            isFirstInSequence: false,
          ),
          MessageBubble(
            userImage: 'https://example.com/image2.png',
            username: 'Jane Doe',
            message: 'Hi John, I\'m good!',
            isMe: false,
            isFirstInSequence: true,
            maxBubbleWidth: 250,
            borderRadius: 16,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.black,
          ),
          MessageBubble(
            message: 'How about you?',
            isMe: false,
            isFirstInSequence: false,
          ),
        ],
      ),
    );
  }
}
