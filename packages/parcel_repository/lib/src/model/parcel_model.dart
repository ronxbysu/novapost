import 'package:equatable/equatable.dart';

class Parcel extends Equatable {
  final String parcelId;
  final String? boxId;
  final String senderEmail;
  final String receiverEmail;
  final String token;
  final String qrString;
  final String status;

  const Parcel({
    required this.parcelId,
    this.boxId,
    required this.senderEmail,
    required this.receiverEmail,
    required this.token,
    required this.qrString,
    this.status = 'created',
  });

  factory Parcel.fromJson(Map<String, dynamic> json) {
    return Parcel(
      parcelId: json['parcel_id'],
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
      'parcel_id': parcelId,
      'box_id': boxId,
      'sender_email': senderEmail,
      'receiver_email': receiverEmail,
      'token': token,
      'qr_string': qrString,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [parcelId, boxId, senderEmail, receiverEmail, token, qrString, status];
}