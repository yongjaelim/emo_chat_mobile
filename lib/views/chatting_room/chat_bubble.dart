import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMyself, {Key? key}) : super(key: key);

  final String message;
  final bool isMyself;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Row(
        mainAxisAlignment: isMyself ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMyself ? Colors.blue : Colors.grey[400],
              borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(12),
                  topLeft: const Radius.circular(12),
                  bottomRight: isMyself ? const Radius.circular(0) : const Radius.circular(12),
                  bottomLeft:  isMyself ? const Radius.circular(12) : const Radius.circular(0),
              )
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.48,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),
              child: Text(
                message,
                style: const TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
