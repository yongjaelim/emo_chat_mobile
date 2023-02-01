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
      print(jsonData);
      print('------------------------------');
      print(jsonDecode(jsonData)[0]['unicode']);
      emojis = jsonDecode(jsonData).map<Emoji>( (item) {
        return Emoji.fromJson(item);
      }).toList();
    }

    print('line22');
    print(emojis);
    print(emojis[0].unicode);

    return emojis;
  }
}