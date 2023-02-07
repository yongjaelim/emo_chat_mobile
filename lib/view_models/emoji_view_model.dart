import 'package:emo_chat_mobile/models/emoji_repository.dart';
import 'package:flutter/material.dart';
import '../models/emoji.dart';


class EmojiViewModel extends ChangeNotifier {

  static List<Emoji> _emojisPeople = <Emoji>[];
  static List<String> _unicodesPeople = <String>[];
  static List<Emoji> _emojisNature = <Emoji>[];
  static List<String> _unicodesNature = <String>[];
  static List<Emoji> _emojisFood = <Emoji>[];
  static List<String> _unicodesFood = <String>[];
  static List<Emoji> _emojisTravel = <Emoji>[];
  static List<String> _unicodesTravel = <String>[];
  static List<Emoji> _emojisActivity = <Emoji>[];
  static List<String> _unicodesActivity = <String>[];
  static List<Emoji> _emojisObject = <Emoji>[];
  static List<String> _unicodesObject = <String>[];
  static List<Emoji> _emojisSymbol = <Emoji>[];
  static List<String> _unicodesSymbol = <String>[];

  static List<Emoji> get emojisPeople => _emojisPeople;
  static List<String> get unicodesPeople => _unicodesPeople;
  static List<Emoji> get emojisNature => _emojisNature;
  static List<String> get unicodesNature => _unicodesNature;
  static List<Emoji> get emojisFood => _emojisFood;
  static List<String> get unicodesFood => _unicodesFood;
  static List<Emoji> get emojisTravel => _emojisTravel;
  static List<String> get unicodesTravel => _unicodesTravel;
  static List<Emoji> get emojisActivity => _emojisActivity;
  static List<String> get unicodesActivity => _unicodesActivity;
  static List<Emoji> get emojisObject => _emojisObject;
  static List<String> get unicodesObject => _unicodesObject;
  static List<Emoji> get emojisSymbol => _emojisSymbol;
  static List<String> get unicodesSymbol => _unicodesSymbol;

  EmojiViewModel() {
    //getEmojis();
    getUnicodes();
  }

  static void getEmojis() async {
    _emojisPeople = await EmojiRepositary().getEmojis('people');
    _emojisNature = await EmojiRepositary().getEmojis('nature');
    _emojisFood = await EmojiRepositary().getEmojis('food');
    _emojisTravel = await EmojiRepositary().getEmojis('travel');
    _emojisActivity = await EmojiRepositary().getEmojis('activity');
    _emojisObject = await EmojiRepositary().getEmojis('object');
    _emojisSymbol = await EmojiRepositary().getEmojis('symbol');
  }

  static void getUnicodes() async {
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
  }
}