import 'package:emo_chat_mobile/models/repositories/message_repository.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';

class MessageViewModel with ChangeNotifier {
  late MessageRepository _messageViewModel;

  MessageViewModel() {
    _messageViewModel = MessageRepository();
  }

  List<Message> get messageList => _messageViewModel.messageList;
  List<String> get messageSentTimeList => _messageViewModel.messageSentTimeList;
  List<String> get messagePreviewList => _messageViewModel.messagePreviewList;

  void updatePreviewMessageList(int roomIdx, String message) {
    Message sentMessage = Message(
      userId: 0,
      message: message,
      roomIdx: roomIdx,
    );
    _messageViewModel.addMessage(sentMessage);
    _messageViewModel.editSentTimeList(roomIdx);
    notifyListeners();
  }
}
