import 'package:emo_chat_mobile/ui/emoji/emoji_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class EmojiView extends StatelessWidget {
  //const EmojiView({Key? key}) : super(key: key);
  late EmojiViewModel emojiViewModel;

  @override
  Widget build(BuildContext context) {

    emojiViewModel = Provider.of<EmojiViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('emoji test'),
      ),
      body: GestureDetector(
        onTap: () {},
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 8,
          children: [
            for (int i = 0; i < emojiViewModel.unicodes.length; i++)
              SizedBox(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    emojiViewModel.unicodes[i],
                    style: GoogleFonts.notoColorEmoji(),
                  ),
                ),
              )
          ],
        ),
      )
    );
  }
}
