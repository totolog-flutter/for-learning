import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'register_data.freezed.dart';
part 'register_data.g.dart';

@freezed
class Register with _$Register {
  factory Register({
    required DateTime selectedDay,
    required String title,
    required String content,
  }) = _Register;

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);
}
