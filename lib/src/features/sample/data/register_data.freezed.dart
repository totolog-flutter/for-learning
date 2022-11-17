// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return _Register.fromJson(json);
}

/// @nodoc
mixin _$Register {
  DateTime get selectedDay => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterCopyWith<Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res, Register>;
  @useResult
  $Res call({DateTime selectedDay, String title, String content});
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res, $Val extends Register>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterCopyWith<$Res> implements $RegisterCopyWith<$Res> {
  factory _$$_RegisterCopyWith(
          _$_Register value, $Res Function(_$_Register) then) =
      __$$_RegisterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime selectedDay, String title, String content});
}

/// @nodoc
class __$$_RegisterCopyWithImpl<$Res>
    extends _$RegisterCopyWithImpl<$Res, _$_Register>
    implements _$$_RegisterCopyWith<$Res> {
  __$$_RegisterCopyWithImpl(
      _$_Register _value, $Res Function(_$_Register) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$_Register(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Register with DiagnosticableTreeMixin implements _Register {
  _$_Register(
      {required this.selectedDay, required this.title, required this.content});

  factory _$_Register.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterFromJson(json);

  @override
  final DateTime selectedDay;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Register(selectedDay: $selectedDay, title: $title, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Register'))
      ..add(DiagnosticsProperty('selectedDay', selectedDay))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Register &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedDay, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      __$$_RegisterCopyWithImpl<_$_Register>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterToJson(
      this,
    );
  }
}

abstract class _Register implements Register {
  factory _Register(
      {required final DateTime selectedDay,
      required final String title,
      required final String content}) = _$_Register;

  factory _Register.fromJson(Map<String, dynamic> json) = _$_Register.fromJson;

  @override
  DateTime get selectedDay;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      throw _privateConstructorUsedError;
}
