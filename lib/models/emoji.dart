class Emoji {
  late final int emojiId;
  late final String keyword;
  late final String koKeyword;
  late final String unicode;
  late final String category;

  Emoji({required this.emojiId, required this.keyword, required this.koKeyword, required this.unicode,
      required this.category});

  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(emojiId: json['emojiId'],
      keyword: json['keyword'],
      koKeyword: json['koKeyword'],
      unicode: json['unicode'],
      category: json['category'],);
  }

}