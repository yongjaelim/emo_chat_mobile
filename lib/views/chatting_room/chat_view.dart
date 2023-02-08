import 'package:emo_chat_mobile/view_models/message_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/message.dart';
import '../../view_models/emoji_view_model.dart';
import '../emoji_view.dart';
import 'chat_bubble.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key, required this.userName, required this.index})
      : super(key: key);
  final String userName;
  final int index;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Consumer<MessageViewModel>(
        builder: (context, messageViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messageViewModel.messages.length,
                    itemBuilder: (context, index) {
                      //_scrollController.position.maxScrollExtent;
                      if (messageViewModel.messages[index].roomIdx ==
                          widget.index) {
                        return ChatBubble(
                          messageViewModel.messages[index].message,
                          messageViewModel.messages[index].userId == 0,
                        );
                      } else {
                        return const SizedBox(height: 0);
                      }
                    },
                  ),
                ),
                newMessage(messageViewModel),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget newMessage(MessageViewModel messageViewModel) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
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
                    onPressed:
                        () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => EmojiView()
                      ));
                    },
                  )
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: _textController.text.isNotEmpty
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
    Message inputMessage = Message(
      userId: 0,
      message: _textController.text,
      roomIdx: widget.index,
    );
    messageViewModel.messages.add(inputMessage);
    messageViewModel.updatePreviewMessageList(
      widget.index,
      _textController.text,
    );
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInQuad,
    );
    _textController.clear();
    setState(() {});
  }


}
