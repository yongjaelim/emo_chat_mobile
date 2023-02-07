import 'package:flutter/material.dart';

import '../models/message.dart';

class MessageViewModel with ChangeNotifier {
  List<Message> messages = [
    Message(userId: 1, message: '안녕하세요!', roomIdx: 0),
    Message(userId: 2, message: '안녕', roomIdx: 1),
    Message(userId: 3, message: '새해 복 많이 받으세요.', roomIdx: 2)
  ];

  List<String> messageList = ['안녕하세요!', '안녕', '새해 복 많이 받으세요'];
  List<String> messageSentTimeList = ['오후 4:30', '어제', '2022/12/31'];

  void updatePreviewMessageList(int roomIdx, String message) {
    DateTime now = DateTime.now();
    String currentTime = now.toString();
    var parsedTime = DateTime.parse(currentTime).toString();
    messageSentTimeList[roomIdx] = parsedTime;
    messageList[roomIdx] = message;
    notifyListeners();
  }
}