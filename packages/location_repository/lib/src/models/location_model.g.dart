// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  id: json['id'] as String?,
  name: json['name'] as String,
  address: json['address'] as String,
  city: json['city'] as String,
  country: json['country'] as String,
  postalCode: json['postalCode'] as String,
  locationType: $enumDecode(_$LocationTypeEnumMap, json['locationType']),
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'city': instance.city,
  'country': instance.country,
  'postalCode': instance.postalCode,
  'locationType': _$LocationTypeEnumMap[instance.locationType]!,
};

const _$LocationTypeEnumMap = {
  LocationType.pickup: 'pickup',
  LocationType.dropoff: 'dropoff',
};
