import 'package:freezed_annotation/freezed_annotation.dart';

part 'complain_model.freezed.dart';
part 'complain_model.g.dart';

@freezed
class ComplainModel with _$ComplainModel {
  const factory ComplainModel({
    int? id,
    String? complainType,
    String? complain,
    DateTime? date,
  }) = _ComplainModel;

  factory ComplainModel.fromJson(Map<String, Object?> json) =>
      _$ComplainModelFromJson(json);
}
