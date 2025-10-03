import 'package:equatable/equatable.dart';
import 'package:parcel_repository/parcel_repository.dart' show Parcel;

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

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      deliveryId: json['delivery_id'],
      token: json['token'],
      qrString: json['qr_string'],
      parcels: json['parcels'],
      status: json['status'] ?? 'created',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'delivery_id': deliveryId,
      'token': token,
      'qr_string': qrString,
      'parcels': parcels,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [deliveryId, token, qrString, status, parcels];
}