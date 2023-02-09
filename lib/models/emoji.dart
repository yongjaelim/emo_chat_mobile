class Emoji {
  final int emojiId;
  final String keyword;
  final String koKeyword;
  final String unicode;
  final String category;

  Emoji({
    required this.emojiId,
    required this.keyword,
    required this.koKeyword,
    required this.unicode,
    required this.category,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(
      emojiId: json['emojiId'],
      keyword: json['keyword'],
      koKeyword: json['koKeyword'],
      unicode: json['unicode'],
      category: json['category'],
    );
  }
}
