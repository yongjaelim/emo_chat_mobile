import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/emoji.dart';
import '../../models/emoji_caller.dart';
import 'emoji_view_model.dart';

class EmojiKeyboard extends StatefulWidget {
  const EmojiKeyboard({Key? key}) : super(key: key);

  @override
  State<EmojiKeyboard> createState() => _EmojiKeyboardState();
}

class _EmojiKeyboardState extends State<EmojiKeyboard> {
  List<Emoji> emojis = [];
  EmojiCaller emojiCollector = EmojiCaller();
  List<String> tempUnc = <String>['\u{1F937}'];

  @override
  void initState() {
    super.initState();
    Provider.of<EmojiViewModel>(context, listen: false).getEmojis();
    print(tempUnc.length.toString());
  }

  Future getEmojis() async {
    emojis = await emojiCollector.getEmojis();
    tempUnc = emojis.map<String>((emoji) {
      String unicode = emoji.unicode;
      List<String> unicodeModifierList = unicode.split(' ');
      String temp = '';
      for (int i = 0; i < unicodeModifierList.length; i++) {
        int hexUnicode = int.parse(unicodeModifierList[i], radix: 16);
        temp += String.fromCharCode(hexUnicode);
      }
      return temp;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('emoji test'),
      ),
      body: Consumer<EmojiViewModel>(
        builder: (context, emojiViewModel, child) {
          emojiViewModel.getUnicodes();
          return Container(
            height: 160,
            child: Text('Test')
          );
        },
      ),
    );
  }
}

class EmojiKeyboardKey extends StatelessWidget {
  final String emoji;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const EmojiKeyboardKey({
    Key? key,
    required this.emoji,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: value,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              onTap?.call(emoji);
            },
            child: Container(
              child: Center(child: Text(emoji)),
            ),
          ),
        ),
      ),
    );
  }
}
