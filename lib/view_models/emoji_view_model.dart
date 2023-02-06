import 'package:emo_chat_mobile/models/emoji_caller.dart';
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
    //getEmojis();
    getUnicodes();
  }

  void getEmojis() async {
    _emojisPeople = await EmojiCaller().getEmojis('people');
    _emojisNature = await EmojiCaller().getEmojis('nature');
    _emojisFood = await EmojiCaller().getEmojis('food');
    _emojisTravel = await EmojiCaller().getEmojis('travel');
    _emojisActivity = await EmojiCaller().getEmojis('activity');
    _emojisObject = await EmojiCaller().getEmojis('object');
    _emojisSymbol = await EmojiCaller().getEmojis('symbol');
    notifyListeners();
  }

  void getUnicodes() async {
    getEmojis();
    _unicodesPeople = await EmojiCaller().getUnicodes('people');
    _unicodesNature = await EmojiCaller().getUnicodes('nature');
    _unicodesFood = await EmojiCaller().getUnicodes('food');
    _unicodesTravel = await EmojiCaller().getUnicodes('travel');
    _unicodesActivity = await EmojiCaller().getUnicodes('activity');
    _unicodesObject = await EmojiCaller().getUnicodes('object');
    _unicodesSymbol = await EmojiCaller().getUnicodes('symbol');
    notifyListeners();
  }
}