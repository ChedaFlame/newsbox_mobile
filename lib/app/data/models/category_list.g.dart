// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItems _$CategoryItemsFromJson(Map<String, dynamic> json) =>
    CategoryItems(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      categoryItem: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryItemsToJson(CategoryItems instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.categoryItem,
    };

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
  categoryName: json['name'] as String?,
  categorySlug: json['slug'] as String?,
  categoryUuid: json['category_uuid'] as String?,
);

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'name': instance.categoryName,
      'slug': instance.categorySlug,
      'category_uuid': instance.categoryUuid,
    };
