import 'package:json_annotation/json_annotation.dart';

part 'my_news_entity.g.dart';

@JsonSerializable(anyMap: true)
class MyNews {
  int id;
  String content;

  MyNews({required this.id, required this.content});

  factory MyNews.fromJson(Map json) => _$MyNewsFromJson(json);
  Map<String, dynamic> toJson() => _$MyNewsToJson(this);
}
