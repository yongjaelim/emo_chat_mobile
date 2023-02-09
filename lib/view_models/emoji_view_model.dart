import 'package:emo_chat_mobile/models/repositories/emoji_repository.dart';
import 'package:flutter/material.dart';
import '../models/emoji.dart';


class EmojiViewModel extends ChangeNotifier {

  late EmojiRepositary _emojiRepositary;

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
    _emojiRepositary = EmojiRepositary();
    getUnicodes();
  }

  void getEmojis() async {
    _emojisPeople = await _emojiRepositary.getEmojis('people');
    _emojisNature = await _emojiRepositary.getEmojis('nature');
    _emojisFood = await _emojiRepositary.getEmojis('food');
    _emojisTravel = await _emojiRepositary.getEmojis('travel');
    _emojisActivity = await _emojiRepositary.getEmojis('activity');
    _emojisObject = await _emojiRepositary.getEmojis('object');
    _emojisSymbol = await _emojiRepositary.getEmojis('symbol');
    notifyListeners();
  }

  void getUnicodes() async {
    getEmojis();
    _unicodesPeople = await _emojiRepositary.getUnicodes('people');
    _unicodesNature = await _emojiRepositary.getUnicodes('nature');
    _unicodesFood = await _emojiRepositary.getUnicodes('food');
    _unicodesTravel = await _emojiRepositary.getUnicodes('travel');
    _unicodesActivity = await _emojiRepositary.getUnicodes('activity');
    _unicodesObject = await _emojiRepositary.getUnicodes('object');
    _unicodesSymbol = await _emojiRepositary.getUnicodes('symbol');
    print("emoji view model line 62");
    print(_unicodesPeople.length);
    notifyListeners();
  }
}