import 'package:json_annotation/json_annotation.dart';

part 'message_news_entity.g.dart';

@JsonSerializable(anyMap: true)
class Message {
  String content;

  @JsonKey(name: 'created_at')
  String createdAt;

  Message({required this.content, required this.createdAt});

  factory Message.fromJson(Map json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
