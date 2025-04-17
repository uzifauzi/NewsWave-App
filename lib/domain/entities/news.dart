import 'package:equatable/equatable.dart';

class News extends Equatable {
  String articleId;
  String? imageUrl;
  String? title;
  String? link;
  String? sourceName;
  DateTime? pubDate;
  List<String>? category;

  News({
    required this.articleId,
    this.imageUrl,
    this.title,
    this.link,
    this.sourceName,
    this.pubDate,
    this.category,
  });

  News.bookmark({
    required this.articleId,
    required this.imageUrl,
    required this.title,
    required this.category,
  });

  @override
  List<Object?> get props =>
      [articleId, imageUrl, title, link, sourceName, pubDate, category];
}
