import 'dart:async';
import 'package:emo_chat_mobile/view_models/message_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../emoji_view.dart';
import 'chat_bubble.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key, required this.userName, required this.index})
      : super(key: key);
  final String userName;
  final int index;

  final TextEditingController _textController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(milliseconds: 1),
        () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent));
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text(
                userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Consumer<MessageViewModel>(
              builder: (context, messageViewModel, child) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: messageViewModel.messageList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == messageViewModel.messageList.length) {
                            return Container(
                              height: 50,
                            );
                          }
                          //print(index);
                          if (messageViewModel.messageList[index].roomIdx ==
                              this.index) {
                            return ChatBubble(
                              messageViewModel.messageList[index].message,
                              messageViewModel.messageList[index].userId == 0,
                            );

                          } else {
                            return const SizedBox(height: 0);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _newMessage(messageViewModel, context)
                  ],
                );
              },
            )));
  }

  Widget _newMessage(MessageViewModel messageViewModel, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              onTap: () => _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeIn),
              maxLines: null,
              controller: _textController,
              decoration: InputDecoration(
                  labelText: '메시지를 입력해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.sentiment_neutral),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EmojiView()));
                    },
                  )),
              onChanged: (text) {
                //setState(() {});
                messageViewModel.setMessage(text);
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: messageViewModel.getButtonEnabled
                ? () {
                    _sendMessage(messageViewModel);
                  }
                : null,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
            child: const Text('전송'),
          ),
        ],
      ),
    );
  }

  void _sendMessage(MessageViewModel messageViewModel) {
    messageViewModel.sendMessage(
        index, _textController.text, _scrollController);

    messageViewModel.setMessage('');

    _textController.clear();
  }
}
