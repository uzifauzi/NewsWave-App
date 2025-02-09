import 'package:json_annotation/json_annotation.dart';
import 'package:newswave_app/domain/entities/news.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey(name: "article_id")
  final String articleId;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  final String? title;
  final String? link;
  @JsonKey(name: "source_name")
  final String? sourceName;
  final DateTime? pubDate;
  final List<String>? category;

  NewsModel(
    this.articleId,
    this.imageUrl,
    this.title,
    this.link,
    this.sourceName,
    this.pubDate,
    this.category,
  );

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  News toEntity() {
    return News(
      articleId: articleId,
      imageUrl: imageUrl,
      title: title,
      link: link,
      sourceName: sourceName,
      pubDate: pubDate,
      category: category,
    );
  }
}
