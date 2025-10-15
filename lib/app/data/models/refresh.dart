import 'package:json_annotation/json_annotation.dart'; 

part 'refresh.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Refresh {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  Data? data;

  Refresh({this.success, this.message, this.data});

   factory Refresh.fromJson(Map<String, dynamic> json) => _$RefreshFromJson(json);

   Map<String, dynamic> toJson() => _$RefreshToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Data {
  @JsonKey(name: 'details')
  String? details;

  Data({this.details});

   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

   Map<String, dynamic> toJson() => _$DataToJson(this);
}

