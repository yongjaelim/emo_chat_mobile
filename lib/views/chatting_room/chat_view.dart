import 'package:flutter/material.dart';

import '../../models/message.dart';
import 'chat_bubble.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key, required this.userName, required this.index}) : super(key: key);
  final String userName;
  final int index;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';
  final List<Message> messages = [
    Message(userId: 1, message: '안녕하세요!'),
    Message(userId: 2, message: '안녕'),
    Message(userId: 3, message: '새해 복 많이 받으세요.')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: conversation(),
            ),
            //Text('sdf'),
            newMessage()
          ],
        ),
      ),
    );
  }

  Widget conversation() {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (widget.index + 1 == messages[index].userId) {
          return ChatBubble(
            messages[index].message,
            messages[index].userId == 0,
          );
        } else {
          return const Text('');
        }
      },
    );
  }
  void _sendMessage(){
    FocusScope.of(context).unfocus();
    Message inputMessage = Message(
      userId: 0,
      message: _userEnterMessage
    );
    messages.add(inputMessage);
    _controller.clear();
  }

  Widget newMessage() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller,
              decoration: const InputDecoration(labelText: '메시지를 입력해주세요.'),
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: const Icon(Icons.send),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
