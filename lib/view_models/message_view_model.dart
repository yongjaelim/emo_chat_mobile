import 'package:emo_chat_mobile/models/repositories/message_repository.dart';
import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageViewModel with ChangeNotifier {
  late MessageRepository _messageRepository;
  String? _message;
  bool _buttonEnabled = false;

  MessageViewModel() {
    _messageRepository = MessageRepository();
  }

  void setMessage(String value) {
    if (_message == value) {
      return;
    }
    _message = value;
    _updateButtonEnabled();
    notifyListeners();
  }

  String? get message => _message;
  bool get getButtonEnabled => _buttonEnabled;
  List<Message> get messageList => _messageRepository.messageList;
  List<String> get messageSentTimeList => _messageRepository.messageSentTimeList;
  List<String> get messagePreviewList => _messageRepository.messagePreviewList;

  void sendMessage(int roomIdx, String message, ScrollController scrollController) {
    Message sentMessage = Message(
      userId: 0,
      message: message,
      roomIdx: roomIdx,
    );
    _messageRepository.addMessage(sentMessage);
    _messageRepository.editSentTimeList(roomIdx);
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
    notifyListeners();
  }

  void _updateButtonEnabled() {
    _buttonEnabled = _message!.isNotEmpty;
  }

  void makeFieldsEmpty() {
    _message = null;
  }
}
