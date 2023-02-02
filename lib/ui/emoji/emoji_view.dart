import 'package:emo_chat_mobile/ui/emoji/emoji_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class EmojiView extends StatefulWidget {
  const EmojiView({Key? key}) : super(key: key);

  @override
  State<EmojiView> createState() => _EmojiViewState();
}

class _EmojiViewState extends State<EmojiView> {
  @override
  void initState() {
    super.initState();
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
          return GridView.builder(
            itemCount: emojiViewModel.unicodes.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(emojiViewModel.unicodes[index], style: GoogleFonts.notoColorEmoji()),
                  Text(emojiViewModel.emojis[index].category),
                  Text(emojiViewModel.emojis[index].keyword),
                  Text(emojiViewModel.emojis[index].emojiId.toString()),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
