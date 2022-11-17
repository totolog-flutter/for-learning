import 'package:flutter_youtube1/src/features/sample/data/register_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sample_page_data.freezed.dart';
part 'sample_page_data.g.dart';

@freezed
class SamplePageData with _$SamplePageData {
  factory SamplePageData({
    @Default(0) int number,
    List<Register>? recordList,
  }) = _SamplePageData;

  factory SamplePageData.fromJson(Map<String, dynamic> json) =>
      _$SamplePageDataFromJson(json);
}
