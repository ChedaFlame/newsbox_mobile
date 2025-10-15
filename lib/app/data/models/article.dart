import 'package:json_annotation/json_annotation.dart';
import 'author.dart';
import 'category.dart';
import 'source.dart';

part 'article.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Article {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'article_uuid')
  String? articleUuid;
  @JsonKey(name: 'category_uuid')
  String? categoryUuid;
  @JsonKey(name: 'source_uuid')
  String? sourceUuid;
  @JsonKey(name: 'author_uuid')
  String? authorUuid;
  @JsonKey(name: 'headline')
  String? headline;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'content')
  String? content;
  @JsonKey(name: 'article_url')
  String? articleUrl;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'published_at')
  String? publishedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'category')
  Category? category;
  @JsonKey(name: 'author')
  Author? author;
  @JsonKey(name: 'source')
  Source? source;

  Article({this.id, this.articleUuid, this.categoryUuid, this.sourceUuid, this.authorUuid, this.headline,
    this.description, this.content, this.articleUrl, this.imageUrl, this.publishedAt, this.createdAt,
    this.updatedAt, this.category, this.author, this.source});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Meta {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'last_page')
  int? lastPage;

  Meta({this.currentPage, this.total, this.lastPage});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}