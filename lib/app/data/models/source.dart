
import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Source {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'source_uuid')
  String? sourceUuid;
  @JsonKey(name: 'api_id')
  String? apiId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Source({this.id, this.sourceUuid, this.apiId, this.name, this.url,  this.createdAt, this.updatedAt});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
