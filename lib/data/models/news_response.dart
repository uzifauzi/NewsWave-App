import 'package:json_annotation/json_annotation.dart';
import 'package:newswave_app/data/models/news_model.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  final String? status;
  final int? totalResults;
  final List<NewsModel> results;
  final String? nextPage;

  NewsResponse(
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  );

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
