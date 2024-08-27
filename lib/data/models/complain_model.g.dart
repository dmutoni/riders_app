// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplainModelImpl _$$ComplainModelImplFromJson(Map<String, dynamic> json) =>
    _$ComplainModelImpl(
      id: (json['id'] as num?)?.toInt(),
      complainType: json['complainType'] as String?,
      complain: json['complain'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ComplainModelImplToJson(_$ComplainModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'complainType': instance.complainType,
      'complain': instance.complain,
      'date': instance.date?.toIso8601String(),
    };
