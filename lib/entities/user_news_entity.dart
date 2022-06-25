import 'package:json_annotation/json_annotation.dart';

part 'user_news_entity.g.dart';

@JsonSerializable(anyMap: true)
class UserNews {
  
  String name;

  @JsonKey(name: 'profile_picture')
  String profilePicture;

  UserNews({required this.name, required this.profilePicture});

  factory UserNews.fromJson(Map json) => _$UserNewsFromJson(json);
  Map<String, dynamic> toJson() => _$UserNewsToJson(this);
}
