// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarModelImpl _$$CarModelImplFromJson(Map<String, dynamic> json) =>
    _$CarModelImpl(
      name: json['name'] as String?,
      color: json['color'] as String?,
      fuelType: json['fuelType'] as String?,
      gearType: json['gearType'] as String?,
      model: json['model'] as String?,
      capacity: json['capacity'] as String?,
      maxPower: json['maxPower'] as String?,
      fuel: json['fuel'] as String?,
      maxSpeed: json['maxSpeed'] as String?,
      speed60Mph: json['speed60Mph'] as String?,
      numberOfSeats: (json['numberOfSeats'] as num?)?.toInt(),
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: json['location'] as String?,
      rate: json['rate'] as String?,
      reviews: json['reviews'] as String?,
    );

Map<String, dynamic> _$$CarModelImplToJson(_$CarModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'fuelType': instance.fuelType,
      'gearType': instance.gearType,
      'model': instance.model,
      'capacity': instance.capacity,
      'maxPower': instance.maxPower,
      'fuel': instance.fuel,
      'maxSpeed': instance.maxSpeed,
      'speed60Mph': instance.speed60Mph,
      'numberOfSeats': instance.numberOfSeats,
      'imageUrls': instance.imageUrls,
      'location': instance.location,
      'rate': instance.rate,
      'reviews': instance.reviews,
    };
