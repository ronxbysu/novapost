import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:profile_repository/src/model/profile_type.dart'
    show ProfileType;

part 'profile_model.g.dart';

@JsonSerializable()
class Profile extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String avatarUrl;
  final String role;
  final ProfileType type;

  const Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.avatarUrl,
    required this.role,
    required this.type,
  });

  Profile copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? location,
    String? avatarUrl,
    String? role,
    ProfileType? type,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
      type: type ?? this.type,
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    location,
    avatarUrl,
    role,
    type,
  ];
}
