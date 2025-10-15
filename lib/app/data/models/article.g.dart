// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
  id: (json['id'] as num?)?.toInt(),
  articleUuid: json['article_uuid'] as String?,
  categoryUuid: json['category_uuid'] as String?,
  sourceUuid: json['source_uuid'] as String?,
  authorUuid: json['author_uuid'] as String?,
  headline: json['headline'] as String?,
  description: json['description'] as String?,
  content: json['content'] as String?,
  articleUrl: json['article_url'] as String?,
  imageUrl: json['image_url'] as String?,
  publishedAt: json['published_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  author: json['author'] == null
      ? null
      : Author.fromJson(json['author'] as Map<String, dynamic>),
  source: json['source'] == null
      ? null
      : Source.fromJson(json['source'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
  'id': instance.id,
  'article_uuid': instance.articleUuid,
  'category_uuid': instance.categoryUuid,
  'source_uuid': instance.sourceUuid,
  'author_uuid': instance.authorUuid,
  'headline': instance.headline,
  'description': instance.description,
  'content': instance.content,
  'article_url': instance.articleUrl,
  'image_url': instance.imageUrl,
  'published_at': instance.publishedAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'category': instance.category,
  'author': instance.author,
  'source': instance.source,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  currentPage: (json['current_page'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'total': instance.total,
  'last_page': instance.lastPage,
};
