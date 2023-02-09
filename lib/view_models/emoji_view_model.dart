import 'package:emo_chat_mobile/models/repositories/emoji_repository.dart';
import 'package:flutter/material.dart';
import '../models/emoji.dart';


class EmojiViewModel extends ChangeNotifier {

  List<Emoji> _emojisPeople = <Emoji>[];
  List<String> _unicodesPeople = <String>[];
  List<Emoji> _emojisNature = <Emoji>[];
  List<String> _unicodesNature = <String>[];
  List<Emoji> _emojisFood = <Emoji>[];
  List<String> _unicodesFood = <String>[];
  List<Emoji> _emojisTravel = <Emoji>[];
  List<String> _unicodesTravel = <String>[];
  List<Emoji> _emojisActivity = <Emoji>[];
  List<String> _unicodesActivity = <String>[];
  List<Emoji> _emojisObject = <Emoji>[];
  List<String> _unicodesObject = <String>[];
  List<Emoji> _emojisSymbol = <Emoji>[];
  List<String> _unicodesSymbol = <String>[];

  List<Emoji> get emojisPeople => _emojisPeople;
  List<String> get unicodesPeople => _unicodesPeople;
  List<Emoji> get emojisNature => _emojisNature;
  List<String> get unicodesNature => _unicodesNature;
  List<Emoji> get emojisFood => _emojisFood;
  List<String> get unicodesFood => _unicodesFood;
  List<Emoji> get emojisTravel => _emojisTravel;
  List<String> get unicodesTravel => _unicodesTravel;
  List<Emoji> get emojisActivity => _emojisActivity;
  List<String> get unicodesActivity => _unicodesActivity;
  List<Emoji> get emojisObject => _emojisObject;
  List<String> get unicodesObject => _unicodesObject;
  List<Emoji> get emojisSymbol => _emojisSymbol;
  List<String> get unicodesSymbol => _unicodesSymbol;

  EmojiViewModel() {
    getUnicodes();
  }

  void getEmojis() async {
    _emojisPeople = await EmojiRepositary().getEmojis('people');
    _emojisNature = await EmojiRepositary().getEmojis('nature');
    _emojisFood = await EmojiRepositary().getEmojis('food');
    _emojisTravel = await EmojiRepositary().getEmojis('travel');
    _emojisActivity = await EmojiRepositary().getEmojis('activity');
    _emojisObject = await EmojiRepositary().getEmojis('object');
    _emojisSymbol = await EmojiRepositary().getEmojis('symbol');
    notifyListeners();
  }

  void getUnicodes() async {
    getEmojis();
    _unicodesPeople = await EmojiRepositary().getUnicodes('people');
    _unicodesNature = await EmojiRepositary().getUnicodes('nature');
    _unicodesFood = await EmojiRepositary().getUnicodes('food');
    _unicodesTravel = await EmojiRepositary().getUnicodes('travel');
    _unicodesActivity = await EmojiRepositary().getUnicodes('activity');
    _unicodesObject = await EmojiRepositary().getUnicodes('object');
    _unicodesSymbol = await EmojiRepositary().getUnicodes('symbol');
    print("emoji view model line 62");
    print(_unicodesPeople.length);
    notifyListeners();
  }
}