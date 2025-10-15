import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Author {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'author_uuid')
  String? authorUuid;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Author({this.id, this.authorUuid, this.name, this.createdAt, this.updatedAt});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
