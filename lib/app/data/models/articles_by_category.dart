import 'package:json_annotation/json_annotation.dart';
import 'article.dart';

part 'articles_by_category.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ArticlesByCategory {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'count')
  int? count;
  @JsonKey(name: 'data')
  List<Article>? article;
  @JsonKey(name: 'meta')
  Meta? meta;

  ArticlesByCategory({this.success, this.category, this.count, this.article, this.meta});

   factory ArticlesByCategory.fromJson(Map<String, dynamic> json) => _$ArticlesByCategoryFromJson(json);

   Map<String, dynamic> toJson() => _$ArticlesByCategoryToJson(this);
}







