// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
  success: json['success'] as bool?,
  count: (json['count'] as num?)?.toInt(),
  article: (json['data'] as List<dynamic>?)
      ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
  'success': instance.success,
  'count': instance.count,
  'data': instance.article,
  'meta': instance.meta,
};
