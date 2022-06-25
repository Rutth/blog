// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map json) => Message(
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'content': instance.content,
      'created_at': instance.createdAt,
    };
