import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:parcel_repository/parcel_repository.dart' show Parcel;

part 'delivery_model.g.dart';

@JsonSerializable()
class Delivery extends Equatable {
  final String deliveryId;
  final String token;
  final String qrString;
  final String status;

  final List<Parcel> parcels;

  const Delivery({
    required this.deliveryId,
    required this.token,
    required this.qrString,
    required this.parcels,
    this.status = 'created',
  });

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);

  @override
  List<Object?> get props => [deliveryId, token, qrString, status, parcels];
}
