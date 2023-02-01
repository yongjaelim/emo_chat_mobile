import 'package:emo_chat_mobile/models/emoji_caller.dart';
import 'package:emo_chat_mobile/ui/emoji/emoji_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/emoji.dart';

class EmojiView extends StatefulWidget {
  const EmojiView({Key? key}) : super(key: key);

  @override
  State<EmojiView> createState() => _EmojiViewState();
}

class _EmojiViewState extends State<EmojiView> {
  List<Emoji> emojis = [];
  EmojiCaller emojiCollector = EmojiCaller();

  @override
  void initState() {
    super.initState();
    Provider.of<EmojiViewModel>(context, listen: false).getEmojis();
  }

  Future getEmojis() async {
    emojis = await emojiCollector.getEmojis();
  }

  @override
  Widget build(BuildContext context) {
    var emojiViewModel = Provider.of<EmojiViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('emoji test'),
      ),
      body: GridView.builder(
        itemCount: emojiViewModel.emojis.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          String unicode = emojiViewModel.emojis[index].unicode;
          //String emojiFontApplied = '\u{$unicode}';
          return const Text('\u{1F603}');
        },
      ),
    );
  }
}
