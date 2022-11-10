// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountData _$$_CountDataFromJson(Map<String, dynamic> json) => _$_CountData(
      dateTime: DateTime.parse(json['dateTime'] as String),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_CountDataToJson(_$_CountData instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'count': instance.count,
    };
