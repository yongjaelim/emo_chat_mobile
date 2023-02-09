class Message {
  late int userId;
  late String message;
  late int roomIdx;

  Message({
    required this.userId,
    required this.message,
    required this.roomIdx,
  });

  // it needs toJason method to upload message data to server
}
