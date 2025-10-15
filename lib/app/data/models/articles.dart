import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'articles.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Articles {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'count')
  int? count;
  @JsonKey(name: 'data')
  List<Article>? article;
  @JsonKey(name: 'meta')
  Meta? meta;

  Articles({this.success, this.count, this.article, this.meta});

   factory Articles.fromJson(Map<String, dynamic> json) => _$ArticlesFromJson(json);

   Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}



