// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transport_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransportTypeModel _$TransportTypeModelFromJson(Map<String, dynamic> json) {
  return _TransportTypeModel.fromJson(json);
}

/// @nodoc
mixin _$TransportTypeModel {
  String? get label => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportTypeModelCopyWith<TransportTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportTypeModelCopyWith<$Res> {
  factory $TransportTypeModelCopyWith(
          TransportTypeModel value, $Res Function(TransportTypeModel) then) =
      _$TransportTypeModelCopyWithImpl<$Res, TransportTypeModel>;
  @useResult
  $Res call({String? label, String? icon});
}

/// @nodoc
class _$TransportTypeModelCopyWithImpl<$Res, $Val extends TransportTypeModel>
    implements $TransportTypeModelCopyWith<$Res> {
  _$TransportTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransportTypeModelImplCopyWith<$Res>
    implements $TransportTypeModelCopyWith<$Res> {
  factory _$$TransportTypeModelImplCopyWith(_$TransportTypeModelImpl value,
          $Res Function(_$TransportTypeModelImpl) then) =
      __$$TransportTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, String? icon});
}

/// @nodoc
class __$$TransportTypeModelImplCopyWithImpl<$Res>
    extends _$TransportTypeModelCopyWithImpl<$Res, _$TransportTypeModelImpl>
    implements _$$TransportTypeModelImplCopyWith<$Res> {
  __$$TransportTypeModelImplCopyWithImpl(_$TransportTypeModelImpl _value,
      $Res Function(_$TransportTypeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$TransportTypeModelImpl(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransportTypeModelImpl implements _TransportTypeModel {
  const _$TransportTypeModelImpl({this.label, this.icon});

  factory _$TransportTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransportTypeModelImplFromJson(json);

  @override
  final String? label;
  @override
  final String? icon;

  @override
  String toString() {
    return 'TransportTypeModel(label: $label, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransportTypeModelImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransportTypeModelImplCopyWith<_$TransportTypeModelImpl> get copyWith =>
      __$$TransportTypeModelImplCopyWithImpl<_$TransportTypeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransportTypeModelImplToJson(
      this,
    );
  }
}

abstract class _TransportTypeModel implements TransportTypeModel {
  const factory _TransportTypeModel({final String? label, final String? icon}) =
      _$TransportTypeModelImpl;

  factory _TransportTypeModel.fromJson(Map<String, dynamic> json) =
      _$TransportTypeModelImpl.fromJson;

  @override
  String? get label;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$TransportTypeModelImplCopyWith<_$TransportTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
