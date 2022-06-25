import 'package:blog/entities/message_news_entity.dart';
import 'package:blog/entities/user_news_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_entity.g.dart';

@JsonSerializable(anyMap: true)
class News {
  UserNews user;
  Message message;

  News({required this.user, required this.message});

  factory News.fromJson(Map json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
