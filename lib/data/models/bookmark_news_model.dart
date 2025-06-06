import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:newswave_app/domain/entities/news.dart';

class BookmarkNewsModel extends Equatable {
  final int? id; // Primary Key di SQLite
  final String articleId;
  final String? title;
  final String? link;
  final String? imageUrl;
  final String? sourceName;
  final String? pubDate;
  final List<String>? category;

  const BookmarkNewsModel({
    this.id,
    required this.articleId,
    this.title,
    this.link,
    this.imageUrl,
    this.sourceName,
    this.pubDate,
    this.category,
  });

  factory BookmarkNewsModel.fromMap(Map<String, dynamic> map) {
    return BookmarkNewsModel(
      id: map['id'],
      articleId: map['article_id'],
      title: map['title'],
      link: map['link'],
      imageUrl: map['image_url'],
      sourceName: map['source_name'],
      pubDate: map['pub_date'],
      category: (map['category'] != null && map['category'].isNotEmpty)
          ? List<String>.from(jsonDecode(map['category']))
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'article_id': articleId,
      'title': title,
      'link': link,
      'image_url': imageUrl,
      'source_name': sourceName,
      'pub_date': pubDate,
      'category': category != null ? jsonEncode(category) : jsonEncode([]),
    };
  }

  factory BookmarkNewsModel.fromJson(Map<String, dynamic> json) {
    return BookmarkNewsModel(
      id: json['id'],
      articleId: json['article_id'],
      title: json['title'],
      link: json['link'],
      imageUrl: json['image_url'],
      sourceName: json['source_name'],
      pubDate: json['pub_date'],
      category:
          json['category'] != null ? List<String>.from(json['category']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'article_id': articleId,
      'title': title,
      'link': link,
      'image_url': imageUrl,
      'source_name': sourceName,
      'pub_date': pubDate,
      'category': category,
    };
  }

  News toEntity() => News.bookmark(
        articleId: articleId,
        imageUrl: imageUrl,
        title: title,
        category: category,
      );

  @override
  List<Object?> get props =>
      [id, articleId, title, link, imageUrl, sourceName, pubDate, category];
}
