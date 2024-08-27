import 'package:freezed_annotation/freezed_annotation.dart';

part 'transport_type_model.freezed.dart';
part 'transport_type_model.g.dart';

@freezed
class TransportTypeModel with _$TransportTypeModel {
  const factory TransportTypeModel({
    String? label,
    String? icon,
  }) = _TransportTypeModel;

  factory TransportTypeModel.fromJson(Map<String, Object?> json) =>
      _$TransportTypeModelFromJson(json);
}
