// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      json['article_id'] as String,
      json['image_url'] as String?,
      json['title'] as String?,
      json['link'] as String?,
      json['source_name'] as String?,
      json['pubDate'] == null
          ? null
          : DateTime.parse(json['pubDate'] as String),
      (json['category'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'article_id': instance.articleId,
      'image_url': instance.imageUrl,
      'title': instance.title,
      'link': instance.link,
      'source_name': instance.sourceName,
      'pubDate': instance.pubDate?.toIso8601String(),
      'category': instance.category,
    };
