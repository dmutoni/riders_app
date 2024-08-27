// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complain_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComplainModel _$ComplainModelFromJson(Map<String, dynamic> json) {
  return _ComplainModel.fromJson(json);
}

/// @nodoc
mixin _$ComplainModel {
  int? get id => throw _privateConstructorUsedError;
  String? get complainType => throw _privateConstructorUsedError;
  String? get complain => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplainModelCopyWith<ComplainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplainModelCopyWith<$Res> {
  factory $ComplainModelCopyWith(
          ComplainModel value, $Res Function(ComplainModel) then) =
      _$ComplainModelCopyWithImpl<$Res, ComplainModel>;
  @useResult
  $Res call({int? id, String? complainType, String? complain, DateTime? date});
}

/// @nodoc
class _$ComplainModelCopyWithImpl<$Res, $Val extends ComplainModel>
    implements $ComplainModelCopyWith<$Res> {
  _$ComplainModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? complainType = freezed,
    Object? complain = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      complainType: freezed == complainType
          ? _value.complainType
          : complainType // ignore: cast_nullable_to_non_nullable
              as String?,
      complain: freezed == complain
          ? _value.complain
          : complain // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplainModelImplCopyWith<$Res>
    implements $ComplainModelCopyWith<$Res> {
  factory _$$ComplainModelImplCopyWith(
          _$ComplainModelImpl value, $Res Function(_$ComplainModelImpl) then) =
      __$$ComplainModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? complainType, String? complain, DateTime? date});
}

/// @nodoc
class __$$ComplainModelImplCopyWithImpl<$Res>
    extends _$ComplainModelCopyWithImpl<$Res, _$ComplainModelImpl>
    implements _$$ComplainModelImplCopyWith<$Res> {
  __$$ComplainModelImplCopyWithImpl(
      _$ComplainModelImpl _value, $Res Function(_$ComplainModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? complainType = freezed,
    Object? complain = freezed,
    Object? date = freezed,
  }) {
    return _then(_$ComplainModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      complainType: freezed == complainType
          ? _value.complainType
          : complainType // ignore: cast_nullable_to_non_nullable
              as String?,
      complain: freezed == complain
          ? _value.complain
          : complain // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComplainModelImpl implements _ComplainModel {
  const _$ComplainModelImpl(
      {this.id, this.complainType, this.complain, this.date});

  factory _$ComplainModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplainModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? complainType;
  @override
  final String? complain;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'ComplainModel(id: $id, complainType: $complainType, complain: $complain, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplainModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.complainType, complainType) ||
                other.complainType == complainType) &&
            (identical(other.complain, complain) ||
                other.complain == complain) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, complainType, complain, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplainModelImplCopyWith<_$ComplainModelImpl> get copyWith =>
      __$$ComplainModelImplCopyWithImpl<_$ComplainModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplainModelImplToJson(
      this,
    );
  }
}

abstract class _ComplainModel implements ComplainModel {
  const factory _ComplainModel(
      {final int? id,
      final String? complainType,
      final String? complain,
      final DateTime? date}) = _$ComplainModelImpl;

  factory _ComplainModel.fromJson(Map<String, dynamic> json) =
      _$ComplainModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get complainType;
  @override
  String? get complain;
  @override
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$ComplainModelImplCopyWith<_$ComplainModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
