// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
  id: (json['id'] as num?)?.toInt(),
  sourceUuid: json['source_uuid'] as String?,
  apiId: json['api_id'] as String?,
  name: json['name'] as String?,
  url: json['url'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
  'id': instance.id,
  'source_uuid': instance.sourceUuid,
  'api_id': instance.apiId,
  'name': instance.name,
  'url': instance.url,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
