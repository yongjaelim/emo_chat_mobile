import 'dart:convert';

import 'emoji.dart';
import 'package:http/http.dart' as http;

class EmojiCaller {
  Uri uri = Uri.parse('http://chatdev.fasoo.com:8090/api/emoji/people');

  Future<List<Emoji>> getEmojis() async {
    List<Emoji> emojis = [];

    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String jsonData = response.body;

      emojis = jsonDecode(jsonData).map<Emoji>((item) {
        return Emoji.fromJson(item);
      }).toList();
    }

    return emojis;
  }

  Future<List<String>> getUnicodes() async {
    List<String> unicodes = [];
    List<Emoji> emojis = [];

    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      emojis = await jsonDecode(jsonData).map<Emoji>((item) {
        return Emoji.fromJson(item);
      }).toList();

      unicodes = emojis.map<String>((emoji) {
        String emojiUnicode = emoji.unicode;
        List<String> unicodeModifierList = emojiUnicode.split(' ');
        String finedUnicode = '';
        for (int i = 0; i < unicodeModifierList.length; i++) {
          int hexUnicode = int.parse(unicodeModifierList[i], radix: 16);
          finedUnicode += String.fromCharCode(hexUnicode);
        }
        return finedUnicode;
      }).toList();
    }

    return unicodes.isNotEmpty ? unicodes : [];
  }
}