import 'package:json_annotation/json_annotation.dart';

part 'category_list.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CategoryItems {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  List<CategoryItem>? categoryItem;

  CategoryItems({this.success, this.message, this.categoryItem});

   factory CategoryItems.fromJson(Map<String, dynamic> json) => _$CategoryItemsFromJson(json);

   Map<String, dynamic> toJson() => _$CategoryItemsToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class CategoryItem {
  @JsonKey(name: 'name')
  String? categoryName;
  @JsonKey(name: 'slug')
  String? categorySlug;
  @JsonKey(name: 'category_uuid')
  String? categoryUuid;

  CategoryItem({this.categoryName, this.categorySlug, this.categoryUuid});

   factory CategoryItem.fromJson(Map<String, dynamic> json) => _$CategoryItemFromJson(json);

   Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}

