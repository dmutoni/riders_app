import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';
part 'car_model.g.dart';

@freezed
class CarModel with _$CarModel {
  const factory CarModel({
    String? name,
    String? color,
    String? fuelType,
    String? gearType,
    String? model,
    String? capacity,
    String? maxPower,
    String? fuel,
    String? maxSpeed,
    String? speed60Mph,
    int? numberOfSeats,
    List<String>? imageUrls,
    String? location,
    String? rate,
    String? reviews,
    String? pricePerHours,
    String? tax,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, Object?> json) =>
      _$CarModelFromJson(json);
}
