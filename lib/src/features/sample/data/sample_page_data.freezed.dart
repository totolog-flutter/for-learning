// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sample_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SamplePageData _$SamplePageDataFromJson(Map<String, dynamic> json) {
  return _SamplePageData.fromJson(json);
}

/// @nodoc
mixin _$SamplePageData {
  int get number => throw _privateConstructorUsedError;
  List<Register>? get recordList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SamplePageDataCopyWith<SamplePageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SamplePageDataCopyWith<$Res> {
  factory $SamplePageDataCopyWith(
          SamplePageData value, $Res Function(SamplePageData) then) =
      _$SamplePageDataCopyWithImpl<$Res, SamplePageData>;
  @useResult
  $Res call({int number, List<Register>? recordList});
}

/// @nodoc
class _$SamplePageDataCopyWithImpl<$Res, $Val extends SamplePageData>
    implements $SamplePageDataCopyWith<$Res> {
  _$SamplePageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? recordList = freezed,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      recordList: freezed == recordList
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Register>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SamplePageDataCopyWith<$Res>
    implements $SamplePageDataCopyWith<$Res> {
  factory _$$_SamplePageDataCopyWith(
          _$_SamplePageData value, $Res Function(_$_SamplePageData) then) =
      __$$_SamplePageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, List<Register>? recordList});
}

/// @nodoc
class __$$_SamplePageDataCopyWithImpl<$Res>
    extends _$SamplePageDataCopyWithImpl<$Res, _$_SamplePageData>
    implements _$$_SamplePageDataCopyWith<$Res> {
  __$$_SamplePageDataCopyWithImpl(
      _$_SamplePageData _value, $Res Function(_$_SamplePageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? recordList = freezed,
  }) {
    return _then(_$_SamplePageData(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      recordList: freezed == recordList
          ? _value._recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Register>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SamplePageData
    with DiagnosticableTreeMixin
    implements _SamplePageData {
  _$_SamplePageData({this.number = 0, final List<Register>? recordList})
      : _recordList = recordList;

  factory _$_SamplePageData.fromJson(Map<String, dynamic> json) =>
      _$$_SamplePageDataFromJson(json);

  @override
  @JsonKey()
  final int number;
  final List<Register>? _recordList;
  @override
  List<Register>? get recordList {
    final value = _recordList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SamplePageData(number: $number, recordList: $recordList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SamplePageData'))
      ..add(DiagnosticsProperty('number', number))
      ..add(DiagnosticsProperty('recordList', recordList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SamplePageData &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality()
                .equals(other._recordList, _recordList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, number, const DeepCollectionEquality().hash(_recordList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SamplePageDataCopyWith<_$_SamplePageData> get copyWith =>
      __$$_SamplePageDataCopyWithImpl<_$_SamplePageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SamplePageDataToJson(
      this,
    );
  }
}

abstract class _SamplePageData implements SamplePageData {
  factory _SamplePageData(
      {final int number, final List<Register>? recordList}) = _$_SamplePageData;

  factory _SamplePageData.fromJson(Map<String, dynamic> json) =
      _$_SamplePageData.fromJson;

  @override
  int get number;
  @override
  List<Register>? get recordList;
  @override
  @JsonKey(ignore: true)
  _$$_SamplePageDataCopyWith<_$_SamplePageData> get copyWith =>
      throw _privateConstructorUsedError;
}
