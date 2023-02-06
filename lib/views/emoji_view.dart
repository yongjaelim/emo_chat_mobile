import 'package:emo_chat_mobile/view_models/emoji_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class EmojiView extends StatefulWidget {

  @override
  State<EmojiView> createState() => _EmojiViewState();
}

class _EmojiViewState extends State<EmojiView> {
  //TabController? _tabController;
  late EmojiViewModel emojiViewModel;
  List<String> _unicodesPeople = <String>[];

  @override
  void initState() {
    super.initState();
    emojiViewModel = EmojiViewModel();
    //emojiViewModel = Provider.of<EmojiViewModel>(context);
    emojiViewModel.getEmojis();
    _unicodesPeople = emojiViewModel.unicodesPeople;
    print('line19');
    print(_unicodesPeople.length);
  }

  @override
  Widget build(BuildContext context) {
    emojiViewModel = Provider.of<EmojiViewModel>(context);
    return Consumer<EmojiViewModel>(
      builder: (context, provider, child) {
        if (provider.emojisActivity != null && provider.emojisActivity.length > 0) {
          return DefaultTabController(
            length: 7,
            child: Scaffold(
              appBar: AppBar(
                //title: Text(),
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
                      '\u{2708}',
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
                  ],
                  isScrollable: true,

                ),
              ),
              body: TabBarView(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 8,
                      children: [
                        for (int i = 0; i < emojiViewModel.unicodesPeople.length; i++)
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                emojiViewModel.unicodesPeople[i],
                                style: GoogleFonts.notoColorEmoji(),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 8,
                      children: [
                        for (int i = 0; i < emojiViewModel.unicodesNature.length; i++)
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                emojiViewModel.unicodesNature[i],
                                style: GoogleFonts.notoColorEmoji(),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 8,
                      children: [
                        for (int i = 0; i < emojiViewModel.unicodesFood.length; i++)
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                emojiViewModel.unicodesFood[i],
                                style: GoogleFonts.notoColorEmoji(),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 8,
                      children: [
                        for (int i = 0; i < emojiViewModel.unicodesTravel.length; i++)
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                emojiViewModel.unicodesTravel[i],
                                style: GoogleFonts.notoColorEmoji(),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 8,
                      children: [
                        for (int i = 0; i < emojiViewModel.unicodesActivity.length; i++)
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                emojiViewModel.unicodesActivity[i],
                                style: GoogleFonts.notoColorEmoji(),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 8,
                      children: [
                        for (int i = 0; i < emojiViewModel.unicodesObject.length; i++)
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                emojiViewModel.unicodesObject[i],
                                style: GoogleFonts.notoColorEmoji(),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 8,
                      children: [
                        for (int i = 0; i < emojiViewModel.unicodesSymbol.length; i++)
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                emojiViewModel.unicodesSymbol[i],
                                style: GoogleFonts.notoColorEmoji(),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
