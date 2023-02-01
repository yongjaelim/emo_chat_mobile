import 'package:emo_chat_mobile/models/emoji_caller.dart';
import 'package:flutter/material.dart';

import '../../models/emoji.dart';

enum LoadingStatus { completed, searching, empty }

class EmojiViewModel extends ChangeNotifier {
  //초기에 로딩 데이터 없음
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<Emoji> emojis = <Emoji>[];

  void getEmojis() async {

    emojis = await EmojiCaller().getEmojis();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    //가져온 데이터가 비어있으면 빈 상태 아니면 성공 상태
    loadingStatus =
    emojis.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

}