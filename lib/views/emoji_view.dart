import 'package:emo_chat_mobile/models/emoji.dart';
import 'package:emo_chat_mobile/view_models/emoji_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  Text(
                    '\u{1F600}',
                    style: GoogleFonts.notoEmoji(),
                  ),
                  Text(
                    '\u{1F331}',
                    style: GoogleFonts.notoEmoji(),
                  ),
                  Text(
                    '\u{1F355}',
                    style: GoogleFonts.notoEmoji(),
                  ),
                  Text(
                    '\u{26BD}',
                    style: GoogleFonts.notoEmoji(),
                  ),
                  Text(
                    '\u{1F451}',
                    style: GoogleFonts.notoEmoji(),
                  ),
                  Text(
                    '\u{2705}',
                    style: GoogleFonts.notoEmoji(),
                  ),
                  Text(
                    '\u{2708}',
                    style: GoogleFonts.notoEmoji(),
                  ),
                ],
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1/1
                  ),
                  itemCount: emojiViewModel.unicodesPeople.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: TextButton(
                        onPressed: (){
                          print(emojiViewModel.unicodesPeople[index]);
                        },
                        child: Text(
                          emojiViewModel.unicodesPeople[index],
                          style: const TextStyle(
                              fontFamily: 'NotoColorEmoji',
                              fontSize: 25
                          ),
                          // style: GoogleFonts.notoColorEmoji(
                          //     textStyle: const TextStyle(
                          //         fontSize: 25
                          //     )
                          // ),
                        ),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1/1
                  ),
                  itemCount: emojiViewModel.unicodesNature.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                          emojiViewModel.unicodesNature[index],
                          style: const TextStyle(
                              fontFamily: 'NotoColorEmoji',
                              fontSize: 25
                          ),
                          // style: GoogleFonts.notoColorEmoji(
                          //     textStyle: const TextStyle(
                          //         fontSize: 25
                          //     )
                          // ),
                        ),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1/1
                  ),
                  itemCount: emojiViewModel.unicodesFood.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                          emojiViewModel.unicodesFood[index],
                          style: const TextStyle(
                              fontFamily: 'NotoColorEmoji',
                              fontSize: 25
                          ),
                          // style: GoogleFonts.notoColorEmoji(
                          //     textStyle: const TextStyle(
                          //         fontSize: 25
                          //     )
                          // ),
                        ),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1/1
                  ),
                  itemCount: emojiViewModel.unicodesActivity.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                          emojiViewModel.unicodesActivity[index],
                          style: const TextStyle(
                              fontFamily: 'NotoColorEmoji',
                              fontSize: 25
                          ),
                          // style: GoogleFonts.notoColorEmoji(
                          //     textStyle: const TextStyle(
                          //         fontSize: 25
                          //     )
                          // ),
                        ),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1/1
                  ),
                  itemCount: emojiViewModel.unicodesObject.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                          emojiViewModel.unicodesObject[index],
                          style: const TextStyle(
                              fontFamily: 'NotoColorEmoji',
                              fontSize: 25
                          ),
                          // style: GoogleFonts.notoColorEmoji(
                          //     textStyle: const TextStyle(
                          //         fontSize: 25
                          //     )
                          // ),
                        ),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1/1
                  ),
                  itemCount: emojiViewModel.unicodesSymbol.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                          emojiViewModel.unicodesSymbol[index],
                          style: const TextStyle(
                              fontFamily: 'NotoColorEmoji',
                              fontSize: 25
                          ),
                          // style: GoogleFonts.notoColorEmoji(
                          //     textStyle: const TextStyle(
                          //         fontSize: 25
                          //     )
                          // ),
                        ),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1/1
                  ),
                  itemCount: emojiViewModel.unicodesTravel.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                          emojiViewModel.unicodesTravel[index],
                          style: const TextStyle(
                              fontFamily: 'NotoColorEmoji',
                              fontSize: 25
                          ),
                          // style: GoogleFonts.notoColorEmoji(
                          //     textStyle: const TextStyle(
                          //         fontSize: 25
                          //     )
                          // ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
