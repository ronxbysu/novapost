import 'package:equatable/equatable.dart';

class Delivery extends Equatable {
  final String deliveryId;
  final String? boxId;
  final String senderEmail;
  final String receiverEmail;
  final String token;
  final String qrString;
  final String status;

  const Delivery({
    required this.deliveryId,
    this.boxId,
    required this.senderEmail,
    required this.receiverEmail,
    required this.token,
    required this.qrString,
    this.status = 'created',
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      deliveryId: json['delivery_id'],
      boxId: json['box_id']?.toString(),
      senderEmail: json['sender_email'] ?? '',
      receiverEmail: json['receiver_email'] ?? '',
      token: json['token'],
      qrString: json['qr_string'],
      status: json['status'] ?? 'created',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'delivery_id': deliveryId,
      'box_id': boxId,
      'sender_email': senderEmail,
      'receiver_email': receiverEmail,
      'token': token,
      'qr_string': qrString,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [deliveryId, boxId, senderEmail, receiverEmail, token, qrString, status];
}