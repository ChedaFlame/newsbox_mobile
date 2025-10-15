import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Category {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'category_uuid')
  String? categoryUuid;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'slug')
  String? slug;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Category({this.id, this.categoryUuid, this.name, this.slug, this.createdAt, this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
