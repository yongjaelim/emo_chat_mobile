import 'dart:convert';

import 'emoji.dart';
import 'package:http/http.dart' as http;

class EmojiRepositary {

  Future<List<Emoji>> getEmojis(String category) async {
    Uri uri = Uri.parse('http://chatdev.fasoo.com:8090/api/emoji/$category');
    List<Emoji> emojis = [];

    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String jsonData = response.body;

      emojis = jsonDecode(jsonData).map<Emoji>((item) {
        return Emoji.fromJson(item);
      }).toList();
    } else {
      throw Exception('이모지 호출에 실패했습니다!');
    }
    return emojis;
  }

  Future<List<String>> getUnicodes(String category) async {
    Uri uri = Uri.parse('http://chatdev.fasoo.com:8090/api/emoji/$category');
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

      return unicodes.isNotEmpty ? unicodes : [];
    } else {
      throw Exception('이모지 호출에 실패했습니다!');
    }

  }
}