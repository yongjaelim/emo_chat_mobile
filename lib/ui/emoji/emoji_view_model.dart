import 'package:emo_chat_mobile/models/emoji_caller.dart';
import 'package:flutter/material.dart';
import '../../models/emoji.dart';


class EmojiViewModel extends ChangeNotifier {

  List<Emoji> _emojis = <Emoji>[];
  List<String> _unicodes = <String>[];

  List<Emoji> get emojis => _emojis;
  List<String> get unicodes => _unicodes;

  EmojiViewModel() {
    getEmojis('people');
    getUnicodes('people');
  }

  void getEmojis(String category) async {
    _emojis = await EmojiCaller().getEmojis(category);
    notifyListeners();
  }

  void getUnicodes(String category) async {
    getEmojis(category);
    _unicodes = await EmojiCaller().getUnicodes(category);
    notifyListeners();
  }
}