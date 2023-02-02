import 'package:emo_chat_mobile/models/emoji_caller.dart';
import 'package:flutter/material.dart';
import '../../models/emoji.dart';


class EmojiViewModel extends ChangeNotifier {

  List<Emoji> emojis = <Emoji>[];
  List<String> unicodes = <String>[];

  void getEmojis() async {
    emojis = await EmojiCaller().getEmojis();
    notifyListeners();
  }

  void getUnicodes() async {
    getEmojis();
    unicodes = await EmojiCaller().getUnicodes();
    notifyListeners();
  }
}