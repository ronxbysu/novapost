// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => Delivery(
  deliveryId: json['deliveryId'] as String,
  token: json['token'] as String,
  qrString: json['qrString'] as String,
  parcels: (json['parcels'] as List<dynamic>)
      .map((e) => Parcel.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String? ?? 'created',
);

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
  'deliveryId': instance.deliveryId,
  'token': instance.token,
  'qrString': instance.qrString,
  'status': instance.status,
  'parcels': instance.parcels,
};
