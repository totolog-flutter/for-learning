// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Register _$$_RegisterFromJson(Map<String, dynamic> json) => _$_Register(
      selectedDay: DateTime.parse(json['selectedDay'] as String),
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_RegisterToJson(_$_Register instance) =>
    <String, dynamic>{
      'selectedDay': instance.selectedDay.toIso8601String(),
      'title': instance.title,
      'content': instance.content,
    };
