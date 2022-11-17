// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_page_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SamplePageData _$$_SamplePageDataFromJson(Map<String, dynamic> json) =>
    _$_SamplePageData(
      number: json['number'] as int? ?? 0,
      recordList: (json['recordList'] as List<dynamic>?)
          ?.map((e) => Register.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SamplePageDataToJson(_$_SamplePageData instance) =>
    <String, dynamic>{
      'number': instance.number,
      'recordList': instance.recordList,
    };
