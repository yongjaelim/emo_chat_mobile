import '../message.dart';

class MessageRepository {

  final List<Message> _messageList = [
    Message(userId: 1, message: '안녕하세요!', roomIdx: 0),
    Message(userId: 2, message: '안녕', roomIdx: 1),
    Message(userId: 3, message: '새해 복 많이 받으세요.', roomIdx: 2)
  ]; //dummy data

  final List<String> _messagePreviewList = ['안녕하세요!', '안녕', '새해 복 많이 받으세요']; // dummy data
  final List<String> _messageSentTimeList = ['오후 4:30', '어제', '2022/12/31']; // dummy data

  List<Message> get messageList => _messageList;
  List<String> get messagePreviewList => _messagePreviewList;
  List<String> get messageSentTimeList => _messageSentTimeList;

  void addMessage(Message message) {
    _messageList.add(message);
    _messagePreviewList[message.roomIdx] = message.message;
  }

  void editSentTimeList(int roomIdx) {
    DateTime now = DateTime.now();
    String currentTime = now.toString();
    var parsedTime = DateTime.parse(currentTime).toString();
    _messageSentTimeList[roomIdx] = parsedTime;
  }
}