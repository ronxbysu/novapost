import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:location_repository/src/models/location_type.dart';

part 'location_model.g.dart';

@JsonSerializable()
class Location extends Equatable {
  final String? id;
  final String name;
  final String address;
  final String city;
  final String country;
  final String postalCode;
  final LocationType locationType;

  const Location({
    this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.locationType,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    address,
    city,
    country,
    postalCode,
    locationType,
  ];
}
