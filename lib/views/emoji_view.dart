import 'package:emo_chat_mobile/view_models/emoji_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmojiView extends StatelessWidget {
  const EmojiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmojiViewModel>(
      builder: (context, emojiViewModel, child) {
        return DefaultTabController(
          length: 7,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  emojiCategoryMenu('\u{1F600}'),
                  emojiCategoryMenu('\u{1F331}'),
                  emojiCategoryMenu('\u{1F355}'),
                  emojiCategoryMenu('\u{26BD}'),
                  emojiCategoryMenu('\u{1F451}'),
                  emojiCategoryMenu('\u{2705}'),
                  emojiCategoryMenu('\u{2708}')
                ],
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: [
                emojiCategory(emojiViewModel.unicodesPeople),
                emojiCategory(emojiViewModel.unicodesNature),
                emojiCategory(emojiViewModel.unicodesFood),
                emojiCategory(emojiViewModel.unicodesActivity),
                emojiCategory(emojiViewModel.unicodesObject),
                emojiCategory(emojiViewModel.unicodesSymbol),
                emojiCategory(emojiViewModel.unicodesTravel)
              ],
            ),
          ),
        );
      }
    );
  }

  Widget emojiCategoryMenu(String unicode) {
    return Text(
      unicode,
      style: const TextStyle(
        //fontFamily: 'NotoEmoji'
      ),
    );
  }

  Widget emojiCategory(List<String> emojiList) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
          childAspectRatio: 1/1
      ),
      itemCount: emojiList.length,
      shrinkWrap: false,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: TextButton(
            onPressed: (){},
            child: Text(
              emojiList[index],
              style: const TextStyle(
                  //fontFamily: 'NotoColorEmoji',
                  fontSize: 25
              ),
            ),
          ),
        );
      },
    );
  }
}
