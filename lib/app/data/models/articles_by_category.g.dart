// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_by_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesByCategory _$ArticlesByCategoryFromJson(Map<String, dynamic> json) =>
    ArticlesByCategory(
      success: json['success'] as bool?,
      category: json['category'] as String?,
      count: (json['count'] as num?)?.toInt(),
      article: (json['data'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticlesByCategoryToJson(ArticlesByCategory instance) =>
    <String, dynamic>{
      'success': instance.success,
      'category': instance.category,
      'count': instance.count,
      'data': instance.article,
      'meta': instance.meta,
    };
