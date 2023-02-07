import 'package:emo_chat_mobile/view_models/emoji_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmojiView extends StatefulWidget {

  @override
  State<EmojiView> createState() => _EmojiViewState();
}

class _EmojiViewState extends State<EmojiView> {
  //TabController? _tabController;
  List<String> _unicodesPeople = <String>[];

  @override
  void initState() {
    super.initState();
    _unicodesPeople = EmojiViewModel.unicodesPeople;
    print('line19');
    print(EmojiViewModel.emojisPeople.length);
  }

  @override
  Widget build(BuildContext context) {
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
                  for (int i = 0; i < EmojiViewModel.unicodesPeople.length; i++)
                    SizedBox(
                      child: TextButton(
                        onPressed: () {
                          print(EmojiViewModel.unicodesPeople[i]);
                        },
                        child: Text(
                          EmojiViewModel.unicodesPeople[i],
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
                  for (int i = 0; i < EmojiViewModel.unicodesNature.length; i++)
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          EmojiViewModel.unicodesNature[i],
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
                  for (int i = 0; i < EmojiViewModel.unicodesFood.length; i++)
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          EmojiViewModel.unicodesFood[i],
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
                  for (int i = 0; i < EmojiViewModel.unicodesTravel.length; i++)
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          EmojiViewModel.unicodesTravel[i],
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
                  for (int i = 0; i < EmojiViewModel.unicodesActivity.length; i++)
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          EmojiViewModel.unicodesActivity[i],
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
                  for (int i = 0; i < EmojiViewModel.unicodesObject.length; i++)
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          EmojiViewModel.unicodesObject[i],
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
                  for (int i = 0; i < EmojiViewModel.unicodesSymbol.length; i++)
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          EmojiViewModel.unicodesSymbol[i],
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
  }
}
