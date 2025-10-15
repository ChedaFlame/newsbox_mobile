// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: (json['id'] as num?)?.toInt(),
  categoryUuid: json['category_uuid'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'category_uuid': instance.categoryUuid,
  'name': instance.name,
  'slug': instance.slug,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
