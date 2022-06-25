// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map json) => News(
      user: UserNews.fromJson(json['user'] as Map),
      message: Message.fromJson(json['message'] as Map),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'user': instance.user,
      'message': instance.message,
    };
