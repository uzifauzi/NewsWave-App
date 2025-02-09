import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String articleId;
  final String? imageUrl;
  final String? title;
  final String? link;
  final String? sourceName;
  final DateTime? pubDate;
  final List<String>? category;

  const News({
    required this.articleId,
    this.imageUrl,
    this.title,
    this.link,
    this.sourceName,
    this.pubDate,
    this.category,
  });

  @override
  List<Object?> get props =>
      [articleId, imageUrl, title, link, sourceName, pubDate, category];
}
