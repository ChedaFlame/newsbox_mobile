// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refresh _$RefreshFromJson(Map<String, dynamic> json) => Refresh(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RefreshToJson(Refresh instance) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) =>
    Data(details: json['details'] as String?);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'details': instance.details,
};
